Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D008C7D15
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 21:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723590.1128566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gZy-00035Q-VB; Thu, 16 May 2024 19:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723590.1128566; Thu, 16 May 2024 19:15:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7gZy-00032Y-Rt; Thu, 16 May 2024 19:15:50 +0000
Received: by outflank-mailman (input) for mailman id 723590;
 Thu, 16 May 2024 19:15:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7gZx-00032S-Iu
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 19:15:49 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b321d055-13b8-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 21:15:47 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2e6792ea67fso14936681fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 12:15:47 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0bbd6a7sm24594531fa.6.2024.05.16.12.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 12:15:45 -0700 (PDT)
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
X-Inumbo-ID: b321d055-13b8-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715886947; x=1716491747; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EPaBePz3BonMngO7cdhCKA9KQJOsT7QDQu8wSi91ybY=;
        b=dj82P4XAKaBUBTF1qXMgCxjr/vWWFIga2nONSF1JSNMZgNyIJoDz4dFjChQ0QpUlq9
         zAH72OemAg4S3/4iScfg6k1+9Qr4EOTnGdUJZ9hcMaOwqI4ktZZNdMIgVVyH8/fVvhHa
         KxOLYe9Q0oWl14WiNbphIBiDdMLfOfYJdY+6w0W2zLFfC26SLhCDDMPwpGoyF2ZdMGZY
         3zRhclcoRSCKy0KbgcKEOC6I5Swk7eCcbWmnTgWtjdcgoLBx+ISRTMjeNOWsRXRdMuoy
         qY5fyIUTYMjCTDP1tjwEv7bYMZyvL8g+gqh6mWfOr7SaC2sHUc1w2LkKEV/OPPPdORdT
         Cd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715886947; x=1716491747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPaBePz3BonMngO7cdhCKA9KQJOsT7QDQu8wSi91ybY=;
        b=pN/+LxSaHrim7iRb1AmydIo1NFAeB6H0RgZbIRPTHZ/KTyW6Pf25K07DxBqUHae/Wv
         gET9XE+tCOfGx/01QMgO5qQ6ECTaFiYQZ2EW9FB+j158JyIefn7ilZpFAsJmbmBqM9kw
         a9jSJ0gkqwsnGaFRr6RbV60skOF3Ogfx+8gRoat4yAQaqmyXXvbwBNo+Wy/C6re+eIZr
         Zt4eQCCxoevwSJx31VF0UqOS7WBsOdfMv+DS+p+CHAvXw2ghTx7W/A6YCSI6DVeHFSzF
         uYjoIayEpBPjO92zFMUp03V3qpf/82DBuxsIH0olcwiPGJts35IzjU/z7lj9yrejg3BO
         KY5w==
X-Forwarded-Encrypted: i=1; AJvYcCUCDKGfP9SPNV6hzp/AQPapoDPoNxM7VXWTDEs5R4+ErOS8a4xlIeW2AdyIK1t/4s64Xu8k3xFnVLU9BEBD6B2+Ri3IuU1LbdTquMjq15Q=
X-Gm-Message-State: AOJu0YwZSZEuAQsEasqT1Lo8JdJ49rWVFV1dRayTN9d8XoxnWVzAACy/
	LqCLgR+C1U87sVj5eUZvvit3H6Dofho2vdcLsLlk1OeiDoBaQfvo
X-Google-Smtp-Source: AGHT+IH/QAgWew3vdVb/siW5lJyXYzpLrvjv7UqnF+iFproJwF7vzzjyIyp6JOwHT3JKOIj+AJnBSg==
X-Received: by 2002:a2e:9253:0:b0:2e0:4cbb:858a with SMTP id 38308e7fff4ca-2e520062823mr118711191fa.27.1715886946319;
        Thu, 16 May 2024 12:15:46 -0700 (PDT)
Message-ID: <66ac3d6aaf0e393ce76580f274c222d26c0aa0a1.camel@gmail.com>
Subject: Re: [PATCH] Revert "evtchn: refuse EVTCHNOP_status for Xen-bound
 event channels"
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Daniel Smith <dpsmith@apertussolutions.com>, 
 Xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Date: Thu, 16 May 2024 21:15:45 +0200
In-Reply-To: <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
References: <20240402170612.2477791-1-andrew.cooper3@citrix.com>
	 <11957460-0b2b-432d-ad92-38350306c9ff@suse.com>
	 <b14acc58-5d3c-46ed-a300-61f422501d4c@suse.com>
	 <1ba4d87f-48e2-4332-bcd8-ac891cee8917@citrix.com>
	 <ccd70c8f-1381-43f7-8be8-edc1dd505ce2@suse.com>
	 <9249bc7e-7ca9-4f6e-8f3e-f2962c14e306@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-14 at 12:13 +0100, Julien Grall wrote:
