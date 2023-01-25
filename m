Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1F767B964
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 19:32:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484517.751127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkZ6-0004Kn-Ut; Wed, 25 Jan 2023 18:32:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484517.751127; Wed, 25 Jan 2023 18:32:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKkZ6-0004IP-SA; Wed, 25 Jan 2023 18:32:08 +0000
Received: by outflank-mailman (input) for mailman id 484517;
 Wed, 25 Jan 2023 18:32:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dnVv=5W=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pKkZ5-0004IJ-Jn
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 18:32:07 +0000
Received: from caracal.birch.relay.mailchannels.net
 (caracal.birch.relay.mailchannels.net [23.83.209.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f97e226-9cde-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 19:32:04 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 07950500ED2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:32:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 8034F50144E
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 18:32:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.44 (trex/6.7.1); Wed, 25 Jan 2023 18:32:01 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4P2C9X4Xh6zTR
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jan 2023 10:32:00 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e00e2 by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 25 Jan 2023 10:31:59 -0800
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
X-Inumbo-ID: 8f97e226-9cde-11ed-b8d1-410ff93cb8f0
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1674671521; a=rsa-sha256;
	cv=none;
	b=kr8jnzAkaLLX580X7SPq7SzTh9zUL60gexwnpSocbZxRcvjgvYA3b4PMom9MHspUiPF/4g
	k6USz/RVwpEQoe4uNBmzGsq34Gru36ePqs6TLrWhUeZXfXcMW0/wsCQVv/ZVbkln5TuGif
	ZKQjtkHj9lQUqWSy6k4IjGIHdG4eyki9HcYmavHSeBiELg1jNzN+zojfC6qfdTf8cV4Agk
	i2nIHBGngGDypOERCxwWTC8Ra+f27+54Md/WLXoscM9Kg7AgRMoOffcjE4CImt15kuw9+y
	5VPKc+uVa8w5A5jjEC9gXAtRPVLDWE8kua4f2xL1HBZ+ZO8IiVq8JL/j2OCPpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1674671521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=qxwJU1KGPHSbufcjGUiRlF4u7gN7908PHDzD9oDlrkU=;
	b=C/QeFOk5WBEiEMplgSWwzOvwqxU/Wwa+U+hbKhBZa1mv66NkCAh4NMGaB2zGz6l5U9q1jH
	U7n2A9VJKHHoJRQlSU4SHDlZGCpvmeH/JRTxr6kiMn3Onlx+/1LcMdgAo+uS0z9odW1G+O
	ECE11cp0k0rz3V+2BNrZgSJbQSdERyO1dDsyhgFulVeQG+ic+jWBMEIIUG6pV64GzTBHHz
	LSlXAs5TprSKuw/VBGRjtn6m/FXqgPhgjuDo0+kkexS79MQNTQsKIdVszRDKVYW1O7l7SH
	bLRrHRFkXL84JUT10v9QmzlOmKZQhRR3Osr2Tqbb+JFzxrM6P+6PtsPqWkF39g==
ARC-Authentication-Results: i=1;
	rspamd-6989874cc5-vfcqp;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Spill-Average: 0bdc106079f3d167_1674671521842_3279774127
X-MC-Loop-Signature: 1674671521842:647148034
X-MC-Ingress-Time: 1674671521841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1674671520;
	bh=qxwJU1KGPHSbufcjGUiRlF4u7gN7908PHDzD9oDlrkU=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=Rw2OFdLCEOwAbp/1i7CZHRg8P+T2J8WuPv8M3Nn8kxUho5cxbHkJxVO4LW+hvULCo
	 SjQ2s5aDxaGy6ZFOp06CAKr0KvPLDL4oZI3WPSagoLBxznOSl3EhSLKui8vx7D8QqJ
	 XcNQqtkuHSd/9sSNyNabeAAcYMr0H6AINrbanQ6c=
Date: Wed, 25 Jan 2023 10:31:59 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Reaver <me@davidreaver.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/x86: public: add TSC defines for cpuid leaf 4
Message-ID: <20230125183159.GA1963@templeofstupid.com>
References: <20230124223516.GA1962@templeofstupid.com>
 <145a827e-4b09-5a85-cb12-eb8f3e0c4f2a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <145a827e-4b09-5a85-cb12-eb8f3e0c4f2a@suse.com>

On Wed, Jan 25, 2023 at 07:57:16AM +0100, Jan Beulich wrote:
> On 24.01.2023 23:35, Krister Johansen wrote:
> > --- a/xen/include/public/arch-x86/cpuid.h
> > +++ b/xen/include/public/arch-x86/cpuid.h
> > @@ -71,6 +71,12 @@
> >   *             EDX: shift amount for tsc->ns conversion
> >   * Sub-leaf 2: EAX: host tsc frequency in kHz
> >   */
> > +#define XEN_CPUID_TSC_EMULATED       (1u << 0)
> > +#define XEN_CPUID_HOST_TSC_RELIABLE  (1u << 1)
> > +#define XEN_CPUID_RDTSCP_INSTR_AVAIL (1u << 2)
> > +#define XEN_CPUID_TSC_MODE_DEFAULT   (0)
> > +#define XEN_CPUID_TSC_MODE_EMULATE   (1u)
> > +#define XEN_CPUID_TSC_MODE_NOEMULATE (2u)
> 
> This could do with a blank line between the two groups. You're also
> missing mode 3. Plus, as a formal remark, please follow patch
> submission rules: They are sent To: the list, with maintainers on
> Cc:.

Thanks for the feedback.  I'll make those changes.

My apologies for the breach etiquette, and thank you for the reminder
about the norms.  I'll correct the To: and CC: headers on the next go
around.

-K

