Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901239AB2B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 11:12:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i15ZT-0005Sp-Mv; Fri, 23 Aug 2019 09:09:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SWQP=WT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i15ZS-0005Sk-W2
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 09:09:23 +0000
X-Inumbo-ID: b12d58d8-c585-11e9-ade4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b12d58d8-c585-11e9-ade4-12813bfff9fa;
 Fri, 23 Aug 2019 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566551361;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WkAwnGq+j2uGSogz9Xep8Rv3lZo4NVm9+/k/fnPstvI=;
 b=DpvwDntx948IAkMlY+VVlzKeAhcDpcU4uoVw0Xwkb2xFvnV6OdQcItQY
 2T/cwMcIzVsVK2bbYp58jag3e8kpHBCHbM21UorpXaRy6OUBO8TGGLIoK
 XnY+NuM1G5iRImLFACDK0ZjTnVdgO2D1JFBSo2aRy6qUftA3na/WQmpBA A=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n6xJV4ww27SdQFol/djIhpQEo4UIVrLZD5tCTxfPZK4UBUBT2bD50fixafAnBxiQAK16CMF8fL
 0QtSC3q65olsBQk/erHC+9PVb/VGWqfC+Yw5G9NoYvi35ZRpdO1wji7qy0QCePVzqonDUGjhoD
 o+zoI7U8SGc7UNnN9h+hcmMgCyJYWzaSgYBI9C5YlHbx/BwHbG2cqk43whKwfInoh0xPqwoiN9
 swWmJnQXpIy8dhXaNxgAOHAjFxZEfNc39kkoHSLKaNMemAOmzHHjQvI3sJ/zl60u8WH04rzB7R
 J6g=
X-SBRS: 2.7
X-MesageID: 4883113
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,420,1559534400"; 
   d="scan'208";a="4883113"
