Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 348A71CDD23
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 16:28:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY9Pa-0001Fg-Hz; Mon, 11 May 2020 14:28:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2nSL=6Z=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jY9PZ-0001Fb-CR
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 14:28:05 +0000
X-Inumbo-ID: 9f5b155a-9393-11ea-a215-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9f5b155a-9393-11ea-a215-12813bfff9fa;
 Mon, 11 May 2020 14:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589207284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CtEB7EXwJGNdwiT8BuA/fSZx76lVbT4EwRvG+OpaDlE=;
 b=CkaDeGvZqug3ryKlt/DIybn1kPEQevJ3Nxuz+BjHoLeY/ytfCZDEygjz
 0ttVymM/lkuyoL5iMJloI7F3/t8BNy8HN1CRNb9albXl6IWS9DxeefW6C
 eW+fnChdjSsqM5F8963kYqqEGyd1dxu4I8ves0lVSMaFnHlLPGkNzMA2A M=;
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
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: VaDVOzUPScAxQJ3TEnvE4oivfmLEbxaFnbzU8CJXilDkteVwNeahGbcwNUNHsleKuyXUONJfH0
 JY4HHRs0CitcZm84amwXgGGr+6wdU5lF0hDULlb7D1gFLzWXkSyLmEudGlIKu4laGNf5UbZKPP
 HapQPbq7SZn+2DlURGgEaPAff5OBkmtoq4AGsfkZrO+7vxNrttUV8YxHaokJ/n/s46mjMMsfI5
 VgLKhoVnJwh+RGFzgL+JaAYORGJGqASWrhJ7pvntdzy2nHnYaaOiJW8a1g0LPZDP/VAPEC1ZmC
 oaU=
X-SBRS: 2.7
X-MesageID: 17240834
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17240834"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Thread-Topic: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from
 the menuconfig directly
Thread-Index: AQHWHvtEfLlMb5EF90y7GzIGxHVxJ6iRncgAgAYL5QCAABeggIAC9dcAgAILiACABg54AIAAAuMAgAAExoCAAAK+AIAAASKAgAAEkoA=
Date: Mon, 11 May 2020 14:27:59 +0000
Message-ID: <498C2068-6E57-465C-80E2-A689438D2F79@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
 <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
 <803876ce-503a-2e97-f310-0413e515970b@suse.com>
 <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
In-Reply-To: <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <69AAD4A5D64DBB4ABD465B20C075E7A2@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDExLCAyMDIwLCBhdCAzOjExIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCBy
ZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IEhp
LA0KPiANCj4gT24gMTEvMDUvMjAyMCAxNTowNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAx
MS4wNS4yMDIwIDE1OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gDQo+Pj4gSSBoYXZlIG5l
dmVyIGhlYXJkIG9mIC4vLmNvbmZpZyBiZWZvcmUuIFNvIHdoYXQgYXJlIHlvdSByZWZlcnJpbmcg
dG8/DQo+PiBJJ20gcmVmZXJyaW5nIHRvIHRoaXMgbGluZSBpbiAuL0NvbmZpZy5tazoNCj4+IC1p
bmNsdWRlICQoWEVOX1JPT1QpLy5jb25maWcNCj4gDQo+IEdyZWF0IGFub3RoZXIgdW5kb2N1bWVu
dGVkIHdheSB0byBkbyB0aGluZ3MuLi4NCg0KT2gsIGlzIHRoYXQgbm90IGRvY3VtZW50ZWQ/ICBJ
dOKAmXMgcXVpdGUgdmVuZXJhYmxlIGF0IHRoaXMgcG9pbnQg4oCUIGlmIGl04oCZcyBub3QgZG9j
dW1lbnRlZCB0aGF0IHNob3VsZCBjaGFuZ2UuICAoQWx0aG91Z2ggSSBndWVzcyB0aGVyZeKAmXMg
YW4gYXJndW1lbnQgdGhhdCBldmVyeXRoaW5nIHdoaWNoIHdvdWxkIGJlIGluY2x1ZGVkIHRoZXJl
IHNob3VsZCBiZSBhZGRlZCB0byBlaXRoZXIgS0NvbmZpZyBvciBjb25maWd1cmUuKQ0KDQpJIGRv
buKAmXQgdGhpbmsgSSB3b3VsZCBoYXZlIHRob3VnaHQgdG8gYWRkIFhFTl9DT05GSUdfRVhQRVJU
PXkgdG8gLmNvbmZpZyB0byBwcmV2ZW50IHRoZSBpc3N1ZSBKdWxpZW4gaXMgc2VlaW5nLiAgVGhh
dCBtYXliZSBwYXJ0IG9mIHRoZSByZWFzb24gd2h5IHRoaXMgZG9lc27igJl0IGJvdGhlciB5b3Ug
YXMgbXVjaCBhcyBpdCBkb2VzIGhpbS4NCg0KRnJvbSBhIFVJIHBlcnNwZWN0aXZlLCBJIHRoaW5r
IHRoYXTigJlzIGEgcG9vciBVSSDigJQgZW5hYmxpbmcgQ09ORklHX0VYUEVSVCBmcm9tIHRoZSBt
ZW51Y29uZmlnIGlzIG1vcmUgZGlzY292ZXJhYmxlIGFuZCBtb3JlIGluIGxpbmUgd2l0aCB3aGF0
IHBlb3BsZSBleHBlY3QuDQoNCiAtR2VvcmdlDQoNCg==

