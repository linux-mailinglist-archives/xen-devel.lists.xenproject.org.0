Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A69423B6E1
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 10:37:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2sRl-0005yU-6h; Tue, 04 Aug 2020 08:37:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PUrY=BO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1k2sRj-0005yO-HX
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 08:37:19 +0000
X-Inumbo-ID: b485878a-d62d-11ea-9139-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b485878a-d62d-11ea-9139-bc764e2007e4;
 Tue, 04 Aug 2020 08:37:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g8so1883342wmk.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2020 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=/nPyjZI9KV5I3szUDlWxSRO5+QFYlS+dHOy2SDtIKYI=;
 b=oXCdsQSipocZ1Yj1Isdzk6UckuRU8rqJ8m72XxMh7ClA1lkM7ZZ/YtrcvF+wSV2JA9
 tfvYAPBB3QCV1swMVvJcTmH4pzwPi3u1IL57yvrfuyBPhK7Atgx9l2DQCs5+67gy+yax
 MQqyOHDHEHyP1Eb1GfsYWjNqYl2rwQaBKpCdoxmLIv5Fy+RZ56CHnEnlY3EIa9nYuG0j
 xMISVEuZSlfzMjwK0R2+Vw19VyTukis4CZWYA9LTofVUwOEhYSFqTV129ahtxQoBe+dZ
 hOPA0SdI8aPTbYTO6vGyI766ZsiKzSXkuz3KjohPfirrSRvh7nb3Wnbgq//oIVc5jUbt
 k0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=/nPyjZI9KV5I3szUDlWxSRO5+QFYlS+dHOy2SDtIKYI=;
 b=Rib+dFfvnb0S2/y8IZcwr0bTOvyzYD7fOg7Hra/HkqXXPqOiFeftsmTbcYE0JF1Dzp
 1oomeHohc0uVi2hXXuYk3t4QanDPM+/84lbfGUDPDdz75YSatschpnitE6bnCB1LukRs
 arHaUF7ZSnPfNN2rKpumqi+iL2yoEoW51U60T5cZqKT2WXhr/rdjDJwotmayyWHskBkr
 UJZT/7rQR6djZ7R3aIazG9jS5Z30qYEaywHNfuMLcZK2l1pvpjEOpjfK/nsFPXGaMfSe
 ySxOoPNwHm9r/Dqyca4nMRtNAyJFuOf1dzKVmXDH9VIUmvobL8xdNC4QYDPuB3Y4Kn5y
 eZHg==
X-Gm-Message-State: AOAM533XFfAchNv325hOqUvYoLP+sbXZIBnkAvSjY905JvV/uhXbkqkH
 lF2VPvGa7yZdWW7RX4L+PG8=
X-Google-Smtp-Source: ABdhPJzDapD/UdsRWGR4kmZkbCsJ5WPWtzEotAYMzUckkcs3AVBwHialxx4/CVNRuy1BJy6inh5O0Q==
X-Received: by 2002:a1c:80c1:: with SMTP id b184mr3197422wmd.121.1596530237540; 
 Tue, 04 Aug 2020 01:37:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:ad9a:ab78:5748:a7ec])
 by smtp.gmail.com with ESMTPSA id r22sm3644644wmh.45.2020.08.04.01.37.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 04 Aug 2020 01:37:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200804074930.13104-1-philmd@redhat.com>
 <20200804074930.13104-2-philmd@redhat.com>
 <001201d66a34$e82ec070$b88c4150$@xen.org>
 <56c70b44-2d5f-44fc-5d9a-535c3c5fca71@redhat.com>
In-Reply-To: <56c70b44-2d5f-44fc-5d9a-535c3c5fca71@redhat.com>
Subject: RE: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() behavior on
 target-agnostic objects
