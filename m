Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7937166245
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 17:22:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4oYE-0007FC-Sh; Thu, 20 Feb 2020 16:19:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FovI=4I=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1j4oYD-0007F3-L8
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 16:19:45 +0000
X-Inumbo-ID: ce257406-53fc-11ea-ade5-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce257406-53fc-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 16:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582215584;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=i2eU+jz8zWqDhOMZIOrn4+/Jn2La7n0ToD3Kp5VHWgo=;
 b=Gp5AZ17m6dHjHa8rEdCpDNedp7wV1EGMLwWBK4uQbWE0SYtlzXDUKP//
 C+FaTgoD1mJYLdep4kOwWH+hh2ogZa66nhxEsv3OkWJVxSuKpTQzhl2Am
 jy7j+mXPq1OxuFUCkov4/N8Zw81o3eRKh10PZaDrU74MQe4dfpsNhcXrJ I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wpJTzol3v8jQBia0+XnBr0zc1otZhFc+pJRvzVanb/R5tYKE+ujSXlzcjnBJ5wXdyGUYI31D8U
 eULCQpFKvdhWSlJL3q307YI32Z/hy0Lr13HugLuWRxTUcsWYIh5W+B4aV2PvhRDK6VmRglvTfF
 tW7NJ2Zm/eGYAAgttqMWm+t2NbUcUEeXMYdFxTsNZLdThJhMoMLuVo6abq4OwAwSb5FXYNC7yB
 8ULlMKiHENC1QJLsHlwIoFLHqZpd7sL8YaRxyJcpOwETL3aFX0cz1+OyOXrC5UrhABQp3AyntC
 Wp4=
X-SBRS: 2.7
X-MesageID: 13123332
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,464,1574139600"; d="scan'208";a="13123332"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24142.45469.349140.521462@mariner.uk.xensource.com>
Date: Thu, 20 Feb 2020 16:19:41 +0000
To: Paul Durrant <pdurrant@amazon.com>
In-Reply-To: <20200219093754.2924-2-pdurrant@amazon.com>
References: <20200219093754.2924-1-pdurrant@amazon.com>
 <20200219093754.2924-2-pdurrant@amazon.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH v6 1/6] libxl: add infrastructure to track
 and query 'recent' domids
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

