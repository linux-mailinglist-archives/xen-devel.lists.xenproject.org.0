Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BCB2CE984
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:26:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44117.79093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6Pm-0002qR-D4; Fri, 04 Dec 2020 08:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44117.79093; Fri, 04 Dec 2020 08:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6Pm-0002q4-9k; Fri, 04 Dec 2020 08:26:06 +0000
Received: by outflank-mailman (input) for mailman id 44117;
 Fri, 04 Dec 2020 08:26:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2IQI=FI=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kl6Pk-0002pz-TM
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:26:04 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 545975b8-69c6-4cf9-9ac7-5d3d1e285600;
 Fri, 04 Dec 2020 08:26:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id i2so4443859wrs.4
 for <xen-devel@lists.xenproject.org>; Fri, 04 Dec 2020 00:26:04 -0800 (PST)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id g184sm2329176wma.16.2020.12.04.00.26.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Dec 2020 00:26:02 -0800 (PST)
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
X-Inumbo-ID: 545975b8-69c6-4cf9-9ac7-5d3d1e285600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=6F6qkA6GyOCTVIrdg0AwkS09cXyFrJLXka5HfjpHUdA=;
        b=BoM8jnz05PIXfwbGOaPdzyn/bbit34cln3c6eF/aK+dGbMD1SozdPWAdRCs2i/JwLS
         TgXz8vJLLvJmP2ALwiDP6t86v3L0FGg2ywD3KhKt/t4sj/+ZRQOnQoJZ8JWf8L6ute72
         gJOEt29TZaTJ/CYloUM9Rc53xrOZC6ssIIua+f44qoic5oBJIp9zpwy7mnW3Tw8nmTDm
         vCDisr2fRy9g2iGRMNojEK6s1NWj4hnH2dB7ExO7yJO9n9oMq9ol3ksf/O4hJq5XWIKT
         Xxpreqkhp3sS9IzZ2FlGyNZKq3ChKxj3dH5dtDyur7XCNtsc/zPs4vDzGm+9FwvfRdVS
         LLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :content-language:thread-index;
        bh=6F6qkA6GyOCTVIrdg0AwkS09cXyFrJLXka5HfjpHUdA=;
        b=hLadQg1+R1dL9fI7pD/gudVaVPEf4z9rbbc0VD/mue0jIMGm1X+8leqlG622DRCWeZ
         1x7HbOThx7jlgne1z42Y0uUy1093NgMJd7YnN2nG+4TBgShC2Hg8LRb1FFOdiFqumyJ7
         t/ru0myeNmYRTOi6Us/J/nBloo3Fky/D/c4AD55+X8IeAEmFQKHVeDJU8MNsA9kCCwIQ
         g/FzlTDvBxLGlSe/H4gXa7iPmTPX3aJk3lm0Sk2dtWagMVnDVWRSKyK1OzsJszPJpsob
         NnAS7ykfjLA312a1/C+m84F+HEIDRz1enxwfHZGgm8H0Qh+fibyAXlR8zKteh+Lm3zDM
         n3+Q==
X-Gm-Message-State: AOAM532tMlkUv2zs1KXWJ/k5ZQlk60T+KQWHF0ymnrTxs2YkjBhHH69n
	BlXYS7lfSeBfLvd5k/H9or8=
X-Google-Smtp-Source: ABdhPJwWA+FWVX2BpVAW3Z0/Y+/07GedtyYFajImr9hVdF15wh1Rziqiv/IQJJHdLwVf4Axa7q4ABQ==
X-Received: by 2002:adf:ecc9:: with SMTP id s9mr3575178wro.246.1607070363290;
        Fri, 04 Dec 2020 00:26:03 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
	"'Wei Liu'" <wl@xen.org>
Cc: "'Paul Durrant'" <pdurrant@amazon.com>,
	<xen-devel@lists.xenproject.org>
References: <20201202092205.906-1-paul@xen.org> <fabc2720-3cbc-0b3f-1b09-23ec25189407@suse.com>
In-Reply-To: <fabc2720-3cbc-0b3f-1b09-23ec25189407@suse.com>
Subject: RE: [PATCH v4 00/11] viridian: add support for ExProcessorMasks
Date: Fri, 4 Dec 2020 08:26:01 -0000
Message-ID: <011301d6ca17$1a3fb690$4ebf23b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQFAW81zKVdA94714yPPI08guNmREwKxDbdBqv3tT6A=

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 04 December 2020 08:12
> To: Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>
> Cc: Paul Durrant <pdurrant@amazon.com>; xen-devel@lists.xenproject.org
> Subject: Re: [PATCH v4 00/11] viridian: add support for =
ExProcessorMasks
>=20
> Wei,
>=20
> On 02.12.2020 10:21, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > Paul Durrant (11):
> >   viridian: don't blindly write to 32-bit registers is 'mode' is =
invalid
> >   viridian: move flush hypercall implementation into separate =
function
> >   viridian: move IPI hypercall implementation into separate function
> >   viridian: introduce a per-cpu hypercall_vpmask and accessor
> >     functions...
> >   viridian: use hypercall_vpmask in hvcall_ipi()
> >   viridian: use softirq batching in hvcall_ipi()
> >   viridian: add ExProcessorMasks variants of the flush hypercalls
> >   viridian: add ExProcessorMasks variant of the IPI hypercall
> >   viridian: log initial invocation of each type of hypercall
> >   viridian: add a new '_HVMPV_ex_processor_masks' bit into
> >     HVM_PARAM_VIRIDIAN...
> >   xl / libxl: add 'ex_processor_mask' into
> >     'libxl_viridian_enlightenment'
> >
> >  docs/man/xl.cfg.5.pod.in             |   8 +
> >  tools/include/libxl.h                |   7 +
> >  tools/libs/light/libxl_types.idl     |   1 +
> >  tools/libs/light/libxl_x86.c         |   3 +
> >  xen/arch/x86/hvm/viridian/viridian.c | 604 =
+++++++++++++++++++++------
> >  xen/include/asm-x86/hvm/viridian.h   |  10 +
> >  xen/include/public/hvm/params.h      |   7 +-
> >  7 files changed, 516 insertions(+), 124 deletions(-)
>=20
> the status of this series was one of the topics of yesterday's
> community call. Since Paul's prior ping hasn't had a response by
> you (possibly because you're on PTO for an extended period of
> time) the plan is to get this series in with as much of
> reviewing that I was able to do by, perhaps, the middle of next
> week. Unless of course we hear back from you earlier, giving at
> least an indication of when you might be able to look at this.
>=20
> Thanks for your understanding.
>=20
> Paul, I notice v4 patches 10 and 11 never arrived in my inbox.

Oh, yes... I don't see them in my mail either. (I guess I did 'git =
send-email 000*' instead of 'git send-email 00*'). I'll send v5 (with =
the extra style fix) and get them on list.

> The list archives also don't have them. Therefore I can't check
> the status of the tools side changes, and I don't think I'd
> want to commit those anyway without tool stack side acks, the
> more that they weren't part of what I've looked at.
>=20

Sure. The toolstack side is pretty trivial so hopefully Anthony or Ian =
would happy to give an ack.

  Paul

> Jan


