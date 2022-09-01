Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB305A924F
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 10:43:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396335.636437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTfna-0000V1-LY; Thu, 01 Sep 2022 08:43:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396335.636437; Thu, 01 Sep 2022 08:43:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTfna-0000TE-Ij; Thu, 01 Sep 2022 08:43:42 +0000
Received: by outflank-mailman (input) for mailman id 396335;
 Thu, 01 Sep 2022 08:43:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xsy3=ZE=google.com=dvyukov@srs-se1.protection.inumbo.net>)
 id 1oTfnY-0000T8-Sd
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 08:43:41 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d08a153-29d2-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 10:43:39 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id y10so13995550ljq.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 01:43:39 -0700 (PDT)
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
X-Inumbo-ID: 2d08a153-29d2-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VH72CkJdWHRYjuIFqG3YYZtTrJw2Fhi5jnFxkucPCHY=;
        b=q7AjWjhmnd64a4Ge80aSMXzM40DYISK3cXmW/EibDBVwJ+8k/kXbGydZOb9luK+PIZ
         Ht/KjsMCWD5TF/twQCHm6itfvd6g64oIsvl5c5eKge4E9VhNnF7iOxqToHuyozIfoFb1
         5I88bd1UfHObAquK0acXH+XbI6Py13HNPo09dD+NGiTxpVgIr43RQcU5305AlaqKPpll
         qwKybw5Q2+9d/Onlv8u1vDEdJlLQ1JUMSCRevC4eAiHePyL2wzZzh3KSvr/OLrTmD05T
         eLyu3SeubEOLjLKn16wG4v4TsahkBmU2CrHwp0/PiiByarcOmjtEcsv6KWve7EKHFu99
         DiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VH72CkJdWHRYjuIFqG3YYZtTrJw2Fhi5jnFxkucPCHY=;
        b=lsmsfhCTiXH+cDpwDje+ReDMHEd02H9nyT0tUUjF5q1rNxBukv9TOMLloSZHOGF2pL
         HOZDvWi6yQ3emDmB/nAlqIfs2urnchlyPmMulEKcAjsFiDkqQRVtg4EVAoOvDrLDWRMb
         LjYYtequGpkSnsXSqVHw4uULEK8vuUhYLi47HyOrKddjU/l8SrtTDAXaaEt+8FVcLV0b
         r0WuhMsUhAq+bN0MfTNV1qQWPi9MwYGTam8HmBOM/hAzqhdvT71wrckDVwnEZr4Pqvef
         TELVFfw3ku31k1ZgnXgMhOnQHOYeNplsQ5FgOCsEbBUo7UlFYIbZFPjRVhgxMMKcRx0K
         /rng==
X-Gm-Message-State: ACgBeo3Ll3LDqZtPDpBq8dwjYAeDYvQLb7PUhDERIYB7TkXsoPGp5zG3
	7Te1mZO4fH5cb+VVloWSWto3dl/VEy5MEoytPyyLQQ==
X-Google-Smtp-Source: AA6agR4BjD3DwjS+CZ4CCVxEVQ6+miy/r1+fo/IQYDRJogJb7LowD/eAhVezdlkQzk6xOh63IrvI7g9qP1YqXlNutus=
X-Received: by 2002:a2e:be88:0:b0:25f:e9a8:44b8 with SMTP id
 a8-20020a2ebe88000000b0025fe9a844b8mr8851946ljr.92.1662021818766; Thu, 01 Sep
 2022 01:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-23-surenb@google.com>
 <CACT4Y+ZX3U1=cAPXPhoOy6xrngSCfSmyFagXK-9fWtWWODfsew@mail.gmail.com> <20220831173010.wc5j3ycmfjx6ezfu@moria.home.lan>
