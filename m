Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D97191865
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 19:04:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGnsI-0003Lb-4I; Tue, 24 Mar 2020 18:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AAjM=5J=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jGnsG-0003LW-IP
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 18:02:00 +0000
X-Inumbo-ID: 8db1ec26-6df9-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8db1ec26-6df9-11ea-a6c1-bc764e2007e4;
 Tue, 24 Mar 2020 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1585072919;
 h=from:to:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=6Q6r4C5aEKATeFMIVeaRH10njbEeWvkNHgouNUQLh5g=;
 b=AXhQxeebZxDdLH85LUGSRBDxfKiWZLsaZ30vKM80HS/4yWiGdrQQr53n
 jl3Y1St/EV1FXQPxE07pDDkJDTlgipLAFGT1isNJMOpszEGPXZkFyPnZw
 TVOU1GaQaNYZaBkJXQMuWtzZOywgR2Ef+QfumnyfGS6Sbi3yp2vKInHFi Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +p2cJHrhZVH7jlieuYD5B4iiytcXcu/tuuGQUaH7WYo64m0tO2kMADE/ctJBuK98IwmM86jEDG
 hh/mXHchKnAAtUOSu/dEj5+t5wNKY6mhoos3G713XK55Tn3FIsQzyZn8HrTiYdSENviKQZi4Q7
 xED9wpan04lVJlZRNv7X8rc8bHU791KMUu5T0YjMPkRyaiip2c3bs99US7G0FJgxKZUrfy0q6y
 Tg9wM5KqhgsT35Bsn6x38hozeKTZWIiTxNxXIbuM5mr7QqMFSUc3K74HHNKOIrummKctawz+f5
 k/c=
X-SBRS: 2.7
X-MesageID: 14561727
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,301,1580792400"; d="scan'208";a="14561727"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
 "xen-announce@lists.xenproject.org" <xen-announce@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>
