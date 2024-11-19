Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD419D1C1A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 01:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839612.1255400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBji-0004aG-Mg; Tue, 19 Nov 2024 00:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839612.1255400; Tue, 19 Nov 2024 00:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDBji-0004Xo-JD; Tue, 19 Nov 2024 00:04:54 +0000
Received: by outflank-mailman (input) for mailman id 839612;
 Tue, 19 Nov 2024 00:04:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGE8=SO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tDBjg-0004Xg-Ro
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 00:04:52 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e381dde4-a609-11ef-99a3-01e77a169b0f;
 Tue, 19 Nov 2024 01:04:47 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3D134A41FE0;
 Tue, 19 Nov 2024 00:02:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7958CC4CECC;
 Tue, 19 Nov 2024 00:04:45 +0000 (UTC)
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
X-Inumbo-ID: e381dde4-a609-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0Ny43NS4xOTMuOTEiLCJoZWxvIjoibnljLnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6ImUzODFkZGU0LWE2MDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTc0Njg4LjE2NTA3OSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731974686;
	bh=zwcNxODTX3rXWQ5TN+gRjQvgJsKiB5/aS8YUZiTJyzM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tin2+LSCmulpwB5XATXL6wlmwSbjLz27mNSmkwGxFduQH7I4jxcUQqKWjLROPc/aZ
	 SavXZ2lsc2eEouiF3ZUy2QeYdBBq/XWFW9rhQerqG6vhqh7x4/7TERC0DyfoXZc/R/
	 hFwOL61uJ3PWEGkAwt6pLDbl8APc452gu0OBQ0AHibfWYu4DQz3i9W4kqA/Re7dSAD
	 pgNVzjl9bEA/QL6w+nRk9R6d9FRa46b8xtqzyN2JcxrwqHXEi/jmvBEEHYANjWarL3
	 L4U11eM9RLnlXCQQg2UsnKg1fxWzn/7gBavtkaVvH49vjpGOHGUF18d3Mz/zQ3LgwA
	 iAhHEI0lVJT3g==
Date: Mon, 18 Nov 2024 16:04:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Anthony PERARD <anthony.perard@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/3] CI: New stage "containers" to rebuild some
 containers
In-Reply-To: <ZztJPKoLvaTZguze@l14>
Message-ID: <alpine.DEB.2.22.394.2411181603160.1160299@ubuntu-linux-20-04-desktop>
References: <20241115170739.48983-1-anthony.perard@vates.tech> <20241115170739.48983-4-anthony.perard@vates.tech> <alpine.DEB.2.22.394.2411151629450.1160299@ubuntu-linux-20-04-desktop> <ZztJPKoLvaTZguze@l14>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Nov 2024, Anthony PERARD wrote:
> On Fri, Nov 15, 2024 at 04:34:21PM -0800, Stefano Stabellini wrote:
> > On Fri, 15 Nov 2024, Anthony PERARD wrote:
> > > Rebuild rolling release containers when XEN_CI_REBUILD_CONTAINERS is
> > > set. This is to be use with a scheduled pipeline.
> > > 
> > > When $XEN_CI_REBUILD_CONTAINERS is set, only build jobs related to the
> > > containers been rebuild will be executed.
> > > 
> > > Build jobs that are using one of the containers been rebuild should
> > > wait for the container to be rebuild. If it's a normal pipeline, those
> > > dependency are simply ignored.
> > 
> > This is a fantastic contribution, thanks Anthony!
> > 
> > I think we can simplify this patch by removing all stages except for
> > "containers" on the scheduled pipeline with XEN_CI_REBUILD_CONTAINERS
> > set to true.
> > 
> > I think it is a good idea to have a special schedule pipeline for this,
> > and we should exploit the fact that it is special and only use it to
> > rebuild the containers. If we want to, we can have a second scheduled
> > pipeline to do a full normal run afterwards.
> > 
> > This way, there is no need to carry the changes to build.yaml or
> > test.yaml that are a bit hard to read/understand for someone unfamiliar
> > with gitlab. When XEN_CI_REBUILD_CONTAINERS == true we only do the
> > containers stage.
> 
> So, you mean having this following change instead of make changes to
> build.yaml and test.yaml, right?
> 
>     diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>     --- a/.gitlab-ci.yml
>     +++ b/.gitlab-ci.yml
>     @@ -14,7 +14,15 @@ stages:
>        - test
>      
>      include:
>     -  - 'automation/gitlab-ci/containers.yaml'
>     -  - 'automation/gitlab-ci/analyze.yaml'
>     -  - 'automation/gitlab-ci/build.yaml'
>     -  - 'automation/gitlab-ci/test.yaml'
>     +  - local: 'automation/gitlab-ci/containers.yaml'
>     +    rules:
>     +      - if: $XEN_CI_REBUILD_CONTAINERS
>     +  - local: 'automation/gitlab-ci/analyze.yaml'
>     +    rules:
>     +      - if: $XEN_CI_REBUILD_CONTAINERS == null
>     +  - local: 'automation/gitlab-ci/build.yaml'
>     +    rules:
>     +      - if: $XEN_CI_REBUILD_CONTAINERS == null
>     +  - local: 'automation/gitlab-ci/test.yaml'
>     +    rules:
>     +      - if: $XEN_CI_REBUILD_CONTAINERS == null
> 
> 
> Or I guess we can also compare to the string "true" and write the
> expression as
>     if: $XEN_CI_REBUILD_CONTAINERS == "true"
> and
>     if: $XEN_CI_REBUILD_CONTAINERS != "true"

Yes exactly, either one of the above is fine!

It is much simpler and clearer than having to add (admittedly
non-obvious) checks to build.yaml and test.yaml.

Thanks!

