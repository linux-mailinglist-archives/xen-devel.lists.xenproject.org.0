Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5FA678C0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 17:10:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919490.1323923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZWP-0000Xf-Ia; Tue, 18 Mar 2025 16:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919490.1323923; Tue, 18 Mar 2025 16:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZWP-0000Uu-Fb; Tue, 18 Mar 2025 16:10:29 +0000
Received: by outflank-mailman (input) for mailman id 919490;
 Tue, 18 Mar 2025 16:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fIR5=WF=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tuZWN-0000Un-Qe
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 16:10:27 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81038f12-0413-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 17:10:26 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-aaf0f1adef8so548748766b.3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 09:10:26 -0700 (PDT)
Received: from localhost ([46.149.103.11]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3149ce9cesm871423366b.98.2025.03.18.09.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 09:10:25 -0700 (PDT)
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
X-Inumbo-ID: 81038f12-0413-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1742314226; x=1742919026; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1rTq7ZAf2/7mWefz051B5O7CCGRhCvbSzCYC0f/fNM=;
        b=U59SOXrsrcKuuEzpNh3i1TBjuIi49B+3yLaBqM1v44s5p0qlAO2putU8Nh0kh/iKnX
         c0thbUzjBoEEMDVUBz9cG9NsXqfbuZhBvoWNk69X9MYKsccoNE1jMMiwzwWTtvTsiUtW
         ocgC3G4/4SBqJNDdfMiu4OsZ/7UcD7mKYsdg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314226; x=1742919026;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q1rTq7ZAf2/7mWefz051B5O7CCGRhCvbSzCYC0f/fNM=;
        b=nb5D/9lhGmmcW59M81N3KmqkesUlNHLoRMtnTW2uzTXjPX4JCUfkUM9wd1lwGqjcTO
         f/fyGbicP/gDOiswrrLXOHmaqCOO/1a6IOmyWVX3fPjjIrSEhyGy8cXC9OD6eGp2z0Za
         R3nsc1LBfafSS4DHyi2F/Sk18KVJoKFTGdGhEF7ReCEx/Epz+Kb297yUkvzYOYhTeBP3
         oO8UqOsT+VPcgoLIBn4mRHHDwHKdhV0JBNBFRRkfK6VnGxkhvjN62beDMxohUuzqIDHc
         ytshWHReBd24Tg46gTDcPHZ592jZ8bsYcQcqBFDRMbZbeVqVXr3IhSDIeXgzpX37hyJP
         c5jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFIxbyiYMWT4JK3UkA8HAJuYyd+wnkBxRzu6S1f3mC7fIAjHx4UZLn9Y2DGPMdgHP19o2Wl+t4tAA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJkCJY1HT5cVuI2B1RmuaZ7dJyqfS++Pzr6XtzmJ3f23vgVG8Y
	JKU0aOGyhFhvFn57aZbUWYI42+l6CpezXOcSRdabKWoks3ct16YUiUo76pSJNXc=
X-Gm-Gg: ASbGncsYvygbAiw8hrgTY1JzDSPZOyL8e/KwjEaEtRsN2kNYaVUoCE9OK6tLJzjCs3I
	n4LEtsI8JQE/1usJ9GCss9QDg54vkE+ES5yKpT1zAE3CkFRbj9E4IPr++vR+f9InuNm5Tp0wlQk
	qzsT/0XGhNQiyz+hAdj9JfQzSLj8ZhNZphVs14E7OEnRUrMFnK2b1ZgMWHt097USqJ5fisAdweb
	vj46LK070An+QHG78FSTP+XJEj6NtuQirXHsUf0HPyrS9aNc3u5PTUhb7/pgb+PcQWKxmPkCkSU
	C6Itp9zRDIN/cGJscpOjfxIS3lTla6LBZ0fSnSVkWDRuJzhsqHLE1CaqlfGa9Q==
X-Google-Smtp-Source: AGHT+IHQAeRA1QR2HUD+f4wk4H61xwDtxzY1JqWAVJYg1UUKiCUIjuEhB8FCke/E8lYoas0gd7IOSg==
X-Received: by 2002:a17:906:c10d:b0:abf:70fb:7f05 with SMTP id a640c23a62f3a-ac3304d6057mr1751549166b.50.1742314225633;
        Tue, 18 Mar 2025 09:10:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Mar 2025 16:10:22 +0000
Message-Id: <D8JIUG8FXIEU.23WQK66PO369I@cloud.com>
Cc: "Bernhard Kaindl" <bernhard.kaindl@cloud.com>, "Andrew Cooper"
 <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>,
 "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 01/11] xen/memory: Mask XENMEMF_node() to 8 bits
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Jan Beulich" <jbeulich@suse.com>
X-Mailer: aerc 0.18.2
References: <20250314172502.53498-1-alejandro.vallejo@cloud.com>
 <20250314172502.53498-2-alejandro.vallejo@cloud.com>
 <314dee7c-1ee0-484a-921b-279617258325@suse.com>
In-Reply-To: <314dee7c-1ee0-484a-921b-279617258325@suse.com>

For the record, the rest of the series doesn't require this patch. I just
thought it was a strictly net-positive improvement on the current behaviour=
.

On Mon Mar 17, 2025 at 4:33 PM GMT, Jan Beulich wrote:
> On 14.03.2025 18:24, Alejandro Vallejo wrote:
> > As it is, it's incredibly easy for a buggy call to XENMEMF_node() to
> > unintentionally overflow into bit 17 and beyond. Prevent it by masking,
> > just like MEMF_* does.
>
> Yet then ...
>
> > --- a/xen/include/public/memory.h
> > +++ b/xen/include/public/memory.h
> > @@ -32,8 +32,9 @@
> >  #define XENMEMF_address_bits(x)     (x)
> >  #define XENMEMF_get_address_bits(x) ((x) & 0xffu)
> >  /* NUMA node to allocate from. */
> > -#define XENMEMF_node(x)     (((x) + 1) << 8)
> > -#define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
> > +#define XENMEMF_node_mask   (0xffu)
> > +#define XENMEMF_node(n)     ((((n) + 1) & XENMEMF_node_mask) << 8)
>
> ... this still won't have the intended effect: Rather than spilling into
> higher bits (with a certain chance of causing an error) you now truncate
> the node number, thus making the misbehavior almost certainly silent.

It has the intended effect of containing the effects of XENMEMF_node(n) to =
the
bits representing such mask.

There's an error either way, and either way you'll notice quite late too. O=
ne
of them has fully undefined consequences (possibly worth an XSA for systems
with separate xenstore or driver domains). This one contains the effects of
invalid data. A later patch in the series returns EINVAL in xc_claim_pages(=
) if
node >=3D 0xff to catch problematic inputs early, but that's a toolstack ma=
tter,
the API should be self-defending.

Note that this exact code is present in MEMF_node(n), in xen/mm.h Likely to
avoid the same sort of problem inside the hypervisor.

> Further, if you do this for the node, why not also for the address bits?
> (Rhetorical question; I don't really want you to do that.)
>
> Jan

Mostly because the series deals with memory management rather than anything
else. I do think address_bits should be subject to the same treatment for
identical reasons.

>
> > +#define XENMEMF_get_node(f) ((((f) >> 8) - 1) & XENMEMF_node_mask)
> >  /* Flag to populate physmap with populate-on-demand entries */
> >  #define XENMEMF_populate_on_demand (1<<16)
> >  /* Flag to request allocation only from the node specified */

Cheers,
Alejandro

