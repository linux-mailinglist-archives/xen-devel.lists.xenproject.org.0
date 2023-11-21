Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5D97F2270
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637423.993204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ErA-0005vM-GM; Tue, 21 Nov 2023 00:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637423.993204; Tue, 21 Nov 2023 00:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5ErA-0005tD-Dr; Tue, 21 Nov 2023 00:43:12 +0000
Received: by outflank-mailman (input) for mailman id 637423;
 Tue, 21 Nov 2023 00:43:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5Er9-0005t0-4t
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:43:11 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efc9b5da-8806-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 01:43:08 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 96503CE0E12;
 Tue, 21 Nov 2023 00:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F8FBC433C7;
 Tue, 21 Nov 2023 00:43:02 +0000 (UTC)
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
X-Inumbo-ID: efc9b5da-8806-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700527383;
	bh=h4wtSY+80rcDfKzGVHrpO3CoG+FKAQSJAok3LoCTJkc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z4xOF/Wt3YUad/wnE/TMu3zeLTBaSoPTndJVdH62E9tc30Ob++F4OZ8ohj8aHLNMT
	 LHfpOxfrzCQXpwHCZNMyTeeQgbNA8D/qokLf7wKcRPg4U3ljVAm2b/bjmrSECH3mUA
	 tVepyW+c1XxiDkEWpHndHXC4YieGaD3z6+ey7YQe3ND4J4hoyQsciatxpjGr8EJYlJ
	 uQG+zF0G9QP15DJ/d2dZnAsvw2+yOhfwN6YYNQuBudctnkIjbsf0VKcb6OEaIsRKWr
	 Ey9CeyG+O5YTudy3kEzJZpfm8FQqSeg5rVOt4/LH75PzmGPhOqPWfVyqCiRhsp5VBi
	 lQAf7gc8vRRxg==
Date: Mon, 20 Nov 2023 16:43:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Roberto Bagnara <roberto.bagnara@bugseng.com>, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [PATCH 2/6] x86/setup: Rework cmdline_cook() to be compatible
 with -Wwrite-strings
In-Reply-To: <20231120224912.1421916-3-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2311201642110.773207@ubuntu-linux-20-04-desktop>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com> <20231120224912.1421916-3-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 20 Nov 2023, Andrew Cooper wrote:
> Constify both cmdline variables in create_dom0() and __start_xen().
> Initialise Xen's variable to the empty string to simplify the parsing logic.
> 
> Update cmdline_cook() to take and return const pointers, changing it to have
> an early exit for a NULL input (which can happen if the mbi-> pointers happen
> to be 0).
> 
> Note this only compiles because strstr() launders the const off the pointer
> when assigning to the mutable kextra, but that logic only mutates the
> mbi->cmdline buffer.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


