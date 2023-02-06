Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC5668C28B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 17:09:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490581.759348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP43X-0001qM-4i; Mon, 06 Feb 2023 16:09:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490581.759348; Mon, 06 Feb 2023 16:09:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP43X-0001oC-1Y; Mon, 06 Feb 2023 16:09:23 +0000
Received: by outflank-mailman (input) for mailman id 490581;
 Mon, 06 Feb 2023 16:09:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K59t=6C=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pP43V-0001o6-Nf
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 16:09:21 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c974987-a638-11ed-93b5-47a8fe42b414;
 Mon, 06 Feb 2023 17:09:19 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id h16so10845219wrz.12
 for <xen-devel@lists.xenproject.org>; Mon, 06 Feb 2023 08:09:19 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 o7-20020a05600002c700b002be5bdbe40csm9826652wry.27.2023.02.06.08.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 08:09:18 -0800 (PST)
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
X-Inumbo-ID: 9c974987-a638-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xFsZzbiGJaBKLs/rFiMkljY9r+p3AVj/m6uaTSmp/nA=;
        b=k7C4ba208ZbOa2+Cdojg4SlTdP2Twwvb3aCSd5f+0v8tgAafYTaagvX9atSIYIFBsW
         Ndqt9GqxIL8wE0erV3bwCwW7gV6kIM5lQEQ6H//WNHDQqHDuGaU1OcInGeelH++v4z2H
         OOhRoE/9Uuv032yS63ay4GrEUPO2k75WleuBbkrXxNytimoq9bryVwUqEXH8A1IqigjR
         2Q79tzEaEcQTdTVkTTnx0+YyPPOVfPyMLVaPIbqb5k3jKWFCJQanxMgkTKoGgGqw5tiS
         tW8VvmpqPKRtCjw4paNUsECsz186nLrJL0hlK2vSp475dKMoRRvMMqootgrcYRyCndqM
         nHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFsZzbiGJaBKLs/rFiMkljY9r+p3AVj/m6uaTSmp/nA=;
        b=RlpckSt8zBdU1oYIaD2UAUcdbMiOTJzpwHuJtEVg7zPn4znyek0Nb5C8IELVQPCNBL
         1QEir+f8s2Vt7h1LOSB3wf0Hc1omWQmceIrmKiSXSt+hxuSRr/denh/ZmO8lLB1exuX6
         +SK3C9LANWNBrK2UGH+Fnxg+V9+jwBsgdC7x2kDrYE709qi0RyltYV/O2vL7Oi8MfP9D
         41uTa/iwsT/P3EF/MxIWAJVJ+3gHpee7yqdbmjDlsd4zUk6rqJaSTbN6WyjOcXA+NLLE
         j/EGBEnPY94+rSIWlZEHtjRMW7OUnWXCVjy6Ggf0VCbrbDETAS+ZiQVWxLEYrMUBXzvE
         G88w==
X-Gm-Message-State: AO0yUKU9hORDy8epk7SCrDjnH4u/eReOjAxYmgQYJWYheEtW7J7MEk4B
	cBwLDc+jaOEEhANdIjuur6A=
X-Google-Smtp-Source: AK7set/YK1kfkBko1SP0df3Zb9yhuvDHn1wSrJOt9mjjmRn8Kv55bYenT3715SNxdosUUW4Qjm2EeQ==
X-Received: by 2002:adf:e4c1:0:b0:2c3:f06f:850c with SMTP id v1-20020adfe4c1000000b002c3f06f850cmr946866wrm.31.1675699759036;
        Mon, 06 Feb 2023 08:09:19 -0800 (PST)
Message-ID: <7b22356adb84e32601b82985cd526e9bc050dacd.camel@gmail.com>
Subject: Re: [PATCH v2 01/14] xen/riscv: add _zicsr to CFLAGS
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>, Alistair Francis <alistair23@gmail.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Gianluca Guida <gianluca@rivosinc.com>, Bob
 Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>
Date: Mon, 06 Feb 2023 18:09:16 +0200
In-Reply-To: <1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com>
References: <cover.1674818705.git.oleksii.kurochko@gmail.com>
	 <971c400abf7f88a6be322db72481c075d3ceb233.1674818705.git.oleksii.kurochko@gmail.com>
	 <CAKmqyKNSywyF8=KUTiKN12JL_Bst5if74h6mgek1aMYS1QpjeQ@mail.gmail.com>
	 <1d63dd9a-77df-4fca-e35b-886ba19fb35d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

Hi Jan,=20
On Tue, 2023-01-31 at 10:14 +0100, Jan Beulich wrote:
> On 31.01.2023 01:21, Alistair Francis wrote:
> > On Sat, Jan 28, 2023 at 12:00 AM Oleksii Kurochko
> > <oleksii.kurochko@gmail.com> wrote:
> > >=20
> > > Work with some registers requires csr command which is part of
> > > Zicsr.
> > >=20
> > > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> >=20
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>=20
> There is an open aspect Andrew has pointed out on an earlier version.
> I think it would be quite helpful if that could be settled one way or
> another before this patch gets committed (which formally may now be
> possible, depending on whether that open aspect is considered an
> "open" objection, as per ./MAINTAINERS).
>=20
I will change it to 'G' as Alistair doesn't see any sense to restrict
ourselves:
https://lore.kernel.org/xen-devel/CAKmqyKOecoz91e-4-KZUdgT5HNhuwuN83tpFR+Hm=
wkUPb2r3ew@mail.gmail.com/

> Jan
~ Oleksii

