Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFCC84798
	for <lists+xen-devel@lfdr.de>; Tue, 25 Nov 2025 11:28:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171796.1496826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqGi-0008Mu-4L; Tue, 25 Nov 2025 10:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171796.1496826; Tue, 25 Nov 2025 10:27:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNqGi-0008K1-1A; Tue, 25 Nov 2025 10:27:32 +0000
Received: by outflank-mailman (input) for mailman id 1171796;
 Tue, 25 Nov 2025 10:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RmC5=6B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vNqGg-0008JJ-OX
 for xen-devel@lists.xenproject.org; Tue, 25 Nov 2025 10:27:30 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57761341-c9e9-11f0-9d18-b5c5bf9af7f9;
 Tue, 25 Nov 2025 11:27:28 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-429c7869704so4432880f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 02:27:28 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3a81sm34239083f8f.26.2025.11.25.02.27.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 02:27:26 -0800 (PST)
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
X-Inumbo-ID: 57761341-c9e9-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764066447; x=1764671247; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dsNRN3M7tLf1Kcxi1KCFkpYYf2qs5k6tXujcFgV5vT8=;
        b=sy4gl/lor/XIqUR8NDfilONua4ABBfg8bQfEgyrVApVJdaS/m0oP4W6hE7gJImI13h
         6L06t8jwoKjYQ4vRx+pR0iZ8dAkSmi3uWW9Yotkg3OhPBHQXcdVisorHEmkPPg2LrHT0
         rBaG4ffka4a8l9F4Y8Pd/KbMzcjGupM2fQjL1gQvWRg+iZDwTrpi0Kr2JyKhbejUMxQG
         S59hh6Z4d0RY6hs3bRC//vKTLld2iBo2fMHTY/zPH+DlUu5zDNA1YsbHPgeiLSao4sW/
         EzaamhbTBor4nLGSH2auo2iFk9ZI5MjlloGtLFbGUvkbeR8AXHO7FWGygkpN0tOPtdaY
         Tp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764066447; x=1764671247;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsNRN3M7tLf1Kcxi1KCFkpYYf2qs5k6tXujcFgV5vT8=;
        b=ITPIlu/3x/TqFsPIu4A1Kt+S1q1sBEiBKDOFJqm2fKi985/tHNNUqWDgk/+s3hPU0A
         RDOJkYGmLzmyHj9UurwbpRhe1U55ncXFDcUyYe9xTpdV/WnDq0cR9dRnyFDYIh4XJYJb
         Iu5ZkiPWSMFZVsampu/K8puCwRpdT52J9OcxOJAjaIeUpCb3hS6ZGWc/taIkIgdUx9KR
         VmwJsTan0eDUzTLhcWc0WFVl0PM4DjMyY9FhrNS4gD+Py4dT8iBSrOVtRikrBmHkdJRz
         gLfNV/pQNWKgTUknQTgC1k6gabAasnLUnAMi/9OzfEmRk4YHI+m/Bl+gMjmhW5VpjozU
         VMow==
X-Forwarded-Encrypted: i=1; AJvYcCUIi/4klWwxaT6mQNreTL42PE+g/iTDwkFZRI6DOYNPX+3Mmw5CbsBNeFbHYna//dswwqL67yTBtKM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcVhkYMTHwlQDMpqcTDoG2/gi6mnZFZXF2IoZMga9WJ2fTZ+jN
	rhGHVbjMQJwtKUM0A814FyLX+Gc5S7XokAn/15Og/AVdh2qon9V7yBUT1KcAY2khWyE=
X-Gm-Gg: ASbGncvaT7nfhNlHe0hLfRyKKpFXjDRAVn4GTsPgoju9Ov6lQ+4T8Pumct4xMOsKHBz
	w+igGhbiTVKB1arp9SsacD+F8mDjrVaXHX7RLboN+8cby2CUB+ImYJVfpOptg6gd3aUWfILFrQh
	xDmwsaMeAwSP16+bLgF9rxQHH8/Peit1apig71UOZYZxpFTVQbHOHS961AlL2LoZo+QaeTDH7/s
	2b3BAsgHksdDItwaUKmcS+z/ZfELQxrfu7qCUQtwdxJIokZmvI8s9t0PgnMXIE5djVDkqCUPS5j
	VIL8KfgE+myeHRXhG+BFHg7yY4QfulSgcHO/EcRIaHkxDPDX94N0ehk1JrCdx1/IyO8JD55ctSo
	O0LedqzhyPP6U24ztvs/OGFZsLjw+n28EslNSqtijDS7UbNTeoNLbFLikCshz+CVliJKq7Od5RV
	MqJyIkGmzNZD31k138/jG1eVY92M9TpUGedQJMT/VswUIf7vPTRv/o5Q==
X-Google-Smtp-Source: AGHT+IHKKU4ceMuaE95csztZcp8xaXOFHTU3Bea9HWqGWegeju5+IOQNhIe6zGPw+m52NYEXgQy3dg==
X-Received: by 2002:a05:6000:2dc3:b0:42b:2e94:5a8f with SMTP id ffacd0b85a97d-42e0f35913amr2072165f8f.52.1764066447520;
        Tue, 25 Nov 2025 02:27:27 -0800 (PST)
Message-ID: <f34353af-ebe5-4a43-9982-385b4113c983@linaro.org>
Date: Tue, 25 Nov 2025 11:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] ui: Convert to qemu_create() for simplicity and
 consistency
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
 <20251121121438.1249498-4-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-4-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21/11/25 13:14, Markus Armbruster wrote:
> The error message changes from
> 
>      failed to open file 'FILENAME': REASON
> 
> to
> 
>      Could not create 'FILENAME': REASON
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   ui/ui-qmp-cmds.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


