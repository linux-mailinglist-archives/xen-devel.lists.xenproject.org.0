Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D3D787B28
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 00:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590351.922620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZISF-0001Ke-Vm; Thu, 24 Aug 2023 22:05:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590351.922620; Thu, 24 Aug 2023 22:05:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZISF-0001Hq-Sk; Thu, 24 Aug 2023 22:05:27 +0000
Received: by outflank-mailman (input) for mailman id 590351;
 Thu, 24 Aug 2023 22:05:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zFvq=EJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qZISE-0001Du-2C
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 22:05:26 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53702e63-42ca-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 00:05:25 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46B2065737;
 Thu, 24 Aug 2023 22:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 984DCC433C7;
 Thu, 24 Aug 2023 22:05:22 +0000 (UTC)
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
X-Inumbo-ID: 53702e63-42ca-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692914723;
	bh=zK+jn+lexDwur2F1pVT4eZD+uKP0AttIQ+xAGTSkJCc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PoeBULJG1R99D4+7SgklWzn16HyQwz++bE75FqWoaQoTRRxHVu+rAfhcTsQKi5j+m
	 IQIKcnT9xlvmiXYL4HL0PJ2x70HdhqYNAXl5icNSVyDj/XlY38P82LkZ7gaEcba6EU
	 LIrM8RwEFRKoqI86HZkyN+STCck/rbHLsoROp84zcYYgelbu+c3nGiW4cN28/H+Rd/
	 hOgZddliMj8PWT6qDnMy8YL5BZWBzSuaN9iRbst2I6n9Ys7aG3ZTWmYrIZQq/DueD/
	 LYgzDeHjet38KXAUqbiclktAMGyPLLoT30ppTcMXPLkqpQu4cKnNpmTGWpe7feIJmD
	 Mn3ypFuQEnx1A==
Date: Thu, 24 Aug 2023 15:05:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: roger.pau@citrix.com
cc: Simone Ballarin <simone.ballarin@bugseng.com>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Gianluca Luparini <gianluca.luparini@bugseng.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Jan Beulich <jbeulich@suse.com>, nicola.vetrini@bugseng.com
Subject: Need Ack, Re: [XEN PATCH v4 2/4] xen/vpci: address violations of
 MISRA C:2012 Rule 7.2
In-Reply-To: <1b4e6569c0c8d17c73341e43ed46c232@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308241505000.6458@ubuntu-linux-20-04-desktop>
References: <cover.1690368810.git.simone.ballarin@bugseng.com> <2cb770d946c4bf858a41271fd7b9985f789ca149.1690368810.git.simone.ballarin@bugseng.com> <1b4e6569c0c8d17c73341e43ed46c232@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please ack

On Thu, 24 Aug 2023, Nicola Vetrini wrote:
> On 26/07/2023 13:03, Simone Ballarin wrote:
> > From: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > 
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> > headline states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants
> > that are represented in an unsigned type".
> > 
> > Add the 'U' suffix to integers literals with unsigned type and also to other
> > literals used in the same contexts or near violations, when their positive
> > nature is immediately clear. The latter changes are done for the sake of
> > uniformity.
> > 
> > Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> > Changes in v4:
> > - change commit headline
> > 
> > Changes in v3:
> > - change 'Signed-off-by' ordering
> > - add 'uint32_t' casts in 'msi.c' and 'msix.c'
> > 
> > Changes in v2:
> > - minor change to commit title
> > - change commit message
> > ---
> >  xen/drivers/vpci/msi.c  | 2 +-
> >  xen/drivers/vpci/msix.c | 2 +-
> >  xen/drivers/vpci/vpci.c | 6 +++---
> >  3 files changed, 5 insertions(+), 5 deletions(-)
> > 
> 
> Like other patches in this series, this one could also benefit from an ack
> from
> VPCI maintainers to get committed, as it does apply cleanly on staging.
> 
> -- 
> Nicola Vetrini, BSc
> Software Engineer, BUGSENG srl (https://bugseng.com)
> 

