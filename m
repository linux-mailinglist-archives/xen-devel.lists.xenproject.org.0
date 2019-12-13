Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0552811E569
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 15:15:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iflgY-0002q4-OH; Fri, 13 Dec 2019 14:12:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TBrU=2D=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iflgX-0002pu-2U
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 14:12:49 +0000
X-Inumbo-ID: a3b23dba-1db2-11ea-8f11-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3b23dba-1db2-11ea-8f11-12813bfff9fa;
 Fri, 13 Dec 2019 14:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576246368;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=s5gSY5MRGI1t6/+Zex/YuS61CIz6TwDd58skRwWq2Zs=;
 b=LL0GhJMxPBg3KDRfEYtiotizhwobfInNjlqxCEHG5X8kyano+JtPINia
 D87umKC5jePSD3a3Z9bZ3i5TLFmc754cjTw2L8RBtOlHqmEWK4O0NGpkD
 cThO40UpI17qxIwvM7dveZC1aZD6EPxc35UWRuSELd8RTcCt/Fgyy5v2u M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZQcziDr1nhuz9A+eYYJhsf3Dk5G9lsi/ojN0/y3k1dTPcKBUX9X1uOgV/dLuFghBm6H5TtD81x
 cQBllVILr07ucjy2wpKzzsinx+cjQH/xA59SDCqeAWGHBT4g7ILEXzWbbENvDB5QoS3W0WnjGx
 Of0Ra0Zk/svh1aXMZvDDjK+i/qBkdBrFM3CnUs0+CUxNIqOI7e6KVAsO4E2xMyyouy3YuAs/nW
 N96+397L10iXk0eqswaPc415YYnKAzkln9xCM5RQBYYyaaJHTjfIi8+KmJoTCDrWb+27bfhkqk
 eqY=
