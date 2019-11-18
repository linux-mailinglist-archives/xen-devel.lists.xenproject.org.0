Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A381007CF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 16:01:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWiRi-00018Y-98; Mon, 18 Nov 2019 14:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LWYA=ZK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iWiRg-00018T-Jk
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 14:56:04 +0000
X-Inumbo-ID: 89c65eac-0a13-11ea-a2d9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89c65eac-0a13-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 14:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574088963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=FZRmrkrBRD8YmlOydkk/y0SO3f9Vx1wmGji0H12n7rk=;
 b=VQJoMvkKpOqWbqfTAhL3n0iV6T3pvKYmDEAPtAkkXXK+YyWdzR/METhc
 qdUiid+09r504fPFridl7Wu6Xqm/BeI6eag/MfjeP6nANHBnoAOwgaj5G
 X+8PPQjHmqmKRP4qbSbs4o9iRV1YnIm2LEo3Uurh6+AgLEnG6c04gZS0F U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: a2aKNLcV1QJCh6C/As33q2DOf5Z2n6URV1RIhuefHvt5T7OtSwL7A0sgcQCBGqBIkhw28aWZbd
 I7ssZRqmwiaXrWc4EjpXt51vQpWmd+Nrswe52aLar8YeCD8tBA1rx/OoTN/LeNWe1OscFuc0ob
 F5iCd8r34acbeCK52DvvE2O84rQyIWyhCCpPYhc3mAhPxr0ZLv+Y7QqoypQopIJr54WmVgKL9z
 Ldzdp32tSv/jC8Oz1C97l+IY68hPlNhN0I3alY3QyfZwQkOl8TsZSSBTbAivCptk7bD4lwnC2G
 ivk=
