Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493AE6AE31B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 15:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507467.781002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYbK-0001r9-MB; Tue, 07 Mar 2023 14:47:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507467.781002; Tue, 07 Mar 2023 14:47:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZYbK-0001oi-In; Tue, 07 Mar 2023 14:47:38 +0000
Received: by outflank-mailman (input) for mailman id 507467;
 Tue, 07 Mar 2023 14:47:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVoF=67=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pZYbJ-0001oM-9b
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 14:47:37 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff419d96-bcf6-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 15:47:35 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id c18so7930599wmr.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Mar 2023 06:47:35 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-230.amazon.com. [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a05600c329900b003eb5ce1b734sm13767030wmp.7.2023.03.07.06.47.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 06:47:34 -0800 (PST)
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
X-Inumbo-ID: ff419d96-bcf6-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678200454;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pvI8mWRtOffX7ZweM8Bm3DrCuqAqcnBQHi5XLhLR0g=;
        b=alYzenEzUp2r8Vy229p1P745TTWU2+ZbX8TzLWtvWRpPTXeMlGbQOHk4ZajY3xz/6N
         GzUHEl4YuqPe4t8Hl5ZNwZ8LELWkAFQhvfbYQm1DUZYbd619DH1lg6g7XPPUWe7Y2fV/
         +fQCuSVMU0L/57kbsIA7seQry9CANI0eKyWWb/qw99ndtV4jh9eIm0f25Ug8xHU4KCPk
         Kdggq0ySW+815Q28xTYIn8fck+oqEZF69IJUlk//i+ydQAtNhybPiLTNLGDL/zHZNp7n
         VWWu1qG70u8osSODE0VnTfW/dPdKFFN8TrhbwcHv8nNMOclRBRSP5n6CF15/JoC4kr40
         rXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678200454;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pvI8mWRtOffX7ZweM8Bm3DrCuqAqcnBQHi5XLhLR0g=;
        b=vtfdLv8QkJi6+rUGEXR9Q94F1qA3osub55IQOPBzTPd6/kii+xiiA9wH/O3SorBK76
         BvDhkCl3lXlpePO4nhbrhcFuXHTvLwHBTiB/wUS80NOljusb1jk0d2hPRw0IgoE5dOXl
         uNgf74fl3ANnGMF3Dxl6PMm8tjPKV7sNIzKdlSI4ydnF0VIjU9jgGiYcsTJyd/Q2A0I6
         NZEAL2r0J3TWqPCdPMQIBzNSlaKg5WWJuOz0ccEBydqBd+ufW8YVSLvFVkUYtRmF09zJ
         6J9jU27/eVmkgDioU33o+rF/96uP8m5V/A8rIDRNzas1cCJaH9SY7fs+RqXqvg9ZFTAT
         8+uw==
X-Gm-Message-State: AO0yUKXjKbVNnTxCUC7Y3BAHXNVgtVGcreVrGbBJJYYQkz8jPVpMC+T/
	AVQbKkKPa9XT8TASdk4vpXc=
X-Google-Smtp-Source: AK7set/PT9wHI1ZQ1RmWcMUPmH0kMfiSHl/cQ+QojdbC2iTtmbOaNW0Ly8PRdtS5cR5yr13JA4Auag==
X-Received: by 2002:a05:600c:1992:b0:3e2:9b4:4303 with SMTP id t18-20020a05600c199200b003e209b44303mr13106588wmq.19.1678200454574;
        Tue, 07 Mar 2023 06:47:34 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <43bf286f-4b3e-5956-25b1-4ab527657fbb@xen.org>
Date: Tue, 7 Mar 2023 14:47:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: paul@xen.org
Subject: Re: [RFC PATCH v1 14/25] hw/xen: Move xenstore_store_pv_console_info
 to xen_console.c
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-15-dwmw2@infradead.org>
Organization: Xen Project
In-Reply-To: <20230302153435.1170111-15-dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2023 15:34, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> There's no need for this to be in the Xen accel code, and as we want to
> use the Xen console support with KVM-emulated Xen we'll want to have a
> platform-agnostic version of it. Make it use GString to build up the
> path while we're at it.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---
>   accel/xen/xen-all.c   | 61 -------------------------------------------
>   hw/char/xen_console.c | 45 +++++++++++++++++++++++++++++--
>   include/hw/xen/xen.h  |  2 --
>   3 files changed, 43 insertions(+), 65 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


