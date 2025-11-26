Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F2C887DE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 08:47:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172337.1497418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAFN-0000Yq-E6; Wed, 26 Nov 2025 07:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172337.1497418; Wed, 26 Nov 2025 07:47:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOAFN-0000WI-Ar; Wed, 26 Nov 2025 07:47:29 +0000
Received: by outflank-mailman (input) for mailman id 1172337;
 Wed, 26 Nov 2025 07:47:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hTLS=6C=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vOAFL-0000Vt-TR
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 07:47:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 248a6187-ca9c-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 08:47:22 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42b3d4d9ca6so5219205f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Nov 2025 23:47:22 -0800 (PST)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7f2e454sm38740426f8f.2.2025.11.25.23.47.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 23:47:21 -0800 (PST)
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
X-Inumbo-ID: 248a6187-ca9c-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764143242; x=1764748042; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zsieY7w1fxjIpAfjZ3y4sG5vS6LVcOFLLmGd+GcbgpU=;
        b=Po1/L0Dt/blRdiA4NyCkqE9KTEIL/rOGJnS1m23DvNX4JrdoIpIqLNeksoqr1D0dbM
         toMXgMR9tCoJb8x0/Viofh52w/oJ24BUukL1jlBeC++qnLsNJb0B0Y0bWhpDYTLWINfm
         jhEm3OiMTTPjMqo5rlXzVjWNNFdkf3XhCosV6yJSATy0abOPboytNZ1uXPFJE71ulAeY
         lk7dLs3wB+P7H2mImVLtWe4vvx0SPWJzrcAh3x02/NfjceqXX0lG1T0udmaM6ll0mmOa
         gVKI1HqLYN0izRO4QAL/AV8KRM7oJgyu+bcHuBsdwSWLpTsqjdeBKyyhpvVJzE4sC+Mt
         VwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764143242; x=1764748042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsieY7w1fxjIpAfjZ3y4sG5vS6LVcOFLLmGd+GcbgpU=;
        b=qJfq2LAPHvxyAqo8XuucsWYeZr3znkiOLmWpMmeSRjuY7qNIoiVvJOHT8weBt5kriJ
         7TUtIj4Y78a8xB0suRC+1Kg6tporRIFdoA5L2P/xmm1nG20WoUk+kmHf2tCDLIDmLb/F
         Vt6ldd7N2ok/Y9NL/yKDhhpO3gy0iv/uRarHzgRcLdWNTezuqpHj99qPHI/NEHh0hVcf
         oieO/EYN9c+x9p8Ubf5ylH9RjgULgyrZX91hUv8xWrmIOlNN0o7aOocHe4s/47ndkVtH
         vX+HjWTasvBW31Y5SeB2RhLmtPGbs52HCP4Gp+Ugfwj/m4uozJI5Ms1APe2ukWMHroJZ
         sa4g==
X-Forwarded-Encrypted: i=1; AJvYcCX4Y28DClFh5pa600isPbcmJXVbdJcYaAQfLnQKqoeX5Awwb5/s3oL6Q30lriBjQRkpwWptP7IAUOQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOikIKpOwAgsOYZW3ZQFGm81bc3gAGSvhdgon45BcgIgT8oJJL
	E6j2t2n7H9uHMQEZFKZlSUCGDe068xXDYhLOflawj2AlMoO9dnfeIaXVDPpBFYYqEaE=
X-Gm-Gg: ASbGncuWJWKugkd5TuVgFcuNQG4WyIik2P15w6iqIc2Kc7WOfNLuEtlWA/Oq1+jlqzk
	S6MYvgP19zPYg6cJDHZU2Kl/2SiuJHqXbv4TjZvnbj5ZFO0BSGUnk1G53B+Zm5gwfpF4tLtQTXV
	xFs1v+dk67qTdPVAtk4pbcw52cOJGOxPPGZ+hCm2dryXb2f7DX0ctGdV8+1nJwyaEk7yzIjtItu
	3M6c82FJju7YKrgKcbXPKOXoeNhtwVUDL2uO+bMbXHVPIJy1lxDw2rotBKHiAuxOGR0s2n5BJBM
	Wn/TmmSp8WTdP5UnM2lSip1DCQYysKqtqD4VXtJBd3Is2q1MiSRGiml7fGrYE6pckKHG6G2g4y4
	5GP2jOBjYYpJJyvChQOnSxyAMl2P8jyylwJkQWL733YCV116Lp3aaK4Rvy3nkPf3uOhxFg7E2Ix
	J1+scY+3v3CTgEF+sng2UjpAqolZGkffpjJmTDegwUiCJ0g7IEuZdx2w==
X-Google-Smtp-Source: AGHT+IH2GXe3uOHdS28Ob+Jmg5+KHh4tMhOG/Rv+GpKOzuevWPWxYjVQGr2hWKaJgLZVaJdz6qu+XA==
X-Received: by 2002:a05:6000:2681:b0:429:c8e4:b691 with SMTP id ffacd0b85a97d-42cc1d5239amr18461831f8f.55.1764143241928;
        Tue, 25 Nov 2025 23:47:21 -0800 (PST)
Message-ID: <2bed91d0-8574-42ee-8d7d-e85f3ae40c1f@linaro.org>
Date: Wed, 26 Nov 2025 08:47:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] Error message improvements
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
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251121121438.1249498-1-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/25 13:14, Markus Armbruster wrote:

> Markus Armbruster (15):

>    hw/usb: Convert to qemu_create() for a better error message

>    hw/scsi: Use error_setg_file_open() for a better error message
>    hw/virtio: Use error_setg_file_open() for a better error message

Queued these 3, thanks.

