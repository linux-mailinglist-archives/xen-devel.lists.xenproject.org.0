Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E879B525C7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 03:36:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119024.1464576 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWDQ-0002Fq-Ii; Thu, 11 Sep 2025 01:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119024.1464576; Thu, 11 Sep 2025 01:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWDQ-0002DD-FB; Thu, 11 Sep 2025 01:35:12 +0000
Received: by outflank-mailman (input) for mailman id 1119024;
 Thu, 11 Sep 2025 01:35:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwWDO-0002D7-Vw
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 01:35:11 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c4ff036-8eaf-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 03:35:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8243944536;
 Thu, 11 Sep 2025 01:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2B1C4CEEB;
 Thu, 11 Sep 2025 01:35:03 +0000 (UTC)
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
X-Inumbo-ID: 8c4ff036-8eaf-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757554506;
	bh=VI73ZDavTs0yzta9dYUCfAHn/Ey37VuffTIjoiibROs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NfqBkS36A0t1GKGmz+OXXpC8J7muPx8TDjiEas5hNYsvuwuvaEyoM5MtSIn2RDd/F
	 zL0L0q5SlYM1EKulOGrVOMwitn4e/b8nO+Rq/Np48YUPispAuAmujmuy2ABrqgvnYQ
	 5HxowHlHKcbHrWhD74TXsUi0ylruU+jGA7rGSpgTVSPDWacUraQdGdFYZPSkCqt5OT
	 i4xPdlphUL7AQONHW6kynG+ikPwvIQgnd5SG1GiEL4iPUp03oF+bT+JSPVzsjERAFe
	 h9Bi98GTctXQrJZBTpGODUIPA+gJ3teRI56/vTYVghIiIHyZ7xchbTKJ5ewlMlIEBm
	 foG1qdX2u4PPw==
Date: Wed, 10 Sep 2025 18:34:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@amd.com>
cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com, 
    ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Alistair Francis <alistair.francis@wdc.com>, 
    Bob Eshleman <bobbyeshleman@gmail.com>, 
    Connor Davis <connojdavis@gmail.com>, 
    Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
    Nathan Studer <nathan.studer@dornerworks.com>, 
    Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, 
    Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2 02/26] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_DOMCTL
In-Reply-To: <20250910073827.3622177-3-Penny.Zheng@amd.com>
Message-ID: <alpine.DEB.2.22.394.2509101834510.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-3-Penny.Zheng@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Penny Zheng wrote:
> Rename all the CONFIG_SYSCTL into a single CONFIG_MGMT_HYPERCALLS to help
> provide a single option to manage all unnecessary hypercalls, including
> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
> make it easier to support randconfigs.
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

