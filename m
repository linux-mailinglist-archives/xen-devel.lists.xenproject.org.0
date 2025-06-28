Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2CAEC9BE
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 20:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028430.1402421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVaGy-0004u2-Pu; Sat, 28 Jun 2025 18:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028430.1402421; Sat, 28 Jun 2025 18:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVaGy-0004rB-NC; Sat, 28 Jun 2025 18:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1028430;
 Sat, 28 Jun 2025 18:27:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uVaGx-0004r5-SV
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 18:27:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVaGx-0073rl-0q;
 Sat, 28 Jun 2025 18:27:31 +0000
Received: from [2a02:8012:3a1:0:d050:4cf0:af44:4b0]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uVaGw-00324E-37;
 Sat, 28 Jun 2025 18:27:31 +0000
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
	bh=rCCFWI4Wllo7Z6k3MB+gL4C72oQSgswDTgBN1PfOKIc=; b=ESm5n4kG1zZcnCLlCrNtKiN5rf
	dGh5UBVsLtUXo43VncafEuIWeM6O04PZfiJwifp9BRsbBpmyxzvLoEyOtBeDkIYzXt+eiF4z0N8U6
	sRqP810hsNhnniG1TOr6QKnukx6rMHjkCvYzA28Lz8PMn7itu9HbXbcftx7lDBB7m3G4=;
Message-ID: <f891958a-35cf-4c6d-b1b9-51d34559f221@xen.org>
Date: Sat, 28 Jun 2025 19:27:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] SUPPORT.md: Add entry for guest PSCI
 SYSTEM_SUSPEND support
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1751020456.git.mykola_kvach@epam.com>
 <401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <401d3745a295812fef14a22b0c2a3c6017d588c1.1751020456.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 27/06/2025 11:51, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Document support for the optional PSCI SYSTEM_SUSPEND function, exposed
> via the virtual PSCI (vPSCI) interface to guests.
> 
> This allows non-hardware domain guests (domUs) to initiate system suspend
> operations via PSCI calls. The feature is currently marked as Experimental.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v5:
> - Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
>    which is not relevant for SUPPORT.md
> - Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
>    PSCI info; guest PSCI support was documented in a separate patch
> ---
>   SUPPORT.md | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index f0b5718e84..659b9c3052 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -956,6 +956,13 @@ by hwdom. Some platforms use SCMI for access to system-level resources.
>   
>       Status: Supported
>   
> +### ARM: Guest PSCI SYSTEM_SUSPEND support

You are already adding a Guest PSCI section in [1]. I would rather not 
another section just for SYSTEM_SUSPEND. This would make more difficult 
to know what part of PSCI is supported.

Instead, I would tweak the merge the two patches and tweak the wording 
to have something like:

   Status, Mandatory: Supported
   Status, MIGRATE_INFO_TYPE: Supported
   Status, SYSTEM_SUSPEND: Experimental

Also, I will comment directly here:

 > Emulated PSCI interface exposed to guests. Supports all mandatory 
functions from PSCI versions 0.2 and 1.0, as well as the optional 
MIGRATE_INFO_TYPE

Xen is supporting PSCI 1.1 which is backwards compatible up to 0.2. But 
effectively, we don't expose 0.2 nor 1.0.

So I would reword to:

Emulated PSCI interface exposed to guests. We support all mandatory 
functions of PSCI 1.1. See below for the list of optional PSCI call 
implemented and their status.

Cheers,

[1] 
https://lore.kernel.org/all/20250627053313.2233826-1-xakep.amatop@gmail.com/
-- 
Julien Grall


