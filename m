Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1084FA00B
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 01:18:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301832.515176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxs6-0003zr-IK; Fri, 08 Apr 2022 23:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301832.515176; Fri, 08 Apr 2022 23:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncxs6-0003xJ-FQ; Fri, 08 Apr 2022 23:18:30 +0000
Received: by outflank-mailman (input) for mailman id 301832;
 Fri, 08 Apr 2022 23:18:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5u+K=US=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ncxs5-0003w6-Dv
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 23:18:29 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 329182f1-b792-11ec-a405-831a346695d4;
 Sat, 09 Apr 2022 01:18:28 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1347EB82D69;
 Fri,  8 Apr 2022 23:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802B6C385A1;
 Fri,  8 Apr 2022 23:18:26 +0000 (UTC)
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
X-Inumbo-ID: 329182f1-b792-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649459906;
	bh=GzX4JEvBeis5zUcNVM4Cn8q3+ajY0d419M9BmlpjrY4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oY/RFXOtMz5nSXkX1sbROidugRyslpcSA/67gIJWu21EjYgk5dHL1vNdoFa24w8qd
	 h6a0g7IJvyytc7WZmcxB5dZM1BWlgfoGW/q4KJWh78uiE/BQaeSUvfxNDpqkB2m1Yn
	 eBavAKdYcluwVYadrhyKlk039QDqJ0uKAhjceWp970CZ0uqXrr+Q99cPDjpn7d9BVB
	 WJ9jsbeMpV+XhEdXv4pu4XBySLEVZdv+YIF/pdFlmiAaAFn7kuxwOc6KMPDnCkAerX
	 00HTc9CvyYaBEq9aqeIndj5VkspwYjbFq7AxsDkvzSHgkQv+kmhqIiGjDMlnUda9Zc
	 zJW/DN9GebcCw==
Date: Fri, 8 Apr 2022 16:18:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Penny Zheng <Penny.Zheng@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 06/13] xen/arm: set up shared memory foreign mapping
 for borrower domain
In-Reply-To: <a9628233-5c2e-abb2-1df8-f45e4ac3280b@xen.org>
Message-ID: <alpine.DEB.2.22.394.2204081608420.3066615@ubuntu-linux-20-04-desktop>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com> <20220311061123.1883189-7-Penny.Zheng@arm.com> <alpine.DEB.2.22.394.2203171744190.3497@ubuntu-linux-20-04-desktop> <DU2PR08MB732540A4196E8634B4D8A579F71E9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <alpine.DEB.2.22.394.2204081516400.3066615@ubuntu-linux-20-04-desktop> <a9628233-5c2e-abb2-1df8-f45e4ac3280b@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Apr 2022, Julien Grall wrote:
> On 08/04/2022 23:18, Stefano Stabellini wrote:
> > On Tue, 29 Mar 2022, Penny Zheng wrote:
> > > Right now, the memory attribute of static shared memory is RW as default,
> > > What if we add memory attribute setting in device tree configuration,
> > > sometimes,
> > > Users want to specify that borrower domain only has RO right, hmm, then
> > > the
> > > Initialization for p2mt could be either p2m_ram_rw or p2m_ram_ro?
> > > In such case, we could add another parameter in guest_physmap_add_shm to
> > > show the p2m type...
> > > Hope I understand what you suggested here.
> > 
> > Yes, I think I understand. I think your suggestion is OK too. However,
> > your suggestion is much more work than mine: I was only suggesting a
> > small improvement limited to guest_physmap_add_shm and
> > get_pages_from_gfn. Your suggestion involves a device tree change that
> > would have a larger impact on the patch series. So if you are up for it,
> > I am happy to review it. I am also fine just to have a small improvement
> > on guest_physmap_add_shm/get_pages_from_gfn.
> 
> AFAIU, your proposal would mean that the behavior for get_pages_from_gfn() and
> get_page_from_gfn() will differ. This is not great.
> 
> I don't think we can easily change the behavior of get_page_from_gfn() because
> some callers can accept multiple types.
> 
> Furthermore, while today we only check p2m_ram_rw. It might be possible that
> we would want to check different type. For instance, if we want to use
> read-only mapping, it would be fine to accept p2m_ram_ro and p2m_ram_rw.
> 
> So overall, I am not in favor of initializing p2mt and let
> get_pages_from_gfn() to check the type.

OK. In that case, I suggest to leave the code pretty much as is in
regards of how get_pages_from_gfn is called from guest_physmap_add_shm.

