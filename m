Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4FC919C05
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:46:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749594.1157806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdHH-0004xF-Hc; Thu, 27 Jun 2024 00:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749594.1157806; Thu, 27 Jun 2024 00:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdHH-0004vl-Do; Thu, 27 Jun 2024 00:46:19 +0000
Received: by outflank-mailman (input) for mailman id 749594;
 Thu, 27 Jun 2024 00:46:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdHG-0004vX-2O
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:46:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a875d08a-341e-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 02:46:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D560661D5B;
 Thu, 27 Jun 2024 00:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB2CC2BD10;
 Thu, 27 Jun 2024 00:46:13 +0000 (UTC)
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
X-Inumbo-ID: a875d08a-341e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449174;
	bh=7HlikCI+ZFOT2NKtW5gvTNSBMEdmvmxEXMJHZWdMq6c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rUxMNnShaMiK0JjsCj5wtRDzAbKvw74ckbDFmMvoEUWpwfFv2A9YnzI2ABPXqfgbm
	 De85En5dEJq67JKodcXqDb1ZylRZAI6Uz37J8F+lfV2MrVVUAZNFV6UZM0O8r+LeIY
	 PtznXqfkeery9krNMb8iBIt32CqnFk1kFmTGHip8FVTBfSAiwWcLnXM38N0SnDDIE0
	 vDSyRf5Yts7BE8297o6e7O+WQLtg8PD4X6XgBwBFVURy7gXC4M2/4Fu9ZY3nVXclO7
	 Yo/o7sWJOwCYY6f36PPlCXtM7QGYWmgLGMh144O0q8HmDGNXJD8zdfse1gfL0Sv7A+
	 ZLiEKILY9X0jA==
Date: Wed, 26 Jun 2024 17:46:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [XEN PATCH v2 for-4.20 7/7] x86/traps: address violations of
 MISRA C Rule 20.7
In-Reply-To: <7830b9bfbb0aec272376817eb20bbcbfebdf4044.1719407840.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261746040.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com> <7830b9bfbb0aec272376817eb20bbcbfebdf4044.1719407840.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

