Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 109A7194D74
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2020 00:45:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHc80-0006ZS-9T; Thu, 26 Mar 2020 23:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1MmV=5L=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jHc7z-0006ZN-0V
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 23:41:35 +0000
X-Inumbo-ID: 53918a42-6fbb-11ea-bec1-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53918a42-6fbb-11ea-bec1-bc764e2007e4;
 Thu, 26 Mar 2020 23:41:34 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id cw6so8333480edb.9
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LWlbPS86RreDmP3/254US51RTTc0fS5l1B7xulZEmyQ=;
 b=z+4WwU9B9oz8LNRZt1wRpoY0Ju/hjDprGoxSm0ozDM+JaB0G/QmT9UHdPmtU1DsyIy
 bic+BiTIcjVRtK60meV7oRuiP0ZpzIvjf2Iyqi8ikwwS0nWqwDjHzmOBFAf/XzaT3uBp
 ghxyR6x8uVaDC4NiEsKaOpisJXz9pZJKs2O4RFRkRV0N0OD2S6z/NPgVJUX8pI8ee1HT
 CgsFaPEeqisaWbiff/IDGp8FwZfpSK1V8+RKVPz7AnUjyMjcNBP5KM1mjUkrWobOeJU5
 GVueYUotAmNWKKkbU94ERj2si4j5cIKHZIuc5fzeU9/WC1ZQGzt9USNw0m2T9xKcAPA4
 ExxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LWlbPS86RreDmP3/254US51RTTc0fS5l1B7xulZEmyQ=;
 b=oDW5Jt0YNHNWbhAK1oeVrOlYMEmltB2sADq+jNYTA0kj3HXrH3BfeQcVdGF7oAa6u3
 ccn6pLXmfHmTNA2pRIbiRXihTYcs4SLDxJWI+JRaSCBhnnRJ2CeajUFs9fUEYBiKP+mc
 EEj8jH1gobjZFNq0Glkw/mPd8hWLz24WCsEpGUoGmhSuo3acLB+PMVVK5pUGasWBTMEf
 8faW8r6jnYJHAj1ZIwgvzqaw2ZXS+t14bNTMvr1X17YldFFjdtW6J/jxFDShYh4vE6pW
 tuEkFbrgpUnV4i7AqiNthwdOv/IptmjDXa0zqQ/CxbNEu7JIUZE5hSVXM4MuhnR+9Sy/
 FRpA==
X-Gm-Message-State: ANhLgQ2km5Qr5haCKJ8UQULJcVY1MFGuo46y0CQwA//mxKMw+HB3yXwz
 b2JSFFwIWjs9BtuXVe8H/dPhmFmG28w=
X-Google-Smtp-Source: ADFU+vuYHAE7YcnuY4M9D6rTezFA1+y9QQIsVmc0UEsYw2pBBwsrM+ZESTqE7ENrwXSuKnmx6xgSgg==
X-Received: by 2002:a05:6402:10c2:: with SMTP id
 p2mr10240542edu.375.1585266093294; 
 Thu, 26 Mar 2020 16:41:33 -0700 (PDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com.
 [209.85.128.43])
 by smtp.gmail.com with ESMTPSA id g21sm577537eds.38.2020.03.26.16.41.31
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 16:41:31 -0700 (PDT)
Received: by mail-wm1-f43.google.com with SMTP id w25so6008956wmi.0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2020 16:41:31 -0700 (PDT)
X-Received: by 2002:a05:600c:2293:: with SMTP id
 19mr2360899wmf.84.1585266091374; 
 Thu, 26 Mar 2020 16:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584981438.git.tamas.lengyel@intel.com>
 <46457bd6e877abe12a8c005c23f0f1aab13afd24.1584981438.git.tamas.lengyel@intel.com>
 <3f0fd837-bee6-3a68-8db3-1a99b97aac9e@suse.com>
 <CABfawhkRpvV0asinjdBx2qMq-RQOBbx13bENREszzkBhrgS71Q@mail.gmail.com>
 <9c7d7147-cb83-5e91-38b7-906a81582ac4@suse.com>
 <CABfawhkoEt1wZ9hT2Tra8Mw0jkXtNzTXt+Znf1WuTYf-nnDd+g@mail.gmail.com>
In-Reply-To: <CABfawhkoEt1wZ9hT2Tra8Mw0jkXtNzTXt+Znf1WuTYf-nnDd+g@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Mar 2020 17:40:55 -0600
X-Gmail-Original-Message-ID: <CABfawhkyK4UBhHZx=MZ-EQaUrVC2WsCkG6=Yj-=+uqd9uLJZ0A@mail.gmail.com>
Message-ID: <CABfawhkyK4UBhHZx=MZ-EQaUrVC2WsCkG6=Yj-=+uqd9uLJZ0A@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Xen-devel] [PATCH v12 2/3] x86/mem_sharing: reset a fork
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Mar 26, 2020 at 8:53 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> On Thu, Mar 26, 2020 at 8:52 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 26.03.2020 15:48, Tamas K Lengyel wrote:
> > > On Thu, Mar 26, 2020 at 4:17 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 23.03.2020 18:04, Tamas K Lengyel wrote:
> > >>> +static int mem_sharing_fork_reset(struct domain *d, struct domain *pd)
> > >>> +{
> > >>> +    int rc;
> > >>> +    struct p2m_domain *p2m = p2m_get_hostp2m(d);
> > >>> +    struct page_info *page, *tmp;
> > >>> +
> > >>> +    spin_lock(&d->page_alloc_lock);
> > >>> +    domain_pause(d);
> > >>
> > >> Why do you take the lock first?
> > >
> > > No particular reason - does the order matter?
> >
> > I think you'd better avoid holding a lock for extended periods
> > of time. And what's perhaps worse, what if a vCPU of the domain
> > sits in Xen trying to acquire this lock - you'd deadlock trying
> > to pause the domain then.
>
> OK, I'll invert them order then.

It turns out we also need to take the recursive lock here since we'll
free the pages. Fixed now and everything works as expected.

Tamas

