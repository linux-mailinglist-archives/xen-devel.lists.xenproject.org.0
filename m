Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD628915B1A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747044.1154324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuLb-0000CB-EZ; Tue, 25 Jun 2024 00:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747044.1154324; Tue, 25 Jun 2024 00:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLuLb-00009d-Bk; Tue, 25 Jun 2024 00:47:47 +0000
Received: by outflank-mailman (input) for mailman id 747044;
 Tue, 25 Jun 2024 00:47:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cmkP=N3=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sLuLZ-0008VI-5p
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:47:45 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86912975-328c-11ef-b4bb-af5377834399;
 Tue, 25 Jun 2024 02:47:43 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E3741CE100E;
 Tue, 25 Jun 2024 00:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AD8C2BBFC;
 Tue, 25 Jun 2024 00:47:37 +0000 (UTC)
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
X-Inumbo-ID: 86912975-328c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719276459;
	bh=TvSvl6foj/py4SPyiCAX0s204I5R26HuqXoCLChQZqk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CL56zmMmRGyJ1X488Gh+9pE7qMC6zphMvr/zTZLJbmdm3q3Re2aKwsSeH6gELbgbV
	 lIN8KbznHkQGa9rAtkNuu5bRrsOOAlJj7YbmO9yq9oF6xrAGlcakBDacgAaJOD9Hqi
	 I5urP5jRrEN+xhtPLBSr5v2kRR+k8OgHLmV69PbmzGsIaMZbQJNWWonpZYgQQC7uQo
	 y0YRFpmOoXWLwelOMmR32uEGMuyre5oKZGH2p/cDVP/g0rbenxnKvrfUFciAWqFJZB
	 RPtBPorCL/SDIXUxMK2cZhe7KgI3BlrjnZ8ZzxUUMn8ahlLmuB12VJF92FRhcH3cSe
	 SUoeuv2fA5hBA==
Date: Mon, 24 Jun 2024 17:47:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, oleksii.kurochko@gmail.com
Subject: Re: [XEN PATCH v2 0/6][RESEND] address violations of MISRA C Rule
 20.7
In-Reply-To: <cover.1718378539.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406241743480.3870429@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Oleksii,

I would like to ask for a release-ack as the patch series makes very few
changes outside of the static analysis configuration. The few changes to
the Xen code are very limited, straightforward and makes the code
better, see patch #3 and #5.


On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> Hi all,
> 
> this series addresses several violations of Rule 20.7, as well as a
> small fix to the ECLAIR integration scripts that do not influence
> the current behaviour, but were mistakenly part of the upstream
> configuration.
> 
> Note that by applying this series the rule has a few leftover violations.
> Most of those are in x86 code in xen/arch/x86/include/asm/msi.h .
> I did send a patch [1] to deal with those, limited only to addressing the MISRA
> violations, but in the end it was dropped in favour of a more general cleanup of
> the file upon agreement, so this is why those changes are not included here.
> 
> [1] https://lore.kernel.org/xen-devel/2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com/
> 
> Changes in v2:
> - refactor patch 4 to deviate the pattern, instead of fixing the violations
> - The series has been resent because I forgot to properly Cc the mailing list
> 
> Nicola Vetrini (6):
>   automation/eclair: address violations of MISRA C Rule 20.7
>   xen/self-tests: address violations of MISRA rule 20.7
>   xen/guest_access: address violations of MISRA rule 20.7
>   automation/eclair_analysis: address violations of MISRA C Rule 20.7
>   x86/irq: address violations of MISRA C Rule 20.7
>   automation/eclair_analysis: clean ECLAIR configuration scripts
> 
>  automation/eclair_analysis/ECLAIR/analyze.sh     |  3 +--
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 14 ++++++++++++--
>  docs/misra/deviations.rst                        |  3 ++-
>  xen/include/xen/guest_access.h                   |  4 ++--
>  xen/include/xen/irq.h                            |  2 +-
>  xen/include/xen/self-tests.h                     |  8 ++++----
>  6 files changed, 22 insertions(+), 12 deletions(-)
> 
> -- 
> 2.34.1
> 

