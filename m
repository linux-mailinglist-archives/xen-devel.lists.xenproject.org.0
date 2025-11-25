Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7FFC8479B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171795.1496816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqGU-00085c-T6; Tue, 25 Nov 2025 10:27:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171795.1496816; Tue, 25 Nov 2025 10:27:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqGU-000849-Pv; Tue, 25 Nov 2025 10:27:18 +0000
Received: by outflank-mailman (input) for mailman id 1171795;
 Tue, 25 Nov 2025 10:27:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNqGT-000842-PO
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:27:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ed43cbf-c9e9-11f0-980a-7dc792cee155;
 Tue, 25 Nov 2025 11:27:13 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so58677925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 02:27:13 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1df392sm246300905e9.1.2025.11.25.02.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:27:12 -0800 (PST)
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
X-Inumbo-ID: 4ed43cbf-c9e9-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764066433; x=1764671233; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bm82jX7XCCW7aCI+a8dons42tFjRYTNRDP+rtZdOHPw=;
        b=j7rV+PnDAJUaY4CRQ8o/nA810SbsGEQOt9VjfutkUfdC3ne1yYsM+E+/UJKJn7/Rbs
         6q0BmGfceV7TmWMwvFXYJeAplTPOPeGTSUT1Ehd1RuNgl+r+INrSw2r0iNTN9oImA8CM
         qoBgeFtVeAESP6t5SRA74ZIGn2HY2u7amIBvkyYqoHjKTi8vml2c3Ml5pL5zccjlTXnY
         VGxly3xfUFc0+PmIQGxTpyJwScGM1/DmrWkGgqWb0XdDX0bSR2VEGRb+gkdrnqdJuqQP
         thJqpsyuz75kWIYvA6eKtW+ye1b6dVvvVAD5rUgDRGXNwzblIAsvs+8CqFvaPTxI2AYh
         Y8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066433; x=1764671233;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bm82jX7XCCW7aCI+a8dons42tFjRYTNRDP+rtZdOHPw=;
        b=AkwRErgZVF3dYX5S5XarX6hwHRcXS8MqwHi9XnudnBRI5Kh72cCTDyY5sBbgz8XJGH
         hO8pRXBKLhcl+vsoqjTsUSXqQkTaHHjcT7XVGJ5FQYpQTI05Qd9yyN6ezNMKKcrL9zvR
         +SV658moiKtyR4W+bDJ/XBsNiHuch99z39YdPukfUaYeahWjOb/8LYSeyXr9U2n3wyIX
         xv58qLlVfhaymlwWcZpKchdCGn7tLlEEM3VkFQd3FzNhFImHLBnXY7kGDu+00UoEEDOi
         cxwem0xMFULlSgaNQXceQxHYfw5+HNVaoDnCFKh33frO2ac7ZLscc8Akvp8bCluW4TO+
         K99A==
X-Forwarded-Encrypted: i=1; AJvYcCVvFLtE5rr5j2AaqR0sLfVXKL1/BhfTwYl2zNGSBTdLdqZS5ekTzc5LU+8zvFGOZmNR/BP3YwOoufs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzwFyUzkNquh6egk74hDmDMZIrfkYzsRQrt7CbK10HNL/+EMVtz
	9kFXG9MzWL5KTueMLX7h4JOVlvvsIfbWE7o+TH3nhUVUG8XZSboBQaDM0RYbIy6f4VE=
X-Gm-Gg: ASbGnctMT6xeSMwOrIq8ZV9eUH30uBsoShMNQPTjmn+QeWAOw4YIWgGhcl3EZ1kF7Ll
	13oY8M/MVDcxLGEI0ZivEMRXho/p+wOpDQqno5Q1vS8kLfKXn3HlmOKAAJofXD1FoVv/ptNXWCk
	ejWTmUlq36dtYL2M/jrKSSnCCpRFJPSfr8kaBJraPvf247OKpqe0yaOVT9N/UF8INpcJ7W8YNa/
	QRO2p37xqOWSmqOHwcrfAImsU0YTzxkTxrIHoF5nP4vhEbDFPfp0D0eLNQYi+AbQzuQcstiFg/Q
	tH19/KzZBL1LQA9zH9KuNOEEXm4K5lMK34yibSJvLzgEgycy1rFF4518z/Pj3kj23G3arL10pHQ
	0u12N2aQv1X65Cxwh2W2+g5hecwwLg7lKesIspx3YYdLVkMoSN4HrcVGMWQHAVBAWFY17HDxNYG
	hXj5GBkSkRkvMiv5XYjnl8ny/tMPwcGKsk6ytgpExzLs98MLcGuVcLTg==
X-Google-Smtp-Source: AGHT+IGhbYTeSSFuslMqXUGJgEAmx4PJmp7EyajaFZpq/LfxEIoU4Z6Qn9frxs4dE4HLknKn1jcfKg==
X-Received: by 2002:a05:600c:3b1a:b0:477:55ce:f3bc with SMTP id 5b1f17b1804b1-47904b12f1dmr17118695e9.19.1764066432928;
        Tue, 25 Nov 2025 02:27:12 -0800 (PST)
Message-ID: <79407b6c-1161-4b08-877b-e215d2058a5d@linaro.org>
Date: Tue, 25 Nov 2025 11:27:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] hw/usb: Convert to qemu_create() for a better
 error message
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
 <20251121121438.1249498-3-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-3-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Markus,

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      open FILENAME failed
> 
> to
> 
>      Could not create 'FILENAME': REASON
> 
> where REASON is the value of strerror(errno).
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   hw/usb/bus.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/usb/bus.c b/hw/usb/bus.c
> index 8dd2ce415e..714e33989f 100644
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -259,10 +259,9 @@ static void usb_qdev_realize(DeviceState *qdev, Error **errp)
>       }
>   
>       if (dev->pcap_filename) {
> -        int fd = qemu_open_old(dev->pcap_filename,
> -                               O_CREAT | O_WRONLY | O_TRUNC | O_BINARY, 0666);
> +        int fd = qemu_create(dev->pcap_filename,
> +                             O_WRONLY | O_TRUNC | O_BINARY, 0666, errp);
>           if (fd < 0) {
> -            error_setg(errp, "open %s failed", dev->pcap_filename);
>               usb_qdev_unrealize(qdev);

OK, but why not update usb_qdev_realize() in the same patch?

>               return;
>           }

Similarly, I don't get why you updated this (and the following patch),
without also doing the similar:

  - qemu_chr_open_pipe()

  - qmp_chardev_open_file_source() and qmp_screendump()

  - s390_qmp_dump_skeys()

Anyhow, for this patch:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

