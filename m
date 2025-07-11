Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5390B026B8
	for <lists+xen-devel@lfdr.de>; Sat, 12 Jul 2025 00:01:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1041529.1412287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaLnG-0007Tm-2I; Fri, 11 Jul 2025 22:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1041529.1412287; Fri, 11 Jul 2025 22:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uaLnF-0007Rf-VP; Fri, 11 Jul 2025 22:00:33 +0000
Received: by outflank-mailman (input) for mailman id 1041529;
 Fri, 11 Jul 2025 22:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LlY=ZY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uaLnE-0007RU-CQ
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 22:00:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74f50465-5ea2-11f0-b894-0df219b8e170;
 Sat, 12 Jul 2025 00:00:29 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5031C5C4BE9;
 Fri, 11 Jul 2025 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831A5C4CEED;
 Fri, 11 Jul 2025 22:00:26 +0000 (UTC)
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
X-Inumbo-ID: 74f50465-5ea2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752271228;
	bh=AkfqURXFyx62bOJMD1hKzTglIxjL8ONeX3FcM8qIaug=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Bu4Dpl7tJBPdD8ObFiw5IZSS7qVIe6JkgLAA3D6WrATxJOQTttNUkLRrQqf9iwkbz
	 x+SYNnHuhKt2LIC2Yhl69pyObCyoQeaygpRi40rFufD6kKrjFh43MQFkHnOJ2sdXLK
	 pBsEGWDr8qCT2+VZ9D5On7LlbwgdNU7omNZF58q1skAxHkqBC/ZatkOCvVauDinKDJ
	 EnPaKzMr6ThqLlYNFwvXunaHxDsIP954GIYnmIpH5eORPqif5DrNuxAse/6885BD6R
	 hleiFIDs6jUT/F+3rby4UMtY7A/rK3LTqzIRvZI97EVJgAkA67DbEg6/NBhKbz+Uyy
	 03AhoRAsHwoqQ==
Date: Fri, 11 Jul 2025 15:00:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: jbeulich@suse.com
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Rahul Singh <rahul.singh@arm.com>, dmytro_prokopchuk1@epam.com
Subject: Re: [XEN PATCH v2] misra: address violation of MISRA C Rule 10.1
In-Reply-To: <03612a12-e905-4487-a05b-a5307e450308@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507111457430.605088@ubuntu-linux-20-04-desktop>
References: <41538b6b19811eb74c183051d3e7a4fd216404e6.1752232902.git.dmytro_prokopchuk1@epam.com> <03612a12-e905-4487-a05b-a5307e450308@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Jul 2025, Dmytro Prokopchuk1 wrote:
> Hi All.
> 
> In this 2nd version I made changes according to the
> https://patchew.org/Xen/d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro._5Fprokopchuk1@epam.com/
> 
> There are 0 violations on the ARM64 as you can see in the report:
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/fix_10.1_rule/ARM64/10650097988/PROJECT.ecd;/by_service.html#service&kind
> 
> Jan mentioned:
> "As to the kind of change here - didn't we deviate applying unary minus
> to unsigned types?"
> 
> Here is that deviation:
> https://patchew.org/Xen/7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com/
> As you can see from report
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/10648749555/PROJECT.ecd;/by_service.html#service&kind
> there are still 2 violations.
> And they can be easily fixed.
> 
> So, Jan and Stefano,
> which approach should we select?

I think we should go with the global deviation.

Jan, if you look at the code changes on this series, many of them are
undesirable. And the series is only addressing the ARM violations: it is
only going to get worse for x86.

I think we should commit:
https://patchew.org/Xen/7c7b7a09e9d5ac1cc6f93fecacd8065fb6f25324.1745427770.git.victorm.lira@amd.com/

Jan, are you OK with it?

