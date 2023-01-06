Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6001660266
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 15:43:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472692.733014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnvs-0006kB-1a; Fri, 06 Jan 2023 14:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472692.733014; Fri, 06 Jan 2023 14:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDnvr-0006hq-Uu; Fri, 06 Jan 2023 14:42:55 +0000
Received: by outflank-mailman (input) for mailman id 472692;
 Fri, 06 Jan 2023 14:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g6IK=5D=citrix.com=prvs=36316be06=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pDnvq-0006hk-7h
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 14:42:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6474b747-8dd0-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 15:42:51 +0100 (CET)
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
X-Inumbo-ID: 6474b747-8dd0-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673016171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dIxp4kB3Fq0R4kfKEpGGR4PCvfMFoXf/LwvzR19LURA=;
  b=Sd9OQZXf6dEblJY7G6FfZwWwp/VbBLeZF1yZLzDuGFEP0cN5SX5pO1Xm
   Arwq1zTrZPQGk1FvB90lgrJ23rlfS6+c66F/321C6U82EvJpAHAs3MTEb
   k7WA2ILrnSGeYtl1LvexmmdC6eEZzlTtGnf8eqoxnxFlv8BN1quDxSlYX
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90966612
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:VJswE6jTu9xi3QxlCHxLmkylX1610BAKZh0ujC45NGQN5FlHY01je
 htvXmCAb66KNmChf41/aYzk8E0G7Zbcn9VqHApvrX89Fykb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6sT5QeAzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQaOmsffgiMo9uo44K3dMN8t58/KvPCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthfA9
 zyYoT2jav0cHMSSxAHfq3utv8beu3nnVdMLF5yz+OE/1TV/wURMUUZLBDNXu8KRh0KjUshTL
 GQU8yAtqrMuskqmUrHVRRyzoHeeslgcVtxcHvch7welzqvS6hyeQG8eQVZpbcc6nNU7STwjy
 hmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kbixvVRdtnVqetgNDxEzjtx
 hiFqSE/g/MYistj/7y2+E2Cjz+yq5zhSAkz6QPKGGW/4WtRbpSuZ5Gj6krz5PFEao2eSzGpp
 2MYksKT6OQPC5CllyGXRugJWraz6J6tKDfbh0xuGZgJ7Tmh+3e/O4tX5VlWPE50Nu4UdDmvZ
 1Xc0T69/7cKYiHsN/UuJdvsVYJ6lsAMCOgJSNjWfIFccoB+UDaZ3xFiW2SA7jvxlnIFxPRX1
 YigTe6gCnMTCKJCxTWwRvsA3bJD+h3S1V8/VrigkU35jOP2iGq9DO5cbQDQNrxRALas+l29z
 jpJCyedJ/yzusXaazKfz4McJEtiwZMTVcGv8Jw/mgJuz2Nb9IAd5x35m+hJl29Nxf49egL0E
 paVBCdlJKLX3yGvFOlzQikLhEnTdZh+t2knGicnIEyl3XMuCa72svhFJsdsIOl2qL0ypRKRc
 xXjU5/QahioYm2ekwnxkLGn9NAyHPhVrVjm09WZjMgXIMc7Gl2hFi7MdQrz7igeZheKWT8Fi
 +T4jGvzGMNTLzmO+e6KMJpDOXvt5ylC8A+zNmOUSuRulLLEqtAycXKp1qVnf6nh63zrn1On6
 upfOj9AzcGlnmP/2IChaXysx2txL9ZDIw==
IronPort-HdrOrdr: A9a23:/alh+6ClgOS3hhjlHemd55DYdb4zR+YMi2TDgXoBLCC9E/bo7P
 xG+c5wuCMc5wxhP03I9erwQZVoIkm8yXcW2/h0AV7KZmCP01dASrsSjrcK7AeQeREWndQts5
 uIHZIOcOEYzmIUsS852mWF+hobruVvOZrJudvj
X-IronPort-AV: E=Sophos;i="5.96,305,1665460800"; 
   d="scan'208";a="90966612"
Date: Fri, 6 Jan 2023 14:42:35 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
	<eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <Y7gzW/hkYc6xPqEC@perard.uk.xensource.com>
References: <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz.ref@aol.com>
 <830263507e8f1a24a94f81909d5102c4b204e938.1672615492.git.brchuckz@aol.com>
 <Y7gqSLo8pMm4gfV+@perard.uk.xensource.com>
 <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c39b9502-0020-ce54-abd8-b362430ba086@aol.com>

On Fri, Jan 06, 2023 at 09:10:55AM -0500, Chuck Zmudzinski wrote:
> Well, our messages almost collided! I just proposed a v7 that adds
> a check to prevent the extra processing for cases when machine is
> not xenfv and the slot does not need to be cleared because it was
> never reserved. The proposed v7 would not change the behavior of the
> patch at all but it would avoid some unnecessary processing. Do you
> want me to submit that v7?

Well, preventing an simple assignment and a message from getting logged
isn't going to get us far. On the other end, the message "using slot 2"
when we don't even if slot 2 is actually going to be used could be
confusing, so I guess preventing that message from been logged could be
useful indeed.

So your proposed v7 would be fine.

Cheers,

-- 
Anthony PERARD

