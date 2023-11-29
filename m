Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7935F7FCD5D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 04:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643625.1004037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B5c-00035h-NQ; Wed, 29 Nov 2023 03:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643625.1004037; Wed, 29 Nov 2023 03:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8B5c-00033C-Kc; Wed, 29 Nov 2023 03:18:16 +0000
Received: by outflank-mailman (input) for mailman id 643625;
 Wed, 29 Nov 2023 03:18:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W+r8=HK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r8B5b-000326-7z
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 03:18:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ee5c21a0-8e65-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 04:18:14 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DF7A661982;
 Wed, 29 Nov 2023 03:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2996C433C7;
 Wed, 29 Nov 2023 03:18:10 +0000 (UTC)
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
X-Inumbo-ID: ee5c21a0-8e65-11ee-98e3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701227892;
	bh=s04Utbab8VBNR2SKrnm8dQRXEAG5Lq5iijit6vMZj24=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P+K/lQa2qKtcwPKn3HvdmVf7MI3TMrXfEBWdc4nZkXm7V0LXOq5xTL5rWU6T1LMUm
	 JBF2HAUV6ia/3xZmMe3Vu1mksC1p6SNdFCfWAgHqrP8kp+l6sncNAvAbpA4dmpiZV2
	 zvU0Tdt91yDDPEcG6jzmQV3oSuMQtWwGUxIJqWHJ7dI/fDARuL82wSfSF+l44/O6bV
	 NrPwr2cIkOKvKp3kT/mP+gIiohe8208dzlumiGxZ5tflLGi8+JqaEr+7ch9ESAzng/
	 DigMD24WNbMJgZl+6T+773GuIkPf33E08tQT3PoILL6DZKp+QXjwM1q38XOM9TRAaq
	 ZC3J2oosj88Qw==
Date: Tue, 28 Nov 2023 19:18:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v5 1/3] arm/bitops: encapsulate violation of MISRA
 C:2012 Rule 10.1
In-Reply-To: <7c07e93ad4c050a421ec97f832d0a1e5@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311281917570.3533093@ubuntu-linux-20-04-desktop>
References: <cover.1700724350.git.nicola.vetrini@bugseng.com> <c7728964a8e6afdb1f52ed93f3d7459cc72b85ee.1700724350.git.nicola.vetrini@bugseng.com> <790c0480-7235-4a2a-929e-973e7aa27864@suse.com> <7c07e93ad4c050a421ec97f832d0a1e5@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 24 Nov 2023, Nicola Vetrini wrote:
> On 2023-11-24 09:06, Jan Beulich wrote:
> > On 23.11.2023 08:37, Nicola Vetrini wrote:
> > > The definitions of ffs{l}? violate Rule 10.1, by using the well-known
> > > pattern (x & -x); its usage is wrapped by the ISOLATE_LSB macro.
> > > 
> > > No functional change.
> > > 
> > > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > 
> > This patch failed my pre-push build test; apparently xen/macros.h needs
> > including explicitly.
> > 
> > Jan
> 
> Yes, indeed. I must have dropped that change when experimenting with single
> evaluation and then never reinstated it.

Please re-send

