Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BAB762EB
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqwds-0001G3-0S; Fri, 26 Jul 2019 09:36:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqwdq-0001Fy-HY
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 09:35:58 +0000
X-Inumbo-ID: c52f87e7-af88-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c52f87e7-af88-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 09:35:57 +0000 (UTC)
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
IronPort-SDR: 1moEA/ZmZEQYBGbNtF5TNxC/x5HXb4kpvYRIr/wC5UF0/pOt+XBLzZeIo9zM6SlC1NObKcxOTz
 sx8Vw6tVz9vyqBAKOwSnHHDbcC1T5dlSMFadrpWUKVbLeKHUhCtDKcDVW6lfVDUolT9EjNOGVt
 ivZV5D65JzD+J+SHJuOWcxLr9kd67wHOJn8FN85GwQmXGhPTyDiJNeVRkNTflfLRrJOcUfChmM
 63pniLwBqGzh5vf82Y2ooAr7R4+IVW2KaR7Qygq0NKSTv2kzWS67foxamr+4aKjgJ0P+76I5sz
 j7I=
X-SBRS: 2.7
X-MesageID: 3564811
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,310,1559534400"; 
   d="scan'208";a="3564811"
Date: Fri, 26 Jul 2019 11:35:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
References: <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
 <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDU6NDc6MTlQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5p
