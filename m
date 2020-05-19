Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155091D9AD2
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:11:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3tZ-0007Q3-7c; Tue, 19 May 2020 15:11:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FgAx=7B=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jb3tX-0007Pu-Uh
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:11:04 +0000
X-Inumbo-ID: f4134eb4-99e2-11ea-b07b-bc764e2007e4
Received: from mail-wm1-x336.google.com (unknown [2a00:1450:4864:20::336])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4134eb4-99e2-11ea-b07b-bc764e2007e4;
 Tue, 19 May 2020 15:11:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id z4so3443607wmi.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=qMwYAFJLioADAxSImpNd1LRDbB+GBLFEvjKE5vTlJUc=;
 b=kUanKqJQbExiRWpiSKBsdVmzttDXKDPlniyxDVytrPWAjvWUect3bnZvb0e390Qk3c
 SNK2vJhFwYn/dFAtQlVoN0ZyrQOftrR7j0njSZEfyeAMYQ2Q21io94/3ulA+ApIFnBR9
 kKgbWwtHcN163diTIrRFNeYXBv8xIZ6ZqI8hlNfMGkngKuYhH8tA+r/e2v4J8eTUVWXq
 KL1OFKCCjKXgItC8G0v3NnOsXiW76HM8vrm5u8y5gDqRSgtlL3WtGt0aBmQQK29DbcGy
 eSqVmKzY9kZDv63X/5y1TePOri3VBazLcIB+sS5BufTZoBjwsd4IQal3o+80ClvCVERf
 /n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=qMwYAFJLioADAxSImpNd1LRDbB+GBLFEvjKE5vTlJUc=;
 b=CsetT95hJh6gYZKXDEwjTyJFmwK4c5Hr6GdvidZrF4Y53GQqyBVeLoQSfDMH8vgutt
 HpDuKwvVqu3EH0O2tL6+0S7j7zQs4Aq1rqSnnmfcu4DtYdmy7LpCNIrtOtUjuhXbdpRY
 aHYX0scahAX2yDofGvt/UhsAXDZMCXumKwGOje9CMWaDo7VjqHGLjFXpi+vjlQLQ+ELZ
 kHqbX0II748oJxzFvf9jDvewusJiJ+4FGQca5mNQUS/DyHaOnFR3LykXj+hGbR7mRs0P
 Md6ksSZ3IzkCVNnznnrikqlbAr0NNpDsEE7EpYcsJ4dBF2WKo7VQsnF67Xxd0AvFSHyO
 z9kQ==
X-Gm-Message-State: AOAM532VS48YKzXmjVhD9gjtsd3bW9ANHSez1RGoHSjp5IONHfSbuasq
 J1oWbbpKLV6aoEG3FniNk3c=
X-Google-Smtp-Source: ABdhPJx9iMQRuoMMIngtTRF/vNSuh3VXSdQe9V2O7UlK3MaJPMT+u6etpCLzRHAQ5v+Zt8ssGfIYHA==
X-Received: by 2002:a1c:25c3:: with SMTP id l186mr6045677wml.103.1589901062015; 
 Tue, 19 May 2020 08:11:02 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id u16sm20778836wrq.17.2020.05.19.08.10.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 08:11:01 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200514104416.16657-1-paul@xen.org>
 <20200514104416.16657-2-paul@xen.org>
 <c1da7ff1-2c3a-02d1-cfa1-18840db37566@suse.com>
 <000401d62de6$7cb6efa0$7624cee0$@xen.org>
 <080a1fa3-eb1e-e3b2-c52e-5c7ffdabc6eb@suse.com>
