Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BF9151743
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 09:55:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iytxU-0005rf-Bj; Tue, 04 Feb 2020 08:53:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KWMX=3Y=amazon.co.uk=prvs=296b502bc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iytxS-0005ra-K6
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 08:53:22 +0000
X-Inumbo-ID: ca8876e6-472b-11ea-8eef-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca8876e6-472b-11ea-8eef-12813bfff9fa;
 Tue, 04 Feb 2020 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580806400; x=1612342400;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/U2Q8GJLPiIxzaLYXoMo+bCmvKFZ3P75JTWU8jElIYQ=;
 b=Vv5ZGwe7+ekIN7z9UThNgzOoyVoVlK6ccLPqu4sHnK3qjLmdHra2uSA1
 yTqsG4KgdBIz4BxVzKVjWISSbdVLBkg/4bqLenCLihXWvJdmfns2BTTmX
 6GWs+Tj8DRPm31tw92TlG7nIS1ufKsBSxBjs/vX3h99HKQqcNTHPotR/L M=;
IronPort-SDR: zQDJ93+LZ4CoYCBBsTYi7gVGnxdKVFMD9muWLqqGbeZHbaksCVhzVBQZEqY46mZCnFqO5fH0TU
 LZWMCIOqtM4Q==
X-IronPort-AV: E=Sophos;i="5.70,398,1574121600"; d="scan'208";a="14665957"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Feb 2020 08:53:19 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 38C78A1CEA; Tue,  4 Feb 2020 08:53:17 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 4 Feb 2020 08:53:17 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 4 Feb 2020 08:53:16 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 4 Feb 2020 08:53:16 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jules <jules@ispire.me>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] XEN Qdisk Ceph rbd support broken?
Thread-Index: AQHV2xvWVyUt4qDRP060HP3Q22xfC6gKueDA
Date: Tue, 4 Feb 2020 08:53:16 +0000
Message-ID: <763e69df40604c51bb72477c706ec24b@EX13D32EUC003.ant.amazon.com>
References: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
In-Reply-To: <AC8105C4-6DAD-4AB0-AC3F-B4CDD151CDEB@ispire.me>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.18]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] XEN Qdisk Ceph rbd support broken?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "oleksandr_grytsov@epam.com" <oleksandr_grytsov@epam.com>,
 "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGUtaHRtbGluZy4uLg0KDQotLS0NCkZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNA
bGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKdWxlcw0KU2VudDogMDMgRmVicnVh
cnkgMjAyMCAxNzozNQ0KVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KQ2M6IG9s
ZWtzYW5kcl9ncnl0c292QGVwYW0uY29tOyB3bEB4ZW4ub3JnDQpTdWJqZWN0OiBbWGVuLWRldmVs
XSBYRU4gUWRpc2sgQ2VwaCByYmQgc3VwcG9ydCBicm9rZW4/DQoNCkhleSwNCg0KSSBkb27igJl0
IGtub3cgaWYgaXQgd2FzIHRoaXMgb3IgYSBwcmV2aW91cyBjaGFuZ2UgaW4gcWRpc2sgZHJpdmVy
LCBidXQgY2FuIGl0IGJlIHRoYXQgcmVtb3RlIENlcGggUkJEIHN1cHBvcnQgaXMgYnJva2VuPw0K
aHR0cHM6Ly9naXRodWIuY29tL3hlbi1wcm9qZWN0L3hlbi9jb21taXQvOGY0ODYzNDRhMDA2NTJl
ZDIwMmFkZTQzYzAyYzk2NzcxODEyYmY4Yw0KDQpSZW1vdGUgbmV0d29yayBDZXBoIGltYWdlIHdv
cmtzIGZpbmUgd2l0aCBYZW4gNC4xMi54IHdpdGggYSBjb25maWcgc3ludGF4IGxpa2UgdGhpczoN
CmRpc2sgPSBbICdmb3JtYXQ9cmF3LCB2ZGV2PXh2ZGExLCBhY2Nlc3M9cncsYmFja2VuZHR5cGU9
cWRpc2ssIHRhcmdldD1yYmQ6PHBvb2wtTmFtZT4vPEltYWdlLU5hbWU+OmlkPTxjZXBoeC1JZD7i
gJggXQ0KDQpJbiBYZW4gNC4xMy4wIHdoaWNoIEkgaGF2ZSB0ZXN0ZWQgcmVjZW50bHkgaXQgYmxh
bWVzIHdpdGggdGhlIGVycm9yIG1lc3NhZ2Ug4oCebm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeeKA
nCBhcyBpdCB3b3VsZCB0cnkgYWNjZXNzaW5nIHRoZSBpbWFnZSBvdmVyIGZpbGVzeXN0ZW0gaW5z
dGVhZCBvZiByZW1vdGUgbmV0d29yayBpbWFnZS4NCi0tLQ0KDQpJIGRvdWJ0IHRoZSBpc3N1ZSBp
cyBpbiB4bC9saWJ4bDsgc291bmRzIG1vcmUgbGlrZWx5IHRvIGJlIGluIFFFTVUuIFRoZSBQViBi
bG9jayBiYWNrZW5kIGluZnJhc3RydWN0dXJlIGluIFFFTVUgd2FzIGNoYW5nZWQgYmV0d2VlbiB0
aGUgNC4xMiBhbmQgNC4xMyByZWxlYXNlcy4gSGF2ZSB5b3UgdHJpZWQgdXNpbmcgYW4gb2xkZXIg
UUVNVSB3aXRoIDQuMTM/DQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
