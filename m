Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8A7520AF5
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 04:04:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325062.547486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFEJ-00072U-5t; Tue, 10 May 2022 02:04:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325062.547486; Tue, 10 May 2022 02:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noFEJ-000704-1M; Tue, 10 May 2022 02:04:03 +0000
Received: by outflank-mailman (input) for mailman id 325062;
 Tue, 10 May 2022 02:04:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9poS=VS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1noFEH-0006zy-QJ
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 02:04:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 748373f8-d005-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 04:04:00 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8DF3561635;
 Tue, 10 May 2022 02:03:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8F2C385C5;
 Tue, 10 May 2022 02:03:57 +0000 (UTC)
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
X-Inumbo-ID: 748373f8-d005-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652148238;
	bh=wv5RBevj0czTyXQWaA+qsNaS23nZylpb7fsKMvVga/0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S5MMBHTA7Refuh8SG8aHtXOVwFgHOgUagvpKdcG4Aip3Uk20FdITZKY086uc8Dv/9
	 pItKXopdJZRSdb1CM2C7lJ1k1LhlHBjibeywYI4Fcdg5TahwjmC6QqmebHrpZZZGmt
	 BHiKZBKiCWccPPzxVYhqNvAbmKQIyDmFnovRisR2MayQGOMTZ/rhXRlIrI+TvcnQhC
	 OgtTcuOmmZXV/EGbhd9n/spP1hNf7i002uHdmF76ZW1w162ligueU2B/blCIi/fHeG
	 lOmovNNy3zo25VE50GqIAvE/HvQxqDsk4tk0440KCBXuifkLfBJ474WkBdHByNfCvn
	 O+yOhGzXU8rxg==
Date: Mon, 9 May 2022 19:03:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Bertrand.Marquis@arm.com
cc: julien@xen.org, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
In-Reply-To: <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205091857230.43560@ubuntu-linux-20-04-desktop>
References: <cover.1651570561.git.bertrand.marquis@arm.com> <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com> <a05b426c-1800-a365-5b02-f82f0a391306@xen.org> <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
 <f1315848-fe9e-b365-bbf6-a596abc6e0de@xen.org> <31F40037-3A43-4F94-8C03-D9F939DAF8C6@arm.com> <139b3f6c-ebb9-6ed2-f173-a7dbd3c94a95@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 4 May 2022, Julien Grall wrote:
> > Do I understand right that it is ok for you if I push one patch mentioning
> > all the commits done in Linux corresponding to the changes (instead of one
> > patch per commit) ?
> 
> For this case yes.

I managed to do a review of the patch by doing a diff of the relevant
portion of Xen cpufeature.c with Linux cpufeature.c (from commit
b2d229d4ddb1), and the relevant portion of Xen sysregs.h with Linux
sysregs.h (diff -E -b -u).

Everything checks out.

In my opinion, this patch should be split in 2 patches: the changes to
cpufeature.c and sysregs.c that come from the Linux sources; and the
updates to cpufeature.h that do not. If you do that you can add my
reviewed-by to the first patch with the changes from Linux.

The list of individual commit IDs would be nice, but thanksfully the two
source files are still "diffable" so in my opinion are not required.

I have a couple of comments on the changes to cpufeature.h (the ones not
from Linux) which I'll reply directly to the patch.

