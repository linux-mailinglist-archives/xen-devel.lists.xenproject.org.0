Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B533D4C979
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 10:29:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdsOw-0004iM-Q0; Thu, 20 Jun 2019 08:26:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jelc=UT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdsOu-0004iA-W6
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 08:26:33 +0000
X-Inumbo-ID: 1b4d5745-9335-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1b4d5745-9335-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 08:26:31 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rj/zETMhGdr5NGY1LlQdpX0BB2Z7VRGTpatNPkR53qs70z0V8nSx72ymIo5GURowHZOJSCb5yZ
 YLStFy6KMY4yX+WI0khj09M078zq0oZiZbDbi9/3iJe+OIvv5BurksfzocDetLXGwlKq80Y610
 INNeMPX4eF1h6v8wP/9dlooouhZSyBNAnLIxiuAnyBMuguX7PxZSHNA/vVL55B0of6FxGfu6s1
 gdklNsOlRFNHI8XpfabIIK8oXY/Vh82PnyCvnyD6BiTJYDchYXNddwpbVwM0F0EemQX+TfzILW
 cfk=
X-SBRS: 2.7
X-MesageID: 1978319
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,396,1557201600"; 
   d="scan'208";a="1978319"
Date: Thu, 20 Jun 2019 10:26:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190620082621.2hpxakoncdd43vnx@MacBook-Air-de-Roger.local>
References: <1560975087-25632-1-git-send-email-andrew.cooper3@citrix.com>
 <1560975087-25632-2-git-send-email-andrew.cooper3@citrix.com>
 <134d0937-f53c-5e92-5d9c-1f544231f214@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <134d0937-f53c-5e92-5d9c-1f544231f214@arm.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/4] xen/link: Cope with .rodata.cst*
 sections
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTA6MTg6NDJQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFuZHJldywKPiAKPiBPbiA2LzE5LzE5IDk6MTEgUE0sIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gPiAucm9kYXRhLmNzdCogc2VjdGlvbnMgYXJlIHVzZWQgZm9yIG1lcmdhYmxlIGNv
bnN0YW50IGRhdGEsIGFuZCB0aGUgY2xhbmcvbGx2bQo+ID4gOCB0b29sY2hhaW4gaGFzIGJlZW4g
b2JzZXJ2ZWQgdG8gY3JlYXRlIC5yb2RhdGEuY3N0OCBpbiBhIGRlZmF1bHQgWGVuIGJ1aWxkLgo+
ID4gCj4gPiBVbmZvcnR1bmF0ZWx5LCB0aGlzIHNlY3Rpb24gKGFuZCBpdHMgLmluaXQgY291bnRl
cnBhcnQpIGFyZW4ndCBjYXB0dXJlZCBieQo+ID4gWGVuJ3MgbGlua2VyIGdsb2JzLCBhbmQgZW5k
IHVwIGFzIG9ycGhhbmVkIHNlY3Rpb25zLgo+ID4gCj4gPiBHZW5lcmFsaXNlIHRoZSBkYXRhIGds
b2JiaW5nIHRvIHBpY2sgdXAgY3N0IGFuZCBmdXR1cmUgc3BlY2lhbCBzZWN0aW9ucy4KPiA+IAo+
ID4gUmVwb3J0ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
ID4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT4KPiA+IC0tLQo+ID4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiA+IEND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgo+ID4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz4KPiA+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+ID4g
LS0tCj4gPiAgIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgfCA5ICsrKy0tLS0tLQo+ID4gICB4ZW4v
YXJjaC94ODYveGVuLmxkcy5TIHwgOSArKystLS0tLS0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA2
IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVu
L2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKPiA+IGluZGV4IGU2
NjRjNDQuLjMxZDc0YTggMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCj4gPiBAQCAtOTYsOCArOTYsNyBAQCBTRUNU
SU9OUwo+ID4gICAgICAgICAgX19zdGFydF9zY2hlZHVsZXJzX2FycmF5ID0gLjsKPiA+ICAgICAg
ICAgICooLmRhdGEuc2NoZWR1bGVycykKPiA+ICAgICAgICAgIF9fZW5kX3NjaGVkdWxlcnNfYXJy
YXkgPSAuOwo+ID4gLSAgICAgICAqKC5kYXRhLnJlbCkKPiA+IC0gICAgICAgKiguZGF0YS5yZWwu
KikKPiA+ICsgICAgICAgKiguZGF0YS4qKQo+IAo+IE15IGtub3dsZWRnZSBvZiBsaW5rZXIgaXMg
cXVpdGUgbGltaXRlZCwgc28gSSBtaWdodCBiZSB3cm9uZy4gQnV0IHdpbGwgbm90Cj4gdGhpcyBt
YXRjaCAuZGF0YS52Y3BpICYgY28/CgpBRkFJQ1QgdGhlIHg4NiBwYXJ0IG9mIHRoaXMgY2hhbmdl
IGlzIGZpbmUsIGJlY2F1c2UgdGhlIHdpbGRjYXJkCm1hdGNoZXMgYXJlIGFkZGVkIGFmdGVyIHRo
ZSBtb3JlIG5hcnJvdyBtYXRjaGVzIG9mIC5kYXRhLiogc2VjdGlvbnMuCgpIb3dldmVyIGZvciBB
Uk0gdGhlIGNoYW5nZSBpcyBub3QgY29ycmVjdCwgc2luY2UgdGhlIC5kYXRhLiogd2lsZGNhcmQK
aXMgYWRkZWQgYmVmb3JlIHRoZSBtb3JlIG5hcnJvdyBtYXRjaCBvZiAuZGF0YS52cGNpLiouIFRo
aXMgY291bGQgYmUKc29sdmVkIGJ5IG1vdmluZyB0aGUgLmRhdGEgc2VjdGlvbiBhdCB0aGUgZW5k
IG9mIHRoZSBzY3JpcHQgKGllOiBhZnRlcgp0aGUgLmluaXQgc2VjdGlvbnMpLCBsaWtlIGl0J3Mg
ZG9uZSBvbiB4ODYuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