In-Reply-To: <20220831173010.wc5j3ycmfjx6ezfu@moria.home.lan>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 1 Sep 2022 10:43:26 +0200
Message-ID: <CACT4Y+bMeqvWQwqzG3nfcf0-VOjU7usxht5mKgUwMcOpWKRjxQ@mail.gmail.com>
Subject: Re: [RFC PATCH 22/30] Code tagging based fault injection
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	void@manifault.com, peterz@infradead.org, juri.lelli@redhat.com, 
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com, axboe@kernel.dk, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, shakeelb@google.com, songmuchun@bytedance.com, 
	arnd@arndb.de, jbaron@akamai.com, rientjes@google.com, minchan@google.com, 
	kaleshsingh@google.com, kernel-team@android.com, linux-mm@kvack.org, 
	iommu@lists.linux.dev, kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

 On Wed, 31 Aug 2022 at 19:30, Kent Overstreet
<kent.overstreet@linux.dev> wrote:
> > > From: Kent Overstreet <kent.overstreet@linux.dev>
> > >
> > > This adds a new fault injection capability, based on code tagging.
> > >
> > > To use, simply insert somewhere in your code
> > >
> > >   dynamic_fault("fault_class_name")
> > >
> > > and check whether it returns true - if so, inject the error.
> > > For example
> > >
> > >   if (dynamic_fault("init"))
> > >       return -EINVAL;
> >
> > Hi Suren,
> >
> > If this is going to be used by mainline kernel, it would be good to
> > integrate this with fail_nth systematic fault injection:
> > https://elixir.bootlin.com/linux/latest/source/lib/fault-inject.c#L109
> >
> > Otherwise these dynamic sites won't be tested by testing systems doing
> > systematic fault injection testing.
>
> That's a discussion we need to have, yeah. We don't want two distinct fault
> injection frameworks, we'll have to have a discussion as to whether this is (or
> can be) better enough to make a switch worthwhile, and whether a compatibility
> interface is needed - or maybe there's enough distinct interesting bits in both
> to make merging plausible?
>
> The debugfs interface for this fault injection code is necessarily different
> from our existing fault injection - this gives you a fault injection point _per
> callsite_, which is huge - e.g. for filesystem testing what I need is to be able
> to enable fault injection points within a given module. I can do that easily
> with this, not with our current fault injection.
>
> I think the per-callsite fault injection points would also be pretty valuable
> for CONFIG_FAULT_INJECTION_USERCOPY, too.
>
> OTOH, existing kernel fault injection can filter based on task - this fault
> injection framework doesn't have that. Easy enough to add, though. Similar for
> the interval/probability/ratelimit stuff.
>
> fail_function is the odd one out, I'm not sure how that would fit into this
> model. Everything else I've seen I think fits into this model.
>
> Also, it sounds like you're more familiar with our existing fault injection than
> I am, so if I've misunderstood anything about what it can do please do correct
> me.

What you are saying makes sense. But I can't say if we want to do a
global switch or not. I don't know how many existing users there are
(by users I mean automated testing b/c humans can switch for one-off
manual testing).

However, fail_nth that I mentioned is orthogonal to this. It's a
different mechanism to select the fault site that needs to be failed
(similar to what you mentioned as "interval/probability/ratelimit
stuff"). fail_nth allows to fail the specified n-th call site in the
specified task. And that's the only mechanism we use in
syzkaller/syzbot.
And I think it can be supported relatively easily (copy a few lines to
the "does this site needs to fail" check).

I don't know how exactly you want to use this new mechanism, but I
found fail_nth much better than any of the existing selection
mechanisms, including what this will add for specific site failing.

fail_nth allows to fail every site in a given test/syscall one-by-one
systematically. E.g. we can even have strace-like utility that repeats
the given test failing all sites in to systematically:
$ fail_all ./a_unit_test
This can be integrated into any CI system, e.g. running all LTP tests with this.

For file:line-based selection, first, we need to get these file:line
from somewhere; second, lines are changing over time so can't be
hardcoded in tests; third, it still needs to be per-task, since
unrelated processes can execute the same code.

One downside of fail_nth, though, is that it does not cover background
threads/async work. But we found that there are so many untested
synchronous error paths, that moving to background threads is not
necessary at this point.



> Interestingly: I just discovered from reading the code that
> CONFIG_FAULT_INJECTION_STACKTRACE_FILTER is a thing (hadn't before because it
> depends on !X86_64 - what?). That's cool, though.

