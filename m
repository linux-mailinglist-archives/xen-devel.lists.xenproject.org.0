Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BA595930
	for <lists+xen-devel@lfdr.de>; Tue, 16 Aug 2022 13:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.388225.624835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNuKP-0004MA-48; Tue, 16 Aug 2022 11:01:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 388225.624835; Tue, 16 Aug 2022 11:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNuKP-0004KN-0m; Tue, 16 Aug 2022 11:01:45 +0000
Received: by outflank-mailman (input) for mailman id 388225;
 Tue, 16 Aug 2022 11:01:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oNuKN-0004KH-Ty
 for xen-devel@lists.xenproject.org; Tue, 16 Aug 2022 11:01:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNuKN-00046d-CE; Tue, 16 Aug 2022 11:01:43 +0000
Received: from [54.239.6.189] (helo=[192.168.28.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oNuKN-0007Fo-1s; Tue, 16 Aug 2022 11:01:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=eSXTnMA3qTGDZH23XnElnv8fx1OonSQ5V+RRjENalko=; b=3jlmPMAZBylz+as+h2VCheAwt/
	Z+AaW7AybowLnAXngMhzQ+Pr5p5sp3glZiNkEYvhLEPRa58jeBw0ygMDAynjPwKIVsdbh5NTh1v7F
	Gzj1cElyBgpfoU/WYKKhn5EISE87kK0PmRTzbvT8m89lYMa0quOryb2yWpRz8NciyYWA=;
Message-ID: <741163de-607f-dbfd-e9f8-ef3072a16de6@xen.org>
Date: Tue, 16 Aug 2022 12:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [XEN PATCH] build: Fix x86 build without EFI
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Wei Chen <wei.chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220816103043.32662-1-anthony.perard@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220816103043.32662-1-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 16/08/2022 11:30, Anthony PERARD wrote:
> We can't have a source file with the same name that exist in both the
> common code and in the arch specific code for efi/. This can lead to
> comfusion in make and it can pick up the wrong source file. This issue

Typo: s/comfusion/confusion/

> lead to a failure to build a pv-shim for x86 out-of-tree, as this is
> one example of an x86 build using the efi/stub.c.
> 
> The issue is that in out-of-tree, make might find x86/efi/stub.c via
> VPATH, but as the target needs to be rebuilt due to FORCE, make
> actually avoid changing the source tree and rebuilt the target with
> VPATH ignored, so $@ lead to the build tree where "stub.c" dosen't
> exist yet so a link is made to "common/stub.c".
> 
> Rework the new common/stub.c file to have a different name than the
> already existing one. And build both *stub.c as two different objects.
> This mean we have to move some efi_compat_* aliases which are probably
> useless for Arm.
> 
> Avoid using $(EFIOBJ-y) as an alias for $(clean-files), add
> common_stub.c directly to $(clean-files).
> 
> Fixes: 7f96859b0d00 ("xen: reuse x86 EFI stub functions for Arm")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
> 
> For the cflag addition in non-ARM_EFI, I was tempted to apply it to
> the whole directory instead of just stub.o. (Even if there's only a
> single object). I think that would be enough to overwrite the
> -fshort-wchar from efi-common.mk, but I forgot what cflags come after
> that. But adding it to just one object mean that it's added at the
> last possible moment.
> ---
>   xen/arch/arm/efi/Makefile                | 8 ++------
>   xen/arch/x86/efi/Makefile                | 2 +-
>   xen/common/efi/efi-common.mk             | 4 ++--
>   xen/arch/x86/efi/stub.c                  | 7 -------
>   xen/common/efi/{stub.c => common_stub.c} | 6 ++++++

I haven't looked at the rest of the patch. However, I think you also 
want to update .gitignore to excluse arch/*/efi/common_stub.c.

Also, I am thinking to drop my patch [1] which update .gitignore as this 
will become moot with this change. Let me know what you think.

Cheers,

[1] 20220812191930.34494-1-julien@xen.org

-- 
Julien Grall

