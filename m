Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGofE5E4zmmAmAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:36:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B80A38701E
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 11:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271401.1559571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8ESG-00018G-U1; Thu, 02 Apr 2026 09:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271401.1559571; Thu, 02 Apr 2026 09:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8ESG-00015I-QS; Thu, 02 Apr 2026 09:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1271401;
 Thu, 02 Apr 2026 09:35:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w8ESF-00015C-4X
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 09:35:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8ESD-005hHv-NE
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 11:35:09 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce383c-2eae-0a2a0a5409dd-0a2a4509de0e-48
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:35:09 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69ce384c-bf79-0a2a45090019-67a8ac90ba1f-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 11:35:09 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 11DF5EC017D;
 Thu,  2 Apr 2026 05:35:08 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 02 Apr 2026 05:35:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Apr 2026 05:35:06 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775122507;
	 x=1775208907; bh=apQO9KLZiAeVK8BLrH4tF5lCXaQLZ06gLCcaCkpBSKE=; b=
	JE+XUUHwBtcaZNxIbuvhmEivNvbKJUfkOnEFTAvTGPBiHXM5wFpjvci4QwsU4O/f
	cDNCEVWvNzs2xhCx1jFrLaP9Q/qiRzBuheETtE/QEtj4PmLd+RqrPH4Dw4rEXqiS
	B0noFkqqNcGQwMBjURkP/T38zpiA8wEJwG6FSGWo2ZPwbvV555LBG3KbidqzWNqz
	A21GumU5i1OiFSkA+lQxN8qCtLN8VUYtI38Ek1g5k4NHP/9cN8wFCLrlvSYv7Ze2
	vgNtRmh03tiBrxzkcN9sbzQb+56xB2POsfA8KDH1Phl+gXeARtEOndM7ZGFE+DWJ
	obm5PAJFGYJH8f6eRWRShw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775122507; x=1775208907; bh=apQO9KLZiAeVK8BLrH4tF5lCXaQLZ06gLCc
	aCkpBSKE=; b=NZW8hKJjL0CpWhSgjnMlBqF9Cx+3VaB5sDkGVJerWv1ZDHd8i+2
	njrZUeJUtijVL59F6oId1rYTkniG6agrZSFnL1xwk8bqYhkmf736FsVxFMK0BIBw
	BKJei451D4BTlkHE3+/7pC9M963ew8obGu8HHOL9Rom4mjauevNEOFqTNLjwliCP
	ysufmr0sHiybhxNh/HeYVqHj5uiuLnY+jhCUIammWuuroUFPBeaBDhoklSOp0knz
	z0b0CVnPWqHLGCy3WF2o6MqYGER6TRQ+d6D2iWxxnTT/Uzd9ShEqbWCAnvFOvNFy
	2tDjDfvpZ3uNkb5VA1TMh5gxpBLVoLX0YoQ==
X-ME-Sender: <xms:SzjOaQqeBOYMjeWhKyMHuiEVarbCJ87JY6Hg9i_d_GAS9r91LukZjg>
    <xme:SzjOacrlv0uXcIqV00l5ue5AU055mqYHRklvBkObxeYRvqzIkfEFwEu7M_OUAxLfA
    Js1GM-33mIn_Lc53E3bqeXkyFpKxYsIosr1TsaADZFtBSTc>
X-ME-Received: <xmr:SzjOaS1Jqd82hT6v0Gt9eBgV2zTsfGlJYvwjNrHI1lKEZYr_pPkqCg77>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdehieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrgh
X-ME-Proxy: <xmx:SzjOaTDfKPbUKxwi_TrQj7hYbGMpIn6S81YUYEKsFQ0aUehahgsZSw>
    <xmx:SzjOaSel8tE89SvAGnO955uPqBO5US71MQs09OLYDGH9UU_4mBpVgg>
    <xmx:SzjOaQhHPRRCAsZ3TqJQnuQdKEbSXbW0YK-vFPfC8ZmE8QJCHUbZsQ>
    <xmx:SzjOaSoh3fImrgiR6FKY_Ibmzat6vD9kA7iMxVUJbURiCHTQHWUUnw>
    <xmx:SzjOaY_dR8sHxhHOstOtSBUykwfYaf3g2jK5wgK_FsuCaDEpmNGovHUJ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Apr 2026 11:35:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3
Message-ID: <ac44SVW1cPhKYFKU@mail-itl>
References: <acZZmGXIJlmN3KGm@mail-itl>
 <e8bbaae2-5cff-4549-9f27-fbbda7346f60@suse.com>
 <090b8b8f-141b-4a24-92eb-879c0a0c73e1@suse.com>
 <ac2nibFfvGm_7elv@mail-itl>
 <933a3e95-33d2-4e20-a4d5-2d8b20c2da7f@suse.com>
 <ac4kCq87SQSc6ddV@mail-itl>
 <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DAxEOqDSYZNEEJoQ"
