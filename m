Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDF1F6912
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 15:34:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjNL2-0001pB-4y; Thu, 11 Jun 2020 13:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XPau=7Y=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjNL1-0001p6-75
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 13:33:47 +0000
X-Inumbo-ID: 2cc04b06-abe8-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cc04b06-abe8-11ea-bca7-bc764e2007e4;
 Thu, 11 Jun 2020 13:33:46 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so6167462wrr.10
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2020 06:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=V4u0XW0sq3+1Rb7aA4YKUdRc9wue2mtPLEIIwicVyT4=;
 b=Oi3qpGCCxNG/Vn82vElw9RuzyJfYi9g9QX1oicQ8GyuhXRR7ha1Q95mNU2PFLJaP51
 Whxd9DY04DbNbr24DbyeXFoZVPRJGGgvImX6u1E3KzcKGoa+mr24y3TDUq5efD2RyyDI
 yvXPJDPAJcChKfemXr50tMVXfgxV7EI+qQFSwTcBma1Gor/joeSxQrxrDXv9IihQoq5e
 jeaIyKScnrkRDR9xKG9GVE07HKjImqsBauLqwdSxFpV3QrJ2xpzxb2lPC55PEsFCqdlB
 SGk3RdMMeEj1w2geq4bsUwwDD2lhBFX7Bz7otL7QWKP96VMbrVmZ9jk5kKcy2iR6hj5r
 r5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=V4u0XW0sq3+1Rb7aA4YKUdRc9wue2mtPLEIIwicVyT4=;
 b=Vbn2MZEqBBZAQhUuoV3tbHPU4cFuSb4lSG2k838fL1xpYd+KiTUg+pKxIjENCeg11O
 zcr7kIw7hTGN1l9DBQ8UeYtaV0t0SasGH9RIptgKPd3El3WQPvBfW4JXiSni0zZl6YS3
 q4DRzoA/0nN6LOfHTLZUviTc/G0Y3Mh1HX/4icj3lp8aWnGcayARWrV34b07/08y2sQd
 0XQ5smXEHIHoAhBzUwOK5y3JE8F3qgj+v3mvFxX+EhZaXCk12MizIcM8UEr5J06RJe5z
 jJ/WeOECJjmbzRctCRGed3AmI6r/qDhwoivpRVkShsoPey2DGjlesKlbHrDUjVzng9VT
 LEng==
X-Gm-Message-State: AOAM533GwOthy8F/YFNy+K7BHWCdAzMqXNc2a/EO3ArjsDZrWvLZQVmb
 KYAr3UUYfK3MJu89/22O4JE=
X-Google-Smtp-Source: ABdhPJzb0+9WinKjDHVX4R9JUn2+3N0/77C5hH2WeLcJxGXErHJIQr/usA8diMmm38OjWa7j2FrlCA==
X-Received: by 2002:adf:c6c5:: with SMTP id c5mr9188797wrh.13.1591882425568;
 Thu, 11 Jun 2020 06:33:45 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.177])
 by smtp.gmail.com with ESMTPSA id z8sm4988629wru.33.2020.06.11.06.33.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jun 2020 06:33:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 "'Julien Grall'" <julien.grall.oss@gmail.com>,
 =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>
References: <20200609154546.4531-1-jgross@suse.com>
 <4a3c4e5e-1fbd-5017-1e3e-64052ae2410a@xen.org>
 <fa5aaa8c-f695-cd87-a837-7d41e4f64a82@suse.com>
 <CAJ=z9a1QHY_4Ktg8jTfWeBwfrX6nsjoHhz4VT_ap-hiMvftoFg@mail.gmail.com>
 <1da8a9bd-b77a-86c0-5b6a-638ea94b2cbc@xen.org>
In-Reply-To: <1da8a9bd-b77a-86c0-5b6a-638ea94b2cbc@xen.org>
Subject: RE: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
Date: Thu, 11 Jun 2020 14:33:43 +0100
Message-ID: <00ec01d63ff4$ede7f460$c9b7dd20$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHwbJlqkk7O35noToy96/KV5kSeeQKFTsPRAb1oUx0DSQa4gwGSMGxrqFYhDdA=
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 11 June 2020 10:20
> To: Julien Grall <julien.grall.oss@gmail.com>; J=C3=BCrgen Gro=C3=9F =
<jgross@suse.com>; Paul Durrant
> <paul@xen.org>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei =
Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
>=20
>=20
>=20
> On 10/06/2020 22:47, Julien Grall wrote:
> > On Wed, 10 Jun 2020 at 19:49, J=C3=BCrgen Gro=C3=9F =
<jgross@suse.com> wrote:
> >>
> >> On 10.06.20 19:55, Julien Grall wrote:
> >>> Hi Juergen,
> >>>
> >>> On 09/06/2020 16:45, Juergen Gross wrote:
> >>>> Writing the runtime parameters loglvl or guest_loglvl omits =
setting the
> >>>> new length of the resulting parameter value.
> >>>>
> >>>> Reported-by: George Dunlap <george.dunlap@citrix.com>
> >>>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>>
> >>> Reviewed-by: Julien Grall <jgrall@amazon.com>
> >>>
> >>> Although one unrelated comment below.
> >>>
> >>>> ---
> >>>>    xen/drivers/char/console.c | 19 +++++++++++++++----
> >>>>    1 file changed, 15 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/xen/drivers/char/console.c =
b/xen/drivers/char/console.c
> >>>> index 56e24821b2..861ad53a8f 100644
> >>>> --- a/xen/drivers/char/console.c
> >>>> +++ b/xen/drivers/char/console.c
> >>>> @@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int
> >>>> *lower, int *upper, char *val)
> >>>>    static int parse_loglvl(const char *s)
> >>>>    {
> >>>> -    return _parse_loglvl(s, &xenlog_lower_thresh, =
&xenlog_upper_thresh,
> >>>> -                         xenlog_val);
> >>>> +    int ret;
> >>>> +
> >>>> +    ret =3D _parse_loglvl(s, &xenlog_lower_thresh, =
&xenlog_upper_thresh,
> >>>> +                        xenlog_val);
> >>>> +    custom_runtime_set_var(param_2_parfs(parse_loglvl), =
xenlog_val);
> >>>
> >>> Mixing function and variable name is pretty confusing. It took me
> >>> sometimes to go through the macro maze to figure out what's =
happening.
> >>>
> >>> It might be worth thinking to document more the custom_runtime_* =
interface.
> >>
> >> I have already some streamlining ideas for 4.15.
> >
> > Cool! I will commit it tomorrow morning.
>=20
> Actually I am missing a Released-acked-by from Paul on this patch.
>=20

Release-acked-by: Paul Durrant <paul@xen.org>

> Cheers,
>=20
> --
> Julien Grall


