Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4474B1BBDEA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 14:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTPcx-0004k6-2t; Tue, 28 Apr 2020 12:46:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTPcv-0004k1-5G
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 12:46:17 +0000
X-Inumbo-ID: 3fb9b966-894e-11ea-9887-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fb9b966-894e-11ea-9887-bc764e2007e4;
 Tue, 28 Apr 2020 12:46:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id d15so22863653wrx.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 05:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ZF6X9MK9bnvI26djs/DVkR1dePxmQfXjJO91jKtNZaI=;
 b=MuEVij+ATJixfr7xYv3LAxQTZSxAP48f2SHI09pHWjB8Y5AWPgaUwoJ952vQ6As0WR
 JN7gu7BAslSh2L4jar7GXXldIgPe+qoQlUItgpmnjBGYBKWJPvHrfH1lHqXvn57rojal
 YJvUsyudiVLtE2x2iQw36f/xzkIzSJNjUEsd90XqBbvcCE346PIAnL73H0Twg5dky9LE
 YPPjoeecWXSyYa5MnjPHp9OK/cegVto+ISB7WX0lRqTjhYmo7eBe2bLZrdMONizOw9eI
 e1BfNjZXnReQattnZI/8vJ216oFyHHmoFXZ5JY64FQ150sidvJ5w5D69JduIa+IfgUOZ
 E6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ZF6X9MK9bnvI26djs/DVkR1dePxmQfXjJO91jKtNZaI=;
 b=N8AUA5R+EsjthW008JMN2I7XwD0MWZ0FI4aDrxH7GsW9ADZx0nbztiveUE5cghugiU
 beCulDgXGSmOGMspv8GrS3p9ahYvZVygam9A00tV5l6rARO2yTQLGH2pJ0NsZ1nQ4m15
 tHF/jKzoioVcGnVYbKYKGqrpO/9cOBTouwp/4ESEh/oGVzaS949ezwu//lSHinYHRQ4B
 1l491F5Vyi/osG5Xk4tbd19aDYtHXb/HRpN/elAu3fhjV5X086rr9ANlcZwXuw9kR6pj
 lSc1MpDnn8iiZji6pV64inTOnAAfgGZ5DGEnAw3x6m07ScBII6DcIAKoF9YorksE9BIh
 p0ug==
X-Gm-Message-State: AGi0PuZh+s7+CtBin1lnqSKianBvFIq9ntXDfmsP/GvhM3dAPnS0XL7T
 E9m6uItgUQfatAeXIIzyWJo=
X-Google-Smtp-Source: APiQypJ+u2WXmP+PC2RK+xFrWRwLTUQ7Pgj/tubCq2+LXb16T0NOIoc4iw3xLO1SwnfPE2LvWareYw==
X-Received: by 2002:a05:6000:12c5:: with SMTP id
 l5mr34127675wrx.185.1588077975432; 
 Tue, 28 Apr 2020 05:46:15 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id r2sm3273942wmg.2.2020.04.28.05.46.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 05:46:14 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <20200427155035.668-1-paul@xen.org>
 <7ab25832-66e6-020f-b343-059f21771054@xen.org>
 <f13de8bc-ca5d-2341-3797-b34f9f2c70ef@suse.com>
 <2087b3dd-7d2c-3ab3-d6ce-a4d132f7ec4d@xen.org>
In-Reply-To: <2087b3dd-7d2c-3ab3-d6ce-a4d132f7ec4d@xen.org>
Subject: RE: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
Date: Tue, 28 Apr 2020 13:46:12 +0100
Message-ID: <000c01d61d5b$00bc05c0$02341140$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHlntLxHS5TXNWYohOpoPk3VAlj7gIKOtGYAd6p4dIC8EMlIKg4raFw
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
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 28 April 2020 11:23
> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Paul Durrant =
<paul@xen.org>; xen-devel@lists.xenproject.org
> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> <george.dunlap@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>; =
Jan Beulich <jbeulich@suse.com>;
> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration =
document...
>=20
> Hi Juergen,
>=20
> On 28/04/2020 11:10, J=C3=BCrgen Gro=C3=9F wrote:
> > On 28.04.20 11:05, Julien Grall wrote:
> >>> -where tx_id is the non-zero identifier values of an open =
transaction.
> >>> +| Field     | Description                                       |
> >>> +|-----------|---------------------------------------------------|
> >>> +| `domid`   | The domain-id that owns the shared page           |
> >>> +|           |                                                   |
> >>> +| `tdomid`  | The domain-id that `domid` acts on behalf of if   |
> >>> +|           | it has been subject to an SET_TARGET              |
> >>> +|           | operation [2] or DOMID_INVALID [3] otherwise      |
> >>> +|           |                                                   |
> >>> +| `flags`   | Must be zero                                      |
> >>> +|           |                                                   |
> >>> +| `evtchn`  | The port number of the interdomain channel used   |
> >>> +|           | by `domid` to communicate with xenstored          |
> >>> +|           |                                                   |
> >>> +| `mfn`     | The MFN of the shared page for a live update or   |
> >>> +|           | ~0 (i.e. all bits set) otherwise                  |
> >>> -### Protocol Extension
> >>> +Since the ABI guarantees that entry 1 in `domid`'s grant table =
will
> >>> always
> >>> +contain the GFN of the shared page, so for a live update `mfn` =
can
> >>> be used to
> >>> +give confidence that `domid` has not been re-cycled during the =
update.
> >>
> >> I am confused, there is no way a XenStored running in an Arm domain
> >> can map the MFN of the shared page. So how is this going to work =
out?
> >
> > I guess this will be a MFN for PV guests and a guest PFN else.
>=20
> If we use Xen terminology (xen/include/xen/mm.h), this would be a GFN.
>=20

TBH I'm not sure a GFN would give much confidence about domain recycling =
as it would likely be the same for many domains, I think. We really need =
a UUID.

> >
> >>
> >> [...]
> >>
> >>> -START_DOMAIN_TRANSACTION    <domid>|<transid>|
> >>> +    0       1       2       3    octet
> >>> ++-------+-------+-------+-------+
> >>> +| conn-id                       |
> >>> ++-------------------------------+
> >>> +| tx-id                         |
> >>> ++---------------+---------------+
> >>> +| path-len      | value-len     |
> >>> ++---------------+---------------+
> >>> +| access        | perm-count    |
> >>> ++---------------+---------------+
> >>> +| perm1                         |
> >>> ++-------------------------------+
> >>> +...
> >>> ++-------------------------------+
> >>> +| permN                         |
> >>> ++---------------+---------------+
> >>> +| path
> >>> +...
> >>> +| value
> >>> +...
> >>> +```
> >>> +
> >>> +
> >>> +| Field        | Description                                    |
> >>> +|--------------|------------------------------------------------|
> >>> +| `conn-id`    | If this value is non-zero then this record     |
> >>> +|              | related to a pending transaction               |
> >>
> >> If conn-id is 0, how do you know the owner of the node?
> >
> > The first permission entry's domid is the owner.
>=20
> I think this should be spell out in the specification.
>=20

In xenstore.txt, there is a reference to =
https://wiki.xen.org/wiki/XenBus

This explains things reasonably well; I'll reference it here and add =
some words too.

  Paul


