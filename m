Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 108BAEB3DE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 16:27:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQCI8-0001X6-NO; Thu, 31 Oct 2019 15:23:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Kehi=YY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iQCI7-0001X1-E5
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 15:23:15 +0000
X-Inumbo-ID: 5b0f4db4-fbf2-11e9-8aca-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b0f4db4-fbf2-11e9-8aca-bc764e2007e4;
 Thu, 31 Oct 2019 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572535395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=DmEMxtbsqxgLgy+Syv7WsjEcvRbrA9u3yV4qii8D/r8=;
 b=hiScJQQqrtKsKYw6OTesmZUuHqTgp4oFYOg/sNovU8SLyyW6Vba92Ek7
 P1pwkmEOSFRoNTREcKSAM+0j5A2VuIQZ1tVC6ZPa2l24AKx4jYKU/uXNR
 iRuvmKgVbNOuQzji8mXGP8DtcU4QdF6zzfnnllhH4XPEofHscd3e2b4BZ s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fEl7uXLuDg96qwpEZX9ZbO4busCt+0HCqWR9zT2NTUHKTsjPrSrCrLAdbDHfVI8uXk3+6lPkA8
 Hq5KgLWz4iQpcav3wmBVnid13+tsCIa30LrireLR7jBXUm5J7ENdCMG7e49EfyHL/hWRjqyNKD
 xE1qjuPb2lCx+OQTIK6W6zhyhzVBo30pmx0uusZcGPZfqhicHoexjTCkvUNFd7DFwNRZxSbJqd
 qz3i+R8IjuWgR5ZVMTlpJkkQLY8BkU90V1USfeNZdqrS3L3fvZAiqaXwHMuz2EohRrUaml4V4r
 AmA=
X-SBRS: 2.7
X-MesageID: 7682555
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,252,1569297600"; 
   d="scan'208";a="7682555"
