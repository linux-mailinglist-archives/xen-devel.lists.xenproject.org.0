Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E9B40EEF
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 22:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1107544.1457939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utY4m-00056x-FP; Tue, 02 Sep 2025 20:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1107544.1457939; Tue, 02 Sep 2025 20:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utY4m-00054O-CF; Tue, 02 Sep 2025 20:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1107544;
 Tue, 02 Sep 2025 20:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ozfM=3N=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1utY4k-00054I-Il
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 20:57:58 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c022e34-883f-11f0-8adc-4578a1afcccb;
 Tue, 02 Sep 2025 22:57:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC86940761;
 Tue,  2 Sep 2025 20:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E897CC4CEED;
 Tue,  2 Sep 2025 20:57:46 +0000 (UTC)
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
X-Inumbo-ID: 7c022e34-883f-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756846668;
	bh=aHW+swPHNscAMC3hJlwenPCQ7EMvQvlQTYIIah4L/Rs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=IGQlEZcPdyGEYroU/EHdWHfO3SAaVgPwQLfamPa9iJ+taaRRNPo4w2jnwD/nMTrhD
	 F363js9FyDkd3CVVe0DNGkpd3dt03sNJshR53Nm8ab3JNuJ8HRRINgHlRKehgHZNuU
	 UlGnt2FyqEX5lHYiVS28CbGpFXJL+hunQUXdmPBK5TAJqi64qRVZnBaDppAEXsaJID
	 j6BkoC+IChdfHPDcR8crl0f0SLEHBu0I8lRclp2wwviRFBUecLlgnu0AEVWACWcbz0
	 G9yBaAt328Mj+htUgA48CnI2BOKNJrPDfXkfMuL0Kp/rbLr4ZTMfrxMuuOTqkLDLwq
	 4XcLhbtWvcuSQ==
Date: Tue, 2 Sep 2025 13:57:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [PATCH v7 0/4] xen/arm: scmi: introduce SCI SCMI SMC single-agent
 support
In-Reply-To: <cover.1756734682.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2509021357220.1405870@ubuntu-linux-20-04-desktop>
References: <cover.1756734682.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

I was going to commit this series but this patch breaks compilation on
x86:

https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/11223159836


