Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5271BB32C18
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 23:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091520.1448066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upvpM-0003Mz-Uj; Sat, 23 Aug 2025 21:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091520.1448066; Sat, 23 Aug 2025 21:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upvpM-0003LW-R4; Sat, 23 Aug 2025 21:31:08 +0000
Received: by outflank-mailman (input) for mailman id 1091520;
 Sat, 23 Aug 2025 21:31:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1upvpL-0003LM-V4
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 21:31:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upvpL-002fvC-0l;
 Sat, 23 Aug 2025 21:31:07 +0000
Received: from [2a02:8012:3a1:0:7444:6df7:db1a:3c76]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1upvpL-00FOkv-0P;
 Sat, 23 Aug 2025 21:31:07 +0000
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
	bh=82oJZ5W4F4Leqc8Mat3K9J1rJ1u/BuhD55uGQasyTGw=; b=QuOtg90rhwXFSoNoGGgTL97VCY
	6VlKelepfGlj87dkV8rqdyd9wHOiisgdQu7JqzQ58fQZbDXORhKWCF85BzRRiGNEaVSYGmjTgwFjh
	Cz+CW5euN6nY5iTg9JI6wIXvz0xqEC0Xnsza8kJ+O0nLdROxE1h4c7eMeXcKLjxqA3ps=;
Message-ID: <d11c1224-99c0-4254-b593-c8a7f405b079@xen.org>
Date: Sat, 23 Aug 2025 22:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] SUPPORT.md: Document PSCI SYSTEM_SUSPEND support
 for guests
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1755506449.git.mykola_kvach@epam.com>
 <433d74567cabf33c2a672afc0f96e58efec75c54.1755506449.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <433d74567cabf33c2a672afc0f96e58efec75c54.1755506449.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 18/08/2025 09:49, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> Add a new entry under the "Virtual Hardware, QEMU" section documenting
> support for the optional PSCI SYSTEM_SUSPEND function exposed to guests.
> 
> This function is available via the virtual PSCI (vPSCI) interface and
> allows guest domains (domUs) to initiate system suspend operations.
> 
> The feature is currently marked as Experimental.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v6:
> - Dropped the generic guest PSCI support entry (merged in a separate patch)
> - This patch now documents only the SYSTEM_SUSPEND optional function
> - Reworded commit message to match the final form after rebase
> 
> Changes in v5:
> - Dropped ARM/PSCI entry: this refers to internal use of PSCI SMC calls,
>    which is not relevant for SUPPORT.md
> - Added a dedicated entry for PSCI SYSTEM_SUSPEND instead of generic guest
>    PSCI info; guest PSCI support was documented in a separate patch
> ---
>   SUPPORT.md | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 6a82a92189..b5ab049b52 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -962,8 +962,9 @@ Emulated PSCI interface exposed to guests. We support all mandatory
>   functions of PSCI 1.1. See below for the list of optional PSCI call
>   implemented and their status.
>   
> -   Status, Mandatory: Supported
> -   Status, MIGRATE_INFO_TYPE: Supported
> +    Status, Mandatory: Supported
> +    Status, MIGRATE_INFO_TYPE: Supported
> +    Status, SYSTEM_SUSPEND: Experimental

Experimental implies the feature is not complete. But it is unclear to 
me what is missing (or I probably forgotten). Can this be clarified in 
the commit message?

If there is nothing, then I think it can be a tech preview.

Cheers,

-- 
Julien Grall


