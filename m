Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655591D9B52
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:32:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4EQ-0001Hq-T9; Tue, 19 May 2020 15:32:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb4EP-0001Hi-Au
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:32:37 +0000
X-Inumbo-ID: f719c7ca-99e5-11ea-9887-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f719c7ca-99e5-11ea-9887-bc764e2007e4;
 Tue, 19 May 2020 15:32:36 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id t8so1008312wmi.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=8xUB9agd8Bv+WpPFwSobRBf7XV+WGDNHnCZb3KIZVLM=;
 b=MVqS2U2rrZxnnYm2ohM2jjwi7KzmEETA3Ve/Jz2JhuaEpf1RWIXN5G1n5mxiu9Viau
 XZ1kELnNKU+bzHxCfHP+DqsFOSU3noMKFmpAYSrAOavrHRjNIaSyfI/ooONpyro9+UsO
 hBqd1YT0cbhLFDBDimCoOe+l3JqrjTvl+bFkXdDM9hlnlFI0RBany20veOo5zi637caT
 u7dZUlSbstol0rUxy6xFyf4vxgdfb6CdHVpw1foL/KjYMoSUf+b/O65uh/BWT7/4sFj1
 qSrWBUrYheVN60gsiDIg9a9ebysCqfVDbsWLz1IG+widpEMDWOxVmGrlRRE2KlH0YfY4
 yoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=8xUB9agd8Bv+WpPFwSobRBf7XV+WGDNHnCZb3KIZVLM=;
 b=rTgv3h6NUaWbvWFm3vMC/FjIdLkYDV62nd4rJmSGV66SrMmdP1YJO9ZnkUD7IoTC83
 hwGqPFrnXBQBQjRFcNApAiq0NdDZN6fMPEgG7d1Q4Lgx6UT/RWI1THQIp6v8niUvsmr0
 Jqedf3HaUUFNPH4Ri3q2dFU69NbQDGu/O7mOl5bezLXI2ECuzPgipkbsBJ2euwoMV1sI
 E4xJxlRTarYLW/w9Gngj699a4u3r49BgpCWmSY3kUQKeAfVupuMkCtzlXznStQmJIl34
 ZUzAJhguN/z2aiHOecG/i8sV++qNO2X4dxtEkwAA+0xjLhE0eQOOfB/xc5GxX48UMjwR
 orTw==
X-Gm-Message-State: AOAM5317PTHwP/j4TgY7E1jIYruX+4SXdo9Y8IkZ4TYb9yUZOIUy+Xyu
 Xih8U+QSdkpi0tOycs6LCrE=
X-Google-Smtp-Source: ABdhPJxZpGvC/+B/cW+EmjllVgRwEBABC4XSXInrbQSYR8vV3NLIiQWplr0uBZt869xK2tZ646G64w==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr6424018wmc.189.1589902355529; 
 Tue, 19 May 2020 08:32:35 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id c140sm81503wmd.18.2020.05.19.08.32.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:32:34 -0700 (PDT)
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
In-Reply-To: <0ee39765-bc1a-e795-5b20-52ba7026e8d4@suse.com>
Subject: RE: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Tue, 19 May 2020 16:32:32 +0100
Message-ID: <000d01d62df2$b82534f0$286f9ed0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQJ5sln4ApsaflcBRS23fQEQzGDfAiNx2zUB4Wnn86gQ/8tw
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
> Sent: 19 May 2020 16:18
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
> On 19.05.2020 17:10, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 19 May 2020 15:24
> >>
> >> On 19.05.2020 16:04, Paul Durrant wrote:
> >>>> From: Jan Beulich <jbeulich@suse.com>
> >>>> Sent: 19 May 2020 14:04
> >>>>
> >>>> On 14.05.2020 12:44, Paul Durrant wrote:
> >>>>> +/*
> >>>>> + * Register save and restore handlers. Save handlers will be =
invoked
> >>>>> + * in order of DOMAIN_SAVE_CODE().
> >>>>> + */
> >>>>> +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)          =
  \
> >>>>> +    static int __init =
__domain_register_##_x##_save_restore(void) \
> >>>>> +    {                                                           =
  \
> >>>>> +        domain_register_save_type(                              =
  \
> >>>>> +            DOMAIN_SAVE_CODE(_x),                               =
  \
> >>>>> +            #_x,                                                =
  \
> >>>>> +            &(_save),                                           =
  \
> >>>>> +            &(_load));                                          =
  \
> >>>>> +                                                                =
  \
> >>>>> +        return 0;                                               =
  \
> >>>>> +    }                                                           =
  \
> >>>>> +    __initcall(__domain_register_##_x##_save_restore);
> >>>>
> >>>> I'm puzzled by part of the comment: Invoking by save code looks
> >>>> reasonable for the saving side (albeit END doesn't match this =
rule
> >>>> afaics), but is this going to be good enough for the consuming =
side?
> >>>
> >>> No, this only relates to the save side which is why the comment
> >>> says 'Save handlers'. I do note that it would be more consistent
> >>> to use 'load' rather than 'restore' here though.
> >>>
> >>>> There may be dependencies between types, and with fixed ordering
> >>>> there may be no way to insert a depended upon type ahead of an
> >>>> already defined one (at least as long as the codes are meant to =
be
> >>>> stable).
> >>>>
> >>>
> >>> The ordering of load handlers is determined by the stream. I'll
> >>> add a sentence saying that.
> >>
> >> I.e. the consumer of the "get" interface (and producer of the =
stream)
> >> is supposed to take apart the output it gets, bring records into
> >> suitable order (which implies it knows of all the records, and =
which
> >> hence means this code may need updating in cases where I'd expect
> >> only the hypervisor needs), and only then issue to the stream?
> >
> > The intention is that the stream is always in a suitable order so =
the
> > load side does not have to do any re-ordering.
>=20
> I understood this to be the intention, but what I continue to not
> understand is where / how the save side orders it suitably. "Save
> handlers will be invoked in order of DOMAIN_SAVE_CODE()" does not
> allow for any ordering, unless at the time of the introduction of
> a particular code you already know what others it may depend on
> in the future, reserving appropriate codes.
>=20

That's just how it is *now*. If a new code is defined that needs to be =
in the stream before one of the existing ones then we'll have to =
introduce a more elaborate scheme to deal with that at the time. Using =
the save code as the array index and iterating in that order is purely a =
convenience, and the load side does not depend on entries being in save =
code order.

> And as said - END also doesn't look to fit this comment.
>=20

Ok, I can add a comment stating that exception.

  Paul

> Jan


