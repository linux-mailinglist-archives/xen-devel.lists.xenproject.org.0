Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688A78B428A
	for <lists+xen-devel@lfdr.de>; Sat, 27 Apr 2024 01:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713158.1114200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Uk7-0004H5-1W; Fri, 26 Apr 2024 23:12:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713158.1114200; Fri, 26 Apr 2024 23:12:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Uk6-0004En-UI; Fri, 26 Apr 2024 23:12:34 +0000
Received: by outflank-mailman (input) for mailman id 713158;
 Fri, 26 Apr 2024 23:12:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/tzl=L7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s0Uk5-0004E5-Ms
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 23:12:33 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7502f17f-0422-11ef-b4bb-af5377834399;
 Sat, 27 Apr 2024 01:12:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B072A6216B;
 Fri, 26 Apr 2024 23:12:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84180C113CD;
 Fri, 26 Apr 2024 23:12:29 +0000 (UTC)
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
X-Inumbo-ID: 7502f17f-0422-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714173150;
	bh=WPoxjXTm0nfG6y73XtmRrBNoyKTUy2MuSWx4JRGPKPQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=a34swMpt30GoshRNA77+wOZaAIibbOUAT6ZGh+UzefyF/mf0R+oJPVlSnNQAH2/0s
	 ivyoxWFyI1jJCWMsubB1QKL48MWBXlAX3/N1j+5QMSUdYh8beE92tNsEqZ1r86w/pW
	 XIlnFbxj+8SWhkm3eNzuRGsXf+GS2xdmRhgFW439Pc6ZBRokaY6cQiPLUUdvS5XNxi
	 mcCL3iU9NcUyqa3riDDCd7NJPvsEPKSXQASwRMcaJkAc24G87qJoYXu07rzw3w43De
	 qofJgUkao4/0ngVIXn3sw6IXI3pBEv2tx4+gjiIe2L1w6ZolFDALNnwUfSxvfWMkdD
	 pVKYQthV81Dag==
Date: Fri, 26 Apr 2024 16:12:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH v1 5/7] x86/MCE: guard {intel/amd}_mcheck_init()
 calls
In-Reply-To: <0c7d28740db4d6581ebc81a158c970258e547959.1713860310.git.Sergiy_Kibrik@epam.com>
Message-ID: <alpine.DEB.2.22.394.2404261612210.3940@ubuntu-linux-20-04-desktop>
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com> <0c7d28740db4d6581ebc81a158c970258e547959.1713860310.git.Sergiy_Kibrik@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 23 Apr 2024, Sergiy Kibrik wrote:
> Guard calls to CPU-specific mcheck init routines in common MCE code
> using new INTEL/AMD config options.
> 
> The purpose is not to build platform-specific mcheck code and calls to it,
> if this platform is disabled in config.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


