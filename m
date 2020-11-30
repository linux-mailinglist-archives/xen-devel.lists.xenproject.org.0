Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2672C8423
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 13:31:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41107.74217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjiKV-00080T-HJ; Mon, 30 Nov 2020 12:30:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41107.74217; Mon, 30 Nov 2020 12:30:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjiKV-000804-Dg; Mon, 30 Nov 2020 12:30:55 +0000
Received: by outflank-mailman (input) for mailman id 41107;
 Mon, 30 Nov 2020 12:30:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a3VR=FE=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kjiKT-0007zz-Gb
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 12:30:53 +0000
Received: from mail-wm1-x333.google.com (unknown [2a00:1450:4864:20::333])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 046ee015-77f2-455e-a5ab-73d3674ca24a;
 Mon, 30 Nov 2020 12:30:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id h21so24911435wmb.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 04:30:52 -0800 (PST)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:8931:214a:807a:cb80])
 by smtp.gmail.com with ESMTPSA id t136sm24840963wmt.18.2020.11.30.04.30.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 04:30:51 -0800 (PST)
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
X-Inumbo-ID: 046ee015-77f2-455e-a5ab-73d3674ca24a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=dBtgtnNJH3xBmi7xgLCoFbo4xZGyYbGw3S9XIhTwjyk=;
        b=XOvroQPsAx074IVQFN4F3wmKFcE1+cUEdaG6vskqhWIw/ZqvoV+yzaa88BHQrqAGbq
         6O7Dhz7ce4XEXT0wsSpaqAtezirStKSGYVHeQ3aJzxUWhh68CNlPUCjAWGxplhr9hWQF
         W1B8+wGkvX1KWVyLjwavCQgRs//tlng6p3Os9Ug8vEVT5uh7doV30EZ3weruq2m2sznB
         Yi2PGnyJKA6f2sv3NJFJsby/QxAZ/gZoT9JcbNJjZ4Jtp1+Aq6YmyyDcw8W3df4Nt38W
         6a1HNRhY/jwbPUBjsIlQfoAt2iWYDDTAzPEkRWgxo1fmBMu1Hhz5KqwlYIXTg+bZB0B/
         hfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=dBtgtnNJH3xBmi7xgLCoFbo4xZGyYbGw3S9XIhTwjyk=;
        b=A2EU1wiaY8Mg5CCs/E4lCUV5O6NJfLu0PRXMq2ZX718wAbNb4TadbiJQjtiZhPB+Sz
         /LAfA1sDHc1aUG8QqDH4aCskf8Gs6NT0TLeZt2uCHb4mBjlTRwKrh/XzkH00QGYaKiEu
         +wYFg+8hYK1a3YEtQcvuqz2FLd2oVH2nIHYRzsgvHL9lGS/dfRT+jOCfS2xVHQD+cW7L
         uXzoiOG3334SZ4xQ1Ww9yZ+hN5WVw/WKjJPDMqJZOVoOu3pqGRLsNAJgQd4z9YXjL9wz
         5FqgLGVxSvXgsaRedoV7+LHq+v18VhP1pot28XTSJNZ5DfQxHJ/PLeR7CGISBYgMek08
         IBfA==
X-Gm-Message-State: AOAM532M60o7DqkL8DDatdVrsn9pShHeVRX0H7cS1dvZJM9LdQcoZsPy
	mFKAAswwr4FUuW+LKLEu2go=
X-Google-Smtp-Source: ABdhPJw139Atj6av+JfjKFdaKCBKc71kcLcGZS4IPA+5E8nNBia3R7jEE9XMY9UwJXuXk9Pzvp/b/Q==
X-Received: by 2002:a1c:f315:: with SMTP id q21mr12552776wmq.1.1606739451603;
        Mon, 30 Nov 2020 04:30:51 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
	"'Kevin Tian'" <kevin.tian@intel.com>,
	<xen-devel@lists.xenproject.org>
