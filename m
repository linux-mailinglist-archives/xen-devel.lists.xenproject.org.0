Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 238ED1D9B71
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:39:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4KV-00020N-DE; Tue, 19 May 2020 15:38:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb4KU-00020E-DM
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:38:54 +0000
X-Inumbo-ID: d7b5cafe-99e6-11ea-b07b-bc764e2007e4
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d7b5cafe-99e6-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:38:53 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v12so16377922wrp.12
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=45qFdJLV05+sb+eUMWjh35IdxZxs0X3EIKbxPAbyabk=;
 b=l9svqPdRpNxGedIKHVmFoZRcPwJAB1V47TsZqXBtKRknXQSrgGPCVdwJzdKZIo1ZDj
 6zNK1dWUK6TAcshGfNj48WErBspkPb87UyO6bW5m0hXe9W188c4pN0LmiJU6CjPMmPR7
 +Lh2gipVfoM9gaVxeclHZ47I7WaQpiYau4xQcK1Bo+S3epsVRZF8nrhfokq42JoW7F+R
 QNCf2xzXv6HSO2xOa3Rs2F9qAewf6OVpVpZTXQYDiQr+yTKBgNznSkjmCSuDqqFYqODg
 wyNN2hq02dTmh2vADGWnN/VMcbS7mgkwskjSvv5YdoZkYybdndWdnYqZIrtOJGhx50U6
 qqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=45qFdJLV05+sb+eUMWjh35IdxZxs0X3EIKbxPAbyabk=;
 b=Zn1o1MIbux56oBa+hltCeEaVT+XEP6CyE7DwjNlZq656o3f1SYTtCDZVeHF9mHBx2+
 f3G2oZDRAD4+gM3XRHrmU7IdZ3VYwpgG8H9leyniOzZlEPqsVMQiJjE4Tqg8ie/ptmfn
 WnrnJ3XOkDDhJL1dAalzciioxJ1Y9E1q3xm6HJMaltegtiln9IaA1aF8LHyDUjj4D0Dh
 obzLkKHv+42qR2M8Nxc6yEmJyNPn8dzujTfMkndu/IGPoJ7IdNq+aQSzIahLKMNR3KXO
 w/yVz8onJX3lN3EJFjF6XUppfHpq8TxFgRIsSHfwVeL6u22OBc8wHo4mTf7PC4u4ggYZ
 iXwA==
X-Gm-Message-State: AOAM5336Q03RvRJgvuwpIDa+SR9nPY4N0DudTlHKmIlFmJDmPXkWt6Vn
 dgki0KoaAS3NFQZptHO8mws=
X-Google-Smtp-Source: ABdhPJyeNS1cgONRaE5skr+PNBSoFHYI05sg/gtVgVgKiZ+hrJPzl2L12AnkvDuW7xOyUMdta1VDIw==
X-Received: by 2002:a5d:6541:: with SMTP id z1mr26474996wrv.264.1589902732446; 
 Tue, 19 May 2020 08:38:52 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id a74sm87093wme.23.2020.05.19.08.38.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:38:51 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-2-paul@xen.org>
 <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
 <000401d62de6$7cb6efa0$7624cee0$@xen.org>
 <080a1fa3-eb1e-e3b2-c52e-5c7ffdabc6eb@suse.com>
 <000601d62def$b4f64380$1ee2ca80$@xen.org>
 <0ee39765-bc1a-e795-5b20-52ba7026e8d4@suse.com>
 <000d01d62df2$b82534f0$286f9ed0$@xen.org>
 <00609ed0-14f1-e957-52e8-8832f2708b91@suse.com>
