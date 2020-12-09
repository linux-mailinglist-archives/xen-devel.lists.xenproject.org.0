Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122112D4968
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:48:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48650.86049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4V9-0004dI-1o; Wed, 09 Dec 2020 18:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48650.86049; Wed, 09 Dec 2020 18:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4V8-0004ct-Ui; Wed, 09 Dec 2020 18:47:46 +0000
Received: by outflank-mailman (input) for mailman id 48650;
 Wed, 09 Dec 2020 18:47:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn4V6-0004co-HU
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:47:44 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 875d951d-0969-4744-bc2a-7a909b5ae6d9;
 Wed, 09 Dec 2020 18:47:43 +0000 (UTC)
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
X-Inumbo-ID: 875d951d-0969-4744-bc2a-7a909b5ae6d9
Date: Wed, 9 Dec 2020 10:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607539662;
	bh=S77Xdr4GUfQdQuyEVOr/V1TbtP9CWgp2ztUbmJ1zloc=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=fdY1ulKlvtZdO1Aa591qgJm2XFqNWA2tqkUWVFkq6Fjn4/s6ca1hJwtWpsdPpFaYO
	 U28HmI71yWVHBKUkknu+wlh+cBw/8wHPMN1UIFUy6A2udSh3tBEuyJ3NIpRa/9nhdw
	 1mjsAyFeozZFAKWhQ9gbSjgEeUvO6wPslnbT8/VQrHC5vSDyZFME4Z+NOOqKQB6ifX
	 fci7fprG0KSWdUxgBttVIAshmVdl6GOAzTKlpRNeVmOYtgT6VWM4cKzMtuhB/pOe86
	 ettcXk/Lby9juXngmIOGHBmo/m9wUUnNPzO7e7ynG3RgKWmHK46olz5KDJTZ1Zn8zT
	 bWl3lydI6V/Qw==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, famzheng@amazon.com, cardoe@cardoe.com, 
    Bertrand.Marquis@arm.com, julien@xen.org, andrew.cooper3@citrix.com
Subject: Re: [PATCH v6 00/25] xl / libxl: named PCI pass-through devices
In-Reply-To: <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2>
Message-ID: <alpine.DEB.2.21.2012091046400.20986@sstabellini-ThinkPad-T480s>
References: <160746448732.12203.10647684023172140005@600e7e483b3a> <alpine.DEB.2.21.2012081702420.20986@sstabellini-ThinkPad-T480s> <20201209161433.d7xpx5zwtikd3fmk@liuwe-devbox-debian-v2>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Wei Liu wrote:
> On Tue, Dec 08, 2020 at 05:02:50PM -0800, Stefano Stabellini wrote:
> > The pipeline failed because the "fedora-gcc-debug" build failed with a
> > timeout: 
> > 
> > ERROR: Job failed: execution took longer than 1h0m0s seconds
> > 
> > given that all the other jobs passed (including the other Fedora job), I
> > take this failed because the gitlab-ci x86 runners were overloaded?
> > 
> 
> The CI system is configured to auto-scale as the number of jobs grows.
> The limit is set to 10 (VMs) at the moment.
> 
> https://gitlab.com/xen-project/xen-gitlab-ci/-/commit/832bfd72ea3a227283bf3df88b418a9aae95a5a4
> 
> I haven't looked at the log, but the number of build jobs looks rather
> larger than when we get started. Maybe the limit of 10 is not good
> enough?

Interesting! That's only for the x86 runners, not the ARM runners (we
only have 1 ARM64 runner), is that right?

If we could increase the number of VMs for x86 I think that would be
helpful because we have very many x86 jobs.

