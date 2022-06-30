Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9356262A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 00:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358730.588055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o72ky-0006To-RB; Thu, 30 Jun 2022 22:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358730.588055; Thu, 30 Jun 2022 22:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o72ky-0006RK-OO; Thu, 30 Jun 2022 22:35:28 +0000
Received: by outflank-mailman (input) for mailman id 358730;
 Thu, 30 Jun 2022 22:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HXfy=XF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o72kx-0006RE-VT
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 22:35:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef3ab96c-f8c4-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 00:35:26 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 818F162450;
 Thu, 30 Jun 2022 22:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB49C34115;
 Thu, 30 Jun 2022 22:35:23 +0000 (UTC)
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
X-Inumbo-ID: ef3ab96c-f8c4-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656628523;
	bh=FqKiq49jYP+9mSdTnz792yh57Uv7qw8s2Q2nrVlanUo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Jqj8QyAgBUZgZEK7b932YKE9QudogoLcm7OZTEMkAvRWHkaw1YllqQjPg/VjJfASt
	 EL+6F2/ImNjitB7yudzm8ZxNDWblLV0l1kAAETb6Lpp79+3KC0xcole9WJ3QmNSl8V
	 LJPVtWB3mllCbswBDmMxaTMejMaE5uA2vCMdwsLzgkxtnNm5Q9sgbcy/4qtRe9FgBK
	 RPzfI9ILUsFmGXkCCfBg9LHHRAZ4opHQZVGOvC9SRfYedMg6mp49+th3Z5u1Zt05Vj
	 iqj6JhGbamfblRuA783fRLfPLEjW0Tro2r2qbojuJYzCWcEvWMgrUxybGnWYnCGxyK
	 2ZcjHBI2AspAA==
Date: Thu, 30 Jun 2022 15:35:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
cc: xen-devel@lists.xenproject.org, scott.davis@starlab.io, jandryuk@gmail.com, 
    christopher.clark@starlab.io, sstabellini@kernel.org, 
    dgdegra@tycho.nsa.gov, jbeulich@suse.com, julien@xen.org, 
    george.dunlap@citrix.com, andrew.cooper3@citrix.com, dfaggioli@suse.com
Subject: Re: [PATCH v9 0/3] Adds starting the idle domain privileged
In-Reply-To: <20220630022110.31555-1-dpsmith@apertussolutions.com>
Message-ID: <alpine.DEB.2.22.394.2206301529570.4389@ubuntu-linux-20-04-desktop>
References: <20220630022110.31555-1-dpsmith@apertussolutions.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Jun 2022, Daniel P. Smith wrote:
> This series makes it so that the idle domain is started privileged under the
> default policy, which the SILO policy inherits, and under the flask policy. It
> then introduces a new one-way XSM hook, xsm_transition_running, that is hooked
> by an XSM policy to transition the idle domain to its running privilege level.
> 
> Patch 3 is an important one, as first it addresses the issue raised under an
> RFC late last year by Jason Andryuk regarding the awkward entanglement of
> flask_domain_alloc_security() and flask_domain_create(). Second, it helps
> articulate why it is that the hypervisor should go through the access control
> checks, even when it is doing the action itself. The issue at hand is not that
> the hypervisor could be influenced to go around these check. The issue is these
> checks provides a configurable way to express the execution flow that the
> hypervisor should enforce. Specifically with this change, it is now possible
> for an owner of a dom0less or hyperlaunch system to express a policy where the
> hypervisor will enforce that no dom0 will be constructed, regardless of what
> boot construction details were provided to it. Likewise, an owner that does not
> want to see dom0less or hyperlaunch to be used can enforce that the hypervisor
> will only construct a dom0 domain. This can all be accomplished without the
> need to rebuild the hypervisor with these features enabled or disabled.


It looks like this patch series is fully acked except:
- in theory we need an ack from Daniel for flask
- there is a very small change to sched that would need an ack from
  George/Dario


I think we should commit the series in a couple of days unless someone
spots an issue with it. Let me know if you have any concerns with this.

The minimal request to improve the in-code comment by Jan could be done
on commit.

Note that committing this series would also have the benefit of
unblocking the ARM gitlab-ci pipeline.

