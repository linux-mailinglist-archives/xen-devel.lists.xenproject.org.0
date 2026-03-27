Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AcJL6h8xmnwKgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:48:40 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17D63448C1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 13:48:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265568.1556413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66ba-0000XQ-Kq; Fri, 27 Mar 2026 12:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265568.1556413; Fri, 27 Mar 2026 12:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w66ba-0000UH-HS; Fri, 27 Mar 2026 12:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1265568;
 Fri, 27 Mar 2026 12:48:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1w66bZ-0000Tz-3m
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:48:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w66bY-008Gwh-7A
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 13:48:00 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c67c7a-e002-0a2a0a5209dd-0a2a4505dc78-22
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:48:00 +0100
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69c67c7e-5aeb-0a2a45050019-ca0c7c98e05d-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 13:47:59 +0100
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 419007A0154;
 Fri, 27 Mar 2026 08:47:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Fri, 27 Mar 2026 08:47:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Mar 2026 08:47:56 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm1 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774615678;
	 x=1774702078; bh=kgH6kXJD5WWblM90MR2rtcRLFzDJDDUs/OympKktGHM=; b=
	UfsN30xbA73JrguiPoXf+zllTYSIwaj8x2UrTmHps7im7UKAxgBsmdEQ8Rj+Xz8c
	A68IdqfAXIV4+n3yYhus57Yvv34mGqSUxx5usZ7GAEW3gJn4is1GJdlkpwieTAaD
	VJOuDzjGRVtbv3WWoVtX6FPEw+uF8sSKHQ7U1/1pDaqDVwI5oB1cY4p8ojOqT4dZ
	9GXOkRo70kGzn2tmT8f2C2lqBzce5JE2o+Hc3HVpHbQKU+N9Xcei0Y/SVQHTotkA
	V2b5BWpYzsui16nAe2FsEPfj5MzSOOx95cdPFDiMrVsLk+BNHOFQByvTVM+4txxH
	CcV+7fClR1VkvPFhWWEk3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774615678; x=1774702078; bh=kgH6kXJD5WWblM90MR2rtcRLFzDJDDUs/Oy
	mpKktGHM=; b=QQ2exnl2XYnTHVSs4U1IMLrrcbX6BX5viF0q4xru6lnOrjTGIgM
	P0vVgfiAoihIdyLbJO841JnYDrfPIBr74ZHSaL5ZHsAJFcIgK8HuUVUp71WJgaQR
	EvdeD8k3HycH8WhcYGwB18SzXnRIm51g3v7/DCvFA5eiWryN7ZN2N2n0sgnrZPJM
	4HnrmMrtjJLF34VN0pfzP/lqaRzdMHZHucE+pzGb33vUTc82cGY/81C28rO4d7r5
	q5+HC9KXMI9InyzJ1CTgSs38/Vfu4VfvadKYcsEFcYmzhZ+kRF4NH9iX9OiNrMnG
	vWXG1LD9FHAlUgqxdqY066Fgznol5c/FLQA==
X-ME-Sender: <xms:fXzGaQxm0XXRi3zrY-WQhKgFKIF_LS_8KXEHG0x0GqKF7pa4abn7ag>
    <xme:fXzGabsyuXhM4TVqwDi_-m0t9kgNNMiNiUyoSPNPDWR4KIhmbPIOI2EyguqmLZPCE
    4qnQcjNAedmBo74WuP70F_7JUM70tAr4V_I6hhKaokURvE7jA>
X-ME-Received: <xmr:fXzGafujUO1Qv-KkioTdbTMNgNzF86nLKbcJ06AaIEa3pHTw9QfKJahxj9Ww7eD2upThbPvvHYta4pcyFOZU7lCqcY7c7dshhLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeffedtfedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtgho
    mhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtth
    drohhrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:fXzGaYPX1zw0PlZpCjOQioeJggd-n49Ccsp-QKG5KeER5n4MNiVlYg>
    <xmx:fXzGaV3wq4Rd5Flfw49YrjhDArqvpJfdu7oDv97YaUShcCvMSPCKpA>
    <xmx:fXzGacNmdj3TD0mcXmiSWx-ynHiv-aER-oWfBiufY6siA6MVOZzQPQ>
    <xmx:fXzGad38U8-Ip4TbGGwkzTmbovasKbH_4AMYW7SzV8zF53IZqNi3sg>
    <xmx:fnzGadV2JosnlcVxY4FdOwwXLkoZnFP9y2z-D7ie_w-GE-HiEGcGS6FW>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 27 Mar 2026 13:47:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?
