Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4674D7DC2A5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 23:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625408.974642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxb9q-0005Wl-MG; Mon, 30 Oct 2023 22:54:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625408.974642; Mon, 30 Oct 2023 22:54:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxb9q-0005Un-JH; Mon, 30 Oct 2023 22:54:54 +0000
Received: by outflank-mailman (input) for mailman id 625408;
 Mon, 30 Oct 2023 22:54:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxb9p-0005Uf-6d
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 22:54:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55683705-7777-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 23:54:52 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9D14E60B9F;
 Mon, 30 Oct 2023 22:54:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D37C433C9;
 Mon, 30 Oct 2023 22:54:48 +0000 (UTC)
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
X-Inumbo-ID: 55683705-7777-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698706490;
	bh=kX3kiZJ5W99zGhXT7lbcan46OXFyhXWuhQBE5cGZEJU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NlHmxeXnbd9YesQ552xUq0UfANIBGlzWaE63jrAr2Mjv/hGYdY4e7wOX+m2f7Tzw7
	 tngjJ3P3eK++CKYzEjaKnS0wGFFTmWoWuGaJdg1mqJ+DqWVyUcLj5ZVGeqVSUNawgl
	 7XmLpo3vJAmNN/Izv0TJLFTVf7QSQPzhsHmHmiLSLge0HoQqgWOiTbghwOEUb0zBG+
	 xR832de8oCpsNAfguCLoO5pgOi2YYz64kaoTfsMuz01hqoFNQrtU9cQW+YVh/43wcC
	 glpY2qKeoVXAP56ygMntJM8mwrNJQ+QiYWISk/PzCdkmTyP7row7Vj5VmsQjz1TVfn
	 gMaT1h4hAjPmw==
Date: Mon, 30 Oct 2023 15:54:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, 
    Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
In-Reply-To: <4c5db3e9-cf77-43aa-be7b-df5734104fea@xen.org>
Message-ID: <alpine.DEB.2.22.394.2310301553280.1625118@ubuntu-linux-20-04-desktop>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com> <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com> <4c5db3e9-cf77-43aa-be7b-df5734104fea@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Oct 2023, Julien Grall wrote:
> Hi Nicola,
> 
> On 30/10/2023 09:11, Nicola Vetrini wrote:
> > As stated in rules.rst, functions used only in asm modules
> > are allowed to have no prior declaration visible when being
> > defined, hence these functions are marked with an
> > 'asmlinkage' macro, which is then deviated for MISRA C:2012
> > Rule 8.4.
> 
> AFAIU, this is a replacement of SAF-1. If so, I would like a consistent way to
> address Rule 8.4. So can you write a patch to replace all the use of SAF-1
> with asmlinkage and remove SAF-1?

+1


