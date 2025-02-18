Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3954EA3A8E1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 21:27:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892211.1301208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUBt-0006uu-AB; Tue, 18 Feb 2025 20:27:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892211.1301208; Tue, 18 Feb 2025 20:27:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUBt-0006rh-72; Tue, 18 Feb 2025 20:27:37 +0000
Received: by outflank-mailman (input) for mailman id 892211;
 Tue, 18 Feb 2025 20:27:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qrz8=VJ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tkUBr-0006Vx-QH
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 20:27:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8a1bba3-ee36-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 21:27:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C71955C4E46;
 Tue, 18 Feb 2025 20:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4D36C4CEE2;
 Tue, 18 Feb 2025 20:27:31 +0000 (UTC)
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
X-Inumbo-ID: c8a1bba3-ee36-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910452;
	bh=uXDGA3xnRoOmLT4DG/v0+KWXRj5Ygiokjl555/5XjQI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=b+GQhvm7ssk2m4RlNVdSd9B9aeJaGbl592wowYSYPyFCEPxvlOnutmajEan4Syt60
	 GHaQYeHi+TZmu+OVga+yX5h+BoszncX01l0IdRptDNbjuOQJi5EzrU/CIbbb7QV5fh
	 Mk3S0inCppSgWBj3tOtH2FpyGIB4sc4yzijSQgYN+Td20aiEAsSJDbMK1fneZD9uxr
	 +Ig988A/nb9od1EvONF29uO25JA2Ebl/GLkH4n/gIEQ1dqEAEcXxMRr6b1JCG0pepG
	 2ciGDoEZfLSA6EdkfvyLVOHZV6UJXaXKdycu9s2zFZVrcFDJXvY6FePpgoNHDLoigI
	 +UgZLYd/I7I6g==
Date: Tue, 18 Feb 2025 12:27:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Orzel, Michal" <michal.orzel@amd.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>, 
    bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com, 
    dpsmith@apertussolutions.com, xenia.ragiadakou@amd.com
Subject: Re: [PATCH v2] xen/dom0less: support for vcpu affinity
In-Reply-To: <b70bcaca-ff7a-4635-bd5c-7c64768286d5@amd.com>
Message-ID: <alpine.DEB.2.22.394.2502181225550.1085376@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502141615050.3858257@ubuntu-linux-20-04-desktop> <b70bcaca-ff7a-4635-bd5c-7c64768286d5@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Feb 2025, Orzel, Michal wrote:
> On 15/02/2025 01:17, Stefano Stabellini wrote:
> > 
> > 
> > Add vcpu affinity to the dom0less bindings. Example:
> > 
> >                          dom1 {
> >                                  ...
> >                                  cpus = <4>;
> >                                  vcpu0 {
> >                                         compatible = "xen,vcpu-affinity";
> >                                         id = <0>;
> >                                         hard-affinity = "4-7";
> >                                  };
> >                                  vcpu1 {
> >                                         compatible = "xen,vcpu-affinity";
> >                                         id = <1>;
> >                                         hard-affinity = "0-3";
> >                                  };
> >                                  vcpu2 {
> >                                         compatible = "xen,vcpu-affinity";
> >                                         id = <2>;
> >                                         hard-affinity = "1,6";
> >                                  };
> >                                  ...
> >                          }
> What is this indentation for? It reads strangely.
> 
> > 
> > Note that the property hard-affinity is optional. It is possible to add
> If it's optional, then this node does not make sense anymore...

The idea is that at least one of the ways to specify affinity should be
present, otherwise like you wrote, it is useless. But the property
itself I think should be marked as optional (otherwise it would have to
be always present.)

I addressed all other comments, I'll send a v3.

