Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6716F18F5BE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Mar 2020 14:29:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGN6D-00087c-IZ; Mon, 23 Mar 2020 13:26:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0LFc=5I=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jGN6C-00087X-FN
 for xen-devel@lists.xenproject.org; Mon, 23 Mar 2020 13:26:36 +0000
X-Inumbo-ID: ea96ed06-6d09-11ea-82d2-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea96ed06-6d09-11ea-82d2-12813bfff9fa;
 Mon, 23 Mar 2020 13:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584969994;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=06fxzPRokpDlBS5VQKoEq2ena+DTPWQgd9boNI7nuQc=;
 b=K1xr07AcV7h6AGeWNSLYG8lOge9PeqcX93UqePlxnMIRF02osmS9I6oj
 L+47cyLL0yxjS1pO33Z2SWou22bbfUHzSU3F9FdKfAT9pxkgDk5zbR27Q
 V0cLN7jfyMfWuWzvUu2jdezBiZBHCvhtw470w1hhlcbThm/QF6kyUmdHz 8=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 0Bui82hgB5Paz8dC4mRzTmr+IN4fZkgmGW00I9LGG5mYSBiHXtejAKgcCuO0zn85Yr3E4LDCnx
 +fO9BPrpz4PfHxASDbbTJz1eZuCELK7dI2EE+MXoVL5dWNhU4jHtZceZBaPEZWL4rNTvwEEsxG
 a2Q2oAgCZl4XuAn+VhYMD6gdW1x0d80ldc3uKeFejPmtzVV1GrTNJ+Qdl0uZfbLaN1LwBuM3cE
 qH5nv7ff7/UzdgaS8etMazwQ22Ydd2nK2SDJ2VRVsJEh6TVMf6+IW8SU+QtCVHm3lwOrlHHya+
 KqE=
X-SBRS: 2.7
X-MesageID: 15110901
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,296,1580792400"; d="scan'208";a="15110901"
To: Jan Beulich <jbeulich@suse.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-2-andrew.cooper3@citrix.com>
 <3a2b459d-2d44-55fc-d72f-3f65afaf02af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6faad1b9-77cb-75d6-0fa2-6f6901be0922@citrix.com>
