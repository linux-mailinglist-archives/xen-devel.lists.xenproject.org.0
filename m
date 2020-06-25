Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B5209A25
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2020 08:57:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joLnZ-0003Eg-Cl; Thu, 25 Jun 2020 06:55:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bJ+=AG=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1joLnY-0003Eb-2e
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 06:55:48 +0000
X-Inumbo-ID: e53fc882-b6b0-11ea-bca7-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e53fc882-b6b0-11ea-bca7-bc764e2007e4;
 Thu, 25 Jun 2020 06:55:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so6000672wmm.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 23:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=AcJhJWPg9ILmTg2qesw42RsvWT7rg9x8dkf0LUZBteE=;
 b=WlVvGyoNRncnsSk+dobJfK3f2/ZNIKCr1WezZR3PM5U9DmL9pzb03igSMwv2GM8Dsa
 /yYXvV2CZspI9U8Dv/Bt8mpIXwQaitylA7d6RRCDXDZJXTtMadfi0jtixA4pkDnnYnap
 HuiMLAEa6oUsH4NO4hLkdtvL+KYsmtlI9EuCfVMd4XSKIW6SBPArdQl3Rd2PISSLRUAN
 j8tzIerIgDJMplvcQ7k6VLdgJElMToVKsQNP/VKYRZ6yv8MOm8Dv9KISpaTOrFZZ65UD
 T3v1fKbAVtZu7v5Ta7lqT75bAW5YDn4sCE9llxx3vt1nT4WzKl74y6L60g6Pb6QQyj53
 Ytow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=AcJhJWPg9ILmTg2qesw42RsvWT7rg9x8dkf0LUZBteE=;
 b=hlZeGZHKTFQF8W7iy1wSHR7PRSRREbKtumZH9Ms39iE/nZd7iXXr5elgetOQPPKSYw
 VxCwG1xfZUQofk3kqefadbViU758otm++1qjCiy/ZA5bO6Ui9Dcr2ooidI4ZVf9TszWZ
 Jn6MGIu1EV82NUXRn9UYA6al2fBCPB6T/y/VM97FE24Lc1JnlkTaMi07TK3rBJHfzJnb
 m8qNsZ3wePTOeChGBrsF/bQIbTkBKgjTYlqewN1OwgLcCR4qUwyJB3LhCE3IJFp618rr
 RFjxufilG6WNJlPkXTjn+kNvXHQizgB9N3W4d8DFM/0zhd8/eqGQgUcf+k5GBWDKb+6w
 /+wg==
X-Gm-Message-State: AOAM531MgOIoiZ9V64soefAV2g3wgKCfz7lrntuufwQP+aoD/XrqxRDh
 cN+nm+9EocG109ij2n0lur0=
X-Google-Smtp-Source: ABdhPJxRemy6vIC4cLmw7UJQEJQ3V73AMdEP0/wk4hJ1tsZ6r/3ULJ644b5vAvRtJbdkLPATIbKmUQ==
X-Received: by 2002:a1c:9cd0:: with SMTP id f199mr1666878wme.94.1593068146103; 
 Wed, 24 Jun 2020 23:55:46 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id 63sm32509045wra.86.2020.06.24.23.55.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jun 2020 23:55:45 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <cover.1592603468.git.gorbak25@gmail.com>
 <de0e33d2be0924e66a220678a7683098df70c2b5.1592603468.git.gorbak25@gmail.com>
 <5993e716-d71d-cbc0-a186-5325e2bdeba4@suse.com>
 <2c3e8cd2-b74f-52b6-4df8-057e8d000455@suse.com>
In-Reply-To: <2c3e8cd2-b74f-52b6-4df8-057e8d000455@suse.com>
Subject: RE: Ping: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine the
 PMTMR width
Date: Thu, 25 Jun 2020 07:55:44 +0100
Message-ID: <000001d64abd$a676b480$f3641d80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJVMUHmkHGgErqW4WJrIi3D08QvIAHMqz2XAToNZ2MAiKHvDKfOnXqA
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
Cc: 'Wei Liu' <wl@xen.org>, jakub@bartmin.ski,
 'Andrew Cooper' <andrew.cooper3@citrix.com>, marmarek@invisiblethingslab.com,
 'Grzegorz Uriasz' <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 24 June 2020 16:32
> To: Paul Durrant <paul@xen.org>
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; Wei Liu <wl@xen.org>; =
jakub@bartmin.ski; Andrew Cooper
> <andrew.cooper3@citrix.com>; marmarek@invisiblethingslab.com; =
j.nowak26@student.uw.edu.pl; xen-
> devel@lists.xenproject.org; contact@puzio.waw.pl; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> Subject: Ping: [PATCH v3 1/1] x86/acpi: Use FADT flags to determine =
the PMTMR width
>=20
> On 22.06.2020 10:49, Jan Beulich wrote:
> > On 20.06.2020 00:00, Grzegorz Uriasz wrote:
> >> @@ -490,8 +497,12 @@ static int __init acpi_parse_fadt(struct =
acpi_table_header *table)
> >>   	 */
> >>  	if (!pmtmr_ioport) {
> >>  		pmtmr_ioport =3D fadt->pm_timer_block;
> >> -		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 24 : 0;
> >> +		pmtmr_width =3D fadt->pm_timer_length =3D=3D 4 ? 32 : 0;
> >>  	}
> >> +	if (pmtmr_width < 32 && fadt->flags & ACPI_FADT_32BIT_TIMER)
> >> +        printk(KERN_WARNING PREFIX "PM-Timer is too short\n");
> >
> > Indentation is screwed up here.
> >
> >> --- a/xen/arch/x86/time.c
> >> +++ b/xen/arch/x86/time.c
> >> @@ -457,16 +457,13 @@ static u64 read_pmtimer_count(void)
> >>  static s64 __init init_pmtimer(struct platform_timesource *pts)
> >>  {
> >>      u64 start;
> >> -    u32 count, target, mask =3D 0xffffff;
> >> +    u32 count, target, mask;
> >>
> >> -    if ( !pmtmr_ioport || !pmtmr_width )
> >> +    if ( !pmtmr_ioport || (pmtmr_width !=3D 24 && pmtmr_width !=3D =
32) )
> >>          return 0;
> >>
> >> -    if ( pmtmr_width =3D=3D 32 )
> >> -    {
> >> -        pts->counter_bits =3D 32;
> >> -        mask =3D 0xffffffff;
> >> -    }
> >> +    pts->counter_bits =3D pmtmr_width;
> >> +    mask =3D (1ull << pmtmr_width) - 1;
> >
> > "mask" being of "u32" type, the use of 1ull is certainly a little =
odd
> > here, and one of the reasons why I think this extra "cleanup" would
> > better go in a separate patch.
> >
> > Seeing that besides cosmetic aspects the patch looks okay now, I'd =
be
> > willing to leave the bigger adjustment mostly as is, albeit I'd
> > prefer the 1ull to go away, by instead switching to e.g.
> >
> >     mask =3D 0xffffffff >> (32 - pmtmr_width);
> >
> > With the adjustments (which I'd be happy to make while committing,
> > provided you agree)
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >
> > Also Cc-ing Paul for a possible release ack (considering this is a
> > backporting candidate).
>=20
> Paul?
>=20

Looks ok.

Release-acked-by: Paul Durrant <paul@xen.org>

> Thanks, Jan


