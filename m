Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA217E75FB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 01:36:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629873.982406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1FVY-0003Q1-8S; Fri, 10 Nov 2023 00:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629873.982406; Fri, 10 Nov 2023 00:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1FVY-0003Mt-5p; Fri, 10 Nov 2023 00:36:24 +0000
Received: by outflank-mailman (input) for mailman id 629873;
 Fri, 10 Nov 2023 00:36:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r1FVW-0003Mj-HA
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 00:36:22 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 286351f1-7f61-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 01:36:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F15C1CE10F6;
 Fri, 10 Nov 2023 00:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B39C433C7;
 Fri, 10 Nov 2023 00:36:09 +0000 (UTC)
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
X-Inumbo-ID: 286351f1-7f61-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699576571;
	bh=eIbtFy57GZNOyIF04MLNS0y1OxFOU+OKKAkZYgaqIh4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aI+2xwohm/FsnMw3s/XPHvCwkS8JR5c8BmSdiDH7afOJcIwxAzQF4QkPIS53qjR/7
	 2lrYS26qzEi2A0br5I/vnw2jpM4KOuGKkKPSl71w9kL0yTWPDVcAp/MwyMPxvri7VN
	 P/HYEco1j0OeroS4hz/YOUtx4F0ZtGdjhrdcBuoqbH/XjCFG38WvWXOXEE1kE3X3TN
	 PmXux58KIkefKl1kvjquZMFjce+OSA/AnLb4Qxo/lD879LyKK0Kuefg1NTXifGARJi
	 LmCGFXCtNoqns+AlVEl4IGLiYgxPw44NdfCFXxPcaf70ahvQUOI089sFz3m8kouqvs
	 /ka+MGzD5yY8g==
Date: Thu, 9 Nov 2023 16:36:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH][for-4.19 v4 1/8] xen/include: add macro
 ISOLATE_LOW_BIT
In-Reply-To: <b7600c39-b2da-f1e0-7f89-8546f69bafa7@suse.com>
Message-ID: <alpine.DEB.2.22.394.2311091635580.3478774@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com> <dca236bf9199f596bafb35eb48d81adc280d8cca.1698410970.git.nicola.vetrini@bugseng.com> <f88edc35-6b1b-0136-aa1f-6429652c4016@suse.com> <alpine.DEB.2.22.394.2310301536390.1625118@ubuntu-linux-20-04-desktop>
 <7c26fb70-6a8c-58a3-6a1d-300dd57b5827@suse.com> <b7600c39-b2da-f1e0-7f89-8546f69bafa7@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 9 Nov 2023, Jan Beulich wrote:
> On 31.10.2023 08:43, Jan Beulich wrote:
> > What I would consider scope creep I
> > specifically didn't even ask for: I'd like this macro to be overridable
> > by an arch. Specifically (see my earlier naming hint) I'd like to use
> > x86's BMI insn BLSI in the context of "x86: allow Kconfig control over
> > psABI level", when ABI v2 or higher is in use.
> 
> Actually I need to withdraw that. It meanwhile occurred to me that the
> compiler ought to recognize this pattern. And indeed gcc doesn't even
> have a builtin for it; its BMI intrinsic for BLSI (on x86 that is)
> specifically expands to x & -x, which the backend then is expected to
> deal with as appropriate. And indeed it can be observed to, with my
> "x86: allow Kconfig control over psABI level" in place.
> 
> Just as a reminder: I'd still like to see the further renaming done
> (to ISOLATE_LSB()). If I was to commit this patch, I'd be fine doing
> so while committing.

Please do

