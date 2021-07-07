Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9177D3BED27
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jul 2021 19:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.152649.281982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1BQS-0002X7-Tm; Wed, 07 Jul 2021 17:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 152649.281982; Wed, 07 Jul 2021 17:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1BQS-0002U5-QG; Wed, 07 Jul 2021 17:33:32 +0000
Received: by outflank-mailman (input) for mailman id 152649;
 Wed, 07 Jul 2021 17:33:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DB7Z=L7=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m1BQQ-0002TT-Pl
 for xen-devel@lists.xenproject.org; Wed, 07 Jul 2021 17:33:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcf51b62-aecf-45ce-8d1f-919a80080a18;
 Wed, 07 Jul 2021 17:33:29 +0000 (UTC)
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
X-Inumbo-ID: dcf51b62-aecf-45ce-8d1f-919a80080a18
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625679209;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/qQgonsgsqOWWgVwfH1QHXDw688aRUgMVQ9AYhqz+jI=;
  b=hARzHeGW7T7X7eacFIUjH2l5MmDvj+fslA9nE3JaPRp54tmTQgwRAwkP
   GoFWTvhINCJXQFAah1qtOXv0NLtLuVg6UCra12JGVS7YEb8hR3MOu8xKs
   1+KY5nxadhR5+NW7VKv3+HDOXPdTuH6+/J8j1+bkmeBD/Go74GYVsyId1
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: eiCbKsYg+5hkCehyFK/IuzUv/3sd2iAwXOddc9Pd7SWX1z+pf9jNwvHwCb7irI1kxWR3o1MtDv
 Sep/1PokyAA/t7I9iIs58izufxn+51txAUY74sbuXC5026wjrKw8C4ORzeBA/z8D61xDpXAVXt
 d77pPn3gzx3ISUpGkYI/dh6Mlu7T1DR7y6oYiKsKO7dYKCdEKGsKkK2U9JjWBAqORJRzef2FGh
 hzwtzpq1Y/k1d3RFVCqnAYiM1TfNu/8JyUbXEt79F4j7BGsasUhuQfdVlQLhaI3zfKq7u8MZia
 9Lw=
X-SBRS: 5.1
X-MesageID: 49399305
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:mKxH1a/coEPHkc+k4U9uk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-IronPort-AV: E=Sophos;i="5.84,221,1620705600"; 
   d="scan'208";a="49399305"
Date: Wed, 7 Jul 2021 18:23:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 0/2] automation: Fix build with new qemu-xen version
Message-ID: <YOXi98Wh1wkCMgeu@perard>
References: <20210707164001.894805-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210707164001.894805-1-anthony.perard@citrix.com>

On Wed, Jul 07, 2021 at 05:39:59PM +0100, Anthony PERARD wrote:
> Adding ninja-build pkg when possible.
> 
> I'll push new containers soon.

I've pushed:
    registry.gitlab.com/xen-project/xen/fedora:29
    registry.gitlab.com/xen-project/xen/ubuntu:bionic
    registry.gitlab.com/xen-project/xen/ubuntu:focal
    registry.gitlab.com/xen-project/xen/alpine:3.12
    registry.gitlab.com/xen-project/xen/suse:opensuse-leap

> 
> Anthony PERARD (2):
>   automation: Adding ninja-build to some docker images
>   automation: Check if ninja is available before building QEMU
> 
>  automation/build/alpine/3.12.dockerfile        | 1 +
>  automation/build/fedora/29.dockerfile          | 9 ++++++---
>  automation/build/suse/opensuse-leap.dockerfile | 2 ++
>  automation/build/ubuntu/bionic.dockerfile      | 2 ++
>  automation/build/ubuntu/focal.dockerfile       | 2 ++
>  automation/scripts/build                       | 4 +++-
>  6 files changed, 16 insertions(+), 4 deletions(-)

-- 
Anthony PERARD

