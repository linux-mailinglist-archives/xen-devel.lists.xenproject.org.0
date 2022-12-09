Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C2648A9D
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 23:12:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458297.716201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lae-0001rj-Uz; Fri, 09 Dec 2022 22:11:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458297.716201; Fri, 09 Dec 2022 22:11:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3lae-0001pL-R9; Fri, 09 Dec 2022 22:11:32 +0000
Received: by outflank-mailman (input) for mailman id 458297;
 Fri, 09 Dec 2022 22:11:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AAZn=4H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p3lad-0001pF-Tf
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 22:11:31 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ef39236-780e-11ed-91b6-6bf2151ebd3b;
 Fri, 09 Dec 2022 23:11:30 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32AC5B8293A;
 Fri,  9 Dec 2022 22:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE472C433EF;
 Fri,  9 Dec 2022 22:11:25 +0000 (UTC)
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
X-Inumbo-ID: 6ef39236-780e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670623887;
	bh=TcV3E8AbqPpADLY13QWnCQ6cRnK7sr2B6k82fRE+0v8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Q1KlJZdzWd+bkG4XZBfWTawDU7d2RxDpc8bQp0jYqP4TQguQPET7d1Vpk5IgL+bHC
	 Mlx+/pXCRo5FN5zEA25HnJprXw2+ap8xe0WyQI8dT8EjLIvgS9c9PFXC2R8WlReVYO
	 zTX3LteV9r+MV+IXow/g3dN5SgBRUamYE6rPcRV2K5VRQ2KmGm7yMNUDLav7LP2Ieu
	 Ts6Cv9PaZjTaG13VroRW+WaXKeKZqgt05thiNvFxy8LTUJqu2GpC0Yz5VVf32yvD4Q
	 /Gj/z2ro9vlCdXfptIumH8B3CpQfs7oeYl9Lw06dnS8LmadXmw8MPFJbv0HGwxpTsd
	 n1U1Zv2+wN1Yw==
Date: Fri, 9 Dec 2022 14:11:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>, Bertrand.Marquis@arm.com
cc: Henry Wang <Henry.Wang@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212091409020.3075842@ubuntu-linux-20-04-desktop>
References: <20221014080917.14980-1-Henry.Wang@arm.com> <a947e0b4-8f76-cea6-893f-abf30ff95e0d@xen.org> <AS8PR08MB7991FD5994497D812FE3AE2E92249@AS8PR08MB7991.eurprd08.prod.outlook.com> <9d5ab09e-650f-118d-0233-d7988f1504f1@xen.org>
 <AS8PR08MB799170627B34BD2627CE3092921D9@AS8PR08MB7991.eurprd08.prod.outlook.com> <e6643bfc-5bdf-f685-1b68-b28d341071c1@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Dec 2022, Julien Grall wrote:
> Hi Henry,
> 
> On 08/12/2022 03:06, Henry Wang wrote:
> > I am trying to work on the follow-up improvements about the Arm P2M code,
> > and while trying to address the comment below, I noticed there was an
> > unfinished
> > discussion between me and Julien which I would like to continue and here
> > opinions from all of you (if possible).
> > 
> > > -----Original Message-----
> > > From: Julien Grall <julien@xen.org>
> > > Subject: Re: [PATCH v2] xen/arm: p2m: Populate pages for GICv2 mapping in
> > > arch_domain_create()
> > > > > I also noticed that relinquish_p2m_mapping() is not called. This
> > > > > should
> > > > > be fine for us because arch_domain_create() should never create a
> > > > > mapping that requires p2m_put_l3_page() to be called.
> > 
> > For the background of the discussion, this was about the failure path of
> > arch_domain_create(), where we only call p2m_final_teardown() which does
> > not call relinquish_p2m_mapping()...
> So all this mess with the P2M is necessary because we are mapping the GICv2
> CPU interface in arch_domain_create(). I think we should consider to defer the
> mapping to later.
> 
> Other than it makes the code simpler, it also means we could also the P2M root
> on the same numa node the domain is going to run (those information are passed
> later on).
> 
> There is a couple of options:
>  1. Introduce a new hypercall to finish the initialization of a domain (e.g.
> allocating the P2M and map the GICv2 CPU interface). This option was briefly
> discussed with Jan (see [2])./
>  2. Allocate the P2M when populate the P2M pool and defer the GICv2 CPU
> interface mapping until the first access (similar to how with deal with MMIO
> access for ACPI).
> 
> I find the second option is neater but it has the drawback that it requires on
> more trap to the hypervisor and we can't report any mapping failure (which
> should not happen if the P2M was correctly sized). So I am leaning towards
> option 2.
> 
> Any opinions?

Option 1 is not great due to the extra hypercall. But I worry that
option 2 might make things harder for safety because the
mapping/initialization becomes "dynamic". I don't know if this is a
valid concern.

I would love to hear Bertrand's thoughts about it. Putting him in To:

