Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074F864CF12
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 19:02:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462476.720646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5W51-0003rW-MS; Wed, 14 Dec 2022 18:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462476.720646; Wed, 14 Dec 2022 18:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5W51-0003p0-Jj; Wed, 14 Dec 2022 18:02:07 +0000
Received: by outflank-mailman (input) for mailman id 462476;
 Wed, 14 Dec 2022 18:02:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oonF=4M=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p5W50-0003oI-Dm
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 18:02:06 +0000
Received: from dormouse.elm.relay.mailchannels.net
 (dormouse.elm.relay.mailchannels.net [23.83.212.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 685cf834-7bd9-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 19:02:02 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 820D53C2038
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 18:01:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 0B72F3C1F72
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 18:01:59 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.48.82 (trex/6.7.1); Wed, 14 Dec 2022 18:01:59 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4NXNVF14ygzXJ
 for <xen-devel@lists.xenproject.org>; Wed, 14 Dec 2022 10:01:56 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0042 by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 14 Dec 2022 10:01:55 -0800
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
X-Inumbo-ID: 685cf834-7bd9-11ed-8fd2-01056ac49cbb
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1671040919; a=rsa-sha256;
	cv=none;
	b=y9g4ijT/mEN7CUp/1NOxPg18Z9NtPZ7+rLBBHp5jdnuad2Ni+XoZgIERxubK/ygCfmQaMx
	ScSLFKQVXdVgNgAnAVdWq5vI/5ofjEy7oT4rB6+pTR9v4U41pm05bxAfkVgnm6a1d7p9vO
	2G4Z4n9F4nPCKG5Le4FJ8/Jjp0ylHTKoa4ze8kyBzCUefNmjpRlBLzop6aYPiEelxAByG1
	KfEVtzHu5TNf9Jkrl8oKG/mvClRUtVJxyJGOLAfhaY53yQ5/+ijT+6H7vYL2/clAh/F807
	ONyuxUYWsP3ZGJK8ZEOeS0CJqNFaZD7IDE7LQ7AtXV1SjGpoIGjQv9hM6n3puQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1671040919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=G41YyEQdAvdLNdmcCgSApXt2iuCmtnH5EcY+eahbXKU=;
	b=vfVyGrwEPwgqy95SJbcaVevJpTVRrhOK2WwgiQkIuIwBRk2JWqoYSNHTwAdfDSvX6QZKAk
	lRfVZr5OgdmyjZPSWUNZU8dDfMNZ54ya+v2AEQndg/0I28K3pnjYRMq5O0SvKqAibWmIw4
	Y8GElJ8nlTYmhCnEQgHOKgkar6EXdnAVHocChBlfW8ceWmloEOsaxCOZ7hyWtlsBaszRqe
	EenLpqyre8nqYGawVIeV3xanmDoG8p3iOM2LjWL97I/tN67bQIkjyxShLrBqPozzfAxidA
	aEjHW3O+15FMjDC6fGIWbrU35FhxI6Lr484ZLscQQdUrqNT/a4Bupe50ck6E4A==
ARC-Authentication-Results: i=1;
	rspamd-747d4f8b9f-ksmzl;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Power-Absorbed: 39f96b5d5912fa20_1671040919292_1392245694
X-MC-Loop-Signature: 1671040919292:2356347636
X-MC-Ingress-Time: 1671040919292
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1671040917;
	bh=G41YyEQdAvdLNdmcCgSApXt2iuCmtnH5EcY+eahbXKU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=o+H50Bvqh65TWxi6MQInHB3ASJ0s2PbHm75XsoPD8JF6Z9CzxDz+ZtvnA+N1fAvGU
	 ZwVoiKaZ0quAQnXCWJ5fNGxJijxKseL9s2BPeaoy5IxQKTj+JqfhZ18n6hjGI2x6X9
	 OIxAjF10fl755W7/J3wvypLQOfPdNzIyrcTNNbUE=
Date: Wed, 14 Dec 2022 10:01:55 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH linux-next v2] x86/xen/time: prefer tsc as clocksource
 when it is invariant
Message-ID: <20221214180155.GB1953@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
 <20221212155730.GA1973@templeofstupid.com>
 <20221212160524.GB1973@templeofstupid.com>
 <1eb6048b-bf23-78a0-9c3c-54bbd12c3864@suse.com>
 <20221212220519.GA1935@templeofstupid.com>
 <60582b25-4fb9-a2c8-9db3-9b5593f039c1@suse.com>
 <20221213185842.GA1987@templeofstupid.com>
 <9bec6472-1f61-8b36-102d-7f7c884be869@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bec6472-1f61-8b36-102d-7f7c884be869@suse.com>

On Wed, Dec 14, 2022 at 09:17:24AM +0100, Jan Beulich wrote:
> On 13.12.2022 19:58, Krister Johansen wrote:
> > On Tue, Dec 13, 2022 at 08:23:29AM +0100, Jan Beulich wrote:
> >> On 12.12.2022 23:05, Krister Johansen wrote:
> >>> On Mon, Dec 12, 2022 at 05:46:29PM +0100, Jan Beulich wrote:
> >>>> On 12.12.2022 17:05, Krister Johansen wrote:
> >>>>> Both the Intel SDM[4] and the Xen tsc documentation explain that marking
> >>>>> a tsc as invariant means that it should be considered stable by the OS
> >>>>> and is elibile to be used as a wall clock source.  The Xen documentation
> >>>>> further clarifies that this is only reliable on HVM and PVH because PV
> >>>>> cannot intercept a cpuid instruction.
> >>>>
> >>>> Without meaning to express a view on the argumentation as a whole, this
> >>>> PV aspect is suspicious. Unless you open-code a use of the CPUID insn
> >>>> in the kernel, all uses of CPUID are going to be processed by Xen by
> >>>> virtue of the respective pvops hook. Documentation says what it says
> >>>> for environments where this might not be the case.
> >>>
> >>> Thanks, appreciate the clarification here. Just restating this for my
> >>> own understanding: your advice would be to drop this check below?
> >>
> >> No, I'm unconvinced of if/where this transformation is really appropriate.
> > 
> > Ah, I see.  You're saying that you're not convinced that this code
> > should ever lower the priority of xen clocksource in favor of the tsc?
> > If so, are you willing to say a bit more about what you find to be
> > unconvincing?
> 
> With the not-for-PV justification not really applicable, the main question
> is how else you mean to justify that aspect. Once limited back to HVM/PVH,
> it may all be okay.

Got it.  I think I can provide an answer for this.

> >> My comment was merely to indicate that the justification for ...
> >>
> >>>>> +	if (!(xen_hvm_domain() || xen_pvh_domain()))
> >>>>> +		return 0;
> >>
> >> ... this isn't really correct.
> > 
> > The rationale for this bit of code was the justification that turns
> > out to be incorrect.  That sounds to me like I have unnessary code,
> > unless I was right by mistake?
> 
> The PV clock interface was specifically introduced because the TSC could
> not be reliably used by PV domains. This may have been purely due to
> limitations of the TSC at the time, so taking into account more modern
> stability guarantees may make it okay to be used by PV as well. But
> migration needs to be considered, and validity (for PV) of the deriving
> of the two synthetic feature bits you use also needs to be checked

The current incarnation of the patch confines itself to just cases where
tsc_mode is never emulate.  In mode default, a non-virtualized tsc is
only selected if the host tsc is safe (this is also derived from the
CPUID[80000007].EDX[8] -- tsc invariant bit), and the domain is either
hvm with tsc scaling support, or a domain where the guest tsc frequency
matches the host tsc frequency.

For the PV case, or any case I think, the administrator would have had
to take an explicit action to ensure that no virutalize is enabled on
the tsc, and the underlying feature flags would have either been
inherited from the base cpu, or explicitly added by intervention. I
presume that we'd want to honor these settings if they were enabled
manually?

I may once again be misreading the documentation, but my interpretation
of the requirements around migration was that if you set no-emulate on
the tsc it was up to you to ensure that the target system for the
migration either had the same tsc frequency, or supported scaling.

> (I find X86_FEATURE_NONSTOP_TSC particularly interesting, because PV domains
> don't really have any notion of "C states"). Note that e.g.
> early_init_intel() derives the two bits from CPUID[80000007].EDX[8],
> which is an opt-in feature for all guest types as per the present CPUID
> policy logic in the hypervisor, but then goes on and sets
> X86_FEATURE_NONSTOP_TSC_S3 (which you don't use in your patch, so just to
> point out a possible pitfall) purely based on family/model information.

Thanks for pointing this out.  It looks like it's specific to Intel Atom
systems that have a tsc that does not stop during suspend.  If this is
set, then the clocksource is eligible to be used to for suspend timing.
Since we don't set this, it looks like there's no behavior change.  E.g.
the tsc remains ineligible for consideration as a suspend clocksource.

-K