Date: Tue, 4 Aug 2020 09:37:16 +0100
Message-ID: <001301d66a3a$75ac6c90$610545b0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQM/xXTZtf+c9Zv1otz4aIX099Jj8gDx5jXAAVRtvfwA7Pf4CaY7T1ag
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
Cc: 'Peter Maydell' <peter.maydell@linaro.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Paul Durrant' <pdurrant@amazon.com>, 'Paolo Bonzini' <pbonzini@redhat.com>,
 'Anthony Perard' <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 04 August 2020 09:35
> To: paul@xen.org; qemu-devel@nongnu.org
> Cc: 'Peter Maydell' <peter.maydell@linaro.org>; 'Anthony Perard' =
<anthony.perard@citrix.com>; 'Paolo
> Bonzini' <pbonzini@redhat.com>; 'Stefano Stabellini' =
<sstabellini@kernel.org>; xen-
> devel@lists.xenproject.org; 'Paul Durrant' <pdurrant@amazon.com>
> Subject: Re: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() =
behavior on target-agnostic objects
>=20
> Hi Paul,
>=20
> On 8/4/20 9:57 AM, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> Sent: 04 August 2020 08:50
> >> To: qemu-devel@nongnu.org
> >> Cc: Peter Maydell <peter.maydell@linaro.org>; Anthony Perard =
<anthony.perard@citrix.com>; Paolo
> >> Bonzini <pbonzini@redhat.com>; Stefano Stabellini =
<sstabellini@kernel.org>; xen-
> >> devel@lists.xenproject.org; Paul Durrant <paul@xen.org>; Philippe =
Mathieu-Daud=C3=A9
> <philmd@redhat.com>;
> >> Paul Durrant <pdurrant@amazon.com>
> >> Subject: [PATCH-for-5.1 v2 1/1] accel/xen: Fix xen_enabled() =
behavior on target-agnostic objects
> >>
> >> CONFIG_XEN is generated by configure and stored in =
"config-target.h",
> >> which is (obviously) only include for target-specific objects.
> >> This is a problem for target-agnostic objects as CONFIG_XEN is =
never
> >> defined and xen_enabled() is always inlined as 'false'.
> >>
> >> Fix by following the KVM schema, defining CONFIG_XEN_IS_POSSIBLE
> >> when we don't know to force the call of the non-inlined function,
> >> returning the xen_allowed boolean.
> >>
> >> Fixes: da278d58a092 ("accel: Move Xen accelerator code under =
accel/xen/")
> >> Reported-by: Paul Durrant <pdurrant@amazon.com>
> >> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/sysemu/xen.h   | 18 ++++++++++++++----
> >>  accel/stubs/xen-stub.c |  2 ++
> >>  accel/xen/xen-all.c    |  7 +------
> >>  3 files changed, 17 insertions(+), 10 deletions(-)
> >>
> >> diff --git a/include/sysemu/xen.h b/include/sysemu/xen.h
> >> index 1ca292715e..2c2c429ea8 100644
> >> --- a/include/sysemu/xen.h
> >> +++ b/include/sysemu/xen.h
> >> @@ -8,9 +8,19 @@
> >>  #ifndef SYSEMU_XEN_H
> >>  #define SYSEMU_XEN_H
> >>
> >> -#ifdef CONFIG_XEN
> >> +#ifdef NEED_CPU_H
> >> +# ifdef CONFIG_XEN
> >> +#  define CONFIG_XEN_IS_POSSIBLE
> >> +# endif
> >> +#else
> >> +# define CONFIG_XEN_IS_POSSIBLE
> >> +#endif
> >>
> >> -bool xen_enabled(void);
> >> +#ifdef CONFIG_XEN_IS_POSSIBLE
> >> +
> >> +extern bool xen_allowed;
> >> +
> >> +#define xen_enabled()           (xen_allowed)
> >
> > Can this not move ahead of the #ifdef now (since xen_allowed is =
present in both xen-stub and xen-
> all)? I think this is what Peter was saying in his option '(2)'.
>=20
> I think I respected Peter's option '(2)', following how KVM does, this
> is the case with stub,

Ok, if it follows the KVM pattern then that's fine.

Reviewed-by: Paul Durrant <paul@xen.org>


