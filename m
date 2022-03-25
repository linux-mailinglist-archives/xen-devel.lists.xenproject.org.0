Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 666044E7AC2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Mar 2022 22:05:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294960.501897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXr7q-0007EF-16; Fri, 25 Mar 2022 21:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294960.501897; Fri, 25 Mar 2022 21:05:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXr7p-0007CQ-Tm; Fri, 25 Mar 2022 21:05:37 +0000
Received: by outflank-mailman (input) for mailman id 294960;
 Fri, 25 Mar 2022 21:05:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYjy=UE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nXr7o-0007CK-Hy
 for xen-devel@lists.xenproject.org; Fri, 25 Mar 2022 21:05:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fc179ce-ac7f-11ec-8fbc-03012f2f19d4;
 Fri, 25 Mar 2022 22:05:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7090561D72;
 Fri, 25 Mar 2022 21:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E5FC340F3;
 Fri, 25 Mar 2022 21:05:32 +0000 (UTC)
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
X-Inumbo-ID: 4fc179ce-ac7f-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648242332;
	bh=e0/Miv8bhd+MrPduc7WY8nVow9xmomC4qnxgj9KKnU0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uy4Qlco9u9tgNbVb8M804X0ssYb5o6mdcTQt/tOV1xpfzQ3CY3+6K3eXafgtBMOGe
	 GxBiTTDYsTE36JQb7HhIw2rM5IYLGJqLNJKGXkWx5OOVRZIBXW5zUfVQ4/leE0z2/3
	 kyLSbmSOHu9uZwLMCNbyInyZEnVe2xmP42mT6zKJXRu1BybEaOUrXgOmtk2fcMtLsa
	 7CxLul7H2yhc2RRcRz10j1n3HIE7C//ZGl2Ed9PWtOWLxlPxK4RqrlxIse0bdg7+3+
	 JVl2itywoPjJMD68dxSLvC6hPTdNiwcDa7slEOomaI4hk3eU+CF2h/EvNx2+z+edTP
	 wYVhduSt5ttqw==
Date: Fri, 25 Mar 2022 14:05:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
    jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    "Daniel P. Smith" <dpsmith.dev@gmail.com>
Subject: Re: [PATCH v3 2/5] xen: make evtchn_alloc_unbound public
In-Reply-To: <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org>
Message-ID: <alpine.DEB.2.22.394.2203251313350.2910984@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop> <20220128213307.2822078-2-sstabellini@kernel.org> <2f05e63a-96c3-e78f-f7e4-36fd17fcd58c@gmail.com> <alpine.DEB.2.22.394.2203221711110.2910984@ubuntu-linux-20-04-desktop>
 <c57dc9a9-e2ca-74c6-4fde-e2a6f1400de5@suse.com> <alpine.DEB.2.22.394.2203241522510.2910984@ubuntu-linux-20-04-desktop> <da700983-759b-2de6-9c36-0d09c6b06c0d@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Mar 2022, Julien Grall wrote:
> So to me, the idea of switching to a "fake" domain or bypassing the check is
> more appealing. I have a preference for the "fake" domain here.

As a maintainer, I am not opposed to the "fake"/"contructor" domain
concept.  It all depends on how many instances of this issue we are
going to have.  This is the only one on xen-devel so far. I don't think
it is worth adding a constructor domain for one instance only.  But I
agree with you and Daniel that if we end up with several instances, then
the constructor domain approach is probably the best option overall.


As a contributor, sadly I won't be able to spend a lot of time on this
in the following months. If a significant rework is required, I don't
think I'll be able to do it, at least not for this Xen release (and it
would be nice to have dom0less PV drivers in the coming release.) If
Daniel is willing, I could add his "idle_domain is_priv" patch to this
series.  Not as clean as a proper constructor domain but it would work
and it would be simple. It could be evolved into a nicer constructor
domain later.

This is not my preference but I could do that if Julien and Jan prefer
this approach and if Daniel is happy to share his patch.


> AFAIU, your proposal is to duplicate code. This brings other risks such as
> duplicated bug and more code to maintain.

Got it. I'll make one last attempt at a proposal that doesn't involve
the fake constructor domain. The goal is to avoid code duplication while
providing a safe way forward to make progress with only a small amount
of changes. What if we:

- rename evtchn_alloc_unbound to _evtchn_alloc_unbound (still static)
- add a skip_xsm parameter to _evtchn_alloc_unbound
- introduce a wrapper evtchn_alloc_unbound that always set skip_xsm to
  false (same interface as today's evtchn_alloc_unbound)
- introduce an __init early_evtchn_alloc_unbound public function that
  sets skip_xsm to true

This way:
- we have a single implementation in _evtchn_alloc_unbound (no code
  duplication)
- the only function exposed that skips the XSM check is __init
- evtchn_alloc_unbound continue to have the XSM check same as today


E.g.:
static int _evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, bool skip_xsm)
{
    ...
}

static int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
{
    return _evtchn_alloc_unbound(alloc, false);    
}

int __init early_evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc)
{
    return _evtchn_alloc_unbound(alloc, true);
}


Would this be good enough for now?

