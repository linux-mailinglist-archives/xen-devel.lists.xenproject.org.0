Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33906A90960
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 18:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956477.1349884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55z3-0007Wx-07; Wed, 16 Apr 2025 16:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956477.1349884; Wed, 16 Apr 2025 16:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u55z2-0007UN-Tf; Wed, 16 Apr 2025 16:51:32 +0000
Received: by outflank-mailman (input) for mailman id 956477;
 Wed, 16 Apr 2025 16:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxVN=XC=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1u55z1-0006VW-Bi
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 16:51:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ae7b7c7-1ae3-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 18:51:29 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 2D60B4EE3C76;
 Wed, 16 Apr 2025 18:51:28 +0200 (CEST)
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
X-Inumbo-ID: 0ae7b7c7-1ae3-11f0-9ffb-bf95429c2676
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1744822288;
	b=VKl6OhSBeeNm6jlKjTgKeANX6vctSJDuelbYP4urOmkrd4KW+5oKDmtoBLwPagvxd7q5
	 zO/gbE6VOsW+vs+CXUnCZpGu1bDb7Fnim4pNFA3qiVxWxnBOGpTJRhg0+VuiQiwlivRZ7
	 UhcgrdAX3F8j4acpbsFtAoFsDqYv/jHrAW1jWIixlEKzxhMv/2OIxExED+R4JeDI1aseN
	 9hiGUdaeQTFi3pw2UgdOg1i3N61Zn6tqNYCt3+jIAu6+zNtJ80/wZj7fI4X0LFDgDSB1K
	 hRauwusvZYdWCMXV+fZaFt9RN5OzEQrDrgfNpGGQyXgXg4m1us6HRBRPN486M34IKoUsZ
	 5C7cVmYXNmfKm+ewRpr3rq/fgad/iRvh+SjJy/jSUFwzj3ZoDfBK2o3ziVXJgk3bQ03B2
	 F3Fit5stIkxYpHgvWXUkVUGNKNPg3oh3B6LARoxLJRitpgcyHUK1Jd2RCbT86P8nIbbp0
	 TgSTqZxmO2DceXVsMnw2B4vMv5brV+/nEuTONcPUz2mVFa0KJYDbQR8atfl/ZMJ1d84Bo
	 R0JYPk7eq2I8LcPJ/sPR5a9dLdnPM1oYvwGyJO2lIsJ5QWmHh5zD1/1RmCQzKb5MI+pB9
	 b57GXIMhUUmnX1SzQ3rv6TrIPyikmD1gre/tZy5LA5Xq+i9r3pxDHYrlu8SgUNc=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1744822288;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=oGdLWcrEEbJpDTyFe9rk6sIAUrih6/jLp68wkchrIiA=;
	b=YrwPPv5LS/2WO81YzTk5VKmkTC/lAdIGlNKUrxKvBg8FTT7FkJz0hSqYcAdvIM/+QI9+
	 u12R7Hj6gm7Cp4UiQ5LVMyumYA+b4y9q2miMoywbO6f+HXl2/3toMPOa1DruFXAvwE1sJ
	 Jtm2STaeLKhzRSTQ6aj0N3G25fNSqHdal3kBNwOCelkPOX90mW9tDpUmlleJAyHd2rl+N
	 7HNSTkEDsXoaz8hq4GK7Dms7hpDOAC0DgulBVbxVNaFYXBwvH6Mzd1aRYYS/tHsxTEIG9
	 04UTQx8GA2I89P9URBE+XWest+cqVx9ALrixfhOOTPm9opoEUSuaKyGd2WXlBBM2eaW7y
	 +Uq3G7+40lDHxewIT3xjfrJor9gFjIAjUmY28ducibm488yAq2nNvIStNJqo+0RwQEpCg
	 ZnDCHmq9fkY8S2bZeWRBaazQv1F5nIKwnsJlhcI1xCACmjvVcFQS0L6Nb1mIrrk+JkgjJ
	 twoV70cyGzrF590sY4W6ebzf6CB1m3cJTHpmGzughousV9H7R0Ua/eagqPq1ClahNZDOH
	 T0fPU0d4Ao/lAsd6x3wzBM6GEGQG/GCgyDd3N7VbHyGpquqUh/qgJAnxEmU3ujj4Cj9NG
	 T1nweZz4udr9RkRAe5qxobK3fFncHcaaszOqDDAIMuY4bfEkJqz3Qv24C34O7Zk=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1744822288; bh=pFLbwldL+JkaPh/Hv/cjO1CYlxk4c0h3BQ95nRoDOas=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=siUKBDpa6HpL5ywTN4U4ajGRyniqKDCJCUJlpkG+I50uL9REI0HOwrN3luALSG1Fb
	 zUTrASR5mA5T4S6ot+pb5jFdihb6bFGRAP8xvx1kYbXCad3wlMwMhu864aeSLy00QL
	 BnL1RsCQlPx9QQe+sHskNOCIjPKyKYKP3F/eCCCZsL1Wfi/gUogsNuNRrpl/6/Iyjh
	 ZdQ3L7za7gk8NxoUqeOO8xW3Tfo1UbcStSp8oLEwMuYbIwsQwp4/f5cg77wM6FUEsG
	 LSbI4dghQsYsfXb572067wIhD16gPz692leZJF0GLdFakZhn1HxQgcTVs1x3fIPIgL
	 8JC4Qu4j21LRw==
MIME-Version: 1.0
Date: Wed, 16 Apr 2025 18:51:28 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, "Daniel P . Smith"
 <dpsmith@apertussolutions.com>, Lin Liu <lin.liu@citrix.com>
Subject: Re: [PATCH v6 02/15] drivers/smmu-v3: Fix impending MISRA R20.6
 violation
In-Reply-To: <20250416115900.2491661-3-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
 <20250416115900.2491661-3-andrew.cooper3@citrix.com>
Message-ID: <a2a8c428e705cbc408aafc96f2d3ed3e@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-04-16 13:58, Andrew Cooper wrote:
> cpu_to_le64() is about to become a macro, at which point the #ifdef in 
> the
> middle of it becomes undefined behaviour.
> 
> Use a logcal variable to prepare strtab, where the #ifdef is fine to 
> use.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

for MISRA:

Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
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
>   
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/andyhhp/xen/ECLAIR_normal/xen-bswap/ARM64/9556392204/PROJECT.ecd;/by_service/MC3A2.R20.6.html
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c 
> b/xen/drivers/passthrough/arm/smmu-v3.c
> index cee572402203..df162350578c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -722,15 +722,17 @@ static void arm_smmu_write_strtab_ent(struct 
> arm_smmu_master *master, u32 sid,
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

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

