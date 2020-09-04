Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A025E0C1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 19:29:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kEFW3-00056b-7j; Fri, 04 Sep 2020 17:28:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6qam=CN=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1kEFW2-00056W-Ap
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 17:28:46 +0000
X-Inumbo-ID: bab0f3c9-71b5-45c4-900d-ef7915749d72
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bab0f3c9-71b5-45c4-900d-ef7915749d72;
 Fri, 04 Sep 2020 17:28:45 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id c18so7478110wrm.9
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2020 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=kpSep/RCTxETnJzAxV3BLxc1kPA+UZfYDUZQ0sqCLAo=;
 b=PMEbwRlQmiJWDNtb883VlWqjpC6qTcVU7oHfT9z16HC+ImvdBSrdIvuwy00SBPUQxG
 dpeBgfw231kjkdG91bndjxQtYWcIWrBNs7mKxIRoWwK0M3eR1M7R628xu9FQxU6SKjIN
 2NKIBv5n7Nd/rtrvs79DPlD+MNIECa48E7XQAtcuEXcTUkkOkKfK44MQBLlr5FesAsaM
 3nxKpUkSBXIoYPoYX+g6WoQnpoMDh4qy/CqbDUv7IIypBoY1XN7ybkxbEcYZlx+oWtYK
 aY8VFwcFA43krpyMcDTrkOq8UHjqYzKDDHAhVSWKHjGSRJw2jJWpZHVgTJ3Pd6RSF9BJ
 DyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=kpSep/RCTxETnJzAxV3BLxc1kPA+UZfYDUZQ0sqCLAo=;
 b=ODKbw2gsbmjj3BIzP/sfXdwLxn4JlxAc/TtIHL6/gPx0CJT1fHIuxWC2pACQVk7K/r
 Lb6EuiMmD4oOkA6y4jEZP+Ej/x4X7W9YLrINDGaG3+6q7PY73FRMVQiiWJDUHgPDdURM
 mw+pvv/G94Fw94xvKRCetA+/U+EC1jBmhfLPHeAMn4d6APZGFOlGAg5j90HQRkR5uNeG
 4HqqXvzFvx57tuvEcXasp2/tFFCZssrgF6OD+zlOWGNbxKyrlUPgxt9Q/Dhg4fqEkZvI
 i8MlmE7OU5wc5SIYw/6iNyu6QuW5RQ791K2qhD34qiuTWGEhkm/Uk3QLDBLyPjpxxS4q
 w9cg==
X-Gm-Message-State: AOAM5328Qxkjd1eE2iRXWBqIJzvv5O/yAWKC13+Q1n72cXXON5lkK4yc
 MmrmR3tBzHjg76MDJJHfzH4=
X-Google-Smtp-Source: ABdhPJxWjf+NCada09sww/7HNSbQ8IvhYhI7UHbsv903IBm6xT79u1RsJ+rNSLM4oJGX/ApDO0d0YA==
X-Received: by 2002:a5d:43cb:: with SMTP id v11mr9172128wrr.188.1599240524458; 
 Fri, 04 Sep 2020 10:28:44 -0700 (PDT)
Received: from CBGR90WXYV0 ([2a00:23c5:5785:9a01:c940:c3c6:26f0:df49])
 by smtp.gmail.com with ESMTPSA id b84sm15205424wmd.0.2020.09.04.10.28.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 10:28:43 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
Cc: <xen-devel@lists.xenproject.org>, "'Paul Durrant'" <pdurrant@amazon.com>,
 "'Ian Jackson'" <ian.jackson@eu.citrix.com>, "'Wei Liu'" <wl@xen.org>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>,
 "'George Dunlap'" <george.dunlap@citrix.com>,
 "'Julien Grall'" <julien@xen.org>,
 "'Stefano Stabellini'" <sstabellini@kernel.org>
References: <20200818103032.3050-1-paul@xen.org>
 <20200818103032.3050-8-paul@xen.org>
 <cd33c5ce-ea85-6576-b9f2-b4dec90d5025@suse.com>
In-Reply-To: <cd33c5ce-ea85-6576-b9f2-b4dec90d5025@suse.com>
Subject: RE: [PATCH v7 7/9] common/domain: add a domain context record for
 shared_info...
