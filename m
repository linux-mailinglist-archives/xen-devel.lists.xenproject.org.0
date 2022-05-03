Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA1C518BEC
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 20:08:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319866.540303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwwd-0006wA-P4; Tue, 03 May 2022 18:08:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319866.540303; Tue, 03 May 2022 18:08:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlwwd-0006uJ-M1; Tue, 03 May 2022 18:08:19 +0000
Received: by outflank-mailman (input) for mailman id 319866;
 Tue, 03 May 2022 18:08:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nlwwc-0006u9-33
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 18:08:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlwwb-0000f7-M6; Tue, 03 May 2022 18:08:17 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nlwwb-0007Ge-GN; Tue, 03 May 2022 18:08:17 +0000
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
	bh=CT1uxsqTeygpt1GvGkEWE44P/bWQU55+s2GX7aH/zV0=; b=Y997Caa43h7WV8qeqBrHvrzUdj
	tVsWK4cx5BAXPXPsBvxKtS0rm5ax1F35q5YZUenp3S50KwrWrLT4eBbDd7g4yt9XeN5gRMNMRePh8
	Gj+QgnwM11iMb7lUgUQ1q3QxTkYBiggXVnuonflGmELnKHFJMHrtzXrc27jOIAteXziw=;
Message-ID: <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
Date: Tue, 3 May 2022 19:08:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 03/05/2022 10:38, Bertrand Marquis wrote:
> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
> of 5.18-rc3 version (linux commit b2d229d4ddb1).
> Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
> sanitization of ISAR2 registers.
Please outline which specific commits you are actually backported. This 
would help to know what changed, why and also keep track of the autorships.

When possible, the changes should be separated to match each Linux 
commit we backport.

> Complete AA64ISAR2 and AA64MMFR1 with more fields.
> While there add a comment for MMFR bitfields as for other registers in
> the cpuinfo structure definition.

AFAICT, this patch is doing 3 different things that are somewhat related:
   - Sync cpufeature.c
   - Update the headers with unused defines
   - Complete the structure cpufeature.h

All those changes seem to be independent, so I think they should be done 
separately. This would help to keep the authorship right (your code vs 
Linux code).

> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/arm64/cpufeature.c          | 18 +++++-
>   xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>   xen/arch/arm/include/asm/cpufeature.h    | 14 ++++-
>   3 files changed, 91 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufeature.c
> index 6e5d30dc7b..d9039d37b2 100644
> --- a/xen/arch/arm/arm64/cpufeature.c
> +++ b/xen/arch/arm/arm64/cpufeature.c
> @@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
>   	ARM64_FTR_END,
>   };
>   
> +static const struct arm64_ftr_bits ftr_id_aa64isar2[] = {
> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2_CLEARBHB_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
> +		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
So we are using CONFIG_ARM64_PTR_AUTH. But this is not defined in 
Kconfig. I realize there are more in cpufeature.c (somehow I didn't spot 
during preview), but I don't think this is right to define CONFIG_* 
without an associated entry in Kconfig.

In one hand, I think it would be odd to add an entry in Kconfig because 
Xen wouldn't properly work if selected. On the other hand, it is useful 
if when we will implement pointer authentification.

So maybe we should just add the Kconfig entry with a comment explaning 
why they are not selected. Any thoughts?

Cheers,

-- 
Julien Grall

