Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5F4190C6A
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:27:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhg1-0007xF-4h; Tue, 24 Mar 2020 11:24:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gj1N=5J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jGhfz-0007x9-29
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:24:55 +0000
X-Inumbo-ID: 149ec58f-6dc2-11ea-83ce-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 149ec58f-6dc2-11ea-83ce-12813bfff9fa;
 Tue, 24 Mar 2020 11:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585049094;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=zAp5Ib50SK+V0xmt/Cto6i3/yii0GJU2C3C6/td8PCA=;
 b=U1UN5s81umC87ls6Dy7JH5SKcsFgMjSy1MtGO89/9kf+TlxkV/sT3Xao
 /+7JHD2lRuD5QUbxIH25GUQTDy09prRD8tnbnhP+ns/ZXQw5tfyWymXGS
 Dhgx8yMtu7haSOvw+VG30rkfvVSvM5qzHxK2UXaYTsmVwnii+GVZWUdNg Y=;
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
IronPort-SDR: eBVSWwCkVxEqPLtB4mpRfZrFu2X1i8LI80tujYFMHeg1wG8gXdbq7Une7Mv40rtLc9+ksS67x7
 mRJ60mxoppSAEbqhxMlurwk7iQZI6LwNsg3oQVINN6XwI8sGLXdhIcX4Al6Y2kgCG0W1yiBudh
 cdcI1qylvhKp7MgC15znORCY2ie3pShR3k2INonpFMv+fPNnZLwNUHxgBZxLns+uhXWTIDKNM0
 Vgn/+uxxipIGRs5TV9gMtGiSvvankZfqC2fPhlu1GkfzZjIwqzM3P2+1E2CIfI+xI66+S64dsw
 k00=
X-SBRS: 2.7
X-MesageID: 14533050
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,300,1580792400"; d="scan'208";a="14533050"
Date: Tue, 24 Mar 2020 12:24:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200324112444.GJ24458@Air-de-Roger.citrite.net>
References: <20200320190737.42110-1-roger.pau@citrix.com>
 <20200320190737.42110-4-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E5B94@SHSMSX104.ccr.corp.intel.com>
 <20200324095915.GG24458@Air-de-Roger.citrite.net>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7E6084@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D7E6084@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/3] x86/nvmx: update exit bitmap on vmexit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Mar 24, 2020 at 10:16:52AM +0000, Tian, Kevin wrote:
> > From: Roger Pau Monné <roger.pau@citrix.com>
> > Sent: Tuesday, March 24, 2020 5:59 PM
> > 
> > On Tue, Mar 24, 2020 at 06:22:43AM +0000, Tian, Kevin wrote:
> > > > From: Roger Pau Monne <roger.pau@citrix.com>
> > > > Sent: Saturday, March 21, 2020 3:08 AM
> > > >
> > > > Current code in nvmx_update_apicv set the guest interrupt status field
> > > > but doesn't update the exit bitmap, which can cause issues of lost
> > > > interrupts on the L1 hypervisor if vmx_intr_assist gets
> > > > short-circuited by nvmx_intr_intercept returning true.
> > >
> > > Above is not accurate. Currently Xen didn't choose to update the EOI
> > > exit bitmap every time when there is a change. Instead, it chose to
> > > batch the update before resuming to the guest. sort of optimization.
> > > So it is not related to whether SVI is changed. We should always do the
> > > bitmap update in nvmx_update_apicv, regardless of the setting of
> > > Ack-on-exit ...
> > 
> > But if Ack on exit is not set the GUEST_INTR_STATUS won't be changed
> > by nvmx_intr_intercept, and hence there's no need to update the EOI
> > exit map?
> > 
> > If OTOH the GUEST_INTR_STATUS field is changed by vmx_intr_assist the
> > bitmap will already be updated there.
> > 
> 
> If you agree with my comment in patch 2/3 about setting RVI for 
> ack-on-exit=0, then EOI bitmap update should be done there too.

Yes, I agree, see my reply to your comment. I (again) misremembered the
sequence and assumed the switch will happen prior to calling
vmx_intr_assist which is not the case.

Thanks, Roger.