Thread-Topic: Moving Forward on XenSummit
Thread-Index: AQHWAgZNgs81Wz+2+E2VU2a6By3/lg==
Date: Tue, 24 Mar 2020 18:01:54 +0000
Message-ID: <E8383000-6BA6-46A2-AD3C-0B6607CB8107@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.60.0.2.5)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0074C8269B7A646BBD5B3C3B09517E2@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: [Xen-devel] Moving Forward on XenSummit
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SSB3YW50ZWQgdG8gbGV0IGV2ZXJ5b25lIGtub3cgdGhhdCB0aGUgWGVuUHJvamVjdCBpcyBtb3Zp
bmcgZm9yd2FyZCB3aXRoIHBsYW5zIHRvIGhvbGQgWGVuU3VtbWl0IHRoaXMgeWVhciwgb25lIHdh
eSBvciBhbm90aGVyLg0KDQpUaGVyZSBhcmUgdHdvIGJhc2ljIGFwcHJvYWNoZXMgdGhlIEFkdmlz
b3J5IEJvYXJkIGhhcyBiZWVuIGNvbnNpZGVyaW5nOiAgUG9zdHBvbmluZyB0aGUgZXZlbiB1bnRp
bCBsYXRlciBpbiB0aGUgeWVhciwgb3IgaG9sZGluZyBhIHZpcnR1YWwgZXZlbnQgZHVyaW5nIHRo
ZSBzYW1lIHRpbWVmcmFtZS4gIEFkZGl0aW9uYWxseSwgaWYgd2UgaG9sZCBhIHZpcnR1YWwgZXZl
bnQgZHVyaW5nIHRoZSBzYW1lIHRpbWVmcmFtZSwgdGhlIEJvYXJkIHdhbnRzIHRvIGtlZXAgdGhl
IG9wdGlvbiBvcGVuIG9mIGhhdmluZyBhIHNtYWxsZXIsIGluLXBlcnNvbiBldmVudCBsYXRlciBp
biB0aGUgeWVhciwgaWYgY2lyY3Vtc3RhbmNlcyBwZXJtaXQuDQoNCkJlY2F1c2UgdGhlIFVuaXZl
cnNpdHkgb2YgQnVjaGFyZXN0IGhhcyBiZWVuIHZlcnkgZmxleGlibGUsIHRoZXJlIGlzIG5vIHJ1
c2ggdG8gbWFrZSBhIGRlY2lzaW9uLiAgQXMgYSByZXN1bHQsIHRoZSBBZHZpc29yeSBCb2FyZCBo
YXMgcmVjb21tZW5kZWQgdGhhdCB3ZSBzcGVuZCB0aW1lIGxvb2tpbmcgaW50byB0aGUgb3B0aW9u
cyBpbiBkZXRhaWwsIGFuZCBtYWtlIGEgZmluYWwgZGVjaXNpb24gYXJvdW5kIG1pZC1BcHJpbCwg
NiB3ZWVrcyBiZWZvcmUgdGhlIG9yaWdpbmFsbHkgc2NoZWR1bGVkIGV2ZW50Lg0KDQooQXMgYSBz
aWRlIGVmZmVjdCwgdGhlIGV2ZW50IHdlYnBhZ2Ugd2lsbCBoYXZlIGRhdGVzIGFuZCBwbGFjZXMg
Zm9yIHRoZSBzY2hlZHVsZSBhcyB0aG91Z2ggd2Ugd2VyZSBzdGlsbCBob2xkaW5nIHRoZSBldmVu
dCBpbiBCdWNoYXJlc3QuICBUaGVzZSB3aWxsIGJlIHVwZGF0ZWQgd2hlbiB3ZSBrbm93IHdoYXQg
d2XigJlyZSBwbGFubmluZyB0byBkbyBpbnN0ZWFkLikNCg0KIyBQaHlzaWNhbCBhbmQgVmlydHVh
bA0KDQpUaGUgWGVuU3VtbWl0IGlzIGFuIGltcG9ydGFudCBldmVudCBmb3Igb3VyIGNvbW11bml0
eS4gIFNvbWUgdmlzaWJsZSB0aGluZ3MgdGhhdCBoYXBwZW4gaW5jbHVkZToNCg0KKiBUbyBhbGxv
dyBtZW1iZXJzIG9mIHRoZSBjb21tdW5pdHkgdG8gY29tbXVuaWNhdGUgdG8gZXZlcnlvbmUgZWxz
ZSB3aGF0IHRoZXkndmUgYmVlbiB3b3JraW5nIG9uIGluIHRoZSBwcmV2aW91cyB5ZWFyLCBhbmQg
d2hhdCB0aGV5IHBsYW4gdG8gd29yayBvbiBpbiB0aGUgZnV0dXJlDQoNCiogVG8gYWxsb3cgcGVv
cGxlIHRvIGhhc2ggb3V0IHRlY2huaWNhbCBpc3N1ZXMgaW4gZGVzaWduIHNlc3Npb25zDQoNCkp1
c3QgYXMgY3JpdGljYWwsIHRoZSBYZW5TdW1taXQgYWxsb3dzIGFuIGlubnVtZXJhYmxlIG51bWJl
ciBvZiBzbWFsbCAiaGFsbHdheS10cmFjayIgY29udmVyc2F0aW9ucywgYXMgd2VsbCBhcyBwbGFp
biBzb2NpYWwgaW50ZXJhY3Rpb24gLS0gZmlsbGluZyBvdXQgZW1haWwgYWRkcmVzc2VzIHdpdGgg
ZmFjZXMgYW5kIHBlcnNvbmFsaXRpZXMsIGFsbG93aW5nIHRoZSBjb21tdW5pdHkgdG8gcnVuIG11
Y2ggbW9yZSBzbW9vdGhseSBkdXJpbmcgdGhlIHJlc3Qgb2YgdGhlIHllYXIuDQoNCkl0IGlzIHZl
cnkgY2xlYXIgdGhhdCBob2xkaW5nIGEgdmlydHVhbCBldmVudCB3aWxsIG5vdCBiZSBuZWFybHkg
YXMgZWZmZWN0aXZlIGF0IHRob3NlIHRoaW5ncyBhcyBhbiBpbi1wZXJzb24gZXZlbnQuICBIb3dl
dmVyLCBnaXZlbiB0aGUgY3VycmVudCB1bmNlcnRhaW50eSwgaXQncyBub3QgY2xlYXIgdGhhdCB0
aGUgd29ybGQgd2lsbCBiZSByZWFkeSBmb3IgdHJhdmVsIGxhdGVyIGluIHRoZSBGYWxsIGVpdGhl
ci4gIEFuZCBpZiBpdCB3ZXJlLCB0aGVyZSdzIGEgcmlzayB0aGF0IG1hbnkgc3VjaCBwb3N0cG9u
ZWQgZXZlbnQgd2lsbCBjb2xsaWRlIHdpdGggb3RoZXIgcG9zdHBvbmVkIGV2ZW50cywgcmVkdWNp
bmcgYXR0ZW5kYW5jZS4gIEFkZGl0aW9uYWxseSwgd2Ugd291bGQgbmVlZCB0byBlaXRoZXIgY29v
cmRpbmF0ZSB3aXRoIHRoZSBVbml2ZXJzaXR5IHRlcm0gdGltZSwgb3IgZmluZCBhbm90aGVyIHZl
bnVlLCB3aGljaCBjb3VsZCBiZSBtdWNoIG1vcmUgZXhwZW5zaXZlLg0KDQpIYXZpbmcgYSB2aXJ0
dWFsIFN1bW1pdCBpcyBtdWNoIGJldHRlciB0aGFuIGhhdmluZyBubyBYZW5TdW1taXQgYXQgYWxs
LiAgU28gdGhlIGRlY2lzaW9uIHRvIGJlIG1hZGUgd2lsbCBiZSB0byB3ZWlnaCB0aGUgbG93ZXIg
ZWZmZWN0aXZlbmVzcyBvZiBoYXZpbmcgYSB2aXJ0dWFsIFN1bW1pdCBhZ2FpbnN0IHRoZSByaXNr
IHRoYXQgYSBwb3N0cG9uZWQgZXZlbnQgd2lsbCB0dXJuIG91dCBub3QgdG8gYmUgcG9zc2libGUu
DQoNCkluIHRoZSBtZWFuIHRpbWUsIHdlIGFyZSBicmFpbnN0b3JtaW5nIHdheXMgdG8gdHJ5IHRv
IGdldCBhcyBtdWNoIG9mIHRoZSBiZW5lZml0cyBvZiBhbiBpbi1wZXJzb24gc3VtbWl0IGFzIHBv
c3NpYmxlLiAgSWYgeW91IGhhdmUgYW55IHRob3VnaHRzIG9yIGNvbmNyZXRlIHN1Z2dlc3Rpb25z
IGFsb25nIHRoZXNlIGxpbmVzIC0tIGluIHBhcnRpY3VsYXIsIHRoaW5ncyB0aGF0IGhhdmUgYmVl
biB0cmllZCBhbmQgd29ya2VkIHdlbGwgb3IgcG9vcmx5IGluIG90aGVyIHZpcnR1YWwgZXZlbnRz
IHRoYXQgeW91J3ZlIHBhcnRpY2lwYXRlZCBpbiAtLSB0aGVuIHBsZWFzZSBsZXQgdXMga25vdy4N
Cg0KVG8gYmUgY2xlYXIsIHRoZXJlIGlzIG5vIHRob3VnaHQgb2YgY29udGludWluZyB0byBob2xk
IHZpcnR1YWwgZXZlbnRzIGFmdGVyIHRoZSBjdXJyZW50IHBhbmRlbWljIGhhcyBwYXNzZWQuICBX
ZSBmdWxseSBleHBlY3QgdG8gaGF2ZSBhbiBpbi1wZXJzb24gZXZlbnQgaW4gMjAyMS4NCg0KQXMg
YWx3YXlzLCBpZiB5b3UgaGF2ZSBhbnkgdGhvdWdodHMgb3Igc3VnZ2VzdGlvbnMsIHBsZWFzZSBm
ZWVsIGZyZWUgdG8gc2hhcmUgdGhlbSB3aXRoIG1lLg0KDQpTdGF5IHNhZmUgZXZlcnlvbmUsIGFu
ZCBsb29rIGZvcndhcmQgdG8gc2VlaW5nIHlvdSBhbGwgaW4gcGVyc29uIHdoZW4gdGhpbmdzIGhh
dmUgcmV0dXJuZWQgdG8gbm9ybWFsLg0KDQogLUdlb3JnZSBEdW5sYXA=

