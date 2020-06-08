Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 188C61F21F4
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 00:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiQbi-0001sG-QK; Mon, 08 Jun 2020 22:51:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YeZs=7V=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jiQbg-0001sB-Sd
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 22:51:05 +0000
X-Inumbo-ID: 867a0840-a9da-11ea-8496-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 867a0840-a9da-11ea-8496-bc764e2007e4;
 Mon, 08 Jun 2020 22:51:01 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id o26so14812313edq.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k1R/1B5bkxfOlVmZdhzjwaXKKxv9f2jPV/2Mw184/i0=;
 b=GacaojeZhQpwI2+HDap9MhB0jF0z4P1kIfPZFwxOdU3ygypzbx8sY0YR09AEEC7NkN
 o2aEiyDCqq1WnGxXggou1reEbXEA+eO4yPraaTwPNgle4DpiCpIpS9ti2s5MxKy7Bhvs
 NWC8Qg/OkizqzAKx5Mzc8Pq/DZmEFn3Jw3kKuUGdTZUuhT2EeuYlni9sM6s4zAr8XRRv
 wIbEIWJFBDPQh8NpVcnotkBTvfDn8m2wgpbqmvUzsdh0oZur6bjxBtc8LXemQN5LDKkM
 OxaHR6MJxvqe9H4ylGNFQH/Gpt0N4a3oX/AX/0pAbC4RLEP63y6mUmJMlhwDLZ9LGE2G
 opEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k1R/1B5bkxfOlVmZdhzjwaXKKxv9f2jPV/2Mw184/i0=;
 b=Nt9Wms+gUypw/QWk+mzXlya34isMaPCt2KROVt9AAchiCrnLP/46H3jC7tdJXOUlU6
 VelfevE1MVGnLYSiP0FXRlVT6Wart5oQ1BGstwiUdC7fnN0JIDXLh44VTxCU0WLizL7j
 2Tqcwd/sBQAkzbv5kCy6HDa4qqx4h+j5ZgS/AiD1HZSVbLLrrCmTBvS9aTNZxlOoqUQP
 5VY91XuQ9jkXTfo4ZxP06O5CwRGwrxIQd2Hpaa+FeUwQuFVkugpRK/jCs/te4GmTiXcY
 SKC9uoGCo7Njc+NFqdeQ1SBkEYPcCNrtj5SlmixEo+rTEu8EpBMYVWHAt365oSsT+2Iw
 6AKA==
X-Gm-Message-State: AOAM531FVvDVYpJc92ZMqzvXlSbEA9P0YRqM75PUMfp01ntspz7m4gBm
 ZdfjYWKDbFi6sr2Xfw+mycpuqKZGUJ4=
X-Google-Smtp-Source: ABdhPJyQL5r7n/MkcVPZYqW8GPBhcm+/9xnF5y2iumLVmegk9SjnykXKrQcdwB94K9JuNXI1QE8ZKg==
X-Received: by 2002:a05:6402:155:: with SMTP id
 s21mr23533623edu.144.1591656660204; 
 Mon, 08 Jun 2020 15:51:00 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com.
 [209.85.128.45])
 by smtp.gmail.com with ESMTPSA id v5sm11676288ejx.123.2020.06.08.15.50.58
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 15:50:59 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id l26so1047138wme.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 15:50:58 -0700 (PDT)
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr932451wme.154.1591656658390; 
 Mon, 08 Jun 2020 15:50:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
 <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
 <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
 <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
 <fdedc03a-57cf-3899-93d1-db491ecbbc5d@bitdefender.com>
