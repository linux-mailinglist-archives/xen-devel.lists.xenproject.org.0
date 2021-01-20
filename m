Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B0C2FD414
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 16:35:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71573.128258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FVV-0006le-59; Wed, 20 Jan 2021 15:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71573.128258; Wed, 20 Jan 2021 15:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2FVV-0006lF-25; Wed, 20 Jan 2021 15:34:53 +0000
Received: by outflank-mailman (input) for mailman id 71573;
 Wed, 20 Jan 2021 15:34:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FVT-0006lA-3Y
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:34:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FVT-0003SD-1y
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:34:51 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2FVT-0004Ab-0x
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 15:34:51 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2FVO-0006IE-7t; Wed, 20 Jan 2021 15:34:46 +0000
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
	bh=BTEDBbHamWATieBtBO0UEunpIXKu26PKq5Jh3vYrC94=; b=P+BbbXxqjC6vAl/fP0bHQQa7cI
	+oHySvJLCo+j4sUiqTLCMO1m5Wn/qP6uEcenZJ98WTD0MEH5kXXBLWAWlWX2vwXh37GA7kBgQIcUg
	aQrDjPkmB5U6lxqBZI0hVcuLuMxpT/LsEMJuvjKG+DN95rkyI5gVkUzU/dXncb4C6SJ0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.19862.22683.273911@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 15:34:46 +0000
To: Julien Grall <julien@xen.org>
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
    xen-devel@lists.xenproject.org,
    sstabellini@kernel.org,
    Volodymyr_Babchuk@epam.com
Subject: Re: [XEN PATCH] xen/arm: Relax GIC version check
In-Reply-To: <5df5270d-216b-3f14-5416-bd3a12da3650@xen.org>
References: <20210120112644.8882-1-vladimir.murzin@arm.com>
	<5df5270d-216b-3f14-5416-bd3a12da3650@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("Re: [XEN PATCH] xen/arm: Relax GIC version check"):
> On 20/01/2021 11:26, Vladimir Murzin wrote:
> > Supported values are
> > 
> > 0b0000 GIC CPU interface system registers not implemented.
> > 
> > 0b0001 System register interface to versions 3.0 and 4.0 of the GIC
> >         CPU interface is supported.
> > 
> > 0b0011 System register interface to version 4.1 of the GIC CPU
> >         interface is supported.
> > 
> > 4.1 is still backward compatible with 4.0/3.0, moreover ARM ARM
> > guarantees that future versions of the GIC CPU interface retain
> > backwards compatible.
> > 
> > Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> @Ian: I would like your put as the RM for 4.15.
> 
> Technically, it could be consider as a new "feature" because Xen would 
> fail to boot on such HW.
> 
> However, I think the change is small enough and doesn't introduce risk 
> on existing supported HW.
> 
> Therefore, I would like to merge it for 4.15. @Ian does it sounds good 
> to you?

Thank you for this analysis.  I think it does need a freeze
exception.  But your argument is convincing, so

Release-Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>


