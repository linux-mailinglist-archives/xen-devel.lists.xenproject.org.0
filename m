Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C642DEB26
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 13:41:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMVzN-000297-11; Mon, 21 Oct 2019 11:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMVzL-000292-Bw
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 11:36:39 +0000
X-Inumbo-ID: 0b0ba04a-f3f7-11e9-944e-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b0ba04a-f3f7-11e9-944e-12813bfff9fa;
 Mon, 21 Oct 2019 11:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571657798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dxy+9frl99yCkYg4nZinioguR9Zaf+p9pmmaoTt28Pc=;
 b=P5nboyEB4xbhZ5EC+V+YGll6IpF6RVUvrGn4FmdpN+r9Gm+m7z7LcZpi
 QlazyVvp9tUvJPF9GthncGrCZ5QeJ4rKEzP4uHHSTqqP3gAhXssnyL8A+
 GNHjGTyH29VG+XfV8HOmlqT7o+Yb1mxL1IV8W0kx4Z6zvVUKUX4LY48o/ 0=;
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
IronPort-SDR: n895ykOrDpOtdRldLPgdhXGgWoHNKE764cy5hoczqVLWzHX9utvHvjeeE4oXNP63fKW+7bXQuq
 +iHXSH3APVLvuzqloMcbqkFDrHPBNUtwTPVagXfRrnERbu/EKfytjJMEcAfKtG05H/tcD0BRWR
 KOab7iw08uZqm+vtfWEhCMfUoVDurMExR14wgKoH2jLNVtUniGYv9bkPdsgwMXRt9EOqdcKLtd
 Bsc0TQ3xoq66QgHr2vBtXnKJv5GRqkhdcdHB1eHCk3UAzWNnxm2zNpnusNPhG+KlJLZAN8Mlp+
 6js=
