Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AE109095
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 16:01:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZFpM-0004tw-5j; Mon, 25 Nov 2019 14:59:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Gqts=ZR=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iZFpK-0004tr-3E
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 14:58:58 +0000
X-Inumbo-ID: 1ad23a8a-0f94-11ea-b08b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ad23a8a-0f94-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574693937;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=UzaPySGjon0ORxYLXWTssRosyzlAU1hHFcg6bqnxT2g=;
 b=QjXwD3kwwfUDTT7mJwuW2gjzO2HwI25DeWvNhsuhBEpT1kz9VUhSO0C5
 Izc4xrFxtpsJRGwgBr0Ec7XX9mZvl0LSRSNStqzo/JtGX4NvBBVZzxWZb
 Yz9jSfF7z7korXGfJ/Yzw8NaOtH7zBCFNL9oZHwqnSabp3vObFM9aqC+x 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QrwR+rvunjYQwV27hCTmLoK+7Clq61PnQYySSifUK+jL/aNY6Bo5MmELEDIF2cTtB2C6Ke19wc
 M4DU/4f4TwFIUlH3QSob7U/sq+EIKzVjIJCiMd9O4o5MRpfoAxNQc33u4jHU++gQE8fWeGvyiz
 xjUpV+xbgV2Nlyd6XkPRAllfWSeOmIFDn0AXEqt5osnSDROWqBn1saU5lP9bCEQ7Z8k3d+I/0K
 HWtYcpOLfxDa3zcbKsgvDHtUgOjOmGZ18m0kGKYI6F6ZJNo0XqA/U8kEjIc2Tv/Fn2Zu/qE8oy
 xEM=
X-SBRS: 2.7
X-MesageID: 8800886
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="8800886"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24027.60461.969376.752788@mariner.uk.xensource.com>
Date: Mon, 25 Nov 2019 14:58:53 +0000
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
References: <osstest-144289-mainreport@xen.org>
 <6278a67e-bd65-39d6-0322-32e8e7538457@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [xen-unstable test] 144289: tolerable FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFt4ZW4tdW5zdGFibGUgdGVzdF0g
