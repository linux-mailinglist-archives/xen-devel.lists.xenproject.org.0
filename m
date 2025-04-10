Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CB5A84690
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 16:40:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945809.1343923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2t4Y-0000Pp-JI; Thu, 10 Apr 2025 14:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945809.1343923; Thu, 10 Apr 2025 14:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2t4Y-0000N1-Ft; Thu, 10 Apr 2025 14:40:06 +0000
Received: by outflank-mailman (input) for mailman id 945809;
 Thu, 10 Apr 2025 14:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HBao=W4=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u2t4W-00008e-Ts
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 14:40:04 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acb3aad9-1619-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 16:39:59 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744295991582414.3715086638133;
 Thu, 10 Apr 2025 07:39:51 -0700 (PDT)
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
X-Inumbo-ID: acb3aad9-1619-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1744295995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NMjP3rkufgynvpZUbJzCIdtfuo/imKAT5E8tNC9u7Lkjk4fh9r3UwMpRgD8aagB4gKx2MJwtF1kbAnqjRLSZKXfrqKxanFMNUO10Ai6Rc2tQO33huwmvaZRO63+1Ch++Q+lq/5sQfPYdD9iNdaz4dygTuNT6YIU3jgti/Kb0wVA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744295995; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5i6ZFNs8a3Tv/IjM9WDLbZHH5zlDLh4uruTrAMJE62k=; 
	b=RsJvrVaZ1NTfphr4zqkudxIXQ+vichrRdRls8N/RnEpYp1VK+RyPdjigFTFSLeumyl51DVMOb2L3gNJrjMv6plckFk8cyWrZDrrUxktZ+4NuSy09ultgR0/pNENqHTIUiKQQsQHT2GTWj2H3cvl7JzDS9NPCuNeL7Pie18Q36m8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744295995;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5i6ZFNs8a3Tv/IjM9WDLbZHH5zlDLh4uruTrAMJE62k=;
	b=W07tV1ZzOb5H4YbwoXLKrb58eyM+SSP0ETH3Ek3SmYb1Lh1EiBTpWhhiprVdQ+Y9
	oJiUIdjbX/TvPQv1JlA0oYTwZ9RqkBh1Ule/5Qwj28hwmkGEIqvLw88UsNacCDA5XbU
	1GV4ygXpS1TA2MgkvjV5KSTmBNKR9Z7xUuh0TFi4=
Message-ID: <acb31eec-38ef-4e35-be71-9a6579a46159@apertussolutions.com>
Date: Thu, 10 Apr 2025 10:39:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/EFI: sanitize DLL characteristics in binary
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <90354241-4ebb-4d52-809c-0af788d2b860@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/2/25 04:51, Jan Beulich wrote:
> In GNU ld --disable-reloc-section implies --disable-dynamicbase (and
> also --disable-high-entropy-va, just fyi). Therefore to yield
> functionally identical binaries independent of whether mkreloc needs to
> come into play, add --dynamicbase as well.
> 
> GNU ld further defaults to --high-entropy-va (along with --dynamicbase
> and --nxcompat) unless "Cygwin-like". This seems wrong to me; that
> default should be dependent upon "MinGW-like" instead; for the purpose
> of building EFI binaries with a PE32+-capable ELF linker neither
> "Cygwin-like" nor "MinGW-like" ought to be true. We certainly don't mean
> to have this bit set in the DLL characteristics, so suppress its
> setting.
> 
> Sadly while --high-entropy-va is supported by GNU ld 2.25,
> --disable-high-entropy-va was introduced only in 2.36. Luckily the
> defaulting to --high-entropy-va was also only introduced in 2.36. Plus
> --disable-reloc-section was introduced precisely there, too. Hence
> leverage the probing we do as to base relocation generation, to also
> determine whether to pass --disable-high-entropy-va.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I remain uncertain about the applicability of DLL characteristics to
> non-DLLs, i.e. images without IMAGE_FILE_DLL set; current MS doc says
> nothing either way. Yet producing consistent binaries still seems
> desirable, even if the field wasn't to be used by loaders.
> 
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -113,6 +113,7 @@ efi-nr-fixups := $(shell LC_ALL=C $(OBJD
>   
>   ifeq ($(efi-nr-fixups),2)
>   MKRELOC := :
> +EFI_LDFLAGS += --disable-high-entropy-va
>   else
>   MKRELOC := arch/x86/efi/mkreloc
>   # If the linker produced fixups but not precisely two of them, we need to
> @@ -123,6 +124,8 @@ EFI_LDFLAGS += --disable-reloc-section
>   endif
>   endif
>   
> +EFI_LDFLAGS += --dynamicbase
> +
>   endif # $(XEN_BUILD_PE)
>   
>   export XEN_BUILD_EFI XEN_BUILD_PE

Seems straightforward, will rely on your knowledge of binutils that 
there are no unattended effects from the flags.

Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>

