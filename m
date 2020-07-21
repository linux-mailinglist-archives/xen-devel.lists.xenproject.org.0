Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B9227CD5
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 12:23:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxpQI-0003uS-HJ; Tue, 21 Jul 2020 10:22:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDR4=BA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxpQH-0003uN-Ea
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 10:22:57 +0000
X-Inumbo-ID: 24820268-cb3c-11ea-84fe-bc764e2007e4
Received: from mail-wm1-x32c.google.com (unknown [2a00:1450:4864:20::32c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24820268-cb3c-11ea-84fe-bc764e2007e4;
 Tue, 21 Jul 2020 10:22:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id 184so2345084wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 03:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=PtRuMxz8lwN5YHPl8WDFCQqWqb7YEMSMdiP2r+2UXBg=;
 b=oPS90EO/t1oZvfKL1OtgQs1ZOB98f38Q7SwqEnuIIDWROkhXCGThSO0gs/QB7cZJki
 rxIuYOrmF2nf1hiGhK90LG5xV2eQwoThZxgzFNhG8EgVntT/JpAuJd0jZoC6FQUnFipT
 gas/dlyorfeyDGcZSB9FrpAw1iWPNwclkwWMYKJ5W+F8CZomvr5YTRhbORFXSizmXPUD
 /15QFsW5HH4SoAqP4/g6CzkM1kTsxZ/vCXuf1bMc2Fzq7yU3mTqUnUgzGnwVgEQPivqy
 UjLY8BtP57+JpuEPtV6DQ3KzKRdlrclpK8gsV3wlpJzIFfLGl0LP3QQTVTSghV7pZClS
 4cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=PtRuMxz8lwN5YHPl8WDFCQqWqb7YEMSMdiP2r+2UXBg=;
 b=dkun6MF9UUMX+s89Cb/Rh6aI20KbKtrNBfBda30rxT4qB1H0bLcNq3llaw/LqTw9W2
 20vIPWPvwL7ACF/2erWtgIRJu2i4iBfFWOv53tDu2znXofmY4cZ0adXAWFX7x6ZVJHgn
 J15ayywYxnSY1xPno2ubKZQ1UcFzu1kBER/z09Xs6MCntJfiSQE6Viwdc+ndQA1T6+v6
 aBK0yjWgdpkutBIfqwJbXmDjXe6yjhabsn+Z6krp15fvvJNmfkqyLxFAO5H13L1RdTqz
 gwwuBvuHNSN+I1si4H/jwhr7wmXqkqIN3NrbsGUw8BJmx4VlX8FiPinUCyXsNmWevAay
 uvsw==
X-Gm-Message-State: AOAM531dCxNsBKBV4J4GoXFqQfJionhcBE/jeXv+vHO/iebTVgyM0eSw
 T6+/1gQt1mBzNAjH7S8l5mo=
X-Google-Smtp-Source: ABdhPJwtyyzWTQz3/bjbnQPssfxQM0UQXhHzAKkPQc0fuPWnFHqHTtrDHfLkn2+kxbTLga5/+8v5lQ==
X-Received: by 2002:a1c:a513:: with SMTP id o19mr3338085wme.119.1595326975550; 
 Tue, 21 Jul 2020 03:22:55 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id b23sm3029368wmd.37.2020.07.21.03.22.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 03:22:55 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'George Dunlap'" <George.Dunlap@citrix.com>
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
 <003901d65f2e$6faab0c0$4f001240$@xen.org>
 <66dc2e79-e899-1d94-c0f2-d834b55cd859@citrix.com>
 <004001d65f40$a0348330$e09d8990$@xen.org>
 <44537ECC-E301-46BD-8B8E-F3B522A18FEC@citrix.com>
In-Reply-To: <44537ECC-E301-46BD-8B8E-F3B522A18FEC@citrix.com>
Subject: RE: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
Date: Tue, 21 Jul 2020 11:22:53 +0100
Message-ID: <004101d65f48$e5acf610$b106e230$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJO5yDcExPNZQbG/t5S46VRX2lP6wJ2S7dHAu7JLWYBiCecnADZLF4vp+KP/nA=
Content-Language: en-gb
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
Cc: 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <Andrew.Cooper3@citrix.com>,
 'Nick Rosbrook' <rosbrookn@ainfosec.com>,
 'Nick Rosbrook' <rosbrookn@gmail.com>, xen-devel@lists.xenproject.org,
 'Ian Jackson' <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: George Dunlap <George.Dunlap@citrix.com>
> Sent: 21 July 2020 10:54
> To: paul@xen.org
> Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>; Nick Rosbrook =
<rosbrookn@gmail.com>; xen-
> devel@lists.xenproject.org; Nick Rosbrook <rosbrookn@ainfosec.com>; =
Ian Jackson
> <Ian.Jackson@citrix.com>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for =
python 2.6
>=20
>=20
>=20
> > On Jul 21, 2020, at 10:23 AM, Paul Durrant <xadimgnik@gmail.com> =
wrote:
> >
> >> -----Original Message-----
> >> From: Andrew Cooper <andrew.cooper3@citrix.com>
> >> Sent: 21 July 2020 10:21
> >> To: paul@xen.org; 'Nick Rosbrook' <rosbrookn@gmail.com>; =
xen-devel@lists.xenproject.org
> >> Cc: 'Nick Rosbrook' <rosbrookn@ainfosec.com>; 'Ian Jackson' =
<ian.jackson@eu.citrix.com>; 'George
> >> Dunlap' <george.dunlap@citrix.com>; 'Wei Liu' <wl@xen.org>
> >> Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation =
for python 2.6
> >>
> >> On 21/07/2020 08:13, Paul Durrant wrote:
> >>>> -----Original Message-----
> >>>> From: Nick Rosbrook <rosbrookn@gmail.com>
> >>>> Sent: 21 July 2020 00:55
> >>>> To: xen-devel@lists.xenproject.org
> >>>> Cc: paul@xen.org; Nick Rosbrook <rosbrookn@ainfosec.com>; George =
Dunlap
> <george.dunlap@citrix.com>;
> >>>> Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>
> >>>> Subject: [PATCH for-4.14] golang/xenlight: fix code generation =
for python 2.6
> >>>>
> >>>> Before python 2.7, str.format() calls required that the format =
fields
> >>>> were explicitly enumerated, e.g.:
> >>>>
> >>>>  '{0} {1}'.format(foo, bar)
> >>>>
> >>>>  vs.
> >>>>
> >>>>  '{} {}'.format(foo, bar)
> >>>>
> >>>> Currently, gengotypes.py uses the latter pattern everywhere, =
which means
> >>>> the Go bindings do not build on python 2.6. Use the 2.6 syntax =
for
> >>>> format() in order to support python 2.6 for now.
> >>>>
> >>>> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> >>> I'm afraid this is too late for 4.14 now. We are in hard freeze, =
so only minor docs changes or
> >> critical bug fixes are being taken at
> >>> this point.
> >>
> >> This is Reported-by me, and breaking gitlab CI on the master and =
4.14
> >> branches (because apparently noone else cares to look at the =
results...)
> >>
> >> The alternative is to pull support for CentOS 6 from the 4.14 =
release,
> >> which would best be done by a commit taking out the C6 containers =
from CI.
> >>
> >
> > At this late stage I'd rather we did that.
>=20
> We should probably add a release note saying that there=E2=80=99s a =
known intermittent build issue on CentOS
> 6.
>=20

Ok, that sounds fine.

  Paul

>  -George


