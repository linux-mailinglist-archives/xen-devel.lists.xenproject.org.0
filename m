Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA17CA91016
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 02:20:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956855.1350118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cz5-0006v3-26; Thu, 17 Apr 2025 00:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956855.1350118; Thu, 17 Apr 2025 00:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Cz4-0006ro-V3; Thu, 17 Apr 2025 00:20:02 +0000
Received: by outflank-mailman (input) for mailman id 956855;
 Thu, 17 Apr 2025 00:20:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F/Gg=XD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u5Cz3-0006dH-Va
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 00:20:01 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3062776-1b21-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 02:20:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2BADA68429;
 Thu, 17 Apr 2025 00:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C83C4CEEE;
 Thu, 17 Apr 2025 00:19:57 +0000 (UTC)
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
X-Inumbo-ID: b3062776-1b21-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849199;
	bh=0TKDp/5pNgIOCC2JWoez0FbriVmlqQ2VoZXny+nWDyo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K0q2LRZCC0PbqyNYN8BI/LwynZPX8UBhXbK18YsGRgSlg5A3+YNqVuW0e9vqaLEH7
	 o5gdyqJRGgEZb4znUoacXV5YkdKmgfLEav8oGf04yymJ6s8TBe9K031g/8RGOPUCBI
	 bNsUy1/C2gaEbR88CdkZPuRClv0p3+ugzi37ON0eQ3lSpkKmDzz4UF81Wa2U0ISIXN
	 VzCYJFRxjmYqS+h0NR+teEpWD1D3hlAzxBoG5Ke5/MzspaoSxgV3IKIFtxnrmBtBOb
	 9RxhC9bp+gfXNc30ksNrgtMl6JbMiFlti3JZMWOxxXl3B8Q98sYbscOfmXfCvIScY3
	 MRAqfh1MAPz4Q==
Date: Wed, 16 Apr 2025 17:19:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Shawn Anastasio <sanastasio@raptorengineering.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
    Lin Liu <lin.liu@citrix.com>, rahul.singh@arm.com
Subject: Re: [PATCH v6 02/15] drivers/smmu-v3: Fix impending MISRA R20.6
 violation
In-Reply-To: <20250416115900.2491661-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2504161719340.8008@ubuntu-linux-20-04-desktop>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com> <20250416115900.2491661-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1510834496-1744849199=:8008"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1510834496-1744849199=:8008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

+ Rahul

On Wed, 16 Apr 2025, Andrew Cooper wrote:
> cpu_to_le64() is about to become a macro, at which point the #ifdef in the
> middle of it becomes undefined behaviour.
> 
> Use a logcal variable to prepare strtab, where the #ifdef is fine to use.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Lin Liu <lin.liu@citrix.com>
> 
> v6:
>  * New
> 
> Eclair log from v5:
>   https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/andyhhp/xen/ECLAIR_normal/xen-bswap/ARM64/9556392204/PROJECT.ecd;/by_service/MC3A2.R20.6.html
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index cee572402203..df162350578c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -722,15 +722,17 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>  	}
>  
>  	if (s2_cfg) {
> -		BUG_ON(ste_live);
> -		dst[2] = cpu_to_le64(
> +		u64 strtab =
>  			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>  			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
>  #ifdef __BIG_ENDIAN
>  			 STRTAB_STE_2_S2ENDI |
>  #endif
>  			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
> -			 STRTAB_STE_2_S2R);
> +			 STRTAB_STE_2_S2R;
> +
> +		BUG_ON(ste_live);
> +		dst[2] = cpu_to_le64(strtab);
>  
>  		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
>  
> -- 
> 2.39.5
> 
--8323329-1510834496-1744849199=:8008--

