Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFaLJ86nzWkffwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 01:18:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C73819AD
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 01:18:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1270869.1559329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w84oa-0004T5-JM; Wed, 01 Apr 2026 23:17:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270869.1559329; Wed, 01 Apr 2026 23:17:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w84oa-0004Rf-G6; Wed, 01 Apr 2026 23:17:36 +0000
Received: by outflank-mailman (input) for mailman id 1270869;
 Wed, 01 Apr 2026 23:17:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w84oY-0004RZ-VL
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2026 23:17:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w84oY-002vWG-2E
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 01:17:34 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cda742-5cb7-0a2a0a5109dd-0a2a4506bf86-30
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 01:17:33 +0200
Received: from [202.12.124.144] (helo=fout-b1-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69cda78b-0df0-0a2a45060019-ca0c7c90d475-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 01:17:32 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 8E35C1D00256;
 Wed,  1 Apr 2026 19:17:31 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 01 Apr 2026 19:17:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Apr 2026 19:17:30 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775085451;
	 x=1775171851; bh=Sx2r4/ZWKQ+Iol+JybbT8A58yQbfqz2kJA8DoxwRPWE=; b=
	N0O/7b/8uB0x4DxDqeDda3v9OpTjX8BmXzoRbMkPt6PQAs39JffnlaPf8N5DvqmE
	0ozFvLyonOgGd0gIKogp8EjUc/w7P1/GOu9/1bWz/K2fNOAShEfEWTWOUuX2V6Gd
	uoSeYOiB/5nPgstsXiJeEMk0FRdwjQssyHmhhkEHK+QTZKwrhtHL/sSIqOku7c/w
	aBr9ar3hzdbDSQXHYZ0dTG/hYsWGHPK3lpQIKqhhCkuGPT9lltgU17WdlsRKrBVn
	x7w3t5SDGZ8SWO3iL7J1aCKVSEGFqkIjsdynWKoUeUk56Stmr9cm57A1Opzpysrj
	jQWZaGGTIaajvSr569H68A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775085451; x=1775171851; bh=Sx2r4/ZWKQ+Iol+JybbT8A58yQbfqz2kJA8
	DoxwRPWE=; b=Cvzm7/lbULNN7Qc/IrwdSZa6Zx4b0M17qvBtI5gaVkHMqeCnple
	vEAfmAqLMddXVVRjGdWEjJewM8qIZtkNZwBPFBgqYgpmEqD4Vc0KJLih7iL9ZbRP
	B+5P37iaqsIcMYnLVoteGMfE7I9KtfSJF1XuUP/msba0bPVbcznjx20KyBKP0oN3
	/J0EnqrwRcpm3uAJcdgtEBv0FXJkSDZv8dyBisucTmSzgKbQewGYdDcyUYJHi2LC
	9Eooyoso5Nb8wan8WGMPr3hY9r5uN4gzJ4S4shJvgVQGy8ntyli+/Dc5E/h2anYG
	HVdGY7goID7N8i65IbShQ0yGuP784wf69LQ==
X-ME-Sender: <xms:i6fNacKoOt42eVHyPZk0dvt8w0VtmXvCIou4JuzRQJ0OwjNcVJNjfw>
    <xme:i6fNaSLGA_rTv0M12yXw0gnKV7B4nSZ-RTLq6IjWT-tM-P7Skzuv9JCtreEgqY6rx
    nk18JQ4aUwH8TP3vL9JQwUa_3TyjWjDDIs1aNJrxhs6nJmb>
X-ME-Received: <xmr:i6fNaaXePi-XQFEfO7arWhHQikK7w7JsiynTNty6spodjvZWHfG9HRiGWRur>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeetgeel
    leetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrihhnpe
    hgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmpdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlh
    eslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:i6fNaUhTwxdLkwjkG7xIFMXJxz61wF_rTtDL052UiSCugDm1Bu8RfA>
    <xmx:i6fNaV-jI7sOtwBG6d3ZkGFHNYggbR-p9RoB6TTEboOvFKFQlbTGPg>
    <xmx:i6fNaeDUH06SWU1adcpMN03dplU6IX0PL7MviGPSnC1lvxDqgStoag>
    <xmx:i6fNaSKW4zboAzLR8U1szdy1E366IWG2e0HadsoSjHiAnmFxOzukBA>
    <xmx:i6fNaUdlHZRVE9rF_DVx-wJE9ZDAFbEC0KbREpLIdKcpKZV6IyvprEP6>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 01:17:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac2nibFfvGm_7elv@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="C5W4Ug/2V60Qa5F1"
Content-Disposition: inline
In-Reply-To: <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
X-purgate-ID: tlsNG-16d1c6/1775085453-6464A3D8-9E5424A5/0/0
X-purgate-type: clean
X-purgate-size: 9143
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: F01C73819AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--C5W4Ug/2V60Qa5F1
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="ArA7zpzUrS2vfZ23"
Content-Disposition: inline
Date: Thu, 2 Apr 2026 01:17:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3


--ArA7zpzUrS2vfZ23
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 10:52:37AM +0200, Jan Beulich wrote:
> On 01.04.2026 09:14, Jan Beulich wrote:
> > On 27.03.2026 11:19, Marek Marczykowski-G=C3=B3recki wrote:
> >> I noticed that on some systems, there are a lot of IOMMU faults after
> >> S3. I can see it also on a laptop with MTL, but it affects also the ADL
> >> gitlab runner:
> >>
> >>     https://gitlab.com/xen-project/hardware/xen/-/jobs/13661033722
> >>     (XEN) [   37.201160] [VT-D]DMAR:[DMA Write] Request device [0000:0=
0:1e.6] fault addr 0
> >>     (XEN) [   37.201164] [VT-D]DMAR: reason 02 - Present bit in contex=
t entry is clear
> >>     (XEN) [   37.202332] [VT-D]DMAR:[DMA Write] Request device [0000:0=
0:1e.6] fault addr 0
> >>     (XEN) [   37.202339] [VT-D]DMAR: reason 02 - Present bit in contex=
t entry is clear
> >>
> >> Interestingly, the 0000:00:1e.6 device is not even listed by lspci.
> >>
> >> The issue is present only on staging, not staging-4.21.
> >>
> >> Bisect says:
> >>
> >> 5ec93b2f19ff8873fca65d38c1164b0a56d3898b is the first bad commit
> >> commit 5ec93b2f19ff8873fca65d38c1164b0a56d3898b
> >> Author: Jan Beulich <jbeulich@suse.com>
> >> Date:   Thu Jan 22 14:13:35 2026 +0100
> >>
> >>     x86/HPET: drop .set_affinity hook
> >=20
> > Looking into this, I find several things I can't quite understand (yet).
> > First there is
> >=20
> > (XEN) [000000456c0fe39f] Disabling HPET for being unreliable
> >=20
> > which looks to only affect clocksource selection, but not use as
> > broadcast source for CPU-idle management. (This may be an independent
> > issue.)
> >=20
> > Then there is
> >=20
> > (XEN) [    2.760248] HPET: 8 timers usable for broadcast (8 total)
> >=20
> > which should only occur on ARAT-incapable systems. That should only be
> > older hardware. (On my much older Skylake I don't see this line, for
> > example.) What does CPUID leaf 6 have on this system? Sadly xen-cpuid
> > is purely featureset based, and hence doesn't expose info about that
> > leaf. The leaf also isn't exposed to domains, so CPUID output in Dom0
> > isn't useful to look at either. It would need to be CPUID output on a
> > bare metal kernel.
> >=20
> > Further I suspect the fingered commit may only have uncovered an issue
> > elsewhere. I don't think we clear any context table entries during
> > suspend or resume. Hence in
> >=20
> > (XEN) [   20.554813] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.=
6] fault addr 0
> > (XEN) [   20.554819] [VT-D]DMAR: reason 02 - Present bit in context ent=
ry is clear
> >=20
> > the latter message is confusing me.
> >=20
> > The fault address being zero may, otoh, be a hint of hpet_msi_write()
> > never having run post-resume. Which may be the connection to the
> > dropping of hpet_msi_set_affinity(), as that did call that function.
>=20
> There clearly is an issue with the handling of the max_cstate variable,
> but I expect you don't use xenpm to limit usable C-states (there clearly
> is no respective command line option in the log you referenced)?

