Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E46385F662
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 12:01:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684345.1064149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6p3-0006fk-2O; Thu, 22 Feb 2024 11:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684345.1064149; Thu, 22 Feb 2024 11:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd6p2-0006br-Vu; Thu, 22 Feb 2024 11:01:00 +0000
Received: by outflank-mailman (input) for mailman id 684345;
 Thu, 22 Feb 2024 11:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBgv=J7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rd6p1-0006bc-Il
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 11:00:59 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7daf1a0-d171-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 12:00:57 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-512b4388dafso5216944e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 03:00:57 -0800 (PST)
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
X-Inumbo-ID: a7daf1a0-d171-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708599657; x=1709204457; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBhBSYJB3FxNbdMA+DfG7SOVbzaBlWRh1j33ezEklCE=;
        b=UrFxk6U4hVxLpqFgyBSLHpu0Pm+HROI/8dZ3q5Aj08NkAvPXpjrtyQcYO+oC8Q1z06
         EvNpWUfq0oSMFzIaUjd5N48w2VtBM5mXsW6LhE8MF6C99VhEe0o4KzLIN7A1MqP6IlT0
         mYbc/P6khondKuntd0Ny10+G02OcFYXUKYwXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708599657; x=1709204457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBhBSYJB3FxNbdMA+DfG7SOVbzaBlWRh1j33ezEklCE=;
        b=NSsT6qx6gkg6DKwe/hGsZnu9VgckqOTt89790wOR45gpAtmhC2z4NEKsCCPPos+i2d
         zn3Ce+z/aVI6SG3MObDfl5rCOnye9hHFvGD36VSgXRDuf3m8v7Dsjg2ufvPLRYPFBQqa
         u8K27TZs/qRBpLORjoSPWdxPtkQTIkJkO8IxLsboDE3FaKHs2egV39C2XEmZ+HMhGOzx
         RaX59AZjhlTZVvn8z6ZNS2fDramySYQi/+E942+tO0wfxG0NIQRocPa0YavITL5QaQwv
         roDPJ1Q8mRiSQwtTPMiirhkWQKtEuAAiCq2WioaGlOxRGPLKYNf4Mtpj8dP9+udhsbck
         1M1w==
X-Forwarded-Encrypted: i=1; AJvYcCXu73wLB6c/Q0+plBKw0rGDa12MOcgxcKx+/pgLruu3JS+Zls561PoagEeIUaIJgPjPu/ysFcLu9sz1+3sMxYbKgxZMA8LoxK86VlfIbO8=
X-Gm-Message-State: AOJu0YzjzyrV/gCQd7DN4FOQMdR/xyF9NPQVF1BRXItZnj+idPsRzm8s
	HxVoez222CVAyi100RmIEJgY0c6nydziOQstZdAvGL4TQVafQcxhU6haTspYsfwVeVzlBbIMTgM
	V2etRcUTK8pCFUGXhvPXQXR4JKOhAChJweQsoDw==
X-Google-Smtp-Source: AGHT+IGVsDMheNxhedNH/tUJBtlpHFkfEiCXyTglLSRUGfUkzlYbN3hTQzo5FdCvS/qUZFypSwjWGpKBZcELwshHPSM=
X-Received: by 2002:a05:6512:308d:b0:512:a8bd:4bee with SMTP id
 z13-20020a056512308d00b00512a8bd4beemr9818068lfd.45.1708599656725; Thu, 22
 Feb 2024 03:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com> <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
 <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
 <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com> <CA+zSX=ZPKScDQO6XXGOp6gv1arEs4-iWTgX8NSezYo4LGqkoLA@mail.gmail.com>
 <40ff2158-78aa-478b-b591-02bbcb1bf88f@suse.com>
