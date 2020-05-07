Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8B1C8381
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 09:35:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWb38-0006Ac-1Q; Thu, 07 May 2020 07:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FcBF=6V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jWb36-0006AX-Fm
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 07:34:28 +0000
X-Inumbo-ID: 2e03ce4e-9035-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e03ce4e-9035-11ea-ae69-bc764e2007e4;
 Thu, 07 May 2020 07:34:27 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id t12so4520952edw.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2020 00:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=pr1cp3PhdwgQmdUwHzDCUMPbJGv0zkM1yqKo1lf845A=;
 b=NfoOGi+ahTDjbKJG2lG14lwH7iSxhTrkJUmqVJSTLXYozjtmOux/S5QHz0L4LWPz9Z
 2zQU4g6m03lmNSXtUmcvKHnVTVY2j2gpuaT4yc5KCZxl3dP2w491eLZZvjxf9PDs38uB
 oifhjS43U31l8CpQXlGNNVAsuZLJeSx4zpXIKi7RBzEmJgdKddYHbXo0VHryMXiZPp5k
 WnByOx0BJVwjxfYCHLqDfaSoKGLmu1SE1qpwtV9XVqBQHJrUVOoYCfYBlgjjjXJ95VkM
 pYYyLFH4opfITv/jnVg8bb0BilZFuNEmYg5vZKcgAvSNA09z6lJLNErApiVFur879Ifw
 R2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=pr1cp3PhdwgQmdUwHzDCUMPbJGv0zkM1yqKo1lf845A=;
 b=UBhGkwticCL0zbspZmi2RlRC+kEWmP1YuCirKHGdzsIfocyzq/O1LMtrI4O7FUsK89
 UWYxzVCI9q4TQ7+TBVjq6M52pXjz4BctLKCtY/cX8RCIHMKA8g5Mn/40QI4TrfA3YslN
 u+9P6sqVNerg6hCvnJnAaA1kp4IZKbrGI/4z9LNyi52VFZHMbDpjAKvmrgMjFuQVhHrE
 AKvOohk79wEzk7H3GEtnmRPY5uOGvU7ilVY3RUpJ5XI7ZKgtxp6COqg0/XlhnFtKa9Cu
 9g/lNHqz9tDB0K8dlxVb3Hg62oyWuTTLl0fwP9it+VYrzlrqXuZCB109LRcMbPNPtfsp
 Hltg==
X-Gm-Message-State: AGi0PuYAWJZvi2sJu0I5+jdLDAh6SLIe3836Xo7Jq/SIjdcVt8bTi96B
 +SI7gHRoFk9ooVqaZ9JSPq4=
X-Google-Smtp-Source: APiQypJbQNI9HfziaJCUbnJQ7tETXi9MC6H6a/wTCwCubc0/g6xBFxfwaGkuJNLaREY2bN5q5HqzLA==
X-Received: by 2002:a05:6402:1b08:: with SMTP id
 by8mr10504521edb.286.1588836866472; 
 Thu, 07 May 2020 00:34:26 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id n26sm548782edo.36.2020.05.07.00.34.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 00:34:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-2-paul@xen.org>
 <d5013c9d-b1a9-6139-a120-741332d6e086@suse.com>
 <009601d623c5$9547abc0$bfd70340$@xen.org>
 <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