X-SBRS: 2.7
X-MesageID: 8581955
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8581955"
Date: Mon, 18 Nov 2019 15:55:54 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191118145554.GN72134@Air-de-Roger>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBOb3YgMTgsIDIwMTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTEuMjAxOSAxNTowMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBNb24sIE5vdiAxOCwgMjAxOSBhdCAwMToyNjo0NlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxOC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPj4+
IEBAIC0xOTU0LDQ4ICsxOTUyLDI4IEBAIHN0YXRpYyB2b2lkIF9fdm14X2RlbGl2ZXJfcG9zdGVk
X2ludGVycnVwdChzdHJ1Y3QgdmNwdSAqdikKPiA+Pj4gICAgICAgKiAyLiBUaGUgdGFyZ2V0IHZD
UFUgaXMgdGhlIGN1cnJlbnQgdkNQVSBhbmQgd2UncmUgaW4gbm9uLWludGVycnVwdAo+ID4+PiAg
ICAgICAqIGNvbnRleHQuCj4gPj4+ICAgICAgICovCj4gPj4+IC0gICAgaWYgKCBydW5uaW5nICYm
IChpbl9pcnEoKSB8fCAodiAhPSBjdXJyZW50KSkgKQo+ID4+PiAtICAgIHsKPiA+Pj4gKyAgICBp
ZiAoIHZjcHVfcnVubmFibGUodikgJiYgdiAhPSBjdXJyZW50ICkKPiA+Pgo+ID4+IEknbSBhZnJh
aWQgeW91IG5lZWQgdG8gYmUgbW9yZSBjYXJlZnVsIHdpdGggdGhlIHJ1bm5pbmcgdnMgcnVubmFi
bGUKPiA+PiBkaXN0aW5jdGlvbiBoZXJlLiBUaGUgY29tbWVudCBhYm92ZSBoZXJlIGJlY29tZXMg
c3RhbGUgd2l0aCB0aGUKPiA+PiBjaGFuZ2UgKGFsc28gd3J0IHRoZSByZW1vdmFsIG9mIGluX2ly
cSgpLCB3aGljaCBJJ20gYXQgbGVhc3QgdW5lYXN5Cj4gPj4gYWJvdXQpLCBhbmQgdGhlIG5ldyBj
b21tZW50YXJ5IGJlbG93IGFsc28gbGFyZ2VseSBzYXlzL2Fzc3VtZXMKPiA+PiAicnVubmluZyIs
IG5vdCAicnVubmFibGUiLgo+ID4gCj4gPiBJJ3ZlIG1pc3NlZCB0byBmaXggdGhhdCBjb21tZW50
LCB3aWxsIHRha2UgY2FyZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4gTm90ZSBhbHNvIHRoYXQg
dGhlIGNvbW1lbnQgaXMgcXVpdGUgcG9pbnRsZXNzLCBpdCBvbmx5IHN0YXRlcyB3aGF0IHRoZQo+
ID4gY29kZSBiZWxvdyBpcyBzdXBwb3NlZCB0byBkbywgYnV0IGRvZXNuJ3QgZ2l2ZSBhbnkgcmVh
c29uaW5nIGFzIHRvIHdoeQo+ID4gaW5faXJxIGlzIHJlbGV2YW50IGhlcmUuCj4gCj4gSXQncyBt
YWluICJ2YWx1ZSIgaXMgdG8gcmVmZXIgdG8gdmNwdV9raWNrKCksIHdoaWNoIGhhcyAuLi4KPiAK
PiA+IFRCSCBJJ20gbm90IHN1cmUgb2YgdGhlIHBvaW50IG9mIHRoZSBpbl9pcnEgY2hlY2ssIEkg
ZG9uJ3QgdGhpbmsgaXQncwo+ID4gcmVsZXZhbnQgZm9yIHRoZSBjb2RlIGhlcmUuCj4gCj4gLi4u
IGEgc2ltaWxhciBpbl9pcnEoKSBjaGVjay4gU2FkbHkgdGhhdCBvbmUsIHdoaWxlIGhhdmluZyBh
IGJpZ2dlcgo+IGNvbW1lbnQsIGFsc28gZG9lc24ndCBleHBsYWluIHdoYXQgaXQncyBuZWVkZWQg
Zm9yLiBJdCBsb29rcyBsaWtlIEkKPiBzaG91bGQgcmVjYWxsIHRoZSByZWFzb24sIGJ1dCBJJ20g
c29ycnkgLSBJIGRvbid0IHJpZ2h0IG5vdy4KCkJ5IHJlYWRpbmcgdGhlIG1lc3NhZ2Ugb2YgdGhl
IGNvbW1pdCB0aGF0IGludHJvZHVjZWQgdGhlIGluX2lycSBjaGVjawppbiB2Y3B1X2tpY2s6Cgoi
VGhlIGRyYXdiYWNrIGlzIHRoYXQge3ZteCxzdm19X2ludHJfYXNzaXN0KCkgbm93IHJhY2VzIG5l
dyBldmVudApub3RpZmljYXRpb25zIGRlbGl2ZXJlZCBieSBJUlEgb3IgSVBJLiBXZSBjbG9zZSBk
b3duIHRoaXMgcmFjZSBieQpoYXZpbmcgdmNwdV9raWNrKCkgc2VuZCBhIGR1bW15IHNvZnRpcnEg
LS0gdGhpcyBnZXRzIHBpY2tlZCB1cCBpbgpJUlEtc2FnZSBjb250ZXh0IGFuZCB3aWxsIGNhdXNl
IHJldHJ5IG9mICpfaW50cl9hc3Npc3QoKS4gV2UgYXZvaWQKZGVsaXZlcmluZyB0aGUgc29mdGly
cSB3aGVyZSBwb3NzaWJsZSBieSBhdm9pZGluZyBpdCB3aGVuIHdlIGFyZQpydW5uaW5nIGluIHRo
ZSBub24tSVJRIGNvbnRleHQgb2YgdGhlIFZDUFUgdG8gYmUga2lja2VkLiIKCkFGQUlDVCBpbiB0
aGUgdmNwdV9raWNrIGNhc2UgdGhpcyBpcyBkb25lIGJlY2F1c2UgdGhlIHNvZnRpcnEgc2hvdWxk
Cm9ubHkgYmUgcmFpc2VkIHdoZW4gaW4gSVJRIGNvbnRleHQgaW4gb3JkZXIgdG8gdHJpZ2dlciB0
aGUgY29kZSBpbgp2bXhfZG9fdm1lbnRyeSB0byByZXRyeSB0aGUgY2FsbCB0byB2bXhfaW50cl9h
c3Npc3QgKHRoaXMgaXMgcmVsZXZhbnQKaWYgdmNwdV9raWNrIGlzIGlzc3VlZCBmcm9tIGFuIGly
cSBoYW5kbGVyIGV4ZWN1dGVkIGFmdGVyCnZteF9pbnRyX2Fzc2lzdCBhbmQgYmVmb3JlIHRoZSBk
aXNhYmxpbmcgaW50ZXJydXB0cyBpbgp2bXhfZG9fdm1lbnRyeS4KCkkgdGhpbmsgd2UgbmVlZCBz
b21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mOgoKaWYgKCB2LT5pc19ydW5uaW5nICYmIHYgIT0g
Y3VycmVudCApCiAgICBzZW5kX0lQSV9tYXNrKGNwdW1hc2tfb2Yodi0+cHJvY2Vzc29yKSwgcG9z
dGVkX2ludHJfdmVjdG9yKTsKZWxzZSBpZiAoIHYgPT0gY3VycmVudCAmJiBpbl9pcnEoKSAmJiAh
c29mdGlycV9wZW5kaW5nKHNtcF9wcm9jZXNzb3JfaWQoKSkgKQogICAgcmFpc2Vfc29mdGlycShW
Q1BVX0tJQ0tfU09GVElSUSk7CgpTbyB0aGF0IHZteF9pbnRyX2Fzc2lzdCBpcyBhbHNvIHJldHJp
ZWQgaWYgYSB2ZWN0b3IgaXMgc2lnbmFsZWQgaW4gUElSCm9uIHRoZSB2Q1BVIGN1cnJlbnRseSBy
dW5uaW5nIGJldHdlZW4gdGhlIGNhbGwgdG8gdm14X2ludHJfYXNzaXN0IGFuZAp0aGUgZGlzYWJs
aW5nIG9mIGludGVycnVwdHMgaW4gdm14X2RvX3ZtZW50cnkuCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
