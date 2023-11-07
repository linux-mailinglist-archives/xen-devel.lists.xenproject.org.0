Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C80B7E347C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 05:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628556.980159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYO-0007Im-NG; Tue, 07 Nov 2023 04:19:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628556.980159; Tue, 07 Nov 2023 04:19:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0DYO-0007FI-JE; Tue, 07 Nov 2023 04:19:04 +0000
Received: by outflank-mailman (input) for mailman id 628556;
 Tue, 07 Nov 2023 04:19:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FGpL=GU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r0DYN-0006dK-Hn
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 04:19:03 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6bd8da0-7d24-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 05:19:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B72F3CE0E99;
 Tue,  7 Nov 2023 04:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E3BBC433C8;
 Tue,  7 Nov 2023 04:18:54 +0000 (UTC)
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
X-Inumbo-ID: c6bd8da0-7d24-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699330736;
	bh=Jc1lBlbqvnbhNgyJEvI4G7Y3CNDrZLJUdrYb0k50Qrg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lWn5AeCwtuNJ4JQgdvd2z/I2v+hRkx6kvf9jj9cfzQKrA88X79oh8CcNiyqAEA7pH
	 20wxOyqNy0ylbpQtphagGoPjrn1rDWsbdvU+mAiH+qmMvfCSlMYSbz75UVdI469cCX
	 XvbS7qZ1L2pXHh+Sb/PsGaUafmgq3N8SV2NxfYi7ziCCUEtyDsQEhZseEQD1HFPnkI
	 YDhppBhjpLlyLk1FMLg3yG/kgiuHK/TMk6rpK5BExk0aRvzVaMaqpJSc+DV+oIn9+3
	 HKz3n1Mr6b4gwele3hTTHEoJexmJUI4Mr1SsN/8g+7+Mt06f+qooXSU60/tpS8H23M
	 CHXEXjVpPKjkQ==
Date: Mon, 6 Nov 2023 20:18:52 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
In-Reply-To: <3e58166f7dcfb3fd3bd15614096b27ce@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311061648330.3478774@ubuntu-linux-20-04-desktop>
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com> <3e58166f7dcfb3fd3bd15614096b27ce@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 3 Nov 2023, Nicola Vetrini wrote:
> On 2023-11-03 18:58, Nicola Vetrini wrote:
> > Static analysis tools may detect a possible null
> > pointer dereference at line 760 (the memcpy call)
> > of xen/common/domain.c. This ASSERT helps them in
> > detecting that such a condition is not possible
> > and also provides a basic sanity check.
> > 
> Suggested-by: Julien Grall <julien@xen.org>
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