Message-ID: <acZ8ez4dmQay1JSw@mail-itl>
References: <aPzBO_eW8mQHM66u@mail-itl>
 <acQzzlXNDxNq885V@mail-itl>
 <29775afa-e17b-4c44-a2a8-4ef4bc7cdf0f@suse.com>
 <acUqOL232lp-Lw1v@mail-itl>
 <cbed767b-4ac4-4989-8778-43ff321ae977@suse.com>
 <acVWX8vkhZiFfonP@mail-itl>
 <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U3WZiaCdmRm0vx68"
Content-Disposition: inline
In-Reply-To: <88c65ec7-b7f7-4d8b-a453-d707440b43cb@suse.com>
X-purgate-ID: tlsNG-c201ff/1774615680-200AA488-EF344AC8/0/0
X-purgate-type: clean
X-purgate-size: 10324
X-Spamd-Result: default: False [-1.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: F17D63448C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--U3WZiaCdmRm0vx68
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Mar 2026 13:47:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Slow (higher scheduling latency?) system after S3 - regression
 4.17 -> 4.19 ?

Some further observation, this time regarding timers:

Just before S3:

    (XEN) [  150.264757] Dumping timer queues:
    (XEN) [  150.265181] CPU00:
    (XEN) [  150.265497]   ex=3D         736us timer=3Dffff82d040643540 cb=
=3Ddrivers/char/xhci-dbc.c#dbc_uart_poll(ffff82d0404e5e78)
    (XEN) [  150.266590]   ex=3D      460377us timer=3Dffff82d04065d2c0 cb=
=3Darch/x86/time.c#time_calibration(0000000000000000)
    (XEN) [  150.267636]   ex=3D     1377460us timer=3Dffff82d04065d220 cb=
=3Darch/x86/time.c#plt_overflow(0000000000000000)
    (XEN) [  150.268651]   ex=3D    13525100us timer=3Dffff82d040644c20 cb=
=3Darch/x86/cpu/mcheck/intel-nonfatal.c#mce_work_fn(0000000000000000)
    (XEN) [  150.269820] CPU02:
    (XEN) [  150.270126]   ex=3D      616653us timer=3Dffff830461931070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461931000)
    (XEN) [  150.271276] CPU04:
    (XEN) [  150.271577]   ex=3D      630577us timer=3Dffff830461935070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461935000)
    (XEN) [  150.272734]   ex=3D      634586us timer=3Dffff830461921070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461921000)
    (XEN) [  150.273884] CPU06:
    (XEN) [  150.274184]   ex=3D       44474us timer=3Dffff830461905070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461905000)
    (XEN) [  150.275334] CPU08:
    (XEN) [  150.275633]   ex=3D       11465us timer=3Dffff83046190d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046190d000)
    (XEN) [  150.276783] CPU09:
    (XEN) [  150.277083]   ex=3D       12465us timer=3Dffff830461909070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461909000)
    (XEN) [  150.278236] CPU10:
    (XEN) [  150.278536]   ex=3D       14464us timer=3Dffff830461901070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461901000)
    (XEN) [  150.279686] CPU11:
    (XEN) [  150.279986]   ex=3D       15464us timer=3Dffff830461911070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461911000)
    (XEN) [  150.281139] CPU12:
    (XEN) [  150.281438]   ex=3D       17463us timer=3Dffff830461919070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461919000)
    (XEN) [  150.282592] CPU13:
    (XEN) [  150.282890]   ex=3D      347090us timer=3Dffff830461941070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461941000)
    (XEN) [  150.284040] CPU14:
    (XEN) [  150.284341]   ex=3D       20462us timer=3Dffff83046191d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046191d000)
    (XEN) [  150.285496] CPU15:
    (XEN) [  150.285806]   ex=3D         470us timer=3Dffff83046192d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046192d000)
    (XEN) [  150.286972]   ex=3D       15316us timer=3Dffff8304619cdaa0 cb=
