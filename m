Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DD813676
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 17:40:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654703.1021926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoky-0004Cl-UC; Thu, 14 Dec 2023 16:40:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654703.1021926; Thu, 14 Dec 2023 16:40:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDoky-00048n-Pm; Thu, 14 Dec 2023 16:40:16 +0000
Received: by outflank-mailman (input) for mailman id 654703;
 Thu, 14 Dec 2023 16:40:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=McK7=HZ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rDokx-00048g-0r
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 16:40:15 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7494e660-9a9f-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 17:40:14 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2cc3f5e7451so18867361fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 08:40:14 -0800 (PST)
Received: from [192.168.220.211] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a2eb0c4000000b002ca35adea10sm2167220ljl.15.2023.12.14.08.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Dec 2023 08:40:13 -0800 (PST)
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
X-Inumbo-ID: 7494e660-9a9f-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702572014; x=1703176814; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JRy2ITIZLne8uh+U7lI4/2fjdiedROs7l88bSv7nTOM=;
        b=kEPCnwU5NWxqPKS9FF59x3KQ9e3HtM/fmFMNDVPTzP/CX/CPBK/oJxYXUpc2p53scn
         qQnpS68IaqfW4PDeO7t3f5KxhBLyEWVQuu9L+rXuTipfo0XnKy5OSOcAdVco0omgON93
         nHV3pHP19bNWs6vqLcM6Mrl5iKw4DeosbXTjumPGaocIV7vi9TSZ+BFQAunr/3zoHF8k
         qJvR3hCagsEG+A8w0/p85RfELKKaXRBpd8YtDJY2OCbiBzrWV65jbX/yY6ik/FiFKUl+
         uF0VNGT3Msdh1imIyUwb6a/9DrSHlKxMd10c+y2b5lGecXgWreq67vwJRosU/5CTY9K+
         xQQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572014; x=1703176814;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JRy2ITIZLne8uh+U7lI4/2fjdiedROs7l88bSv7nTOM=;
        b=wOrdqKSSg1mQ7VhJ5MdrCElMMTCZl2RW7DvFZsaXXw4qbWJyz0taZ/T+f9EW7IN5bZ
         6GCHBvBLtqhgMrOmDh03AybBHWFh5ZgAo/gymRCUYcmWMRr4XlPafbpUwUNVlZF31WbL
         /sPZiO2g4Mk01bXsCPZ1iRWU2TmXhdJryVXEyGKlVGZwoAG9IFVqiGELZjdCJl95LUiX
         1DT9jYWCd+LJgSMknBrOayOnBnisagAKJ1eoNVAamjzHHHBIGriAVRPX0+2WJkfz7qRF
         bAditiROZavsuxMv8mrwrniSITr15lJKOhKL4LA46UPOD+G0G8bNXVLYjNruAebGPOwW
         lu6Q==
X-Gm-Message-State: AOJu0YyP1DEX6wRfnnZbA+eBVktEx2mD0afR27NKu9hlMzhvMJNKX2re
	ou04wXfqNIzIGjLXQmBNbV8XVnS1P/WekA==
X-Google-Smtp-Source: AGHT+IHTgWo613m3oZZ6/Bm5zWWLKKuWtDQYIGZeWFasYjYph5IGCMm89hLIfemAKmOn7788W/3vwg==
X-Received: by 2002:a2e:b74b:0:b0:2cc:2fb2:c3a4 with SMTP id k11-20020a2eb74b000000b002cc2fb2c3a4mr2159499ljo.53.1702572013507;
        Thu, 14 Dec 2023 08:40:13 -0800 (PST)
Message-ID: <54981058256b8edf4c735e82960d90d6aa8df99a.camel@gmail.com>
Subject: Re: [PATCH v2 39/39] xen: fix compilation issue of serial.c
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Thu, 14 Dec 2023 18:40:10 +0200
In-Reply-To: <7150b1fb-5deb-4d4d-9de1-fd5abb18ca3d@suse.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
	 <6e1f19de1e8a276d487e8517810da3e8e68104ff.1700761381.git.oleksii.kurochko@gmail.com>
	 <7150b1fb-5deb-4d4d-9de1-fd5abb18ca3d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Thu, 2023-12-14 at 17:24 +0100, Jan Beulich wrote:
> On 24.11.2023 11:30, Oleksii Kurochko wrote:
> > The following issue occurs on RISC-V platforms:
> > drivers/char/serial.c: In function 'serial_tx_interrupt':
> > drivers/char/serial.c:88:9: error: implicit declaration of function
> > 'cpu_relax' [-Werror=3Dimplicit-function-declaration]
> > =C2=A0=C2=A0 88 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu_r=
elax();
> >=20
> > cpu_relax() is defined in <asm/processor.h> so it was added
> > an inclusion of the header to serial.c.
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Acked-by: Jan Beulich <jbeulich@suse.com>
>=20
> I think this needs moving ahead at least by one patch in the series,
> but I guess I'll put it in ahead of most of the rest anyway.
Thanks. I'll moved it.

~ Oleksii

