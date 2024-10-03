Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1975798E7CB
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 02:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809130.1221308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9pt-0004Bp-Nb; Thu, 03 Oct 2024 00:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809130.1221308; Thu, 03 Oct 2024 00:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9pt-00049r-Kx; Thu, 03 Oct 2024 00:36:53 +0000
Received: by outflank-mailman (input) for mailman id 809130;
 Thu, 03 Oct 2024 00:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6hD=Q7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sw9ps-00049l-Kb
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 00:36:52 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945a4832-811f-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 02:36:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1132D5C5B5B;
 Thu,  3 Oct 2024 00:36:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEBAC4CEC2;
 Thu,  3 Oct 2024 00:36:48 +0000 (UTC)
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
X-Inumbo-ID: 945a4832-811f-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727915809;
	bh=cNl6S0n9xfO+bG2xVlnc3uWFl/hHK/cbU5kEnaMXIho=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=A/OVn+GRMQXbaDomBIDHcdEkqyplp+peNYHCykps7sNCk/9he2K8mflXTfB7dEIUI
	 3JUbFb+1KGEJZvC79h7UXM5odMt/garHkL/qVYgqyKLEXkNz+BQ77ayenWCotbAuDJ
	 3Hl5ahaWOeje+NXwucZI7pPcNNOlJpb3So1CCEVqUS3f8viS0kXHvSrGLAm+fm6gLa
	 w4QY6S3UFA9QvQpPpSikkYCzuIqWKAB3dCv1Koj95FhCiKstCee/AnPItEVV0PexoR
	 J61PT65hhcSpTLMBBD7TEPajBl1XvgthGAQJFiPJRaw/NH7uUydOA9Ld+hySfJNn3k
	 K3bmt95H7yBxg==
Date: Wed, 2 Oct 2024 17:36:47 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule
 13.6
In-Reply-To: <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2410021736050.1138574@ubuntu-linux-20-04-desktop>
References: <cover.1727690180.git.federico.serafini@bugseng.com> <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Federico Serafini wrote:
> guest_handle_ok()'s expansion contains a sizeof() involving its
> first argument which is guest_handle_cast().
> The expansion of the latter, in turn, contains a variable
> initialization.
> 
> Since MISRA considers the initialization (even of a local variable)
> a side effect, the chain of expansions mentioned above violates
> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
> contain any expression which has potential side effect).
> 
> Refactor the code to address the rule violation.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


