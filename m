Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D5A85F463
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 10:31:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684277.1064013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5Pf-0004jt-Pv; Thu, 22 Feb 2024 09:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684277.1064013; Thu, 22 Feb 2024 09:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd5Pf-0004iN-N6; Thu, 22 Feb 2024 09:30:43 +0000
Received: by outflank-mailman (input) for mailman id 684277;
 Thu, 22 Feb 2024 09:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBgv=J7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rd5Pd-0004iF-St
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 09:30:41 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ab2d89d-d165-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 10:30:39 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so21373371fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 01:30:39 -0800 (PST)
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
X-Inumbo-ID: 0ab2d89d-d165-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708594239; x=1709199039; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XHkumgOBcmnyxht3ocEmnFXRRBS8/vHQ1R5Cq89CQU=;
        b=PYxHzwiOvQKV/UJRy3p0qa1YOl7ts54LaCXpWuAoRzH0L1+gsZ2PSNqxCjB7QvmxMY
         4Gne2GAlaqYFZLSetXus1l43jS2j3DUQHYabmfZdTh0urAVtAaiYBB606rwKBoT5tmuG
         z69SnCwpt5fbN1QG3pE3VQ0hjt/Gb94g6dlBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594239; x=1709199039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XHkumgOBcmnyxht3ocEmnFXRRBS8/vHQ1R5Cq89CQU=;
        b=c5+xnDf4k8os5iJffFGTvbmMKigatuwNNuaBPL8rDRFcEPSvCO48WfGBHLGrOTdpWL
         qJ/TbRAyWPcdw30D8ixyOHRJr6IBhYjOJMnGjjMqoT/OC5Aevh23ni9KZ8/zYfPw9ukF
         cIKuIVTCc5QpNLAqElzzPU13fUsyBqnDH2vlFWWp9quv+TtawwshzZ61Tfxnmtrom8fJ
         v3riwD4m4aniQlhKA4Dv6V+q1ppeD+IbLbDjCavjmtsgaBOuF/tndt/eEI6AzPXNvN5F
         izgBgAk9AQKR1tWuRrwjWd1lZNNdnZ7KatQIy4Hy5GQnVf6FJdQQnJWTNqQDMOan2KHd
         ZdXw==
X-Forwarded-Encrypted: i=1; AJvYcCWD85fPKG20rrYVKKK4hageyQHAXuozjgo/aQq5f6YDGkEftBnLF0/MFiUUynNSlZzelakY2lZSQ9UkBfer3e75UBCiA/hh3cKhrRYba3Y=
X-Gm-Message-State: AOJu0Yw6aCzojdsd3haSGpkyUP/KcIrLaxd3+GreIYyiRaHbvQzMLRj6
	oHTvpFe//IsryNlNDj+U4vNEbjxhMhVIgUQgxlIYDgbpTHAlQuN//aWHA+uTS/Nj/nagOcXqQXt
	IlkIfem4Dw0ts0lbuyB30Nl8mqYxyNQFWOn8wzENBeIaAmXul
X-Google-Smtp-Source: AGHT+IFbbM2DkbxE03rn5dvwqrjCkCSxxcaSjPRknWnrKeg4Un0/apsfbwFV28nZiZJA0pOObIciFiXL3LFqV+BWRYs=
X-Received: by 2002:a05:651c:2227:b0:2d2:20ad:a51 with SMTP id
 y39-20020a05651c222700b002d220ad0a51mr12896111ljq.0.1708594239310; Thu, 22
 Feb 2024 01:30:39 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com> <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
 <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com> <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com>
