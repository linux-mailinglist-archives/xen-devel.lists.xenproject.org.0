Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E528042BF65
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 14:02:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208309.364384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macxu-00026j-KL; Wed, 13 Oct 2021 12:02:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208309.364384; Wed, 13 Oct 2021 12:02:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1macxu-00024Z-Go; Wed, 13 Oct 2021 12:02:34 +0000
Received: by outflank-mailman (input) for mailman id 208309;
 Wed, 13 Oct 2021 12:02:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macxt-00024L-TL
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:02:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macxt-0003ze-Sa
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:02:33 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1macxt-00023r-Rs
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 12:02:33 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1macxj-0007XH-Rm; Wed, 13 Oct 2021 13:02:23 +0100
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
	bh=jdxMlChK8o9c2/GnMMmZzLHnp9pzrQP2ZAhudAXxbIQ=; b=rbkeL2mtQbiyRiyYDlQcoLCoI7
	3Sxbeyqn03OkHYGrjcnxZplKE/oajs/aVjeNi5+NfVHDP2K3AjlAZEJSEJSHyhmxvtHv1qN30dyL9
	x2Lf376HFwwcCquC2aV0nWyvFJncvGMjMTZRIsllHW2nRqYuup0jTieu4scnPPivTydY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24934.51918.994290.825524@mariner.uk.xensource.com>
Date: Wed, 13 Oct 2021 13:02:22 +0100
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
    Jan Beulich <jbeulich@suse.com>,
    Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
    Rahul Singh <Rahul.Singh@arm.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
    Andre Przywara <Andre.Przywara@arm.com>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not
 supported on ARM.
In-Reply-To: <YWaSkrqzXoysQkCz@MacBook-Air-de-Roger.local>
References: <ac6d4785-ac9a-4491-26bb-c66ffe82c55b@suse.com>
	<ED8FC92F-B5EF-4473-B4A9-641C7D44859F@arm.com>
	<0744b957-1832-dff2-9ae2-b8e8534f501b@suse.com>
	<c3952fd5-b893-4cb6-a9bc-325a89e859db@epam.com>
	<c125b447-53e8-7d13-3b08-af62fd3a9140@suse.com>
	<c6b6c22f-fb8a-f2d9-7735-f1ebc9809908@epam.com>
	<09656882-b297-7144-c291-1ee997edb119@suse.com>
	<69A83587-B7E0-4653-AF8C-AEE802922CE5@arm.com>
	<24933.41349.893363.203683@mariner.uk.xensource.com>
	<AB6D62B6-2ED2-4957-A933-08EC77A4DFD6@arm.com>
	<YWaSkrqzXoysQkCz@MacBook-Air-de-Roger.local>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monné writes ("Re: [PATCH v5 01/11] xen/arm: xc_domain_ioport_permission(..) not supported on ARM."):
> IMO it would be good to modify the commit message so it covers the
> fact that the emulated host bridge on Arm does not advertise IO port
> support, so the guest is capable of realizing IO BARs are not
> supported.

Yes.

> Otherwise it seems like the toolstack is ignoring a failure which
> could cause a device to malfunction when passed though (which is still
> the case, but the guest will be able to notice).

Quite.

Thanks,
Ian.

