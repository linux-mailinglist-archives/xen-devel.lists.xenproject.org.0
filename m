Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B587DA206
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 22:50:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624639.973250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwTmd-0006iC-5u; Fri, 27 Oct 2023 20:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624639.973250; Fri, 27 Oct 2023 20:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwTmd-0006fm-35; Fri, 27 Oct 2023 20:50:19 +0000
Received: by outflank-mailman (input) for mailman id 624639;
 Fri, 27 Oct 2023 20:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qwTmb-0006fc-Nx
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 20:50:17 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6dffdd27-750a-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 22:50:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CA311CE1EAA;
 Fri, 27 Oct 2023 20:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EBCC433CB;
 Fri, 27 Oct 2023 20:50:08 +0000 (UTC)
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
X-Inumbo-ID: 6dffdd27-750a-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698439810;
	bh=kxCc1jFhEzhByO/8+hYdnp5XBtcQozYyW6rK9iv6ksU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Msn0BoBBOTBv7Zu9+yinyQcHt3rA2Xo3UzNFO0FbD2abUzcHoU6Ja6VVRbTVH8Fy3
	 qC5DfGPSgnygCxcqHIJN8nFyfaiaSNISfSsy4gAMolLrcHOK6BYzxzAzutz+G30phs
	 HvJvo6YEECOW/3LCkoY47zmZ3PtAo5sLG2+HDPVSz70Tx8imuLJrXwaJ8QtqXWT4G/
	 P7vG3MESbfh96VjpEkiwtFvqs0JI2KJFWWVYJOuXNep8kxr7n1hOJHi3WFKTx6UpKx
	 1PfYOu0mYc9d3fyRaeSlEsNEnv1YeXhgYmdFKXg7quO5O0oRE+m0cFo9wm6J+krSCe
	 uS2xh1hDi6Bwg==
Date: Fri, 27 Oct 2023 13:50:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v4 6/8] x86/mce: Move MC_NCLASSES into the
 enum mctelem_class
In-Reply-To: <6efab48e9340916f23c94baf5c189d1d1c6ab7e6.1698410970.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310271349340.271731@ubuntu-linux-20-04-desktop>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com> <6efab48e9340916f23c94baf5c189d1d1c6ab7e6.1698410970.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 27 Oct 2023, Nicola Vetrini wrote:
> The definition of MC_NCLASSES contained a violation of MISRA C:2012
> Rule 10.1, therefore by moving it as an enumeration constant resolves the
> violation and makes it more resilient to possible additions to that enum.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


