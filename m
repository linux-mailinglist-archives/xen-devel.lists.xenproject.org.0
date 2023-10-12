Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196107C7A72
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 01:32:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616196.958026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr59v-0008Gz-2U; Thu, 12 Oct 2023 23:32:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616196.958026; Thu, 12 Oct 2023 23:32:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr59u-0008Df-VQ; Thu, 12 Oct 2023 23:32:02 +0000
Received: by outflank-mailman (input) for mailman id 616196;
 Thu, 12 Oct 2023 23:32:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A/p7=F2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qr59t-0008DQ-J9
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 23:32:01 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8991eda7-6957-11ee-9b0e-b553b5be7939;
 Fri, 13 Oct 2023 01:31:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1AC0961F99;
 Thu, 12 Oct 2023 23:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42627C433C7;
 Thu, 12 Oct 2023 23:31:56 +0000 (UTC)
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
X-Inumbo-ID: 8991eda7-6957-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697153517;
	bh=s3laAgeAxWcD73aF1bYob0SW7Fd3zueGdFx2ymVKNPo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Dl+3pZAuYGuqpWFe6cHrx6PFg9eQP+KtB8lUhMovScLc6z9OhSa2WdYJDUeGUBhqa
	 Oo9263KTDRCHnRC8gSOat4bvbtgAMVSP/ZJ282KaqqLA2lx7GcreRW9hZ1U4SroQzS
	 HvIegKFCe+AF3oK9MRRjVTW5p4lTuoWE1LhTS5Qr0C7eBdNimLkh/3Q9GGFAKGhbo4
	 wI3d4YNi7vk18RmLjyPIhK+bc/BTuyzuyr73OqNjyVpA6BqOjbwmBHgHx138JZLZXH
	 No9GsGrgcNpby+sOp05E18H6ylFeN242pexbct/5sy6F4bjHUJzvEHiqpSUmw+lKhx
	 77M+zrPCEAvsw==
Date: Thu, 12 Oct 2023 16:31:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH][for-4.19 v2 2/8] arm/bitops: encapsulate violation
 of MISRA C:2012 Rule 10.1
In-Reply-To: <042f79da9c4480955c5fb82a25e4847c4777fbea.1697123806.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310121631300.3431292@ubuntu-linux-20-04-desktop>
References: <cover.1697123806.git.nicola.vetrini@bugseng.com> <042f79da9c4480955c5fb82a25e4847c4777fbea.1697123806.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 12 Oct 2023, Nicola Vetrini wrote:
> The definitions of ffs{l}? violate Rule 10.1, by using the well-known
> pattern (x & -x); its usage is wrapped by the LOWEST_BIT macro.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

