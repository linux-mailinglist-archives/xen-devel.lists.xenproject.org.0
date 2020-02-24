Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501DE16AD99
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 18:35:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Haa-0002kF-Br; Mon, 24 Feb 2020 17:32:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gH7p=4M=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j6HaY-0002kA-K8
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 17:32:14 +0000
X-Inumbo-ID: 984007ac-572b-11ea-9225-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 984007ac-572b-11ea-9225-12813bfff9fa;
 Mon, 24 Feb 2020 17:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582565534;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=zbI6hN5u9ATlkXWCp+48AHuFzcjVQFIsbH4fdwfOOc8=;
 b=Bu2oL/j9bK9RINf/UC9tTLhfdxuevI/pchtU2E0Oe5+aMyHLuGO/h6SR
 fybzcfFSvhBHwDYG0VMCwUyxOxzF3Wiye6S3wUbYcSpY5XvDcGVI3BdwJ
 Q4S5ev8rV6ZqvnHHRJWs6sNLj16iL0ah/54wVFGidrobtSBH/htfQzK4z Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LGxwpyBBGxu0hQhK649PmPZKt0/XKjPLbMTPYr03Wtll98e7+J8Iky42GCNgmRJnTr94o+TxgP
 ckXVooLJI6fizoDppdzviLyn3H1+yv2yRei9oyI887EB0euOoIZUoWT1CM9oTRdRr44Gc/Td0Q
 Sny28CES1/42W5NvkGSX9MeTSLVIminoWEblqsphgp/GQsgOrm+J8L7OZ1R11xo+dS/x5qFE/x
 UwYDEMw5fWclChVSrEHfhAZPa/FbpJVmkJyRvK2AgsQMJtVcmlTJ5vhc4MfBSD4TO3KxitUGtD
 siQ=
X-SBRS: 2.7
X-MesageID: 13354372
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,480,1574139600"; d="scan'208";a="13354372"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24148.2202.912512.939428@mariner.uk.xensource.com>
Date: Mon, 24 Feb 2020 17:32:10 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20200127143444.25538-8-andrew.cooper3@citrix.com>
References: <20200127143444.25538-1-andrew.cooper3@citrix.com>
 <20200127143444.25538-8-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH v2 07/17] libxc/restore: STATIC_DATA_END
 inference for v2 compatibility
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggdjIgMDcvMTddIGxpYnhjL3Jlc3RvcmU6IFNU
QVRJQ19EQVRBX0VORCBpbmZlcmVuY2UgZm9yIHYyIGNvbXBhdGliaWxpdHkiKToKPiBBIHYzIHN0
cmVhbSBjYW4gY29tcGF0aWJseSByZWFkIGEgdjIgc3RyZWFtIGJ5IGluZmVycmluZyB0aGUgcG9z
aXRpb24gb2YgdGhlCj4gU1RBVElDX0RBVEFfRU5EIHJlY29yZC4KPiAKPiB2MiBjb21wYXRpYmls
aXR5IGlzIG9ubHkgbmVlZGVkIGZvciB4ODYuICBObyBvdGhlciBhcmNoaXRlY3R1cmVzIGV4aXN0
IHlldCwKPiBidXQgdGhleSB3aWxsIGhhdmUgYSBtaW5pbXVtIG9mIHYzIHdoZW4gaW50cm9kdWNl
ZC4KPiAKPiBUaGUgeDg2IEhWTSBjb21wYXRpYmlsaXR5IHBvaW50IGJlaW5nIGluIGhhbmRsZV9w
YWdlX2RhdGEoKSAod2hpY2ggaXMgY29tbW9uCj4gY29kZSkgaXMgYSBiaXQgYXdrd2FyZC4gIEhv
d2V2ZXIsIGFzIHRoZSB0d28gY29tcGF0aWJpbGl0eSBwb2ludHMgYXJlIHN1YnRseQo+IGRpZmZl
cmVudCwgYW5kIGl0IGlzIChpbnRlbnRpb25hbGx5KSBub3QgcG9zc2libGUgdG8gY2FsbCBpbnRv
IGFyY2ggc3BlY2lmaWMKPiBjb2RlIGZyb20gY29tbW9uIGNvZGUgKGV4Y2VwdCB2aWEgdGhlIG9w
cyBob29rcyksIHVzZSBzb21lICNpZmRlZi1hcnkgYW5kCj4gb3BlbmNvZGUgdGhlIGNoZWNrLCBy
YXRoZXIgdGhhbiBtYWtlIGhhbmRsZV9wYWdlX2RhdGEoKSBhIHBlci1hcmNoIGhlbHBlci4KLi4u
Cj4gKyNpZiBkZWZpbmVkKF9faTM4Nl9fKSB8fCBkZWZpbmVkKF9feDg2XzY0X18pCj4gKyAgICAv
KiB2MiBjb21wYXQuICBJbmZlciB0aGUgcG9zaXRpb24gb2YgU1RBVElDX0RBVEFfRU5ELiAqLwo+
ICsgICAgaWYgKCBjdHgtPnJlc3RvcmUuZm9ybWF0X3ZlcnNpb24gPCAzICYmICFjdHgtPnJlc3Rv
cmUuc2Vlbl9zdGF0aWNfZGF0YV9lbmQgKQo+ICsgICAgewo+ICsgICAgICAgIHJjID0gaGFuZGxl
X3N0YXRpY19kYXRhX2VuZChjdHgpOwo+ICsgICAgICAgIGlmICggcmMgKQoKVGhlc2UgMTcgbGlu
ZXMgYXBwZWFycyB0d2ljZSwgaW4gYmFzaWNhbGx5IGlkZW50aWNhbCBmb3JtLiAgQ291bGQgaXQK
YmUgcmVmYWN0b3JlZCA/CgpUaGFua3MsCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
