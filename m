Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDCAB5265E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 04:18:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119088.1464606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWtM-0000hZ-VL; Thu, 11 Sep 2025 02:18:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119088.1464606; Thu, 11 Sep 2025 02:18:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwWtM-0000eh-Ry; Thu, 11 Sep 2025 02:18:32 +0000
Received: by outflank-mailman (input) for mailman id 1119088;
 Thu, 11 Sep 2025 02:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5SW2=3W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uwWtL-0000eb-A6
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 02:18:31 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a3a23da-8eb5-11f0-9d13-b5c5bf9af7f9;
 Thu, 11 Sep 2025 04:18:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B64FF6013D;
 Thu, 11 Sep 2025 02:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCACC4CEEB;
 Thu, 11 Sep 2025 02:18:23 +0000 (UTC)
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
X-Inumbo-ID: 9a3a23da-8eb5-11f0-9d13-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757557106;
	bh=DhOeGsdl69RyahR+iYjVB2KU6W40Xqzqd3W+B4l5g6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JpU+N5ObB+dsfRDN5oaVdQqcGpQQwYPtP48I2kWEUYNgiT9oetRALkadLOwi3AeBf
	 Ay8rilsuI8zUWdradaviwVedTGQCXxHPV4aXiJZaKZA4+494/5gCnCl5PWW63mNWTQ
	 FN33jlyes7mIys1omugcuF84gEDL56mlyXVB/2sAfr6Gbq103Ialrkzejuvy/D4fxE
	 QMo2Nyd96JKab2RVaZ2KSkH4pxHyWB4FF8lGBGtJ5O7VPfrqm7REPkk1baATwVuzSy
	 wsuJRhiYZZxysw7IkargbVXTW+qXTocqTyvgpoYN6Y6nn06NuzWucOGAwJWlGRC9Zh
	 LiwLcC2VgbqoA==
Date: Wed, 10 Sep 2025 19:18:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Stefano Stabellini <sstabellini@kernel.org>
cc: Penny Zheng <Penny.Zheng@amd.com>, xen-devel@lists.xenproject.org, 
    xen-devel@dornerworks.com, ray.huang@amd.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
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
In-Reply-To: <alpine.DEB.2.22.394.2509101834510.52703@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2509101917000.52703@ubuntu-linux-20-04-desktop>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com> <20250910073827.3622177-3-Penny.Zheng@amd.com> <alpine.DEB.2.22.394.2509101834510.52703@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Sep 2025, Stefano Stabellini wrote:
> On Wed, 10 Sep 2025, Penny Zheng wrote:
> > Rename all the CONFIG_SYSCTL into a single CONFIG_MGMT_HYPERCALLS to help
> > provide a single option to manage all unnecessary hypercalls, including
> > sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
> > make it easier to support randconfigs.
> > 
> > Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> > Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

With one comment:

> -config SYSCTL
> -	bool "Enable sysctl hypercall"
> +config MGMT_HYPERCALLS
> +	bool "Enable hypercalls under management"

Please call it "Enable privileged hypercalls for system management"

