Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB94C19B7A4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 23:32:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJkuz-0007Ji-VA; Wed, 01 Apr 2020 21:29:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJkuy-0007Jd-NV
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 21:29:00 +0000
X-Inumbo-ID: cd05a3ba-745f-11ea-bb44-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd05a3ba-745f-11ea-bb44-12813bfff9fa;
 Wed, 01 Apr 2020 21:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4kvSBwT4vFIojH8OGTbxZSiguaGsCw+BLZIU40Je74=; b=68xesolY0BS1wDlqGTh5A5YWHr
 Kxq0qrsEJ9Ho/k7QYQG6Y0kdoNnPG+vSKT75Xth1nQZ0nP9AN5SHCWW5cJqv/ZQK3Pn0uBLDJDWZ7
 IXKh9Iu++QCtvf+azzHXUGuxr8Dvtg+JHB/LTzJ/Vn59NgWfQpFJqqeQbh91/OnuB6no=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkuw-0004kY-Si; Wed, 01 Apr 2020 21:28:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJkuw-0006Mk-Lx; Wed, 01 Apr 2020 21:28:58 +0000
Subject: Re: [PATCH] guestcopy: evaluate {,__}copy{,_field}_to_guest*()
 arguments just once
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9918b339-e914-7228-5f8e-86c82090b5bd@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b07fcc5a-60c1-a831-b4b1-a6de3f82b8b4@xen.org>
Date: Wed, 1 Apr 2020 22:28:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9918b339-e914-7228-5f8e-86c82090b5bd@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 01/04/2020 15:29, Jan Beulich wrote:
> There's nothing wrong with having e.g.
> 
>      copy_to_guest(uarg, ptr++, 1);
> 
> yet until now this would increment "ptr" twice.

Is there such use in Xen today? I guess not as we would have noticed any 
issue.

> Also drop a pair of unneeded parentheses from every instance at this
> occasion.
> 
> Fixes: b7954cc59831 ("Enhance guest memory accessor macros so that source operands can be")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Arm side untested so far, as I don't have all the tool chain pieces
> available at home.

I will have a look.

> ---
> This goes on top of the assumed v2 of Julien's "xen/guest_access: Harden
> copy_to_guest_offset to prevent const dest operand".
> 
> --- a/xen/include/asm-arm/guest_access.h
> +++ b/xen/include/asm-arm/guest_access.h
> @@ -79,7 +79,7 @@ int access_guest_memory_by_ipa(struct do
>       const typeof(*(ptr)) *_s = (ptr);                   \
>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>       void *__maybe_unused _t = (hnd).p;                  \
> -    ((void)((hnd).p == (ptr)));                         \
> +    (void)((hnd).p == _s);                              \

May I ask why this is a problem with 'ptr' but not 'hnd'? Wouldn't it 
theorically possible to have an array of handle?

Cheers,

-- 
Julien Grall

