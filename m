Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E527C234
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 12:18:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10.45 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNChi-0001zp-OP; Tue, 29 Sep 2020 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10.45; Tue, 29 Sep 2020 10:17:50 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNChi-0001zQ-Kb; Tue, 29 Sep 2020 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 10;
 Tue, 29 Sep 2020 10:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kNChg-0001zI-J8
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:17:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2ce169b-ad89-483f-bd7e-df00d146d29e;
 Tue, 29 Sep 2020 10:17:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2B4FAD12;
 Tue, 29 Sep 2020 10:17:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6Xo+=DG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kNChg-0001zI-J8
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 10:17:48 +0000
X-Inumbo-ID: f2ce169b-ad89-483f-bd7e-df00d146d29e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f2ce169b-ad89-483f-bd7e-df00d146d29e;
	Tue, 29 Sep 2020 10:17:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601374667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N0I8Fe8q/UQ7yywgTvxt0gOuGP1BqaOt9vnOF7NQbuI=;
	b=HZI9rAQ5gHeetrg+A0eQpGKA/Z9Fuo5TX8t8CvmWuUV/DtcvFdg8LbpejtRylL0QiMYGfC
	aSAdjstYkxryK/AFMe2zbmn93QOfcTBBQrh2L1702syoWGohV0Rd0grIKeKtxFWRkIFI1G
	o0cVOO6SS4e1UwzyO+22Ati0a8R7dOE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F2B4FAD12;
	Tue, 29 Sep 2020 10:17:46 +0000 (UTC)
Subject: Re: [PATCH v6 2/5] efi/boot.c: add file.need_to_free
To: Trammell Hudson <hudson@trmm.net>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200921115113.1278655-1-hudson@trmm.net>
 <20200921115113.1278655-3-hudson@trmm.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b0ab3d15-39e2-9543-d8c1-967e7af66908@suse.com>
Date: Tue, 29 Sep 2020 12:17:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921115113.1278655-3-hudson@trmm.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.09.2020 13:51, Trammell Hudson wrote:
> The config file, kernel, initrd, etc should only be freed if they
> are allocated with the UEFI allocator.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Strictly speaking with the changes done from v5 to v6 this tag
would have needed dropping. I guess Roger is fine with it being
kept, though.

> @@ -280,13 +281,13 @@ void __init noreturn blexit(const CHAR16 *str)
>      if ( !efi_bs )
>          efi_arch_halt();
>  
> -    if ( cfg.addr )
> +    if ( cfg.need_to_free )
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
> -    if ( kernel.addr )
> +    if ( kernel.need_to_free )
>          efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
> -    if ( ramdisk.addr )
> +    if ( ramdisk.need_to_free )
>          efi_bs->FreePages(ramdisk.addr, PFN_UP(ramdisk.size));
> -    if ( xsm.addr )
> +    if ( xsm.need_to_free )
>          efi_bs->FreePages(xsm.addr, PFN_UP(xsm.size));
>  
>      efi_arch_blexit();

Doesn't this need similar changes in both efi_arch_blexit()?

Jan

