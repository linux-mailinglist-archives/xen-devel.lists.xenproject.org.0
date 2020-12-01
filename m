Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEF72CA4F7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 15:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42085.75653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6Lh-0000o7-Mx; Tue, 01 Dec 2020 14:09:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42085.75653; Tue, 01 Dec 2020 14:09:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk6Lh-0000nl-JX; Tue, 01 Dec 2020 14:09:45 +0000
Received: by outflank-mailman (input) for mailman id 42085;
 Tue, 01 Dec 2020 14:09:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Ars=FF=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kk6Lf-0000nf-HB
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 14:09:43 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6fd1b97d-6e24-4419-93f8-1ae1bd6afc8a;
 Tue, 01 Dec 2020 14:09:42 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 23so2812252wrc.8
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 06:09:42 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id o74sm3610645wme.36.2020.12.01.06.09.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 01 Dec 2020 06:09:41 -0800 (PST)
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
X-Inumbo-ID: 6fd1b97d-6e24-4419-93f8-1ae1bd6afc8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=TibSohplpJ5bFhrdsDRpd6q4R0TtXnEWtnbnXccrNtc=;
        b=oZlRvrP/o7tYG45nojNsCLtg9EOB6w7+VFnkK88EMJ6vKLnrqED5LXQ67qlEN/EqmQ
         qezRV5KMFDFezbhvact8gNFlm1WjZZs2x2dLa0F6QzKqYI7F00gCrrsk7ZbN1rfIQgG4
         XznHef4WDXBmYVzXEM6NJyZIEZokTbCypIXEvjGAvucD/nHmzXCWWd47Lo+9EloE5qNn
         0FEaNc2J47rGmaRpB0S31Ocnip8SvPlTkt5zAkP9ZSnoGQuBnq807qlfaIB1dt1sL7iO
         YDGRvHeaMP+Ho4gyJR7LHQzSIyWq/nPXb7VISASDQPrvLz4X97cgEkqHRU2BPhvcvJ7Y
         LURA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=TibSohplpJ5bFhrdsDRpd6q4R0TtXnEWtnbnXccrNtc=;
        b=pQO/MUOGGRwAo/88nKXMQaW0jUAIgPnViyUa7k563Jxct1u60mhPeiPPj24HMk5olU
         +lE4JoCHc2aWxSe48EPcvqqptaoXNBm8C2t8rySxRrhDsAH8Xw8KAM7PFuzGlZntsh/d
         qmbYn8Kg+QTP0LUopp/q0bR8p7LbKcmLurW02ze1KxY1t4tyojDVzPlsgwwmPd7xn15G
         kiDM6QVkYsm5csx3oPoJwYKZsueV/OlBV3i8C/3Tmr4Ilfp2cEKOqDszcxRPux7zqIcp
         rlQ95g9DfkA7Xfb59jV0x6y2sh+d5lAQLS/edZEoQ7nInkUGMQ8zRBL5DogPFkWIHh6t
         6jyg==
X-Gm-Message-State: AOAM530H+uavclMPQtrpastGBWKuI/a5QDJbzsrfGXsFWHcnYyI0g7Zf
	vqkt5BkCJRKJOhZy25KU2Ug=
X-Google-Smtp-Source: ABdhPJw/5t85SlZjv/mL74VhJ/rX9I+zWSSRDG0/wOD9MvNKVbm9GNNM0GGGaVXPbMMHQG2AMbnl6g==
X-Received: by 2002:a5d:4046:: with SMTP id w6mr4234417wrp.51.1606831781822;
        Tue, 01 Dec 2020 06:09:41 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Wei Liu'" <wl@xen.org>
Cc: <xen-devel@lists.xenproject.org>
References: <20201124190744.11343-1-paul@xen.org>
In-Reply-To: <20201124190744.11343-1-paul@xen.org>
Subject: RE: [EXTERNAL] [PATCH v3 00/13] viridian: add support for ExProcessorMasks...
Date: Tue, 1 Dec 2020 14:09:40 -0000
Message-ID: <001b01d6c7eb$9c6d0240$d54706c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIUz4Ho6g2LZ3vHphp6MrUkQEjyX6lmN4sw

Wei,

  I'll likely send a v4 to address the style nit Jan picked up in patch =
#1 but the rest should be stable now. Could you have a look over it?

  Thanks,

    Paul

> -----Original Message-----
> From: Paul Durrant <paul@xen.org>
> Sent: 24 November 2020 19:08
> To: xen-devel@lists.xenproject.org
> Cc: Durrant, Paul <pdurrant@amazon.co.uk>
> Subject: [EXTERNAL] [PATCH v3 00/13] viridian: add support for =
ExProcessorMasks...
>=20
> CAUTION: This email originated from outside of the organization. Do =
not click links or open
> attachments unless you can confirm the sender and know the content is =
safe.
>=20
>=20
>=20
> From: Paul Durrant <pdurrant@amazon.com>
>=20
> ... plus one miscellaneous cleanup patch after introducing =
sizeof_field().
>=20
> Paul Durrant (13):
>   viridian: don't blindly write to 32-bit registers is 'mode' is =
invalid
>   viridian: move flush hypercall implementation into separate function
>   viridian: move IPI hypercall implementation into separate function
>   viridian: introduce a per-cpu hypercall_vpmask and accessor
>     functions...
>   viridian: use hypercall_vpmask in hvcall_ipi()
>   viridian: use softirq batching in hvcall_ipi()
>   xen/include: import sizeof_field() macro from Linux stddef.h
>   viridian: add ExProcessorMasks variants of the flush hypercalls
>   viridian: add ExProcessorMasks variant of the IPI hypercall
>   viridian: log initial invocation of each type of hypercall
>   viridian: add a new '_HVMPV_ex_processor_masks' bit into
>     HVM_PARAM_VIRIDIAN...
>   xl / libxl: add 'ex_processor_mask' into
>     'libxl_viridian_enlightenment'
>   x86: replace open-coded occurrences of sizeof_field()...
>=20
>  docs/man/xl.cfg.5.pod.in             |   8 +
>  tools/include/libxl.h                |   7 +
>  tools/libs/light/libxl_types.idl     |   1 +
>  tools/libs/light/libxl_x86.c         |   3 +
>  xen/arch/x86/cpu/vpmu_intel.c        |   4 +-
>  xen/arch/x86/hvm/viridian/viridian.c | 601 =
+++++++++++++++++++++------
>  xen/arch/x86/setup.c                 |  16 +-
>  xen/include/asm-x86/hvm/viridian.h   |  10 +
>  xen/include/public/hvm/params.h      |   7 +-
>  xen/include/xen/compiler.h           |   8 +
>  10 files changed, 532 insertions(+), 133 deletions(-)
>=20
> --
> 2.20.1



