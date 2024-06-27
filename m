Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA8919C03
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 02:45:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749590.1157796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdGh-0004Uf-9X; Thu, 27 Jun 2024 00:45:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749590.1157796; Thu, 27 Jun 2024 00:45:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMdGh-0004Ru-6L; Thu, 27 Jun 2024 00:45:43 +0000
Received: by outflank-mailman (input) for mailman id 749590;
 Thu, 27 Jun 2024 00:45:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iDhR=N5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sMdGf-0004Ro-Hd
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 00:45:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 933d76a4-341e-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 02:45:40 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4406D61377;
 Thu, 27 Jun 2024 00:45:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 724CAC116B1;
 Thu, 27 Jun 2024 00:45:37 +0000 (UTC)
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
X-Inumbo-ID: 933d76a4-341e-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719449138;
	bh=e/QvjhmnEPwLI7rcX+TLCgDW91WV6cZEpSXCHcRQKzg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qAFWupIaVX3CtLJD86GygL8dtHyIc2EApnobNOL5ucHnmZ+jxAommUDeHQeuS9mEK
	 XpqQJMvTYyOjreOHP6VwMNAnhzuIuoRCX7izEJh8/DPVPXwERLQAt2jgLaqM8aYTTf
	 jJPXSvNrbmji5kCWlcd2gy5ujpL3yJG6btYxYRmHlCL0KgyPpTM3z+MRf8raIL5Bf7
	 FX7kJWzvStc85kSmAeRE03xppuaTW3Qx8+JsSYN+KyYWMgNQgLtxEQNkof2EbYCS2m
	 QC//SthUyLkaYk8b5dnczzHwmUBAPbuiD4/5CdGuhWf0vytSEQgg41qBbADdzRSQnT
	 rXblbKvSRC52g==
Date: Wed, 26 Jun 2024 17:45:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v2 for-4.20 1/7] automation/eclair: address violations
 of MISRA C Rule 20.7
In-Reply-To: <679b1948690fecf06c9e81b398f7bf9bf5a292d2.1719407840.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406261745050.3635@ubuntu-linux-20-04-desktop>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com> <679b1948690fecf06c9e81b398f7bf9bf5a292d2.1719407840.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses".
> 
> The helper macro bitmap_switch has parameters that cannot be parenthesized
> in order to comply with the rule, as that would break its functionality.
> Moreover, the risk of misuse due developer confusion is deemed not
> substantial enough to warrant a more involved refactor, thus the macro
> is deviated for this rule.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