In-Reply-To: <080a1fa3-eb1e-e3b2-c52e-5c7ffdabc6eb@suse.com>
Subject: RE: [PATCH v3 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Tue, 19 May 2020 16:10:59 +0100
Message-ID: <000601d62def$b4f64380$1ee2ca80$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH3ss8UVmWNzdPcdrMljFFlRuFHxQJ5sln4ApsaflcBRS23fQEQzGDfqDEiQUA=
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
> Sent: 19 May 2020 15:24
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
> On 19.05.2020 16:04, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 19 May 2020 14:04
> >>
> >> On 14.05.2020 12:44, Paul Durrant wrote:
> >>> --- /dev/null
> >>> +++ b/xen/include/xen/save.h
> >>> @@ -0,0 +1,165 @@
> >>> +/*
> >>> + * save.h: support routines for save/restore
> >>> + *
> >>> + * Copyright Amazon.com Inc. or its affiliates.
> >>> + *
> >>> + * This program is free software; you can redistribute it and/or =
modify it
> >>> + * under the terms and conditions of the GNU General Public =
License,
> >>> + * version 2, as published by the Free Software Foundation.
> >>> + *
> >>> + * This program is distributed in the hope it will be useful, but =
WITHOUT
> >>> + * ANY WARRANTY; without even the implied warranty of =
MERCHANTABILITY or
> >>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public =
License for
> >>> + * more details.
> >>> + *
> >>> + * You should have received a copy of the GNU General Public =
License along with
> >>> + * this program; If not, see <http://www.gnu.org/licenses/>.
> >>> + */
> >>> +
> >>> +#ifndef XEN_SAVE_H
> >>> +#define XEN_SAVE_H
> >>> +
> >>> +#include <xen/init.h>
> >>> +#include <xen/sched.h>
> >>> +#include <xen/types.h>
> >>> +
> >>> +#include <public/save.h>
> >>> +
> >>> +struct domain_context;
> >>> +
> >>> +int domain_save_begin(struct domain_context *c, unsigned int =
typecode,
> >>> +                      const char *name, unsigned int instance);
> >>> +
> >>> +#define DOMAIN_SAVE_BEGIN(_x, _c, _instance) \
> >>> +    domain_save_begin((_c), DOMAIN_SAVE_CODE(_x), #_x, =
(_instance))
> >>
> >> As per prior conversation I would have expected no leading =
underscores
> >> here anymore, and no parenthesization of what is still _c. More of
> >> these further down.
> >
> > What's wrong with leading underscores in macro arguments? They can't
> > pollute any namespace.
>=20
> They can still hide file scope variables legitimately named
> this way (which may get accessed by a macro without being a
> macro argument). The wording of the standard is quite clear:
> "All identifiers that begin with an underscore are always
> reserved for use as identifiers with file scope in both the
> ordinary and tag name spaces."
>=20

Ok.

> > Also, I prefer to keep the parentheses for arguments.
>=20
> More code churn then once we hopefully standardize of the less
> obfuscating variant without.
>=20

If we standardize that way, so be it.

> >>> +static inline int domain_load_entry(struct domain_context *c,
> >>> +                                    unsigned int typecode, const =
char *name,
> >>> +                                    unsigned int *instance, void =
*dst,
> >>> +                                    size_t len)
> >>> +{
> >>> +    int rc;
> >>> +
> >>> +    rc =3D domain_load_begin(c, typecode, name, instance);
> >>
> >> For some reason I've spotted this only here: Why is instance a =
pointer
> >> parameter of the function, when typecode is a value? Both live next =
to
> >> one another in struct domain_save_descriptor, and hence instance =
could
> >> be retrieved at the same time as typecode.
> >>
> >
> > Because the typecode is known a priori. It has to be known for the
> > correct handler to be invoked. It is only provided here for
> > verification purposes. I could have provided the instance as an
> > argument to the load handler but I prefer making the interactions
> > for save and load more symmetric.
>=20
> Hmm, I don't see any symmetry violation in the alternative model,
> but anyway.
>=20
> >>> +/*
> >>> + * Register save and restore handlers. Save handlers will be =
invoked
> >>> + * in order of DOMAIN_SAVE_CODE().
> >>> + */
> >>> +#define DOMAIN_REGISTER_SAVE_RESTORE(_x, _save, _load)            =
\
> >>> +    static int __init __domain_register_##_x##_save_restore(void) =
\
> >>> +    {                                                             =
\
> >>> +        domain_register_save_type(                                =
\
> >>> +            DOMAIN_SAVE_CODE(_x),                                 =
\
> >>> +            #_x,                                                  =
\
> >>> +            &(_save),                                             =
\
> >>> +            &(_load));                                            =
\
> >>> +                                                                  =
\
> >>> +        return 0;                                                 =
\
> >>> +    }                                                             =
\
> >>> +    __initcall(__domain_register_##_x##_save_restore);
> >>
> >> I'm puzzled by part of the comment: Invoking by save code looks
> >> reasonable for the saving side (albeit END doesn't match this rule
> >> afaics), but is this going to be good enough for the consuming =
side?
> >
> > No, this only relates to the save side which is why the comment
> > says 'Save handlers'. I do note that it would be more consistent
> > to use 'load' rather than 'restore' here though.
> >
> >> There may be dependencies between types, and with fixed ordering
> >> there may be no way to insert a depended upon type ahead of an
> >> already defined one (at least as long as the codes are meant to be
> >> stable).
> >>
> >
> > The ordering of load handlers is determined by the stream. I'll
> > add a sentence saying that.
>=20
> I.e. the consumer of the "get" interface (and producer of the stream)
> is supposed to take apart the output it gets, bring records into
> suitable order (which implies it knows of all the records, and which
> hence means this code may need updating in cases where I'd expect
> only the hypervisor needs), and only then issue to the stream?

The intention is that the stream is always in a suitable order so the =
load side does not have to do any re-ordering.

  Paul



