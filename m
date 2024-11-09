Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 156339C2AB5
	for <lists+xen-devel@lfdr.de>; Sat,  9 Nov 2024 07:38:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833068.1248338 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9f74-0008G5-AV; Sat, 09 Nov 2024 06:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833068.1248338; Sat, 09 Nov 2024 06:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9f74-0008EL-7m; Sat, 09 Nov 2024 06:38:26 +0000
Received: by outflank-mailman (input) for mailman id 833068;
 Sat, 09 Nov 2024 06:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JlmF=SE=gmail.com=th.huth@srs-se1.protection.inumbo.net>)
 id 1t9f72-0008EF-VL
 for xen-devel@lists.xenproject.org; Sat, 09 Nov 2024 06:38:24 +0000
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36b78648-9e65-11ef-a0c6-8be0dac302b0;
 Sat, 09 Nov 2024 07:38:22 +0100 (CET)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5cecbddb574so3455731a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 08 Nov 2024 22:38:22 -0800 (PST)
Received: from tpx1 (ip-109-42-51-55.web.vodafone.de. [109.42.51.55])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7e803sm2718538a12.22.2024.11.08.22.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 22:38:20 -0800 (PST)
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
X-Inumbo-ID: 36b78648-9e65-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4yMDguNTIiLCJoZWxvIjoibWFpbC1lZDEtZjUyLmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjM2Yjc4NjQ4LTllNjUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMTM0MzAyLjA2MDk1OSwic2VuZGVyIjoidGguaHV0aEBnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731134302; x=1731739102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yh9OIV9oZswSsFPCTF0kPB7VF1ucoQK7O4BeLuZMrcY=;
        b=UOKp7ODy2o8iFqs7iIQ/9HXzzWjyHqYeo5+5RiJvQO9ZfYSDGCel5QNvCdNfZJ06HD
         ilTJxl6pyjluK/XRhF4X6fWktJrkh9Fb/hRf32fupiBm9esGaJSpMnJK0uZUOeUGQ1Uy
         bRexuKo06unXTSiQT65DrgVNMyzJc3eC8rxYOYC9UpZja/FWRw8HqFD8bJYvtpkTHJxt
         XWoCOZS3HuJ/5dXfDd2HJd+n/kjDkxSlCrX4/GVjB5boDzGighnLK3JlpyFd3v4Amyor
         2apNyAytfr/3TMA9rPZbxZjp4KDpedMi4mX7xqZmEIrAA++9m9yX62eOfOkVSfLy+WR+
         6TUA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNwnnFSD2cy7X20+JMYq4IMgHZhA5AdNFtAATWhPXJcGPrP4nfeRXPtose9iQq6UCM046cN6ecXE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwVI40DdpUSGUC3YqF9eWxw34QA8Ogh3iKBPu/XzFtJ79yf7cMR
	X/u3NdzitOeMp8M+tjzNmPvLycNe22OVKwBZBHKNLmdEF+iNPZ25L7yHrHhf
X-Google-Smtp-Source: AGHT+IHPajL9uDCipqaoWRFvEDIWChGJwvUQQ3wq/EqOC6SQN31/8hSCkCC0GORuyRX1TGgUbym+oA==
X-Received: by 2002:a05:6402:1ed4:b0:5ca:14f3:2883 with SMTP id 4fb4d7f45d1cf-5cf0a2faec8mr4822397a12.4.1731134301339;
        Fri, 08 Nov 2024 22:38:21 -0800 (PST)
Date: Sat, 9 Nov 2024 07:38:17 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>, xen-devel@lists.xenproject.org, Paolo
 Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Anthony PERARD <anthony@xenproject.org>,
 Eduardo Habkost <eduardo@habkost.net>, Jia Liu <proljc@gmail.com>, Stafford
 Horne <shorne@gmail.com>, Paul Durrant <paul@xen.org>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/5] hw/tricore: Mark devices as little-endian
Message-ID: <20241109073817.40177d87@tpx1>
In-Reply-To: <20241106184612.71897-3-philmd@linaro.org>
References: <20241106184612.71897-1-philmd@linaro.org>
	<20241106184612.71897-3-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Wed,  6 Nov 2024 18:46:09 +0000
schrieb Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>:

> These devices are only used by the TriCore target, which is
> only built as little-endian. Therefore the DEVICE_NATIVE_ENDIAN
> definition expand to DEVICE_LITTLE_ENDIAN (besides, the
> DEVICE_BIG_ENDIAN case isn't tested). Simplify directly using
> DEVICE_LITTLE_ENDIAN.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/tricore/tricore_testdevice.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

