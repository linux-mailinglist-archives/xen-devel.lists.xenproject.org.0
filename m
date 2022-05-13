Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A526152595C
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 03:24:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328137.551069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npK2D-0002T6-Pu; Fri, 13 May 2022 01:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328137.551069; Fri, 13 May 2022 01:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npK2D-0002Qc-M4; Fri, 13 May 2022 01:24:01 +0000
Received: by outflank-mailman (input) for mailman id 328137;
 Fri, 13 May 2022 01:24:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xcQv=VV=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1npK2B-0002QW-VV
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 01:23:59 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1f687a-d25b-11ec-8fc4-03012f2f19d4;
 Fri, 13 May 2022 03:23:59 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 43B63B82BCE;
 Fri, 13 May 2022 01:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914CCC385B8;
 Fri, 13 May 2022 01:23:56 +0000 (UTC)
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
X-Inumbo-ID: 5d1f687a-d25b-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652405037;
	bh=3agA9T2JBD+/dcj6+92nZQD/HWnrJRjDcLpMYuEguvQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VPWxMMX1EE9x1QD3mKq95xS+OTwbDY/9cPRsHV48SnMwrfLqRCF0aijEX1tjNl/ln
	 xEpyXVTa3JnUCpl4r+b4D9/BlEEba3doCy1yToxX9kI3xQctRmfMZVIq0w/koM0V77
	 yCnYiFfyRgYx3l67oYGV43dcbSHNtRNLvtIc4ceaOr35faAkdJdeO5neV9D4vvhE4y
	 IMUmcQCSF5if9SOgnc7LMGro9FjggyhGy4aj7nDc2YYmhXt/q6/WJTmbfG8bT81d9q
	 MXUCr/FiuunE14P42WZD9JNaQcyAZ7B3S1VVtsK9Xea5ta9/mbt6CdSd64CX8vBGwW
	 7cdGnyy+marKA==
Date: Thu, 12 May 2022 18:23:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Rahul Singh <Rahul.Singh@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Juergen Gross <jgross@suse.com>, 
    "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
    Luca Miccio <lucmiccio@gmail.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "jbeulich@suse.com" <jbeulich@suse.com>
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
In-Reply-To: <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
Message-ID: <alpine.DEB.2.22.394.2205121823320.3842@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop> <20220505001656.395419-4-sstabellini@kernel.org> <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com> <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org> <37C437B0-BF87-41C0-8FF1-0BF193C667C4@arm.com>
 <0f39d464-5a2c-a8f6-04c8-f96da7340003@xen.org> <4BEDB555-12F4-4A91-8D16-D83DBB1BE3CC@arm.com> <34b790af-c56a-26c7-e218-7961023b8605@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 May 2022, Julien Grall wrote:
> > If dom0 is mandatory yes, we should still make sure that this code cannot be
> > reached so an ASSERT would be nice here at least in case someone tries to
> > activate this code without dom0 (which might happen when we will push the
> > serie for static event channels).
> 
> I am fine with an ASSERT().

I added an ASSERT(hardware_domain).