> Hi,
>=20
> (+ Oleksii as the release manager)
>=20
> Chiming into the discussion as there seems there is disagreement.
>=20
> On 14/05/2024 11:03, Jan Beulich wrote:
> > On 14.05.2024 11:51, Andrew Cooper wrote:
> > > On 14/05/2024 10:25 am, Jan Beulich wrote:
> > > > On 03.04.2024 08:16, Jan Beulich wrote:
> > > > > On 02.04.2024 19:06, Andrew Cooper wrote:
> > > > > > The commit makes a claim without any kind of justification.
> > > > > Well, what does "have no business" leave open?
> > > > >=20
> > > > > > The claim is false, and the commit broke lsevtchn in dom0.
> > > > > Or alternatively lsevtchn was doing something that was never
> > > > > meant to work
> > > > > (from Xen's perspective).
> > > > >=20
> > > > > > =C2=A0 It is also quite
> > > > > > obvious from XSM_TARGET that it has broken device model
> > > > > > stubdoms too.
> > > > > Why would that be "obvious"? What business would a stubdom
> > > > > have to look at
> > > > > Xen's side of an evtchn?
> > > > >=20
> > > > > > Whether to return information about a xen-owned evtchn is a
> > > > > > matter of policy,
> > > > > > and it's not acceptable to short circuit the XSM on the
> > > > > > matter.
> > > > > I can certainly accept this as one possible view point. As in
> > > > > so many cases
> > > > > I'm afraid I dislike you putting it as if it was the only
> > > > > possible one.
> > > > >=20
> > > > > In summary: The supposed justification you claim is missing
> > > > > in the original
> > > > > change is imo also missing here then: What business would any
> > > > > entity in the
> > > > > system have to look at Xen's side of an event channel? Back
> > > > > at the time, 3
> > > > > people agreed that it's "none".
> > > > You've never responded to this reply of mine, or its follow-up.
> > > > You also
> > > > didn't chime in on the discussion Daniel and I were having. I
> > > > consider my
> > > > objections unaddressed, and in fact I continue to consider the
> > > > change to
> > > > be wrong. Therefore it was inappropriate for you to commit it;
> > > > it needs
> > > > reverting asap. If you're not going to do so, I will.
> > >=20
> > > You tried defending breaking a utility with "well it shouldn't
> > > exist then".
> > >=20
> > > You don't have a leg to stand on, and two maintainers of relevant
> > > subsystems here just got tired of bullshit being presented in
> > > place of
> > > any credible argument for having done the change in the way you
> > > did.
> >=20
> > Please can you finally get into the habit of not sending rude
> > replies?
> >=20
> > > The correct response was "Sorry I broke things.=C2=A0 Lets revert thi=
s
> > > for
> > > now to unbreak, and I'll see about reworking it to not
> > > intentionally
> > > subvert Xen's security mechanism".
> >=20
> > I'm sorry, but I didn't break things. I made things more consistent
> > with
> > the earlier change, as pointed out before: With your revert,
> > evtchn_status() is now (again) inconsistent with e.g.
> > evtchn_send(). If
> > you were serious about this being something that needs leaving to
> > XSM,
> > you'd have adjusted such further uses of consumer_is_xen() as well.
> > But
> > you aren't. You're merely insisting on lsevtchn needing to continue
> > to
> > work in a way it should never have worked, with a patch to improve
> > the
> > situation already pending.
> >=20
> > Just to state a very basic principle here again: Xen-internal event
> > channels ought to either be fully under XSM control when it comes
> > to
> > domains attempting to access them (in whichever way), or they
> > should
> > truly be Xen-internal, with access uniformly prevented. To me the
> > former option simply makes very little sense.
>=20
> I agree we need consistency on how we handle security policy event=20
> channel. Although, I don't have a strong opinion on which way to go.
>=20
> For the commit message, it is not entirely clear what "broke
> lseventch=20
> in dom0" really mean. Is it lsevtchn would not stop or it will just
> not=20
> display the event channel?
>=20
> If the former, isn't a sign that the tool needs to be harden a bit
> more?=20
> If the latter, then I would argue that consistency for the XSM policy
> is=20
> more important than displaying the event channel for now (the patch
> was=20
> also committed 3 years ago...).
>=20
> So I would vote for a revert and, if desired, replacing with a patch=20
> that would change the XSM policy consistently. Alternatively, the=20
> consistency should be a blocker for Xen 4.19.
Sorry for the delayed response.

I am not deeply familiar with the technical details surrounding XSM,
but if I understand Daniel's point correctly, the original change
violates the access control framework. This suggests to me that the
revert should be merged.

However, I have a question: if we merge this revert, does it mean that
using channels a user ( domain ) will be able to get information about
certain events such as EVTCHNSTAT_unbound, EVTCHNSTAT_interdomain,
EVTCHNSTAT_pirq, EVTCHNSTAT_virq, and EVTCHNSTAT_IPI (based on the code
of lseventch.c)? Is this information really so critical that it cannot
be exposed for some time until a patch that changes the XSM policy
consistently is provided and merged?

If this information is indeed critical and should not be exposed, I
think we can consider Daniel's suggestion to add a check to the dummy
XSM policy as a solution.

~ Oleksii
>=20
> >=20
> > > As it stands, you're 2-1 outvoted, and wasted any sympathy I may
> > > have
> > > had for the principle of the change based on the absurdity of
> > > your
> > > arguments.
> >=20
> > No, pending objections are pending objections. Daniel's responses
> > didn't
> > eliminate them.
>=20
> Indeed, this is rule 4 of the check-in policy:
>=20
> 4. There must be no "open" objections.
>=20
> I don't view Jan's objections as unreasonable in particular for the=20
> consistency part.
>=20
> > As a separate aspect: I can't assume anymore that it is just
> > coincidence
> > that you taking such a controversial action is at a time when I'm
> > away.
>=20
> Cheers,
>=20


