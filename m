Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3CD315440
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 17:48:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83333.154792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WBV-00086i-C4; Tue, 09 Feb 2021 16:48:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83333.154792; Tue, 09 Feb 2021 16:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9WBV-00086I-8G; Tue, 09 Feb 2021 16:48:17 +0000
Received: by outflank-mailman (input) for mailman id 83333;
 Tue, 09 Feb 2021 16:48:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BG3/=HL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9WBS-00085v-SK
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 16:48:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc212742-5759-4fb4-9e3b-780b88eb1f97;
 Tue, 09 Feb 2021 16:48:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D8843AC97;
 Tue,  9 Feb 2021 16:48:12 +0000 (UTC)
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
X-Inumbo-ID: fc212742-5759-4fb4-9e3b-780b88eb1f97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612889293; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=me0NiE9awRubwK9ZwvvpuVHPIAggzHLa7Z9SrtLp+tM=;
	b=jXa+/pG1zIfgx5JbJH6Hbfi/n7JMcrU2vb8OGHNYNGzI/dXyO8ZD5Pp09KcPAHNw3xGmWF
	KQWuWiUAGBTI1vT/v9z+lWfVlDip4VWkdbPPu+4W24MYqM7Rdn+u7ZI+aXrsP+o/aKr1A0
	LO9MQKWNlaJr6j+9ONVkMwoVO/9kw0o=
Subject: Re: [PATCH for-4.15] x86/ucode: Fix microcode payload size for Fam19
 processors
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210209153336.4016-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c09110f7-6459-e1f7-2175-09d535ad03ce@suse.com>
Date: Tue, 9 Feb 2021 17:48:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210209153336.4016-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.02.2021 16:33, Andrew Cooper wrote:
> The original limit provided wasn't accurate.  Blobs are in fact rather larger.
> 
> Fixes: fe36a173d1 ("x86/amd: Initial support for Fam19h processors")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -111,7 +111,7 @@ static bool verify_patch_size(uint32_t patch_size)
>  #define F15H_MPB_MAX_SIZE 4096
>  #define F16H_MPB_MAX_SIZE 3458
>  #define F17H_MPB_MAX_SIZE 3200
> -#define F19H_MPB_MAX_SIZE 4800
> +#define F19H_MPB_MAX_SIZE 5568

How certain is it that there's not going to be another increase?
And in comparison, how bad would it be if we pulled this upper
limit to something that's at least slightly less of an "odd"
number, e.g. 0x1800, and thus provide some headroom?

Jan

