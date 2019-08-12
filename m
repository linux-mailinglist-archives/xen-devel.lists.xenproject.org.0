Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8698B062
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 09:00:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQje-0004RF-CA; Tue, 13 Aug 2019 06:56:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yyd=WJ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hxQjc-0004Ql-Tx
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:56:44 +0000
X-Inumbo-ID: 6fe6628c-bcf4-11e9-a0b6-a381ade4f6fb
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fe6628c-bcf4-11e9-a0b6-a381ade4f6fb;
 Mon, 12 Aug 2019 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565609365;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=zIwNXBc34ws2qEhCEaMdOo6mlmRWkS3mGz3V0P2bmjE=;
 b=bfK9nwYOkl+Eb5sQYaAkUd098hqQpgyosmeU9Bc/zUu9peXGmGe+jsbD
 JrMuZL0AvQ2hD1J4rTb3GS1QrecXCprrk7mQj706WUc4UTH2FNbnnr5Cc
 89hQ3uxTFkAZ89SIxSbtKLbr4RBkeSOEpSLM8TvaVsc894ZWQP/OnLA7D I=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: uHmhQfxxrQTiYjvhGod3WTTH6X3oooqUpSBzCQjygYBIxv119VUjKSVicTc063i+wxqfcdM/Yp
 YhFozkCGLbHvXdLro63uyCYAGHxz9h1VWMzhQB3UVmkI9oAgpSUfZFyu0lXK4xEj1bU0/vVVmn
 e41+5jN/+ezhdFJjR6KRwdfsnqptQQuMIyG6uMeKjMa1KAhO4z16WT+PEw4h5Fgt9xDf59Bg0e
 g2MLEi500rjNwDqrQSUOfu1VkHir/LcV4Y4DXqwroEOrkzm3gFfpspdwa1uOBRN50PzgDvZavz
 AvY=
X-SBRS: 2.7
X-MesageID: 4319102
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4319102"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Thread-Topic: [ANNOUNCE] Xen Project Developer Summit 2019: Slides, Recordings
 and Design Session notes are available
Thread-Index: AQHVUQEvbZ8CJ7hGJUuq40gnqIXBPg==
Date: Mon, 12 Aug 2019 11:29:21 +0000
Message-ID: <89A0DF85-4ED4-4F98-80D7-FD2E6E7CC6D5@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <B615FD2E5B3EBE44A640D0E3CE18207B@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Xen Project Developer Summit 2019: Slides,
 Recordings and Design Session notes are available
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

RGVhciBDb21tdW5pdHkgbWVtYmVyLA0KDQppZiB5b3UgZGlkbuKAmXQgbWFrZSBpdCB0byB0aGUg
ZGV2ZWxvcGVyIHN1bW1pdCwgeW91IGNhbiBmaW5kIG1hdGVyaWFsIHJlbGF0ZWQgdG8gdGhlIHN1
bW1pdCBpbiB0aGUgZm9sbG93aW5nIGxvY2F0aW9ucw0KDQpTbGlkZXM6IA0KaHR0cHM6Ly93d3cu
c2xpZGVzaGFyZS5uZXQvc2VhcmNoL3NsaWRlc2hvdz9zZWFyY2hmcm9tPWhlYWRlciZxPVhQRERT
MTkNCg0KWW91VHViZSBwbGF5bGlzdCBvZiByZWNvcmRpbmdzDQpodHRwczovL3d3dy55b3V0dWJl
LmNvbS91c2VyL1hlblByb2plY3RTb2Z0d2FyZS9wbGF5bGlzdHMNCg0KRGVzaWduIFNlc3Npb24g
ZGVzY3JpcHRpb25zIGFuZCBub3RlcyAoc29tZSBhcmUgc3RpbGwgbWlzc2luZykNCmh0dHBzOi8v
d2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0Rlc2lnbl9TZXNzaW9uc18yMDE5DQoNCkJlc3QgUmVn
YXJkcw0KTGFycw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
