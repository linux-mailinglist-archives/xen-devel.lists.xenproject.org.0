Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDCA87C5BF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 00:08:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693580.1081901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuAo-0005BB-Bo; Thu, 14 Mar 2024 23:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693580.1081901; Thu, 14 Mar 2024 23:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkuAo-00059M-9E; Thu, 14 Mar 2024 23:07:42 +0000
Received: by outflank-mailman (input) for mailman id 693580;
 Thu, 14 Mar 2024 23:07:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkuAn-00059F-1c
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 23:07:41 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6ac9d99-e257-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 00:07:39 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6577BCE1F0A;
 Thu, 14 Mar 2024 23:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98200C433F1;
 Thu, 14 Mar 2024 23:07:32 +0000 (UTC)
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
X-Inumbo-ID: a6ac9d99-e257-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710457653;
	bh=WKCV4XpqhurLaxE36e/z1suFrUlXoAsYCrCXD2m4XR4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TJK2vh/159ZEUjmrq+OiMH5/jluO3cevtmBrlt0ch+hrd3KLUTOTMYYfxVCgkqrrL
	 h7fEmnsW+4OrpjwbvS/ipw4P6n169F2G45wMclFjp2e8kg4yzhIqOVbV9NFdvIZgpm
	 v8NgGYJxYyYXceiXP1uuBCtdWKDalch5cHQCGMHEgGoGmeQL7A9ye8Gi1D1KZI5+SY
	 Zfw56dWjE9Ne8RS+zE0T5OLgo9CTFYIDTietrfdPwZZzV5Sntj+bsSth4JzUodsQNi
	 6AyFNbLN387Cyb18rUtEBMjzHNkD9Ii1qQ8c3akoznSUaIkJRxs1mjXtCL9xlBsJC3
	 dHhVeCDfsCDZw==
Date: Thu, 14 Mar 2024 16:07:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: Re: [XEN PATCH v3 09/16] xen: address violations of MISRA C:2012
 Directive 4.10
In-Reply-To: <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141607240.853156@ubuntu-linux-20-04-desktop>
References: <cover.1710145041.git.simone.ballarin@bugseng.com> <504cdd2a0f27d28e0a87492f75476b123b68bbc0.1710145041.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 11 Mar 2024, Simone Ballarin wrote:
> Amend inclusion guards to address violations of
> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
> to prevent the contents of a header file being included more than
> once").
> 
> Inclusion guards must appear at the beginning of the headers
> (comments are permitted anywhere) and the #if directive cannot
> be used for other checks.
> 
> Mechanical change.
> 
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

