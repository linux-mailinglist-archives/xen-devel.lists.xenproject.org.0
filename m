Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C11339E0D44
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 21:46:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847086.1262222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDID-0007Rr-TL; Mon, 02 Dec 2024 20:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847086.1262222; Mon, 02 Dec 2024 20:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIDID-0007P1-QC; Mon, 02 Dec 2024 20:45:17 +0000
Received: by outflank-mailman (input) for mailman id 847086;
 Mon, 02 Dec 2024 20:45:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tIDIC-0007Ov-VF
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 20:45:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDIC-000Oqp-0d;
 Mon, 02 Dec 2024 20:45:16 +0000
Received: from [2a02:8012:3a1:0:c6e:c614:26eb:b495]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tIDIC-00B9NI-0f;
 Mon, 02 Dec 2024 20:45:16 +0000
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
	bh=1WZ9rsGy6I2YuVIxZrziyD3fL0QBRDKsRJ1onf97jPg=; b=3sEAflb9ChmaiQe/coKHyhbxSe
	3oZ986D/jxxnYWY+PMHCWH+MWJXNCgSp93cpj/IUP96kGvtNavGunC9dAUtVWsY153Gvl/JQyJ3+u
	L2lo9g8Puaazeb0Qvl1nFYyyMzad/wBosQDlOETOqjmhwMxOAJWZhBfag3kPJAOqvNwY=;
Message-ID: <96f33042-b019-40b2-b72e-cc5c1f4855c0@xen.org>
Date: Mon, 2 Dec 2024 20:45:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] xen/arm: Move setup_frametable_mappings to arm/mmu
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241129091237.3409304-1-luca.fancellu@arm.com>
 <20241129091237.3409304-6-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241129091237.3409304-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 29/11/2024 09:12, Luca Fancellu wrote:
> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
> index 2cb44b857dd2..1c89602947de 100644
> --- a/xen/arch/arm/mmu/Makefile
> +++ b/xen/arch/arm/mmu/Makefile
> @@ -1,3 +1,4 @@
> +obj-y += mm.o
>   obj-y += p2m.o
>   obj-y += pt.o
>   obj-y += setup.o
> diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
> new file mode 100644
> index 000000000000..aefec908b7f2
> --- /dev/null
> +++ b/xen/arch/arm/mmu/mm.c
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

arch/arm/mm.c is GPL-2.0-or-later. AFAIU, there are still disagreements 
within the committers on whether we can drop the "or later" for existing 
code. So I would suggest to keep the same license.

The rest LGTM.

Cheers,

-- 
Julien Grall


