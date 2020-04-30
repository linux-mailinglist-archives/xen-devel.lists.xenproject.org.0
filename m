Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5841BED00
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 02:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTx9q-0002AL-3P; Thu, 30 Apr 2020 00:34:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEmr=6O=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jTx9o-0002AG-Ld
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 00:34:28 +0000
X-Inumbo-ID: 5976da0a-8a7a-11ea-9887-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5976da0a-8a7a-11ea-9887-bc764e2007e4;
 Thu, 30 Apr 2020 00:34:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5F71120731;
 Thu, 30 Apr 2020 00:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588206867;
 bh=XInN9WD+q3mgzx+OHQrHGVwTAvRCMnc5MpQJ2vldbY4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=osh6jMnhqZJ8WvNP0G/J9F0GTph3J+dT9FOwp4SV6WvoUQhLY4LUeujQEENvrkZbw
 iYPhrsSL0sCpb1QC/JZ7gfeVtinBDsjWb3/dqr/HXDc4gLB9zesZBOvX8L9OCtyXld
 TJSXfm5mN7FN3qYVacfzMhia+AvVAJijX89A/P/Q=
Date: Wed, 29 Apr 2020 17:34:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 02/12] xen/arm: introduce arch_xen_dom_flags and direct_map
In-Reply-To: <4130f640-a664-a9e7-fcd7-85bbd58287e4@suse.com>
Message-ID: <alpine.DEB.2.21.2004291733570.28941@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-2-sstabellini@kernel.org>
 <4130f640-a664-a9e7-fcd7-85bbd58287e4@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 andrew.cooper3@citrix.com, Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 15 Apr 2020, Jan Beulich wrote:
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2527,6 +2527,7 @@ int __init construct_dom0(struct domain *d)
> >  
> >      iommu_hwdom_init(d);
> >  
> > +    d->arch.direct_map = true;
> 
> Shouldn't this get set via arch_domain_create() instead?

Yes you are right, this is unnecessary and I can remove it.

