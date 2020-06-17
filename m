Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A3F1FCDA6
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2020 14:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlXSb-0000kf-Kp; Wed, 17 Jun 2020 12:46:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c7kS=76=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jlXSa-0000ka-Lm
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 12:46:32 +0000
X-Inumbo-ID: 91c2a95e-b098-11ea-8496-bc764e2007e4
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91c2a95e-b098-11ea-8496-bc764e2007e4;
 Wed, 17 Jun 2020 12:46:32 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id l27so2195223ejc.1
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2020 05:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Sa5cuZtygHc8w7ntdXyCnAw36f3tKmdYWqElsxtulRk=;
 b=XYuQV9+1bEsNnaKTIpBazrdOu/s2VxvgHmxser9bqjMF++JeaXTr/0gpGu/0Jypvwm
 46l1kVgV1UL9AA9JawiMH7d9C/5FJeofRCTcdscnI3rLWHFbrVV+6kbsUH/Sj7LIN2s+
 G/zdc1x7Uqi9jw7v/MqepyG4/CyLTV5jyVXs4Sj5wLtd9rZyaO79M2OqFcsJ90AKblkN
 tAjp4Gelnt5YnUN20nhQeQ4clWqhnBjY6gdHstGKc5Z946S7J+gOw+dBS8RzpNNNhT1h
 3G/I2/zUSqNBLwHtmLVbMPeOS871MmgR0cccgCwd37MLbgk1WDWkFfUnQ9dGEVGWZyxT
 2g3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Sa5cuZtygHc8w7ntdXyCnAw36f3tKmdYWqElsxtulRk=;
 b=lH0g2GOsyYREcOaQm2mUth7tmVNQteq14cEk/Z1e4Q3JWSkHCaimP0//2PlQRe8vf+
 DLYkPWbYa/T3GH7Zi/iFAg3Ya0hHcwlqD/3/aMhQG0CJL+CTAJAgWaRciBuG8B4theEp
 DSQMfXKlBwuDiW9LI2lxVzDnlxUhpkZY+byW0yQ6R5vI91rV2QeVfb1fX5tCM/cG2teJ
 uGKAO26WsU8bphhLRx4Ww3f967Uyg6OTQ0deI/YWxTgWEtc8KF8l5AksFst16W9hdp91
 xABS5sLzfp4i3WNOPMsMAonWAyGk64351z3dWwiL1SOmsKg3DKG/FnWPqjvPLQy06hL/
 /7TA==
X-Gm-Message-State: AOAM531g51IrKhVI6usklfS7JcWZvtmazGaH+1swPYKvAuR2LmoOOm0g
 ap3U/sUcC4NpGbA2dyymj8c=
X-Google-Smtp-Source: ABdhPJwPhhzlBoZBbIky3xJy9D56Co3Wqz3Aenz2eKdcRToUGQK2AHxnLc9BT4DUNODipsaBi4cEeQ==
X-Received: by 2002:a17:906:9381:: with SMTP id
 l1mr7604021ejx.380.1592397991140; 
 Wed, 17 Jun 2020 05:46:31 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d6sm12210552edn.75.2020.06.17.05.46.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 05:46:30 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: <paul@xen.org>, "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'Xen-devel'" <xen-devel@lists.xenproject.org>
References: <20200615141532.1927-1-andrew.cooper3@citrix.com>
 <003101d64337$06b202c0$14160840$@xen.org>
In-Reply-To: <003101d64337$06b202c0$14160840$@xen.org>
Subject: RE: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
Date: Wed, 17 Jun 2020 13:46:28 +0100
Message-ID: <005f01d644a5$52dd8470$f8988d50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQBu9n1OIN1/SF0JEfFzSQwAilcbPAFLsmhVq6D/2CA=
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
Cc: 'Ian Jackson' <Ian.Jackson@citrix.com>, 'Jan Beulich' <JBeulich@suse.com>,
 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Paul Durrant <xadimgnik@gmail.com>
> Sent: 15 June 2020 18:04
> To: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Xen-devel' =
<xen-devel@lists.xenproject.org>
> Cc: 'Wei Liu' <wl@xen.org>; 'Jan Beulich' <JBeulich@suse.com>; 'Ian =
Jackson' <Ian.Jackson@citrix.com>;
> 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>
> Subject: RE: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
>=20
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf =
Of Andrew Cooper
> > Sent: 15 June 2020 15:15
> > To: Xen-devel <xen-devel@lists.xenproject.org>
> > Cc: Wei Liu <wl@xen.org>; Paul Durrant <paul@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>;
> Jan
> > Beulich <JBeulich@suse.com>; Ian Jackson <Ian.Jackson@citrix.com>; =
Roger Pau Monn=C3=A9
> > <roger.pau@citrix.com>
> > Subject: [PATCH for-4.14 0/9] XSA-320 follow for IvyBridge
> >
> > This is some work in light of IvyBridge not gaining microcode to =
combat SRBDS
> > / XSA-320.  It is a mix of some work I'd planned for 4.15, and some =
patches
> > posted already and delayed due to dependence's I'd discovered =
after-the-fact.
> >
> > This provides a more user-friendly way of making IvyBridge safe by =
default
> > without encountering migration incompatibilities.
> >
> > In terms of functionality, it finishes the "fresh boot" vs =
"migrate/restore
> > from pre-4.14" split in the libxc CPUID logic, and uses this to let =
us safely
> > hide features by default without breaking the "divine what a guest =
may have
> > seen previously" logic on migrate.
> >
> > On top of that, we hide RDRAND by default to mitigate XSA-320.
> >
> > Additionally, take the opportunity of finally getting this logic =
working to
> > hide MPX by default (as posted previously), due to upcoming Intel =
timelines.
> >
> > Request for 4.14.  The IvyBridge angle only became apparent after =
the public
> > embargo on Tue 9th.  Otherwise, I would have made a concerted effort =
to get
> > this logic sorted sooner and/or part of XSA-320 itself.
> >
> > Strictly speaking, patches 1-4 aren't necessary, but without them =
the logic is
> > very confusing to follow, particularly the reasoning about the =
safely of later
> > changes.  As it is a simple set of transforms, we're better with =
them than
> > without.
> >
> > Also, the MPX patch isn't related to the RDRAND issue, but I was =
planning to
> > get it into 4.14 already, until realising that the migration path =
was broken.
> > Now that the path is fixed for the RDRAND issue, include the MPX =
patch as it
> > pertains to future hardware compatibility (and would be backported =
to 4.14.1
> > if it misses 4.14.0).
> >
>=20
> Fair enough. Once the series has all the requisite maintainer acks =
then I'll release-ack it.
>=20

I believe all acks are now place so the series is...

Release-acked-by: Paul Durrant <paul@xen.org>




