Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7981EAF22
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jun 2020 21:00:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfpee-0006fs-Cl; Mon, 01 Jun 2020 18:59:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dysJ=7O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jfped-0006fn-46
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 18:59:23 +0000
X-Inumbo-ID: 00ec4d50-a43a-11ea-9dbe-bc764e2007e4
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00ec4d50-a43a-11ea-9dbe-bc764e2007e4;
 Mon, 01 Jun 2020 18:59:22 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id q19so4935702eja.7
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S8Sc2b5ExnekXJv0JL3UL1F7c6say8fYme38PNg24Bg=;
 b=RPuea2EPsF4h/E9hvYiy0mua6WNck5xorxCAq4GF0WkSV95NKom1ILZxZvwSp47C2N
 zMl8Gz4CYD9mLRz+hFeyoYnZXDbOn4jfUABKRlQ8kPs3btSfjVDY9eGuhfFyFZRLrO8c
 HNl21qDUPT/kKYXgP0un03za/qwmEAJUXexhahKmN5QRdasMdb9uxzUChrK+jERW6LMh
 Awjjck/sG4pZ/CghB2Po7H248KhqYX391E5K0Kz1qLPTva8KrXVVRv/NPEuFdUmLWBg9
 zkocX0YNoj36HMAdF9ytLTu88upa7ub38rB3u+EmActadngVdWeWrSVItXnMOAm+m+uJ
 q1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S8Sc2b5ExnekXJv0JL3UL1F7c6say8fYme38PNg24Bg=;
 b=bNbifVAKKnn1Z5L9GVY2YRxVp7J6y40KPzYUmN3eo7KPRButsiEWVzDuIEqYNUrOyp
 qDpYCvZ5JugHQsXL7J5XCsfiTMEtCQCRREHcX/KwEtgcafiLH0n57q2zb2n3EPog3OlL
 8CtIWDCOpd3PNeiWl1qhj7zgdyK0t/Ls8rxnacknDfYm8tH5LG7oNegOpn7KKyM9aLqO
 zad5G4tjmv7B7pS8cWlbvL6jmwiTFjrGqwAHu0DJ+REwATgtytFwYCZyIcuMWIfHNOie
 nYdrBFy5QIBJNlNns3cYhQtX+QuCO0wHtvX4kaDWlrhsM9c4Pd1cr/tJMcu6UzKzq0TV
 NNnQ==
X-Gm-Message-State: AOAM533mawF426xF8I7z3S+yxboTzZymmOPqRplP7OWDDJ+sd7/LNOaN
 NGYK0RmPSNCKFvJBw0hC3ZX6t9X4z2s=
X-Google-Smtp-Source: ABdhPJzdgXqjcJBxXCJ/UGnKl8OzXCjlP/hjNDx2mihjGi5UyiswoycgUexCkXMAar+R71h7mUw25w==
X-Received: by 2002:a17:907:2486:: with SMTP id
 zg6mr21225542ejb.225.1591037960653; 
 Mon, 01 Jun 2020 11:59:20 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id 64sm148219eda.85.2020.06.01.11.59.19
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 11:59:19 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id l10so876595wrr.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 11:59:19 -0700 (PDT)
X-Received: by 2002:a5d:490f:: with SMTP id x15mr22795038wrq.259.1591037959312; 
 Mon, 01 Jun 2020 11:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590028160.git.tamas@tklengyel.com>
In-Reply-To: <cover.1590028160.git.tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 1 Jun 2020 12:58:44 -0600
X-Gmail-Original-Message-ID: <CABfawh=YNVqYgnTwAaqTdWxNW_m2z7KD7ku0mWZGDnDMcha1+A@mail.gmail.com>
Message-ID: <CABfawh=YNVqYgnTwAaqTdWxNW_m2z7KD7ku0mWZGDnDMcha1+A@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 0/3] vm_event: fix race-condition when
 disabling monitor events
To: Xen-devel <xen-devel@lists.xenproject.org>
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 8:31 PM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> For the last couple years we have received numerous reports from users of
> monitor vm_events of spurious guest crashes when using events. In particular,
> it has observed that the problem occurs when vm_events are being disabled. The
> nature of the guest crash varied widely and has only occured occasionally. This
> made debugging the issue particularly hard. We had discussions about this issue
> even here on the xen-devel mailinglist with no luck figuring it out.
>
> The bug has now been identified as a race-condition between register event
> handling and disabling the vm_event interface.
>
> Patch 96760e2fba100d694300a81baddb5740e0f8c0ee, "vm_event: deny register writes
> if refused by  vm_event reply" is the patch that introduced the error. In this
> patch emulation of register write events can be postponed until the
> corresponding vm_event handler decides whether to allow such write to take
> place. Unfortunately this can only be implemented by performing the deny/allow
> step when the vCPU gets scheduled. Due to that postponed emulation of the event
> if the user decides to pause the VM in the vm_event handler and then disable
> events, the entire emulation step is skipped the next time the vCPU is resumed.
> Even if the user doesn't pause during the vm_event handling but exits
> immediately and disables vm_event, the situation becomes racey as disabling
> vm_event may succeed before the guest's vCPUs get scheduled with the pending
> emulation task. This has been particularly the case with VMS  that have several
> vCPUs as after the VM is unpaused it may actually take a long time before all
> vCPUs get scheduled.
>
> The only solution currently is to poll each vCPU before vm_events are disabled
> to verify they had been scheduled before it is safe to disable vm_events. The
> following patches resolve this issue in a much nicer way.
>
> Patch 1 adds an option to the monitor_op domctl that needs to be specified if
>     the user wants to actually use the postponed register-write handling
>     mechanism. If that option is not specified then handling is performed the
>     same way as before patch 96760e2fba100d694300a81baddb5740e0f8c0ee.
>
> Patch 2 performs sanity checking when disabling vm_events to determine whether
>     its safe to free all vm_event structures. The vCPUs still get unpaused to
>     allow them to get scheduled and perform any of their pending operations,
>     but otherwise an -EAGAIN error is returned signaling to the user that they
>     need to wait and try again disabling the interface.
>
> Patch 3 adds a vm_event specifically to signal to the user when it is safe to
>     continue disabling the interface.
>
> Shout out to our friends at CERT.pl for stumbling upon a crucial piece of
> information that lead to finally squashing this nasty bug.
>
> v2: minor adjustments based on Jan's comments

Patch ping.

Tamas

