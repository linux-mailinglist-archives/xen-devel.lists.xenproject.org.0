Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 532C9D1BA6A
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 00:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202370.1517950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnSY-0000Js-Pq; Tue, 13 Jan 2026 23:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202370.1517950; Tue, 13 Jan 2026 23:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfnSY-0000He-N3; Tue, 13 Jan 2026 23:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1202370;
 Tue, 13 Jan 2026 23:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wjAJ=7S=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vfnSY-0000HS-1c
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 23:05:58 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a691f48-f0d4-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 00:05:56 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 18D2D60018;
 Tue, 13 Jan 2026 23:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10B37C116C6;
 Tue, 13 Jan 2026 23:05:52 +0000 (UTC)
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
X-Inumbo-ID: 6a691f48-f0d4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768345554;
	bh=9CN2VHBk5fq1iH+7VGkDZiOjbskB+UkAhrBK78R6cFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zx1jwhsdrAlSNJZZAjSyrGjBeoR3INCiL8sLzjv0JitkBn77Ffx0S2yj7CPi7R0Yk
	 Pr61HiobP0F+VfE3/nObCaWl59fOS4+KZTK9cCLTP01EAyt0jGI0tlhpXmoIczuJn5
	 yZWMmEfKTaTS3P4hR4j4rWuTEsWaKg1ob/e9e2Bx3QzHkkjtd0OmS1+FRPOcSNRFGB
	 fEntCK8WDkXCzbsRuLpr07/4JPPHBaKAxb5PgAcutd6xV8NkS+ZhJBzeYgkaTT+hRW
	 L3COjFBw6M6GoA8GQu7iIxZkOYe2yfMpNb99hHDRT6ZwVCNBcMmOThYRBC6hP3dY+z
	 5sKWctYe1FJOg==
Date: Tue, 13 Jan 2026 15:05:52 -0800 (PST)
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
Subject: Re: [PATCH v6 4/5] xen/arm: scmi: introduce SCI SCMI SMC multi-agent
 driver
In-Reply-To: <0e805633-4e68-43b5-8201-81dc5135010a@epam.com>
Message-ID: <alpine.DEB.2.22.394.2601131455170.992863@ubuntu-linux-20-04-desktop>
References: <cover.1761998077.git.oleksii_moisieiev@epam.com> <ee195eb3a9b04854a6b108da4275877c9a7bb32c.1761998077.git.oleksii_moisieiev@epam.com> <b46ae649-dab8-4d8a-b216-c61972b2ef3b@epam.com> <0e805633-4e68-43b5-8201-81dc5135010a@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Jan 2026, Oleksii Moisieiev wrote:
> >> chosen {
> >>    ranges;
> >>    xen,config {
> > Q: [Stefano] The node name could be xen-config, but it doesn't matter
> > because we
> > should check for the compatible string instead (no check on node name).
> >
> > We need to add a compatible string here, I would use "xen,scmi":
> >
> >     compatible = "xen,scmi";
> >
> >
> > A: [OM] this is a great finding. After looking into hyperlauch code I
> > see the following implementation:
> >
> >
> > config {
> >         compatible = "xen,config";
> >     ...
> > };
> >
> > I was thinking about changing current approach to have the following
> > format:
> >
> > config {
> >         compatible = "xen,config";
> >     ...
> >     scmi_config {
> >         compatible = "xen,sci"; <-- more generic compatible string
> > than "xen,scmi"
> >         scmi-secondary-agents = <
> >                   0x82000003 &scmi_shm_0 0
> >                   0x82000004 &scmi_shm_2 2
> >                   ...>;
> >                 #scmi-secondary-agents-cells = <3>; <--- optional,
> > default 3
> >                 scmi_shm_0 : sram@47ff0000 {
> >                 compatible = "arm,scmi-shmem";
> >                 reg = <0x0 0x47ff0000 0x0 0x1000>;
> >             };
> >
> >         scmi_shm_2: sram@47ff2000 {
> >                     compatible = "arm,scmi-shmem";
> >                    reg = <0x0 0x47ff2000 0x0 0x1000>;
> >             };
> >             scmi_xen: scmi {
> >                 compatible = "arm,scmi-smc";
> >                 arm,smc-id = <0x82000002>; <--- Xen manegement agent
> > smc-id
> >                 #address-cells = < 1>;
> >                 #size-cells = < 0>;
> >                 #access-controller-cells = < 1>;
> >                 shmem = <&scmi_shm_1>; <--- Xen manegement agent shmem
> >             };
> >     };
> >     ...
> > };
> >
> > and update scmi-multiagent driver to match "xen,sci" compatible and
> > process all subnodes during probe.
> > What do you think about this approach?

Yes I think that's better.  To be precise this would be the DT nodes
hierarchy:

chosen {

    xen {
        compatible = "xen,hypervisor"; // I would rather use an even more generic compatible string
        bootargs = ""; // since we are introducing this node we can use it for Xen bootargs

        scmi {
            compatible = "xen,sci";
        }
    };

    domU0@address {
    };

    domU1@address {
    };
};

I would start by adding a patch for
docs/misc/arm/device-tree/booting.txt to add the new nodes.

