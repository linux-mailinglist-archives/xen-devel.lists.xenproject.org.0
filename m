Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03087AAC2FA
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 13:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977094.1364166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGik-0005OH-F4; Tue, 06 May 2025 11:44:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977094.1364166; Tue, 06 May 2025 11:44:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGik-0005LY-Bq; Tue, 06 May 2025 11:44:22 +0000
Received: by outflank-mailman (input) for mailman id 977094;
 Tue, 06 May 2025 11:44:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uCGii-0005LQ-Uo
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 11:44:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCGii-00Cel4-1J;
 Tue, 06 May 2025 11:44:20 +0000
Received: from [2a02:8012:3a1:0:7157:32ca:2aea:33a3]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uCGii-00HKtH-0a;
 Tue, 06 May 2025 11:44:20 +0000
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
	bh=D3rPs2AkxDjMQf7Y9znqArR1fSXVuekCPjEXbZee/1U=; b=In5Qey0A/ex62MOGgH93hjTJzf
	M1DLbNdD5TDCWs/3JNhMfBgpgwgC736I/NLwXNumeMTA2FCz30JALkY8bZI4KHRQDf7GRT3AmIycU
	5BbdDsM/QZM/8o936YINM+46nupiTfO7U8pSGYLRdz2ogIpY4m2yGHEXr0A6whkWDId8=;
Message-ID: <a96a2e51-7b00-45a3-9f75-0a062c8defd8@xen.org>
Date: Tue, 6 May 2025 12:44:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] docs/arm: Document Xen booting protocol on Armv8-R
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250429152057.2380536-1-luca.fancellu@arm.com>
 <20250429152057.2380536-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250429152057.2380536-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/2025 16:20, Luca Fancellu wrote:
> Document the requirement needed to boot Xen on Armv8-R platforms.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v4 changes:
>   - New patch
> ---
>   docs/misc/arm/booting.txt | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..719af74f1e69 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>   
>   * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>   
> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
> +available state is secure (S) on Arm64 and non secure (NS) on Arm32, hence the
> +above requirements need to be adjusted to this case:
 > +> +* Xen must be entered in S EL2 mode on Arm64 and in NS EL2 mode 
on Arm32.

I think it would be better to update the line "Xen must be entered in NS 
EL2 mode" to clarify the state for 64-bit Arm.

 > +> +* Xen must be entered with MPU off and data cache disabled 
(SCTLR_EL2.M bit and
> +  SCTLR_EL2.C set to 0).

This line is valid for Armv8-A/Armv7-A when using the Image/zImage protocol.

>   
>   [1] linux/Documentation/arm/booting.rst
>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst

-- 
Julien Grall


