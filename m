Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D967D3B9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 19:03:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485181.752208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6aN-00061O-Nf; Thu, 26 Jan 2023 18:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485181.752208; Thu, 26 Jan 2023 18:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6aN-0005ya-KQ; Thu, 26 Jan 2023 18:02:55 +0000
Received: by outflank-mailman (input) for mailman id 485181;
 Thu, 26 Jan 2023 18:02:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZWf=5X=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pL6aM-0005yU-Rg
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 18:02:54 +0000
Received: from cross.elm.relay.mailchannels.net
 (cross.elm.relay.mailchannels.net [23.83.212.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a60c1c6b-9da3-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 19:02:52 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 427C27E2460
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 18:02:50 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id C3ABB7E2513
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 18:02:49 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.99.229.34 (trex/6.7.1); Thu, 26 Jan 2023 18:02:50 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4P2pTM0R0bzT5
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 10:02:46 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00cd by kmjvbox (DragonFly Mail Agent v0.12);
 Thu, 26 Jan 2023 10:02:44 -0800
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
X-Inumbo-ID: a60c1c6b-9da3-11ed-a5d9-ddcf98b90cbd
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674756169; a=rsa-sha256;
	cv=none;
	b=m+F75p7unMf/DGAEQAxbnR+zXDdWAgGhYW8HjvdjZ0Hod0DyabuhDUnsAzIWJqYgjIdznl
	IR5KCTZMj11Cju+QtbNGJzKmXZz7lC5HoUXaGuALdRG2FUxsnBkconashgGRvj10xZ5CI7
	4rzLSVNL2dnBBOQCzbSw2juI6/vKuWBqlb46BdKdTvNrtnmubwnZnT3unpmfj8CR2OF4Vh
	CZW1C/rumpE84+lTMPuC1NFqRetZYl9MchAWzwOdYLnGUb+M2f/YgFy6ctHcT/KuvDcpYi
	Z7faWG4MdbAtiz9x9iu/Tur2mH1+0C7Y/N+f0UCx9zyxsFxEeZiFYFoSAJSPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674756169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=0h75USw75PEGBO20cN1/ibS8ETsuoLrcwhoitcGBX6c=;
	b=BHR7BiDKdJ1SntEX1cBO0PfaNNxwDHLp+30G7VrOakbdq/KV69mJKur9Gu06BYj54kvVni
	wVGm9sfUbr41MeaZQ2COEr5AtUziL00m/nTWAP+4/HyTauMIBMDyYcG/OgwdDVjHfNL01O
	gSoQ6Is1W7kOfy5VwNXsu80RTzZ6DoQV0BYzgNSGHJJu+tlg3HxA4SPZytS7+fNicsOZ1D
	JnF9J5Osq4we+4MPT8RpA9sQAaB6v0M13/iAbGSxofDbUhD4wcpS0uWe1mKE4EBkff7vLu
	PNNmVUvpVfO5VeKFgSmIADxRMLMMpR4l+2Fut6WXhV06FsYp1QT0PdAs9LFcKQ==
ARC-Authentication-Results: i=1;
	rspamd-9476994bd-kbl4q;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Interest-Madly: 553898051b093dac_1674756170081_675623390
X-MC-Loop-Signature: 1674756170081:1438025192
X-MC-Ingress-Time: 1674756170081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674756167;
	bh=0h75USw75PEGBO20cN1/ibS8ETsuoLrcwhoitcGBX6c=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=llWecIXKg3DgeOW4ZnIcOdY2rwmIKWHjYEN9bbbv5l7NZVOs5scTZeOoDs3TeKaui
	 Ih1XnGvI5NqGYj3655ruFXf3VMGvGMbP1gbPqr3DUgws+vxEXnIFCWTV8qUUaogOwu
	 8rZDmzuTHwcr2wd/2gHO5RpG7CSTQpTElmCcDWnI=
Date: Thu, 26 Jan 2023 10:02:44 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Krister Johansen <kjlx@templeofstupid.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230126180244.GB1959@templeofstupid.com>
References: <20230125184506.GE1963@templeofstupid.com>
 <77576aab-93bf-5f6a-9b04-17eaf1d84ffb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77576aab-93bf-5f6a-9b04-17eaf1d84ffb@suse.com>

On Thu, Jan 26, 2023 at 10:57:01AM +0100, Jan Beulich wrote:
> On 25.01.2023 19:45, Krister Johansen wrote:
> > --- a/xen/include/public/arch-x86/cpuid.h
> > +++ b/xen/include/public/arch-x86/cpuid.h
> > @@ -72,6 +72,14 @@
> >   * Sub-leaf 2: EAX: host tsc frequency in kHz
> >   */
> >  
> > +#define XEN_CPUID_TSC_EMULATED               (1u << 0)
> > +#define XEN_CPUID_HOST_TSC_RELIABLE          (1u << 1)
> > +#define XEN_CPUID_RDTSCP_INSTR_AVAIL         (1u << 2)
> > +#define XEN_CPUID_TSC_MODE_DEFAULT           (0)
> > +#define XEN_CPUID_TSC_MODE_EMULATE           (1u)
> > +#define XEN_CPUID_TSC_MODE_NOEMULATE         (2u)
> > +#define XEN_CPUID_TSC_MODE_NOEMULATE_TSC_AUX (3u)
> 
> Actually I think we'd better stick to the names found in asm/time.h
> (and then replace their uses, dropping the #define-s there). If you
> agree, I'd be happy to make the adjustment while committing.

Just to confirm, this would be moving these:

   #define TSC_MODE_DEFAULT          0
   #define TSC_MODE_ALWAYS_EMULATE   1
   #define TSC_MODE_NEVER_EMULATE    2
   
To cpuid.h?  I'm generally fine with this.  I don't see anything in
Linux that's using these names.  The only question I have is whether
we'd still want to prefix the names with XEN so that if they're pulled
in to Linux it's clear that the define is Xen specific?  E.g. something
like this perhaps?

   #define XEN_TSC_MODE_DEFAULT          0
   #define XEN_TSC_MODE_ALWAYS_EMULATE   1
   #define XEN_TSC_MODE_NEVER_EMULATE    2

That does increase the number of files we'd need to touch to make the
change, though. (And the other defines in that file all start with
XEN_CPUID).

Though, if you mean doing it this way:

   #define XEN_CPUID_TSC_MODE_DEFAULT          0
   #define XEN_CPUID_TSC_MODE_ALWAYS_EMULATE   1
   #define XEN_CPUID_TSC_MODE_NEVER_EMULATE    2
 
then no objection to that at all.  Apologies for overlooking the naming
overlap when I put this together the first time.

-K

