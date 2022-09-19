Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DEA5BCBC4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 14:27:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408718.651536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaFqX-0002YG-BN; Mon, 19 Sep 2022 12:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408718.651536; Mon, 19 Sep 2022 12:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaFqX-0002Vs-7x; Mon, 19 Sep 2022 12:25:57 +0000
Received: by outflank-mailman (input) for mailman id 408718;
 Mon, 19 Sep 2022 12:25:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ik4Y=ZW=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1oaFqV-0002Vm-Io
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 12:25:55 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33d56ed6-3816-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 14:25:53 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id e81so22841293ybb.13
 for <xen-devel@lists.xenproject.org>; Mon, 19 Sep 2022 05:25:53 -0700 (PDT)
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
X-Inumbo-ID: 33d56ed6-3816-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8e+V29mBkEytMtPLtjYXo/iiLXCf5zHfYegqib6BMTw=;
        b=pj8RfUan9LLTztnqD8lvL/jTk3+uRXOFKiLKl6bDHWKAII9mYnxf2AHQ0Mw+rlkBW1
         UFI3jCloBx469IWoHXhKwl4jbyYwQNOE1kMfbYOm1Lk7TgS3l7d/zQLPZy3l9HKlua2/
         p2rPcBlgoAymc2NFvqKcWINnwcS6YYOnuq0cMUScC9nrNLEt/BK/24g+tQiC/+D6SMBs
         QsYXjGify9AD1s3cJl253jdx9E+8mwRF0pqsKo7Mojmwi4y0S2BlmAmXsclcoKwtNmR3
         RvudYuTYeSSV8hdiUgFRkn+VMHIa1VdOpISPqyN2jVBI56Z9RJTSIlC/ypVUsHLeLbu2
         eTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8e+V29mBkEytMtPLtjYXo/iiLXCf5zHfYegqib6BMTw=;
        b=spgNX4TW8jDVuKzaY+iePqKo5ZwpXZnI/BaVjH5rJFyCcm0LhWs2iZGoUpATr3GzZZ
         3oF7i5z2fcrT922feyRYtbXpyKZDxx5Yox8zrZYP0iLjlYyeoEpe2KJq1SmuQEpY9lKF
         mOzb8zWuXUlhCtb3H41MZRuB1GzTCA9JWxg4n8Md5h1Ht0/IQ1nJ6tYoGr/aAynAMbnb
         JpBNo/oVg8fCpp5WDw4DlcJLL0HwdlbEHCuUsbjwOKRAj0JB5Z81TVJlRlAJcHX78KiF
         etjY4wTUBHkgr9QBltpAz/vTwp+giQ6f4VyiEhviBqTZi85KynOHdD6G1Jr4sm2efv4P
         XnLA==
X-Gm-Message-State: ACrzQf1o4DUQWdmANEa54djTWfCG1Si+GosqvLGVEJ+O1aISmNFatcOH
	QPkTd/PE27tJH3/TAwX2oQm8frl4gflN7AAEoBI=
X-Google-Smtp-Source: AMsMyM7Bv58KNzRU5+3ZIP/me3bvlwtyl7kTnhRhshWMiFqxeOgVyaS1sgQqgoQaQirrFT3DG1+OBI+CSZztEvHd5no=
X-Received: by 2002:a25:9d01:0:b0:66e:9087:4fb9 with SMTP id
 i1-20020a259d01000000b0066e90874fb9mr15063191ybp.159.1663590352396; Mon, 19
 Sep 2022 05:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <8294476a707d7f20799a40479cc0bf9a1cf07673.1663249988.git.tamas.lengyel@intel.com>
 <9fa4a72f-8b38-fbf0-40c7-8fcd6b34cf10@suse.com> <9e79155f-0836-1b18-b648-b6e5422e89c8@oracle.com>
 <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
