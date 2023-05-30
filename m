Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836E5715D4F
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 13:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541115.843503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xbr-0006sf-4X; Tue, 30 May 2023 11:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541115.843503; Tue, 30 May 2023 11:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3xbr-0006qO-1n; Tue, 30 May 2023 11:33:51 +0000
Received: by outflank-mailman (input) for mailman id 541115;
 Tue, 30 May 2023 11:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92F4=BT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q3xbp-0006qI-79
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 11:33:49 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7bfd15a-fedd-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 13:33:47 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4effb818c37so4667432e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 May 2023 04:33:47 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a19760c000000b004edc6067affsm316790lff.8.2023.05.30.04.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 04:33:47 -0700 (PDT)
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
X-Inumbo-ID: d7bfd15a-fedd-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685446427; x=1688038427;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O5s4uh8sDVmiJ4w7F3gfTmaWTiit5kb00LOcnxB2mCg=;
        b=Dk9x1ENcn8fxA149gt299gBx6F0Q3FT7HVra+wE+M9LKoC4SsmdNHBTQ+SuuG2HoJC
         kBW0paoYMTnRirbLqJQR1mNwJfwYUF2jVcnN0ZqZadTMorCJ7DwBWDakJ0W9XsliuuVs
         C85cfXyBHJLaqet6cE7+YEq74Rcq+NkJoHQeLybJMtkYzi9U/WS1GCaj6tdxB+U5qV41
         OFOu3HbwemBU+ewZR0KHTibr5weK4nsjPtiyJygnzKfuonYIMom99PFACOFS9J58M7xG
         QFaFpgHhdJRVEnQ4m8Q+K1Ct+ohxE16h98LLxIOdlPcAp+WRzngweWUjuCJAYPhat/vi
         GvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685446427; x=1688038427;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O5s4uh8sDVmiJ4w7F3gfTmaWTiit5kb00LOcnxB2mCg=;
        b=DnvfsEPJwwb5gtWGmvLBFzDrd20X224Ql37YmAYjgunNal4R6An0jB8Qlav+8Bgj7Q
         COL1mJYYRjU+VL6I2wiSNBke7sT0kFbRtrrSdXX767bDgu3kiYJevQK2Tc/ElF4aIQ+9
         3dbnHsH9S/pBGAozUPhkFSxhLPdrur5A4hl6KW60+BEjY7ePeDeicoTqVuYjX2fDauaX
         qT4CsAyORSHQFe+cYAoN2HJJYoPqk2MKKlfuUskM/bmBxrrv/9f1w0x9EyPwaMcu2Bao
         PSkarskiASwazOXnFnVXwScsA1paWsGv16w7wrgsYcjaZaeO2y8LsKTIr+z8/e7yee0N
         CFtg==
X-Gm-Message-State: AC+VfDy6w4c8PoUBjGTkBuMOXYvuNItziD5JbMT37ZYCXixzI1w+ryWF
	cndjrqebyQef0KWiuhnMbDc=
X-Google-Smtp-Source: ACHHUZ6PxfbFxMRqub82rITG0s3omp2+UeC0MUHLGK766MjEZjM1gQ0pImGHX1+gCVyIX5MZgYTxeQ==
X-Received: by 2002:ac2:4829:0:b0:4f3:a99f:1ea3 with SMTP id 9-20020ac24829000000b004f3a99f1ea3mr543442lft.32.1685446427192;
        Tue, 30 May 2023 04:33:47 -0700 (PDT)
Message-ID: <ee19fafb469490291127c8497251935849af61af.camel@gmail.com>
Subject: Re: [PATCH v9 0/5] enable MMU for RISC-V
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Connor Davis <connojdavis@gmail.com>,
 xen-devel@lists.xenproject.org
Date: Tue, 30 May 2023 14:33:45 +0300
In-Reply-To: <4a3ecfc7-45e8-842a-3e1e-24c7f7d6af15@suse.com>
References: <cover.1685027257.git.oleksii.kurochko@gmail.com>
	 <4a3ecfc7-45e8-842a-3e1e-24c7f7d6af15@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-30 at 12:23 +0200, Jan Beulich wrote:
> On 25.05.2023 17:28, Oleksii Kurochko wrote:
> > Oleksii Kurochko (5):
> > =C2=A0 xen/riscv: add VM space layout
> > =C2=A0 xen/riscv: introduce setup_initial_pages
> > =C2=A0 xen/riscv: align __bss_start
> > =C2=A0 xen/riscv: setup initial pagetables
> > =C2=A0 xen/riscv: remove dummy_bss variable
>=20
> While the series is now okay from my perspective, it'll need
> maintainer
> acks. I thought I'd remind you of the respective process aspect: It
> is
> on you to chase them.
>=20
I appreciate the reminder.

If I don't get an ACK from maintainers in a week, I'll send an
additional e-mail.

~ Oleksii

