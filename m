Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C48A53E5E
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 00:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902902.1310836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy6i-0002C6-Lz; Wed, 05 Mar 2025 23:24:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902902.1310836; Wed, 05 Mar 2025 23:24:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpy6i-00029Y-JO; Wed, 05 Mar 2025 23:24:56 +0000
Received: by outflank-mailman (input) for mailman id 902902;
 Wed, 05 Mar 2025 23:24:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gbs/=VY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tpy6h-00029S-51
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 23:24:55 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a1f102e-fa19-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 00:24:53 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE45A5C5CFD;
 Wed,  5 Mar 2025 23:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE75DC4CED1;
 Wed,  5 Mar 2025 23:24:49 +0000 (UTC)
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
X-Inumbo-ID: 0a1f102e-fa19-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741217091;
	bh=AfoBJIJvSRb66qcE9pwoKMc0rO50hQrTSC3TKzBnG04=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=GwXfuP105r2lNgUW5pVXRp7FBu9Q+uo6Lz0c24SaK70BYpkB51EVd8LWA/tUupymr
	 Z3wq2w+0lSxZsB0bvE7WeKFPnFEYURE/neo24jwuJKwV8Mxdgfh5ocwN1TWoUrcD4H
	 jY8DGu3HYbX9biHLZlYDCqQHHCBAY0I2hkHTrS+wUVZ9xCellMGNnTPqcasS8ErARz
	 sg19Vq4CjH1cnRyiX1/qTraxKAHdJ/ePkGdNqC6+C2ERG7koTsbU8XnmVHdzDV6aWd
	 jLjZAia+hBdaHVDqPDdlt00xOsw8a2h7S5c2JYMrjaib0alh4+gQ1i9BeNZdgMbxLO
	 HU7P8+r9LEtuA==
Date: Wed, 5 Mar 2025 15:24:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com, 
    ayan.kumar.halder@amd.com, consulting@bugseng.com, 
    Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
    xen-devel@lists.xenproject.org, 
    Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: Re: [XEN PATCH v2 2/3] xen/rt: address violation of MISRA C Rule
 8.2
In-Reply-To: <fc6c0113-484d-4eb5-8b66-0ef547d8dbf1@suse.com>
Message-ID: <alpine.DEB.2.22.394.2503051524030.1303386@ubuntu-linux-20-04-desktop>
References: <cover.1740476096.git.nicola.vetrini@bugseng.com> <e3c6457e50d61daa05fd9c3a7c71b06d912216a0.1740476096.git.nicola.vetrini@bugseng.com> <fc6c0113-484d-4eb5-8b66-0ef547d8dbf1@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 5 Mar 2025, Jan Beulich wrote:
> On 25.02.2025 10:38, Nicola Vetrini wrote:
> > Rule 8.2 states: "Function types shall be in prototype form with
> > named parameters".
> > 
> > The parameter name is missing from the function pointer type
> > that constitutes the first parameter.
> > 
> > No functional change.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> > ---
> > Changes in v2:
> > - renamed function parameter name to "elem"
> > - changed prefix to xen/rt since only that scheduler is touched
> 
> Looks like you committed v1 of this, and without a maintainer ack?

Hi Jan, I took Juergen's comment and his maintainer ack, making the
change on commit: https://marc.info/?l=xen-devel&m=173978187314898