In-Reply-To: <63772836-3b3c-753a-18e5-d9fe3a6666a2@suse.com>
Subject: RE: [PATCH v2 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Date: Thu, 7 May 2020 08:34:24 +0100
Message-ID: <00ab01d62441$ef2630e0$cd7292a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIOC3/NwyZzJjhdRz0oBcI7Is/lxwF9QIbqAnK/qAwCoq+JvwFlXK23p+yqL4A=
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
> Sent: 07 May 2020 08:22
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
> Subject: Re: [PATCH v2 1/5] xen/common: introduce a new framework for =
save/restore of 'domain' context
>=20
> On 06.05.2020 18:44, Paul Durrant wrote:
> >> From: Jan Beulich <jbeulich@suse.com>
> >> Sent: 29 April 2020 12:02
> >>
> >> On 07.04.2020 19:38, Paul Durrant wrote:
> >>> +int domain_load_begin(struct domain_context *c, unsigned int tc,
> >>> +                      const char *name, const struct vcpu *v, =
size_t len,
> >>> +                      bool exact)
> >>> +{
> >>> +    if ( c->log )
> >>> +        gdprintk(XENLOG_INFO, "%pv load: %s (%lu)\n", v, name,
> >>> +                 (unsigned long)len);
> >>> +
> >>> +    BUG_ON(tc !=3D c->desc.typecode);
> >>> +    BUG_ON(v->vcpu_id !=3D c->desc.vcpu_id);
> >>> +
> >>> +    if ( (exact && (len !=3D c->desc.length)) ||
> >>> +         (len < c->desc.length) )
> >>> +        return -EINVAL;
> >>
> >> How about
> >>
> >>     if ( exact ? len !=3D c->desc.length
> >>                : len < c->desc.length )
> >>
> >
> > Yes, that doesn't look too bad.
> >
> >> ? I'm also unsure about the < - don't you mean > instead? Too
> >> little data would be compensated by zero padding, but too
> >> much data can't be dealt with. But maybe I'm getting the sense
> >> of len wrong ...
> >
> > I think the < is correct. The caller needs to have at least enough
> > space to accommodate the context record.
>=20
> But this is load, not save - the caller supplies the data. If
> there's less data than can be fit, it'll be zero-extended. If
> there's too much data, the excess you don't know what to do
> with (it might be okay to tolerate it being all zero).
>=20

But this is a callback. The outer load function iterates over the =
records calling the appropriate hander for each one. Those handlers then =
call this function saying how much data they expect and whether they =
want exactly that amount, or whether they can tolerate less (i.e. =
zero-extend). Hence len < c->desc.length is an error, because it means =
the descriptor contains more data than the hander knows how to handle.

> >>> +        if ( (!handlers[i].per_vcpu && c.desc.vcpu_id) ||
> >>> +             (c.desc.vcpu_id >=3D d->max_vcpus) )
> >>> +            break;
> >>> +
> >>> +        v =3D d->vcpu[c.desc.vcpu_id];
> >>> +
> >>> +        if ( flags & DOMAIN_SAVE_FLAG_IGNORE )
> >>> +        {
> >>> +            /* Sink the data */
> >>> +            rc =3D domain_load_entry(&c, c.desc.typecode, =
"IGNORED",
> >>> +                                   v, NULL, c.desc.length, true);
> >>
> >> IOW the read handlers need to be able to deal with a NULL dst?
> >> Sounds a little fragile to me. Is there a reason
> >> domain_load_data() can't skip the call to read()?
> >
> > Something has to move the cursor so sinking the data using a
> > NULL dst seemed like the best way to avoid the need for a
> > separate callback function.
>=20
> And domain_load_data() can't itself advance the cursor in such
> a case, with no callback involved at all?
>=20

How could it do that without a callback? Doing such a thing negates the =
utility of the ignore flag anyway since it implies the caller is going =
to edit the load stream in advance. Since I'm going to drop the ignore =
flag in v3 anyway, this is all a bit academic.

> >>> +    uint16_t typecode;
> >>> +    /*
> >>> +     * Each entry will contain either to global or per-vcpu =
domain state.
> >>> +     * Entries relating to global state should have zero in this =
field.
> >>
> >> Is there a reason to specify zero?
> >>
> >
> > Not particularly but I thought it best to at least specify a value =
in all cases.
>=20
> A specific value is certainly a good idea; I wonder though whether
> an obviously invalid one (like ~0) wouldn't be better then,
> allowing this ID to later be assigned meaning in such cases if
> need be.
>=20

Ok, that sounds reasonable. I'll #define something for convenience.

> >>> +     */
> >>> +    uint16_t vcpu_id;
> >>
> >> Seeing (possibly) multi-instance records in HVM state (PIC, =
IO-APIC, HPET),
> >> wouldn't it be better to generalize this to ID, meaning "vCPU ID" =
just for
> >> per-vCPU state?
> >
> > True, a generic 'instance' would be needed for such records. I'll so =
as you suggest.
>=20
> Which, along with my comment on domain_save_begin() taking a
> struct vcpu * right now, will then indeed require changing
> to a (struct domain *, unsigned int instance) tuple, I guess.
>=20

Yes.

  Paul


