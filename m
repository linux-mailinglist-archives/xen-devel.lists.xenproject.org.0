Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C889B9108
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2024 13:13:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829064.1244136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qWc-0004u7-8E; Fri, 01 Nov 2024 12:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829064.1244136; Fri, 01 Nov 2024 12:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6qWc-0004r0-5e; Fri, 01 Nov 2024 12:13:10 +0000
Received: by outflank-mailman (input) for mailman id 829064;
 Fri, 01 Nov 2024 12:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Kj1=R4=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6qWa-0004qe-Cx
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2024 12:13:08 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5943a8d-984a-11ef-a0c5-8be0dac302b0;
 Fri, 01 Nov 2024 13:13:04 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso299038866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 01 Nov 2024 05:13:04 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e564c535esm172471866b.72.2024.11.01.05.13.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Nov 2024 05:13:03 -0700 (PDT)
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
X-Inumbo-ID: a5943a8d-984a-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImE1OTQzYThkLTk4NGEtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNDYzMTg0LjkxOTcxMSwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730463184; x=1731067984; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23JoFNDwFs+B1A5BeUhnMM9no+p9bjvPBo2Qk4WPzj8=;
        b=BJisX1aKp44Tm/fqrmP2VzH9H88TDsXRhOBphVyebztuh+iOOc6oVCcUoclIjmWyNj
         LeZLE1fe9kDNGKmESxpDxGQS2YEjSz2rpRfHLd8Ug+sWJC6lvaMv6OE9JRJ3TLu59QKM
         /2rBYrt5yVK9JBQxxAZIJh7t8l1+QUKeXtUqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730463184; x=1731067984;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=23JoFNDwFs+B1A5BeUhnMM9no+p9bjvPBo2Qk4WPzj8=;
        b=v2jxs1hY9Uit9DchXMSWjDDt6+Oae2/OZLoLjVojE4x5zddk+ngYjCtkxdz1QjTjsF
         xsvSWwfYmWNitrdbQm8ZHk1FeS0nBNB34VyBKx/6HzmNuFj+y0Aokv+kYTOmguk0hH6E
         aWzFwOVPAzy68ksWQu/Yq39LuYQLcgf1/ystWcnqGWjhh68dTn2kSLfkdh/YDwbl8UUZ
         4Jb3aRFQHhtbIrCDXH0XjNilD0M3/ctbKdkVqlvZaNbz0DrxELuhz3h/FdsbdndFFaCA
         lUq+9m+cPhrWiF9jxfVSWrZ6R6/6VT6xMOwno9tZygWAMJPwt3s1bW8FxY3/PyAtjzGk
         SIlg==
X-Forwarded-Encrypted: i=1; AJvYcCV3UFyOurcxLbD9yqxaJXA3h5egt80OA8u3OSfvZ+Bj1LBIl6p8yEz6Z+juBjM4VV8VtvGJoOAuMxo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztKk4gjuDHCoq6VK+b9X7TioGuIlD78Ez1uE4g+THGNlsGsbUR
	zv6XOSxjHjEGawpXEW+6buaHVoZdEK2vcd8XnKJw3uvoo8z0wmaDU/HHK8XvMkk=
X-Google-Smtp-Source: AGHT+IHEvUGXUzp5PzOdJIfh8eNAtmB8G7Dk4xjfd+9Utg9D13NM1oMGhX+8ILNJ7DUCtsSe2v6FPQ==
X-Received: by 2002:a17:907:8689:b0:a9a:bbcd:e63 with SMTP id a640c23a62f3a-a9de5ecd05dmr2248484566b.14.1730463183891;
        Fri, 01 Nov 2024 05:13:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 01 Nov 2024 12:13:02 +0000
Message-Id: <D5AU03CXVD4Z.2DF9CIPWUGHXH@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?J=C3=BCrgen_Gro=C3=9F?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
 <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
 <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
 <870f8639-335b-4b1e-bdd4-ffbb38ee3eb2@suse.com>
In-Reply-To: <870f8639-335b-4b1e-bdd4-ffbb38ee3eb2@suse.com>

