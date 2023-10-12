Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0527C7A76
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:33:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616200.958036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Ax-0000OS-Bt; Thu, 12 Oct 2023 23:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616200.958036; Thu, 12 Oct 2023 23:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr5Ax-0000MU-8o; Thu, 12 Oct 2023 23:33:07 +0000
Received: by outflank-mailman (input) for mailman id 616200;
 Thu, 12 Oct 2023 23:33:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr5Aw-0007hg-3k
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:33:06 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b16cfdd8-6957-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 01:33:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 45CBBB82784;
 Thu, 12 Oct 2023 23:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D67C433C7;
 Thu, 12 Oct 2023 23:33:02 +0000 (UTC)
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
X-Inumbo-ID: b16cfdd8-6957-11ee-98d4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153584;
	bh=8tLeRjPbSnbls7BW3mAOY5cj43IST0symIQ1vN/EGo4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qaEeB6QD7oB4AZuW38xZ6bPf0rqPlTcgKiM5eS+q3rqcQ/wBY31FEkOtVK3mxzA2C
	 mzy26aAP3A2RhrCEJMVAev8DEDMWBAniZKGNyjog5DrRWMm2xWcZ+3JdGKmoZCQw0Z
	 ouH5X5ndyMlruj/eEq3B4xElqU/WVRpgoN6y6JDE6phaisnGnOHYd2DAPDswAM7tLP
	 EW0n9zGEDp6lCdDaD9XUEc5+l8/ItDNTvHvVvljT4KPCJLPH5CPAqgEPd3zsVgCjCf
	 fv4iFpZ9XaVksSbrroUYJe7Vf8j/oFCRYNs0nNTbPWuERHcLKPutMmFzqaVGlczs7K
	 0mhOtrxifOorQ==
Date: Thu, 12 Oct 2023 16:33:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v2 3/8] xen/pdx: amend definition of
 PDX_GROUP_COUNT
In-Reply-To: <62f8b9c36ad78352fc796878fd9759307ec3e380.1697123806.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121632280.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <62f8b9c36ad78352fc796878fd9759307ec3e380.1697123806.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> The definition of PDX_GROUP_COUNT causes violations of
> MISRA C:2012 Rule 10.1, therefore the problematic part now uses
> the LOWEST_BIT macro, which encapsulates the pattern.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