MTQ0Mjg5OiB0b2xlcmFibGUgRkFJTCIpOgo+IE9uIDI1LjExLjIwMTkgMTQ6NTgsIG9zc3Rlc3Qg
c2VydmljZSBvd25lciB3cm90ZToKLi4uCj4gPiAgdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2aXJ0LXhz
bSAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgICBmYWlsIHBhc3MgaW4gMTQ0MjgzCj4gCj4g
T3RoZXIgdGhhbiB0aGUgc2hlbGwgcHJvbXB0IG5vdCBhcHBlYXJpbmcsIEkgY2FuJ3Qgc2VlIGFu
eQo+IGluZGljYXRpb24gb2Ygd2hhdCBtYXkgaGF2ZSBnb25lIHdyb25nIGhlcmUgZm9yIHdoaWNo
IHJlYXNvbi4KClRoZSBsYXN0IG1lc3NhZ2UgcHJpbnRlZCB3YXMKICByYW5kb206IGNybmcgaW5p
dCBkb25lCgpUaGlzIHNlZW1lZCBmYW1pbGlhci4gIFNlYXJjaGluZyBteSBlbWFpbCBmb3VuZAoK
ICBvc3N0ZXN0IHNlcnZpY2Ugb3duZXIgd3JpdGVzICgiW29zc3Rlc3QgdGVzdF0gMTQzNDkzOiBy
ZWdyZXNzaW9ucyAtIEZBSUwiKToKICA+IGZsaWdodCAxNDM0OTMgb3NzdGVzdCByZWFsIFtyZWFs
XQogID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0
MzQ5My8KICA+IAogID4gUmVncmVzc2lvbnMgOi0oCiAgPiAKICA+IFRlc3RzIHdoaWNoIGRpZCBu
b3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAogID4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNv
dWxkIG5vdCBiZSBydW46CiAgPiAgdGVzdC1hbWQ2NC1hbWQ2NC1wYWlyICAgICAgICAxMCB4ZW4t
Ym9vdC9zcmNfaG9zdCAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTQzMzkyCgogIEkgZG9uJ3Qga25v
dyB3aGF0IHRoaXMgaXMuICBMaW51eCBmYWlscyB0byBib290IHVuZGVyIFhlbi4gIFRoZSBsYXN0
CiAgbWVzc2FnZSBpcwogICAgcmFuZG9tOiBjcm5nIGluaXQgZG9uZQogIEJ1dCBpdCBkb2Vzbid0
IHNlZW0gYXQgYWxsIHByb2JhYmxlIHRoYXQgdGhpcyBpcyBhbnl0aGluZyB0byBkbwogIHdpdGgg
b3NzdGVzdC4KClRoYXQgd2FzIHdpdGggZGViaW5hMS4KClNvIGVpdGhlciBib3RoIHRoZXNlIGhv
c3RzIGhhdmUgYSBzaW1pbGFyIGhhcmR3YXJlIGZhdWx0LCBvciB0aGVyZSBpcwpzb21ldGhpbmcg
ZWxzZSB3cm9uZy4KCkkgbG9va2VkIGF0IHRoZSBuZXh0IHRlc3QgdGhhdCByYW4gb24gZGViaW5h
MCBhZnRlciB0aGUgZmFpbHVyZSBhYm92ZSwKaWUKICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5w
cm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQ0Mjg5L3Rlc3QtYW1kNjQtYW1kNjQtaTM4Ni1wdmdy
dWIvaW5mby5odG1sCgpJdCBwcmludHMgdGhpczoKCiAgTm92IDI1IDA4OjUxOjExLjgwODA4NiBb
ICAgMTAuMDMwMDg5XSByYW5kb206IGNybmcgaW5pdCBkb25lCiAgTm92IDI1IDA4OjUxOjExLjgy
MDA4MSBbICAgMTAuMDMwMDkwXSByYW5kb206IDcgdXJhbmRvbSB3YXJuaW5nKHMpIG1pc3NlZCBk
dWUgdG8gcmF0ZWxpbWl0aW5nCiAgTm92IDI1IDA4OjUxOjExLjgyMDA5MSBbICAgMTAuMDQwMDA3
XSBSQVBMIFBNVTogQVBJIHVuaXQgaXMgMl4tMzIgSm91bGVzLCA0IGZpeGVkIGNvdW50ZXJzLCA2
NTUzNjAgbXMgb3ZmbCB0aW1lcgogIE5vdiAyNSAwODo1MToxMS44MzIwNzkgWyAgIDEwLjA0Nzky
M10gUkFQTCBQTVU6IGh3IHVuaXQgb2YgZG9tYWluIHBwMC1jb3JlIDJeLTE0IEpvdWxlcwogIE5v
diAyNSAwODo1MToxMS44MzIwODkgWyAgIDEwLjA1MzY2M10gUkFQTCBQTVU6IGh3IHVuaXQgb2Yg
ZG9tYWluIHBhY2thZ2UgMl4tMTQgSm91bGVzCiAgTm92IDI1IDA4OjUxOjExLjg0NDA4NCBbICAg
MTAuMDU5MzIxXSBSQVBMIFBNVTogaHcgdW5pdCBvZiBkb21haW4gZHJhbSAyXi0xNCBKb3VsZXMK
ICBOb3YgMjUgMDg6NTE6MTEuODQ0MDk0IFsgICAxMC4wNjQ3MTJdIFJBUEwgUE1VOiBodyB1bml0
IG9mIGRvbWFpbiBwcDEtZ3B1IDJeLTE0IEpvdWxlcwogIE5vdiAyNSAwODo1MToxMS44NTYwNDUg
WyAgIDEwLjEyODg0Nl0gaW9hdGRtYTogSW50ZWwoUikgUXVpY2tEYXRhCiAgVGVjaG5vbG9neSBE
cml2ZXIgNC4wMAoKSSB0aGluayBJIGhhdmUgc2VlbiB0aGF0IG1lc3NhZ2UgYWJvdXQgIndhcm5p
bmcocykgbWlzc2VkIiBiZWZvcmUuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
