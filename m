Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280271F20F5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 22:45:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiOe6-0007y0-1t; Mon, 08 Jun 2020 20:45:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YeZs=7V=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jiOe4-0007xv-TK
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 20:45:24 +0000
X-Inumbo-ID: f9a66226-a9c8-11ea-bb8b-bc764e2007e4
Received: from mail-ej1-x641.google.com (unknown [2a00:1450:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9a66226-a9c8-11ea-bb8b-bc764e2007e4;
 Mon, 08 Jun 2020 20:45:24 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id n24so19893806ejd.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 13:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1mgyF3W2Bn3zvxFunIfhU499znjsykqnFMxabpQVkD0=;
 b=teJ1pwDTr6qUpzo+KAnfp63kUyJYKhMypk5rOcwrJk6Pcm7Yi5tJ3N3z5xqTzoPYx8
 m+n2sg2qJm6wh1zS4TLYfYYqGl65dtcx7Vwk3ZlqoRmdmOw4dvMwsvl6IKmFoeRMkiOj
 VeDE65StvBKMuJPcKeHa33yK4CcVahKXiYXiLyHWaetwXyVWk012Pk77T9R1CW7aOG7J
 8aA5SMvGTCgJFNSpLk6aGUIwKrI4hcV2Q94C3Bj4lxBisCjpyMf532xotUJBkjgrCv+L
 F7kL+LZNi8D4E/rmopRW9umo2Aq2k4B7ZXS1Hz1WFYibXh832F+vFbNGToTXe+hUgGtu
 3k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mgyF3W2Bn3zvxFunIfhU499znjsykqnFMxabpQVkD0=;
 b=pF3TcNlhV9NXHsSXwMPPZzJoaIX32ue8B2HzP15n649evIcz0S0o54OgEAi/p+oonN
 71X5pRhDVCG3uHW9KqfLgmrFvgB72Zl9cq2THeB7JC8Uf/FA2e11GdmD4onhGU0wbGow
 yD1INy6dAbzbldx4jrtKuA7I4VCmGCu4NtpzQ7k7kIMgZtUAiAlukhoylHMcLiAD4RzN
 rBtWibajiRqsgQ8PGzQqzCsXj/BN0fFEsnmF3IujULnstSqJfKyafr9w6XCZ5g5mshsa
 OwT+180+juG+Z4kArFO9I34Lpf+Z140uFWP4Q7Qz7fUc56+s2FqpA4gunImu4pao8QlE
 HW2Q==
X-Gm-Message-State: AOAM530NN+Jl4SNpow4Em8tdNz+8kKKB4gA3yxojn1OZS7VfNdaeoQYl
 USjUvWUAngon209NbytLWDyzMrPHOaA=
X-Google-Smtp-Source: ABdhPJydpDG9uouXR5NWRfJkOgsI8W7HKsTU9ZmKvnoni98Vc77/bSc9V197y8JlPDz/SqqishyaFg==
X-Received: by 2002:a17:906:1e95:: with SMTP id
 e21mr23033049ejj.240.1591649122507; 
 Mon, 08 Jun 2020 13:45:22 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46])
 by smtp.gmail.com with ESMTPSA id m14sm7478517ejr.5.2020.06.08.13.45.21
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jun 2020 13:45:21 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id c71so812215wmd.5
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 13:45:21 -0700 (PDT)
X-Received: by 2002:a05:600c:2294:: with SMTP id
 20mr491865wmf.51.1591649121114; 
 Mon, 08 Jun 2020 13:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200603125237.100041-1-tamas@tklengyel.com>
 <20200603150721.GF1195@Air-de-Roger>
 <be627680-5ab2-d93d-b042-2b6aadbdcd8d@suse.com>
 <ffa44e09-a9fd-8fff-16af-e0991db3cb9b@bitdefender.com>
 <CABfawhnNC3yCuG+xNicyjA_Qo89qpvXKL-Cp9wAc4Cq=Xv8BYQ@mail.gmail.com>
 <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
