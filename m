Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B773CBD97
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 22:17:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157704.290450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4UGN-00063y-Ao; Fri, 16 Jul 2021 20:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157704.290450; Fri, 16 Jul 2021 20:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4UGN-000616-7n; Fri, 16 Jul 2021 20:16:47 +0000
Received: by outflank-mailman (input) for mailman id 157704;
 Fri, 16 Jul 2021 20:16:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kgq4=MI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m4UGL-000610-Ee
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 20:16:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd4421dc-e672-11eb-89b2-12813bfff9fa;
 Fri, 16 Jul 2021 20:16:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F6E7613D0;
 Fri, 16 Jul 2021 20:16:43 +0000 (UTC)
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
X-Inumbo-ID: bd4421dc-e672-11eb-89b2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626466603;
	bh=K5hrA5hm+eVhZcHIJtA1PyJ6H804LwW+hN24O044kBs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GV6Uzzqy/DPP3K/O+icxmKILFvFqHvQtWx4ARnuiqDnp5p6HkEGB/6UKsL/LkX6Uy
	 HhMa/cqBvZ3dsZvBFiERvxPXWICpXFZRO8MMpdaB3B1xxPW5hvckKtGKmMlvmu29GF
	 IEfjs5CZMKPMuwrl4bT9a5+Kz2e1yReC+pNUSM9xrEQy4tNROJVkdXlZ3duo4gxHWK
	 dYTOsFh/NEOz4UA04F3PdVGmS/d+wZIUNNgSr9kuCgbOjsTwCwiBJB39LY/vlyoe99
	 gQsC2R9mteaZ9zWT7BBH/9MY5eLb9By/tZAA52k71b926uterX9wCo0vrsB9ugE5wU
	 l1GdOmLTJYL9g==
Date: Fri, 16 Jul 2021 13:16:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: preparations for 4.15.1 and 4.13.4
In-Reply-To: <c27ae453-d58f-30ac-e73a-c9eb5bc0090b@xen.org>
Message-ID: <alpine.DEB.2.21.2107161316330.3916@sstabellini-ThinkPad-T480s>
References: <48cc22b9-6d0a-2cfc-ce34-6aabeb84b160@suse.com> <c27ae453-d58f-30ac-e73a-c9eb5bc0090b@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 16 Jul 2021, Julien Grall wrote:
> On 15/07/2021 08:58, Jan Beulich wrote:
> > All,
> 
> Hi Jan & Stefano,
> 
> 
> > the releases are due in a couple of weeks time (and 4.14.3 is
> > supposed to follow another few weeks later). Please point out backports
> > you find missing from the respective staging branches, but which you
> > consider relevant.
> > 
> > Please note that 4.13.4 is going to be the last Xen Project
> > coordinated release from the 4.13 branch; the branch will go into
> > security-only maintenance mode after this release.
> 
> I would like to request the backports of the following commits:
> 
> 4473f3601098 xen/arm: bootfdt: Always sort memory banks
> b80470c84553 arm: Modify type of actlr to register_t
> dfcffb128be4 xen/arm32: SPSR_hyp/SPSR
> 93031fbe9f4c Arm32: MSR to SPSR needs qualification

Done