On Fri Nov 1, 2024 at 7:06 AM GMT, J=C3=BCrgen Gro=C3=9F wrote:
> On 31.10.24 12:58, Alejandro Vallejo wrote:
> > On Wed Oct 23, 2024 at 3:27 PM BST, Juergen Gross wrote:
> >> On 23.10.24 16:08, Alejandro Vallejo wrote:
> >>> On Wed Oct 23, 2024 at 2:10 PM BST, Juergen Gross wrote:
> >>>> Xenstore is referencing domains by their domid, but reuse of a domid
> >>>> can lead to the situation that Xenstore can't tell whether a domain
> >>>> with that domid has been deleted and created again without Xenstore
> >>>> noticing the domain is a new one now.
> >>>>
> >>>> Add a global domain creation unique id which is updated when creatin=
g
> >>>> a new domain, and store that value in struct domain of the new domai=
n.
> >>>> The global unique id is initialized with the system time and updates
> >>>> are done via the xorshift algorithm which is used for pseudo random
> >>>> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).
> >>>>
> >>>> Signed-off-by: Juergen Gross <jgross@suse.com>
> >>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>>> ---
> >>>> V1:
> >>>> - make unique_id local to function (Jan Beulich)
> >>>> - add lock (Julien Grall)
> >>>> - add comment (Julien Grall)
> >>>> ---
> >>>>    xen/common/domain.c     | 20 ++++++++++++++++++++
> >>>>    xen/include/xen/sched.h |  3 +++
> >>>>    2 files changed, 23 insertions(+)
> >>>>
> >>>> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >>>> index 92263a4fbd..3948640fb0 100644
> >>>> --- a/xen/common/domain.c
> >>>> +++ b/xen/common/domain.c
> >>>> @@ -562,6 +562,25 @@ static void _domain_destroy(struct domain *d)
> >>>>        free_domain_struct(d);
> >>>>    }
> >>>>   =20
> >>>> +static uint64_t get_unique_id(void)
> >>>> +{
> >>>> +    static uint64_t unique_id;
> >>>> +    static DEFINE_SPINLOCK(lock);
> >>>> +    uint64_t x =3D unique_id ? : NOW();
> >>>> +
> >>>> +    spin_lock(&lock);
> >>>> +
> >>>> +    /* Pseudo-randomize id in order to avoid consumers relying on s=
equence. */
> >>>> +    x ^=3D x << 13;
> >>>> +    x ^=3D x >> 7;
> >>>> +    x ^=3D x << 17;
> >>>> +    unique_id =3D x;
> >=20
> > How "unique" are they? With those shifts it's far less obvious to know =
how many
> > times we can call get_unique_id() and get an ID that hasn't been seen s=
ince
> > reset. With sequential numbers it's pretty obvious that it'd be a
> > non-overflowable monotonic counter. Here's it's far less clear, particu=
larly
> > when it's randomly seeded.
>
> If you'd look into the Wikipedia article mentioned in the commit message
> you'd know that the period is 2^64 - 1.
>

Bah. I did, but skimmed too fast looking for keywords. Thanks for bearing w=
ith
me :). Ok, with that I'm perfectly happy.

  Reviewed-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

> > I don't quite see why sequential IDs are problematic. What is this
> > (pseudo)randomization specifically trying to prevent? If it's just brea=
king the
> > assumption that numbers go in strict sequence you could just flip the h=
igh and
> > low nibbles (or any other deterministic swapping of counter nibbles)
>
> That was a request from the RFC series of this patch.
>
> > Plus, with the counter going in sequence we could get rid of the lock b=
ecause
> > an atomic fetch_add() would do.
>
> Its not as if this would be a hot path. So the lock is no real issue IMO.
>
> >=20
> >>>> +
> >>>> +    spin_unlock(&lock);
> >>>> +
> >>>> +    return x;
> >>>> +}
> >>>> +
> >>>>    static int sanitise_domain_config(struct xen_domctl_createdomain =
*config)
> >>>>    {
> >>>>        bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
> >>>> @@ -654,6 +673,7 @@ struct domain *domain_create(domid_t domid,
> >>>>   =20
> >>>>        /* Sort out our idea of is_system_domain(). */
> >>>>        d->domain_id =3D domid;
> >>>> +    d->unique_id =3D get_unique_id();
> >>>>   =20
> >>>>        /* Holding CDF_* internal flags. */
> >>>>        d->cdf =3D flags;
> >>>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> >>>> index 90666576c2..1dd8a425f9 100644
> >>>> --- a/xen/include/xen/sched.h
> >>>> +++ b/xen/include/xen/sched.h
> >>>> @@ -370,6 +370,9 @@ struct domain
> >>>>        domid_t          domain_id;
> >>>>   =20
> >>>>        unsigned int     max_vcpus;
> >>>> +
> >>>> +    uint64_t         unique_id;       /* Unique domain identifier *=
/
> >>>> +
> >>>
> >>> Why not xen_domain_handle_t handle, defined later on? That's meant to=
 be a
> >>> UUID, so this feels like a duplicate field.
> >>
> >> It is an input value for create domain. So there is absolutely no
> >> guarantee that it is unique.
> >>
> >> It can especially be specified in the xl config file, so you could hav=
e
> >> a host running multiple guests all with the same UUID (even if this mi=
ght
> >> be rejected by libxl, destroying a guest and then recreating it with t=
he
> >> same UUID is possible, but Xenstore would need to see different unique=
 Ids
> >> for those 2 guests).
> >=20
> > Fair points. With that into account, I wouldn't mind seeing a wider com=
ment on
> > top of unique_id explaining how these IDs are meant to be non-repeatabl=
e
> > between resets and meant to have the same lifetime as their correspondi=
ng
> > domain_id.
>
> Okay, I can add such a comment.
>
>
> Juergen

Cheers,
Alejandro

