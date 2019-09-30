Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCA3C1DB1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 11:12:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iErh4-0007P9-Vc; Mon, 30 Sep 2019 09:10:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=znM2=XZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iErh3-0007Ov-Ll
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 09:10:09 +0000
X-Inumbo-ID: 18fcbba8-e362-11e9-96cb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by localhost (Halon) with ESMTPS
 id 18fcbba8-e362-11e9-96cb-12813bfff9fa;
 Mon, 30 Sep 2019 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569834608;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NumTfXGXvkxhv89KFH+RZ54jxTZts8IhWLWbr3y2PHw=;
 b=bgrMazgC3VgJheqpl8PdcobMJQ47A48OPEEG/dVEvGb7u/n6Fcl4q2gW
 TtYGJSwbgtIvh36QJc1JLKPd1yVSgQXUc8CDIbBkGa4CCVtSMYEtDrY2o
 U9Gc1HqHqOtOMUjFFn0pmS7qtBCMfGapX4E7+pk8bOhdi77uXn7+Px8SP 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t7/4L12O9xnP1+DfObngNmi/mH/48OF4+8Y8RtXefTpegvIxMhwfKtJYoQ2WPa3ZLyikd+givq
 VBYgCEc7slf/OzMbfZJqKsbxv9bEPZtOj7+GttESd5gvdFOoh0PEkrAgRXxvr2ceuyum9RRciL
 Bmrc060eI6CrKw4fV2wsl4gTJTw6jtsBOC9d9j0q7pPcI0oJYFdCMFROsAuGyQv5/rcPg83ZHn
 aPHTYc2J8+BLSX6SpsjXPhkalUwhewpyglPJIwJHhYIzxXt1xvhwI0SWod2TYFlL7djkw2zxvP
 fA4=
X-SBRS: 2.7
X-MesageID: 6245466
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,565,1559534400"; 
   d="scan'208";a="6245466"