In-Reply-To: <00609ed0-14f1-e957-52e8-8832f2708b91@suse.com>
Subject: RE: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Tue, 19 May 2020 16:38:49 +0100
Message-ID: <000f01d62df3$98b61160$ca223420$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQJ5sln4ApsaflcBRS23fQEQzGDfAiNx2zUB4Wnn8wJM5mTBAk6V1OKn7ChesA==
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 19 May 2020 16:37
> To: paul@xen.org
> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian Jackson'
> <ian.jackson@eu.citrix.com>; 'Julien Grall' <julien@xen.org>; 'Stefano =
Stabellini'
> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Volodymyr Babchuk' =
<Volodymyr_Babchuk@epam.com>;
> 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>
> Subject: Re: [PATCH v3 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 19.05.2020 17:32, Paul Durrant wrote:
> >> -----Original Message-----
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 19 May 2020 16:18
> >> To: paul@xen.org
> >> Cc: xen-devel@lists.xenproject.org; 'Paul Durrant' =
<pdurrant@amazon.com>; 'Andrew Cooper'
> >> <andrew.cooper3@citrix.com>; 'George Dunlap' =
<george.dunlap@citrix.com>; 'Ian Jackson'
> >> <ian.jackson@eu.citrix.com>; 'Julien Grall' <julien@xen.org>; =
'Stefano Stabellini'
> >> <sstabellini@kernel.org>; 'Wei Liu' <wl@xen.org>; 'Volodymyr =
Babchuk' <Volodymyr_Babchuk@epam.com>;
> >> 'Roger Pau Monn=C3=A9' <roger.pau@citrix.com>
> >> Subject: Re: [PATCH v3 1/5] xen/common: introduce a new framework =
for save/restore of 'domain'
> context
> >>
> >> On 19.05.2020 17:10, Paul Durrant wrote:
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 19 May 2020 15:24
> >>>>
> >>>> On 19.05.2020 16:04, Paul Durrant wrote:
> >>>>>> From: Jan Beulich <jbeulich@suse.com>
> >>>>>> Sent: 19 May 2020 14:04
> >>>>>>
> >>>>>> On 14.05.2020 12:44, Paul Durrant wrote:
> >>>>>>> +/*
> >>>>>>> + * Register save and restore handlers. Save handlers will be =
invoked
> >>>>>>> + * in order of DOMAIN_SAVE_CODE().
> >>>>>>> + */
> >>>>>>> +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)        =
    \
> >>>>>>> +    static int __init =
__domain_register_##_x##_save_restore(void) \
> >>>>>>> +    {                                                         =
    \
> >>>>>>> +        domain_register_save_type(                            =
    \
> >>>>>>> +            DOMAIN_SAVE_CODE(_x),                             =
    \
> >>>>>>> +            #_x,                                              =
    \
> >>>>>>> +            &(_save),                                         =
    \
> >>>>>>> +            &(_load));                                        =
    \
> >>>>>>> +                                                              =
    \
> >>>>>>> +        return 0;                                             =
    \
> >>>>>>> +    }                                                         =
    \
> >>>>>>> +    __initcall(__domain_register_##_x##_save_restore);
> >>>>>>
> >>>>>> I'm puzzled by part of the comment: Invoking by save code looks
> >>>>>> reasonable for the saving side (albeit END doesn't match this =
rule
> >>>>>> afaics), but is this going to be good enough for the consuming =
side?
> >>>>>
> >>>>> No, this only relates to the save side which is why the comment
> >>>>> says 'Save handlers'. I do note that it would be more consistent
> >>>>> to use 'load' rather than 'restore' here though.
> >>>>>
> >>>>>> There may be dependencies between types, and with fixed =
ordering
> >>>>>> there may be no way to insert a depended upon type ahead of an
> >>>>>> already defined one (at least as long as the codes are meant to =
be
> >>>>>> stable).
> >>>>>>
> >>>>>
> >>>>> The ordering of load handlers is determined by the stream. I'll
> >>>>> add a sentence saying that.
> >>>>
> >>>> I.e. the consumer of the "get" interface (and producer of the =
stream)
> >>>> is supposed to take apart the output it gets, bring records into
> >>>> suitable order (which implies it knows of all the records, and =
which
> >>>> hence means this code may need updating in cases where I'd expect
> >>>> only the hypervisor needs), and only then issue to the stream?
> >>>
> >>> The intention is that the stream is always in a suitable order so =
the
> >>> load side does not have to do any re-ordering.
> >>
> >> I understood this to be the intention, but what I continue to not
> >> understand is where / how the save side orders it suitably. "Save
> >> handlers will be invoked in order of DOMAIN_SAVE_CODE()" does not
> >> allow for any ordering, unless at the time of the introduction of
> >> a particular code you already know what others it may depend on
> >> in the future, reserving appropriate codes.
> >>
> >
> > That's just how it is *now*. If a new code is defined that needs to
> > be in the stream before one of the existing ones then we'll have to
> > introduce a more elaborate scheme to deal with that at the time.
> > Using the save code as the array index and iterating in that order
> > is purely a convenience, and the load side does not depend on
> > entries being in save code order.
>=20
> Could then you make the comment indicate so? This will allow people
> wanting to modify this do so more easily, without much digging in
> code or mail history.

Ok, I'll add some words to that effect.

  Paul

>=20
> Jan


