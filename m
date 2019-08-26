Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD479CB54
	for <lists+xen-devel@lfdr.de>; Mon, 26 Aug 2019 10:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2A5s-0003zE-Ne; Mon, 26 Aug 2019 08:11:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=a7Cz=WW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i2A5r-0003z9-8w
 for xen-devel@lists.xenproject.org; Mon, 26 Aug 2019 08:11:15 +0000
X-Inumbo-ID: 12242e50-c7d9-11e9-8980-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12242e50-c7d9-11e9-8980-bc764e2007e4;
 Mon, 26 Aug 2019 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566807074;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vtdrxozzV/eJvLqob4ChzYqXp2cVQeJ/hqOdAkYdfOc=;
 b=GvmEyB/0LJRvroVTP7otc8QOsIr7vi89EryuFzZrU+uY3ycQqvGlO+JA
 Qt1XwOVhKbdeb9/HtedlWcaKTNJy/hT19SKmRTMB0/BJ4NEmYlT1A46u+
 2o/b+reJNqXdccv5rzs6c8wkZws6qstHIqvEdZPOk9xoeTZ3cyy8MYmYv k=;
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
IronPort-SDR: z0j2J5LtvDhRhRj2ssJsjtJeeVutDTJt56zydbaiAOC4e9wpR0FdD9TX0col9mALF9gJWKPek/
 a5VUo0YWHHB9fSul+PZ654+dF7Wey4C3gbVvsKliD9XgshmzF4P0mISTTkJ60eR9jILGn6JqLo
 MMf5/ebiRKFOCCfFdbd76dwjUMfVZU4r7Z/pqK4am14A19wLAwhhsLi60+vEyy1B5QVpIYLc9n
 f2Lc1u/6X2F9j+a7RXh4c2cv6IcLic7uCk5sOBXo5vFSKveG0DbjbFnAfvaOLylVsGEi2UBsih
 33w=
X-SBRS: 2.7
X-MesageID: 4883252
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,431,1559534400"; 
   d="scan'208";a="4883252"