Date: Thu, 31 Oct 2019 16:23:04 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Joe Jin <joe.jin@oracle.com>
Message-ID: <20191031152304.GY17494@Air-de-Roger>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBPY3QgMzEsIDIwMTkgYXQgMDc6NTI6MjNBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToK
PiBPbiAxMC8zMS8xOSAxOjAxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDMwLjEwLjIw
MTkgMTk6MDEsIEpvZSBKaW4gd3JvdGU6Cj4gPj4gT24gMTAvMzAvMTkgMTA6MjMgQU0sIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgT2N0IDMwLCAyMDE5IGF0IDA5OjM4OjE2
QU0gLTA3MDAsIEpvZSBKaW4gd3JvdGU6Cj4gPj4+PiBPbiAxMC8zMC8xOSAxOjI0IEFNLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+Pj4+IENhbiB5b3UgdHJ5IHRvIGFkZCB0aGUgZm9sbG93
aW5nIGRlYnVnIHBhdGNoIG9uIHRvcCBvZiB0aGUgZXhpc3RpbmcKPiA+Pj4+PiBvbmUgYW5kIHJl
cG9ydCB0aGUgb3V0cHV0IHRoYXQgeW91IGdldCBvbiB0aGUgWGVuIGNvbnNvbGU/Cj4gPj4+Pgo+
ID4+Pj4gQXBwbGllZCBkZWJ1ZyBwYXRjaCBhbmQgcnVuIHRoZSB0ZXN0IGFnYWluLCBub3Qgb2Yg
YW55IGxvZyBwcmludGVkLAo+ID4+Pj4gYXR0YWNoZWQgWGVuIGxvZyBvbiBzZXJpYWwgY29uc29s
ZSwgc2VlbXMgcGlfdXBkYXRlX2lydGUoKSBub3QgYmVlbgo+ID4+Pj4gY2FsbGVkIGZvciBpb21t
dV9pbnRwb3N0IHdhcyBmYWxzZS4KPiA+Pj4KPiA+Pj4gSSBoYXZlIHRvIGFkbWl0IEknbSBsb3N0
IGF0IHRoaXMgcG9pbnQuIERvZXMgaXQgbWVhbiB0aGUgb3JpZ2luYWwKPiA+Pj4gaXNzdWUgaGFk
IG5vdGhpbmcgdG8gZG8gd2l0aCBwb3N0ZWQgaW50ZXJydXB0cz8KPiA+Pgo+ID4+IExvb2tzIHdo
ZW4gaW5qZWN0IGlycSBieSB2bGFwaWNfc2V0X2lycSgpLCBpdCBjaGVja2VkIGJ5Cj4gPj4gaHZt
X2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIgcmF0aGVyIHRoYW4gaW9tbXVfaW50cG9zdDoKPiA+
Pgo+ID4+ICAxNzYgICAgIGlmICggaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIgKQo+ID4+
ICAxNzcgICAgICAgICBodm1fZnVuY3MuZGVsaXZlcl9wb3N0ZWRfaW50cih0YXJnZXQsIHZlYyk7
Cj4gPj4KPiA+PiBBbmQgZGVsaXZlcl9wb3N0ZWRfaW50cigpIHdvdWxkIGJlIHRoZXJlLCB3aGVu
IHZteCBlbmFibGVkOgo+ID4+Cj4gPj4gKFhFTikgSFZNOiBWTVggZW5hYmxlZAo+ID4+IChYRU4p
IEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkCj4gPj4gKFhFTikg
SFZNOiBIQVAgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgo+ID4gCj4gPiBJIGNhbid0IHNlZSB0
aGUgY29ubmVjdGlvbi4gc3RhcnRfdm14KCkgaGFzCj4gPiAKPiA+ICAgICBpZiAoIGNwdV9oYXNf
dm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ID4gICAgIHsKPiA+ICAgICAgICAgYWxsb2Nf
ZGlyZWN0X2FwaWNfdmVjdG9yKCZwb3N0ZWRfaW50cl92ZWN0b3IsIHBpX25vdGlmaWNhdGlvbl9p
bnRlcnJ1cHQpOwo+ID4gICAgICAgICBpZiAoIGlvbW11X2ludHBvc3QgKQo+ID4gICAgICAgICAg
ICAgYWxsb2NfZGlyZWN0X2FwaWNfdmVjdG9yKCZwaV93YWtldXBfdmVjdG9yLCBwaV93YWtldXBf
aW50ZXJydXB0KTsKPiA+IAo+ID4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUuZGVsaXZlcl9w
b3N0ZWRfaW50ciA9IHZteF9kZWxpdmVyX3Bvc3RlZF9pbnRyOwo+ID4gICAgICAgICB2bXhfZnVu
Y3Rpb25fdGFibGUuc3luY19waXJfdG9faXJyICAgICA9IHZteF9zeW5jX3Bpcl90b19pcnI7Cj4g
PiAgICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS50ZXN0X3BpciAgICAgICAgICAgID0gdm14X3Rl
c3RfcGlyOwo+ID4gICAgIH0KPiA+IAo+ID4gaS5lLiB0aGUgaG9vayBpcyBwcmVzZW50IG9ubHkg
d2hlbiBwb3N0ZWQgaW50ZXJydXB0cyBhcmUKPiA+IGF2YWlsYWJsZSBpbiBnZW5lcmFsLiBJLmUu
IGFsc28gd2l0aCBqdXN0IENQVS1zaWRlIHBvc3RlZAo+ID4gaW50ZXJydXB0cywgeWVzLCB3aGlj
aCBnZXRzIGNvbmZpcm1lZCBieSB5b3VyICJhcGljdj0wIgo+ID4gdGVzdC4gWWV0IHdpdGgganVz
dCBDUFUtc2lkZSBwb3N0ZWQgaW50ZXJydXB0cyBJJ20KPiA+IHN0cnVnZ2xpbmcgYWdhaW4gdG8g
dW5kZXJzdGFuZCB5b3VyIG9yaWdpbmFsIHByb2JsZW0KPiA+IGRlc2NyaXB0aW9uLCBhbmQgdGhl
IG5lZWQgdG8gZmlkZGxlIHdpdGggSU9NTVUgc2lkZSBjb2RlLgo+IAo+IFllcywgb24gbXkgdGVz
dCBlbnYsIGNwdV9oYXNfdm14X3Bvc3RlZF9pbnRyX3Byb2Nlc3NpbmcgPT0gdHJ1ZSAmJiBpb21t
dV9pbnRwb3N0ID09IGZhbHNlLAo+IHdpdGggdGhpcywgcG9zdGVkIGludGVycnVwdHMgYmVlbiBl
bmFibGVkLgoKSSdtIHN0aWxsIHF1aXRlIGxvc3QuIE15IHJlYWRpbmcgb2YgdGhlIEludGVsIFZU
LWQgc3BlYyBpcyB0aGF0IHRoZQpwb3N0ZWQgaW50ZXJydXB0IGRlc2NyaXB0b3IgKHdoaWNoIGNv
bnRhaW5zIHRoZSBQSVJSKSBpcyB1c2VkIGluCmNvbmp1bmN0aW9uIHdpdGggYSBwb3N0ZWQgaW50
ZXJydXB0IHJlbWFwcGluZyBlbnRyeSBpbiB0aGUgaW9tbXUsIHNvCnRoYXQgaW50ZXJydXB0cyBn
ZXQgcmVjb3JkZWQgaW4gdGhlIFBJUlIgYW5kIGxhdGVyIHN5bmNlZCBieSB0aGUKaHlwZXJ2aXNv
ciBpbnRvIHRoZSB2bGFwaWMgSVJSIHdoZW4gcmVzdW1pbmcgdGhlIHZpcnR1YWwgQ1BVLgoKSG93
IGlzIHRoZSBQSVJSIGZpbGxlZCBpZiB0aGVyZSdzIG5vIGludGVycnVwdCByZW1hcHBpbmcgZW50
cnkKcG9pbnRpbmcgdG8gaXQ/CgpJIGhhdmUgdG8gYWRtaXQgSSdtIG5vdCBzdXBlci1mYW1pbGlh
ciB3aXRoIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBYZW4sCnNvIGl0J3MgbGlrZWx5IEknbSBtaXNz
aW5nIHNvbWV0aGluZy4KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