No, I don't think so.

> From what the log has, I conclude hpet_broadcast_resume() is called.

I don't think so... I applied changes as attached and got this on
resume:

(XEN) [   69.486120] Enabling non-boot CPUs  ...
(XEN) [   69.486404] mwait-idle: state C1 is disabled
(XEN) [   69.587869] mwait-idle: state C1 is disabled
(XEN) [   69.588008] mwait-idle: state C1 is disabled
(XEN) [   69.689438] mwait-idle: state C1 is disabled
(XEN) [   69.689608] mwait-idle: state C1 is disabled
(XEN) [   69.791066] mwait-idle: state C1 is disabled
(XEN) [   69.791334] mwait-idle: state C1 is disabled
(XEN) [   69.892938] mwait-idle: state C1 is disabled
(XEN) [   69.893209] mwait-idle: state C1 is disabled
(XEN) [   69.994890] mwait-idle: state C1 is disabled
(XEN) [   69.995096] mwait-idle: state C1 is disabled
(XEN) [   70.096638] mwait-idle: state C1 is disabled
(XEN) [   70.096915] mwait-idle: state C1 is disabled
(XEN) [   70.097093] mwait-idle: state C1 is disabled
(XEN) [   70.097272] mwait-idle: state C1 is disabled
(XEN) [   70.203357] [VT-D]DMAR:[DMA Write] Request device [0000:00:1e.6] f=
ault addr 0
(XEN) [   70.203363] [VT-D]DMAR: reason 02 - Present bit in context entry i=
s clear