ayB3cm90ZToKPiBIaSBSb2dlciEKPiAKPiBXaXRoIHlvdXIgcGF0Y2ggKGFuZCBidWlsZCBhcyBh
IGRlYnVnIGJ1aWxkKSBYZW4gY3Jhc2hlcyBvbiBib290Cj4gKHdoaWNoIEkgZ3Vlc3Mgd2FzIHRo
ZSBwb2ludCBvZiB5b3VyIEJVR19PTiBzdGF0ZW1lbnQpLgoKWWVzLCB0aGF0J3MgdmVyeSB3ZWly
ZCwgc2VlbXMgbGlrZSBlbnRyaWVzIGFyZSBub3QgYWRkZWQgdG8gdGhlIGlvbW11CnBhZ2UgdGFi
bGVzIGJ1dCBJIGhhdmUgbm8gaWRlYSB3aHksIEFGQUlDVCB0aGlzIHdvcmtzIGZpbmUgb24gbXkK
c3lzdGVtLgoKRG8geW91IGhhdmUgYW55IHBhdGNoZXMgb24gdG9wIG9mIFJFTEVBU0UtNC4xMi4w
PwoKSSBoYXZlIGFub3RoZXIgcGF0Y2ggd2l0aCBtb3JlIHZlcmJvc2Ugb3V0cHV0LCBjb3VsZCB5
b3UgZ2l2ZSBpdCBhCnRyeT8gSXQncyBtYXliZSBnb2luZyB0byBiZSBtb3JlIGNoYXR0eSB0aGFu
IHRoZSBwcmV2aW91cyBvbmUuCgpJJ20gc29ycnkgdG8ga2VlcCB5b3UgdGVzdGluZyBzdHVmZiwg
YnV0IHNpbmNlIEkgY2Fubm90IHJlcHJvZHVjZSB0aGlzCmxvY2FsbHkgSSBoYXZlIHRvIHJlbHkg
b24geW91IHRvIHByb3ZpZGUgdGhlIGRlYnVnIG91dHB1dC4KClRoYW5rcywgUm9nZXIuCi0tLTg8
LS0tCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0v
cDJtLmMKaW5kZXggYjliYmI4ZjQ4NS4uNzVmODM1OWE5OSAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwpAQCAtMTMzMSw3ICsxMzMx
LDcgQEAgaW50IHNldF9pZGVudGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWdu
ZWQgbG9uZyBnZm5fbCwKIAogICAgIGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRv
bWFpbikgKQogICAgIHsKLSAgICAgICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKKyAg
ICAgICAgaWYgKCAhaGFzX2lvbW11X3B0KGQpICkKICAgICAgICAgICAgIHJldHVybiAwOwogICAg
ICAgICByZXR1cm4gaW9tbXVfbGVnYWN5X21hcChkLCBfZGZuKGdmbl9sKSwgX21mbihnZm5fbCks
IFBBR0VfT1JERVJfNEssCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9y
ZWFkYWJsZSB8IElPTU1VRl93cml0YWJsZSk7CkBAIC0xNDIyLDcgKzE0MjIsNyBAQCBpbnQgY2xl
YXJfaWRlbnRpdHlfcDJtX2VudHJ5KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGxvbmcgZ2Zu
X2wpCiAKICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQogICAgIHsKLSAgICAg
ICAgaWYgKCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKKyAgICAgICAgaWYgKCAhaGFzX2lvbW11
X3B0KGQpICkKICAgICAgICAgICAgIHJldHVybiAwOwogICAgICAgICByZXR1cm4gaW9tbXVfbGVn
YWN5X3VubWFwKGQsIF9kZm4oZ2ZuX2wpLCBQQUdFX09SREVSXzRLKTsKICAgICB9CmRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW9tbXUuYwppbmRleCAxMTdiODY5YjBjLi4yMTRjNWQ1MTVmIDEwMDY0NAotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKQEAgLTI5MSw4ICsyOTEsMTggQEAgaW50IGlvbW11X21hcChzdHJ1Y3QgZG9t
YWluICpkLCBkZm5fdCBkZm4sIG1mbl90IG1mbiwKICAgICB1bnNpZ25lZCBsb25nIGk7CiAgICAg
aW50IHJjID0gMDsKIAoraWYgKGRmbl94KGRmbikgPj0gMHg4ZDgwMCAmJiBkZm5feChkZm4pIDwg
MHg5MDAwMCApCit7CisgICAgcHJpbnRrKCI8Uk1SUj4gaW9tbXVfbWFwICUjbHhcbiIsIGRmbl94
KGRmbikpOworICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOworfQorCiAgICAgaWYgKCAh
aW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCit7CisgICAgcHJpbnRrKCJpb21t
dV9lbmFibGVkOiAlZCBwbGF0Zm9ybV9vcHMgJXBcbiIsCisgICAgICAgICAgIGlvbW11X2VuYWJs
ZWQsIGhkLT5wbGF0Zm9ybV9vcHMpOwogICAgICAgICByZXR1cm4gMDsKK30KIAogICAgIEFTU0VS
VChJU19BTElHTkVEKGRmbl94KGRmbiksICgxdWwgPDwgcGFnZV9vcmRlcikpKTsKICAgICBBU1NF
UlQoSVNfQUxJR05FRChtZm5feChtZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKSk7CmRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9pb21tdS5jCmluZGV4IDUwYTBlMjUyMjQuLjhjM2ZjYjUwYWUgMTAwNjQ0
Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCisrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCkBAIC0yMDA5LDEyICsyMDA5LDMzIEBAIHN0YXRp
YyBpbnQgcm1ycl9pZGVudGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBtYXAs
CiAgICAgaWYgKCAhbWFwICkKICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7CiAKK3ByaW50aygiPFJN
UlI+IG1hcHBpbmcgJSNseCAtICUjbHhcbiIsIGJhc2VfcGZuLCBlbmRfcGZuKTsKICAgICB3aGls
ZSAoIGJhc2VfcGZuIDwgZW5kX3BmbiApCiAgICAgewogICAgICAgICBpbnQgZXJyID0gc2V0X2lk
ZW50aXR5X3AybV9lbnRyeShkLCBiYXNlX3BmbiwgcDJtX2FjY2Vzc19ydywgZmxhZyk7CisgICAg
ICAgIG1mbl90IG1mbjsKKyAgICAgICAgdW5zaWduZWQgaW50IGY7CiAKICAgICAgICAgaWYgKCBl
cnIgKQogICAgICAgICAgICAgcmV0dXJuIGVycjsKKworZXJyID0gaW50ZWxfaW9tbXVfbG9va3Vw
X3BhZ2UoZCwgX2RmbihiYXNlX3BmbiksICZtZm4sICZmKTsKK2lmICggZXJyICkKK3sKKyAgICBw
cmludGsoImludGVsX2lvbW11X2xvb2t1cF9wYWdlIGVycjogJWRcbiIsIGVycik7CisgICAgQlVH
KCk7Cit9CitpZiAoIGJhc2VfcGZuICE9IG1mbl94KG1mbikgKQoreworICAgIHByaW50aygiYmFz
ZV9wZm46ICUjbHggbWZuOiAlI2x4XG4iLCBiYXNlX3BmbiwgbWZuX3gobWZuKSk7CisgICAgQlVH
KCk7Cit9CitpZiAoIGYgIT0gKElPTU1VRl9yZWFkYWJsZSB8IElPTU1VRl93cml0YWJsZSkgKQor
eworICAgIHByaW50aygiZmxhZ3M6ICUjeFxuIiwgZik7CisgICAgQlVHKCk7Cit9CisKICAgICAg
ICAgYmFzZV9wZm4rKzsKICAgICB9CiAKQEAgLTIyNjMsNiArMjI4NCw3IEBAIHN0YXRpYyB2b2lk
IF9faHdkb21faW5pdCBzZXR1cF9od2RvbV9ybXJyKHN0cnVjdCBkb21haW4gKmQpCiAgICAgdTE2
IGJkZjsKICAgICBpbnQgcmV0LCBpOwogCitwcmludGsoIjxSTVJSPiBzZXR0aW5nIHVwIHJlZ2lv
bnNcbiIpOwogICAgIHBjaWRldnNfbG9jaygpOwogICAgIGZvcl9lYWNoX3JtcnJfZGV2aWNlICgg
cm1yciwgYmRmLCBpICkKICAgICB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
