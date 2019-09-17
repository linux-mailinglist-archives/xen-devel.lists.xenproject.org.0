Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73474B5375
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 18:55:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAGjp-0000kY-BG; Tue, 17 Sep 2019 16:54:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T7El=XM=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iAGjn-0000kM-RM
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 16:53:59 +0000
X-Inumbo-ID: be048c62-d96b-11e9-961b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be048c62-d96b-11e9-961b-12813bfff9fa;
 Tue, 17 Sep 2019 16:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568739238;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:subject:in-reply-to:references;
 bh=rv4ytriEoyB48hwOj0+mtNxPVC0XXLV8qtIRI1bG0BU=;
 b=QD4gt4XJsA0/WN87+wVtyj4sSTaE8i/6+QhcwiBcbTGavKViwxWmRvKl
 QEAacgAlDpS9RHkwS7+/b0nxRLxTtYqe8P6Ix2VFxqltdH3l2429B08Jo
 9+pzeZQFrPD1aKv23yaQlFEjAG3yoWJffb+IXfIU7rVz1DiLEkra5rqd3 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fSBt2mFk0E+1Ce51xhYPuJnFN2jh97ymYTLaWznuZkMd9KpIfuzRTEPUdhwNlRrZGvB4bAxHRi
 dF3eX7qw0r5AbLl1vIEmHcxwvVnEMNrpwxPIfd9uWvmm2Ab0ZXkh8BXZV69KmjkfcjwKWFRMep
 bcQ6drWGPVvEXhDFr1EbbBPSNqWXLnN8g3TNXlwkK0J2BQagHSBUflJMyvJPPG1DURd11wPtAq
 /mxjlhxRHR3azoLxRFY2b/sf3eV+L8az2c4/52N/v7rm/uSspSOdGl53Ig5yMLjBdVk1/3M0cY
 W04=
X-SBRS: 2.7
X-MesageID: 5885632
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,517,1559534400"; 
   d="scan'208";a="5885632"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23937.4003.955037.873481@mariner.uk.xensource.com>
Date: Tue, 17 Sep 2019 17:53:55 +0100
To: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu
 <wl@xen.org>
In-Reply-To: <23937.3912.874830.653579@mariner.uk.xensource.com>
References: <20190802153606.32061-1-anthony.perard@citrix.com>
 <20190802153606.32061-7-anthony.perard@citrix.com>
 <23937.3912.874830.653579@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 06/35] libxl: Use ev_qmp for
 switch_qemu_xen_logdirty
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

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtQQVRDSCAwNi8zNV0gbGlieGw6IFVzZSBldl9xbXAg
Zm9yIHN3aXRjaF9xZW11X3hlbl9sb2dkaXJ0eSIpOgo+IEFudGhvbnkgUEVSQVJEIHdyaXRlcyAo
IltQQVRDSCAwNi8zNV0gbGlieGw6IFVzZSBldl9xbXAgZm9yIHN3aXRjaF9xZW11X3hlbl9sb2dk
aXJ0eSIpOgo+ID4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+Cj4gLi4uCj4gPiArICAgIHJjID0gbGlieGxfX2V2X3RpbWVfcmVnaXN0ZXJf
cmVsKGFvLCAmbGRzLT50aW1lb3V0LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzd2l0Y2hfbG9nZGlydHlfdGltZW91dCwgMTAgKiAxMDAwKTsKPiA+ICsgICAgaWYg
KHJjKSBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgcW1wLT5hbyA9IGFvOwo+ID4gKyAgICBxbXAt
PmRvbWlkID0gZG9taWQ7Cj4gPiArICAgIHFtcC0+cGF5bG9hZF9mZCA9IC0xOwo+ID4gKyAgICBx
bXAtPmNhbGxiYWNrID0gc3dpdGNoX3FlbXVfeGVuX2xvZ2RpcnR5X2RvbmU7Cj4gPiArICAgIGxp
YnhsX19xbXBfcGFyYW1fYWRkX2Jvb2woZ2MsICZhcmdzLCAiZW5hYmxlIiwgZW5hYmxlKTsKPiA+
ICsgICAgcmMgPSBsaWJ4bF9fZXZfcW1wX3NlbmQoZ2MsIHFtcCwgInhlbi1zZXQtZ2xvYmFsLWRp
cnR5LWxvZyIsIGFyZ3MpOwo+IAo+IEkgaGF0ZSB0byBzdWdnZXN0IHRoaXMgYXQgdGhpcyBzdGFn
ZSwgYnV0OiBtYXliZSB0aGUgdGltZW91dCBjb3VsZCBiZQo+IGluY29ycG9yYXRlZCBpbnRvIGxp
YnhsX19ldl9xbXAgPwo+IAo+IEkgdGhpbmsgZXZlcnkgbGlieGxfX3FtcCBjYWxsZXIgaXMgZ29p
bmcgdG8gbmVlZCBhIHRpbWVvdXQgPwoKSSBzaG91bGQgc2F5IHRoYXQgYXBhcnQgZnJvbSB0aGlz
IHF1ZXN0aW9uLCB0aGUgcGF0Y2ggaXMgZmluZS4KCkkgd2lsbCBub3QgcmVwZWF0IHRoaXMgcG9p
bnQgaW4gbXkgcmV2aWV3IG9mIGZ1cnRoZXIgcGF0Y2hlcyBpbiB0aGlzCnNlcmllcy4gIElmIHdl
IGFkZCBhIHRpbWVvdXQgcGFyYW1ldGVyIHRvIHRoZSBxbXAgY2FsbHMsIHRoZXkgd2lsbCBhbGwK
bmVlZCB0byBiZSB1cGRhdGVkIGJ1dCB0aGUgY29tcGlsZXIgc2hvdWxkIGNhdGNoIGl0LgoKVGhh
bmtzLApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
