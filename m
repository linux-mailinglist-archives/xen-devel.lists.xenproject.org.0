Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04921B3AD5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2020 11:09:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRBNm-0003k8-QZ; Wed, 22 Apr 2020 09:09:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1SgQ=6G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jRBNl-0003k3-AR
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2020 09:09:25 +0000
X-Inumbo-ID: f5a84984-8478-11ea-b58d-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5a84984-8478-11ea-b58d-bc764e2007e4;
 Wed, 22 Apr 2020 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587546564;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cSW/KbbCI2axUz4DTYkDiScIu1rTDjrq9O3+zsPfUs0=;
 b=bikCVD9taPNexJ/+CCfl2So7YwMLZBR6WOOMWVfit0pWqVSu7gWFIlUL
 IZAHx01eBBcEQJ36LPyvAb2w/IhdiVwZAtKQm6GT3EMvXlsWHsFQj+/r1
 uN8BeTOut62xNduchwlbOpuA3EOcM6G1U2pTF1PKXunHyxsKe3UPlYvUh k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2SdP0RQUfpGRAIGxEy+PujQSXpVTtmwbY85KSLJ4Q/c67Y5eURsp8GNRYZ3dZvHrJU+WFg2vPJ
 q1PNiBdGRrJQ4cl34Fmw451My/BQFdUGs4+dy/5Uv36KghVx3jy1MShHaeANTCv4rPA2qAyx6U
 D4WdBegs+q5Fqe11+wigfRhSCscjinW8XLXIITOItkWVxm/lbyBpa9dxaFak6MK0Ti3wZUvRcq
 suwGplWGwDgwlDbKNyvj+vHG7msrFJD8P9+3UrgxuuhdPDzA/Dm3Xa8R1LFva+bmVqPgcsaSfS
 BVs=
X-SBRS: 2.7
X-MesageID: 16732824
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,413,1580792400"; d="scan'208";a="16732824"
Date: Wed, 22 Apr 2020 11:09:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH v16 2/3] mem_sharing: allow forking domain with IOMMU
 enabled
Message-ID: <20200422090911.GC28601@Air-de-Roger>
References: <cover.1587490511.git.tamas.lengyel@intel.com>
 <c958f3776e602143efb2fb7c146a0c18a3fcd262.1587490511.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c958f3776e602143efb2fb7c146a0c18a3fcd262.1587490511.git.tamas.lengyel@intel.com>
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 21, 2020 at 10:47:24AM -0700, Tamas K Lengyel wrote:
> The memory sharing subsystem by default doesn't allow a domain to share memory
> if it has an IOMMU active for obvious security reasons. However, when fuzzing a
> VM fork, the same security restrictions don't necessarily apply. While it makes
> no sense to try to create a full fork of a VM that has an IOMMU attached as only
> one domain can own the pass-through device at a time, creating a shallow fork
> without a device model is still very useful for fuzzing kernel-mode drivers.
> 
> By allowing the parent VM to initialize the kernel-mode driver with a real
> device that's pass-through, the driver can enter into a state more suitable for
> fuzzing. Some of these initialization steps are quite complex and are easier to
> perform when a real device is present. After the initialization, shallow forks
> can be utilized for fuzzing code-segments in the device driver that don't
> directly interact with the device.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