UGF1bCBEdXJyYW50IHdyaXRlcyAoIltQQVRDSCB2NiAxLzZdIGxpYnhsOiBhZGQgaW5mcmFzdHJ1
Y3R1cmUgdG8gdHJhY2sgYW5kIHF1ZXJ5ICdyZWNlbnQnIGRvbWlkcyIpOgo+IEEgZG9taWQgaXMg
Y29uc2lkZXJlZCByZWNlbnQgaWYgdGhlIGRvbWFpbiBpdCByZXByZXNlbnRzIHdhcyBkZXN0cm95
ZWQKPiBsZXNzIHRoYW4gYSBzcGVjaWZpZWQgbnVtYmVyIG9mIHNlY29uZHMgYWdvLiBGb3IgZGVi
dWdnaW5nIGFuZC9vciB0ZXN0aW5nCj4gcHVycG9zZXMgdGhlIG51bWJlciBjYW4gYmUgc2V0IHVz
aW5nIHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZQo+IExJQlhMX0RPTUlEX1JFVVNFX1RJTUVPVVQu
IElmIHRoZSB2YXJpYWJsZSBkb2VzIG5vdCBleGlzdCB0aGVuIGEgZGVmYXVsdAo+IHZhbHVlIG9m
IDYwcyBpcyB1c2VkLgouLi4KClF1b3Rpbmcgb25seSB0aGUgcGFydHMgd2hpY2ggYXJlIG5laXRo
ZXIgc3BlY2lmaWMgdG8gdGhlIHBhcnRpY3VsYXIKZnVuY3Rpb24sIG5vciBjYWxscyB0byB0aGUg
ZnVuY3Rpb25zIGludG8gd2hpY2ggY29tbW9uIGNvZGUgaGFzCmN1cnJlbnRseSBiZWVuIG1vdmVk
OgoKPiArc3RhdGljIGludCBsaWJ4bF9fbWFya19kb21pZF9yZWNlbnQobGlieGxfX2djICpnYywg
dWludDMyX3QgZG9taWQpCj4gK3sKKyAgICBsb25nIHRpbWVvdXQgPSBsaWJ4bF9fZ2V0X2RvbWlk
X3JldXNlX3RpbWVvdXQoKTsKLi4uCj4gKyAgICBpZiAoY2xvY2tfZ2V0dGltZShDTE9DS19NT05P
VE9OSUMsICZ0cykpIHsKPiArICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsICJmYWlsZWQgdG8g
Z2V0IHRpbWUiKTsKPiArICAgICAgICBnb3RvIG91dDsKPiArICAgIH0KLi4uCj4gKyAgICAgICAg
aWYgKHRzLnR2X3NlYyAtIHNlYyA+IHRpbWVvdXQpCj4gKyAgICAgICAgICAgIGNvbnRpbnVlOyAv
KiBJZ25vcmUgZXhwaXJlZCBlbnRyaWVzICovCgo+ICtpbnQgbGlieGxfX2lzX2RvbWlkX3JlY2Vu
dChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCwgYm9vbCAqcmVjZW50KQo+ICt7Cj4gKyAg
ICBsb25nIHRpbWVvdXQgPSBsaWJ4bF9fZ2V0X2RvbWlkX3JldXNlX3RpbWVvdXQoKTsKLi4uCj4g
KyAgICBpZiAoY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZ0cykpIHsKPiArICAgICAg
ICBMT0dFRChFUlJPUiwgZG9taWQsICJmYWlsZWQgdG8gZ2V0IHRpbWUiKTsKPiArICAgICAgICBn
b3RvIG91dDsKPiArICAgIH0KLi4uCj4gKyAgICAgICAgaWYgKHZhbCA9PSBkb21pZCAmJiB0cy50
dl9zZWMgLSBzZWMgPD0gdGltZW91dCkgewoKSSdtIGFmcmFpZCBJIGFtIHN0aWxsIG1ha2luZyBz
dHlsZSBjb21tZW50czoKCklNTyB0aGUgcmV1c2UgdGltZW91dCBjYWxsIGFuZCB0aGUgY2xvY2tf
Z2V0dGltZSBjYWxsIHNob3VsZCBiZSBwdXQgaW4KbGlieGxfX29wZW5fZG9taWRfaGlzdG9yeTsg
YW5kIHRoZSB0aW1lIGZpbHRlcmluZyBjaGVjayBzaG91bGQgYmUKZm9sZGVkIGludG8gbGlieGxf
X3JlYWRfcmVjZW50LgoKSW4gbXkgcmV2aWV3IG9mIHY0IEkgd3JvdGU6CgogIERvIHlvdSB0aGlu
ayB0aGlzIGNhbiBiZSBjb21iaW5lZCBzb21laG93ID8gIFBvc3NpYmlsaXRpZXMgc2VlbSB0bwog
IGluY2x1ZGU6IGV4cGxpY2l0IHJlYWRfcmVjZW50X3tpbml0LGVudHJ5LGZpbmlzaH0gZnVuY3Rp
b25zOyBhIHNpbmdsZQogIGZ1bmN0aW9uIHdpdGggYSAicGVyLWVudHJ5IiBjYWxsYmFjazsgc2Ft
ZSBidXQgd2l0aCBhIG1hY3JvLiAgSWYgeW91CiAgZG8gdGhhdCB5b3UgY2FuIGFsc28gaGF2ZSBp
dCBoYXZlIGhhbmRsZSB0aGUgImZpbGUgZG9lcyBub3QgZXhpc3QiCiAgc3BlY2lhbCBjYXNlLgoK
WW91J3ZlIHByb3ZpZGVkIHRoZSByZWFkX3JlY2VudF9lbnRyeSBmdW5jdGlvbiBidXQgdGhlICJp
bml0IiBmdW5jdGlvbgpsaWJ4bF9fb3Blbl9kb21pZF9oaXN0b3J5IGRvZXMgdG9vIGxpdHRsZS4g
IFRoaXMgc2VyaWVzIHNlZW1zIHRvIGJlCm1vdmluZyB0b3dhcmRzIHdoYXQgSSBjYWxsZWQgcmVh
ZF9yZWNlbnRfe2luaXQsZW50cnksZmluaXNofSAod2hpY2gKc2hvdWxkIHByb2JhYmx5IGhhdmUg
dGhlIHRpbWVzdGFtcCBhbmQgRklMRSogaW4gYSBzdHJ1Y3QgdG9nZXRoZXIpIGJ1dAppdCBzZWVt
cyB0byBiZSBkb2luZyBzbyBxdWl0ZSBzbG93bHkuCgpJbiB5b3VyIGZhY3RvcmVkIG91dCBmdW5j
dGlvbnMgeW91IGdlbmVyYWxseSBkbyB0aGlzOgoKICAgaW50IHNvbWVfZnVuY3Rpb24oKXsKICAg
ICAgciA9IGRvX3RoZV90aGluZygpOwogICAgICBpZiAociA9PSAwKSByZXR1cm4gMDsKCiAgICAg
IExPR0UoLi4uLikKICAgICAgcmV0dXJuIEVSUk9SX0ZBSUw7CiAgICB9CgpUaGlzIHN0cnVjdHVy
ZSBpcyBub3QgaWRlYWwgYmVjYXVzZToKCiAtIEl0IG1ha2VzIGl0IGhhcmQgdG8gZXh0ZW5kIHRo
aXMgZnVuY3Rpb24gdG8gZG8gbW9yZSwgbGF0ZXIuCiAgIEZvciBleGFtcGxlLCByZWZhY3Rvcmlu
ZyB0aGUgY2xvY2tfZ2V0dGltZSBjYWxsIGludG8KICAgd2hhdCBpcyBub3cgbGlieGxfX29wZW5f
ZG9taWRfaGlzdG9yeSB3b3VsZCBpbnZvbHZlIHJlb3JnYW5pc2luZwogICB0aGUgZnVuY3Rpb24u
CgogLSBJdCBlbmNvdXJhZ2VzIHZhY3VvdXMgbG9nIG1lc3NhZ2VzIHdob3NlIGNvbnRlbnQgaXMg
bWFpbmx5IGluIHRoZQogICBmdW5jdGlvbiBhbmQgbGluZSBudW1iZXIgZnJhbWluZzoKICAgICAg
ICsgICAgTE9HRShFUlJPUiwgImZhaWxlZCIpOwogICAgICAgKyAgICByZXR1cm4gRVJST1JfRkFJ
TDsKICAgICAgICt9CiAgIHJhdGhlciB0aGFuCiAgICAgICBpZiAoISpmKSB7CiAgICAgICAgICAg
TE9HRShFUlJPUiwgImZhaWxlZCB0byBvcGVuIHJlY2VudCBkb21pZCBmaWxlIGAlcyciLCBwYXRo
KTsKICAgICAgICAgICByYyA9IEVSUk9SX0ZBSUw7CiAgICAgICAgICAgZ290byBvdXQ7CiAgICAg
ICB9CiAgIChhbmQgdGhlIGxhdHRlciBpcyB0byBiZSBwcmVmZXJyZWQpLgoKIC0gSXQgaXMgbm9u
c3RhbmRhcmQuICBTZWUgRVJST1JfSEFORExJTkcgaW4gQ09ESU5HX1NUWUxFLgoKPiArICAgIHJl
dCA9IGZjbG9zZShuZik7CgpUaGlzIHNob3VsZCBiZSBjYWxsZWQgYHInLCBub3QgYHJldCcuICBT
ZWUgQ09ESU5HX1NUWUxFLgoKU29ycnkgdGhhdCBzb21lIG9mIHRoZSBvdGhlciBjb2RlIHdoaWNo
IHlvdSBhcmUgaGF2aW5nIHRvIGVkaXQgaGVyZQpzZXRzIGEgYmFkIGV4YW1wbGUuICAoU2VlIHRo
ZSBhcG9sb2d5IGF0IHRoZSB0b3Agb2YgQ09ESU5HX1NUWUxFLikKKEV4aXN0aW5nIHVzZXMgb2Yg
YHJldCcgaW4gbGlieGwgYXJlIHNvbWV0aW1lcyBhIHN5c2NhbGwgcmV0dXJuIHZhbHVlCmFuZCBz
b21ldGltZXMgYSBsaWJ4bCBlcnJvciBjb2RlLCB3aGljaCBpcyBvbmUgcmVhc29uIHRoYXQgbmFt
ZSBpcyBub3cKZGVwcmVjYXRlZC4pCgo+ICtzdGF0aWMgaW50IGxpYnhsX19yZXBsYWNlX2RvbWlk
X2hpc3RvcnkobGlieGxfX2djICpnYywgY2hhciAqbmV3KQo+ICt7CgpGb3IgdGhlIHJlY29yZDog
aXQgd2FzIG5vdCBuZWNlc3NhcnkgdG8gYnJlYWsgdGhpcyBvdXQgaW50byBpdHMgb3duCmZ1bmN0
aW9uLCBiZWNhdXNlIHRoZXJlIGlzIG9ubHkgb25lIGNhbGwgc2l0ZSwgc28gb3Blbi1jb2Rpbmcg
aXQgd291bGQKbm90IGR1cGxpY2F0ZSBhbnl0aGluZy4gIE9uIHRoZSBvdGhlciBoYW5kIGlmIHlv
dSB0aGluayBpdCBpcyBjbGVhcmVyLApJIGhhdmUgbm8gb2JqZWN0aW9uLgoKSSB0aGluayB0aGUg
YWN0dWFsIGJlaGF2aW91ciBpcyBjb3JyZWN0IG5vdyBidXQgSSB3b3VsZCBsaWtlIHRvIHJlYWQK
aXQgYWdhaW4gd2hlbiBpdCBpcyBpbiB0aGUgY29udmVudGlvbmFsIHN0eWxlLgoKVGhhbmtzCklh
bi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
