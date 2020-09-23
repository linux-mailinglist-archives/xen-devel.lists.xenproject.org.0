Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53B275EE6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 19:41:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL8lV-0000Jd-Ex; Wed, 23 Sep 2020 17:41:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HDdr=DA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kL8lT-0000JS-W2
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 17:41:12 +0000
X-Inumbo-ID: b7778aa8-acd6-4908-ae98-1ab7a9e20434
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7778aa8-acd6-4908-ae98-1ab7a9e20434;
 Wed, 23 Sep 2020 17:41:11 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB01120665;
 Wed, 23 Sep 2020 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600882870;
 bh=zUJihJz+o6DlJM8qcZnLGKsIGfKpb9M7lrA0vc+27Nw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ZnRirfUnSbrwJ3eVolZSxBWDwrUIk6JcbWzEsgc04bduIpLWJPqt2J4ROnJJbRcNe
 tYTSXN8oZSy2FKpl68xNn2lNjZF7GYgeJNHHP5blpXbPi5y9mHXR4jsucz7Nf+q0m1
 zXLPKlSMav4A6g5ahY8K45H90yNT7D1Jc2tRz2Oc=
Date: Wed, 23 Sep 2020 10:41:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Julien Grall <julien@xen.org>, 
 "open list:X86" <xen-devel@lists.xenproject.org>, 
 Julien Grall <jgrall@amazon.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 
 2} drivers
In-Reply-To: <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
Message-ID: <alpine.DEB.2.21.2009231034510.1495@sstabellini-ThinkPad-T480s>
References: <20200923082832.20038-1-julien@xen.org>
 <1D6392F2-F4EC-4025-A793-22EABF85AA0E@arm.com>
 <3c64f36f-6b43-6f73-e344-70b084f1f505@xen.org>
 <C14129BD-09F3-4297-BBD6-9F3C5AA82FA7@arm.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 23 Sep 2020, Bertrand Marquis wrote:
> > On 23 Sep 2020, at 12:17, Julien Grall <julien@xen.org> wrote:
> > On 23/09/2020 11:50, Bertrand Marquis wrote:
> >> Hi,
> >>> On 23 Sep 2020, at 09:28, Julien Grall <julien@xen.org> wrote:
> >>> 
> >>> From: Julien Grall <jgrall@amazon.com>
> >>> 
> >>> SMMUv{1, 2} are both marked as security supported, so we would
> >>> technically have to issue an XSA for any IOMMU security bug.
> >>> 
> >>> However, at the moment, device passthrough is not security supported
> >>> on Arm and there is no plan to change that in the next few months.
> >>> 
> >>> Therefore, mark Arm SMMUv{1, 2} as supported but not security supported.
> >>> 
> >>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > 
> > Thanks!
> > 
> >> We will publish in the next week a first implementation of SMMUv3 support which might make sense to have fully Supported.
> > 
> > I am not sure whether you include security supported in your "fully supported"
> 
> If we something is missing we will be happy to fix it to reach this goal.
> 
> > 
> > However, I would consider to follow the same model as we did with the IPMMU. The driver would first be marked as a technical preview to allow more testing in the community.
> 
> I was not meaning to have this at the very beginning.
> More that it make more sense in general to have SMMUv3 with 2 level of page table supporting this then old SMMU versions.

Just as a clarification, the distinction that we are making here is not
to "downgrade" SMMUv1/2, but to clarify that it is not security
supported. SMMUv1/2 is still fully supported.

Security support means that the security team will attempt to fix under
closed door any bugs affecting it, and pre-disclose the fix at the
appropriate time before making it fully public. It is a pretty heavy
process in comparison to normal bug fixing and in the case of the SMMU
doesn't make a lot of sense because device assignment in general is
currently not security supported.

For SMMUv3, I think it makes sense for it to possibly start as "tech
preview" for one release or two, then become "supported, not security
supported".

Of course if one day we make the decision to turn device assignment
security supported, then it makes sense to also change one or more SMMU
drivers to security supported.

