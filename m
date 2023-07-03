Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D3474618E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jul 2023 19:49:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558122.871947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGNfH-0002ra-N3; Mon, 03 Jul 2023 17:48:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558122.871947; Mon, 03 Jul 2023 17:48:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGNfH-0002pr-Id; Mon, 03 Jul 2023 17:48:43 +0000
Received: by outflank-mailman (input) for mailman id 558122;
 Mon, 03 Jul 2023 17:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3tK=CV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qGNfG-0002pl-TW
 for xen-devel@lists.xenproject.org; Mon, 03 Jul 2023 17:48:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d70ca3a1-19c9-11ee-8611-37d641c3527e;
 Mon, 03 Jul 2023 19:48:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B4D9460FF0;
 Mon,  3 Jul 2023 17:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD89C433CA;
 Mon,  3 Jul 2023 17:48:34 +0000 (UTC)
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
X-Inumbo-ID: d70ca3a1-19c9-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688406517;
	bh=tvAAoxxAUVfK9XbIn+RB9Iavrk7EaGPwzNsEzSZhIVI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DgQV3jTer36elNMcnfFGcgLqbFgIsn6079opFGC/NTNGJFP4UdjiYg5WcdCvU5isq
	 gpdvTyY71kkBcYCsNJDKjgUWt596f6n9NM/lPg0aMKjqv05ZOrGXXR2kiC+UtKqjAh
	 CQBuO0jn8eyfSfi4jZg7Ekg9ixs0li3JGaekpSyksG0XLU0E5K2bWELhdhy9URXr7N
	 Jr27KLmrjA+UctthtSw7EMH4jb57h8Hc4w5HxKkmgzjxwQpeucv8hcElU6Xx5hssvb
	 87ZvUpz7qz5QsOmSg9nM4jtIJ22kfRPTnFQTmHJKPR1TdQQ9llLGi2+b9+WBo4dqiP
	 ht2jwDxKcVJUQ==
Date: Mon, 3 Jul 2023 10:48:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: Luca Fancellu <Luca.Fancellu@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>, 
    Community Manager <community.manager@xenproject.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [RFC PATCH] xen/arm: Rebranding dom0less feature
In-Reply-To: <0c113f33-4410-aa75-84b7-c3ca860688f9@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2307031048220.246273@ubuntu-linux-20-04-desktop>
References: <20230630091210.3742121-1-luca.fancellu@arm.com> <6060dd00-5d9c-3804-4b9d-154b9b9dca49@citrix.com> <31FE51E0-0336-4756-8B30-6FE77DE10932@arm.com> <0c113f33-4410-aa75-84b7-c3ca860688f9@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-457683244-1688403545=:246273"
Content-ID: <alpine.DEB.2.22.394.2307030959200.246273@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-457683244-1688403545=:246273
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2307030959201.246273@ubuntu-linux-20-04-desktop>

On Mon, 3 Jul 2023, Daniel P. Smith wrote:
> On 7/1/23 11:13, Luca Fancellu wrote:
> > > On 1 Jul 2023, at 08:53, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > > 
> > > On 30/06/2023 10:12 am, Luca Fancellu wrote:
> > > > The "dom0less" feature was intended to be the feature where a domU
> > > > domain could be launched without the control domain (Dom0)
> > > > intervention, however the name seems to suggest that Dom0 cannot
> > > > be part of the configuration, while instead it's a possible use case.
> > > > 
> > > > To avoid that, rename the "dom0less" configuration with the name
> > > > "hyperlaunch", that is less misleading.
> > > > 
> > > > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > > > ---
> > > > This is an RFC to get the feeling of the community about the name
> > > > change, for now it's everything in one patch just to see how it
> > > > will look like, if there is interest on proceeding into it, I can
> > > > split in more commit.
> > > 
> > > Have you discussed this with Dan and Chris at all?  You haven't even
> > > CC'd them.
> > 
> > No, this rename idea started from a chat during the summit, anyway Julien
> > promptly add them to the CC, because I forgot.
> 
> No worries and thank you for considering and taking the time to do this RFC.
> It is greatly appreciated that there is a strong willingness to have dom0less
> and hyperlaunch merged.
> 
> > > 
> > > While there is a lot of end-goal in common between the dom0less and
> > > hyperlaunch, and that the name dom0less is deeply misleading,
> > > hyperlaunch is specifically not this.
> > 
> > Yes Hyperlaunch is more than this, however as I said, with this RFC I would
> > like
> > to ear opinions, @Daniel @Christopher could it be a proper name for the
> > dom0less
> > feature?
> 
> As Andy has alluded, hyperlaunch is meant to provide a flexible means to
> handle domain construction at boot to meet a wide range of possible use cases.
> One of those use cases is dom0less, so yes, ultimately what dom0less does
> today will be achievable under hyperlaunch. Our intended approach to align the
> two implementations is one that is meant to be minimally disruptive, since
> dom0less is considered a supported (SUPPORT.md) capability. As mentioned, we
> are greatly appreciative to the openness to adopt the name,

