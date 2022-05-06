Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB7351DE67
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 19:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323384.544999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn1uV-0007ao-Vp; Fri, 06 May 2022 17:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323384.544999; Fri, 06 May 2022 17:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn1uV-0007YK-Sn; Fri, 06 May 2022 17:38:35 +0000
Received: by outflank-mailman (input) for mailman id 323384;
 Fri, 06 May 2022 17:38:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uW0u=VO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn1uU-0007YE-Cf
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 17:38:34 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5922bb68-cd63-11ec-a406-831a346695d4;
 Fri, 06 May 2022 19:38:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D10D0B837AA;
 Fri,  6 May 2022 17:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7033C385A8;
 Fri,  6 May 2022 17:38:29 +0000 (UTC)
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
X-Inumbo-ID: 5922bb68-cd63-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651858710;
	bh=PdofVy+N2MvzwjYD9Y32SXkQB0aeH6rkr1uWhj5O6Pw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J6meZLCrtgOz9ikIG2RdqJTIJUCk7OrzRf0RvRFQ0UAVUjNN19rs0JiDlEWTbSPIJ
	 MZc2KuHGvNn8KUJBkwp7l0E+HQ7IpE3l0CVseI4smQ9R3Eu8OhwjUV8OIiDDydqlRn
	 9+pzD34BiEY4AoUqLQeNbGLTxU7tBoVtQJUCaUluW1lkfkU4EC7D2SqO3f8vK0hYYK
	 dP8qbGaSzqk0XUfgBtdcql+jUzt3f0QLRVNe8+8HmEXztK5rIG0bEMgWJ+fyFX5rj9
	 MWauye+y6KPanPTWp/tzTDX3qSsjbGV+R+oyLIuZ0Vr1slJwOIxZGHp82ojkO63lXf
	 1VTKAY9v3PNAw==
Date: Fri, 6 May 2022 10:38:29 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org, 
    bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v8 4/7] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <b8f183b0-9168-3848-a2d9-f3f5839e667e@suse.com>
Message-ID: <alpine.DEB.2.22.394.2205061037350.43560@ubuntu-linux-20-04-desktop>
References: <20220506120012.32326-1-luca.fancellu@arm.com> <20220506120012.32326-5-luca.fancellu@arm.com> <b8f183b0-9168-3848-a2d9-f3f5839e667e@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Juergen Gross wrote:
> On 06.05.22 14:00, Luca Fancellu wrote:
> > Introduce a way to create different cpupools at boot time, this is
> > particularly useful on ARM big.LITTLE system where there might be the
> > need to have different cpupools for each type of core, but also
> > systems using NUMA can have different cpu pools for each node.
> > 
> > The feature on arm relies on a specification of the cpupools from the
> > device tree to build pools and assign cpus to them.
> > 
> > ACPI is not supported for this feature.
> > 
> > With this patch, cpupool0 can now have less cpus than the number of
> > online ones, so update the default case for opt_dom0_max_vcpus.
> > 
> > Documentation is created to explain the feature.
> > 
> > Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Reviewed-by: Juergen Gross <jgross@suse.com> # non-arm parts

With this, I think the whole series is ready to be committed. I would
like an Ack from Dario/George for the minimal changes to sched/ kconfig
and sched.h.

