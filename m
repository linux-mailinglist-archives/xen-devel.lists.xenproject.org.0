Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CAF67D39B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 18:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485175.752198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6Sk-0004Ki-U5; Thu, 26 Jan 2023 17:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485175.752198; Thu, 26 Jan 2023 17:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL6Sk-0004HT-R9; Thu, 26 Jan 2023 17:55:02 +0000
Received: by outflank-mailman (input) for mailman id 485175;
 Thu, 26 Jan 2023 17:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FZWf=5X=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pL6Si-0004HL-T2
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 17:55:01 +0000
Received: from cross.elm.relay.mailchannels.net
 (cross.elm.relay.mailchannels.net [23.83.212.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a7f377c-9da2-11ed-b8d1-410ff93cb8f0;
 Thu, 26 Jan 2023 18:54:56 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id EF67C762218
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 17:54:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 8AADF762051
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 17:54:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a305.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.120.227.169 (trex/6.7.1); Thu, 26 Jan 2023 17:54:54 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a305.dreamhost.com (Postfix) with ESMTPSA id 4P2pJF4RXCzSG
 for <xen-devel@lists.xenproject.org>; Thu, 26 Jan 2023 09:54:53 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00cd by kmjvbox (DragonFly Mail Agent v0.12);
 Thu, 26 Jan 2023 09:54:51 -0800
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
X-Inumbo-ID: 8a7f377c-9da2-11ed-b8d1-410ff93cb8f0
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674755694; a=rsa-sha256;
	cv=none;
	b=07rfH9T6IVlT2nXEgcpxUcr7SdvG8EQ5l7bhIi2VZhUCTEP/F8FK+HO7Rq09JATZuigxxG
	xoSftRnZ7wVHkUwlBmAYx0ooScCJBFTDbCFtHESzPwYHxrqqcfn2Xbk5oo++TkWjcyIE1K
	/KrWHgxoQ5cwqQiXVnQCUsfYZoCp8WGjhp24CavKyIiRvAQtMhbhRYX/7IMXJJTHOIPPJ3
	uXUhnCO+OE8dCiw6JN1p/8T+LjBpxxEjIH8DP5oSruLXta9E5B2pmgph33hIedpEGEB2tY
	btrwi5URFxYevq49mcJZNkpQeP0k33Mlcg4SYFBQRbi9zyemNrTdygfF7vu9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674755694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=jxmpzMRS8uv3Rx43UOYjHE4GiOK6D+gngqmat/OvKTQ=;
	b=AQfgmF5sW+ntihOWQ6Vke+AXGJrE91B+aBonYWQblB5AUrfZY8L8akUZ0Pw+lJCmdfRBTJ
	p8vga3lXnOGzwGw03UkzEPNrVLJIOp+O4WkKWf+qTxK+JrXGKVddfHIZqanvkbUFwmea2K
	HVMcPW7PUd/oH/je4vf/3fJGRoSvolRPrtR4KacAzoWHgge0+Sf3MesLtelyf9u7OF6ncx
	zmtspb9JliiaAgNI8ANi1OQOa3HB0cQN4cbkPAixnIYsIpsDaWN1QqZQoakA2pDLjSMrEB
	l+FZ4PE+thOL6lFkn9CAAVy2a1lhF0pIu67cYQwVM8NRSERkPEA9ujljTL7jJw==
ARC-Authentication-Results: i=1;
	rspamd-7b784c8cc8-jzzsr;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Ruddy-Ski: 1455bc5660740c05_1674755694805_2390760637
X-MC-Loop-Signature: 1674755694805:1234692241
X-MC-Ingress-Time: 1674755694805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674755693;
	bh=jxmpzMRS8uv3Rx43UOYjHE4GiOK6D+gngqmat/OvKTQ=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=A/gr4s6WbWSqnhtz9OVBbLJeoRkHj9sZom+OSFHjQGKW4pAb9y6xSnjhGQKahtLh9
	 jeW1jUeTiKtfb0B9I+zmwGu1eJuTZJUsMcholeKxYE8osojqKClUCB8LTY4wtzpUXS
	 2+IPXzITtOb/7JMRIlgf1GZldC6kQeQSv+OLwUgQ=
Date: Thu, 26 Jan 2023 09:54:51 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230126175451.GA1959@templeofstupid.com>
References: <20230125184506.GE1963@templeofstupid.com>
 <8a07d6f8-a07a-d435-deef-1366fad29a11@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a07d6f8-a07a-d435-deef-1366fad29a11@suse.com>

On Thu, Jan 26, 2023 at 09:57:43AM +0100, Jan Beulich wrote:
> On 25.01.2023 19:45, Krister Johansen wrote:
> > v2:
> >   - Fix whitespace between comment and #defines (feedback from Jan Beulich)
> 
> Hmm, ...
> 
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
> ... while I'm fine with the leading blank line, what my earlier comment was
> about really are the two separate blocks of #define-s (the flag bits and the
> modes). I'll take care of this while committing; with the adjustment
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Sorry I miunderstood, and thanks for being willing to fix this up
while committing.

-K

