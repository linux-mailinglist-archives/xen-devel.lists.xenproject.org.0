Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A109B7A1E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 12:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828654.1243639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Tp0-0002rd-1X; Thu, 31 Oct 2024 11:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828654.1243639; Thu, 31 Oct 2024 11:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Toz-0002oT-V1; Thu, 31 Oct 2024 11:58:37 +0000
Received: by outflank-mailman (input) for mailman id 828654;
 Thu, 31 Oct 2024 11:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=35SK=R3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t6Toy-0002oN-Hk
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 11:58:36 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73c75abb-977f-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 12:58:33 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a9a6acac4c3so143024166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 04:58:33 -0700 (PDT)
Received: from localhost ([217.156.233.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e565df901sm60037066b.117.2024.10.31.04.58.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 04:58:26 -0700 (PDT)
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
X-Inumbo-ID: 73c75abb-977f-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzIiLCJoZWxvIjoibWFpbC1lajEteDYzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjczYzc1YWJiLTk3N2YtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzc1OTEzLjQzNTczNiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730375913; x=1730980713; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bggf4DF2cHqh5fhuHFkq3Qfu6vouzBgGcSzOsgxzj0=;
        b=DE6bljpK1uVAtRsdnj1MPSEndT3xdx+EYn5cGGzX4T3tS7CKrcTHi7Vv20s2hU4adT
         QMAHO3Ikckwy9bu8WI6tv4FBytuVTHuGvKSt0Nnsh5akEjoMfsNmbLiUW+5IeHlJ259V
         4+J+GQSBMDjqpXnFl2ZHkDwyf3D52d6Z/93IA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730375913; x=1730980713;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0bggf4DF2cHqh5fhuHFkq3Qfu6vouzBgGcSzOsgxzj0=;
        b=LzL1WhHZvpy3Pjm3w9C5H+w7CCddWyyp5ffjjrObsamcfEHC97i0nrcYjBhAsjzXo1
         P7kosrQCPjXVjW82Hv/nrPHLmO2LLEpa/RB1dhRjw/8IRV8WO3710X5V/1qT6RF3w9cb
         6h+qfvwIQH7S/u5ImqDhR5qnZq8X+nkshQpP+uL+3Q/8e+PRl4MkQ/1TvmhNOuiffGfN
         xBB+NvjsAOvogGNr+WqEC7Ke5EwzOKLPZYOFNC5+d9FpGhN0B5gAgHNOi7E80O/PoNid
         Tnuije3Ce66AJir5ACD4d0R+oKRGnU4ek72HLeQrp7hgb5Lpo1Keh5wDYh8PxpNNLsOc
         ZzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuIN79XhcXkPnd/xIis/2Khr5FnmmZMzoUeNVd4Z6Ha5HSuF+pMLs/ejF9OMIkPCtdOp0kkQFVqQM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzfnhVao3H7Z0blxVjHvcHD7+dx35D8leB/g49kzMLSMeIRlKDc
	risDb0fJ4+QEZZqWnlk+Un3Hh/MdW/vdixXbU5MSl+nMZ+jZ8S8hCPN9WSQYxoE=
X-Google-Smtp-Source: AGHT+IF1j9izE0WXvoANcdKytXIJchxPRBiXi5Bz4CrFOO1vinmwjcVRYth4SBuq0QUS4IVgGPpdMQ==
X-Received: by 2002:a17:907:9729:b0:a9a:7f92:782 with SMTP id a640c23a62f3a-a9de61ea441mr1756943466b.52.1730375907140;
        Thu, 31 Oct 2024 04:58:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 31 Oct 2024 11:58:24 +0000
Message-Id: <D59Z2CO4QOAK.KWLIRVJEV4XY@cloud.com>
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich"
 <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini"
 <sstabellini@kernel.org>
Subject: Re: [PATCH 1/6] xen: add a domain unique id to each domain
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Juergen Gross" <jgross@suse.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241023131005.32144-1-jgross@suse.com>
 <20241023131005.32144-2-jgross@suse.com>
 <D538TV4LGFZF.J375ZVYWPIHO@cloud.com>
 <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>
In-Reply-To: <cc607d38-1638-4f43-b0d3-b03842e8d9b9@suse.com>

On Wed Oct 23, 2024 at 3:27 PM BST, Juergen Gross wrote:
> On 23.10.24 16:08, Alejandro Vallejo wrote:
> > On Wed Oct 23, 2024 at 2:10 PM BST, Juergen Gross wrote:
> >> Xenstore is referencing domains by their domid, but reuse of a domid
> >> can lead to the situation that Xenstore can't tell whether a domain
> >> with that domid has been deleted and created again without Xenstore
> >> noticing the domain is a new one now.
> >>
> >> Add a global domain creation unique id which is updated when creating
> >> a new domain, and store that value in struct domain of the new domain.
> >> The global unique id is initialized with the system time and updates
> >> are done via the xorshift algorithm which is used for pseudo random
> >> number generation, too (see https://en.wikipedia.org/wiki/Xorshift).
> >>
> >> Signed-off-by: Juergen Gross <jgross@suse.com>
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> V1:
> >> - make unique_id local to function (Jan Beulich)
> >> - add lock (Julien Grall)
> >> - add comment (Julien Grall)
> >> ---
> >>   xen/common/domain.c     | 20 ++++++++++++++++++++
> >>   xen/include/xen/sched.h |  3 +++
> >>   2 files changed, 23 insertions(+)
> >>
> >> diff --git a/xen/common/domain.c b/xen/common/domain.c
> >> index 92263a4fbd..3948640fb0 100644
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -562,6 +562,25 @@ static void _domain_destroy(struct domain *d)
> >>       free_domain_struct(d);
> >>   }
> >>  =20
> >> +static uint64_t get_unique_id(void)
> >> +{
> >> +    static uint64_t unique_id;
> >> +    static DEFINE_SPINLOCK(lock);
> >> +    uint64_t x =3D unique_id ? : NOW();
> >> +
> >> +    spin_lock(&lock);
> >> +
> >> +    /* Pseudo-randomize id in order to avoid consumers relying on seq=
uence. */
> >> +    x ^=3D x << 13;
> >> +    x ^=3D x >> 7;
> >> +    x ^=3D x << 17;
> >> +    unique_id =3D x;

How "unique" are they? With those shifts it's far less obvious to know how =
many
times we can call get_unique_id() and get an ID that hasn't been seen since
reset. With sequential numbers it's pretty obvious that it'd be a
non-overflowable monotonic counter. Here's it's far less clear, particularl=
y
when it's randomly seeded.

I don't quite see why sequential IDs are problematic. What is this
(pseudo)randomization specifically trying to prevent? If it's just breaking=
 the
assumption that numbers go in strict sequence you could just flip the high =
and
low nibbles (or any other deterministic swapping of counter nibbles)

Plus, with the counter going in sequence we could get rid of the lock becau=
se
an atomic fetch_add() would do.

> >> +
> >> +    spin_unlock(&lock);
> >> +
> >> +    return x;
> >> +}
> >> +
> >>   static int sanitise_domain_config(struct xen_domctl_createdomain *co=
nfig)
> >>   {
> >>       bool hvm =3D config->flags & XEN_DOMCTL_CDF_hvm;
> >> @@ -654,6 +673,7 @@ struct domain *domain_create(domid_t domid,
> >>  =20
> >>       /* Sort out our idea of is_system_domain(). */
> >>       d->domain_id =3D domid;
> >> +    d->unique_id =3D get_unique_id();
> >>  =20
> >>       /* Holding CDF_* internal flags. */
> >>       d->cdf =3D flags;
> >> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> >> index 90666576c2..1dd8a425f9 100644
> >> --- a/xen/include/xen/sched.h
> >> +++ b/xen/include/xen/sched.h
> >> @@ -370,6 +370,9 @@ struct domain
> >>       domid_t          domain_id;
> >>  =20
> >>       unsigned int     max_vcpus;
> >> +
> >> +    uint64_t         unique_id;       /* Unique domain identifier */
> >> +
> >=20
> > Why not xen_domain_handle_t handle, defined later on? That's meant to b=
e a
> > UUID, so this feels like a duplicate field.
>
> It is an input value for create domain. So there is absolutely no
> guarantee that it is unique.
>
> It can especially be specified in the xl config file, so you could have
> a host running multiple guests all with the same UUID (even if this might
> be rejected by libxl, destroying a guest and then recreating it with the
> same UUID is possible, but Xenstore would need to see different unique Id=
s
> for those 2 guests).

Fair points. With that into account, I wouldn't mind seeing a wider comment=
 on
top of unique_id explaining how these IDs are meant to be non-repeatable
between resets and meant to have the same lifetime as their corresponding
domain_id.

>
>
> Juergen

Cheers,
Alejandro

