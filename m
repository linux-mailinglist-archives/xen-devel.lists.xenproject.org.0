Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9430226C02F
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 11:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kITRQ-0004mC-Fc; Wed, 16 Sep 2020 09:09:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7lL=CZ=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kITRP-0004m6-L4
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 09:09:27 +0000
X-Inumbo-ID: 1272d985-ca21-4259-aaaf-cea070b9f2a2
Received: from mail-wm1-x335.google.com (unknown [2a00:1450:4864:20::335])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1272d985-ca21-4259-aaaf-cea070b9f2a2;
 Wed, 16 Sep 2020 09:09:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z9so2170155wmk.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2020 02:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=QC2bejcVfxSzRRo09ZWT1WGfUowvUQEDn+inezqWDAo=;
 b=AMxq1rWjjg8II3M8pZbRiqdvWq7c86tAYzlOV1mUoToy2rtST3eJVmeEz54JUMELpg
 n/cLHC6ALr8eyBXKu1zq16ZHKyjwl6/kme0cAdsturKlI25Y5H5RYQqlqfCYfEfuNnGH
 beicFBEPPPVaDePVlc9YlcUzMXRxF0T2ZVFvTX7Lt+4mj5bz2BaWeIp2eHWJNRAe96j2
 CQO3O4X7npBbyyD1ILyxP0spHgAM8VTfKwHm4N6EeNJedeWltjFri/TXf4mU4gpxHzId
 6fpLZKe/una/7V0+e6EumCc3U92HTm2a07Ej8S+FhndylioRwDN9WY8P1/JbtI8T//bL
 sgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=QC2bejcVfxSzRRo09ZWT1WGfUowvUQEDn+inezqWDAo=;
 b=cL3BAM1lGQPo5pq9P1t5LNjdlrnyqBF2/0Hs2Ke8ZdgO2SRdWyHPAxqIWdiw/0xjY7
 /ChJh5HprasrfadhYs3SK9PzpYbnWZxmWxeN0Ur9YxxThl1eLdJkj+dgb57gGNWcIgRD
 cIhxcDOwFM38deikGA2UJKMBQgIwdklnXvum1HjXApiN7LmPCSpvg0PcQNOWjrdYruAl
 VqSvDfMPOV95gT64c2OWg3+ggLN0P94YYL9FWmukNLzOV3BI6YYHQST6NtzA4UXpP785
 nR/C2xpuygYu13eqjMAf1VcailyCIqTKaLD/ZdAk/WWCXJaQ/qzu5IMeiwLP1Plo4Cew
 OVvQ==
X-Gm-Message-State: AOAM532panDVoNp3pEuFyDwci6oefLvwH2VuUr6EVw7O05cZU7jJ3aLr
 qUfjw/ucGBaE960K7MId964=
X-Google-Smtp-Source: ABdhPJwdrXPZfCzmNm6vkuRsAaTb//Y5L4siM72Khb5o4Z7oG8rVa24EW0YW8Xt8/j3oj9gS6CgMIw==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr3571472wml.176.1600247365908; 
 Wed, 16 Sep 2020 02:09:25 -0700 (PDT)
Received: from CBGR90WXYV0 (host86-176-94-160.range86-176.btcentralplus.com.
 [86.176.94.160])
 by smtp.gmail.com with ESMTPSA id n10sm4400401wmk.7.2020.09.16.02.09.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 02:09:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>, "'Jan Beulich'" <jbeulich@suse.com>,
 "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>
Cc: <xen-devel@lists.xenproject.org>,
 "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>,
 "'Julien Grall'" <jgrall@amazon.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-15-git-send-email-olekstysh@gmail.com>
 <44b19ee1-dc34-3a46-0b4b-7196faadcb5c@suse.com>
 <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
In-Reply-To: <c87089d5-39d2-55e6-5539-97af32c3d6cd@xen.org>
Subject: RE: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead of
 cmpxchg()
Date: Wed, 16 Sep 2020 10:09:24 +0100
Message-ID: <002b01d68c09$12df32a0$389d97e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQIQ4beZ3sUmYihKXwfoVgy4BRIJGwM3mpe2Aj4RmJECjTcXV6i2NzPg
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 16 September 2020 10:07
> To: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko =
<olekstysh@gmail.com>
> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko =
<oleksandr_tyshchenko@epam.com>; Paul Durrant
> <paul@xen.org>; Stefano Stabellini <sstabellini@kernel.org>; Julien =
Grall <jgrall@amazon.com>
> Subject: Re: [PATCH V1 14/16] xen/ioreq: Use guest_cmpxchg64() instead =
of cmpxchg()
>=20
>=20
>=20
> On 16/09/2020 10:04, Jan Beulich wrote:
> > On 10.09.2020 22:22, Oleksandr Tyshchenko wrote:
> >> @@ -1325,7 +1327,7 @@ static int hvm_send_buffered_ioreq(struct =
hvm_ioreq_server *s, ioreq_t *p)
> >>
> >>           new.read_pointer =3D old.read_pointer - n * =
IOREQ_BUFFER_SLOT_NUM;
> >>           new.write_pointer =3D old.write_pointer - n * =
IOREQ_BUFFER_SLOT_NUM;
> >> -        cmpxchg(&pg->ptrs.full, old.full, new.full);
> >> +        guest_cmpxchg64(d, &pg->ptrs.full, old.full, new.full);
> >
> > But the memory we're updating is shared with s->emulator, not with =
d,
> > if I'm not mistaken.
>=20
> It is unfortunately shared with both s->emulator and d when using the
> legacy interface.

When using magic pages they should be punched out of the P2M by the time =
the code gets here, so the memory should not be guest-visible.

  Paul

>=20
> For Arm, there is no plan to support the legacy interface, so we =
should
> s->emulator and we should be fully protected.
>=20
> Cheers,
>=20
> --
> Julien Grall


