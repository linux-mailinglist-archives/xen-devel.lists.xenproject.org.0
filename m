Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB0439199A
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 16:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132531.247172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluH4-0004CB-TB; Wed, 26 May 2021 14:12:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132531.247172; Wed, 26 May 2021 14:12:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lluH4-0004AJ-Q9; Wed, 26 May 2021 14:12:42 +0000
Received: by outflank-mailman (input) for mailman id 132531;
 Wed, 26 May 2021 14:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JqRz=KV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lluH3-0004AD-Du
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 14:12:41 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64919c0-62b5-4f4a-aa49-ab2e3880485d;
 Wed, 26 May 2021 14:12:40 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b26so2761657lfq.4
 for <xen-devel@lists.xenproject.org>; Wed, 26 May 2021 07:12:40 -0700 (PDT)
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
X-Inumbo-ID: c64919c0-62b5-4f4a-aa49-ab2e3880485d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xOdUrHgzqsp1HZ0QrFZmpPzALlbxU/wNHYDvsX5bHK8=;
        b=Ck/c2wM600RTobbsJFz5z3CPRR4f0/DGN0TFzj1Zok6aK0WPBJv1I17+gQsiIWLiAd
         0Sv41yHRF5xFGvoiog3vpHEy3Kd274a0auIl8BVyIKYSp+/X+2v97HiTV+XjyrpOzVMh
         c+s4UUCILKLq/uARYHcAXCegwJcCehaunrGgzhMq3rlv/rXw3CSxYIWMAUXkmy72AnBf
         OGndZ+/9/+5mwbqtSo5I+28EICjXncg2dkrvDy17cwdlGpsUip89RqbYzdcfZl23CjR0
         V/TVWWHIINmlwdoKpReUoIDynOmuhUjO+iq8Bo509m8bDuCNLIVt0YMULGjcwf63G03b
         9k5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xOdUrHgzqsp1HZ0QrFZmpPzALlbxU/wNHYDvsX5bHK8=;
        b=c00kylmL0Fdg/NLuHNGf5UG9zkdrg5Lt2oMn8RWuodB4i8EtarpfdoLAVYxdSXd0G+
         X6bHx48INO1Wq3YMJEFKHDCe646KbVj68hV8GMmuarAzjopRFuei4HNwTZuazoX+n6/H
         EoqLeYAtxc1rB5RJCzeER2gNcJltY/ihTqVwx+SHRLvm+9O2F6xDRzYjY5WFFsdFrUWa
         cOcI6pFJoJJXqZzufMXYuUJgrUJr/C6gUbhP02yVfkYVeb34fahXisJ2Sh72Acd2rbkd
         LJdTfcYfkMW2wgfa3X00w8uRZJ0uH1q+cRy12P8n2tM4PlqdrENMO2/ZqEqULtmcNwdz
         hevw==
X-Gm-Message-State: AOAM533IH+l2caAWoB5b9T5K599KC01nYXYKrwjOtEhrN3LjLiaZlV9u
	kEBH8Tnzpyn4R0C/gwA5o28Kg2bv+sSnhKX2r0c=
X-Google-Smtp-Source: ABdhPJxiPvHexGKtrCXzK6nJWEA/ieEaRekMbTE4/Wqsb+1pqfB6MfBxj3G8HTS5ChATQr4//46bpvF7USQjbP4rqkk=
X-Received: by 2002:a05:6512:3c91:: with SMTP id h17mr2232729lfv.562.1622038359489;
 Wed, 26 May 2021 07:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210503192810.36084-1-jandryuk@gmail.com> <20210503192810.36084-2-jandryuk@gmail.com>
 <927b886a-9b0c-2162-763b-9c2147227b8c@suse.com>
In-Reply-To: <927b886a-9b0c-2162-763b-9c2147227b8c@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 May 2021 10:12:27 -0400
Message-ID: <CAKf6xptZ=tHUUX+NXMfUPz_=wJJz6_FbEG6BraXRgcRokK5bcg@mail.gmail.com>
Subject: Re: [PATCH 01/13] cpufreq: Allow restricting to internal governors only
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 9:18 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 03.05.2021 21:27, Jason Andryuk wrote:
> > For hwp, the standard governors are not usable, and only the internal
> > one is applicable.
>
> So you say "one" here but use plural in the subject. Which one is
> it (going to be)?

hwp only uses a single governor, but this is common code.  AMD or ARM
could require their own internal governor which is why the subject say
plural.

> >  Add the cpufreq_governor_internal boolean to
> > indicate when an internal governor, like hwp-internal, will be used.
> > This is set during presmp_initcall, so that it can suppress governor
>
> DYM s/is/will be/? Afaict this is going to happen later in the series.
> Which is a good indication that such "hanging in the air" changes
> aren't necessarily the best way of splitting a set of changes, ...

In terms of the patch series, yes, "will be".  The use of "is" is
directing how to use the feature.  Yes, it is "hanging in the air",
but I was trying to explain the "why" and "how" of using it.

I was trying to split this preparatory change from the actual hwp
introduction.  I suppose it could be ordered after hwp, and the extra,
unusable governors would be advertised until then.

> > --- a/xen/drivers/cpufreq/cpufreq.c
> > +++ b/xen/drivers/cpufreq/cpufreq.c
> > @@ -57,6 +57,7 @@ struct cpufreq_dom {
> >  };
> >  static LIST_HEAD_READ_MOSTLY(cpufreq_dom_list_head);
> >
> > +bool __read_mostly cpufreq_governor_internal;
>
> ... also supported by you introducing a non-static variable without
> any consumer outside of this file (and without any producer at all).
>
> > @@ -122,6 +123,9 @@ int __init cpufreq_register_governor(struct cpufreq_governor *governor)
> >      if (!governor)
> >          return -EINVAL;
> >
> > +    if (cpufreq_governor_internal && strstr(governor->name, "internal") == NULL)
>
> I wonder whether designating any governors ending in "-internal"
> wouldn't be less prone for possible future ambiguities.

Yes, that would be good.

> > --- a/xen/include/acpi/cpufreq/cpufreq.h
> > +++ b/xen/include/acpi/cpufreq/cpufreq.h
> > @@ -115,6 +115,7 @@ extern struct cpufreq_governor cpufreq_gov_dbs;
> >  extern struct cpufreq_governor cpufreq_gov_userspace;
> >  extern struct cpufreq_governor cpufreq_gov_performance;
> >  extern struct cpufreq_governor cpufreq_gov_powersave;
> > +extern bool cpufreq_governor_internal;
>
> Please separate from the governor declarations by a blank line.

Sure.

> Sorry, all quite nit-like remarks, but still ...

It's fine.  Would a design session be useful to discuss hwp?

Regards,
Jason