References: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com> <013601d6c705$f09fd9a0$d1df8ce0$@xen.org> <221431d9-2435-f106-af46-0641f5a4e8f8@suse.com>
In-Reply-To: <221431d9-2435-f106-af46-0641f5a4e8f8@suse.com>
Subject: RE: [PATCH v4] IOMMU: make DMA containment of quarantined devices optional
Date: Mon, 30 Nov 2020 12:30:50 -0000
Message-ID: <013d01d6c714$a379a520$ea6cef60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI15LetYabIv76Hs54hT8VKRuHZ1QKvQI13ATnQLI2pAxZn4A==
Content-Language: en-gb

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 30 November 2020 11:59
> To: paul@xen.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Kevin Tian' =
<kevin.tian@intel.com>; xen-
> devel@lists.xenproject.org
> Subject: Re: [PATCH v4] IOMMU: make DMA containment of quarantined =
devices optional
>=20
> On 30.11.2020 11:45, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 27 November 2020 16:46
> >>
> >> --- a/docs/misc/xen-command-line.pandoc
> >> +++ b/docs/misc/xen-command-line.pandoc
> >> @@ -1278,7 +1278,7 @@ detection of systems known to misbehave
> >>  > Default: `new` unless directed-EOI is supported
> >>
> >>  ### iommu
> >> -    =3D List of [ <bool>, verbose, debug, force, required, =
quarantine,
> >> +    =3D List of [ <bool>, verbose, debug, force, required, =
quarantine[=3Dscratch-page],
> >>                  sharept, intremap, intpost, crash-disable,
> >>                  snoop, qinval, igfx, amd-iommu-perdev-intremap,
> >>                  dom0-{passthrough,strict} ]
> >> @@ -1316,11 +1316,32 @@ boolean (e.g. `iommu=3Dno`) can override t
> >>      will prevent Xen from booting if IOMMUs aren't discovered and =
enabled
> >>      successfully.
> >>
> >> -*   The `quarantine` boolean can be used to control Xen's behavior =
when
> >> -    de-assigning devices from guests.  If enabled (the default), =
Xen always
> >> +*   The `quarantine` option can be used to control Xen's behavior =
when
> >> +    de-assigning devices from guests.
> >> +
> >> +    When a PCI device is assigned to an untrusted domain, it is =
possible
> >> +    for that domain to program the device to DMA to an arbitrary =
address.
> >> +    The IOMMU is used to protect the host from malicious DMA by =
making
> >> +    sure that the device addresses can only target memory assigned =
to the
> >> +    guest.  However, when the guest domain is torn down, assigning =
the
> >> +    device back to the hardware domain would allow any in-flight =
DMA to
> >> +    potentially target critical host data.  To avoid this, =
quarantining
> >> +    should be enabled.  Quarantining can be done in two ways: In =
its basic
> >> +    form, all in-flight DMA will simply be forced to encounter =
IOMMU
> >> +    faults.  Since there are systems where doing so can cause host =
lockup,
> >> +    an alternative form is available where writes to memory will =
be made
> >> +    fault, but reads will be directed to a dummy page.  The =
implication
> >> +    here is that such reads will go unnoticed, i.e. an admin may =
not
> >> +    become aware of the underlying problem.
> >> +
> >> +    Therefore, if this option is set to true (the default), Xen =
always
> >>      quarantines such devices; they must be explicitly assigned =
back to Dom0
> >> -    before they can be used there again.  If disabled, Xen will =
only
> >> -    quarantine devices the toolstack hass arranged for getting =
quarantined.
> >> +    before they can be used there again.  If set to =
"scratch-page", still
> >> +    active DMA reads will additionally be directed to a "scratch" =
page.  If
> >
> > There's inconsistency of terms here. We should choose either 'dummy =
page'
> > or 'scratch page' (and my vote goes for the latter).
>=20
> Oh, that wasn't intentional. I've replaced all "dummy" now.
>=20
> > Also, rather than true or false, shouldn't we have 'off', 'basic', =
and
> > 'scratch-page'?
>=20
> I didn't want to break (or needlessly extend) the present boolean =
nature
> of the option. Hence I only added "scratch-page". I wouldn't want to =
add
> "basic" as an alias of "true", but if you think we really need this, =
then
> I surely could do so. As to "off" vs "false" - both are permitted =
anyway
> by the parsing functions. And to me (both as a programmer and as =
someone
> who had been studying maths long ago) something that's boolean goes
> rather with true/false than on/off; I can certainly change that =
wording
> if you deem that more appropriate / helpful for the target audience.
>=20

I think that once the option gained a third value it ceased to be a =
boolean and hence setting to true/false is really only for =
compatibility, hence I think an 'off', 'basic', 'scratch-page' enum =
would now make more sense (even if true/false still works underneath the =
covers).

  Paul

> Jan