Thanks Daniel!


> but a big concern
> I personally have is the confusion it could cause a general user. A blanket
> rename would end up with two documents in the docs tree that provide two
> different explanations of hyperlaunch and two different device tree
> definitions. So I think a more measured approach should be considered here.
>
> > If this patch makes things more difficult for the Hyperlunch serie, I’m ok
> > to drop it,
> > my only aim was just to find a less misleading name for the feature.
> 
> What I would like to suggest as a good first step would be an update to the
> dom0less document. Provide a note at the beginning that points to the
> hyperlaunch design doc as a more general approach that will eventually subsume
> dom0less. This would provide a gentler transition for exist users of dom0less.
> 
> If it is not too much, I would also ask, please have a look at the design for
> boot modules in the series Christopher just posted. The design pulls from the
> work done by dom0less and expanded upon it. I major step into merging the two
> capabilities will be to have a common set of structures. Once those are in
> place, we can move to a common device tree representation, and at that point
> we would be fairly close, if not at the point of a formal merger of between
> the two.

At the moment we have a concrete problem with explaining dom0less and
hyperlaunch to potential new users. Using two different names for a
similar feature on arm and x86 causes confusion. It is hurting Xen as a
solution. Personally I already had to switch to use the word
"hyperlaunch" for everything in my users-facing presentations.

At the summit, we discussed that it would be a good idea to use a single
name to refer to both features on arm and x86. Given that "dom0less"
causes additional issues because it makes people think that there is no
Dom0, the suggestion was to use "hyperlaunch" to refer to both features.

We don't need to 100% align the two implementations and data structures.
This is not for engineers that are going to look at the specifications
and improve them. This is for users/customers of Xen that are trying to
understand what the hypervisor enables them to do. We need to be able to
show users architecture slides with the same name and explanation on
both ARM and x86.

I am sure that Daniel and Christopher remember, but for the others on
this email thread, the name "hyperlaunch" was born exactly to be that:
the one name to cover both features on ARM and x86 even if they have a
different implementation. Appended an old email for reference.

Also I agree with Daniel that we need to be careful about the two docs
under docs/. I think he is right we need to add a paragraph explaining
the history and a pointer to the other document. Something like:

"Dom0less is the name that was used when initially introducing the
feature on ARM. Then, the "dom0less" name was retired in favor of
"hyperlaunch" to avoid confusion (a Dom0 might still be present) and to
align with x86 (where a similar feature was called hyperlaunch from the
start)."


---

Subject: [RFP] Overarching name for dom0less and DomB

Greetings,

At the DeviceTree/DomB meeting it was proposed that a new, larger
overarching name under which DomB and dom0less would be covered. There
was a general openness to the idea. As such, since Christopher and
myself are in the midst of finalizing the design document for DomB we
felt it might be better to see if a name could be selected which we
could use in the design doc in lieu of DomB. As always naming things is
hard, but after some brainstorming we believe we have arrived at a
decent name, μLaunch (micro-Launch or uLaunch).

---

μLaunch became hyperlaunch few days after, and the rest was history :-)
--8323329-457683244-1688403545=:246273--