Date: Mon, 30 Sep 2019 11:09:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190930090958.ipnrztutxql5uvrz@Air-de-Roger>
References: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569792271-19856-1-git-send-email-chao.gao@intel.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] x86/msi: Don't panic if msix
 capability is missing
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
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMDU6MjQ6MzFBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gQ3VycmVudCwgWGVuIGlzbid0IGF3YXJlIG9mIGRldmljZSByZXNldCAoaW5pdGlhdGVkIGJ5
IGRvbTApLiBYZW4gbWF5Cj4gYWNjZXNzIHRoZSBkZXZpY2Ugd2hpbGUgZGV2aWNlIGNhbm5vdCBy
ZXNwb25kIHRvIGNvbmZpZyByZXF1ZXN0cwo+IG5vcm1hbGx5IChlLmcuICBhZnRlciBkZXZpY2Ug
cmVzZXQsIGRldmljZSBtYXkgcmVzcG9uZCB0byBjb25maWcKPiByZXF1ZXN0cyB3aXRoIENSUyBj
b21wbGV0aW9ucyB0byBpbmRpY2F0ZSBpdCBuZWVkcyBtb3JlIHRpbWUgdG8KPiBjb21wbGV0ZSBh
IHJlc2V0LCByZWZlciB0byBwY2lfZGV2X3dhaXQoKSBpbiBsaW51eCBrZXJuZWwgZm9yIG1vcmUK
PiBkZXRhaWwpLiBIZXJlLCBkb24ndCBhc3N1bWUgbXNpeCBjYXBhYmlsaXR5IGlzIGFsd2F5cyB2
aXNpYmxlIGFuZAo+IHJldHVybiAtRUFHQUlOIHRvIHRoZSBjYWxsZXIuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAtLS0KPiBJIGRpZG4ndCBmaW5k
IGEgd2F5IHRvIHRyaWdnZXIgdGhlIGFzc2VydGlvbiBpbiBub3JtYWwgdXNhZ2VzLgo+IEl0IGlz
IGZvdW5kIGJ5IGFuIGludGVybmFsIHRlc3Q6IGVjaG8gMSB0byAvc3lzL2J1cy9wY2kvPHNiZGY+
L3Jlc2V0Cj4gd2hlbiB0aGUgZGV2aWNlIGlzIGJlaW5nIHVzZWQgYnkgYSBndWVzdC4gQWx0aG91
Z2ggdGhlIHRlc3QgaXMgYQo+IGxpdHRsZSBpbnNhbmUsIGl0IGlzIGJldHRlciB0byBhdm9pZCBj
cmFzaGluZyBYZW4gZXZlbiBmb3IgdGhpcyBjYXNlLgoKVGhlIGhhcmR3YXJlIGRvbWFpbiBkb2lu
ZyBzdWNoIHRoaW5ncyBiZWhpbmQgWGVuJ3MgYmFjayBpcyBxdWl0ZQpsaWtlbHkgdG8gZW5kIGJh
ZGx5LCBlaXRoZXIgaGl0dGluZyBhbiBBU1NFUlQgc29tZXdoZXJlIG9yIHdpdGggYQptYWxmdW5j
dGlvbmluZyBkZXZpY2UuIFhlbiBzaG91bGQgYmUgc2lnbmFsZWQgb2Ygd2hlbiBzdWNoIHJlc2V0
IGlzCmhhcHBlbmluZywgc28gaXQgY2FuIGFsc28gdGVhciBkb3duIHRoZSBpbnRlcm5hbCBzdGF0
ZSBvZiB0aGUKZGV2aWNlLgoKWGVuIGNvdWxkIHRyYXAgYWNjZXNzZXMgdG8gdGhlIEZMUiBiaXQg
aW4gb3JkZXIgdG8gZGV0ZWN0IGRldmljZQpyZXNldHMsIGJ1dCB0aGF0J3Mgb25seSBhIHdheSBv
ZiBwZXJmb3JtaW5nIGEgZGV2aWNlIHJlc2V0LCBvdGhlcgptZXRob2RzIGFyZSBsaWtlbHkgbW9y
ZSBjb21wbGljYXRlZCB0byBkZXRlY3QsIGFuZCBoZW5jZSB0aGlzIHdvdWxkCm9ubHkgYmUgYSBw
YXJ0aWFsIHNvbHV0aW9uLgoKSGF2ZSB5b3UgY29uc2lkZXJlZCB3aGV0aGVyIGl0J3MgZmVhc2li
bGUgdG8gc2lnbmFsIFhlbiB0aGF0IGEgZGV2aWNlCnJlc2V0IGlzIGhhcHBlbmluZywgc28gaXQg
Y2FuIHRvcm4gZG93biB0aGUgaW50ZXJuYWwgZGV2aWNlIHN0YXRlPwoKPiAtLS0KPiAgeGVuL2Fy
Y2gveDg2L21zaS5jIHwgOCArKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc2kuYyBi
L3hlbi9hcmNoL3g4Ni9tc2kuYwo+IGluZGV4IDc2ZDQwMzQuLmUyZjNjNmMgMTAwNjQ0Cj4gLS0t
IGEveGVuL2FyY2gveDg2L21zaS5jCj4gKysrIGIveGVuL2FyY2gveDg2L21zaS5jCj4gQEAgLTEy
NjUsNyArMTI2NSwxMyBAQCBpbnQgcGNpX21zaV9jb25mX3dyaXRlX2ludGVyY2VwdChzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywKPiAgICAgICAgICBwb3MgPSBlbnRyeSA/
IGVudHJ5LT5tc2lfYXR0cmliLnBvcwo+ICAgICAgICAgICAgICAgICAgICAgIDogcGNpX2ZpbmRf
Y2FwX29mZnNldChzZWcsIGJ1cywgc2xvdCwgZnVuYywKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUENJX0NBUF9JRF9NU0lYKTsKPiAtICAgICAgICBBU1NFUlQo
cG9zKTsKCkkgdGhpbmsgYXQgbGVhc3QgYSBjb21tZW50IHNob3VsZCBiZSBhZGRlZCBoZXJlIGRl
c2NyaWJpbmcgd2h5IGEKY2FwYWJpbGl0eSBtaWdodCBzdWRkZW5seSBkaXNhcHBlYXIuCgo+ICsg
ICAgICAgIGlmICggdW5saWtlbHkoIXBvcykgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAg
cHJpbnRrX29uY2UoWEVOTE9HX1dBUk5JTkcKCkknbSBub3Qgc3VyZSBpZiBwcmludGtfb25jZSBp
cyB0aGUgYmVzdCBvcHRpb24sIHRoZSBtZXNzYWdlIHdvdWxkIGJlCnByaW50ZWQgb25seSBvbmNl
LCBhbmQgZm9yIHRoZSBmaXJzdCBkZXZpY2UgdGhhdCBoaXRzIHRoaXMuIElkZWFsbHkgSQp0aGlu
ayBpdCBzaG91bGQgYmUgcHJpbnRlZCBhdCBsZWFzdCBvbmNlIGZvciBlYWNoIGRldmljZSB0aGF0
IGhpdHMKdGhpcyBjb25kaXRpb24uCgpBbHRlcm5hdGl2ZWx5IHlvdSBjYW4gdHVybiB0aGlzIGlu
dG8gYSBncHJpbnRrIHdoaWNoIHdvdWxkIGJlIGdvb2QKZW5vdWdoIElNTy4KClRoYW5rcywgUm9n
ZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
