Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99671BC1DC
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 16:51:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTRZ0-0000fj-1I; Tue, 28 Apr 2020 14:50:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xCBN=6M=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jTRYy-0000fb-NK
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 14:50:20 +0000
X-Inumbo-ID: 946837f6-895f-11ea-ae69-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 946837f6-895f-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 14:50:19 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id s10so25004401wrr.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Apr 2020 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=jetBIG79dStyA5xjWjEgrRqpRB6Q9dvYvXjWfbTeQ1g=;
 b=p8ww9LjnyyVBgw2qJSPEClpPnqmNwGQ2aaRCQW6rdWCGKm4ssB8Wy0MP6Ei8s8m2na
 odAqZ85z+2b69auOR+RXdKO1fFy8dQBHI1UjpF/Cg/OGIhzk3H2zjI0ooPEHFABheR6R
 8kSWBtdacdqrQwm8CxEurN7AAkh5YvZLxOvbLR0JUOv0SS2HT36ki8//MpO49oEdfvo+
 KWmUUexi4PTD/ring8peWFLBnXkj9L9ewmzWMWkYtjmZVdPhAKpVBj5ZQzdbywv5rhid
 cSE22Vaa23hFHzUCLvHz38u6jn4iCegpvXbrDDO0oFE1pxLIPgNtXAZwgtKRIALApPbM
 Q3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=jetBIG79dStyA5xjWjEgrRqpRB6Q9dvYvXjWfbTeQ1g=;
 b=VdgBPI2Nu+E+5KDKibaPPvAJDkpe5QRT2bX4Azq442XNGq/bJ2Db28HXZaKkVJpR+W
 UU97vJQvIvKTeg2/v0MGIvm2dZ+8CenF0C2+EfMt5KD4xWAD7gNvayL+1IQzPwWCI6D1
 nHxFIq7CI7hedW4l1vpmI7L5+GvkyKMq2DSLUZ8tiCuLekTL6fP3e6u/YEsq6nOf2bD2
 6CYYC6T7r1Z4J0uYXuafl9kLlM5ejf2Jils9+nHlN2SE+mOP1gtHCySTQZ3vUERSjZk6
 ucqeyU+GL+yppYcXB9Xl0ZgiQJP0DpjlbLgVSMk99gVjLPowqSjlY5Oj/p3ZrlOD1Jxn
 qs7Q==
X-Gm-Message-State: AGi0PuYl7q+abtFPc/l+M1W/o6QIvIlTN5S/c905zulkh/h/jGWYCMvv
 Gy02NQK9ZmfkIMPyh+tMMNA=
X-Google-Smtp-Source: APiQypLgXk0QlU/44WrRv89aJ5zNSltj36+tvHynPDGF93IhLKDKTe92g5pdzni0yW9j094PR4BmMw==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr36346317wrw.198.1588085418968; 
 Tue, 28 Apr 2020 07:50:18 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.188])
 by smtp.gmail.com with ESMTPSA id y18sm3860378wmc.45.2020.04.28.07.50.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Apr 2020 07:50:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'J=C3=BCrgen_Gro=C3=9F'?= <jgross@suse.com>,
 "'Julien Grall'" <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200427155035.668-1-paul@xen.org>
 <7ab25832-66e6-020f-b343-059f21771054@xen.org>
 <f13de8bc-ca5d-2341-3797-b34f9f2c70ef@suse.com>
 <2087b3dd-7d2c-3ab3-d6ce-a4d132f7ec4d@xen.org>
 <000c01d61d5b$00bc05c0$02341140$@xen.org>
 <bb0a87e5-4112-107a-b15b-0edf1e616f87@suse.com>
In-Reply-To: <bb0a87e5-4112-107a-b15b-0edf1e616f87@suse.com>
Subject: RE: [PATCH v4] docs/designs: re-work the xenstore migration
 document...
