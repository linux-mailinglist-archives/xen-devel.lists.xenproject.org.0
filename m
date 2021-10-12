Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10B42A93F
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 18:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207535.363408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKUE-0004RE-Qx; Tue, 12 Oct 2021 16:18:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207535.363408; Tue, 12 Oct 2021 16:18:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maKUE-0004No-NJ; Tue, 12 Oct 2021 16:18:42 +0000
Received: by outflank-mailman (input) for mailman id 207535;
 Tue, 12 Oct 2021 16:18:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKUD-0004Ni-KK
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:18:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKUD-0005OV-IN
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:18:41 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1maKUD-0001U6-HB
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 16:18:41 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1maKU8-0004v7-IY; Tue, 12 Oct 2021 17:18:36 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=BqoNaHwO/t2HEKKLHC9PSN+pgvPlyF6oIXIuIW+uIr0=; b=dT/Fp2YET/sLaD0w3uByxvG5bA
	m/xDAwwwJ7ljU4Q/BMGSGDSK7R+6h57aYmsiY3STwSBy43L0ow/si632YMnSpHDQajkJoCMb/X4rE
	XnlIr4cfH5oyOXqxuWNs6T6IO4bW/8SCWkGFzwbSJ7m2+SXrdB+rB+Aa6cg42jrh0kRw=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24933.46428.243423.112077@mariner.uk.xensource.com>
Date: Tue, 12 Oct 2021 17:18:36 +0100
To: Oleksandr <olekstysh@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Juergen Gross <jgross@suse.com>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
In-Reply-To: <60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
	<1633974539-7380-2-git-send-email-olekstysh@gmail.com>
	<24933.42667.311553.565032@mariner.uk.xensource.com>
	<60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Oleksandr writes ("Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
> > Oleksandr Tyshchenko writes ("[PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
> > You say "to the toolstack", but you are exposing this information up
> > to callers of libxl.  Do you mean some higher-layer toolstack that
> > uses libxl ?  What does it use this information for ?
> >
> > FTAOD I am not opposed to exposing this in this way; indeed it seems
> > likely to be useful.  I just want to fully understand before I give
> > this my tools ack.
> 
> I didn't mean any higher-layer toolstack, sorry if I was unclear. In the 
> first place this information is
> needed by the entity which generates the device-tree for the guest on 
> Arm (tools/libs/light/libxl_arm.c) to properly calculate the extended 
> regions to be inserted into the hypervisor node.

Right, OK.  So I think this is being exposed at the libxl
gratuitously, because someone might want it in the future.
I approve :-).

Reviewed-by: Ian Jackson <iwj@xenproject.org>

Thanks,
Ian.