X-SBRS: 2.7
X-MesageID: 10060816
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,309,1571716800"; d="scan'208";a="10060816"
Date: Fri, 13 Dec 2019 15:12:40 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191213141240.GH11756@Air-de-Roger>
References: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <be16ddaa-ae99-f696-53c0-6a680ffa8504@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH v2] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDE6NTM6MjlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ29udGFpbmluZyBzdGlsbCBpbiBmbGlnaHQgRE1BIHdhcyBpbnRyb2R1Y2VkIHRvIHdv
cmsgYXJvdW5kIGNlcnRhaW4KPiBkZXZpY2VzIC8gc3lzdGVtcyBoYW5naW5nIGhhcmQgdXBvbiBo
aXR0aW5nIGFuIElPTU1VIGZhdWx0LiBQYXNzaW5nCj4gdGhyb3VnaCAoc3VjaCkgZGV2aWNlcyAo
b24gc3VjaCBzeXN0ZW1zKSBpcyBpbmhlcmVudGx5IGluc2VjdXJlIChhcwo+IGd1ZXN0cyBjb3Vs
ZCBlYXNpbHkgYXJyYW5nZSBmb3IgSU9NTVUgZmF1bHRzIHRvIG9jY3VyKS4gRGVmYXVsdGluZyB0
bwo+IGEgbW9kZSB3aGVyZSBhZG1pbnMgbWF5IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZiBpc3N1
ZXMgd2l0aCBkZXZpY2VzIGNhbgo+IGJlIGNvbnNpZGVyZWQgdW5kZXNpcmFibGUuIFRoZXJlZm9y
ZSBjb252ZXJ0IHRoaXMgbW9kZSBvZiBvcGVyYXRpb24gdG8KPiBhbiBvcHRpb25hbCBvbmUsIG5v
dCBvbmUgZW5hYmxlZCBieSBkZWZhdWx0Lgo+IAo+IFRoaXMgaW52b2x2ZXMgcmVzdXJyZWN0aW5n
IGNvZGUgY29tbWl0IGVhMzg4Njc4MzFkYSAoIng4NiAvIGlvbW11OiBzZXQKPiB1cCBhIHNjcmF0
Y2ggcGFnZSBpbiB0aGUgcXVhcmFudGluZSBkb21haW4iKSBkaWQgcmVtb3ZlLCBpbiBhIHNsaWdo
dGx5Cj4gZXh0ZW5kZWQgYW5kIGFic3RyYWN0ZWQgZmFzaGlvbi4gSGVyZSwgaW5zdGVhZCBvZiBy
ZWludHJvZHVjaW5nIGEgcHJldHR5Cj4gcG9pbnRsZXNzIHVzZSBvZiAiZ290byIgaW4gZG9tYWlu
X2NvbnRleHRfdW5tYXAoKSwgYW5kIGluc3RlYWQgb2YgbWFraW5nCj4gdGhlIGZ1bmN0aW9uIChh
dCBsZWFzdCB0ZW1wb3JhcmlseSkgaW5jb25zaXN0ZW50LCB0YWtlIHRoZSBvcHBvcnR1bml0eQo+
IGFuZCByZXBsYWNlIHRoZSBvdGhlciBzaW1pbGFybHkgcG9pbnRsZXNzICJnb3RvIiBhcyB3ZWxs
Lgo+IAo+IEluIG9yZGVyIHRvIGtleSB0aGUgcmUtaW5zdGF0ZWQgYnlwYXNzZXMgb2ZmIG9mIHRo
ZXJlIChub3QpIGJlaW5nIGEgcm9vdAo+IHBhZ2UgdGFibGUgdGhpcyBmdXJ0aGVyIHJlcXVpcmVz
IG1vdmluZyB0aGUgYWxsb2NhdGVfZG9tYWluX3Jlc291cmNlcygpCj4gaW52b2NhdGlvbiBmcm9t
IHJlYXNzaWduX2RldmljZSgpIHRvIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWNlKCkgKG9y
Cj4gZWxzZSByZWFzc2lnbl9kZXZpY2UoKSB3b3VsZCBhbGxvY2F0ZSBhIHJvb3QgcGFnZSB0YWJs
ZSBhbnl3YXkpOyB0aGlzIGlzCj4gYmVuaWduIHRvIHRoZSBzZWNvbmQgY2FsbGVyIG9mIHRoZSBs
YXR0ZXIgZnVuY3Rpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKSSdtIGhvd2V2ZXIgbm90IHN1cmUgaWYgdGhlIGRlZmF1bHQgcXVhcmFudGluZSBt
b2RlIHNob3VsZCBiZSB0aGUKYmFzaWMgb3IgdGhlIGZ1bGwgb25lLgoKQXQgdGhlIGVuZCBvZiBk
YXkgdGhlIGZ1bGwgb25lIGRvZXMgcHJldmVudCBoYXJkIGhhbmdzIG9uIHNwZWNpZmljCnN5c3Rl
bXMsIGJ1dCBhIGd1ZXN0IHdpdGggYSBkZXZpY2UgYmVoaW5kIHN1Y2ggYm9ndXMgSU9NTVUgY2Fu
CnRyaXZpYWxseSB0cmlnZ2VyIHRob3NlIGFueXdheS4KCj4gLS0tCj4gQXMgZmFyIGFzIDQuMTMg
aXMgY29uY2VybmVkLCBJIGd1ZXNzIGlmIHdlIGNhbid0IGNvbWUgdG8gYW4gYWdyZWVtZW50Cj4g
aGVyZSwgdGhlIG9ubHkgb3RoZXIgb3B0aW9uIGlzIHRvIHJldmVydCBlYTM4ODY3ODMxZGEgZnJv
bSB0aGUgYnJhbmNoLAo+IGZvciBoYXZpbmcgYmVlbiBjb21taXR0ZWQgcHJlbWF0dXJlbHkgKEkn
bSBub3Qgc28gbXVjaCB3b3JyaWVkIGFib3V0IHRoZQo+IG1hc3RlciBicmFuY2gsIHdoZXJlIHdl
IGhhdmUgYW1wbGUgdGltZSB1bnRpbCA0LjE0KS4gV2hhdCBJIHN1cmVseSB3YW50Cj4gdG8gc2Vl
IHVzIGF2b2lkIGlzIGEgYmFjayBhbmQgZm9ydGggaW4gYmVoYXZpb3Igb2YgcmVsZWFzZWQgdmVy
c2lvbnMuCj4gKE5vdGUgdGhhdCA0LjEyLjIgaXMgc2ltaWxhcmx5IGJsb2NrZWQgb24gYSBkZWNp
c2lvbiBlaXRoZXIgd2F5IGhlcmUuKQo+IAo+IEknbSBoYXBweSB0byB0YWtlIGJldHRlciBzdWdn
ZXN0aW9ucyB0byByZXBsYWNlICJmdWxsIi4KCkkgd2FzIGdvaW5nIHRvIGNvbW1lbnQgb24gdjEs
IGJ1dCBJIHJlYWxseSBoYXZlIG5vIGJldHRlciBhbHRlcm5hdGl2ZS4KCj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2lvbW11LmMKPiBAQCAtMzAsMTMgKzMwLDE3IEBAIGJvb2xfdCBfX2luaXRkYXRhIGlvbW11X2Vu
YWJsZSA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2VuYWJsZWQ7Cj4gIGJvb2xf
dCBfX3JlYWRfbW9zdGx5IGZvcmNlX2lvbW11Owo+ICBib29sX3QgX19yZWFkX21vc3RseSBpb21t
dV92ZXJib3NlOwo+IC1ib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfcXVhcmFudGluZSA9IHRydWU7
Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2lnZnggPSAxOwo+ICBib29sX3QgX19yZWFk
X21vc3RseSBpb21tdV9zbm9vcCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X3Fp
bnZhbCA9IDE7Cj4gIGJvb2xfdCBfX3JlYWRfbW9zdGx5IGlvbW11X2ludHJlbWFwID0gMTsKPiAg
Ym9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfY3Jhc2hfZGlzYWJsZTsKPiAgCj4gKyNkZWZpbmUg
SU9NTVVfcXVhcmFudGluZV9ub25lICAwCj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9iYXNp
YyAxCj4gKyNkZWZpbmUgSU9NTVVfcXVhcmFudGluZV9mdWxsICAyCj4gK3VpbnQ4X3QgX19yZWFk
X21vc3RseSBpb21tdV9xdWFyYW50aW5lID0gSU9NTVVfcXVhcmFudGluZV9iYXNpYzsKCkkgd29u
ZGVyIHdoZXRoZXIgdGhlIGRlZmF1bHQgc2hvdWxkIGJlIHRvIHVzZSB0aGUgc2luayBwYWdlLiBO
b3QgdXNpbmcKaXQgY2FuIGxlYWQgdG8gYSBoYXJkIGhhbmcgb24gY2VydGFpbiBoYXJkd2FyZSBh
Y2NvcmRpbmcgdG8gdGhlCmRlc2NyaXB0aW9uLiBPVE9IIGlmIHN1Y2ggZGV2aWNlcyBhcmUgYWN0
dWFsbHkgcGFzc2VkIHRocm91Z2gsIHRoZQpndWVzdCBpdHNlbGYgY2FuIHRyaWdnZXIgc3VjaCBw
YWdlIGZhdWx0cyBhbmQgaGVuY2UgZnJlZXplIHRoZSBzeXN0ZW0uCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