=3Ddrivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff8304619cdae0)
    (XEN) [  150.288156]   ex=3D        6230us timer=3Dffff8304619e8ed0 cb=
=3Dcommon/sched/core.c#s_timer_fn(0000000000000000)
    (XEN) [  150.289192] CPU16:
    (XEN) [  150.289492]   ex=3D      633594us timer=3Dffff830461929070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461929000)
    (XEN) [  150.290642] CPU18:
    (XEN) [  150.290942]   ex=3D      614601us timer=3Dffff830461939070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461939000)
    (XEN) [  150.292094] CPU20:
    (XEN) [  150.292394]   ex=3D       27459us timer=3Dffff830461915070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461915000)
    (XEN) [  150.293553]   ex=3D       55316us timer=3Dffff830461979aa0 cb=
=3Ddrivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff830461979ae0)
    (XEN) [  150.294744]   ex=3D       35413us timer=3Dffff83046198fdc0 cb=
=3Dcommon/sched/core.c#s_timer_fn(0000000000000000)
    (XEN) [  150.295776] CPU21:
    (XEN) [  150.296076]   ex=3D      617580us timer=3Dffff830461925070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461925000)

Just after S3:

    (XEN) [  164.462198] Dumping timer queues:
    (XEN) [  164.462630] CPU00:
    (XEN) [  164.462949]   ex=3D         768us timer=3Dffff82d040643540 cb=
=3Ddrivers/char/xhci-dbc.c#dbc_uart_poll(ffff82d0404e5e78)
    (XEN) [  164.464064]   ex=3D     1286532us timer=3Dffff82d04065d220 cb=
=3Darch/x86/time.c#plt_overflow(0000000000000000)
    (XEN) [  164.465099]   ex=3D      395997us timer=3Dffff830461921070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461921000)
    (XEN) [  164.466262]   ex=3D    15327843us timer=3Dffff82d040644c20 cb=
=3Darch/x86/cpu/mcheck/intel-nonfatal.c#mce_work_fn(0000000000000000)
    (XEN) [  164.467461] CPU02:
    (XEN) [  164.467773]   ex=3D       37756us timer=3Dffff830461931070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461931000)
    (XEN) [  164.468953] CPU04:
    (XEN) [  164.469267]   ex=3D      940042us timer=3Dffff830461935070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461935000)
    (XEN) [  164.470444] CPU06:
    (XEN) [  164.470759]   ex=3D      485896us timer=3Dffff830461905070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461905000)
    (XEN) [  164.471937] CPU08:
    (XEN) [  164.472251]   ex=3D      459720us timer=3Dffff83046190d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046190d000)
    (XEN) [  164.473430] CPU09:
    (XEN) [  164.473745]   ex=3D     1563081us timer=3Dffff830461909070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461909000)
    (XEN) [  164.474922] CPU10:
    (XEN) [  164.475237]   ex=3D      948204us timer=3Dffff830461901070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461901000)
    (XEN) [  164.476417] CPU11:
    (XEN) [  164.476732]   ex=3D      948071us timer=3Dffff830461911070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461911000)
    (XEN) [  164.477912] CPU12:
    (XEN) [  164.478219]   ex=3D      892163us timer=3Dffff830461919070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461919000)
    (XEN) [  164.479398] CPU13:
    (XEN) [  164.479713]   ex=3D      308429us timer=3Dffff830461941070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461941000)
    (XEN) [  164.480893] CPU14:
    (XEN) [  164.481208]   ex=3D      954493us timer=3Dffff83046191d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046191d000)
    (XEN) [  164.482386] CPU15:
    (XEN) [  164.482700]   ex=3D     1487692us timer=3Dffff83046192d070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff83046192d000)
    (XEN) [  164.483881] CPU16:
    (XEN) [  164.484195]   ex=3D       22890us timer=3Dffff830461929070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461929000)
    (XEN) [  164.485373] CPU18:
    (XEN) [  164.485688]   ex=3D       85902us timer=3Dffff830461939070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461939000)
    (XEN) [  164.486864] CPU20:
    (XEN) [  164.487171]   ex=3D         895us timer=3Dffff830461915070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461915000)
    (XEN) [  164.488358]   ex=3D       17895us timer=3Dffff830461979aa0 cb=