In-Reply-To: <fdedc03a-57cf-3899-93d1-db491ecbbc5d@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 8 Jun 2020 16:50:22 -0600
X-Gmail-Original-Message-ID: <CABfawhkU+L0irWg47aoPWW0g6nJSY62Vodwi=mPH7f=tnghKTg@mail.gmail.com>
Message-ID: <CABfawhkU+L0irWg47aoPWW0g6nJSY62Vodwi=mPH7f=tnghKTg@mail.gmail.com>
Subject: Re: [PATCH v4 for-4.14] x86/monitor: revert default behavior when
 monitoring register write events
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrei LUTAS <vlutas@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?TWloYWkgRG9uyJt1?= <mdontu@bitdefender.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 8, 2020 at 3:16 PM Razvan Cojocaru
<rcojocaru@bitdefender.com> wrote:
>
> On 6/8/20 11:44 PM, Tamas K Lengyel wrote:
> > On Mon, Jun 8, 2020 at 2:14 PM Razvan Cojocaru
> > <rcojocaru@bitdefender.com> wrote:
> >>
> >> On 6/8/20 10:54 PM, Tamas K Lengyel wrote:
> >>> On Mon, Jun 8, 2020 at 12:58 PM Razvan Cojocaru
> >>>> And last but not least, the proper sequence is: 1. unsubscribe from
> >>>> register write events, 2. process all events "still in the chamber"
> >>>> (keep checking the ring buffer for a while), 3. detach from the guest
> >>>> (disable the vm_event subsystem). Not ideal perhaps (in that it's not
> >>>> guaranteed that a VCPU won't resume after a longer period than our
> >>>> timeout), but if the sequence is followed there should be no guest hangs
> >>>> or crashes (at least none that we or our clients have observed so far).
> >>>
> >>> Incorrect. That's not enough. You also have to wait for all the vCPUs
> >>> to get scheduled before disabling vm_event or otherwise the emulation
> >>> is skipped entirely. Please read the patch message. If the user
> >>> decides to disable vm_event after getting a CR3 event delivered, the
> >>> CR3 never gets updated and results in the guest crashing in
> >>> unpredictable ways. Same happens with all the other registers.
> >>
> >> I did read the patch message. As I've previously stated ("it's not
> >> guaranteed that a VCPU won't resume after a longer period than our
> >> timeout"), it's not ideal, and I've made no claim that the problem does
> >> not exist or that it shouldn't be fixed - but really if you've got a
> >> VCPU that will wait more than a couple of seconds to get scheduled then
> >> you've got a bigger problem with the VM.
> >
> > Sorry, missed the part where you say you knew about this issue. We
> > didn't and it was absolutely not documented anywhere and certainly not
> > mentioned in the original patch that added the feature. It literally
> > took us years to figure out what the hell is going on. While as you it
> > can be a couple seconds before its safe to disable it can be a lot
> > longer depending on the system state, how many VMs are running and how
> > many vCPUs are active on the VM. There is absolutely necessary
> > use-cases where you want to keep the VM paused after a CR3 event is
> > received and exit vm_event afterwards. This bug totally blocks those
> > use-cases. Not to mention that it's a total mess having an interface
> > where the user has to guess when its safe to do something. If this was
> > pointed out when the patch was made I would have objected to that
> > being merged.
>
> No, we didn't know about the issue. It's apparently not my most eloquent
> evening. I was merely saying that I did understand what the issue was
> from your description, and offering an explanation on why we've never
> seen this in QA or production. Of course the issue would have been
> mentioned at least (but ideally not exist to begin with) had it been known.
>
> We do take several passes through the ring buffer (and as a side-effect
> reduce the probability of a race occuring to almost zero), but we do
> that to make sure we've cleaned up all EPT vm_events; the fact that it
> has helped with _this_ issue is a coincidence.
>
> IIRC Windows, at least, will be upset if a VCPU is stuck for too long.
>
> As for how the vm_event system behaves:
>
> 1. A security application that is unable to _prevent_ things being done
> to a system is not doing a very good job, since in that case you can
> only collect stats and not veto anything. I would argue that the default
> for such a monitoring application should be the current one (all events
> should be pre-action).

Not all security applications require this though. Malware analysis
where stealth is required would absolutely not want this side-effect
to be visible to the guest where malware could use it to determine
that it's being monitored. So I don't buy into this argument.

>
> 2. This is further supported by the fact that that's exactly how the EPT
> vm_events work: you get a "I want to write to this page" event _before_
> the write occurs. If register writes behave differently, you have _two_
> different models: one where you get an event post-action, and one where
> you get one pre-action.

Whether you get an event before or after the effects of the event have
been applied to the system state shouldn't matter as long as you can
revert that action. I wouldn't care either way to be the default. But
having a default that breaks other use-cases is unacceptable.

Tamas

