Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4002F30F457
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 14:58:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81310.150070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7f99-0004Tp-Sr; Thu, 04 Feb 2021 13:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81310.150070; Thu, 04 Feb 2021 13:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7f99-0004TQ-Oz; Thu, 04 Feb 2021 13:58:11 +0000
Received: by outflank-mailman (input) for mailman id 81310;
 Thu, 04 Feb 2021 13:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7f98-0004TK-A8
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 13:58:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3852150-ff7b-4985-ac0a-9ec11e0ba88f;
 Thu, 04 Feb 2021 13:58:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF45CADDC;
 Thu,  4 Feb 2021 13:58:08 +0000 (UTC)
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
X-Inumbo-ID: f3852150-ff7b-4985-ac0a-9ec11e0ba88f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612447088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EkoNk62up44VMUOIH/tbPS/j9zdEfQ8JduNlDUmA1E8=;
	b=iP0Dec40wfdGXjZe6cGjgIGs1XVk2x1l/YiDYsspZu3nn7iUZo95bauUufWuhIFfJBJP7v
	5r3Ff6BY+mSm9funF6WzpFq9ygrqk7/Tnj2Irttc6l+hG0z3f3s8uKP65lDIAslrccgD/6
	SAiwTmWCAMgXeX1tM2y2PNgaNZ5GzgY=
Subject: Re: ld 2.36 regression linking EFI binary from ELF input with debug
 info
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Binutils <binutils@sourceware.org>
References: <79812876-b43d-7729-da34-3b4cd1c31f24@suse.com>
 <875z38vtwr.fsf@igel.home>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64ded848-a5e1-6b99-23cd-8f451e2a8a7a@suse.com>
Date: Thu, 4 Feb 2021 14:58:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <875z38vtwr.fsf@igel.home>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.02.2021 14:34, Andreas Schwab wrote:
> On Feb 04 2021, Jan Beulich via Binutils wrote:
> 
>> For reference, the probing is as simple as
>>
>> $(LD) -mi386pep --subsystem=10 -o efi/check.efi efi/check.o
>>
>> As was to be expected, the errors disappear with -S, but that's
>> an option only for the probing, not for the actual linking of
>> the binary.
>>
>> Thanks for pointers (or better yet, a fix),
> 
> Does it work to link to ELF and use objcopy to convert to PE?

Looks like so, albeit I can't easily tell whether the output would
actually be usable in any way. I also don't think this could be an
option for our build process.

Jan