Date: Mon, 26 Aug 2019 10:11:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190826081103.hb5diw7brmnbiwbv@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-13-git-send-email-chao.gao@intel.com>
 <20190823081121.khm5622trozzhswe@Air-de-Roger>
 <20190826070320.GA11910@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826070320.GA11910@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 12/15] microcode: reduce memory
 allocation and copy when creating a patch
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
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMDM6MDM6MjJQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTA6MTE6MjFBTSArMDIwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6MjU6MjVBTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gVG8gY3JlYXRlIGEgbWljcm9jb2RlIHBhdGNoIGZyb20gYSB2
ZW5kb3Itc3BlY2lmaWMgdXBkYXRlLAo+ID4+IGFsbG9jYXRlX21pY3JvY29kZV9wYXRjaCgpIGNv
cGllZCBldmVyeXRoaW5nIGZyb20gdGhlIHVwZGF0ZS4KPiA+PiBJdCBpcyBub3QgZWZmaWNpZW50
LiBFc3NlbnRpYWxseSwgd2UganVzdCBuZWVkIHRvIGdvIHRocm91Z2gKPiA+PiB1Y29kZXMgaW4g
dGhlIGJsb2IsIGZpbmQgdGhlIG9uZSB3aXRoIHRoZSBuZXdlc3QgcmV2aXNpb24gYW5kCj4gPj4g
aW5zdGFsbCBpdCBpbnRvIHRoZSBtaWNyb2NvZGVfcGF0Y2guIEluIHRoZSBwcm9jZXNzLCBidWZm
ZXJzCj4gPj4gbGlrZSBtY19hbWQsIGVxdWl2X2NwdV90YWJsZSAob24gQU1EIHNpZGUpLCBhbmQg
bWMgKG9uIEludGVsCj4gPj4gc2lkZSkgY2FuIGJlIHJldXNlZC4gbWljcm9jb2RlX3BhdGNoIG5v
dyBpcyBhbGxvY2F0ZWQgYWZ0ZXIKPiA+PiBpdCBpcyBzdXJlIHRoYXQgdGhlcmUgaXMgYSBtYXRj
aGluZyB1Y29kZS4KPiA+Cj4gPk9oLCBJIHRoaW5rIHRoaXMgYW5zd2VycyBteSBxdWVzdGlvbiBv
biBhIHByZXZpb3VzIHBhdGNoLgo+ID4KPiA+Rm9yIGZ1dHVyZSBzZXJpZXMgaXQgd291bGQgYmUg
bmljZSB0byBhdm9pZCBzbyBtYW55IHJld3JpdGVzIGluIHRoZQo+ID5zYW1lIHNlcmllcywgYWxs
b2NfbWljcm9jb2RlX3BhdGNoIGlzIGFscmVhZHkgbW9kaWZpZWQgaW4gYSBwcmV2aW91cwo+ID5w
YXRjaCwganVzdCB0byBiZSByZW1vdmVkIGhlcmUuIEl0IGFsc28gbWFrZXMgaXQgaGFyZGVyIHRv
IGZvbGxvdwo+ID53aGF0J3MgZ29pbmcgb24uCj4gCj4gR290IGl0LiBUaGlzIHBhdGNoIGlzIGFk
ZGVkIGluIHRoaXMgbmV3IHZlcnNpb24uIEFuZCBzb21lIHRyaXZpYWwKPiBwYXRjaGVzIGFscmVh
ZHkgZ290IHJldmlld2VkLWJ5LiBTbyBJIGRvbid0IG1lcmdlIGl0IHdpdGggdGhlbS4KPiAKPiA+
PiAgICAgIHdoaWxlICggKGVycm9yID0gZ2V0X3Vjb2RlX2Zyb21fYnVmZmVyX2FtZChtY19hbWQs
IGJ1ZiwgYnVmc2l6ZSwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmb2Zmc2V0KSkgPT0gMCApCj4gPj4gICAgICB7Cj4gPj4gLSAgICAgICAgc3Ry
dWN0IG1pY3JvY29kZV9wYXRjaCAqbmV3X3BhdGNoID0gYWxsb2NfbWljcm9jb2RlX3BhdGNoKG1j
X2FtZCk7Cj4gPj4gLQo+ID4+IC0gICAgICAgIGlmICggSVNfRVJSKG5ld19wYXRjaCkgKQo+ID4+
IC0gICAgICAgIHsKPiA+PiAtICAgICAgICAgICAgZXJyb3IgPSBQVFJfRVJSKG5ld19wYXRjaCk7
Cj4gPj4gLSAgICAgICAgICAgIGJyZWFrOwo+ID4+IC0gICAgICAgIH0KPiA+PiAtCj4gPj4gICAg
ICAgICAgLyoKPiA+PiAtICAgICAgICAgKiBJZiB0aGUgbmV3IHBhdGNoIGNvdmVycyBjdXJyZW50
IENQVSwgY29tcGFyZSBwYXRjaGVzIGFuZCBzdG9yZSB0aGUKPiA+PiArICAgICAgICAgKiBJZiB0
aGUgbmV3IHVjb2RlIGNvdmVycyBjdXJyZW50IENQVSwgY29tcGFyZSB1Y29kZXMgYW5kIHN0b3Jl
IHRoZQo+ID4+ICAgICAgICAgICAqIG9uZSB3aXRoIGhpZ2hlciByZXZpc2lvbi4KPiA+PiAgICAg
ICAgICAgKi8KPiA+PiAtICAgICAgICBpZiAoIChtaWNyb2NvZGVfZml0cyhuZXdfcGF0Y2gtPm1j
X2FtZCkgIT0gTUlTX1VDT0RFKSAmJgo+ID4+IC0gICAgICAgICAgICAgKCFwYXRjaCB8fCAoY29t
cGFyZV9wYXRjaChuZXdfcGF0Y2gsIHBhdGNoKSA9PSBORVdfVUNPREUpKSApCj4gPj4gKyNkZWZp
bmUgUkVWX0lEKG1wYikgKCgoc3RydWN0IG1pY3JvY29kZV9oZWFkZXJfYW1kICopKG1wYikpLT5w
cm9jZXNzb3JfcmV2X2lkKQo+ID4+ICsgICAgICAgIGlmICggKG1pY3JvY29kZV9maXRzKG1jX2Ft
ZCkgIT0gTUlTX1VDT0RFKSAmJgo+ID4+ICsgICAgICAgICAgICAgKCFzYXZlZCB8fCAoUkVWX0lE
KG1jX2FtZC0+bXBiKSA+IFJFVl9JRChzYXZlZCkpKSApCj4gPj4gKyN1bmRlZiBSRVZfSUQKPiA+
PiAgICAgICAgICB7Cj4gPj4gLSAgICAgICAgICAgIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnRt
cCA9IHBhdGNoOwo+ID4+IC0KPiA+PiAtICAgICAgICAgICAgcGF0Y2ggPSBuZXdfcGF0Y2g7Cj4g
Pj4gLSAgICAgICAgICAgIG5ld19wYXRjaCA9IHRtcDsKPiA+PiArICAgICAgICAgICAgeGZyZWUo
c2F2ZWQpOwo+ID4+ICsgICAgICAgICAgICBzYXZlZCA9IG1jX2FtZC0+bXBiOwo+ID4+ICsgICAg
ICAgICAgICBzYXZlZF9zaXplID0gbWNfYW1kLT5tcGJfc2l6ZTsKPiA+PiAgICAgICAgICB9Cj4g
Pj4gLQo+ID4+IC0gICAgICAgIGlmICggbmV3X3BhdGNoICkKPiA+PiAtICAgICAgICAgICAgbWlj
cm9jb2RlX2ZyZWVfcGF0Y2gobmV3X3BhdGNoKTsKPiA+PiArICAgICAgICBlbHNlCj4gPj4gKyAg
ICAgICAgICAgIHhmcmVlKG1jX2FtZC0+bXBiKTsKPiAKPiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8g
bW92ZSAnbWNfYW1kLT5tcGIgPSBOVUxMJyBoZXJlLgo+IAo+ID4+ICAKPiA+PiAgICAgICAgICBp
ZiAoIG9mZnNldCA+PSBidWZzaXplICkKPiA+PiAgICAgICAgICAgICAgYnJlYWs7Cj4gPj4gQEAg
LTU5Myw5ICs1NDgsMjUgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKmNwdV9yZXF1
ZXN0X21pY3JvY29kZShjb25zdCB2b2lkICpidWYsCj4gPj4gICAgICAgICAgICAgICAqKGNvbnN0
IHVpbnQzMl90ICopKGJ1ZiArIG9mZnNldCkgPT0gVUNPREVfTUFHSUMgKQo+ID4+ICAgICAgICAg
ICAgICBicmVhazsKPiA+PiAgICAgIH0KPiA+PiAtICAgIHhmcmVlKG1jX2FtZC0+bXBiKTsKPiA+
PiAtICAgIHhmcmVlKG1jX2FtZC0+ZXF1aXZfY3B1X3RhYmxlKTsKPiA+PiAtICAgIHhmcmVlKG1j
X2FtZCk7Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCBzYXZlZCApCj4gPj4gKyAgICB7Cj4gPj4gKyAg
ICAgICAgbWNfYW1kLT5tcGIgPSBzYXZlZDsKPiA+PiArICAgICAgICBtY19hbWQtPm1wYl9zaXpl
ID0gc2F2ZWRfc2l6ZTsKPiA+PiArICAgICAgICBwYXRjaCA9IHhtYWxsb2Moc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCk7Cj4gPj4gKyAgICAgICAgaWYgKCBwYXRjaCApCj4gPj4gKyAgICAgICAgICAg
IHBhdGNoLT5tY19hbWQgPSBtY19hbWQ7Cj4gPj4gKyAgICAgICAgZWxzZQo+ID4+ICsgICAgICAg
IHsKPiA+PiArICAgICAgICAgICAgZnJlZV9wYXRjaChtY19hbWQpOwo+ID4+ICsgICAgICAgICAg
ICBlcnJvciA9IC1FTk9NRU07Cj4gPj4gKyAgICAgICAgfQo+ID4+ICsgICAgfQo+ID4+ICsgICAg
ZWxzZQo+ID4+ICsgICAgewo+ID4+ICsgICAgICAgIG1jX2FtZC0+bXBiID0gTlVMTDsKPiA+Cj4g
PldoYXQncyB0aGUgcG9pbnQgaW4gc2V0dGluZyBtcGIgdG8gTlVMTCBpZiB5b3UgYXJlIGp1c3Qg
Z29pbmcgdG8gZnJlZQo+ID5tY19hbWQgYmVsb3c/Cj4gCj4gVG8gYXZvaWQgZG91YmxlIGZyZWUg
aGVyZS4gbWNfYW1kLT5tcGIgaXMgYWx3YXlzIGZyZWVkIG9yIHNhdmVkLgo+IEFuZCBoZXJlIHdl
IHdhbnQgdG8gZnJlZSBtY19hbWQgaXRzZWxmIGFuZCBtY19hbWQtPmVxdWl2X2NwdV90YWJsZS4K
CkJ1dCB0aGVyZSdzIG5vIGNoYW5jZSBvZiBhIGRvdWJsZSBmcmVlIGhlcmUsIHNpbmNlIHlvdSBh
cmUgZnJlZWluZwptY19hbWQgaW4gdGhlIGxpbmUgYmVsb3cgYWZ0ZXIgc2V0dGluZyBtcGIgPSBO
VUxMLgoKSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIHNldCBtcGIgPSBOVUxMIGFmdGVy
IGZyZWVpbmcgaXQgaW5zaWRlCnRoZSBsb29wLgoKV2l0aCB0aGF0IHlvdSBjYW4gYWRkIG15OgoK
UmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKPiA+
Cj4gPkFsc28sIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2h5IHlvdSBuZWVkIHRvIGZyZWUg
bWNfYW1kLCBpc24ndAo+ID50aGlzIGJ1ZmYgbWVtb3J5IHRoYXQgc2hvdWxkIGJlIGZyZWVkIGJ5
IHRoZSBjYWxsZXI/Cj4gCj4gQnV0IG1jX2FtZCBpcyBhbGxvY2F0ZWQgaW4gdGhpcyBmdW5jdGlv
bi4KPiAKPiA+Cj4gPmllOiBpbiB0aGUgSW50ZWwgY291bnRlcnBhcnQgYmVsb3cgeW91IGRvbid0
IHNlZW0gdG8gZnJlZSB0aGUgbWMKPiA+Y3Vyc29yIHVzZWQgZm9yIHRoZSBnZXRfbmV4dF91Y29k
ZV9mcm9tX2J1ZmZlciBsb29wLgo+IAo+ICdtYycgaXMgc2F2ZWQgaWYgaXQgaXMgbmV3ZXIgdGhh
biBjdXJyZW50IHBhdGNoIHN0b3JlZCBpbiAnc2F2ZWQnLgo+IE90aGVyd2lzZSAnbWMnIGlzIGZy
ZWVkIGltbWVkaWF0ZWx5LiBTbyB3ZSBkb24ndCBuZWVkIHRvIGZyZWUgaXQKPiBhZ2FpbiBhZnRl
ciB0aGUgd2hpbGUgbG9vcC4KCkFjaywgdGhhbmtzIQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