X-SBRS: 2.7
X-MesageID: 7284624
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7284624"
Date: Mon, 21 Oct 2019 13:36:27 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191021113627.GK17494@Air-de-Roger>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <2999dbd9-0e6d-3340-5915-0d76dd906e22@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2999dbd9-0e6d-3340-5915-0d76dd906e22@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6NTI6MTBQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMS4xMC4xOSAxMTo1MSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiA+IEhlbGxv
LAo+ID4gCj4gPiBXaGlsZSB0ZXN0aW5nIHB2LXNoaW0gZnJvbSBhIHNuYXBzaG90IG9mIHN0YWdp
bmcgNC4xMyBicmFuY2ggKHdpdGggY29yZS0KPiA+IHNjaGVkdWxpbmcgcGF0Y2hlcyBhcHBsaWVk
KSwgc29tZSBzb3J0IG9mIHNjaGVkdWxpbmcgaXNzdWVzIHdlcmUgdW5jb3ZlcmVkCj4gPiB3aGlj
aCB1c3VhbGx5IGxlYWRzIHRvIGEgZ3Vlc3QgbG9ja3VwIChzb21ldGltZXMgd2l0aCBzb2Z0IGxv
Y2t1cCBtZXNzYWdlcwo+ID4gZnJvbSBMaW51eCBrZXJuZWwpLgo+ID4gCj4gPiBUaGlzIGhhcHBl
bnMgbW9yZSBmcmVxdWVudGx5IG9uIFNhbmR5QnJpZGdlIENQVXMuIEFmdGVyIGVuYWJsaW5nCj4g
PiBDT05GSUdfREVCVUcgaW4gcHYtc2hpbSwgdGhlIGZvbGxvd2luZyBhc3NlcnRpb25zIGZhaWxl
ZDoKPiA+IAo+ID4gTnVsbCBzY2hlZHVsZXI6Cj4gPiAKPiA+ICAgICAgQXNzZXJ0aW9uICdsb2Nr
ID09IGdldF9zY2hlZF9yZXMoaS0+cmVzLT5tYXN0ZXJfY3B1KS0+c2NoZWR1bGVfbG9jaycgZmFp
bGVkIGF0IC4uLmFyZS94ZW4tZGlyL3hlbi1yb290L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
OjI3OAo+ID4gICAgICAoZnVsbCBjcmFzaCBsb2c6IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8x
MTA4ODYxLyApCj4gPiAKPiA+IENyZWRpdDEgc2NoZWR1bGVyOgo+ID4gCj4gPiAgICAgIEFzc2Vy
dGlvbiAnY3B1bWFza19jeWNsZShjcHUsIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5KSA9PSBjcHUn
IGZhaWxlZCBhdCBzY2hlZF9jcmVkaXQuYzozODMKPiA+ICAgICAgKGZ1bGwgY3Jhc2ggbG9nOiBo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTEwODg2Mi8gKQo+ID4gCj4gPiBJJ20gY3VycmVudGx5
IGludmVzdGlnYXRpb24gdGhvc2UsIGJ1dCB3b3VsZCBhcHByZWNpYXRlIGFueSBoZWxwIG9yCj4g
PiBzdWdnZXN0aW9ucy4KPiAKPiBIbW0sIEkgdGhpbmsgdGhhdCBwdl9zaGltX2NwdV91cCgpIHNo
b3VsZG4ndCBkbyB0aGUgdmNwdV93YWtlKCksIGJ1dCB0aGUKPiBjYWxsZXIuCj4gCj4gRG9lcyB0
aGUgYXR0YWNoZWQgcGF0Y2ggaGVscD8KPiAKPiAKPiBKdWVyZ2VuCgo+IEZyb20gMDY4ZWEwNDE5
ZDFhNjdlOTY3Yjk0MzFlZDExZTI0YjczMWNkMzU3ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gRGF0ZTogTW9uLCAyMSBP
Y3QgMjAxOSAxMjoyODozMyArMDIwMAo+IFN1YmplY3Q6IFtQQVRDSF0geGVuL3NoaW06IGZpeCBw
di1zaGltIGNwdSB1cC9kb3duCj4gCj4gQ2FsbGluZyB2Y3B1X3dha2UoKSBmcm9tIHB2X3NoaW1f
Y3B1X3VwKCkgaXMgd3JvbmcgYXMgaXQgaXMgbm90IHlldAo+IHN1cmUgdGhhdCB0aGUgY29ycmVj
dCBzY2hlZHVsZXIgaGFzIHRha2VuIG92ZXIgdGhlIGNwdS4KCkknbSBub3Qgc3VyZSB3aHkgdGhp
cyBpcyB3cm9uZywgdGhlIHNjaGVkdWxlciBzaG91bGQgYmUgY2FwYWJsZSBvZgpoYW5kbGluZyAy
IHZDUFVzIG9uIGEgc2luZ2xlIHBDUFUgd2hpbGUgdGhlIG5ldyBwQ1BVIGlzIGJyb3VnaHQKb25s
aW5lPwoKTm90ZSB0aGF0IHdpdGggdGhlIGN1cnJlbnQgY29kZSB0aGUgdmNwdV93YWtlIGlzIG5v
dCBwZXJmb3JtZWQgdW50aWwKY3B1X3VwX2hlbHBlciBoYXMgYmVlbiBjYWxsZWQgYW5kIHJldHVy
bmVkIHN1Y2Nlc3NmdWxseS4KCj4gRG9pbmcgdGhlCj4gY2FsbCBhZnRlciBjb250aW51ZV9oeXBl
cmNhbGxfb25fY3B1KCkgaXMgY29ycmVjdCwgc28gbGV0Cj4gcHZfc2hpbV9jcHVfdXAoKSBqdXN0
IG9ubGluZSB0aGUgY3B1Lgo+IAo+IEFkYXB0IHB2X3NoaW1fY3B1X2Rvd24oKSB0byBiZSBzeW1t
ZXRyaWMsIGV2ZW4gaWYgdGhhdCBpcyBub3QKPiByZXF1aXJlZCBmb3IgY29ycmVjdG5lc3MuCj4g
Cj4gUmVwb3J0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4g
IHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgfCAxNiAtLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9jb21t
b24vZG9tYWluLmMgICAgfCAzMSArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gIDIg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMgYi94ZW4vYXJjaC94ODYvcHYvc2hpbS5j
Cj4gaW5kZXggNWVkYmNkOWFjNS4uYmM2YTJmM2ViOSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94
ODYvcHYvc2hpbS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwo+IEBAIC04MTUsMTYg
KzgxNSwxMSBAQCBsb25nIHB2X3NoaW1fY3B1X3VwKHZvaWQgKmRhdGEpCj4gIHsKPiAgICAgIHN0
cnVjdCB2Y3B1ICp2ID0gZGF0YTsKPiAgICAgIHN0cnVjdCBkb21haW4gKmQgPSB2LT5kb21haW47
Cj4gLSAgICBib29sIHdha2U7Cj4gIAo+ICAgICAgQlVHX09OKHNtcF9wcm9jZXNzb3JfaWQoKSAh
PSAwKTsKPiAgCj4gLSAgICBkb21haW5fbG9jayhkKTsKPiAgICAgIGlmICggIXYtPmlzX2luaXRp
YWxpc2VkICkKPiAtICAgIHsKPiAgICAgICAgICBkb21haW5fdW5sb2NrKGQpOwo+IC0gICAgICAg
IHJldHVybiAtRUlOVkFMOwoKSSB0aGluayB5b3Ugd2FudGVkIHRvIHJlbW92ZSB0aGUgZG9tYWlu
X3VubG9jayBub3QgdGhlIHJldHVybi4KCj4gLSAgICB9Cj4gIAo+ICAgICAgaWYgKCAhY3B1X29u
bGluZSh2LT52Y3B1X2lkKSApCj4gICAgICB7Cj4gQEAgLTgzMiwxOCArODI3LDEyIEBAIGxvbmcg
cHZfc2hpbV9jcHVfdXAodm9pZCAqZGF0YSkKPiAgCj4gICAgICAgICAgaWYgKCByYyApCj4gICAg
ICAgICAgewo+IC0gICAgICAgICAgICBkb21haW5fdW5sb2NrKGQpOwo+ICAgICAgICAgICAgICBn
cHJpbnRrKFhFTkxPR19FUlIsICJGYWlsZWQgdG8gYnJpbmcgdXAgQ1BVIyV1OiAlbGRcbiIsCj4g
ICAgICAgICAgICAgICAgICAgICAgdi0+dmNwdV9pZCwgcmMpOwo+ICAgICAgICAgICAgICByZXR1
cm4gcmM7Cj4gICAgICAgICAgfQo+ICAgICAgfQo+ICAKPiAtICAgIHdha2UgPSB0ZXN0X2FuZF9j
bGVhcl9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxhZ3MpOwo+IC0gICAgZG9tYWluX3VubG9j
ayhkKTsKPiAtICAgIGlmICggd2FrZSApCj4gLSAgICAgICAgdmNwdV93YWtlKHYpOwo+IC0KPiAg
ICAgIHJldHVybiAwOwo+ICB9Cj4gIAo+IEBAIC04NTIsMTEgKzg0MSw2IEBAIGxvbmcgcHZfc2hp
bV9jcHVfZG93bih2b2lkICpkYXRhKQo+ICAgICAgc3RydWN0IHZjcHUgKnYgPSBkYXRhOwo+ICAg
ICAgbG9uZyByYzsKPiAgCj4gLSAgICBCVUdfT04oc21wX3Byb2Nlc3Nvcl9pZCgpICE9IDApOwo+
IC0KPiAtICAgIGlmICggIXRlc3RfYW5kX3NldF9iaXQoX1ZQRl9kb3duLCAmdi0+cGF1c2VfZmxh
Z3MpICkKPiAtICAgICAgICB2Y3B1X3NsZWVwX3N5bmModik7Cj4gLQo+ICAgICAgaWYgKCBjcHVf
b25saW5lKHYtPnZjcHVfaWQpICkKPiAgICAgIHsKPiAgICAgICAgICByYyA9IGNwdV9kb3duX2hl
bHBlcigodm9pZCAqKSh1bnNpZ25lZCBsb25nKXYtPnZjcHVfaWQpOwo+IGRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2RvbWFpbi5jIGIveGVuL2NvbW1vbi9kb21haW4uYwo+IGluZGV4IDljNzM2MGVk
MmEuLmU4MzY1N2UzMTAgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBi
L3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtMTQyOCwxOSArMTQyOCwyMSBAQCBsb25nIGRvX3Zj
cHVfb3AoaW50IGNtZCwgdW5zaWduZWQgaW50IHZjcHVpZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpCj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICAgICAgY2FzZSBWQ1BVT1BfdXA6
Cj4gLSNpZmRlZiBDT05GSUdfWDg2Cj4gLSAgICAgICAgaWYgKCBwdl9zaGltICkKPiAtICAgICAg
ICAgICAgcmMgPSBjb250aW51ZV9oeXBlcmNhbGxfb25fY3B1KDAsIHB2X3NoaW1fY3B1X3VwLCB2
KTsKPiAtICAgICAgICBlbHNlCj4gLSNlbmRpZgo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAg
Ym9vbCB3YWtlID0gZmFsc2U7Cj4gIAo+ICAgICAgICAgICAgICBkb21haW5fbG9jayhkKTsKPiAt
ICAgICAgICAgICAgaWYgKCAhdi0+aXNfaW5pdGlhbGlzZWQgKQo+IC0gICAgICAgICAgICAgICAg
cmMgPSAtRUlOVkFMOwo+IC0gICAgICAgICAgICBlbHNlCj4gLSAgICAgICAgICAgICAgICB3YWtl
ID0gdGVzdF9hbmRfY2xlYXJfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2ZsYWdzKTsKPiArI2lm
ZGVmIENPTkZJR19YODYKPiArICAgICAgICAgICAgaWYgKCBwdl9zaGltICkKPiArICAgICAgICAg
ICAgICAgIHJjID0gY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgwLCBwdl9zaGltX2NwdV91cCwg
dik7Cj4gKyNlbmRpZgo+ICsgICAgICAgICAgICBpZiAoICFyYyApCj4gKyAgICAgICAgICAgIHsK
PiArICAgICAgICAgICAgICAgIGlmICggIXYtPmlzX2luaXRpYWxpc2VkICkKPiArICAgICAgICAg
ICAgICAgICAgICByYyA9IC1FSU5WQUw7Cj4gKyAgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAg
ICAgICAgICAgICAgICAgd2FrZSA9IHRlc3RfYW5kX2NsZWFyX2JpdChfVlBGX2Rvd24sICZ2LT5w
YXVzZV9mbGFncyk7Cj4gKyAgICAgICAgICAgIH0KCkhtLCBJJ20gbm90IHN1cmUgd2h5IHRoaXMg
aXMgYW55IGRpZmZlcmVudCBmcm9tIHRoZSBjdXJyZW50IGNvZGUsCmNvbnRpbnVlX2h5cGVyY2Fs
bF9vbl9jcHUgd2lsbCBzY2hlZHVsZSBwdl9zaGltX2NwdV91cCB0byBiZSBjYWxsZWQgb24KQ1BV
MCwgYnV0IGl0IHdvbid0IHdhaXQgZm9yIGl0IHRvIGV4ZWN1dGUsIHNvIHlvdSBhcmUgY2xlYXJp
bmcgdGhlCnBhdXNlX2ZsYWdzIGJpdCB3aXRob3V0IGhhdmluZyBhbnkgZ3VhcmFudGVlIHRoYXQg
dGhlIHBoeXNpY2FsIENQVSBpcwphY3R1YWxseSB1cD8KClRoZSBwcmV2aW91cyBjb2RlIHdhaXRl
ZCBmb3IgY3B1X3VwX2hlbHBlciB0byByZXR1cm4gc3VjY2Vzc2Z1bGx5IGJlZm9yZQpvbmxpbmlu
ZyB0aGUgdkNQVSwgd2hpY2ggc2VlbXMgYmV0dGVyIElNTy4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
