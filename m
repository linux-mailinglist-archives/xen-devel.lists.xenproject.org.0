Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B852A899099
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 23:48:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701014.1095001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUwU-0000J2-Hr; Thu, 04 Apr 2024 21:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701014.1095001; Thu, 04 Apr 2024 21:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsUwU-0000Fh-Er; Thu, 04 Apr 2024 21:48:18 +0000
Received: by outflank-mailman (input) for mailman id 701014;
 Thu, 04 Apr 2024 21:48:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z08=LJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rsUwT-0000Fb-Di
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 21:48:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 091f8c6f-f2cd-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 23:48:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 58906CE31F6;
 Thu,  4 Apr 2024 21:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B701FC433F1;
 Thu,  4 Apr 2024 21:48:08 +0000 (UTC)
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
X-Inumbo-ID: 091f8c6f-f2cd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712267289;
	bh=H4391HbDqozE7pG7jw5kbUmqWKVBQ0iL6sLZRuZypJU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fJRwRL3EYTAm4GAPJ9fz4EGpx4cJjnamkBz4orMEEhieGpXvbkS/w9TgpxPADydMd
	 LgK8Il7AGIW31L+FYMtcxnV1ZOdFA3Hf659k0NUTwtWvs9fypHsdNIJ+gwe+Quvu6v
	 D1LhXb4x5TcrWSdqGlwcIYUgJRZNje3Yv9Cd4fxkQM4YKBTVJMd9Yw5pIVkQXo4pko
	 NpmcsTrQewdr4CAAALFUIWKq6O0tirlyErgIAsmli3pjx5CtZzWjoDJnsxKxLGzbd5
	 9PqPOM+tLXu6/kRB4wNzFlnS2GqnveE6uIPOQoZ2TZrOggjtQyOMr0yMDAHLxbyv2K
	 3swy9ynlIU9NQ==
Date: Thu, 4 Apr 2024 14:48:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Michal Orzel <michal.orzel@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] drivers: char: Drop useless suspend/resume stubs in
 Arm drivers
In-Reply-To: <012db229-8c84-4b74-b919-50e0231dd274@suse.com>
Message-ID: <alpine.DEB.2.22.394.2404041447580.2245130@ubuntu-linux-20-04-desktop>
References: <20240404075143.25304-1-michal.orzel@amd.com> <20240404075143.25304-2-michal.orzel@amd.com> <012db229-8c84-4b74-b919-50e0231dd274@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 4 Apr 2024, Jan Beulich wrote:
> On 04.04.2024 09:51, Michal Orzel wrote:
> > On Arm we don't use console_{suspend,resume} and the corresponding
> > stubs in serial drivers are being redundantly copied whenever a new
> > driver is added. Drop them as well as useless .endboot = NULL assignment.
> > 
> > Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Since hook invocations are suitably guarded:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