In-Reply-To: <aded2ba0-3a16-bee5-d3e0-98bf5beb068d@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 8 Jun 2020 14:44:45 -0600
X-Gmail-Original-Message-ID: <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
Message-ID: <CABfawh=s6OL54ckemhvjWRQWu_apmV6--L0+bRY9xEQKaPj16Q@mail.gmail.com>
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

On Mon, Jun 8, 2020 at 2:14 PM Razvan Cojocaru
<rcojocaru@bitdefender.com> wrote:
>
> On 6/8/20 10:54 PM, Tamas K Lengyel wrote:
> > On Mon, Jun 8, 2020 at 12:58 PM Razvan Cojocaru
> >> And last but not least, the proper sequence is: 1. unsubscribe from
> >> register write events, 2. process all events "still in the chamber"
> >> (keep checking the ring buffer for a while), 3. detach from the guest
> >> (disable the vm_event subsystem). Not ideal perhaps (in that it's not
> >> guaranteed that a VCPU won't resume after a longer period than our
> >> timeout), but if the sequence is followed there should be no guest hangs
> >> or crashes (at least none that we or our clients have observed so far).
> >
> > Incorrect. That's not enough. You also have to wait for all the vCPUs
> > to get scheduled before disabling vm_event or otherwise the emulation
> > is skipped entirely. Please read the patch message. If the user
> > decides to disable vm_event after getting a CR3 event delivered, the
> > CR3 never gets updated and results in the guest crashing in
> > unpredictable ways. Same happens with all the other registers.
>
> I did read the patch message. As I've previously stated ("it's not
> guaranteed that a VCPU won't resume after a longer period than our
> timeout"), it's not ideal, and I've made no claim that the problem does
> not exist or that it shouldn't be fixed - but really if you've got a
> VCPU that will wait more than a couple of seconds to get scheduled then
> you've got a bigger problem with the VM.

Sorry, missed the part where you say you knew about this issue. We
didn't and it was absolutely not documented anywhere and certainly not
mentioned in the original patch that added the feature. It literally
took us years to figure out what the hell is going on. While as you it
can be a couple seconds before its safe to disable it can be a lot
longer depending on the system state, how many VMs are running and how
many vCPUs are active on the VM. There is absolutely necessary
use-cases where you want to keep the VM paused after a CR3 event is
received and exit vm_event afterwards. This bug totally blocks those
use-cases. Not to mention that it's a total mess having an interface
where the user has to guess when its safe to do something. If this was
pointed out when the patch was made I would have objected to that
being merged.

>
> >> So in short, I think there's a better fix for this by simply not
> >> allocating the vm_event memory on-demand anymore and never having to
> >> deal with lost pending emulations again. It should also decrease code
> >> complexity by a tiny bit. Then again, as stated at the beginning of this
> >> message, that's just a recommendation.is
> >
> > Since only you guys use this feature I'm going to wait for a fix.
> > Until then, the default behavior should be restored so this buggy
> > behavior doesn't affect anyone else. You can still turn it on, its
> > just not going to be on for vm_event by default. I don't particularly
> > care what fix is there since only you guys use it. If you don't mind
> > that there is this buggy behavior because you never disable vm_events
> > once you activate it then that's that.
>
> Indeed, our usual scenario is that vm_event is always on on the machine.
> It's only rarely being disabled while the guest is running, and when it
> is, it's always with waiting sufficiently long that we've not seen any
> unexplainable hung VMs.
>
> Fair enough, as long as the previous behaviour is optionally available I
> see no reason why this patch shouldn't make it in - though, of course,
> as also previously stated, I'm just trying to shed as much light as
> possible on this from what I remember, and what happens next is not my
> call. My colleagues should be able to chime in tomorrow.

Looking forward to it.

Thanks,
Tamas

