Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F72224AEF
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 13:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwkwu-0000mH-EA; Sat, 18 Jul 2020 11:24:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BrZA=A5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwkws-0000lY-SY
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 11:24:10 +0000
X-Inumbo-ID: 3340c10e-c8e9-11ea-9725-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3340c10e-c8e9-11ea-9725-12813bfff9fa;
 Sat, 18 Jul 2020 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUxh8u1efSR2RaHD48Qz7dVl3CuiL7daNy2JgMIh/Z4=; b=TqxfXhmP2tt+atMq167bFy2HMS
 KkA9csHDB27Cb0ULygNICwu12JSxVAIOt573LUjD6q21DJqP+wGwqEpKS6/DYk6MTRsLuB0jPRlhb
 CyC2nQ7jbpiv5j86t6ZvHcjieaUXQtRTBTKXvcRn9G7tAJBtrJa8ZAD+RAFUQzt3qdvs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwkwr-0003tL-3f; Sat, 18 Jul 2020 11:24:09 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwkwq-0006Gi-Oy; Sat, 18 Jul 2020 11:24:08 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Oleksandr <olekstysh@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
 <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2fd6c418-db41-8070-5644-344fefd8128d@xen.org>
Date: Sat, 18 Jul 2020 12:24:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/07/2020 20:17, Oleksandr wrote:
> I would like to clarify regarding an IOMMU driver changes which should 
> be done to support PCI pass-through properly.
> 
> Design document mentions about SMMU, but Xen also supports IPMMU-VMSA 
> (under tech preview now). It would be really nice if the required 
> support is extended to that kind of IOMMU as well.
> 
> May I clarify what should be implemented in the Xen driver in order to 
> support PCI pass-through feature on Arm? 

I would expect callbacks to:
     - add a PCI device
     - remove a PCI device
     - assign a PCI device
     - deassign a PCI device

AFAICT, they are already existing. So it is a matter of plumbing. This 
would then be up to the driver to configure the IOMMU correctly.

> Should the IOMMU H/W be 
> "PCI-aware" for that purpose?

The only requirement is that your PCI devices are behind an IOMMU :). 
Other than that the IOMMU can mostly be configured the same way as you 
would do for the non-PCI devices. The main difference would be how you 
find the master ID.

I am aware that on some platforms, the masterID may be shared between 
multiple PCI devices. In that case, we would need to have a way to 
assign all the devices to the same guest (maybe using group?).

Cheers,

-- 
Julien Grall