In-Reply-To: <737386d2-ceeb-ad97-39a1-42585b913b9d@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 19 Sep 2022 08:25:18 -0400
Message-ID: <CABfawhk+TByRwVvGjv-e6-2UFeO7g6xBz3-CR_QOtYM2_37U=Q@mail.gmail.com>
Subject: Re: [PATCH] x86/vpmu: fix race-condition in vpmu_load
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	xen-devel@lists.xenproject.org, Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 19, 2022 at 5:28 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.09.2022 23:35, Boris Ostrovsky wrote:
> >
> > On 9/16/22 8:52 AM, Jan Beulich wrote:
> >> On 15.09.2022 16:01, Tamas K Lengyel wrote:
> >>> While experimenting with the vPMU subsystem an ASSERT failure was
> >>> observed in vmx_find_msr because the vcpu_runnable state was true.
> >>>
> >>> The root cause of the bug appears to be the fact that the vPMU subsystem
> >>> doesn't save its state on context_switch. The vpmu_load function will attempt
> >>> to gather the PMU state if its still loaded two different ways:
> >>>      1. if the current pcpu is not where the vcpu ran before doing a remote save
> >>>      2. if the current pcpu had another vcpu active before doing a local save
> >>>
> >>> However, in case the prev vcpu is being rescheduled on another pcpu its state
> >>> has already changed and vcpu_runnable is returning true, thus #2 will trip the
> >>> ASSERT. The only way to avoid this race condition is to make sure the
> >>> prev vcpu is paused while being checked and its context saved. Once the prev
> >>> vcpu is resumed and does #1 it will find its state already saved.
> >> While I consider this explanation plausible, I'm worried:
> >>
> >>> --- a/xen/arch/x86/cpu/vpmu.c
> >>> +++ b/xen/arch/x86/cpu/vpmu.c
> >>> @@ -419,8 +419,10 @@ int vpmu_load(struct vcpu *v, bool_t from_guest)
> >>>           vpmu = vcpu_vpmu(prev);
> >>>
> >>>           /* Someone ran here before us */
> >>> +        vcpu_pause(prev);
> >>>           vpmu_save_force(prev);
> >>>           vpmu_reset(vpmu, VPMU_CONTEXT_LOADED);
> >>> +        vcpu_unpause(prev);
> >>>
> >>>           vpmu = vcpu_vpmu(v);
> >>>       }
> >> We're running with IRQs off here, yet vcpu_pause() waits for the vcpu
> >> to actually be de-scheduled. Even with IRQs on this is already a
> >> relatively heavy operation (also including its impact on the remote
> >> side). Additionally the function is called from context_switch(), and
> >> I'm unsure of the usability of vcpu_pause() on such a path. In
> >> particular: Is there a risk of two CPUs doing this mutually to one
> >> another? If so, is deadlocking excluded?
> >>
> >> Hence at the very least I think the description wants extending, to
> >> discuss the safety of the change.
> >>
> >> Boris - any chance you could comment here? Iirc that's code you did
> >> introduce.
> >
> >
> > Is the assertion in vmx_find_msr() really needs to be for runnable vcpu or can it be a check on whether vcpu is actually running (e.g. RUNSTATE_running)?
>
> You cannot safely check for "running", as "runnable" may transition
> to/from "running" behind your back.

The more I look at this the more I think the only sensible solution is
to have the vPMU state be saved on vmexit for all vCPUs. That way all
this having to figure out where and when a context needs saving during
scheduling goes away. Yes, it adds a bit of overhead for cases where
the vCPU will resume on the same pCPU and that context saved could
have been skipped, but it makes it so that the vCPU can be resumed on
any pCPU without having to have evidently fragile checks that may
potentially lead to deadlocks (TBH I don't know if that's a real
concern at the moment because the current setup is very hard to reason
about). We can still keep track if the context needs reloading from
the saved context and skip that if we know the state is still active.
Any objection to that change in light of these issues?

Tamas