Date: Fri, 23 Aug 2019 11:09:07 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190823090907.ymw35e4y46pep4d2@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-12-git-send-email-chao.gao@intel.com>
 <20190822141046.wludotavoun4qg6l@Air-de-Roger>
 <20190822164432.GA30223@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822164432.GA30223@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v9 11/15] microcode: unify loading update
 during CPU resuming and AP wakeup
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

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTI6NDQ6MzRBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDQ6MTA6NDZQTSArMDIwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMDk6MjU6MjRBTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gQm90aCBhcmUgbG9hZGluZyB0aGUgY2FjaGVkIHBhdGNoLiBT
aW5jZSBBUHMgY2FsbCB0aGUgdW5pZmllZCBmdW5jdGlvbiwKPiA+PiBtaWNyb2NvZGVfdXBkYXRl
X29uZSgpLCBkdXJpbmcgd2FrZXVwLCB0aGUgJ3N0YXJ0X3VwZGF0ZScgcGFyYW1ldGVyCj4gPj4g
d2hpY2ggb3JpZ2luYWxseSB1c2VkIHRvIGRpc3Rpbmd1aXNoIEJTUCBhbmQgQVBzIGlzIHJlZHVu
ZGFudC4gU28gcmVtb3ZlCj4gPj4gdGhpcyBwYXJhbWV0ZXIuCj4gPj4gCj4gPj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiA+PiAtLS0KPiA+PiBOb3RlIHRo
YXQgaGVyZSBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlOiByZXN1bWluZyBhIENQVSB3b3VsZCBjYWxs
Cj4gPj4gLT5lbmRfdXBkYXRlKCkgbm93IHdoaWxlIHByZXZpb3VzbHkgaXQgd2Fzbid0LiBOb3Qg
cXVpdGUgc3VyZQo+ID4+IHdoZXRoZXIgaXQgaXMgY29ycmVjdC4KPiA+Cj4gPkkgZ3Vlc3MgdGhh
dCdzIHJlcXVpcmVkIGlmIGl0IGNhbGxlZCBzdGFydF91cGRhdGUgcHJpb3IgdG8gY2FsbGluZwo+
ID5lbmRfdXBkYXRlPwo+ID4KPiA+PiAKPiA+PiBDaGFuZ2VzIGluIHY5Ogo+ID4+ICAtIHJldHVy
biAtRU9QTk9UU1VQUCByYXRoZXIgdGhhbiAwIGlmIG1pY3JvY29kZV9vcHMgaXMgTlVMTCBpbgo+
ID4+ICAgIG1pY3JvY29kZV91cGRhdGVfb25lKCkKPiA+PiAgLSByZWJhc2UgYW5kIGZpeCBjb25m
bGljdHMuCj4gPj4gCj4gPj4gQ2hhbmdlcyBpbiB2ODoKPiA+PiAgLSBzcGxpdCBvdXQgZnJvbSB0
aGUgcHJldmlvdXMgcGF0Y2gKPiA+PiAtLS0KPiA+PiAgeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIu
YyAgICAgICB8ICAyICstCj4gPj4gIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgICAgfCA5
MCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ICB4ZW4vYXJj
aC94ODYvc21wYm9vdC5jICAgICAgICAgIHwgIDUgKy0tCj4gPj4gIHhlbi9pbmNsdWRlL2FzbS14
ODYvcHJvY2Vzc29yLmggfCAgNCArLQo+ID4+ICA0IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlv
bnMoKyksIDU3IGRlbGV0aW9ucygtKQo+ID4+IAo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvYWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+ID4+IGluZGV4IDRm
MjE5MDMuLjI0Nzk4ZDUgMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIu
Ywo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPiA+PiBAQCAtMjUzLDcgKzI1
Myw3IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQo+ID4+ICAKPiA+PiAgICAg
IGNvbnNvbGVfZW5kX3N5bmMoKTsKPiA+PiAgCj4gPj4gLSAgICBtaWNyb2NvZGVfcmVzdW1lX2Nw
dSgpOwo+ID4+ICsgICAgbWljcm9jb2RlX3VwZGF0ZV9vbmUoKTsKPiA+PiAgCj4gPj4gICAgICBp
ZiAoICFyZWNoZWNrX2NwdV9mZWF0dXJlcygwKSApCj4gPj4gICAgICAgICAgcGFuaWMoIk1pc3Np
bmcgcHJldmlvdXNseSBhdmFpbGFibGUgZmVhdHVyZShzKVxuIik7Cj4gPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+ID4+
IGluZGV4IGEyZmViYzcuLmJkZDljOWYgMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L21p
Y3JvY29kZS5jCj4gPj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gPj4gQEAgLTIw
MywyNCArMjAzLDYgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhcnNlX2Jsb2Io
Y29uc3QgY2hhciAqYnVmLCB1aW50MzJfdCBsZW4pCj4gPj4gICAgICByZXR1cm4gTlVMTDsKPiA+
PiAgfQo+ID4+ICAKPiA+PiAtaW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHZvaWQpCj4gPj4gLXsK
PiA+PiAtICAgIGludCBlcnI7Cj4gPj4gLSAgICBzdHJ1Y3QgY3B1X3NpZ25hdHVyZSAqc2lnID0g
JnRoaXNfY3B1KGNwdV9zaWcpOwo+ID4+IC0KPiA+PiAtICAgIGlmICggIW1pY3JvY29kZV9vcHMg
KQo+ID4+IC0gICAgICAgIHJldHVybiAwOwo+ID4+IC0KPiA+PiAtICAgIHNwaW5fbG9jaygmbWlj
cm9jb2RlX211dGV4KTsKPiA+PiAtCj4gPj4gLSAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xs
ZWN0X2NwdV9pbmZvKHNpZyk7Cj4gPj4gLSAgICBpZiAoIGxpa2VseSghZXJyKSApCj4gPj4gLSAg
ICAgICAgZXJyID0gbWljcm9jb2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKG1pY3JvY29kZV9jYWNo
ZSk7Cj4gPj4gLSAgICBzcGluX3VubG9jaygmbWljcm9jb2RlX211dGV4KTsKPiA+PiAtCj4gPj4g
LSAgICByZXR1cm4gZXJyOwo+ID4+IC19Cj4gPj4gLQo+ID4+ICB2b2lkIG1pY3JvY29kZV9mcmVl
X3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXRjaCkKPiA+PiAgewo+
ID4+ICAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVfcGF0Y2gtPm1jKTsK
PiA+PiBAQCAtMzg0LDExICszNjYsMjkgQEAgc3RhdGljIGludCBfX2luaXQgbWljcm9jb2RlX2lu
aXQodm9pZCkKPiA+PiAgfQo+ID4+ICBfX2luaXRjYWxsKG1pY3JvY29kZV9pbml0KTsKPiA+PiAg
Cj4gPj4gLWludCBfX2luaXQgZWFybHlfbWljcm9jb2RlX3VwZGF0ZV9jcHUoYm9vbCBzdGFydF91
cGRhdGUpCj4gPj4gKy8qIExvYWQgYSBjYWNoZWQgdXBkYXRlIHRvIGN1cnJlbnQgY3B1ICovCj4g
Pj4gK2ludCBtaWNyb2NvZGVfdXBkYXRlX29uZSh2b2lkKQo+ID4+ICt7Cj4gPj4gKyAgICBpbnQg
cmM7Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCAhbWljcm9jb2RlX29wcyApCj4gPj4gKyAgICAgICAg
cmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4+ICsKPiA+PiArICAgIHJjID0gbWljcm9jb2RlX3VwZGF0
ZV9jcHUoTlVMTCk7Cj4gPj4gKwo+ID4+ICsgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5lbmRfdXBk
YXRlICkKPiA+PiArICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlKCk7Cj4gPgo+ID5E
b24ndCB5b3UgbmVlZCB0byBjYWxsIHN0YXJ0X3VwZGF0ZSBiZWZvcmUgY2FsbGluZwo+ID5taWNy
b2NvZGVfdXBkYXRlX2NwdT8KPiAKPiBOby4gT24gQU1EIHNpZGUsIG9zdndfc3RhdHVzIHJlY29y
ZHMgdGhlIGhhcmR3YXJlIGVycmF0dW0gaW4gdGhlIHN5c3RlbS4KPiBBcyB3ZSBkb24ndCBhc3N1
bWUgYWxsIENQVXMgaGF2ZSB0aGUgc2FtZSBlcnJhdHVtLCBlYWNoIGNwdSBjYWxscwo+IGVuZF91
cGRhdGUgdG8gdXBkYXRlIG9zdndfc3RhdHVzIGFmdGVyIHVjb2RlIGxvYWRpbmcuCj4gc3RhcnRf
dXBkYXRlIGp1c3QgcmVzZXRzIG9zdndfc3RhdHVzIHRvIDAuIEFuZCBpdCBpcyBjYWxsZWQgb25j
ZSBwcmlvcgo+IHRvIHVjb2RlIGxvYWRpbmcgb24gYW55IENQVSBzbyB0aGF0IG9zdndfc3RhdHVz
IGNhbiBiZSByZWNvbXB1dGVkLgoKT2gsIEkgdGhpbmsgSSB1bmRlcnN0YW5kIGl0LiBzdGFydF91
cGRhdGUgbXVzdCBvbmx5IGJlIGNhbGxlZCBvbmNlCl9iZWZvcmVfIHRoZSBzZXF1ZW5jZSB0byB1
cGRhdGUgdGhlIG1pY3JvY29kZSBvbiBhbGwgQ1BVcyBpcwpwZXJmb3JtZWQsIHdoaWxlIGVuZF91
cGRhdGUgbmVlZHMgdG8gYmUgY2FsbGVkIG9uIF9lYWNoXyBDUFUgYWZ0ZXIgdGhlCnVwZGF0ZSBo
YXMgYmVlbiBjb21wbGV0ZWQgaW4gb3JkZXIgdG8gYWNjb3VudCBmb3IgYW55IGVycmF0YXMuCgpU
aGUgbmFtZSBmb3IgdGhvc2UgaG9va3Mgc2hvdWxkIGJlIGltcHJvdmVkLCBJIGd1ZXNzIHJlbmFt
aW5nCmVuZF91cGRhdGUgdG8gZW5kX3VwZGF0ZV9lYWNoIG9yIGVuZF91cGRhdGVfcGVyY3B1IHdv
dWxkIGJlIGNsZWFyZXIgaW4Kb3JkZXIgdG8gbWFrZSBpdCBjbGVhciB0aGF0IHN0YXJ0X3VwZGF0
ZSBpcyBnbG9iYWwsIHdoaWxlIGVuZF91cGRhdGUKaXMgcGVyY3B1LiBBbnl3YXksIEkgZG9uJ3Qg
d2FudCB0byBkZWxheSB0aGlzIHNlcmllcyBmb3IgYSBuYW1pbmcgbml0LgoKSSdtIHN0aWxsIHVu
c3VyZSB3aGVyZSBzdGFydF91cGRhdGUgaXMgY2FsbGVkIGZvciB0aGUgcmVzdW1lIGZyb20Kc3Vz
cGVuc2lvbiBjYXNlLCBJIGRvbid0IHNlZW0gdG8gc2VlIGFueSBjYWxsIHRvIHN0YXJ0X3VwZGF0
ZSBuZWl0aGVyCmluIGVudGVyX3N0YXRlIG9yIG1pY3JvY29kZV91cGRhdGVfb25lLCBoZW5jZSBJ
IHRoaW5rIHRoaXMgaXMgbWlzc2luZz8KCkkgd291bGQgZXhwZWN0IHlvdSBuZWVkIHRvIGNsZWFu
IG9zdndfc3RhdHVzIGFsc28gb24gcmVzdW1lIGZyb20Kc3VzcGVuc2lvbiwgaW4gY2FzZSBtaWNy
b2NvZGUgbG9hZGluZyBmYWlscz8gT3IgZWxzZSB5b3Ugd2lsbCBiZQpjYXJyeWluZyBhIHN0YWxl
IG9zdndfc3RhdHVzLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