Content-Disposition: inline
In-Reply-To: <aa6910f1-365a-4534-b229-9730b3aede02@suse.com>
X-purgate-ID: tlsNG-bad1c0/1775122509-2E155152-A8CA5F06/0/0
X-purgate-type: clean
X-purgate-size: 11641
X-Spamd-Result: default: False [-2.23 / 15.00];
	SIGNED_PGP(-2.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 9B80A38701E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--DAxEOqDSYZNEEJoQ
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="NVNT4aiuL2yDymiY"
Content-Disposition: inline
Date: Thu, 2 Apr 2026 11:35:05 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: IOMMU faults after S3


--NVNT4aiuL2yDymiY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 02, 2026 at 10:39:41AM +0200, Jan Beulich wrote:
> On 02.04.2026 10:08, Marek Marczykowski-G=C3=B3recki wrote:
> > The xl dmesg output (from MTL this time):
> >=20
> >     (XEN) [  123.477511] Entering ACPI S3 state.
> >     (XEN) [18446743903.571842] _disable_pit_irq:2649: using_pit: 0, cpu=
_has_apic: 1
> >     (XEN) [18446743903.571856] _disable_pit_irq:2659: cpuidle_using_dee=
p_cstate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0

> Hmm, but what you didn't log is whether __hpet_setup_msi_irq() actually
> succeeded everywhere. (And if it did, also logging HPET_Tn_ROUTE() values
> might be a good idea, if only to double check.)

Updated output:

    (XEN) [18446743899.720395] _disable_pit_irq:2649: using_pit: 0, cpu_has=
_apic: 1
    (XEN) [18446743899.720409] _disable_pit_irq:2659: cpuidle_using_deep_cs=
tate: 1, boot_cpu_has(X86_FEATURE_XEN_ARAT): 0
    (XEN) [18446743899.720420] _disable_pit_irq:2662: init: 0
    (XEN) [18446743899.720431] hpet_broadcast_resume:663: hpet_events: ffff=
83046bc1f080
    (XEN) [18446743899.720579] hpet_broadcast_resume:674: num_hpets_used: 8
    (XEN) [18446743899.720587] hpet_broadcast_resume:692: cfg: 0x1
    (XEN) [18446743899.720599] hpet_broadcast_resume:697: i:0, hpet_events[=
i].msi.irq: 122, hpet_events[i].flags: 0
    (XEN) [18446743899.720612] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x110
    (XEN) [18446743899.720638] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720649] hpet_broadcast_resume:701: i:0, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720665] hpet_broadcast_resume:711: i:0, cfg: 0xc134
    (XEN) [18446743899.720674] hpet_broadcast_resume:697: i:1, hpet_events[=
i].msi.irq: 123, hpet_events[i].flags: 0
    (XEN) [18446743899.720684] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x130
    (XEN) [18446743899.720707] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720717] hpet_broadcast_resume:701: i:1, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720728] hpet_broadcast_resume:711: i:1, cfg: 0xc104
    (XEN) [18446743899.720737] hpet_broadcast_resume:697: i:2, hpet_events[=
i].msi.irq: 124, hpet_events[i].flags: 0
    (XEN) [18446743899.720747] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x150
    (XEN) [18446743899.720771] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720781] hpet_broadcast_resume:701: i:2, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720797] hpet_broadcast_resume:711: i:2, cfg: 0xc104
    (XEN) [18446743899.720805] hpet_broadcast_resume:697: i:3, hpet_events[=
i].msi.irq: 125, hpet_events[i].flags: 0
    (XEN) [18446743899.720816] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x170
    (XEN) [18446743899.720838] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720848] hpet_broadcast_resume:701: i:3, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720863] hpet_broadcast_resume:711: i:3, cfg: 0xc104
    (XEN) [18446743899.720872] hpet_broadcast_resume:697: i:4, hpet_events[=
i].msi.irq: 126, hpet_events[i].flags: 0
    (XEN) [18446743899.720882] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x190
    (XEN) [18446743899.720905] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720915] hpet_broadcast_resume:701: i:4, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720931] hpet_broadcast_resume:711: i:4, cfg: 0xc104
    (XEN) [18446743899.720939] hpet_broadcast_resume:697: i:5, hpet_events[=
i].msi.irq: 127, hpet_events[i].flags: 0
    (XEN) [18446743899.720949] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x1b0
    (XEN) [18446743899.720971] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.720981] hpet_broadcast_resume:701: i:5, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.720997] hpet_broadcast_resume:711: i:5, cfg: 0xc104
    (XEN) [18446743899.721006] hpet_broadcast_resume:697: i:6, hpet_events[=
i].msi.irq: 128, hpet_events[i].flags: 0
    (XEN) [18446743899.721016] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x1d0
    (XEN) [18446743899.721039] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.721048] hpet_broadcast_resume:701: i:6, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.721064] hpet_broadcast_resume:711: i:6, cfg: 0xc104
    (XEN) [18446743899.721072] hpet_broadcast_resume:697: i:7, hpet_events[=
i].msi.irq: 129, hpet_events[i].flags: 0
    (XEN) [18446743899.721082] hpet_msi_write:283: iommu_intremap: 2 (iommu=
_intremap_off: 0), HPET_Tn_ROUTE(ch->idx): 0x1f0
    (XEN) [18446743899.721105] hpet_msi_write:287: iommu_update_ire_from_ms=
