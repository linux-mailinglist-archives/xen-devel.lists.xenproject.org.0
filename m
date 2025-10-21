Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B911BF68FE
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 14:54:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147140.1479403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBBri-0006C1-20; Tue, 21 Oct 2025 12:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147140.1479403; Tue, 21 Oct 2025 12:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBBrh-0006AO-Vc; Tue, 21 Oct 2025 12:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1147140;
 Tue, 21 Oct 2025 12:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1L3Q=46=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1vBBrf-0006AF-OE
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 12:53:23 +0000
Received: from mail-yx1-xb130.google.com (mail-yx1-xb130.google.com
 [2607:f8b0:4864:20::b130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec7ba834-ae7c-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 14:53:22 +0200 (CEST)
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-633c1b740c5so5367214d50.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 05:53:22 -0700 (PDT)
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
X-Inumbo-ID: ec7ba834-ae7c-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761051201; x=1761656001; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuSNCsRv/59+EAgZl2384UmefgwetvdfFm3jSW4yRDA=;
        b=apjHEYcICWm17qUH6OxQ5ySMAFD1gkosK2/oTaxnFuETIVo7hgbBG8nElogumAkkuy
         e5bIsgOLUq/yDaFcJ4gjEh7/slSd9fSH1C0mkKipFSsQ1lpQXuF1fr1BNLJwK5XIQh6G
         o7NiXZc3BVE2paxScDxaMB9kxTFqfC4xx3oa6tZ+xj+vSfK3S2q4MXcRJw7HDp5FhNPE
         A1zArpxwgjhIKTid/8yjocMHgG/GLrPNZjNNd3PnmRqVJNJ3bkLV92vu1HQfHPEQafAK
         dU4ol+ilFwSi/vV1Kq07iWwALEjZ95xbA9F9Gxai40CsbwYNxHWbKdrYtLkwK3KsK0hz
         N5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051201; x=1761656001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuSNCsRv/59+EAgZl2384UmefgwetvdfFm3jSW4yRDA=;
        b=IXwjk7LGBZEgeMmMGV7UepradIPPsVnQjqeYpZ6BQLfrFRk+VsjUah5SI2Hen7mOdA
         cmSpxS3j3/58NZSOACkXZa7Gw2aBChViRkPRd94CwhiOY/laayLEWlyUHmtRawyHpeV2
         mUMv/mDIZG/wJWf7RlNKDCZobv9kxt7eXqHvkRiEWuKvur+R0DFPhBehryNrlvsDvOuk
         afTKZEvTx/SQb1jd+Q1/BoUNYRxGFwTemvxgIXjNhLZuIieFy+h3s6s7Viz62/PayC/M
         bfD5dGchfSSDiP3U9WcTSgxWvQWSZaiOo80Yo4WMumKGzW0oanCu1Q6VO/3kRdhoBVSS
         tZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCW2qVU2mb1+yYDKEpHdu4SsR9NKutEaWhparh/tBSTRGylHK6pMpJA/KgH4NROnjwoEa+A+7I/uNcE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrZOWYRR08FS1HCSob+AqRvfV4ALWzEDa3X7fl2BVQzZTL9066
	ZrkQ+UKVplSq33WEL2kQy9M/gzdoREIvzRhi7CElT5zN6Qec9CmaBHh/Uc3IGUNsAwsGG39BBmF
	rC5zobILZXaXi2QUuI3MVxsIALnhEDso/gXAKQaeXTA==
X-Gm-Gg: ASbGncvwDw6Kh/FHg0+Cd0OCSkgHQaAs1aR0s4WfrRJCBj8nTSvj1EZ+WLv4KVGhAXM
	qA7rTvmINCJmExOMa0k3ejVgmkuF5EvTywSEBn8EFMcnuk7eRsrsEzDTUtuQDAxjNtqQ41044fI
	8FMIdErKBPRKrt3YiVTk6rVxKL//DFjNx8xtiXi2UQf7ihMxtfgwTtbyMqeCsBLUgqkh1IT4VPy
	4aAs41VOYNAaIgLV8N8W7R5cXbkK1F6sLOoH1bQj8nsJdhtKHSRnx+G7T8wQ2clZsmCwT7EBy10
	UWw42bg=
X-Google-Smtp-Source: AGHT+IFpbT82ve3LXltYZEPsfJS+RyLmbXt+5DVAMiKWeQCDlh+pMWALlMmxIYO912MM0kwsJVP4r1RcRcCjaeA4YeU=
X-Received: by 2002:a53:acd9:0:10b0:63d:7ac:b991 with SMTP id
 956f58d0204a3-63e16179374mr11700457d50.5.1761051201041; Tue, 21 Oct 2025
 05:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251021122533.721467-1-marcandre.lureau@redhat.com>
In-Reply-To: <20251021122533.721467-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Oct 2025 13:53:09 +0100
X-Gm-Features: AS18NWCp0ty09wq1HmsCT7-iy0cpel_3YH3JRfs8VpJn1hbNoYoCwcqrR0HZzqM
Message-ID: <CAFEAcA-jPE_onLYLMxgcAOB7dWRXOLJrWcGPnR0NUdjYytPDVA@mail.gmail.com>
Subject: Re: [PATCH] char: rename CharBackend->CharFrontend
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, 
	"Michael S. Tsirkin" <mst@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"Gonglei (Arei)" <arei.gonglei@huawei.com>, Zhenwei Pi <pizhenwei@bytedance.com>, 
	Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
	Stefan Berger <stefanb@linux.vnet.ibm.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
	Frederic Konrad <konrad.frederic@yahoo.fr>, Alberto Garcia <berto@igalia.com>, 
	Thomas Huth <huth@tuxfamily.org>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Yoshinori Sato <yoshinori.sato@nifty.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>, 
	"Collin L. Walling" <walling@linux.ibm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Alistair Francis <alistair@alistair23.me>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Corey Minyard <minyard@acm.org>, 
	Paul Burton <paulburton@kernel.org>, Aleksandar Rikalo <arikalo@gmail.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Weiwei Li <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Samuel Thibault <samuel.thibault@ens-lyon.org>, Michael Rolnik <mrolnik@gmail.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>, 
	Vijai Kumar K <vijai@behindbytes.com>, Samuel Tardieu <sam@rfc1149.net>, 
	Gustavo Romero <gustavo.romero@linaro.org>, Raphael Norwitz <raphael@enfabrica.net>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "reviewer:vhost-user-scmi" <mzamazal@redhat.com>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Fabiano Rosas <farosas@suse.de>, 
	Markus Armbruster <armbru@redhat.com>, "Dr. David Alan Gilbert" <dave@treblig.org>, Zhang Chen <zhangckid@gmail.com>, 
	Li Zhijian <lizhijian@fujitsu.com>, Jason Wang <jasowang@redhat.com>, 
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Helge Deller <deller@gmx.de>, 
	Max Filippov <jcmvbkbc@gmail.com>, Lukas Straub <lukasstraub2@web.de>, 
	"open list:Sharp SL-5500 Co..." <qemu-arm@nongnu.org>, 
	"open list:S390 SCLP-backed..." <qemu-s390x@nongnu.org>, "open list:sPAPR (pseries)" <qemu-ppc@nongnu.org>, 
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, "open list:virtiofs" <virtio-fs@lists.linux.dev>, 
	"open list:Rust-related patc..." <qemu-rust@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> The actual backend is "Chardev", CharBackend is the frontend side of it,
> let's rename it for readability.

I always thought the "frontend" was the device the guest
saw (the 16650 UART or whatever). invocation.html has bits
talking about "virtio hvc console frontend device" which
seem like they also use that terminology.

If we want to clean up the naming it might be helpful to have
a comment somewhere documenting the different components and
what names we give them and how they fit together (or even
better, something in docs/devel/...)

thanks
-- PMM

