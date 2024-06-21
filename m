Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AAF911739
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:21:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744928.1152041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS1b-0004Oy-SB; Fri, 21 Jun 2024 00:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744928.1152041; Fri, 21 Jun 2024 00:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS1b-0004N8-PN; Fri, 21 Jun 2024 00:21:07 +0000
Received: by outflank-mailman (input) for mailman id 744928;
 Fri, 21 Jun 2024 00:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B+dc=NX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sKS1a-0004N2-VM
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:21:06 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23ee70dd-2f64-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 02:21:04 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 138D9CE288B;
 Fri, 21 Jun 2024 00:20:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB34C2BD10;
 Fri, 21 Jun 2024 00:20:56 +0000 (UTC)
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
X-Inumbo-ID: 23ee70dd-2f64-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718929258;
	bh=dVVM6JKb1/aCPj/T6phPl1iizQPNNYqbkm38shN8dbg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Buu5e/fIKc6cj2gwYojE2KWw1BXxRnPo5/hBlN8qhAFCCoT1mNKejL9xhsd61isJH
	 JlI7zWOBePp+NXDqpJ/PSJxzqUUb5Dfply4RzIydyqVKtflaGdBkx4quPoP07QJsjc
	 TfYe1Wl9/UuvhG7ZKQo9uBgeAlbrqMsICIUck35td78WSfJMeqlaey6JNuJCeztESs
	 IeuE4pKrKdUDDhpT/Ic8BY1yXkRlf1+UrI89CXyqPtTSMwZFC17d8fbtQEjHRHAazZ
	 00X0EKpocFz8oZgCpbIMP5HRopv6YBx+mc3EFnsRrnMkNVKAVW0uPns5gmdEoKBim6
	 JI1ob+U6Arsug==
Date: Thu, 20 Jun 2024 17:20:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 4/6][RESEND] automation/eclair_analysis: address
 violations of MISRA C Rule 20.7
In-Reply-To: <dfebde9cc657f2669df60b08ca34352288e082ab.1718378539.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406201720460.2572888@ubuntu-linux-20-04-desktop>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com> <dfebde9cc657f2669df60b08ca34352288e082ab.1718378539.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Jun 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses".
> 
> The local helpers GRP2 and XADD in the x86 emulator use their first
> argument as the constant expression for a case label. This pattern
> is deviated project-wide, because it is very unlikely to induce
> developer confusion and result in the wrong control flow being
> carried out.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


