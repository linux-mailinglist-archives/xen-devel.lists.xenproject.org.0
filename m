Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D57C8370F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 07:17:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171569.1496581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmL5-0000AR-SL; Tue, 25 Nov 2025 06:15:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171569.1496581; Tue, 25 Nov 2025 06:15:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNmL5-00007l-MW; Tue, 25 Nov 2025 06:15:47 +0000
Received: by outflank-mailman (input) for mailman id 1171569;
 Tue, 25 Nov 2025 06:15:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNmL4-00007e-B9
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 06:15:46 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b58fd06-c9c6-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 07:15:41 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b31507ed8so4303123f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 22:15:41 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e574sm32156895f8f.3.2025.11.24.22.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:15:40 -0800 (PST)
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
X-Inumbo-ID: 2b58fd06-c9c6-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764051341; x=1764656141; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f/9Y7JR60Swip/dFOGxc5iPJjQDRvPRSNeJxakP8wk=;
        b=ajpBJwDO9r2102sYOgHXhPEplXljIcEneEBikm8ZTYRD5yMnwauq4yFhQgfc4WmChG
         iayFCnVuGjlBfoe24CXFnuPQZOAQYwEkoOs5ZcUsYtRKV9ud4ktgRmuvN37dHIvmMmxq
         epz6NetG7JdWgsZ9A5Qz/AE5xPmToBvZ2CgiiDuzXw1bbsdOYigFSSQlxg8eB6VGaQaY
         LiHnDLlAusB2XipbPT1cEKYgQdT5ZkQ76br6CxFXvmewq/kKhl9EyBKeoybHsz2do1wr
         kFZ87T6pTEDQ48lWTNgQ51QKTaSoCeRdLoOIGP+/BAGgLuNQberWBXJFk930eRgyb505
         cATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764051341; x=1764656141;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0f/9Y7JR60Swip/dFOGxc5iPJjQDRvPRSNeJxakP8wk=;
        b=c636me8ORSOYaNilHICbHXbB7APuXSnxGoxIoaMj6Y960jqX/GhsVMQwR1aidPbzUO
         aXK59WT5j1o+qoWJhAaRiLJm+/c4KhgLPb18nclVW0X2C1Ap/+eGn4ceH2JByuU/eas+
         LC+91YtlAZB6eOyaTI/MOsxR+J/bCDLb1FczESDxSVJM7mvqQ8gP5Us8DvBOOX4hHCfx
         iAPfxZRljYIMMkaiHIAGKGavgqK0Z/vN2Sm1TpKIAhm7ATmFWY2QdJwliRCyTk6Fv9qm
         GCvALzN7D4/yKxivTbQeiIEWdvyOGORJOH8A2QoBbDieA6eZBO4GYgBX1xMWiJDO4X8Y
         JmPg==
X-Forwarded-Encrypted: i=1; AJvYcCX9BzKhRmjm228SdAzZ2PrvWKIbCaPdMUO6EieYDEJVaDBs9wquWXT5zjKo9X2I/x4tZ0zvdQ4ftjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypZo4XTfuMJUPDil1QjhiXHNI+29lNgNf5of9vhIo8fL+vxbQE
	Bkx/8zbhCxBiRvGh/7/T0ZUjpZ6+RJTJVrVeyV5dO8kW9wA5p3ALsedzvAnPYdzAyuM=
X-Gm-Gg: ASbGncvcmp52agDmk1hIJ6iBVE+ECT3BA/SwNYE4nzcoU2/sByqMVYVikMMPSVKXeQB
	A24SRgmsXPl4CmvBd2Uez9V/HhAquiK5vbR5Ci7cahXLI38QQmmHmGqUYtaG5zenRXnnakFz81A
	4pet75e52VMuZHPlb3Lirryb/7GMtRjUYs/EdC11xXl3Q12n2L4x+zB/S/RSplcG3//LlEw857q
	by+UOsuN5rnqN4B/yZZj4IA2hfvLGE6wXFliDTeBrOYYV01vxtPjfDyUfdleDzwPcnOZ+RewqNp
	awtUKQq2jkKi3eBu295OXBmTv5WQmZNyVUjF44Ib95h6PiEIY+mH7TdpUYcSLeWKM3voHxM4sla
	WN3tvzWw3bpDXp92ImpKpslCLWsawnjI121/M7r2yI6LLLnb20KzhxYZImPGvrM9wRSkawMwsUN
	medC7u+4ylBRlScEx5FIYuvNWFtaFPhh2a6QZEOQU7ahEYpvtnzt78Sw==
X-Google-Smtp-Source: AGHT+IHZNFdwNkAyt39hw1XEKeec2HDhjScGvIOI1PKKSdFRbVG0BYsnK8PrGv30KDcQUn6wPGJ2MA==
X-Received: by 2002:a05:6000:4028:b0:42b:3366:632a with SMTP id ffacd0b85a97d-42e0f355caamr1135311f8f.39.1764051341155;
        Mon, 24 Nov 2025 22:15:41 -0800 (PST)
Message-ID: <7984cbbd-905e-4e03-84fa-1cc2a1261a80@linaro.org>
Date: Tue, 25 Nov 2025 07:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] error: Strip trailing '\n' from error string
 arguments (again)
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
 <20251121121438.1249498-2-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-2-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> Tracked down with scripts/coccinelle/err-bad-newline.cocci.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/audio/es1370.c | 2 +-
>   ui/gtk.c          | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


