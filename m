Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC28A078CF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868417.1279929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtHL-00053G-1k; Thu, 09 Jan 2025 14:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868417.1279929; Thu, 09 Jan 2025 14:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtHK-00051t-V6; Thu, 09 Jan 2025 14:12:54 +0000
Received: by outflank-mailman (input) for mailman id 868417;
 Thu, 09 Jan 2025 14:12:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=29Hz=UB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tVtHJ-00051n-1w
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:12:53 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d03d9aed-ce93-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 15:12:52 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54252789365so1125345e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 06:12:52 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bec06e1sm211492e87.191.2025.01.09.06.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 06:12:50 -0800 (PST)
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
X-Inumbo-ID: d03d9aed-ce93-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736431971; x=1737036771; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hx9XNRWWQvFgmfC7xFExMys0jqPzn2r8jdox5rkxAKU=;
        b=bbGiqv09gd+2rkni3krghhslF/PliiEwMY989a9KglIHGcBUdPY4DJEbpE9vUg5KFh
         dtqLY8PuUBiHCjfhZJHRBwCxJuiPhVvN1k0GF4mDv6wz85GyW5bg9nqHvBRSwV4KlZag
         S/XDuNURSUKaVchvsXsd56mjuqZKCpntpM+J8YMFtthoiV7VsoBs5pD4t7+4Ra27iTh0
         7Rgh+cQw3fpPtZuX7ZF9dWLHTOdfU7bucTGbP/sv1GLZFNZGkiuFvv0CpeFX0Z2nkR4c
         05DqsgVnQYKfI6xMOJMz/AzLYHULl2QN7zgamj4oAn1ySz3koh7rWQ0nQc//Ks3APhBy
         qsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431971; x=1737036771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hx9XNRWWQvFgmfC7xFExMys0jqPzn2r8jdox5rkxAKU=;
        b=LuSGiqgJpAGEEkzh4RC8eK2qMPxvZxGctM055Q1j7716cmUvQUOow3MpL6nw9wekic
         V/91mfviG/CoVfMxxdXxyKUSTPej1aykos7ZkO7pqxYEc/xsIn/iJHGURliw2eoSAktg
         AYJyZWZwFKUmAggpc6p9nd1Y23FlWkIJ6ZEd/n7p3r3jAvCFK0wvYu4uOVMITnHWpAgf
         y6OaVWeFfA9DCQIDJHmbv0mvit5FV1g9s6cfIjcKoCW+eHywxLEklA0dzqsHESmDBa7c
         25ShzSc/rWPjq61ZZjMtJiguYzWqubxD/nynnTxT7ugtHYYwIg7Z0lJFuVqseLATcnyF
         FLEg==
X-Forwarded-Encrypted: i=1; AJvYcCXTlZPU23E/ZUdkDj+b2s1ZpL1Itzwg6kZ2qgDG0j2kT497MS8kgjlMZjhkhx5ZVgTGZ38ccts69D0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCJG7q1A6ySV1bZIXjcnc5ZH7IPWLbJsmWRig64OwmuZ8ISrNu
	Dq3Up3FTcQAcZ6qa5C5YVGbTt5hCI46QLJTj6WJ2y4OPjlfBtGyB
X-Gm-Gg: ASbGncuf+7dRam09w6GnjYuxdOECMIBEgxZpZDQ3MRb5ng+PiPUAGH+4PbbHPbxS9Am
	7M+pgZhO/0qdrIdjtHDhGsfEg9wt1t/ujGv8ZtCjsT6SkBE7oBnlTop3MNpHAI6AcOahuFfTnqL
	cvrUBhcjFPb2/w7BkC8u+sD09glnDxGw7yG+Aejw7wJBc49JGTsQ7EdshM6/mdIQMsQHxi/E1Nf
	0fkVHwKDfsaCl6v38tiEyQBcEGyTuGHk6gC33TjzyHbaYy3UGYkAfblPL7RZqd+nl596Q==
X-Google-Smtp-Source: AGHT+IHTR2/ADrDRDofDG7g75O7jRL1IBWYeETf/Q5t1AXXn31P5qw51HbpEDRRCdyExcDPRxCetWg==
X-Received: by 2002:a05:6512:31d1:b0:540:2542:d89a with SMTP id 2adb3069b0e04-54284823efemr2089975e87.52.1736431971063;
        Thu, 09 Jan 2025 06:12:51 -0800 (PST)
Message-ID: <f6a7cc80-7770-44f6-9706-a259aaedcdec@gmail.com>
Date: Thu, 9 Jan 2025 15:12:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: ffa: fix build with clang
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250108164054.338799-1-stewart.hildebrand@amd.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20250108164054.338799-1-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/8/25 5:40 PM, Stewart Hildebrand wrote:
> Clang 16 reports:
>
> In file included from arch/arm/tee/ffa.c:72:
> arch/arm/tee/ffa_private.h:329:17: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
> extern uint32_t __ro_after_init ffa_fw_version;
>                  ^
>
> The variable ffa_fw_version is only used in ffa.c. Remove the
> declaration in the header and make the definition in ffa.c static.
>
> Fixes: 2f9f240a5e87 ("xen/arm: ffa: Fine granular call support")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii

> ---
> v1->v2:
> * remove declaration and make definition static
> ---
>   xen/arch/arm/tee/ffa.c         | 2 +-
>   xen/arch/arm/tee/ffa_private.h | 1 -
>   2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 87775ed88ffd..3bbdd7168a6b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -72,7 +72,7 @@
>   #include "ffa_private.h"
>   
>   /* Negotiated FF-A version to use with the SPMC, 0 if not there or supported */
> -uint32_t __ro_after_init ffa_fw_version;
> +static uint32_t __ro_after_init ffa_fw_version;
>   
>   /* Features supported by the SPMC or secure world when present */
>   DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
> index d441c0ca5598..c4cd65538908 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -326,7 +326,6 @@ extern void *ffa_rx;
>   extern void *ffa_tx;
>   extern spinlock_t ffa_rx_buffer_lock;
>   extern spinlock_t ffa_tx_buffer_lock;
> -extern uint32_t __ro_after_init ffa_fw_version;
>   extern DECLARE_BITMAP(ffa_fw_abi_supported, FFA_ABI_BITMAP_SIZE);
>   
>   bool ffa_shm_domain_destroy(struct domain *d);
>
> base-commit: 70f5a875becc9444a959830b10a361982c31a366

