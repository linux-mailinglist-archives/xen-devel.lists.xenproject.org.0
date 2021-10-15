Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16B42F04F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 14:14:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210430.367300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM6D-0002zZ-O8; Fri, 15 Oct 2021 12:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210430.367300; Fri, 15 Oct 2021 12:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbM6D-0002xK-Ko; Fri, 15 Oct 2021 12:14:09 +0000
Received: by outflank-mailman (input) for mailman id 210430;
 Fri, 15 Oct 2021 12:14:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbM6B-0002x8-Lu
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:14:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbM6B-0003bn-LA
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:14:07 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mbM6B-0006eg-KQ
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 12:14:07 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mbM64-0005ed-Ut; Fri, 15 Oct 2021 13:14:01 +0100
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
	bh=mz7CXo4IvmDJBATn8fvcvOFPhfjCyiYxGy3yam05NNM=; b=Qmwc78O30+8ogQJSvqy19a3daO
	i0pnOtkth9/6P9iNKVptmEH39OqOyZe6meJS5V53dOtAUYUBHsnUzwqpoOq9cmHp/2bc7adn4kDMC
	4/GdqREFySLV1KTCDtYMThwsFBdCQl59bOhkGh96rk8xv7QGMlN6p0aK21Lz9qdv6Rn4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24937.28808.688889.814621@mariner.uk.xensource.com>
Date: Fri, 15 Oct 2021 13:14:00 +0100
To: Julien Grall <julien@xen.org>
Cc: Michal Orzel <michal.orzel@arm.com>,
    Bertrand Marquis <Bertrand.Marquis@arm.com>,
    xen-devel@lists.xenproject.org,
    Rahul Singh <rahul.singh@arm.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Stefano Stabellini  <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Andre Przywara <Andre.Przywara@arm.com>
Subject: Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl
 [and 1 more messages]
In-Reply-To: <76897e97-8f44-d1c5-f108-045ea48442e5@xen.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
	<b81b5dea800c8fe47071f3dbd20588b1e472fb99.1633540842.git.rahul.singh@arm.com>
	<7bdac405-a889-15e1-be19-5876f7253855@xen.org>
	<24926.53690.621007.507249@mariner.uk.xensource.com>
	<294BE20A-7E45-405C-BC19-C292295E85E3@arm.com>
	<24927.7235.736221.270358@mariner.uk.xensource.com>
	<8A04B9B2-E816-425E-BF1B-5A8B89F8836C@arm.com>
	<cover.1634221830.git.bertrand.marquis@arm.com>
	<fd9c54a381daa52436b0a1b27cf1bba8e7ff9af9.1634221830.git.bertrand.marquis@arm.com>
	<24936.28385.679884.535704@mariner.uk.xensource.com>
	<6f82141c-8a0b-1e30-a996-223f7c0c508d@xen.org>
	<24937.20922.73382.850023@mariner.uk.xensource.com>
	<56490119-6040-9ab1-aab7-e43975cbb80d@arm.com>
	<24937.27149.222087.933297@mariner.uk.xensource.com>
	<6e29d836-918c-3b15-7608-342b2e4f8475@arm.com>
	<76897e97-8f44-d1c5-f108-045ea48442e5@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [PATCH v6 3/3] arm/libxl: Emulated PCI device tree node in libxl [and 1 more messages]"):
> Long term, I would expect a similar check to be necessary to set the 
> vCPI flag at the domain creation. So it would be best to introduce an 
> internal field 'vpci' to avoid duplicating that check. (Note I am not 
> requesting this change for Xen 4.16).

Yes, I agree with all of that.

Ian.

