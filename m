Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E9A03145
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 21:19:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865989.1277285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtZI-0001I7-Qc; Mon, 06 Jan 2025 20:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865989.1277285; Mon, 06 Jan 2025 20:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUtZI-0001G7-O6; Mon, 06 Jan 2025 20:19:20 +0000
Received: by outflank-mailman (input) for mailman id 865989;
 Mon, 06 Jan 2025 20:19:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U/ZK=T6=ventanamicro.com=dbarboza@srs-se1.protection.inumbo.net>)
 id 1tUtZH-0001Fu-Fx
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 20:19:19 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80d6d0ee-cc6b-11ef-99a4-01e77a169b0f;
 Mon, 06 Jan 2025 21:19:17 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ef28f07dbaso16892894a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 12:19:17 -0800 (PST)
Received: from ?IPV6:2804:7f0:bdcd:fb00:6501:2693:db52:c621?
 ([2804:7f0:bdcd:fb00:6501:2693:db52:c621])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ee26b125sm39870772a91.43.2025.01.06.12.19.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 12:19:15 -0800 (PST)
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
X-Inumbo-ID: 80d6d0ee-cc6b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1736194756; x=1736799556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9p8hjeIMnEMUpmW04h0W7NoiD5E5c5Q5zI/Al9/E30=;
        b=TidC6U8azPrXag5jvCCrebMkb6ZZwL3dMz9bOXSdpjgTglVqdoRP4iD+D68U8n83fU
         bw3A/qKpU6m8040Qnuia/hJ9ZFpKgPAKQrQ9TrrI75q2etbx6JaSLmMBecHMOf9WnfWX
         KXb05tP4ErvlYATbCcBsl0PO95mTU5w2yX9SmHljdas7fOLSF2igMRRDkYJPyMKFHheK
         MPe1NzSsvQ1Z5AOVPM0rLwZ+7a5LNQkFZaAuCxAEp50r11W0A0aFq4D4ecQtUbZMUreS
         TM4a1+Qzw/I2jje5uGfeEcUjznmdAmKMSqsh3HuOpZ5GTfEDinVFKjWxZyc6GEG6u72t
         bTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736194756; x=1736799556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9p8hjeIMnEMUpmW04h0W7NoiD5E5c5Q5zI/Al9/E30=;
        b=ALKkxfeK+kj++sGrSc/rHhlxS+YwT18T4oeThq7NWu0+YhvDxyWoUtO//xEhq9p8AR
         IUGfK6PiEGXbVq948gPMUSOl3maybEV6FGyX/fPJ6mBq0PUnk3MKKID40m328Qh5WGvH
         fpdknEojq08HEaW/I/4ODTgVppmR0MpCRHwEKD+euC85pp4p4xkVQjjg9CrDGC7A8cxm
         AkfINdEERdyWIUnDNbPpWmuWpxsy+VqgK04eItX5xuF/FG2gcKViLb6Bl3lAYoO+LMuq
         v+WMmBx6GVVCf8+4pF5UM8H6ZrwoBgDEhKv7VQpn1Qmmkxdnli5jkIAwO8kZexSp8pPa
         VqAg==
X-Forwarded-Encrypted: i=1; AJvYcCWjC3QozigIyZ0X9x0uiSHq0WJB5nTwNtd6PFPxSvR2Vobzhni1v4hrVrw23h1mypJ52SsB36blTOk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdrZpwX0QVUVt8lc6ld5WnJ0UCbTeJ5W/pzFGeSWwDyjopS19b
	K3NuBr8BicjeHroK4iL7h7QEMs42TBq8ddrHxmiIIGohvL781D+mLqvc2qS2NOU=
X-Gm-Gg: ASbGnctSJVBvM3eJJZBHQihRnBrTiEKtpf5P0X9gzGnY7Cfj3fBw/YcuQryWT7HcGsf
	MA4VJG98CpRK1gry3DAseBo/kUJBz/+l64GduD8+gBSzX7qt8UF3UrU3rorSRY2oLHBzWy3CSWU
	43CNhG+NNlJVV7estD5ciwl5k+q1X+/EfXWL8LdBx4/rkF2w0rmPKtQIJl15Qrbo9pu/wb+A+GJ
	fUNHtFnRG31+3tHhndRIv3rHjesU+58isUwZQyAEwBtE2Nd/SJbU8YhKje3MxjJWtbfe3oNqW2W
	N/y+u+ozBMCXnkbT0+G0GxKkPs+XZAr+GIU=
X-Google-Smtp-Source: AGHT+IEdi1WeRPTrXeJrhazkx/sBhP2RZVeyTSKqrV/o+q5vpCxn6bBHpDXsADAKiAGaa0ShcqYeAQ==
X-Received: by 2002:a17:90b:51c2:b0:2ee:ab29:1a57 with SMTP id 98e67ed59e1d1-2f452def211mr85711065a91.2.1736194756055;
        Mon, 06 Jan 2025 12:19:16 -0800 (PST)
Message-ID: <69e79cef-214d-4795-b3ce-032529c9f7d6@ventanamicro.com>
Date: Mon, 6 Jan 2025 17:19:04 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] cpus: Restrict CPU_FOREACH_SAFE() to user
 emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Cameron Esfahani <dirty@apple.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 Alexander Graf <agraf@csgraf.de>, Paul Durrant <paul@xen.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Riku Voipio <riku.voipio@iki.fi>, Anthony PERARD <anthony@xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, Zhao Liu
 <zhao1.liu@intel.com>, Phil Dennis-Jordan <phil@philjordan.eu>,
 David Woodhouse <dwmw2@infradead.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Anton Johansson <anjo@rev.ng>
References: <20250106200258.37008-1-philmd@linaro.org>
 <20250106200258.37008-2-philmd@linaro.org>
Content-Language: en-US
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20250106200258.37008-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Perhaps add in the commit msg something like "it's only being used in
bsd-user and linux-user code"

On 1/6/25 5:02 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   include/hw/core/cpu.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c3ca0babcb3..48d90f50a71 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -594,8 +594,11 @@ extern CPUTailQ cpus_queue;
>   #define first_cpu        QTAILQ_FIRST_RCU(&cpus_queue)
>   #define CPU_NEXT(cpu)    QTAILQ_NEXT_RCU(cpu, node)
>   #define CPU_FOREACH(cpu) QTAILQ_FOREACH_RCU(cpu, &cpus_queue, node)
> +
> +#if defined(CONFIG_USER_ONLY)
>   #define CPU_FOREACH_SAFE(cpu, next_cpu) \
>       QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
> +#endif
>   
>   extern __thread CPUState *current_cpu;
>   