Date: Mon, 23 Mar 2020 13:26:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3a2b459d-2d44-55fc-d72f-3f65afaf02af@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/7] x86/ucode: Document the behaviour of
 the microcode_ops hooks
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMvMDMvMjAyMCAxMjozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMuMDMuMjAyMCAx
MToxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gLi4uIGFuZCBzdHJ1Y3QgY3B1X3NpZ25hdHVy
ZSBmb3IgZ29vZCBtZWFzdXJlLgo+Pgo+PiBObyBjb21tZW50IGlzIHBhc3NlZCBvbiB0aGUgc3Vp
dGFiaWxpdHkgb2YgdGhlIGJlaGF2aW91ci4uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiAtLS0KPj4gQ0M6IEphbiBCZXVs
aWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4gQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4+IEND
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gLS0tCj4+ICB4ZW4v
YXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmggfCA0NiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysKPj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvbWljcm9jb2RlLmggICAg
ICB8ICA1ICsrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oIGIveGVuL2Fy
Y2gveDg2L2NwdS9taWNyb2NvZGUvcHJpdmF0ZS5oCj4+IGluZGV4IGU2NDE2OGE1MDIuLmEyYWVj
NTMwNDcgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlL3ByaXZhdGUu
aAo+PiArKysgYi94ZW4vYXJjaC94ODYvY3B1L21pY3JvY29kZS9wcml2YXRlLmgKPj4gQEAgLTE0
LDE0ICsxNCw2MCBAQCBlbnVtIG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgewo+PiAgc3RydWN0IG1p
Y3JvY29kZV9wYXRjaDsgLyogT3BhcXVlICovCj4+ICAKPj4gIHN0cnVjdCBtaWNyb2NvZGVfb3Bz
IHsKPj4gKyAgICAvKgo+PiArICAgICAqIFBhcnNlIGEgbWljcm9jb2RlIGNvbnRhaW5lci4gIEZv
cm1hdCBpcyB2ZW5kb3Itc3BlY2lmaWMuCj4+ICsgICAgICoKPj4gKyAgICAgKiBTZWFyY2ggd2l0
aGluIHRoZSBjb250YWluZXIgZm9yIHRoZSBwYXRjaCwgc3VpdGFibGUgZm9yIHRoZSBjdXJyZW50
Cj4+ICsgICAgICogQ1BVLCB3aGljaCBoYXMgdGhlIGhpZ2hlc3QgcmV2aXNpb24uICAoTm90ZTog
TWF5IGJlIGEgcGF0Y2ggd2hpY2ggaXMKPj4gKyAgICAgKiBvbGRlciB0aGF0IHdoYXQgaXMgcnVu
bmluZyBpbiB0aGUgQ1BVLiAgVGhpcyBpcyBhIGZlYXR1cmUsIHRvIGJldHRlcgo+PiArICAgICAq
IGNvcGUgd2l0aCBjb3JuZXIgY2FzZXMgZnJvbSBidWdneSBmaXJtd2FyZS4pCj4+ICsgICAgICoK
Pj4gKyAgICAgKiBJZiBvbmUgaXMgZm91bmQsIGFsbG9jYXRlIGFuZCByZXR1cm4gYSBzdHJ1Y3Qg
bWljcm9jb2RlX3BhdGNoCj4+ICsgICAgICogZW5jYXBzdWxhdGluZyB0aGUgYXBwcm9wcmlhdGUg
bWljcm9jb2RlIHBhdGNoLiAgRG9lcyBub3QgYWxpYXMgdGhlCj4+ICsgICAgICogb3JpZ2luYWwg
YnVmZmVyLgo+PiArICAgICAqCj4+ICsgICAgICogSWYgb25lIGlzIG5vdCBmb3VuZCwgKG5vdGhp
bmcgbWF0Y2hlcyB0aGUgY3VycmVudCBDUFUpLCByZXR1cm4gTlVMTC4KPj4gKyAgICAgKiBBbHNv
IG1heSByZXR1cm4gRVJSX1BUUigtZXJyKSwgZS5nLiBiYWQgY29udGFpbmVyLCBvdXQgb2YgbWVt
b3J5Lgo+PiArICAgICAqLwo+PiAgICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKigqY3B1X3Jl
cXVlc3RfbWljcm9jb2RlKShjb25zdCB2b2lkICpidWYsCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBzaXplKTsKPj4gKwo+PiAr
ICAgIC8qIE9idGFpbiBtaWNyb2NvZGUtcmVsZXZhbnQgZGV0YWlscyBmb3IgdGhlIGN1cnJlbnQg
Q1BVLiAqLwo+PiAgICAgIGludCAoKmNvbGxlY3RfY3B1X2luZm8pKHN0cnVjdCBjcHVfc2lnbmF0
dXJlICpjc2lnKTsKPj4gKwo+PiArICAgIC8qCj4+ICsgICAgICogQXR0ZW1wdCB0byBsb2FkIHRo
ZSBwcm92aWRlZCBwYXRjaCBpbnRvIHRoZSBDUFUuICBSZXR1cm5zIC1FSU8gaWYKPj4gKyAgICAg
KiBhbnl0aGluZyBkaWRuJ3QgZ28gYXMgZXhwZWN0ZWQuCj4+ICsgICAgICovCj4+ICAgICAgaW50
ICgqYXBwbHlfbWljcm9jb2RlKShjb25zdCBzdHJ1Y3QgbWljcm9jb2RlX3BhdGNoICpwYXRjaCk7
Cj4gV2hpbGUgYXQgcHJlc2VudCAtRUlPIG1heSBiZSB0aGUgb25seSBlcnJvciB0aGF0IG1heSBj
b21lIGJhY2sgaGVyZSwgZG8KPiB3ZSB3YW50IHRvIHJpc2sgdGhlIGNvbW1lbnQgZ29pbmcgc3Rh
bGUgd2hlbiBhbm90aGVyIGVycm9yIHJldHVybiBnZXRzCj4gYWRkZWQ/IElPVyAtIHBlcmhhcHMg
YWRkICJlLmcuIiBvciBzb21lIHN1Y2g/CgpDYW4gZG8uCgo+Cj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvbWljcm9jb2RlLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9taWNyb2Nv
ZGUuaAo+PiBAQCAtNyw4ICs3LDEzIEBACj4+ICAjaW5jbHVkZSA8cHVibGljL3hlbi5oPgo+PiAg
Cj4+ICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSB7Cj4+ICsgICAgLyogQ1BVIHNpZ25hdHVyZSAoQ1BV
SUQuMS5FQVgpLiAgT25seSB3cml0dGVuIG9uIEludGVsLiAqLwo+PiAgICAgIHVuc2lnbmVkIGlu
dCBzaWc7Cj4+ICsKPj4gKyAgICAvKiBQbGF0Zm9ybSBGbGFncyAob25seSBhY3R1YWxseSAxIGJp
dCkuICBPbmx5IGFwcGxpY2FibGUgdG8gSW50ZWwuICovCj4+ICAgICAgdW5zaWduZWQgaW50IHBm
Owo+IFRvIG1lICJvbmx5IGFjdHVhbGx5IDEgYml0IiBtYWtlcyBpdCBhbiBpbXBsaWNhdGlvbiB0
aGF0IHRoaXMgaXMgdGhlCj4gbG93ZXN0IGJpdCAobGlrZSBpbiBhIGJvb2wgcmVwcmVzZW50ZWQg
aW4gYSAzMi1iaXQgbWVtb3J5IGxvY2F0aW9uKS4KPiBJIGRpZG4ndCB0aGluayB0aGlzIHdhcyB0
aGUgY2FzZSB0aG91Z2gsIHNvIHVubGVzcyBJJ20gd3JvbmcsIGNvdWxkCj4geW91IGNsYXJpZnkg
dGhpcyBhIGxpdHRsZT8KClRoZXJlIHdpbGwgYmUgYSBzaW5nbGUgYml0IHdpdGhpbiB0aGUgYm90
dG9tIDggc2V0ICh0aGUgMSA8PApNU1JfUExBVEZPUk1fSURbNTI6NTBdKSwgZGVzcGl0ZSB0aGlz
IGZpZWxkIGJlaW5nIGNhbGxlZCAiUGxhdGZvcm0gRmxhZ3MiLgoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
