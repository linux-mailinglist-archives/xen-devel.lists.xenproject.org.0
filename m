Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C6CBFFD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:03:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQ0I-0007Jo-7v; Fri, 04 Oct 2019 16:00:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lQ+Z=X5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iGQ0G-0007Jf-SG
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:00:24 +0000
X-Inumbo-ID: 1298b90e-e6c0-11e9-80e3-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1298b90e-e6c0-11e9-80e3-bc764e2007e4;
 Fri, 04 Oct 2019 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570204823;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=itrJVUqp01DicQypp0nwZBh6MZuXG4z3Homp07RS8UI=;
 b=fhhomUIjmlMoT3ugn9MjyLBfyOMNNz53odsEUL9BhZcYRF38wAYb7zCv
 m5bwjIIv8qnOtO2XcyQEQtUptSzkNy57l7k2aXHVcTDUYyysjc2GlIAE6
 80jBGd2DcwmmOiMEh+HcpMeQedbCT8yWL2FKNQGVfC/fUfooprArDcSR4 I=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: lzHi0JexRcpvPKaoq7hmwvQRTCtmFAsryio2k4rVyy37rYcqtCxEZC8t6WK26G6cjtO4hdYLJR
 n5n4qqT1ksb3uX2pDXqZ401/sBUCQ7KI9l9eM1KbPNRiKgEzoSu89WlwttpP3o4WRF0OVxxiaU
 BTWK1kW/gvu1YeAaSZt0FDKOg30PpgwkVU+tzTWgeBgxZx5rQWfgPXu8bq5As2dKyi7brs3JzJ
 V1Gl4+Qp2wDKbNzRl4Yo61FDALJaojwpkhnGwhfzh5wru7F6aH8xcWbajj/uXtMGBZkV/cCBPh
 dnc=
X-SBRS: 2.7
X-MesageID: 6781770
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6781770"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23959.27796.243267.329521@mariner.uk.xensource.com>
Date: Fri, 4 Oct 2019 17:00:20 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <38b059a9d0a923c7d3f7eb24b675f6ab43863340.1569680095.git-series.marmarek@invisiblethingslab.com>
References: <cover.ab9be47e05c2dc2aa047d0a810c29ecd14bfe463.1569680095.git-series.marmarek@invisiblethingslab.com>
 <38b059a9d0a923c7d3f7eb24b675f6ab43863340.1569680095.git-series.marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v8 2/4] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use
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
 Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSCB2OCAyLzRdIGxpYnhs
OiBkbyBub3QgYXR0YWNoIHhlbi1wY2liYWNrIHRvIEhWTSBkb21haW4sIGlmIHN0dWJkb21haW4g
aXMgaW4gdXNlIik6Cj4gSFZNIGRvbWFpbnMgdXNlIElPTU1VIGFuZCBkZXZpY2UgbW9kZWwgYXNz
aXN0YW5jZSBmb3IgY29tbXVuaWNhdGluZyB3aXRoCj4gUENJIGRldmljZXMsIHhlbi1wY2lmcm9u
dC9wY2liYWNrIGlzbid0IGRpcmVjdGx5IG5lZWRlZCBieSBIVk0gZG9tYWluLgo+IEJ1dCBwY2li
YWNrIHNlcnZlIGFsc28gc2Vjb25kIGZ1bmN0aW9uIC0gaXQgcmVzZXQgdGhlIGRldmljZSB3aGVu
IGl0IGlzCj4gZGVhc3NpZ25lZCBmcm9tIHRoZSBndWVzdCBhbmQgZm9yIHRoaXMgcmVhc29uIHBj
aWJhY2sgbmVlZHMgdG8gYmUgdXNlZAo+IHdpdGggSFZNIGRvbWFpbiB0b28uCj4gV2hlbiBIVk0g
ZG9tYWluIGhhcyBkZXZpY2UgbW9kZWwgaW4gc3R1YmRvbWFpbiwgYXR0YWNoaW5nIHhlbi1wY2li
YWNrIHRvCj4gdGhlIHRhcmdldCBkb21haW4gaXRzZWxmIG1heSBwcmV2ZW50IGF0dGFjaGluZyB4
ZW4tcGNpYmFjayB0byB0aGUKPiAoUFYpIHN0dWJkb21haW4sIGVmZmVjdGl2ZWx5IGJyZWFraW5n
IFBDSSBwYXNzdGhyb3VnaC4KPiAKPiBGaXggdGhpcyBieSBhdHRhY2hpbmcgcGNpYmFjayBvbmx5
IHRvIG9uZSBkb21haW46IGlmIFBWIHN0dWJkb21haW4gaXMgaW4KPiB1c2UsIGxldCBpdCBiZSBz
dHViZG9tYWluICh0aGUgY29tbWl0IHByZXZlbnRzIGF0dGFjaGluZyBkZXZpY2UgdG8gdGFyZ2V0
Cj4gSFZNIGluIHRoaXMgY2FzZSk7IG90aGVyd2lzZSwgYXR0YWNoIGl0IHRvIHRoZSB0YXJnZXQg
ZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8
bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KPiBBY2tlZC1ieTogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KCkZUUiwgdGhpcyBoYWQgYSB0cml2aWFsIGNvbmZsaWN0IHdpdGgg
Nzk4ODkwMmIKICBsaWJ4bF9wY2k6IERvbid0IGlnbm9yZSBQQ0kgUFQgZXJyb3IgYXQgZ3Vlc3Qg
Y3JlYXRpb24Kd2hpY2ggSSBhbSBmaXhpbmcgdXAuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
