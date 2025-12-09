Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A3CAF822
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 10:51:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181283.1504362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuMk-0000XA-To; Tue, 09 Dec 2025 09:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181283.1504362; Tue, 09 Dec 2025 09:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSuMk-0000Uv-QE; Tue, 09 Dec 2025 09:50:42 +0000
Received: by outflank-mailman (input) for mailman id 1181283;
 Tue, 09 Dec 2025 09:50:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rCN0=6P=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSuMj-0000CM-U5
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 09:50:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84d3d1ed-d4e4-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 10:50:39 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b728a43e410so720248066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 01:50:40 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b79f49b7177sm1323482866b.50.2025.12.09.01.50.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Dec 2025 01:50:38 -0800 (PST)
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
X-Inumbo-ID: 84d3d1ed-d4e4-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765273839; x=1765878639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJPOpcQMazIM88B5DPGnAZVgNwq+pfcOP01xFk5hDFM=;
        b=bb5MuDwPo8MqNrk0xHGaOYqr/nXSI4NGntAfUbAAnmcNmjznOPDsvD72XYlk7EGAfY
         Rv2qf2Ruy/EfwaLst+iP9ysmrNE5bTOutiy0folLcD+ZsEkVeX53ZiLAzL/NpI5z2mRk
         z4pgOI8NzfcAkYov3fDo21gfTLfw9UA4tABZzmDO0A6xwDgo+BNSEyhiYTxovoJv4R5o
         viMc7++B9efkZm7Z1T4inWLEmoIz6QwC/j4VDLrJqjxLcQaD8qAEb5DzgdlQmkSIi2qH
         WcjKsKRB+7Q5RVtLbwgFolVKgKMHCANulhtuOizSfJkGRk93PbS917p5qyl1yBHjPH2F
         VyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765273839; x=1765878639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJPOpcQMazIM88B5DPGnAZVgNwq+pfcOP01xFk5hDFM=;
        b=U6Tslrndk5Sg6HmBAYgrJA/1/2mP/HYMpwiGRFQKUQV6anpQMla6I5M3FQqkADGt3a
         y3P4bGoPa77QK32+rIrJyBKDYhIyENeJEgqrYCEqT2zscUFbiWSuiM+6Iceg8jfvYYNS
         2LaxYlqCmh7oqM6R/ZkBJ+j6gC6MvzBhssLMG0Okc3OLZ0aP21KcTD3vquYNsiZMfz1X
         gKOFScDWbrMecGKg/T4C2/EnNvY5qonOj7oYA9ZlFneh1jLZ4HHnnkwIc/PCwuz16YAt
         WAIj4hkVvWTWYWOykReakl1q03dBgPzdgoPCAWLr5r0Isi8Cr3SJogVdyAB8oV+zFEQ5
         CSdA==
X-Forwarded-Encrypted: i=1; AJvYcCWTf2UEV5tJgTM9KxLRZooe0CkVZ8h79B2bPfx1aoqUlPPSMXuwpk/c86Lp4ks55Olzw9VaUfF9ZMw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxsgifKt3V8XyZw+MflpY2KurnaWPr3TkfQeB848JwnXwOglH3d
	H/0UIYRgfNqiHKZaevwzM0BFtIwGiK2m2EkypX3koaD1LRMn885dTyEA
X-Gm-Gg: ASbGnct4XTwqMCsOltXuxZmr6cGTa00Csj8wtq8r67LJ9Z+dD3rqkbaBtKJ1qeyJ1v9
	tD7CDg2tnju1ZWwKE1ITUF4z6Ge6HZkhrAu2+2u7lAway9prnkYF31wnkIdK2OId5QuudCZCcC5
	jPJ2BdM9tTrkg4jbEDF4mH4aC/TNpiMFucH4Lhv94mWbuTziQq6HGATrnS3F60AsR+eEkb8MvaB
	lAk+CYRRqef2Pxe3ezEZ0UWLyIRN72yk7Z/min9FH5070piFchRW1bqZcv0ZrYf6kyfOGI6SZ1U
	WYRqJ9lUvIBX3UgogjziXizuuEYfnEdPbqDIkUahxb881/P8Hh2mcscpf46aow4bXQAXmcK6pbL
	xTYuvgKq6ZW1mkqhPlqAVMUWk1RYeHB1se6dlBOPuLBlidXq9T9qcjC7Ik+dlK6R86bdtfq6VPI
	epBHLZiP94Z2M/TZt5HG3Ju/P8HSYuAYhGmZzaEk7sZUNh6gaOx88Bk9LJtSCy
X-Google-Smtp-Source: AGHT+IGFRVCQwsoMDLQ7USJCKrexRPZwnInhuLkXELtmHcZRP1on2RCd4FMNKvyXUt6qG6ZklhkUWQ==
X-Received: by 2002:a17:907:86ab:b0:b6d:505e:3da1 with SMTP id a640c23a62f3a-b7a242d4a5emr908291966b.7.1765273839252;
        Tue, 09 Dec 2025 01:50:39 -0800 (PST)
Message-ID: <5003774e-ce4a-4592-976d-0154a9b15d5b@gmail.com>
Date: Tue, 9 Dec 2025 10:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Oleksandr,

On 12/3/25 7:58 PM, Oleksandr Tyshchenko wrote:
> Creating a dom0less guest with a high vCPU count (e.g., >32) fails
> because the fixed 4KiB device tree buffer (DOMU_DTB_SIZE) overflows
> during creation.
>
> The FDT nodes for each vCPU are the primary consumer of space,
> and the previous fixed-size buffer was insufficient.
>
> This patch replaces the fixed size with a formula that calculates
> the required buffer size based on a fixed baseline plus a scalable
> portion for each potential vCPU up to the MAX_VIRT_CPUS limit.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> V1: https://patchew.org/Xen/20251202193246.3357821-1-oleksandr._5Ftyshchenko@epam.com/
>
>    V2:
>     - update commit subj/desc
>     - use a formula that accounts MAX_VIRT_CPUS
>     - add BUILD_BUG_ON
> ---
> ---
>   xen/common/device-tree/dom0less-build.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
> index 3f5b987ed8..38a5830813 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -461,15 +461,25 @@ static int __init domain_handle_dtb_boot_module(struct domain *d,
>   
>   /*
>    * The max size for DT is 2MB. However, the generated DT is small (not including
> - * domU passthrough DT nodes whose size we account separately), 4KB are enough
> - * for now, but we might have to increase it in the future.
> + * domU passthrough DT nodes whose size we account separately). The size is
> + * calculated from a fixed baseline plus a scalable portion for each potential
> + * vCPU node up to the system limit (MAX_VIRT_CPUS), as the vCPU nodes are
> + * the primary consumer of space.
> + *
> + * The baseline of 2KiB is a safe buffer for all non-vCPU FDT content.
> + * Empirical testing with the maximum number of other device tree nodes shows
> + * a final compacted base size of ~1.5KiB. The 128 bytes per vCPU is derived
> + * from a worst-case analysis of the FDT construction-time size for a single
> + * vCPU node.
>    */
> -#define DOMU_DTB_SIZE 4096
> +#define DOMU_DTB_SIZE (2048 + (MAX_VIRT_CPUS * 128))
>   static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>   {
>       int addrcells, sizecells;
>       int ret, fdt_size = DOMU_DTB_SIZE;
>   
> +    BUILD_BUG_ON(DOMU_DTB_SIZE > SZ_2M);
> +
>       kinfo->phandle_intc = GUEST_PHANDLE_GIC;
>   
>   #ifdef CONFIG_GRANT_TABLE

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks!

~ Oleksii