Date: Tue, 28 Apr 2020 15:50:16 +0100
Message-ID: <000f01d61d6c$5583e8f0$008bbad0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQHlntLxHS5TXNWYohOpoPk3VAlj7gIKOtGYAd6p4dIC8EMlIAIdFegiAglAXqKoF56wcA==
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
> From: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>
> Sent: 28 April 2020 13:56
> To: paul@xen.org; 'Julien Grall' <julien@xen.org>; =
xen-devel@lists.xenproject.org
> Cc: 'Paul Durrant' <pdurrant@amazon.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'George Dunlap'
> <george.dunlap@citrix.com>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; =
'Jan Beulich'
> <jbeulich@suse.com>; 'Stefano Stabellini' <sstabellini@kernel.org>; =
'Wei Liu' <wl@xen.org>
> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore migration =
document...
>=20
> On 28.04.20 14:46, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Julien Grall <julien@xen.org>
> >> Sent: 28 April 2020 11:23
> >> To: J=C3=BCrgen Gro=C3=9F <jgross@suse.com>; Paul Durrant =
<paul@xen.org>; xen-devel@lists.xenproject.org
> >> Cc: Paul Durrant <pdurrant@amazon.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George Dunlap
> >> <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>;
> >> Stefano Stabellini <sstabellini@kernel.org>; Wei Liu <wl@xen.org>
> >> Subject: Re: [PATCH v4] docs/designs: re-work the xenstore =
migration document...
> >>
> >> Hi Juergen,
> >>
> >> On 28/04/2020 11:10, J=C3=BCrgen Gro=C3=9F wrote:
> >>> On 28.04.20 11:05, Julien Grall wrote:
> >>>>> -where tx_id is the non-zero identifier values of an open =
transaction.
> >>>>> +| Field     | Description                                       =
|
> >>>>> =
+|-----------|---------------------------------------------------|
> >>>>> +| `domid`   | The domain-id that owns the shared page           =
|
> >>>>> +|           |                                                   =
|
> >>>>> +| `tdomid`  | The domain-id that `domid` acts on behalf of if   =
|
> >>>>> +|           | it has been subject to an SET_TARGET              =
|
> >>>>> +|           | operation [2] or DOMID_INVALID [3] otherwise      =
|
> >>>>> +|           |                                                   =
|
> >>>>> +| `flags`   | Must be zero                                      =
|
> >>>>> +|           |                                                   =
|
> >>>>> +| `evtchn`  | The port number of the interdomain channel used   =
|
> >>>>> +|           | by `domid` to communicate with xenstored          =
|
> >>>>> +|           |                                                   =
|
> >>>>> +| `mfn`     | The MFN of the shared page for a live update or   =
|
> >>>>> +|           | ~0 (i.e. all bits set) otherwise                  =
|
> >>>>> -### Protocol Extension
> >>>>> +Since the ABI guarantees that entry 1 in `domid`'s grant table =
will
> >>>>> always
> >>>>> +contain the GFN of the shared page, so for a live update `mfn` =
can
> >>>>> be used to
> >>>>> +give confidence that `domid` has not been re-cycled during the =
update.
> >>>>
> >>>> I am confused, there is no way a XenStored running in an Arm =
domain
> >>>> can map the MFN of the shared page. So how is this going to work =
out?
> >>>
> >>> I guess this will be a MFN for PV guests and a guest PFN else.
> >>
> >> If we use Xen terminology (xen/include/xen/mm.h), this would be a =
GFN.
> >>
> >
> > TBH I'm not sure a GFN would give much confidence about domain =
recycling as it would likely be the
> same for many domains, I think. We really need a UUID.
>=20
> No, we need a per-host domain value, which is associated with a domain
> and which is unique during the life-time of the host.
>=20
> E.g. a global counter, which is incremented at each domain creation =
and
> stored in struct domain.
>=20

Can we just drop this and fall back on the fact that libxl now prevents =
domids from being recycled for 60s?

  Paul


