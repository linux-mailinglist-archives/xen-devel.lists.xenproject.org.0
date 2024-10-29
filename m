Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B00E9B4A70
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 14:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827387.1241981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5lps-0000CS-K9; Tue, 29 Oct 2024 13:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827387.1241981; Tue, 29 Oct 2024 13:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5lps-00009a-GG; Tue, 29 Oct 2024 13:00:36 +0000
Received: by outflank-mailman (input) for mailman id 827387;
 Tue, 29 Oct 2024 13:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mpqm=RZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t5lpq-00009U-JC
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 13:00:34 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c686ec2d-95f5-11ef-99a3-01e77a169b0f;
 Tue, 29 Oct 2024 14:00:30 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2fb5740a03bso51928881fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 06:00:30 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb6348330sm3961625a12.89.2024.10.29.06.00.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 06:00:28 -0700 (PDT)
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
X-Inumbo-ID: c686ec2d-95f5-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzQiLCJoZWxvIjoibWFpbC1sajEteDIzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM2ODZlYzJkLTk1ZjUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjA2ODMwLjMxMzcxNiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730206830; x=1730811630; darn=lists.xenproject.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhs9jKovntUaY9PGavNQXhxuUdo4pikgYsg6aFLR+Dw=;
        b=FZkYWY1G0XZBCeDhPMb8yr5R90mgxnJmDLwAZYiAPreEx3kQ+P67wZV0CTmNE/Rcl0
         eLHi7mKYAGOQm48Z1p8iLwC2NtDKCM7XhfBNTwu3eLi+aDsb2wEBGwOYsnYpWbZke9pg
         AKYA5hIO9jXqlKuI2IjRgb/NHj6Fwm9chkPz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730206830; x=1730811630;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lhs9jKovntUaY9PGavNQXhxuUdo4pikgYsg6aFLR+Dw=;
        b=kJlKqJXEo2fovxo1s6LZCQuI2aaUqFSatqk3EwpeFrKKwmmZfO+v+DkB7PGbG9jkQu
         8KPalxP4mmW38zcJkbag0bF88lBDfEuA5BTrL83t0IL99bPoB4FgmTkqiv5pwKi1HGUw
         zIvpuGqU0YdMqsOlVmnF78lFU6yqOBzM1n+2q0xGaWNvPTL1E7hPmT47IVKBiuRibqo7
         719iFkQ4pA7LbkFpy24nSx7Wn7CnmFMlpSKqSjBdIV2yKT32FF8xGKiRBDW2XVZC+EeN
         iReMuR/eIQpnVV+okYTvX683zHvcf3WD8um5LGVfi9LdnTZgxmt0Su01gXO61hdV+xxB
         jgYA==
X-Forwarded-Encrypted: i=1; AJvYcCWctj2PPl5fjCmiqUmJ29GOd1UxcuTAhsEGcpOkrI4KLemgTpBDvxSjtCemrBXTKgFpIhjpkGmhnEo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzWDG2jmJ0qJ0vmif6jf/69lGU9lEdXCtgzaaoqkwufFNLQnQv
	0gpYFKPjkKlW/Vlb5rH8TIafP+TBcYupL/InYqUE0lfudpxS5+gYOF2/rfmA4Dc=
X-Google-Smtp-Source: AGHT+IFXwpxDTXM/J+YNubDPqWLFS+jzCNm3xOKwnCN20n97l+85ijY2giHM7cV+ggfB50DyPp9afA==
X-Received: by 2002:a05:651c:556:b0:2fb:6243:321c with SMTP id 38308e7fff4ca-2fcbdf76efamr44170631fa.13.1730206829643;
        Tue, 29 Oct 2024 06:00:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Oct 2024 13:00:26 +0000
Message-Id: <D58B4QZAZKUD.3BAWPZIU90TND@cloud.com>
Subject: Re: [PATCH 05/14] x86/xstate: Map/unmap xsave area in
 xstate_set_init() and handle_setbv()
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241028154932.6797-1-alejandro.vallejo@cloud.com>
 <20241028154932.6797-6-alejandro.vallejo@cloud.com>
 <4f49f8df-d455-4be2-a245-e876713addf1@suse.com>
In-Reply-To: <4f49f8df-d455-4be2-a245-e876713addf1@suse.com>

On Tue Oct 29, 2024 at 8:26 AM GMT, Jan Beulich wrote:
> On 28.10.2024 16:49, Alejandro Vallejo wrote:
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -993,7 +993,12 @@ int handle_xsetbv(u32 index, u64 new_bv)
> > =20
> >          clts();
> >          if ( curr->fpu_dirtied )
> > -            asm ( "stmxcsr %0" : "=3Dm" (curr->arch.xsave_area->fpu_ss=
e.mxcsr) );
> > +        {
> > +            struct xsave_struct *xsave_area =3D vcpu_map_xsave_area(cu=
rr);
> > +
> > +            asm ( "stmxcsr %0" : "=3Dm" (xsave_area->fpu_sse.mxcsr) );
> > +            vcpu_unmap_xsave_area(curr, xsave_area);
> > +        }
>
> Since it's curr that we're dealing with, is this largely a cosmetic chang=
e? I.e.
> there's no going to be any actual map/unmap operation in that case? Other=
wise
> I'd be inclined to say that an actual map/unmap is pretty high overhead f=
or a
> mere store of a 32-bit value.
>
> Jan

Somewhat.

See the follow-up reply to patch2 with something resembling what I expect t=
he
wrappers to have. In short, yes, I expect "current" to not require
mapping/unmapping; but I still would rather see those sites using the same
wrappers for auditability. After we settle on a particular interface, we ca=
n
let the implementation details creep out if that happens to be clearer, but
it's IMO easier to work this way for the time being until those details
crystalise.

Cheers,
Alejandro

