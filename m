Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3160A30F095
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 11:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81218.149662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7br6-0004oH-Cb; Thu, 04 Feb 2021 10:27:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81218.149662; Thu, 04 Feb 2021 10:27:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7br6-0004ns-95; Thu, 04 Feb 2021 10:27:20 +0000
Received: by outflank-mailman (input) for mailman id 81218;
 Thu, 04 Feb 2021 10:27:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7br5-0004nn-96
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 10:27:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 619e66bb-6f5e-4106-8376-87df1e02c419;
 Thu, 04 Feb 2021 10:27:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 958CEB004;
 Thu,  4 Feb 2021 10:27:17 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 619e66bb-6f5e-4106-8376-87df1e02c419
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612434437; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2n8gHNPwG5zcCg9PIdihShOKQKHea/CUUAp8rD6wmKQ=;
	b=iRqdKLNui4AxGVDNMvqZSzVag2Dr3fiPMY715VsECtH8O/FFk6ACztnDpFb7d4FMnmgohT
	Uuac7LeN1EVi5W5RVGYMGzlD79mLojYdyH19tL5M5s8eOINB388+jbN6idExUwOVxwJlXZ
	CW3tyMEbRLfmGi2swtlhoYFV+GcXP/U=
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210203175805.86465-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9d5f126-0b7c-6a8b-7ce9-736716e6e950@suse.com>
Date: Thu, 4 Feb 2021 11:27:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203175805.86465-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.02.2021 18:58, Roger Pau Monne wrote:
> --- a/xen/include/asm-x86/x86_64/efibind.h
> +++ b/xen/include/asm-x86/x86_64/efibind.h
> @@ -172,7 +172,7 @@ typedef uint64_t   UINTN;
>  #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
>      #ifdef _MSC_EXTENSIONS
>          #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler
> -    #elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
> +    #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
>          #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
>      #else
>          #define EFIAPI          // Substitute expresion to force C calling convention
> 

So the problem is that some capable Clang versions set too low
a __GNUC_MINOR__ (I'm observing 2 alongside __GNUC__ being 4
on Clang5). The way the description and change are written
made me rather imply __GNUC__ to not be available at all,
which I then thought can't be the case because iirc we use it
elsewhere.

Jan

