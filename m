Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9255FC847B0
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171812.1496836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqHW-0000cT-DS; Tue, 25 Nov 2025 10:28:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171812.1496836; Tue, 25 Nov 2025 10:28:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqHW-0000Zl-AX; Tue, 25 Nov 2025 10:28:22 +0000
Received: by outflank-mailman (input) for mailman id 1171812;
 Tue, 25 Nov 2025 10:28:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNqHV-000842-2t
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:28:21 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75edde39-c9e9-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 11:28:19 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64088c6b309so8721916a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 02:28:19 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654fd43b1sm1532571066b.38.2025.11.25.02.28.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:28:17 -0800 (PST)
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
X-Inumbo-ID: 75edde39-c9e9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764066499; x=1764671299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wp5/syD0+o/LyjTyIR4uS8V1NpnQlWuYtR2o807A2NY=;
        b=zpD9Kn+JsnvKcz4OuSc0z81UnN9gGAwIUcfkxNq8XK97f530ga7c9hsRMLxenCZNVS
         yX6P0fj4xfKxoE23HlrQLKn6aPRcQJD5CSlKQe2oVDV5MfRilN/VSv8+JJZ5gCRZwPuJ
         /Zg4RNGY57dNgRg0nWvFTvxVBdy+78jgTaTl7cbkutF6LDwEVN1hiFgxQfaGDoPJ5vsm
         4YqcWVogJk9QlN8uvbXLERvLhzmLCKhM9enUZfHOxbZBy0vrOzUWqjEgqZuAl/FweMRO
         MluVK9gKELgfI1zYQm7oOIIfFhUPe1N1LvxEMPH4ozGJ79hjxfVp9c4mF4NfnAoUkImz
         QKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066499; x=1764671299;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wp5/syD0+o/LyjTyIR4uS8V1NpnQlWuYtR2o807A2NY=;
        b=c2G3+w4Dmbit0N51MkMgII0WUFZwApBvn2ASQMq+d4VoAyNfWhOceDCak0LtEmJHFX
         e739Mv6vpWUpL9ayl/VXP1ncp0dMSmYDJ9ak5Y3smIKKomlGpsEBd1mFV+vp1vXlT6uI
         FrvqpZZlpSAno6kiJo4jQta9lXj8vFe2/u2SwftIR2wJ97VIyN6HvAvwOa5uLBj+4obQ
         akt/YgowSq5oFDRNCwTvBEP5AT47nvVKJG/QnJyogyxc5KhiPrjtARBWT6josiOO4HjT
         IGR9mH7xFbZdAzuAdGThBGoLzFJaqSvWdBCFPvAscYT8Je6AiRxzt/cIPbmVdCG+zAs5
         gVeA==
X-Forwarded-Encrypted: i=1; AJvYcCX8v9hsPeImf1jR7DXBtIH8sVLi+uApV9PPyJqT4fqMm/OYJdHIyThzpKey6saog1Ctu60WQlfvF6Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy9iUxMUwMB9oRDCMIOF9baeYNIOV0jjTL+1g0lmpPcZZh5FMJB
	o/psPCD2uvD1bNZD/+QND+fpI1urBHD/GWq69utwgwm1E4JwS2ZXIfUpEYFZcB7pCcw=
X-Gm-Gg: ASbGncseEm6azwcvmkgpGZPGOu/sapJk3Ni0W652G/0Trgzw4T1kgKvhqkb6tSefU/1
	KaVeuth1pt8yu79f2YROAEI0r/JqmTvj3QW+pubk3R02AKEcoFgss8DekEqB9W7S4NlcILuOaIr
	y6BN8kwCD8KGhZd2jSSV3tbiDVesl5dKBOyH1SWiRpymUJB4gG2QOMWGSBDbTuGRbKNHXzZQ56s
	XJVU1YfKV6yxvo0/qGmr6oB2Z8dIqsu7pTaXZernBM2Ka4OZScMN6bIT5tiiFfurOWT3btZgNpK
	IwxQ2YUEupmDDVHFiK569pc8p+d0CdR6w9mx/+zyXNLh7n0EwoxzH8qXQgssRwzpNFlQ1Wqdcwk
	6ouvR4vSfcZD2QaznOiQU6jylxPG/M6awOuqFR1uur3KQRk2ITFZG0pvXsb8zQ1zywBvLufo8tM
	yPpc3yPe57Y9tUfL76MmxuKLjCgxsdMmfygmOOsUN6CQwB1LKAVVO2tQ==
X-Google-Smtp-Source: AGHT+IE3PKjG7rNMmUMO0u0YPkOHg97YVfk6tokccVI/wtgGNpt9SgcH/ClnqkI9yxamQKVM5NvRXg==
X-Received: by 2002:a17:907:868f:b0:b72:5fac:d05a with SMTP id a640c23a62f3a-b7671a47ae8mr1360006666b.37.1764066498581;
        Tue, 25 Nov 2025 02:28:18 -0800 (PST)
Message-ID: <a5388c93-124f-42ac-8881-3cae4bb620c6@linaro.org>
Date: Tue, 25 Nov 2025 11:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] error: Use error_setg_file_open() for simplicity
 and consistency
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: arei.gonglei@huawei.com, zhenwei.pi@linux.dev, alistair.francis@wdc.com,
 stefanb@linux.vnet.ibm.com, kwolf@redhat.com, hreitz@redhat.com,
 sw@weilnetz.de, qemu_oss@crudebyte.com, groug@kaod.org, mst@redhat.com,
 imammedo@redhat.com, anisinha@redhat.com, kraxel@redhat.com,
 shentey@gmail.com, npiggin@gmail.com, harshpb@linux.ibm.com,
 sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
 edgar.iglesias@gmail.com, elena.ufimtseva@oracle.com, jag.raman@oracle.com,
 sgarzare@redhat.com, pbonzini@redhat.com, fam@euphon.net, alex@shazbot.org,
 clg@redhat.com, peterx@redhat.com, farosas@suse.de, lizhijian@fujitsu.com,
 dave@treblig.org, jasowang@redhat.com, samuel.thibault@ens-lyon.org,
 michael.roth@amd.com, kkostiuk@redhat.com, zhao1.liu@intel.com,
 mtosatti@redhat.com, rathc@linux.ibm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, marcandre.lureau@redhat.com,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20251121121438.1249498-1-armbru@redhat.com>
 <20251121121438.1249498-11-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-11-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Replace
> 
>      error_setg_errno(errp, errno, MSG, FNAME);
> 
> by
> 
>      error_setg_file_open(errp, errno, FNAME);
> 
> where MSG is "Could not open '%s'" or similar.
> 
> Also replace equivalent uses of error_setg().
> 
> A few messages lose prefixes ("net dump: ", "SEV: ", __func__ ": ").
> We could put them back with error_prepend().  Not worth the bother.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Dr. David Alan Gilbert <dave@treblig.org>
> ---
>   hw/9pfs/9p-local.c        | 2 +-
>   hw/acpi/core.c            | 2 +-
>   hw/core/loader.c          | 2 +-
>   hw/pci-host/xen_igd_pt.c  | 2 +-
>   monitor/hmp-cmds-target.c | 2 +-
>   net/dump.c                | 2 +-
>   net/tap-bsd.c             | 6 +++---
>   net/tap-linux.c           | 2 +-
>   target/i386/sev.c         | 6 ++----
>   util/vfio-helpers.c       | 5 ++---
>   10 files changed, 14 insertions(+), 17 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


