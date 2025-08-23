Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89105B325DC
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 02:33:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090764.1447870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcC6-0007j2-FO; Sat, 23 Aug 2025 00:33:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090764.1447870; Sat, 23 Aug 2025 00:33:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upcC6-0007hZ-Cn; Sat, 23 Aug 2025 00:33:18 +0000
Received: by outflank-mailman (input) for mailman id 1090764;
 Sat, 23 Aug 2025 00:33:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MmA+=3D=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1upcC4-0007hT-TT
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 00:33:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c133e1b5-7fb8-11f0-a32b-13f23c93f187;
 Sat, 23 Aug 2025 02:33:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 958714505E;
 Sat, 23 Aug 2025 00:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4693C116B1;
 Sat, 23 Aug 2025 00:33:11 +0000 (UTC)
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
X-Inumbo-ID: c133e1b5-7fb8-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755909193;
	bh=Et7pM4ONrIna1yXquXcmW2exth2Ygi8i25y+inXVp3E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FdmBjXhYBTWJQwn4QlSsgZorLLJ3An+gdMSNCmuMx+paP9HFPKH2BgLTy/V699qAk
	 JO+rdpqrrWDdNZIE18FELT9lbaOr1ROVTwxsFZ9SCaIijBtTRzjt5zSfqul5BAF8vq
	 cFYZ+oWptpnFSQ99Lb1X3Yy6F6VDicLZWlDlxPGmKWfivek7nJSzGTeUiPWOO1U2sm
	 WEMjzysercLt9B3zSQnIi6fXzT4/ALmMq3JDWZKRV5FMcaN+BNmnlAz/sGfsXGS8/H
	 rwy6CcDhLiizA/7p3vX8TEzw6yXTcH85hGv/W1Phg+yu7tUnCe/EaKdU0s4b01DhJk
	 oVaEoVaXTGsMQ==
Date: Fri, 22 Aug 2025 17:33:10 -0700 (PDT)
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
Subject: Re: [RFC PATCH v5 07/10] xen: arm: smccc: add INVALID_PARAMETER
 error code
In-Reply-To: <f763b85857c7b97c427c1bb4f80e66b45eebbac3.1753184487.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508221733030.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com> <f763b85857c7b97c427c1bb4f80e66b45eebbac3.1753184487.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 22 Jul 2025, Oleksii Moisieiev wrote:
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