> Question is whether it does what we want it to. Could you instrument it
> some, so we have confirmation that it is called, and we also know whether
> __hpet_setup_msi_irq() is not only called on all 8 channels, but also
> succeeds there? (If it failed, I suppose we better wouldn't set
> HPET_TN_FSB and/or HPET_TN_ENABLE.) If, however, it succeeds, I couldn't
> explain why the fault address would be reported as 0, as then we
> definitely must have written HPET_Tn_ROUTE.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ArA7zpzUrS2vfZ23
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=xen-debug.diff
Content-Transfer-Encoding: quoted-printable

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1ea8ae457424..4c5bf079b728 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -658,6 +658,8 @@ void hpet_broadcast_resume(void)
     u32 cfg;
     unsigned int i, n;
=20
+    printk("%s:%d: hpet_events: %p\n", __func__, __LINE__, hpet_events);
+
     if ( !hpet_events )
         return;
=20
@@ -667,23 +669,30 @@ void hpet_broadcast_resume(void)
=20
     if ( num_hpets_used > 0 )
     {
+        printk("%s:%d: num_hpets_used: %d\n", __func__, __LINE__, num_hpet=
s_used);
         /* Stop HPET legacy interrupts */
         cfg &=3D ~HPET_CFG_LEGACY;
         n =3D num_hpets_used;
     }
     else if ( hpet_events->flags & HPET_EVT_DISABLE )
+    {
+        printk("%s:%d: hpet_events->flags: %#x\n", __func__, __LINE__, hpe=
t_events->flags);
         return;
+    }
     else
     {
         /* Start HPET legacy interrupts */
+        printk("%s:%d\n", __func__, __LINE__);
         cfg |=3D HPET_CFG_LEGACY;
         n =3D 1;
     }
=20
+    printk("%s:%d: cfg: %#x\n", __func__, __LINE__, cfg);
     hpet_write32(cfg, HPET_CFG);
=20
     for ( i =3D 0; i < n; i++ )
     {
+        printk("%s:%d: i:%d, hpet_events[i].msi.irq: %d, hpet_events[i].fl=
ags: %#x\n", __func__, __LINE__, i, hpet_events[i].msi.irq, hpet_events[i].=
flags);
         if ( hpet_events[i].msi.irq >=3D 0 )
             __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
=20
@@ -694,6 +703,7 @@ void hpet_broadcast_resume(void)
         if ( !(hpet_events[i].flags & HPET_EVT_LEGACY) )
             cfg |=3D HPET_TN_FSB;
         hpet_write32(cfg, HPET_Tn_CFG(hpet_events[i].idx));
+        printk("%s:%d: i:%d, cfg: %#x\n", __func__, __LINE__, i, cfg);
=20
         hpet_events[i].next_event =3D STIME_MAX;
     }
diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
index fed30a919d2c..15113ebdfb6c 100644
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2646,6 +2646,7 @@ static int _disable_pit_irq(bool init)
 {
     int ret =3D 1;
=20
+    printk("%s:%d: using_pit: %d, cpu_has_apic: %d\n", __func__, __LINE__,=
 using_pit, cpu_has_apic);
     if ( using_pit || !cpu_has_apic )
         return -1;
=20
@@ -2655,8 +2656,10 @@ static int _disable_pit_irq(bool init)
      * XXX dom0 may rely on RTC interrupt delivery, so only enable
      * hpet_broadcast if FSB mode available or if force_hpet_broadcast.
      */
+    printk("%s:%d: cpuidle_using_deep_cstate: %d, boot_cpu_has(X86_FEATURE=
_XEN_ARAT): %d\n", __func__, __LINE__, cpuidle_using_deep_cstate(), boot_cp=
u_has(X86_FEATURE_XEN_ARAT));
     if ( cpuidle_using_deep_cstate() && !boot_cpu_has(X86_FEATURE_XEN_ARAT=
) )
     {
+        printk("%s:%d: init: %d\n", __func__, __LINE__, init);
         init ? hpet_broadcast_init() : hpet_broadcast_resume();
         if ( !hpet_broadcast_is_available() )
         {

--ArA7zpzUrS2vfZ23--

--C5W4Ug/2V60Qa5F1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnNp4kACgkQ24/THMrX
1ywHdAf8CsgOaRYooAk/aXo7Z4hncTLEcBBOwXYH419N+fqvycjl8MM+NPyQW8aS
FbckFM6z/Q/nAKQ3bj+PvGEY/sADvKMrVvzYyY7kwMXMrWU+xgibJsX0hdP6RrU3
sS7uLPEzwfGBd70OKn+RtCZgWsKr8y1sRiMyXrkcW03gOm7i2cOoZfWLL4KSGPjU
r86zyD7IhrKyCFwerhvBCKd4hheMPUGlmG0Z3LKPfqiJZmzyTBCgB0i1p/AZBS40
ctVa3BRKADhkhrP+nojy0Jz2LG1XVvB8ol7y/9cS+D55z5KhieILsIx7PUcMUwSW
x73jvWolOGkoCD7uRIQbR1fN8EsPMg==
=YQri
-----END PGP SIGNATURE-----

--C5W4Ug/2V60Qa5F1--