=3Ddrivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer(ffff830461979ae0)
    (XEN) [  164.489569]   ex=3D        2914us timer=3Dffff83046198fdc0 cb=
=3Dcommon/sched/core.c#s_timer_fn(0000000000000000)
    (XEN) [  164.490633] CPU21:
    (XEN) [  164.490947]   ex=3D      461154us timer=3Dffff830461925070 cb=
=3Dcommon/sched/core.c#vcpu_singleshot_timer_fn(ffff830461925000)

In the latter case, I see only one cb=3Dcommon/sched/core.c#s_timer_fn
(two of them before). And also only one
cb=3Ddrivers/cpufreq/cpufreq_ondemand.c#do_dbs_timer.

Is the s_timer_fn related to runqueues? I have two of them:

    (XEN) [   11.751480] Adding cpu 0 to runqueue 0
    (XEN) [   11.753580]  First cpu on runqueue, activating
    (XEN) [   11.755731] Adding cpu 2 to runqueue 0
    (XEN) [   11.757818] Adding cpu 4 to runqueue 0
    (XEN) [   11.759891] Adding cpu 6 to runqueue 0
    (XEN) [   11.761955] Adding cpu 8 to runqueue 0
    (XEN) [   11.764001] Adding cpu 9 to runqueue 0
    (XEN) [   11.766029] Adding cpu 10 to runqueue 0
    (XEN) [   11.768045] Adding cpu 11 to runqueue 0
    (XEN) [   11.770050] Adding cpu 12 to runqueue 1
    (XEN) [   11.772033]  First cpu on runqueue, activating
    (XEN) [   11.774051] Adding cpu 13 to runqueue 1
    (XEN) [   11.776047] Adding cpu 14 to runqueue 1
    (XEN) [   11.777993] Adding cpu 15 to runqueue 1
    (XEN) [   11.779913] Adding cpu 16 to runqueue 1
    (XEN) [   11.781872] Adding cpu 18 to runqueue 1
    (XEN) [   11.783912] Adding cpu 20 to runqueue 1
    (XEN) [   11.785855] Adding cpu 21 to runqueue 1

But when I force all CPUs into a single runqueue, there are still two of
those s_timer_fn timers (and also two cpufreq ones). And still only one
after S3. And still the issue after S3 persists.

Could the issue be related to those timer differences?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--U3WZiaCdmRm0vx68
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnGfHsACgkQ24/THMrX
1yyOoAf+J/Um5unsDNqh4unMBlGJx5D7CJPTanfcEDzpgk5X0epHrClkkGdzKTb6
gCiSxQ3GtlgGkCaEiavQkx2qDvjoMZfhNK5A6wjZgS1uh39J9na95zUUUCWaTIJb
uzmdY/Lt96RBrcEka1sloDSFAOpBsszmzt3QdGOgLYhvASEIJ4uC/JUNOrjOfKFK
GxLdhyNq3cjypqWMgGXi9r5580Qw/xIXo53uR4BHb6Uo4uBXlZgQe7YNYEJ1pzw8
kjhpwmpzv7z4Bz2FrfpuMVBSlX1gPwETfnhvjXw/tQunXZifTp1axKNpBlDSGy8q
ItDK6dbcew77Q1yv8p3gGA/isjUhyQ==
=wcyC
-----END PGP SIGNATURE-----

--U3WZiaCdmRm0vx68--

