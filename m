Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1091FFC90
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 22:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jm1Fa-00025P-CA; Thu, 18 Jun 2020 20:35:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UxAD=77=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jm1FY-00025K-HD
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 20:35:04 +0000
X-Inumbo-ID: 300a2320-b1a3-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 300a2320-b1a3-11ea-b7bb-bc764e2007e4;
 Thu, 18 Jun 2020 20:35:03 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l26so6453474wme.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2020 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UjSv5RVxmAzxiHW9gbbgC/lK7j6x6Pkr9ILwSOee/tA=;
 b=r1K5FX8zAlZM2jNEdwTyzrYCCkE5SUcIP7TXX6Yh6cOpGPfS5BIln3tJA3DDcn8AFp
 JDxnsPeJLq+2AhceweZdWi89BYQtiMRHILffJV9zJj86zB91SmQPnOkqVn1l43DB0uvP
 PAPh2iMYRDAtcPzUXefRNVWxvDl6sA8t/PXz+fAmDwa/2FSMnJmICNAWpR3jr9Y4if40
 cltqtu7+42et55hLAuT9UPtnaYnzx5vJT+Jg2kDcWssQRVr7I8t42rmnKkDuPBr3TwwQ
 2JQi9+EeT8e3hmYZiEtPn3kGCWQ8YobqszxPBnlnY2sXwjOStpogFOJrWTi2nKCs85P3
 8Pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UjSv5RVxmAzxiHW9gbbgC/lK7j6x6Pkr9ILwSOee/tA=;
 b=CKl2oJJA5uTHG0F+fci27B0rRWcBM8mKDyvCHG8QPah9LGOkM0ZgafsgCeAxPPu6px
 N9eLmqwLVPcad87zJuYf2frOaMxBOFXmR1RMh90E8k/cMyEkWCrK1fc8n5mPdNSaxr+7
 F3VCl6R8AdREZ8ZLjipylfrbOAW1aOiBgdeitM2KAeMEBuXJ3tawkvBJ9HLRtPf/r2/e
 dGVc576cV9hYSXrraeA+mhwdqfPI0hNGKKg0WdtrFcMyyJQQLMlXgeipZToyxb35fF6/
 CRJV3hpNw6J+y/VZkU9Z0g8tMB8LqcSMPSxhzujce1ECM3oGtdRO1JkVSdxXM8maGMNI
 yqwQ==
X-Gm-Message-State: AOAM531cuNGCnkQzd65kIxAnlKlQcekL7WRWzCeM0H0xtCmap83u5uck
 kVW98hcQGlR7dNFZhOI2mEWYp3w/lo2QaBKSm0s=
X-Google-Smtp-Source: ABdhPJxD2+M2LwQHH1WNhmnw6gQ1GmkjOMk+XMg1wYMST7H7tiNA3R4mFQmgbPh4VtOt790GdQT8cFegHiCZXMO9fZw=
X-Received: by 2002:a1c:230f:: with SMTP id j15mr138234wmj.100.1592512502752; 
 Thu, 18 Jun 2020 13:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
 <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
 <1fcd5d89691b775d1230bf3405e29893107edcb3.camel@epam.com>
 <92d81acb-fd78-3483-68fb-f52c7bfb3d65@xen.org>
 <87imfo2kbz.fsf@epam.com>
In-Reply-To: <87imfo2kbz.fsf@epam.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 18 Jun 2020 21:34:51 +0100
Message-ID: <CAJ=z9a1h1RN8EAkxZ6AY-Xw_Dcx5f80XP+Pj4RwR8PensaBTLQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, 18 Jun 2020 at 21:24, Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
>
> Hi Julien,
>
> Julien Grall writes:
>
> > Hi Volodymyr,
> >
> > On 12/06/2020 12:44, Volodymyr Babchuk wrote:
> >>
> >> On Fri, 2020-06-12 at 06:57 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> >>> On 12.06.20 02:22, Volodymyr Babchuk wrote:
> >>>> As scheduler code now collects time spent in IRQ handlers and in
> >>>> do_softirq(), we can present those values to userspace tools like
> >>>> xentop, so system administrator can see how system behaves.
> >>>>
> >>>> We are updating counters only in sched_get_time_correction() functio=
n
> >>>> to minimize number of taken spinlocks. As atomic_t is 32 bit wide, i=
t
> >>>> is not enough to store time with nanosecond precision. So we need to
> >>>> use 64 bit variables and protect them with spinlock.
> >>>>
> >>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> >>>> ---
> >>>>    xen/common/sched/core.c     | 17 +++++++++++++++++
> >>>>    xen/common/sysctl.c         |  1 +
> >>>>    xen/include/public/sysctl.h |  4 +++-
> >>>>    xen/include/xen/sched.h     |  2 ++
> >>>>    4 files changed, 23 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> >>>> index a7294ff5c3..ee6b1d9161 100644
> >>>> --- a/xen/common/sched/core.c
> >>>> +++ b/xen/common/sched/core.c
> >>>> @@ -95,6 +95,10 @@ static struct scheduler __read_mostly ops;
> >>>>       static bool scheduler_active;
> >>>>    +static DEFINE_SPINLOCK(sched_stat_lock);
> >>>> +s_time_t sched_stat_irq_time;
> >>>> +s_time_t sched_stat_hyp_time;
> >>>> +
> >>>>    static void sched_set_affinity(
> >>>>        struct sched_unit *unit, const cpumask_t *hard, const cpumask=
_t *soft);
> >>>>    @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct
> >>>> sched_unit *u)
> >>>>                break;
> >>>>        }
> >>>>    +    spin_lock_irqsave(&sched_stat_lock, flags);
> >>>> +    sched_stat_irq_time +=3D irq;
> >>>> +    sched_stat_hyp_time +=3D hyp;
> >>>> +    spin_unlock_irqrestore(&sched_stat_lock, flags);
> >>>
> >>> Please don't use a lock. Just use add_sized() instead which will add
> >>> atomically.
> >>
> >> Looks like arm does not support 64 bit variables. >
> >> Julien, I believe, this is armv7 limitation? Should armv8 work with 64=
-
> >> bit atomics?
> >
> > 64-bit atomics can work on both Armv7 and Armv8 :). It just haven't
> > been plumbed yet.
> >
> > I am happy to write a patch if you need atomic64_t or even a 64-bit
> > add_sized().
>
> Looks like I'll need this patch. So, if you still have time, it will be
> great, if you'll write it.

I offered help for either the atomic64_t or the add_sized(). Can you
confirm which one you need?

Cheers,

