Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1125BB927DE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 19:55:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127939.1468466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0klG-0006tI-2g; Mon, 22 Sep 2025 17:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127939.1468466; Mon, 22 Sep 2025 17:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0klF-0006qg-WE; Mon, 22 Sep 2025 17:55:38 +0000
Received: by outflank-mailman (input) for mailman id 1127939;
 Mon, 22 Sep 2025 17:55:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v0klE-0006qa-QM
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 17:55:36 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5673e72f-97dd-11f0-9809-7dc792cee155;
 Mon, 22 Sep 2025 19:55:34 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3ee155e0c08so2912405f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Sep 2025 10:55:34 -0700 (PDT)
Received: from [192.168.42.55] ([74.50.221.250])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-269802de5dbsm138326475ad.84.2025.09.22.10.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 10:55:33 -0700 (PDT)
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
X-Inumbo-ID: 5673e72f-97dd-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758563734; x=1759168534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ZAIQmc5oqVUFqm1NDIob8VMMpZ4dgzoP/QlXFClA9M=;
        b=dmYHqbvBq7ADXpHz9lw/QFJp1t8ddBmmQC9t9bteziBn/mlfJcQGpueZ3rUqJPkErp
         u4c3nIR1/pmOUfIQQ2Ci5J2Uf8u7xitfXO2eEX91MmY+klhVlaYmn3dChABVA2BpHsyN
         mHnjLcsBD296EmoLft/3Kt8XYa+s9K70XZSWsBOPGrqnUB7PZYJshucKMtE5gVMKJgGZ
         Q+XAihYaZboNeL7JT5nm509KER5yHvddHlzM3/D1OOyAs8PBvgagx9rl9aTgAvFiwGfr
         9k2UiVEsFxO5QW1VcwQRxWyaXHws5Zzcq3wurs3M44IQbMAoNk4R0zxIC6MgbJllfpN3
         teIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758563734; x=1759168534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZAIQmc5oqVUFqm1NDIob8VMMpZ4dgzoP/QlXFClA9M=;
        b=dwvQPh2KWFl+gu0V7AxauFath6zAvWhKKqVLRTT1wwK/UwE0IXWq3H1W5T/vTfo1Ro
         BlE6yNtWyl0UfsFE6wd0HfvdgAyDqAtYYyzHdcSSjHH/XZQ51uBYbQ/BkbCCRzrPDK2y
         TjA5ud4K8sPrBjz11806oElimuha+jI9K2aXkw4KFFS6C+5+Ab0+ndk/CyVSsVTcktC+
         oCspGP7AKWGDcjBYTBc1FRiD4DzYAfUvL5p969lvBcxI/oH1KYAOYdEEhTVQiOkAsTI7
         LvOyLQOtdDaExWSsKDtgHk0FdgRvK51l8WZqpeouHyMj4Kd9eNGRCBIIJoQkd0OOH8yG
         71Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWP3BZYYRX19FfHvarOc8A6JQkyNUaJWl2Mm2SrmT2sBTEskJ3t7s+1zTtsuok6+DhSAlfuQTxwbFw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxz1PLLok9c9bZGrUtVxd0Dx4MEGti8RjLI7Qj4uOvCDRrmUENS
	ULodISbesbdy0ugAOWGaG3ldlKAQ/Dp32RiHDgTXklG0fjSbCThE50pmoemJYr+94Q==
X-Gm-Gg: ASbGncsDn1CjFWkWMv8xvdZRLAnGt1xm//TILYwzS5ASviFH0JS9tgHHXB3AG0c3FMB
	xPDYVp52qKbk+3QFZ2FHBjs9KfhKZAk0kKst1SNPt95tSXPcHwl13EHG2Zr2BClY2Dk4NZR9EPB
	Rolal55/Ual2wV11/2wnTvm/jFMtNRzicZuZ9kUHCYWYs/tkjmq1ljukZPUL+Z8f4ps/Nxa+vus
	pqc7Lkz3QFGN5EZbc/tuKkFFS+LvxSYEZMuAvIYVHMJcM6tFgz4cIcm8w4xSQjVCfSvnGcNhrpu
	QnBIgWxTyC29mlA3dJquTueZThvcWTfJ1oShnPcte14JAcIeaYKpkR5ab/rzOSZnZYd0AndfDER
	zDsNI5J2NLBc+qWCdddYKL9ef4fdS9PAL
X-Google-Smtp-Source: AGHT+IHf6jg+Taji7WJschoIPIWprSLu/ZucdQNGs2FSg+3fTeAl+MRd4QO/wDwz2h/hpyG8q8ZhzQ==
X-Received: by 2002:a05:6000:2203:b0:3ee:1296:d9e8 with SMTP id ffacd0b85a97d-3ee7e1066dbmr10681064f8f.17.1758563733790;
        Mon, 22 Sep 2025 10:55:33 -0700 (PDT)
Message-ID: <0a5561bd-6aa6-4393-a58e-a0810ad19735@suse.com>
Date: Mon, 22 Sep 2025 19:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/18] xen/riscv: Implement superpage splitting for p2m
 mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1758145428.git.oleksii.kurochko@gmail.com>
 <ff4df3d98d5acdffee3b1c1b0c345c25ea44264c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ff4df3d98d5acdffee3b1c1b0c345c25ea44264c.1758145428.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.09.2025 23:55, Oleksii Kurochko wrote:
> Add support for down large memory mappings ("superpages") in the RISC-V
> p2m mapping so that smaller, more precise mappings ("finer-grained entries")
> can be inserted into lower levels of the page table hierarchy.
> 
> To implement that the following is done:
> - Introduce p2m_split_superpage(): Recursively shatters a superpage into
>   smaller page table entries down to the target level, preserving original
>   permissions and attributes.
> - p2m_set_entry() updated to invoke superpage splitting when inserting
>   entries at lower levels within a superpage-mapped region.
> 
> This implementation is based on the ARM code, with modifications to the part
> that follows the BBM (break-before-make) approach, some parts are simplified
> as according to RISC-V spec:
>   It is permitted for multiple address-translation cache entries to co-exist
>   for the same address. This represents the fact that in a conventional
>   TLB hierarchy, it is possible for multiple entries to match a single
>   address if, for example, a page is upgraded to a superpage without first
>   clearing the original non-leaf PTE’s valid bit and executing an SFENCE.VMA
>   with rs1=x0, or if multiple TLBs exist in parallel at a given level of the
>   hierarchy. In this case, just as if an SFENCE.VMA is not executed between
>   a write to the memory-management tables and subsequent implicit read of the
>   same address: it is unpredictable whether the old non-leaf PTE or the new
>   leaf PTE is used, but the behavior is otherwise well defined.
> In contrast to the Arm architecture, where BBM is mandatory and failing to
> use it in some cases can lead to CPU instability, RISC-V guarantees
> stability, and the behavior remains safe — though unpredictable in terms of
> which translation will be used.
> 
> Additionally, the page table walk logic has been adjusted, as ARM uses the
> opposite level numbering compared to RISC-V.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