In-Reply-To: <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 22 Feb 2024 17:30:27 +0800
Message-ID: <CA+zSX=ZPKScDQO6XXGOp6gv1arEs4-iWTgX8NSezYo4LGqkoLA@mail.gmail.com>
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 6:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> >> But then of course Andrew may know of reasons why all of this is done
> >> in calculate_host_policy() in the first place, rather than in HVM
> >> policy calculation.
> >
> > It sounds like maybe you're confusing host_policy with
> > x86_capabilities?  From what I can tell:
> >
> > *  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
> > resolves to cpu_has(&boot_cpu_data, ...), which is completely
> > independent of the cpu-policy.c:host_cpu_policy
> >
> > * cpu-policy.c:host_cpu_policy only affects what is advertised to
> > guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
> > quick skim doesn't show any mechanism by which host_cpu_policy could
> > affect what features Xen itself decides to use.
>
> I'm not mixing the two, no; the two are still insufficiently disentangled=
.
> There's really no reason (long term) to have both host policy and
> x86_capabilities. Therefore I'd prefer if new code (including a basically
> fundamental re-write as is going to be needed for nested) to avoid
> needlessly further extending x86_capabilities. Unless of course there's
> something fundamentally wrong with eliminating the redundancy, which
> likely Andrew would be in the best position to point out.

So I don't know the history of how things got to be the way they are,
nor really much about the code but what I've gathered from skimming
through while creating this patch series.  But from that impression,
the only issue I really see with the current code is the confusing
naming.  The cpufeature.h code has this nice infrastructure to allow
you to, for instance, enable or disable certain bits on the
command-line; and the interface for querying all the different bits of
functionality is all nicely put in one place.  Moving the
svm_feature_flags into x86_capabilities would immediately allow SVM to
take advantage of this infrastructure; it's not clear to me how this
would be "needless".

Furthermore, it looks to me like host_cpu_policy is used as a starting
point for generating pv_cpu_policy and hvm_cpu_policy, both of which
are only used for guest cpuid generation.  Given that the format of
those policies is fixed, and there's a lot of "copy this bit from the
host policy wholesale", it seems like no matter what, you'd want a
host_cpu_policy.

And in any case -- all that is kind of moot.  *Right now*,
host_cpu_policy is only used for guest cpuid policy creation; *right
now*, the nested virt features of AMD are handled in the
host_cpu_policy; *right now*, we're advertising to guests bits which
are not properly virtualized; *right now* these bits are actually set
unconditionally, regardless of whether they're even available on the
hardware; *right now*, Xen uses svm_feature_flags to determine its own
use of TscRateMSR; so *right now*, removing this bit from
host_cpu_policy won't prevent Xen from using TscRateMSR itself.

(Unless my understanding of the code is wrong, in which case I'd
appreciate a correction.)

If at some point in the future x86_capabilities and host_cpu_policy
were merged somehow, whoever did the merging would have to untangle
the twiddling of these bits anyway.  What I'm changing in this patch
wouldn't make that any harder.

> > Not sure exactly why the nested virt stuff is done at the
> > host_cpu_policy level rather than the hvm_cpu_policy level, but since
> > that's where it is, that's where we need to change it.
> >
> > FWIW, as I said in response to your comment on 2/6, it would be nicer
> > if we moved svm_feature_flags into the "capabilities" section; but
> > that's a different set of work.
>
> Can as well reply here then, rather than there: If the movement from
> host to HVM policy was done first, the patch here could more sanely go
> on top, and patch 2 could then also go on top, converting the separate
> variable to host policy accesses, quite possibly introducing a similar
> wrapper as you introduce there right now.
>
> But no, I'm not meaning to make this a requirement; this would merely be
> an imo better approach. My ack there stands, in case you want to keep
> (and commit) the change as is.

I mean, I don't mind doing a bit more prep work, if I know that's the
direction we want to go in.  "Actually, since you're doing a bit of
clean-up anyway -- right now host_cpu_policy is only used to calculate
guest policy, but we'd like to move over to being the Source of Truth
for the host instead of x86_capabilities.  While you're here, would
you mind moving the nested virt policy stuff into hvm_cpu_policy
instead?"

I certainly wouldn't want to move svm_feature_flags into
host_cpu_policy while it's still got random other "guest-only" policy
bits in it; and auditing it for such policy bits is out of the scope
of this work.

 -George