In-Reply-To: <40ff2158-78aa-478b-b591-02bbcb1bf88f@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 22 Feb 2024 19:00:45 +0800
Message-ID: <CA+zSX=b4DKJ1_s9E8N9EGu09=zzQC+NPVMHeF-C1gHxT5RgSog@mail.gmail.com>
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 5:50=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.02.2024 10:30, George Dunlap wrote:
> > On Wed, Feb 21, 2024 at 6:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>>> But then of course Andrew may know of reasons why all of this is don=
e
> >>>> in calculate_host_policy() in the first place, rather than in HVM
> >>>> policy calculation.
> >>>
> >>> It sounds like maybe you're confusing host_policy with
> >>> x86_capabilities?  From what I can tell:
> >>>
> >>> *  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
> >>> resolves to cpu_has(&boot_cpu_data, ...), which is completely
> >>> independent of the cpu-policy.c:host_cpu_policy
> >>>
> >>> * cpu-policy.c:host_cpu_policy only affects what is advertised to
> >>> guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
> >>> quick skim doesn't show any mechanism by which host_cpu_policy could
> >>> affect what features Xen itself decides to use.
> >>
> >> I'm not mixing the two, no; the two are still insufficiently disentang=
led.
> >> There's really no reason (long term) to have both host policy and
> >> x86_capabilities. Therefore I'd prefer if new code (including a basica=
lly
> >> fundamental re-write as is going to be needed for nested) to avoid
> >> needlessly further extending x86_capabilities. Unless of course there'=
s
> >> something fundamentally wrong with eliminating the redundancy, which
> >> likely Andrew would be in the best position to point out.
> >
> > So I don't know the history of how things got to be the way they are,
> > nor really much about the code but what I've gathered from skimming
> > through while creating this patch series.  But from that impression,
> > the only issue I really see with the current code is the confusing
> > naming.  The cpufeature.h code has this nice infrastructure to allow
> > you to, for instance, enable or disable certain bits on the
> > command-line; and the interface for querying all the different bits of
> > functionality is all nicely put in one place.  Moving the
> > svm_feature_flags into x86_capabilities would immediately allow SVM to
> > take advantage of this infrastructure; it's not clear to me how this
> > would be "needless".
> >
> > Furthermore, it looks to me like host_cpu_policy is used as a starting
> > point for generating pv_cpu_policy and hvm_cpu_policy, both of which
> > are only used for guest cpuid generation.  Given that the format of
> > those policies is fixed, and there's a lot of "copy this bit from the
> > host policy wholesale", it seems like no matter what, you'd want a
> > host_cpu_policy.
> >
> > And in any case -- all that is kind of moot.  *Right now*,
> > host_cpu_policy is only used for guest cpuid policy creation; *right
> > now*, the nested virt features of AMD are handled in the
> > host_cpu_policy; *right now*, we're advertising to guests bits which
> > are not properly virtualized; *right now* these bits are actually set
> > unconditionally, regardless of whether they're even available on the
> > hardware; *right now*, Xen uses svm_feature_flags to determine its own
> > use of TscRateMSR; so *right now*, removing this bit from
> > host_cpu_policy won't prevent Xen from using TscRateMSR itself.
> >
> > (Unless my understanding of the code is wrong, in which case I'd
> > appreciate a correction.)
>
> There's nothing wrong afaics, just missing at least one aspect: Did you
> see all the featureset <-> policy conversions in cpu-policy.c? That (to
> me at least) clearly is a sign of unnecessary duplication of the same
> data. This goes as far as seeding the host policy from the raw one, just
> to then immediately run x86_cpu_featureset_to_policy(), thus overwriting
> a fair part of what was first taken from the raw policy. That's necessary
> right now, because setup_{force,clear}_cpu_cap() act on
> boot_cpu_data.x86_capability[], not the host policy.
>
> As to the "needless" further up, it's only as far as moving those bits
> into x86_capability[] would further duplicate information, rather than
> (for that piece at least) putting them into the policies right away. But
> yes, if the goal is to have setup_{force,clear}_cpu_cap() be able to
> control those bits as well, then going the intermediate step would be
> unavoidable at this point in time.

I'm still not sure of what needs to happen to move this forward.

As I said, I'm not opposed to doing some prep work; but I don't want
to randomly guess as to what kinds of clean-up needs to be done, only
to be told it was wrong (either by you when I post it or by Andy
sometime after it's checked in).

I could certainly move svm_feature_flags into host_cpu_policy, and
have cpu_svm_feature_* reference host_cpu_policy instead (after moving
the nested virt "guest policy" tweaks into hvm_cpu_policy); but as far
as I can tell, that would be the *very first* instance of Xen using
host_cpu_policy in that manner.  I'd like more clarity that this is
the long-term direction that things are going before then.

If you (plural) don't have time now to refresh your memory / make an
informed decision about what you want to happen, then please consider
just taking the patch as it is; it doesn't make future changes any
harder.

 -George

