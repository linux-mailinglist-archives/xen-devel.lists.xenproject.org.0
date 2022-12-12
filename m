Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCEF64A480
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 16:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459760.717535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lBV-0007RW-Co; Mon, 12 Dec 2022 15:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459760.717535; Mon, 12 Dec 2022 15:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lBV-0007O4-A1; Mon, 12 Dec 2022 15:57:41 +0000
Received: by outflank-mailman (input) for mailman id 459760;
 Mon, 12 Dec 2022 15:57:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2bIl=4K=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p4lBU-0007C5-BV
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 15:57:40 +0000
Received: from boar.tulip.relay.mailchannels.net
 (boar.tulip.relay.mailchannels.net [23.83.218.250])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b172d9a8-7a35-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 16:57:37 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 2151850232B
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 15:57:34 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 943FB501B6F
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 15:57:33 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.116.179.114 (trex/6.7.1); Mon, 12 Dec 2022 15:57:33 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4NW5qd1RSDzMB
 for <xen-devel@lists.xenproject.org>; Mon, 12 Dec 2022 07:57:33 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0062 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 12 Dec 2022 07:57:30 -0800
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
X-Inumbo-ID: b172d9a8-7a35-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1670860653; a=rsa-sha256;
	cv=none;
	b=tWoS8cOiby/UrMpJ4a0xfDZdsZm38Mx+ox2Ckus5yY4J+OgyBKWGEbjs+Hl0i5NCQP3vcv
	wJZUO+5YjWW3khYxh6/BlBYhFuOYFR+h1VMNxb1e0h/Z2SsHYHG2ufd4PmrsmRBZBnndX0
	bIksv3fa5s4ePLXcpCFoCO18dvWfoM/U/5T0YANAWpgveaBBP7Af8BoozhGYMopXjIfz0y
	7/Ig+HObZQK34Lhx/hogsSFrQPBUzQR8PWLH9nOhdXQl8e72p1j+b1kLyCGQ2lKO+Fjjry
	2TM+1a2bOaTGsVkoGY4HvLW7SVk71cDkz6e/WC6R7hTclNui/hx//rt5xuIKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1670860653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4T/zjG3plJ8sYfo5jMTvgYHcxH66poUD8cr6GG0LDRs=;
	b=ncpLvPS2no8tViamLPErH9Noqu+S3jTZGO5DsE8WJ+JuEgd/nL8GNaRHZ4CjTyL0Elo7cu
	lCc6UU9xpiTExlm9u6clpurfvrpp0D564LSjBmYUUVu0DR+eeJ1b2tk09NsNc6UsaXMo+g
	G5+0FHLO1UBuPoCGq7FuTSi900Hxkhhzuh/cnLU5UuX8ydIQ627xDWbfFXryh6kmHhlf5q
	1/rI/8qUdBzoTxuzMZ0K9gimvw4IsaIMOlXLtxp3mCJwRsRQyjDsXYHoF1nD5hGA9d9zrD
	ewR19A43F/m5XFkPRovRPMTVe+uw3JaUcDRrmLu43Bdez4Gxi3nbt97kc5w78Q==
ARC-Authentication-Results: i=1;
	rspamd-85f95c7974-lnmpm;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Slimy-Lettuce: 7d15233452a542f3_1670860653833_4237009608
X-MC-Loop-Signature: 1670860653833:1414107649
X-MC-Ingress-Time: 1670860653833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1670860653;
	bh=4T/zjG3plJ8sYfo5jMTvgYHcxH66poUD8cr6GG0LDRs=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=rS8AOfUvj/sxhB7y5MxG4vuS1Im8fpddc7fDN9zqGwS/Hy3RJorODqyuEGQRNj3BX
	 bHuBPDgEDT/gv6BsAXfXPiSPCghIHIsAMHF5lYfJra4TDj+bYh8aRxjozA7oTQWx40
	 FkPCBexZrraP8wgdo6ATStyICAChgaw92WElM4wA=
Date: Mon, 12 Dec 2022 07:57:30 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: Re: [PATCH linux-next] x86/xen/time: prefer tsc as clocksource when
 it is invariant
Message-ID: <20221212155730.GA1973@templeofstupid.com>
References: <20221208163650.GA3225@templeofstupid.com>
 <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e6c1b08-d573-fba9-61fd-d40a74427d46@oracle.com>

On Fri, Dec 09, 2022 at 02:32:15PM -0500, Boris Ostrovsky wrote:
> 
> On 12/8/22 11:36 AM, Krister Johansen wrote:
> > +	/*
> > +	 * As Dom0 is never moved, no penalty on using TSC there.
> > +	 *
> > +	 * If the guest has invariant tsc, then set xen_clocksource rating
> > +	 * below that of the tsc so that the system prefers tsc instead.  This
> > +	 * check excludes PV domains, because PV is unable to guarantee that the
> > +	 * guest's cpuid call has been intercepted by the hypervisor.
> > +	 */
> > +	if (xen_initial_domain()) {
> >   		xen_clocksource.rating = 275;
> > +	} else if ((xen_hvm_domain() || xen_pvh_domain()) &&
> > +	    boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
> > +	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
> > +	    !check_tsc_unstable()) {
> > +		xen_clocksource.rating = 299;
> > +	}
> 
> 
> What if RDTSC is intercepted?

Right, thanks.  I'll send out an updated patch here shortly that
attempts to address this by examining the cpuid information to determine
if the tsc is being emulated.

-K

