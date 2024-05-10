Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EF68C2B88
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 23:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720057.1123001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XTe-0006MS-5h; Fri, 10 May 2024 21:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720057.1123001; Fri, 10 May 2024 21:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5XTe-0006JT-22; Fri, 10 May 2024 21:08:26 +0000
Received: by outflank-mailman (input) for mailman id 720057;
 Fri, 10 May 2024 21:08:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s5XTc-0006JN-Js
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 21:08:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XTc-0006pk-FO; Fri, 10 May 2024 21:08:24 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s5XTc-000081-9l; Fri, 10 May 2024 21:08:24 +0000
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
	bh=xe7wyW4aNB7A0bXarsn4WH1tWm4wudSxNwAnothZjLs=; b=D0zKra2Wtajqag0ssKcd2/O4WW
	dStJY84wIA57XO7ocHqL7ChDergAI/bZOs2t5337VQROrb6blmZKYZwWkaClsZa0vob8t3996j6uT
	t5QlnZpPg4JE7cKupebDpYrIV7CDxCx47Ynw6Hn/AO0qaOveznBptA4OUP/KYmqvpdxw=;
Message-ID: <9650300c-9947-4d1d-87d5-aaa6102bfabf@xen.org>
Date: Fri, 10 May 2024 22:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen: allow up to 16383 cpus
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240510141636.20543-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240510141636.20543-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/05/2024 15:16, Juergen Gross wrote:
> With lock handling now allowing up to 16384 cpus (spinlocks can handle
> 65535 cpus, rwlocks can handle 16384 cpus), raise the allowed limit for
> the number of cpus to be configured to 16383.
> 
> The new limit is imposed by IOMMU_CMD_BUFFER_MAX_ENTRIES and
> QINVAL_MAX_ENTRY_NR required to be larger than 2 * CONFIG_NR_CPUS.
> 
> Add a support limit of physical CPUs to SUPPORT.md (4096 on x86, 128
> on ARM).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>

I am a bit surprised that this is kept given you added SUPPORT.md. I'd 
like Jan (or other x86 maintainers) to confirm they are happy with the 
proposed x86 security supported limit the SUPPORT.md.

For Arm (only):

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> V5:
> - new patch (Jan Beulich)
> V7:
> - add SUPPORT.md and CHANGELOG.md entries
> ---
>   CHANGELOG.md     | 2 ++
>   SUPPORT.md       | 5 +++++
>   xen/arch/Kconfig | 2 +-
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 8041cfb7d2..c43c45d8d4 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>      - HVM PIRQs are disabled by default.
>      - Reduce IOMMU setup time for hardware domain.
>    - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
> + - Increase the maximum number of CPUs Xen can be built for from 4095 to
> +   16383.
>   
>   ### Added
>    - On x86:
> diff --git a/SUPPORT.md b/SUPPORT.md
> index e10d46d924..d5d60c62ec 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -61,6 +61,11 @@ For the Cortex A77 r0p0 - r1p0, see Errata 1508412.
>   
>       Status, x86: Supported
>   
> +### Physical CPUs
> +
> +    Status, x86: Supported up to 4096
> +    Status, ARM: Supported up to 128
> +
>   ### Host ACPI (via Domain 0)
>   
>       Status, x86 PV: Supported
> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> index 67ba38f32f..308ce129a8 100644
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -6,7 +6,7 @@ config PHYS_ADDR_T_32
>   
>   config NR_CPUS
>   	int "Maximum number of CPUs"
> -	range 1 4095
> +	range 1 16383
>   	default "256" if X86
>   	default "8" if ARM && RCAR3
>   	default "4" if ARM && QEMU

Cheers,


-- 
Julien Grall

