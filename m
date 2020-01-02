Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5B12E93C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2020 18:22:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1in47C-0005sV-CS; Thu, 02 Jan 2020 17:18:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h/dY=2X=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1in47A-0005sQ-1E
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2020 17:18:28 +0000
X-Inumbo-ID: e2621ed6-2d83-11ea-a3a1-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2621ed6-2d83-11ea-a3a1-12813bfff9fa;
 Thu, 02 Jan 2020 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577985507;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=cwBlIAm36RHoWuAH7T5/kUbGH1ZgNHQWI2tQ2JDtmyE=;
 b=NdfvLur3e0WhQiaXVq1slGAONZr8zWJk4se3zvKgbqTcR5QV4Y9l6sOh
 dRHaTq6ACCdvSJBlSA2kQxIylTIG422tRPqKqTLbLqo8lqF+lnjI/hK+N
 rtOkCfBhIFIEStvP/pVS81VWZsbvA/Imgqrv6l3P8l4EAZQNLLUoFME/X g=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: gWt+MvLRbRFlfagg3U83AHhBI+6akFuT6Dziqt+wDSYcDUklnBpHUg3dj2Odq2PdrOptto7laG
 DDLESrYBFsjdR+FcM6d5IsVzQLXp3hiRo7Co7vgZIMGA0ILYJsJ3DM3wiECLIsyJWYKeZ2ydWI
 SX91U7s574Retr8kMh8/8QUX72yazoAQgezhfICu3fqOK+KIkObCMiRRlgfdOVhGT1y84lUN2x
 lflliNw1TV3MgRE/j0uhfEWzaJOMku+F7IQPfKL9SdJOSg8Y8OatC0rNwlOlT9C0Zwy7SJSzXV
 ZZM=
X-SBRS: 2.7
X-MesageID: 10376135
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,387,1571716800"; d="scan'208";a="10376135"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24078.9695.480192.95139@mariner.uk.xensource.com>
Date: Thu, 2 Jan 2020 17:18:23 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20191224130416.3570-2-pdurrant@amazon.com>
References: <20191224130416.3570-1-pdurrant@amazon.com>
 <20191224130416.3570-2-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 1/6] libxl: add definition of INVALID_DOMID
 to the API
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCAxLzZdIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBv
ZiBJTlZBTElEX0RPTUlEIHRvIHRoZSBBUEkiKToKPiBDdXJyZW50bHkgYm90aCB4bCBhbmQgbGli
eGwgaGF2ZSBpbnRlcm5hbCBkZWZpbml0aW9ucyBvZiBJTlZBTElEX0RPTUlECj4gd2hpY2ggaGFw
cGVuIHRvIGJlIGlkZW50aWNhbC4gSG93ZXZlciwgZm9yIHRoZSBwdXJwb3NlcyBvZiBkZXNjcmli
aW5nIHRoZQo+IGJlaGF2aW91ciBvZiBsaWJ4bF9kb21haW5fY3JlYXRlX25ldy9yZXN0b3JlKCkg
aXQgaXMgdXNlZnVsIHRvIGhhdmUgYQo+IHNwZWNpZmllZCBpbnZhbGlkIHZhbHVlIGZvciBhIGRv
bWFpbiBpZC4KPiAKPiBUaGlzIHBhdGNoIHRoZXJlZm9yZSBtb3ZlcyB0aGUgbGlieGwgZGVmaW5p
dGlvbiBmcm9tIGxpYnhsX2ludGVybmFsLmggdG8KPiBsaWJ4bC5oIGFuZCByZW1vdmVzIHRoZSBp
bnRlcm5hbCBkZWZpbml0aW9uIGZyb20geGxfdXRpbHMuaC4gVGhlIGhhcmRjb2RlZAo+ICctMScg
cGFzc2VkIGJhY2sgdmlhIGRvbWNyZWF0ZV9jb21wbGV0ZSgpIGlzIHRoZW4gdXBkYXRlZCB0byBJ
TlZBTElEX0RPTUlECj4gYW5kIGNvbW1lbnQgYWJvdmUgbGlieGxfZG9tYWluX2NyZWF0ZV9uZXcv
cmVzdG9yZSgpIGlzIGFjY29yZGluZ2x5Cj4gbW9kaWZpZWQuCgpBY2tlZC1ieTogSWFuIEphY2tz
b24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
