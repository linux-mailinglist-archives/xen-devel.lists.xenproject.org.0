Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B70010CA13
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 15:04:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaKNd-00040m-7S; Thu, 28 Nov 2019 14:02:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aQmR=ZU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iaKNb-00040a-F8
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 14:02:47 +0000
X-Inumbo-ID: bb02dbd6-11e7-11ea-83b8-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb02dbd6-11e7-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574949757;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XmruZdKk8gM9fXXLnaWLAOgbE4mFRUQcYA/5rc5I3l8=;
 b=AlUolTDjVrna3AAxofwm7CoSZ715063RY0R6WK6dw2q2u+VYeELjMFAj
 UYcGmPFPscGKutFSm8pVfmZjDzHzTQPT86mrW6XMRxijyqHJg6HF8UAVl
 uiWdYQ1cyrar5avFV1MmQwOGPlwvMe3VeZOXIbmh1Jd3QlbTrwmYRF2Ef Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
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
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kSLlZg7z4c7bm2KMbkJX5ouLzvxkDgxSG2LP4O0cTgsoJeC9yGoQtQI3lqY9Bs0n8Ia+z3oLz2
 23IMx14+03qBaL3zt7FBiLU0Aq02CEgBiqnPh0YNqcy/9JLzFX7zWJyuzglHWuOvgtK9teVF0f
 P9Io+brr8xmnU9Iai44yedWvf1WKH+aP7u0MeN66dw12ym125eIFMoW/cG9EVc4+Mlg2S9lXxn
 PfI7NhfpzQEF5C/t2Jxrjdl58QlRx0IEAL4if2ywpKS+F1n4qqJbWntOducX1swWsyh6KxgdVN
 p38=
X-SBRS: 2.7
X-MesageID: 8959416
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,253,1571716800"; 
   d="scan'208";a="8959416"
From: Lars Kurth <lars.kurth@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Lars Kurth <lars.kurth@xenproject.org>
Thread-Topic: [PATCH v2 4/6] Add Code Review Guide
Thread-Index: AQHVpfEGwl/VxYnE9Uydtksy7w4pxaegJ7iA
Date: Thu, 28 Nov 2019 14:02:32 +0000
Message-ID: <BE78F496-8B9C-490F-A500-204E3305C950@citrix.com>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
 <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
 <2200B0A8-0EDE-4843-A5D3-A84F2D01333D@citrix.com>
 <f6ec3d6f-4d00-5d44-a63e-88757f40eaa8@suse.com>
In-Reply-To: <f6ec3d6f-4d00-5d44-a63e-88757f40eaa8@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BA509EDB3689F441B887172061197B63@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-api@lists.xenproject.org" <xen-api@lists.xenproject.org>,
 "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "win-pv-devel@lists.xenproject.org" <win-pv-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDI4LzExLzIwMTksIDA3OjM3LCAiSmFuIEJldWxpY2giIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6DQoNCiAgICBPbiAyOC4xMS4yMDE5IDE0OjA2LCBMYXJzIEt1cnRoIHdyb3Rl
