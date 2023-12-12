Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39ED80FA89
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 23:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653621.1020038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBXt-0006p7-6r; Tue, 12 Dec 2023 22:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653621.1020038; Tue, 12 Dec 2023 22:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDBXt-0006mR-4C; Tue, 12 Dec 2023 22:48:09 +0000
Received: by outflank-mailman (input) for mailman id 653621;
 Tue, 12 Dec 2023 22:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1Zv=HX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rDBXr-0006mJ-BT
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 22:48:07 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 829a6b3d-9940-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 23:48:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0B8DCE1C61;
 Tue, 12 Dec 2023 22:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D70FEC433C7;
 Tue, 12 Dec 2023 22:47:59 +0000 (UTC)
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
X-Inumbo-ID: 829a6b3d-9940-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702421280;
	bh=FWunfJukoEf8uv3S6Blf40SDiYHQAMZe9Gql3B5kJ9g=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ShLSWiLIvT4eSfzvXltGMrcDw6iA3r6SP1QZQHKz4G3spFFMImdNYxzZcuVS44t7k
	 GQK4U9mTwxlbaDpIClg5/ZzonLKEEPBlt0FjusyHsmrghVF5DUC01KPHXgn/IiS+2j
	 1+GtD1+Q9xjJBDA761aF8+h7C3ZbRjOEtCTLImKfIqNay7mmSCEleGmn9wBEChVG/9
	 RnYn5SFD5/OLpXqTTiGtHJeNIv+81F3VfTiRGungJJ+RhqfqnCoaZkN4WSUINmnQrO
	 9w4GzwM3HDNeGhUk0n2EbYlt68b0cQu6rUpdPR8T04uwiigMkmSEAq2oLgs4hRNbi5
	 aufUofpKCtmgw==
Date: Tue, 12 Dec 2023 14:47:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/4] xen/compat: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <6a3bd7a3e4fa83c2c176894f756bd2e24c0f3ee0.1702394721.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2312121447520.1703076@ubuntu-linux-20-04-desktop>
References: <cover.1702394721.git.federico.serafini@bugseng.com> <6a3bd7a3e4fa83c2c176894f756bd2e24c0f3ee0.1702394721.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Dec 2023, Federico Serafini wrote:
> Add missing parameter names. No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


