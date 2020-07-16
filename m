Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EC82220AB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jul 2020 12:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw1Dz-000799-5T; Thu, 16 Jul 2020 10:34:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw1Dx-000793-QK
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:34:45 +0000
X-Inumbo-ID: f6b02328-c74f-11ea-949b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f6b02328-c74f-11ea-949b-12813bfff9fa;
 Thu, 16 Jul 2020 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594895685;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xdME8FFOAnP4xOI4yWGeI2hniWTXZr14SdbFrNhcUzI=;
 b=EzFClyhv5lbi2ru6O+t1LpxQ5G6533j9AaNDjkzePtrOz8SoyitHOHmF
 cDLnuINA2/sS7hlDoWZJLtqxrolMWxQglyliQoIV/e4MfYj7LRQAFRNO1
 t+tslbEyA5/e3RKrHJXNPzjpfZ5E8jaJZHuKzoCqNvWDqHxjvN/nO7Qju I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hAOVjV6VmwPMPFTql9GX7W71qPlw21i+K1BM3+mOVGPxx1RwIO8BCPIX7yBDY1HLd9yCpXHKX8
 Lw4/gqnY3qCVgBmObx4XRJq0YHjnTA6prbckmG+D23Rr0v8qpJFK0XJJ1mwtKUUzv096WvvGtv
 AlDrmGjVZ2I55iYmMgl4AGu7MK2H2pHCgpYbkDPJfxoQH3vUXf6DQoCJs86/1hcbYogVPpP2q1
 5zuRTFARMtlTf7STAGPa2zSE7ANyMfmOJQ+TokzWNFQaOonhx3O/uRWC9cHdVduV+QjQulDcYU
 z4w=
X-SBRS: 2.7
X-MesageID: 22510858
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,359,1589256000"; d="scan'208";a="22510858"
Date: Thu, 16 Jul 2020 12:34:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] VT-d: install sync_cache hook on demand
Message-ID: <20200716103437.GN7191@Air-de-Roger>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
 <20200716101409.GK7191@Air-de-Roger>
 <a051d3e7-eaf5-6121-823b-db1a737bc085@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a051d3e7-eaf5-6121-823b-db1a737bc085@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Jul 16, 2020 at 12:25:40PM +0200, Jan Beulich wrote:
> On 16.07.2020 12:14, Roger Pau Monné wrote:
> > On Wed, Jul 15, 2020 at 12:03:57PM +0200, Jan Beulich wrote:
> >> Instead of checking inside the hook whether any non-coherent IOMMUs are
> >> present, simply install the hook only when this is the case.
> >>
> >> To prove that there are no other references to the now dynamically
> >> updated ops structure (and hence that its updating happens early
> >> enough), make it static and rename it at the same time.
> >>
> >> Note that this change implies that sync_cache() shouldn't be called
> >> directly unless there are unusual circumstances, like is the case in
> >> alloc_pgtable_maddr(), which gets invoked too early for iommu_ops to
> >> be set already (and therefore we also need to be careful there to
> >> avoid accessing vtd_ops later on, as it lives in .init).
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> > 
> > I think this is slightly better than what we currently have:
> > 
> > Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Thanks.
> 
> > I would however prefer if we also added a check to assert that
> > alloc_pgtable_maddr is never called before iommu_alloc.
> 
> It would be quite odd for this to happen - what point would
> there be to allocate a table to hang off of an IOMMU when
> no IOMMU was found at all so far? Furthermore, such a
> restriction could either be viewed to not suffice afaict (as
> a subsequent iommu_alloc() may in principle fine a non-
> coherent IOMMU), or to be pointless (until a non-coherent
> IOMMU was found and allocated any table for, it doesn't
> really matter whether we sync cache). In the end, whether to
> sync cache in alloc_pgtable_maddr() doesn't really depend on
> any global property, but only on the property / properties
> of the IOMMU(s) the table is going to be made visible to.

Right, I think I was indeed overly paranoid. I was mostly worried
about iommu_alloc calling alloc_pgtable_maddr before checking whether
the IOOMMU is incoherent, but this is not likely to happen.

Thanks.

