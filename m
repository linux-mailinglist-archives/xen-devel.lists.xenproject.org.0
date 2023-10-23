Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B570D7D4290
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 00:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621624.968270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv39r-00076q-T1; Mon, 23 Oct 2023 22:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621624.968270; Mon, 23 Oct 2023 22:12:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv39r-00073t-Pn; Mon, 23 Oct 2023 22:12:23 +0000
Received: by outflank-mailman (input) for mailman id 621624;
 Mon, 23 Oct 2023 22:12:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6cm=GF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qv39q-00073n-68
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 22:12:22 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdabff1-71f1-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 00:12:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C593AB81BF1;
 Mon, 23 Oct 2023 22:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11B1EC433C8;
 Mon, 23 Oct 2023 22:12:17 +0000 (UTC)
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
X-Inumbo-ID: 3bdabff1-71f1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698099139;
	bh=D5mUR/LrusVCD2taPzxmjIaDkSDhxjucLkE7kYUNm/Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qjS7O6FVE9uRRL9pHss32FGgOuSLJGETzpfTNZtRo2CV5OPbIxYJ4F717rX6AbQN/
	 GsH7UR9qVGnLcBrZE6F4Bm+IyvbfKWq6sZEcYZu9uLQmOFXOdK+uFh+KLViT9OaHIN
	 G/n50YJ5R02IPm3yjzF9i2YAFLXd67Wo0tZVP1BsT0EQjTdFrCEo1FqJIXTcPFb0ME
	 8dLQS+GVl5B8DSr2TszdX15X3A4+WTZ2abUIlaqpC0rPFE8strWgKF7DCM8zWPAd+o
	 TJiinp4LZZvGkcIRpYBo9nL28fQbkQkjGDrMyjUG88HoCHDCsTjlY22J+CSPde2IjU
	 p5OhZWIebuc7A==
Date: Mon, 23 Oct 2023 15:12:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Jan Beulich <jbeulich@suse.com>, 
    Simone Ballarin <simone.ballarin@bugseng.com>, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH 3/4] xen/include: add pure and const attributes
In-Reply-To: <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2310231511200.3516@ubuntu-linux-20-04-desktop>
References: <cover.1697638210.git.simone.ballarin@bugseng.com> <fd5421162a00aa782e0776324ff6497193c1e3d3.1697638210.git.simone.ballarin@bugseng.com> <89778285-5cba-8fb5-70bc-710b6dd30a10@suse.com> <0032186f-80c7-4dba-b46e-10d4a8e2a8cb@bugseng.com>
 <e8bf9817-fd54-9bf4-4302-dcee682f9172@suse.com> <alpine.DEB.2.22.394.2310231417260.3516@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

> It doesn't seem to me that __attribute_pure__ could be correctly used on
> pdx_to_pfn with GCC 7.1.0 for example.
> 
> So in conclusion, I think it is better to avoid __attribute_pure__ and
> use SAF-xx-safe or an alternative approach instead.

I was thinking that another option would be to introduce a macro "pure"
that is defined as __attribute_pure__ for GCC 9 or later and defined to
nothing for GCC 8 or older.

