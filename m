Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA237236BF
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSi4k-0000Ac-Ew; Mon, 20 May 2019 13:11:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=26W0=TU=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hSi4i-0000AX-Hy
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:11:32 +0000
X-Inumbo-ID: c7659b12-7b00-11e9-9820-777c1da5dabc
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7659b12-7b00-11e9-9820-777c1da5dabc;
 Mon, 20 May 2019 13:11:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=SoftFail smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com is inclined to not designate
 23.29.105.83 as permitted sender) identity=mailfrom;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: O/7JI90lNNXIdIwOHqtAGT8BbaXYqW2EFtl9Q+Hv+b50T7MNp03QaXB2uTpL1l2Uyjno0ubQSF
 QvoMhGV21iBKn82pcW2YDqTNq8yHfCL064u2fSBgBhBJM5N6ZIH235wTEtk46ET5Bhm/Pub2di
 GUSNAPYveEcFcgaa2EtimQNlmAY2CYowHMq/BH6IY1dMtwVvn+bYwLCntwyRYYX/FqUjPrrD55
 Ix2IxcZ0qDwgpo2zsuWLublKO5DkxJkWMlt2G3bcaRTkYRxEMtsC0kXf1IXHbQxAVqu9MlDtHP
 P6U=
X-SBRS: 2.7
X-MesageID: 649446
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,491,1549947600"; 
   d="scan'208";a="649446"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23778.42842.751798.290979@mariner.uk.xensource.com>
Date: Mon, 20 May 2019 14:10:50 +0100
To: Jan Beulich <JBeulich@suse.com>, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel
 <xen-devel@lists.xenproject.org>
In-Reply-To: <23778.41705.670026.133324@mariner.uk.xensource.com>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
 <5CE28F0B020000780023090E@prv1-mh.provo.novell.com>
 <23778.41705.670026.133324@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEzNjM4NTog
cmVncmVzc2lvbnMgLSBGQUlMIik6Cj4gWW91IGFyZSByaWdodC4gIEhycnJtLiAgSSB3aWxsIGlu
dmVzdGlnYXRlIGZ1cnRoZXIuCgpUaGlzIHNlZW1zIHRvIGJlIERlYmlhbiBtaXJyb3Igc2tldy4g
IEkgaG9wZSBpdCdzIGFuIGlzb2xhdGVkCmluY2lkZW50LCBvciBJJ2xsIGhhdmUgdG8gY2hhbmdl
IHdoaWNoIERlYmlhbiBtaXJyb3Igd2UgdXNlLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
