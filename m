Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AE876F649
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 01:50:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576652.903020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRi5R-0005UO-75; Thu, 03 Aug 2023 23:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576652.903020; Thu, 03 Aug 2023 23:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRi5R-0005R1-3V; Thu, 03 Aug 2023 23:50:33 +0000
Received: by outflank-mailman (input) for mailman id 576652;
 Thu, 03 Aug 2023 23:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRi5Q-0005Qv-8G
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 23:50:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c60f0d-3258-11ee-b26a-6b7b168915f2;
 Fri, 04 Aug 2023 01:50:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E58ED61EFF;
 Thu,  3 Aug 2023 23:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAB2C433C8;
 Thu,  3 Aug 2023 23:50:27 +0000 (UTC)
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
X-Inumbo-ID: 86c60f0d-3258-11ee-b26a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691106628;
	bh=viWqANyZKHIi6essCCl/Y8s0t4ucXvcaCM8/oC45Vhs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tfQhsp/xS0fz229T7AfTFpXPr0GZTZAzCG0dvNaqFcK3V1qfIqRft61fbS5qqSVDK
	 e96fhi98MPth5eAFou3+umFiu61wt2Yy6/ZcIONChaPSGT4iVbi8lsLEkYG2hOJP/p
	 cnc1/uH1Uz0yAOpi27+tWHmQJG6eGdj7sprQCsdAJfcumd0rlPjXZGmZ9EASaPHcky
	 uOah4p8x4+vMQzNPQdYbbFGMuMi219B7qcjI+GJrr2Ti1KvbzeCaYwN1ne+9mrztFu
	 n0PMETWxc1dsoMfEqbkoMS4ucJn+xMP20NjtToNBjl4JeHx+152eCfFXL4OPQ1IQdE
	 oJrELuTTAYVJA==
Date: Thu, 3 Aug 2023 16:50:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 07/11] xen: address MISRA C:2012 Rule 2.1
In-Reply-To: <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
Message-ID: <alpine.DEB.2.22.394.2308031648340.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com> <7f8cbd8c8ad64cd3a0d099f31cb4d3fad48aa63b.1690985045.git.nicola.vetrini@bugseng.com> <e2d71138-e714-3c19-d5b9-94b322a47191@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Aug 2023, Jan Beulich wrote:
> On 02.08.2023 16:38, Nicola Vetrini wrote:
> > Rule 2.1 states: "A project shall not contain unreachable code".
> > 
> > The functions
> > - machine_halt
> > - maybe_reboot
> > - machine_restart
> > are not supposed to return, hence the following break statement
> > is marked as intentionally unreachable with the ASSERT_UNREACHABLE()
> > macro to justify the violation of the rule.
> 
> During the discussion it was mentioned that this won't help with
> release builds, where right now ASSERT_UNREACHABLE() expands to
> effectively nothing. You want to clarify here how release builds
> are to be taken care of, as those are what eventual certification
> will be run against.

Something along these lines:

ASSERT_UNREACHABLE(), not only is used in non-release builds to actually
assert and detect errors, but it is also used as a marker to tag
unreachable code. In release builds ASSERT_UNREACHABLE() doesn't resolve
into an assert, but retains its role of a code marker.

Does it work?