i rc: 0
    (XEN) [18446743899.721115] hpet_broadcast_resume:701: i:7, __hpet_setup=
_msi_irq ret: 0
    (XEN) [18446743899.721130] hpet_broadcast_resume:711: i:7, cfg: 0xc104

And the current debug diff attached.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NVNT4aiuL2yDymiY
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=xen-debug.diff
Content-Transfer-Encoding: quoted-printable

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae435..9916afd5ed68 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -364,6 +364,7 @@ static void __init calculate_host_policy(void)
     struct cpu_policy *p =3D &host_cpu_policy;
     unsigned int max_extd_leaf;
=20
+    printk("%s:%d\n", __func__, __LINE__);
     *p =3D raw_cpu_policy;
=20
     p->basic.max_leaf =3D
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 18b3c79dc97f..51a3d1c4b5f3 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -671,6 +671,7 @@ const struct cpu_dev __initconst_cf_clobber intel_cpu_d=
ev =3D {
=20
 void __init intel_init_arat(void)
 {
+    printk("%s:%d: opt_arat: %d, cpu_has_arat: %d\n", __func__, __LINE__, =
opt_arat, cpu_has_arat);
     if ( opt_arat && cpu_has_arat )
         setup_force_cpu_cap(X86_FEATURE_XEN_ARAT);
 }
diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 1ea8ae457424..7731654efa9b 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -280,9 +280,11 @@ static int hpet_msi_write(struct hpet_event_channel *c=
h, struct msi_msg *msg)
 {
     ch->msi.msg =3D *msg;
=20
+    printk("%s:%d: iommu_intremap: %d (iommu_intremap_off: %d), HPET_Tn_RO=
UTE(ch->idx): %#x\n", __func__, __LINE__, iommu_intremap, iommu_intremap_of=
f, HPET_Tn_ROUTE(ch->idx));
     if ( iommu_intremap !=3D iommu_intremap_off )
     {
         int rc =3D iommu_update_ire_from_msi(&ch->msi, msg);
+        printk("%s:%d: iommu_update_ire_from_msi rc: %d\n", __func__, __LI=
NE__, rc);
=20
         if ( rc < 0 )
             return rc;
@@ -658,6 +660,8 @@ void hpet_broadcast_resume(void)
     u32 cfg;
     unsigned int i, n;
=20
+    printk("%s:%d: hpet_events: %p\n", __func__, __LINE__, hpet_events);
+
     if ( !hpet_events )
         return;
=20
@@ -667,25 +671,35 @@ void hpet_broadcast_resume(void)
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
-            __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].msi.irq));
+        {
+            int ret =3D __hpet_setup_msi_irq(irq_to_desc(hpet_events[i].ms=
i.irq));
+            printk("%s:%d: i:%d, __hpet_setup_msi_irq ret: %d\n", __func__=
, __LINE__, i, ret);
+        }
=20
         /* set HPET Tn as oneshot */
         cfg =3D hpet_read32(HPET_Tn_CFG(hpet_events[i].idx));
@@ -694,6 +708,7 @@ void hpet_broadcast_resume(void)
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
diff --git a/xen/source b/xen/source
new file mode 120000
index 000000000000..945c9b46d684
--- /dev/null
+++ b/xen/source
@@ -0,0 +1 @@
+.
\ No newline at end of file

--NVNT4aiuL2yDymiY--

--DAxEOqDSYZNEEJoQ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnOOEkACgkQ24/THMrX
1yyr3Af/YrnnApygs7blpY0N0dlpMs479gI7O4+mv0PjmEMajTt9+Lsb3DSowbPL
H88eI33brO740l/t1w1YYmOAZBBgKuZNbsjR1jzJLqjWkJ/l0SBe463DgEtfhaXa
Qo4H3mF2JHXqHh0V3TtcuqRxIHUIUziIV5LiWKiIrrc0X1gQU9CYUGo1reh5iW56
5Wvxd6eNnJiSXNMSt9B02OpIgBaT42SsIYMnrzEGtmZcw2h9whE3+/e+3fLCCx37
Vb93YeXPMo88H5yVKj2REb/9LR9FsfIX/eCoHjibfqBBMqeDWrBEmcVPXftkv9sI
Uhs/wUWR2sdA5cpUJyIi1Lq25OvzPA==
=px07
-----END PGP SIGNATURE-----

--DAxEOqDSYZNEEJoQ--

