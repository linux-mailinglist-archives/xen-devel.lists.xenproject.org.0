Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A816C3C7AA8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jul 2021 02:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155838.287618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Swx-0001kJ-Fs; Wed, 14 Jul 2021 00:40:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155838.287618; Wed, 14 Jul 2021 00:40:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Swx-0001iM-Ct; Wed, 14 Jul 2021 00:40:31 +0000
Received: by outflank-mailman (input) for mailman id 155838;
 Wed, 14 Jul 2021 00:40:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m3Swv-0001iA-KY
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 00:40:29 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abd8bf62-95e4-4102-8322-15b738c90b6b;
 Wed, 14 Jul 2021 00:40:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C05360FF1;
 Wed, 14 Jul 2021 00:40:28 +0000 (UTC)
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
X-Inumbo-ID: abd8bf62-95e4-4102-8322-15b738c90b6b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626223228;
	bh=H9O56kVqbiiKTCgS3VPYu2hPUMI6yc0kK6glhidi5iA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YIvcXBY+hCH7txv9pc+rNLfhX5DzP9vdzNO4uR+HHbhf+Ij/eSBQ0xCPQOvgzBvVU
	 bO7NSYAUPG7GyKf7ggawCfr47/117BmoBWoLeh8vF/svQhPwYe2DtSjCsHr6Wz4L6r
	 BOKbJSJuc+eplEHik1+p88dO1r1FZUccHfoyt3Fm0XNuVEawaKxipEY0DYZuFpvYlH
	 mX7Lt9EYiM+xXVg9rwCgMSTp/UFhNrqVgK6XS79Fyu2F31ifEOH70vuTdt3COov48k
	 GRukFfYPzcO9BiQVHpctmhWcs6JOXM4mTrkCQe4O8yZJOMKXH0oXY/5urgkHYZyy2I
	 y08/xrGrHcXUQ==
Date: Tue, 13 Jul 2021 17:40:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: cardoe@cardoe.com, wl@xen.org, andrew.cooper3@citrix.com
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 0/2] gitlab-ci: add a qemu-based arm32 test
In-Reply-To: <alpine.DEB.2.21.2106251826120.9437@sstabellini-ThinkPad-T480s>
Message-ID: <alpine.DEB.2.21.2107131739360.23286@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2106251826120.9437@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Ping?


On Fri, 25 Jun 2021, Stefano Stabellini wrote:
> Hi all,
> 
> This short series adds a minimal ARM32 test based on QEMU. It just runs
> Xen and Dom0 up to a Busybox prompt.
> 
> Cheers,
> 
> Stefano
> 
> 
> Stefano Stabellini (2):
>       Add qemu-system-arm to the existing tests-artifacts container
>       Add an ARM32 qemu-based smoke test
> 
>  automation/gitlab-ci/build.yaml                    | 14 ++++-
>  automation/gitlab-ci/test.yaml                     | 27 +++++++-
>  automation/scripts/qemu-smoke-arm32.sh             | 72 ++++++++++++++++++++++
>  ...arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} |  5 +-
>  4 files changed, 112 insertions(+), 6 deletions(-)
>  create mode 100755 automation/scripts/qemu-smoke-arm32.sh
>  rename automation/tests-artifacts/qemu-system-aarch64/{5.2.0-arm64v8.dockerfile => 6.0.0-arm64v8.dockerfile} (95%)
> 

