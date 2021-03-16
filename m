Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E604F33E066
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 22:21:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98477.186834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMH87-0006Zm-2A; Tue, 16 Mar 2021 21:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98477.186834; Tue, 16 Mar 2021 21:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMH86-0006ZN-VB; Tue, 16 Mar 2021 21:21:30 +0000
Received: by outflank-mailman (input) for mailman id 98477;
 Tue, 16 Mar 2021 21:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akkw=IO=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1lMH85-0006ZH-Eh
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 21:21:29 +0000
Received: from mail-pf1-x42b.google.com (unknown [2607:f8b0:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a228680-165e-44da-9f2c-91186a2ec62c;
 Tue, 16 Mar 2021 21:21:28 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id 16so9714043pfn.5
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 14:21:28 -0700 (PDT)
Received: from ?IPv6:2600:380:8024:351d:e408:e9a3:21f:c070?
 ([2600:380:8024:351d:e408:e9a3:21f:c070])
 by smtp.gmail.com with ESMTPSA id p184sm17575536pgp.13.2021.03.16.14.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 14:21:27 -0700 (PDT)
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
X-Inumbo-ID: 2a228680-165e-44da-9f2c-91186a2ec62c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=mdHeWv0B3/tMyhBE9ZB8sjNcuRBGkqEoiWe/K/cvJdA=;
        b=XrEaU964dBg1inEOZGdCFyCvjtQOC9RsWWLGh0MBfYif3teurzhg4YaKyvpNcuER59
         wWISe9L+J6pKFWfltanY2ozEWXK32gJQC+xedn8izv867w2nR/wJstqcei0KyfDQ22rA
         gY/XA4Zm+D71ie0sj3pVz/kXH1UwNce3Af36WR1UKiz8ktDYxajlIRH7TWrAnhXLjiGz
         UkK0MObKYKMcKormIKUOdXT8JIXtjKngVY7YHCtDKyuu+2JXiXMCx1r5Kr3Eahnc76W3
         H+OmyHSNzWDZQiYS1lJrKgFLuvFVfaY+wCHIWIhy4w0RWAqTtbQBiMBesOxh5P/58YZD
         5dAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=mdHeWv0B3/tMyhBE9ZB8sjNcuRBGkqEoiWe/K/cvJdA=;
        b=nH1rhzDHu8MIDXrkhOkDxb90fwV0ZFxtKOInCSNbwnFhOYMsU0wvtlZsAKO2MCFB+C
         YL2OftKv1uZ6SeFkklw98ZeADl/Yu+uVucCcQC3yfjaXVkerPkS7gtaWC+0M15cUQ7Jn
         S316ni5SyZtAoxIvqpCMq2sfZutW5cJ+B8dIPGVAVdiZKjO3rwJgWXzAEtruka5s5Xug
         jPumDg+w0ugz+J9vJU/MqmmwWh68Yfj9jcbkXKJZaVLiWnINvhSpaqcj1n2PBhrsjM8i
         ml5qjfFHdT48WvP+PWh8P2AQO1yjArWUb2IFGfO/oabzHmy9ZHcpoqsP0cw27jnhQ+T0
         dxIw==
X-Gm-Message-State: AOAM530ZL5h5iNIRmk7/BX4UQQgL0RP7wy8cqNpOdu7M3x8VzwM1S89C
	k7IZFI7h/PfsqkaPfCT4Bgc=
X-Google-Smtp-Source: ABdhPJyQEGlCa0VeV44dfhyNty0GNS7s5Ciqa9YSHxbE4ldWY10OCgL+qHU8eJDjPmd8jup/gwHgsg==
X-Received: by 2002:a62:1713:0:b029:1f1:56e2:8ec6 with SMTP id 19-20020a6217130000b02901f156e28ec6mr1334638pfx.56.1615929688073;
        Tue, 16 Mar 2021 14:21:28 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christopher Clark <christopher.w.clark@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Working Group for Secure Boot
Date: Tue, 16 Mar 2021 14:21:25 -0700
Message-Id: <967E23A4-A194-4C3B-98ED-2B6510FDE5FB@gmail.com>
References: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, piotr.krol@3mdeb.com,
 Olivier Lambert <olivier.lambert@vates.fr>,
 Trammell Hudson <hudson@trmm.net>,
 =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>
In-Reply-To: <e1d7b456-e710-d699-8fcf-234de10e9b36@gmail.com>
To: Bob Eshleman <bobbyeshleman@gmail.com>
X-Mailer: iPhone Mail (18D52)



> On Mar 16, 2021, at 12:43 PM, Bob Eshleman <bobbyeshleman@gmail.com> wrote=
:
>=20
> =EF=BB=BFHey everyone,
>=20
> I think most who are interested have acked the thread at
> this point and I've CC'd everyone (please add anyone if
> I've missed them).

Hi Bobby,

Please add me to your list too - this will be interesting work!

>=20
> I'd like to suggest we have a first group call to
> set out an agenda, define scope, and start identifying
> the direction the project would like to go for secure
> boot.
>=20
> I'll prepare the call similar to how
> community calls are handled, with a public cryptpad
> for agenda items and such.
>=20
> Which of these dates work best for you? Which absolutely
> do not work?
>=20
>  Mon. March 29th, 16:00 UTC
>  Wed. March 31st, 16:00 UTC
>  Mon. April  5th, 16:00 UTC
>=20
> Given the Xen community call is at 16:00 UTC, I figure
> that probably best captures our geographic spread.  Feel
> free to suggest alternative dates/times if none of the
> above work.

I appreciate the time of day choice and can be available for whichever of th=
ose is chosen.

Thanks!

Christopher=20

>=20
> We can host the meeting on Jitsi which works quite well
> from any web browser.  I'll send out a invite link when
> we've decided on a suitable date and time.
>=20
> Thanks.
>=20
> --=20
> Bobby Eshleman
> SE at Vates SAS
>=20

