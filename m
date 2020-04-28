Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368581BB73A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 09:08:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTKL8-0003O9-6h; Tue, 28 Apr 2020 07:07:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0bN=6M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jTKL7-0003O4-03
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 07:07:33 +0000
X-Inumbo-ID: ed9705a0-891e-11ea-ae69-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed9705a0-891e-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588057652;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eAIEH6PwI+/cm8d/4tCn9x5yNlj1YcxBr6Y/UP99M1c=;
 b=HcFc+UZglBnqB1/hganI/pg1/IvR7lrmo+INutoRqnI+JmIejXmZ9yHW
 GIANo+rk+vm/+yIZm9JTyMc5JBNIxpoq/AopXGwknHEWB/cHDuF3oZ/nW
 IYNlPhVKrxQJt2j/OpOiWS7hiQf4weXjcfdopm/st1ZoAGtLvdTvPzF6O s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4yJmwIG3VKIi3zwwoo7bxWkGV8dIafWEOwB4BR8DvhsJoR+Ok1woIU0Ge3C2fGgJwuwVBo1lQg
 jB0Fus8wyEau+hj04wJx4NH8CyTuiAUf4EV3nL1/Y+c+TyY49QjseB5B42hQtfG9Se/PpdKzLi
 dUnrsQCRXgJlO6EAjz1Ffm5gGqGdeVjSkjcxGFtsNtMTKOQ6lZegkN0KQ9Ik1r+8eLKjTiGzs8
 K3s1sIbcHzC5xzi7yTTDA7fznheyOkB+5S5Ziakd/3LUXd6RP4lSrbwKS86B/DQ9AnSU1ZSbXu
 Drs=
X-SBRS: 2.7
X-MesageID: 16366027
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,327,1583211600"; d="scan'208";a="16366027"
Date: Tue, 28 Apr 2020 09:07:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: tosher 1 <akm2tosher@yahoo.com>
Subject: Re: Xen network domain performance for 10Gb NIC
Message-ID: <20200428070724.GS28601@Air-de-Roger>
References: <1359850718.562651.1587928713792.ref@mail.yahoo.com>
 <1359850718.562651.1587928713792@mail.yahoo.com>
 <20200427070317.GL28601@Air-de-Roger>
 <1693679742.27711.1588051435928@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1693679742.27711.1588051435928@mail.yahoo.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Apr 28, 2020 at 05:23:55AM +0000, tosher 1 wrote:
> > Driver domains with passthrough devices need to perform IOMMU
> operations in order to add/remove page table entries when doing grant
> maps (ie: IOMMU TLB flushes), while dom0 doesn't need to because it
> has the whole RAM identity mapped in the IOMMU tables. Depending on
> how fast your IOMMU is and what capabilities it has doing such
> operations can introduce a significant amount of overhead.
> 
> It makes sense to me. Do you know, in general, how to measure IOMMU performance, and what features/properties of IOMMU can contribute to getting a better network throughput? Please let me know. 

Hm, not really. You would have to modify Xen and/or the Linux kernel
in order to time the IOMMU or the grant map operations in order to get
an idea.

Do you get the expected performance from the driver domain when not
using it as a backend? Ie: running the iperf benchmarks directly on
the driver domain and not on the guest.

Roger.

