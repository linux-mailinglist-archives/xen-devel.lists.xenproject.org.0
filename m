Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B0CD21D63
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 01:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203948.1518862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgB56-0003by-SN; Thu, 15 Jan 2026 00:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203948.1518862; Thu, 15 Jan 2026 00:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgB56-0003Z6-Pg; Thu, 15 Jan 2026 00:19:20 +0000
Received: by outflank-mailman (input) for mailman id 1203948;
 Thu, 15 Jan 2026 00:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=by25=7U=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vgB55-0003Z0-Ph
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 00:19:19 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d45eb11e-f1a7-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 01:19:18 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1898E42B6E;
 Thu, 15 Jan 2026 00:19:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F57AC19423;
 Thu, 15 Jan 2026 00:19:14 +0000 (UTC)
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
X-Inumbo-ID: d45eb11e-f1a7-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768436357;
	bh=tUwHMTTcJ8XZ+mPakudFp8PQXy21Q5UU3OtMuyoPqzk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=d674r4+FKqSNdzaO/vJTbenVTVFDGeweaoHw6BRUVGEZraGO9KfArYZjsRxDWoHvV
	 apswTrDG7j5NDz/B3BvA0+X9bkFiV3BS0knRIKE9gMEiEJzK1VQzCiCW5FO/ybHFam
	 Yv2GEQWcEIAOGD0PnY/lCSV13/NzWm497rjgnHcnJLOuZH/4ZbSlzDXxe/Cb0TrXo4
	 uQJwdhK963TopVaimlom05trNSeJh1BzoPWxiYerXzskK6ZHJcNokIKb9r0Q5ckS9K
	 MlPn9jEesHS3/c8jaqDpKWhyzein2pldaKkAGBOhVO3M45R/g9k9JLdecJV3Hbc9PQ
	 diYkKVeTMvP5Q==
Date: Wed, 14 Jan 2026 16:19:12 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v7 2/5] xen: arm: smccc: add INVALID_PARAMETER error
 code
In-Reply-To: <3ab46b8b5ceae264f26ad70ac2266a2ae56d02bc.1768415200.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601141619060.8589@ubuntu-linux-20-04-desktop>
References: <cover.1768415200.git.oleksii_moisieiev@epam.com> <3ab46b8b5ceae264f26ad70ac2266a2ae56d02bc.1768415200.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 14 Jan 2026, Oleksii Moisieiev wrote:
> According to the "7.1 Return Codes" section of DEN0028 [1]
> INVALID_PARAMETER code (-3) is returned when one of the call
> parameters has a non-supported value.
> Adding this error code to the common smccc header file.
> 
> [1]: https://documentation-service.arm.com/static/5f8edaeff86e16515cdbe4c6
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
> 
> 
> 
>  xen/arch/arm/include/asm/smccc.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/include/asm/smccc.h b/xen/arch/arm/include/asm/smccc.h
> index a289c48b7f..dc6af94db1 100644
> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -381,6 +381,7 @@ void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>                         0x3FFF)
>  
>  /* SMCCC error codes */
> +#define ARM_SMCCC_INVALID_PARAMETER     (-3)
>  #define ARM_SMCCC_NOT_REQUIRED          (-2)
>  #define ARM_SMCCC_ERR_UNKNOWN_FUNCTION  (-1)
>  #define ARM_SMCCC_NOT_SUPPORTED         (-1)
> -- 
> 2.34.1
> 