Date: Fri, 4 Sep 2020 18:29:33 +0100
Message-ID: <003501d682e0$f4e8a1e0$deb9e5a0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI3t7iXj66qvRdG8GCx2a1a4xz7XAOSzcJJAlXszgioZwa3oA==
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 26 August 2020 14:58
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Ian Jackson
> <ian.jackson@eu.citrix.com>; Wei Liu <wl@xen.org>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Julien Grall <julien@xen.org>; =
Stefano Stabellini
> <sstabellini@kernel.org>
> Subject: Re: [PATCH v7 7/9] common/domain: add a domain context record =
for shared_info...
>=20
> On 18.08.2020 12:30, Paul Durrant wrote:
> > v7:
> >  - Only restore vcpu_info and arch sub-structures for PV domains, to =
match
> >    processing of SHARED_INFO in xc_sr_restore_x86_pv.c
>=20
> Since you point out this original logic, ...
>=20
> > +static int load_shared_info(struct domain *d, struct domain_context =
*c)
> > +{
> > +    struct domain_shared_info_context ctxt;
> > +    size_t hdr_size =3D offsetof(typeof(ctxt), buffer);
> > +    unsigned int i;
> > +    int rc;
> > +
> > +    rc =3D DOMAIN_LOAD_BEGIN(SHARED_INFO, c, &i);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( i ) /* expect only a single instance */
> > +        return -ENXIO;
> > +
> > +    rc =3D domain_load_data(c, &ctxt, hdr_size);
> > +    if ( rc )
> > +        return rc;
> > +
> > +    if ( ctxt.buffer_size > sizeof(shared_info_t) ||
> > +         (ctxt.flags & ~DOMAIN_SAVE_32BIT_SHINFO) )
> > +        return -EINVAL;
> > +
> > +    if ( ctxt.flags & DOMAIN_SAVE_32BIT_SHINFO )
> > +    {
> > +#ifdef CONFIG_COMPAT
> > +        has_32bit_shinfo(d) =3D true;
> > +#else
> > +        return -EINVAL;
> > +#endif
> > +    }
> > +
> > +    if ( is_pv_domain(d) )
> > +    {
> > +        shared_info_t *shinfo =3D xmalloc(shared_info_t);
> > +
> > +        rc =3D domain_load_data(c, shinfo, sizeof(*shinfo));
> > +        if ( rc )
> > +        {
> > +            xfree(shinfo);
> > +            return rc;
> > +        }
> > +
> > +#ifdef CONFIG_COMPAT
> > +        if ( has_32bit_shinfo(d) )
> > +        {
> > +            memcpy(&d->shared_info->compat.vcpu_info,
> > +                   &shinfo->compat.vcpu_info,
> > +                   sizeof(d->shared_info->compat.vcpu_info));
> > +            memcpy(&d->shared_info->compat.arch,
> > +                   &shinfo->compat.arch,
> > +                   sizeof(d->shared_info->compat.vcpu_info));
> > +        }
> > +        else
> > +        {
> > +            memcpy(&d->shared_info->native.vcpu_info,
> > +                   &shinfo->native.vcpu_info,
> > +                   sizeof(d->shared_info->native.vcpu_info));
> > +            memcpy(&d->shared_info->native.arch,
> > +                   &shinfo->native.arch,
> > +                   sizeof(d->shared_info->native.arch));
> > +        }
> > +#else
> > +        memcpy(&d->shared_info->vcpu_info,
> > +               &shinfo->vcpu_info,
> > +               sizeof(d->shared_info->vcpu_info));
> > +        memcpy(&d->shared_info->arch,
> > +               &shinfo->arch,
> > +               sizeof(d->shared_info->shared));
> > +#endif
>=20
> ... where does the rest of that logic (resetting of
> arch.pfn_to_mfn_frame_list_list, evtchn_pending, evtchn_mask, and
> evtchn_pending_sel) get done? Or why is it not needed anymore?

The resetting logic is still in xc_sr_restore_x86_pv.c (see patch #6). =
It's going to need to stay there anyway to deal with older streams so I =
made it common to both cases; it seems slightly separate from restoring =
the shared info.

  Paul

>=20
> Jan