Og0KICAgID4gSSBjYW4gY2VydGFpbmx5IGFkZCBzb21ldGhpbmcgb24gdGhlIHRpbWluZyAsIGFs
b25nIHRoZSBsaW5lcyBvZg0KICAgID4gKiBGb3IgY29tcGxleCBzZXJpZXMsIGNvbnNpZGVyIHRo
ZSB0aW1lIGl0IHRha2VzIHRvIGRvIHJldmlld3MgKG1heWJlIHdpdGggYSBndWlkZSBvZiBMT0Mg
cGVyIGhvdXIpIGFuZCBnaXZlIHJldmlld2VycyBlbm91Z2ggdGltZSB0bw0KICAgID4gKiBGb3Ig
c2VyaWVzIHdpdGggZGVzaWduIGlzc3VlcyBvciBsYXJnZSBxdWVzdGlvbnMsIHRyeSBhbmQgaGln
aGxpZ2h0IHRoZSBrZXkgb3BlbiBpc3N1ZXMgaW4gY292ZXIgbGV0dGVycyBjbGVhcmx5IGFuZCBz
b2xpY2l0IGZlZWRiYWNrIGZyb20ga2V5IG1haW50YWluZXJzIHdobyBjYW4gY29tbWVudCBvbiB0
aGUgb3BlbiBpc3N1ZS4gVGhlIGlkZWEgaXMgdG8gc2F2ZSBib3RoIHRoZSBjb250cmlidXRvciBh
bmQgdGhlIHJldmlld2VycyB0aW1lIGJ5IGZvY3Vzc2luZyBvbiB3aGF0IG5lZWRzIHRvIGJlIHJl
c29sdmVkIA0KICAgID4gKiBEb27igJl0IHJlcG9zdCBhIHNlcmllcywgdW5sZXNzIGFsbCByZXZp
ZXcgY29tbWVudHMgYXJlIGFkZHJlc3NlZA0KICAgID4gb3IgdGhlIHJldmlld2VycyBhc2tlZCB5
b3UgdG8gZG8gc28uIFRoZSBwcm9ibGVtIHdpdGggdGhpcyBpcyB0aGF0DQogICAgPiB0aGlzIGlz
IHNvbWV3aGF0IGluIGNvbmZsaWN0IHdpdGggdGhlICJsZXQncyBmb2N1cyBvbiB0aGUgY29yZQ0K
ICAgID4gaXNzdWVzIGFuZCBub3QgZ2V0IGRpc3RyYWN0ZWQgYnkgZGV0YWlscyBlYXJseSBvbiBp
biBhIHJldmlldyBjeWNsZSIuDQogICAgPiBJbiBvdGhlciB3b3JkcywgdGhpcyBjYW4gb25seSB3
b3JrLCBpZiByZXZpZXdlcnMgZm9jdXMgb24gbWFqb3INCiAgICA+IGlzc3VlcyBpbiBlYXJseSBy
ZXZpZXdzIG9ubHkgYW5kIGRvIG5vdCBmb2N1cyBvbiBzdHlsZSwgY29kaW5nDQogICAgPiBzdGFu
ZGFyZHMsIGV0Yy4NCiAgICANCiAgICBCdXQgdGhpcyBkb2Vzbid0IG1ha2UgbXVjaCBzZW5zZSBl
aXRoZXIsIGJlY2F1c2UgdGhlbiBmdWxsIHJlLXJldmlld3MNCiAgICBuZWVkIHRvIGhhcHBlbiBh
bnl3YXkgb24gbGF0ZXIgdmVyc2lvbnMsIHRvIGFsc28gZGVhbCB3aXRoIHRoZSBtaW5vcg0KICAg
IGlzc3Vlcy4gRm9yIFJGQyBraW5kIG9mIHNlcmllcyBvbWl0dGluZyBzdHlsZSBhbmQgYWxpa2Ug
ZmVlZGJhY2sNCiAgICBjZXJ0YWlubHkgbWFrZXMgc2Vuc2UsIGJ1dCBhcyBzb29uIGFzIGEgcGF0
Y2ggaXMgbm9uLVJGQywgaXQgc2hvdWxkDQogICAgYmUgY29uc2lkZXJlZCBnb29kIHRvIGdvIGlu
IGJ5IHRoZSBzdWJtaXR0ZXIuDQogICAgDQpPSywgSSB0aGluayB3ZSBoYXZlIGEgZGlzY29ubmVj
dCBiZXR3ZWVuIGlkZWFsIGFuZCByZWFsaXR5LiANCg0KSSBzZWUgdHdvIGlzc3VlcyB0b2RheQ0K
KiBLZXkgbWFpbnRhaW5lcnMgZG9uJ3QgYWx3YXlzIHJldmlldyBSRkMgc2VyaWVzIFt0aGV5IGVu
ZCB1cCBhdCB0aGUgYm90dG9tIG9mIHRoZSBwcmlvcml0eSBsaXN0LCBldmVuIHRob3VnaCBzcGVu
ZGluZyB0aW1lIG9uIFJGQ3Mgd2lsbCBzYXZlIHRpbWUgZWxzZXdoZXJlIGxhdGVyXS4gU28gdGhl
IGVmZmVjdCBpcyB0aGF0IHRoZW4gdGhlIGNvbnRyaWJ1dG9yIGFzc3VtZXMgdGhlcmUgYXJlIG5v
IG1ham9yIGlzc3VlcyBhbmQgZW5kcyBpdCBhcyBhIHByb3BlciBzZXJpZXMNCiogSW4gcHJhY3Rp
Y2Ugd2hhdCBoYXMgaGFwcGVuZWQgb2Z0ZW4gaW4gdGhlIHBhc3QgaXMgdGhhdCBkZXNpZ24sIGFy
Y2hpdGVjdHVyZSwgYXNzdW1wdGlvbiBmbGF3cyBhcmUgZm91bmQgaW4gZWFybHkgdmVyc2lvbnMg
b2YgYSBzZXJpZXMuDQogICAtIFRoaXMgdXN1YWxseSBoYXBwZW5zIGJlY2F1c2Ugb2YgYW4gb3Zl
cnNpZ2h0IG9yIGJlY2F1c2UgdGhlcmUgd2FzIG5vIGRlc2lnbiBkaXNjdXNzaW9uIHByaW9yIHRv
IHRoZSBzZXJpZXMgYmVpbmcgcG9zdGVkIGFuZCBhZ3JlZWQNCiAgIC0gQ29tbW9uIHNlbnNlIHdv
dWxkIGRpY3RhdGUgdGhhdCB0aGUgYmlnZ2VzdCBiZW5lZml0IGZvciBib3RoIHRoZSByZXZpZXdl
ciwgdGhlIGNvbnRyaWJ1dG9yIGFuZCB0aGUgY29tbXVuaXR5IGFzIGEgd2hvbGUgd291bGQgYmUg
dG8gdHJ5IGFuZCBmb2N1cyBvbiBzdWNoIGZsYXdzIGFuZCBsZWF2ZSBldmVyeXRoaW5nIGFzaWRl
DQogICAtIE9mIGNvdXJzZSB0aGVyZSBtYXkgYmUgdmFsdWUgaW4gZG9pbmcgYSBkZXRhaWxlZCBy
ZXZpZXdzIG9mIHN1Y2ggYSBzZXJpZXMgYXMgdGhlcmUgbWF5IGJlIGJpdHMgdGhhdCBhcmUgdW5h
ZmZlY3RlZCBieSBzdWNoIGEgZmxhdw0KICAgLSBCdXQgdGhlcmUgd2lsbCBsaWtlbHkgYmUgcGFy
dHMgd2hpY2ggYXJlIG5vdDogZG9pbmcgYSBkZXRhaWxlZCByZXZpZXcgb2Ygc3VjaCBwb3J0aW9u
cyB3YXN0ZXMgZXZlcnlvbmUncyB0aW1lDQoNClNvIGNvbWluZyBiYWNrIHRvIHlvdXIgcG9pbnQu
IElkZWFsbHksIGl0IHdvdWxkIGJlIG5pY2UgaWYgd2UgaGFkIHRoZSBjYXBhYmlsaXR5IHRvIGNh
bGwgb3V0IHBhcnRzIG9mIGEgc2VyaWVzIGFzICJwcm9ibGVtYXRpYyIgYW5kIHRyZWF0aW5nIHN1
Y2ggcGFydHMgZGlmZmVyZW50bHkNCg0KTGFycw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
