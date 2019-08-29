Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EECA1383
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 10:19:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Fbz-0000nJ-0d; Thu, 29 Aug 2019 08:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8sxS=WZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i3Fby-0000nE-6X
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 08:16:54 +0000
X-Inumbo-ID: 5b4ab5c8-ca35-11e9-8980-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b4ab5c8-ca35-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567066613;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O2JEPr3PwRajVcFHfMxQ8lP8HRlwayQIPa68elXoHGU=;
 b=VkpCEkAqyYpieudSY1B3fN5IvB7/nGJuWR110uTFBrQshL/q8fgVYbe3
 2T31PMH7GqJi4hnS42u4GPB7aodxSwLZZefX1y4vK0mK9OA5LghklyWMS
 69qvXg5WcotJpbHPD/fRiwvglQ5DqygDKsT4n2WamiwuWomkd/CCgZyGc o=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: IVnQ6KEgF0mb75QYCuKFqhD274bXFKf3jWaiTiEVxXPpXcH4+5K3aXC1S9HYEmgU0vKXM55BVl
 HdMQdsct0L1aR/VdIL7IeXj5APXMacQNLLCHrnVKEi+a5zNNl2Ja+S1+gg2vEgEV93JvOP3y10
 zKcdP4UsK+QpT2Sj4oHe85U6Ae48r8B3HF6YMPKeIxXUrZZhBpjPRgdpaoVit7fIh5cSek7sAq
 4S6P657eI8gHLABauOuiNSlrr2L2K0vgIFJoLePW3JH+lD0OrJa1fFHnz6hdAk3Fccc4aOzDgJ
 8cM=
X-SBRS: 2.7
X-MesageID: 4864593
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4864593"
Date: Thu, 29 Aug 2019 10:16:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Chao Gao <chao.gao@intel.com>
Message-ID: <20190829081645.ee6oecgdiphd6o4a@Air-de-Roger>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-12-git-send-email-chao.gao@intel.com>
 <20190822141046.wludotavoun4qg6l@Air-de-Roger>
 <20190822164432.GA30223@gao-cwp>
 <20190823090907.ymw35e4y46pep4d2@Air-de-Roger>
 <20190829073747.GB12650@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190829073747.GB12650@gao-cwp>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMDM6Mzc6NDdQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTE6MDk6MDdBTSArMDIwMCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPiA+T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMTI6NDQ6MzRBTSArMDgwMCwg
Q2hhbyBHYW8gd3JvdGU6Cj4gPj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDQ6MTA6NDZQTSAr
MDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+PiA+T24gTW9uLCBBdWcgMTksIDIwMTkg
YXQgMDk6MjU6MjRBTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4gPj4gPj4gQm90aCBhcmUgbG9h
ZGluZyB0aGUgY2FjaGVkIHBhdGNoLiBTaW5jZSBBUHMgY2FsbCB0aGUgdW5pZmllZCBmdW5jdGlv
biwKPiA+PiA+PiBtaWNyb2NvZGVfdXBkYXRlX29uZSgpLCBkdXJpbmcgd2FrZXVwLCB0aGUgJ3N0
YXJ0X3VwZGF0ZScgcGFyYW1ldGVyCj4gPj4gPj4gd2hpY2ggb3JpZ2luYWxseSB1c2VkIHRvIGRp
c3Rpbmd1aXNoIEJTUCBhbmQgQVBzIGlzIHJlZHVuZGFudC4gU28gcmVtb3ZlCj4gPj4gPj4gdGhp
cyBwYXJhbWV0ZXIuCj4gPj4gPj4gCj4gPj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBHYW8gPGNo
YW8uZ2FvQGludGVsLmNvbT4KPiA+PiA+PiAtLS0KPiA+PiA+PiBOb3RlIHRoYXQgaGVyZSBpcyBh
IGZ1bmN0aW9uYWwgY2hhbmdlOiByZXN1bWluZyBhIENQVSB3b3VsZCBjYWxsCj4gPj4gPj4gLT5l
bmRfdXBkYXRlKCkgbm93IHdoaWxlIHByZXZpb3VzbHkgaXQgd2Fzbid0LiBOb3QgcXVpdGUgc3Vy
ZQo+ID4+ID4+IHdoZXRoZXIgaXQgaXMgY29ycmVjdC4KPiA+PiA+Cj4gPj4gPkkgZ3Vlc3MgdGhh
dCdzIHJlcXVpcmVkIGlmIGl0IGNhbGxlZCBzdGFydF91cGRhdGUgcHJpb3IgdG8gY2FsbGluZwo+
ID4+ID5lbmRfdXBkYXRlPwo+ID4+ID4KPiA+PiA+PiAKPiA+PiA+PiBDaGFuZ2VzIGluIHY5Ogo+
ID4+ID4+ICAtIHJldHVybiAtRU9QTk9UU1VQUCByYXRoZXIgdGhhbiAwIGlmIG1pY3JvY29kZV9v
cHMgaXMgTlVMTCBpbgo+ID4+ID4+ICAgIG1pY3JvY29kZV91cGRhdGVfb25lKCkKPiA+PiA+PiAg
LSByZWJhc2UgYW5kIGZpeCBjb25mbGljdHMuCj4gPj4gPj4gCj4gPj4gPj4gQ2hhbmdlcyBpbiB2
ODoKPiA+PiA+PiAgLSBzcGxpdCBvdXQgZnJvbSB0aGUgcHJldmlvdXMgcGF0Y2gKPiA+PiA+PiAt
LS0KPiA+PiA+PiAgeGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYyAgICAgICB8ICAyICstCj4gPj4g
Pj4gIHhlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYyAgICAgICAgfCA5MCArKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+ID4+ICB4ZW4vYXJjaC94ODYvc21wYm9vdC5j
ICAgICAgICAgIHwgIDUgKy0tCj4gPj4gPj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29y
LmggfCAgNCArLQo+ID4+ID4+ICA0IGZpbGVzIGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDU3
IGRlbGV0aW9ucygtKQo+ID4+ID4+IAo+ID4+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
YWNwaS9wb3dlci5jIGIveGVuL2FyY2gveDg2L2FjcGkvcG93ZXIuYwo+ID4+ID4+IGluZGV4IDRm
MjE5MDMuLjI0Nzk4ZDUgMTAwNjQ0Cj4gPj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvcG93
ZXIuYwo+ID4+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3Bvd2VyLmMKPiA+PiA+PiBAQCAt
MjUzLDcgKzI1Myw3IEBAIHN0YXRpYyBpbnQgZW50ZXJfc3RhdGUodTMyIHN0YXRlKQo+ID4+ID4+
ICAKPiA+PiA+PiAgICAgIGNvbnNvbGVfZW5kX3N5bmMoKTsKPiA+PiA+PiAgCj4gPj4gPj4gLSAg
ICBtaWNyb2NvZGVfcmVzdW1lX2NwdSgpOwo+ID4+ID4+ICsgICAgbWljcm9jb2RlX3VwZGF0ZV9v
bmUoKTsKPiA+PiA+PiAgCj4gPj4gPj4gICAgICBpZiAoICFyZWNoZWNrX2NwdV9mZWF0dXJlcygw
KSApCj4gPj4gPj4gICAgICAgICAgcGFuaWMoIk1pc3NpbmcgcHJldmlvdXNseSBhdmFpbGFibGUg
ZmVhdHVyZShzKVxuIik7Cj4gPj4gPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9taWNyb2Nv
ZGUuYyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGUuYwo+ID4+ID4+IGluZGV4IGEyZmViYzcuLmJk
ZDljOWYgMTAwNjQ0Cj4gPj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gPj4g
Pj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZS5jCj4gPj4gPj4gQEAgLTIwMywyNCArMjAz
LDYgQEAgc3RhdGljIHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKnBhcnNlX2Jsb2IoY29uc3QgY2hh
ciAqYnVmLCB1aW50MzJfdCBsZW4pCj4gPj4gPj4gICAgICByZXR1cm4gTlVMTDsKPiA+PiA+PiAg
fQo+ID4+ID4+ICAKPiA+PiA+PiAtaW50IG1pY3JvY29kZV9yZXN1bWVfY3B1KHZvaWQpCj4gPj4g
Pj4gLXsKPiA+PiA+PiAtICAgIGludCBlcnI7Cj4gPj4gPj4gLSAgICBzdHJ1Y3QgY3B1X3NpZ25h
dHVyZSAqc2lnID0gJnRoaXNfY3B1KGNwdV9zaWcpOwo+ID4+ID4+IC0KPiA+PiA+PiAtICAgIGlm
ICggIW1pY3JvY29kZV9vcHMgKQo+ID4+ID4+IC0gICAgICAgIHJldHVybiAwOwo+ID4+ID4+IC0K
PiA+PiA+PiAtICAgIHNwaW5fbG9jaygmbWljcm9jb2RlX211dGV4KTsKPiA+PiA+PiAtCj4gPj4g
Pj4gLSAgICBlcnIgPSBtaWNyb2NvZGVfb3BzLT5jb2xsZWN0X2NwdV9pbmZvKHNpZyk7Cj4gPj4g
Pj4gLSAgICBpZiAoIGxpa2VseSghZXJyKSApCj4gPj4gPj4gLSAgICAgICAgZXJyID0gbWljcm9j
b2RlX29wcy0+YXBwbHlfbWljcm9jb2RlKG1pY3JvY29kZV9jYWNoZSk7Cj4gPj4gPj4gLSAgICBz
cGluX3VubG9jaygmbWljcm9jb2RlX211dGV4KTsKPiA+PiA+PiAtCj4gPj4gPj4gLSAgICByZXR1
cm4gZXJyOwo+ID4+ID4+IC19Cj4gPj4gPj4gLQo+ID4+ID4+ICB2b2lkIG1pY3JvY29kZV9mcmVl
X3BhdGNoKHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2ggKm1pY3JvY29kZV9wYXRjaCkKPiA+PiA+PiAg
ewo+ID4+ID4+ICAgICAgbWljcm9jb2RlX29wcy0+ZnJlZV9wYXRjaChtaWNyb2NvZGVfcGF0Y2gt
Pm1jKTsKPiA+PiA+PiBAQCAtMzg0LDExICszNjYsMjkgQEAgc3RhdGljIGludCBfX2luaXQgbWlj
cm9jb2RlX2luaXQodm9pZCkKPiA+PiA+PiAgfQo+ID4+ID4+ICBfX2luaXRjYWxsKG1pY3JvY29k
ZV9pbml0KTsKPiA+PiA+PiAgCj4gPj4gPj4gLWludCBfX2luaXQgZWFybHlfbWljcm9jb2RlX3Vw
ZGF0ZV9jcHUoYm9vbCBzdGFydF91cGRhdGUpCj4gPj4gPj4gKy8qIExvYWQgYSBjYWNoZWQgdXBk
YXRlIHRvIGN1cnJlbnQgY3B1ICovCj4gPj4gPj4gK2ludCBtaWNyb2NvZGVfdXBkYXRlX29uZSh2
b2lkKQo+ID4+ID4+ICt7Cj4gPj4gPj4gKyAgICBpbnQgcmM7Cj4gPj4gPj4gKwo+ID4+ID4+ICsg
ICAgaWYgKCAhbWljcm9jb2RlX29wcyApCj4gPj4gPj4gKyAgICAgICAgcmV0dXJuIC1FT1BOT1RT
VVBQOwo+ID4+ID4+ICsKPiA+PiA+PiArICAgIHJjID0gbWljcm9jb2RlX3VwZGF0ZV9jcHUoTlVM
TCk7Cj4gPj4gPj4gKwo+ID4+ID4+ICsgICAgaWYgKCBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRl
ICkKPiA+PiA+PiArICAgICAgICBtaWNyb2NvZGVfb3BzLT5lbmRfdXBkYXRlKCk7Cj4gPj4gPgo+
ID4+ID5Eb24ndCB5b3UgbmVlZCB0byBjYWxsIHN0YXJ0X3VwZGF0ZSBiZWZvcmUgY2FsbGluZwo+
ID4+ID5taWNyb2NvZGVfdXBkYXRlX2NwdT8KPiA+PiAKPiA+PiBOby4gT24gQU1EIHNpZGUsIG9z
dndfc3RhdHVzIHJlY29yZHMgdGhlIGhhcmR3YXJlIGVycmF0dW0gaW4gdGhlIHN5c3RlbS4KPiA+
PiBBcyB3ZSBkb24ndCBhc3N1bWUgYWxsIENQVXMgaGF2ZSB0aGUgc2FtZSBlcnJhdHVtLCBlYWNo
IGNwdSBjYWxscwo+ID4+IGVuZF91cGRhdGUgdG8gdXBkYXRlIG9zdndfc3RhdHVzIGFmdGVyIHVj
b2RlIGxvYWRpbmcuCj4gPj4gc3RhcnRfdXBkYXRlIGp1c3QgcmVzZXRzIG9zdndfc3RhdHVzIHRv
IDAuIEFuZCBpdCBpcyBjYWxsZWQgb25jZSBwcmlvcgo+ID4+IHRvIHVjb2RlIGxvYWRpbmcgb24g
YW55IENQVSBzbyB0aGF0IG9zdndfc3RhdHVzIGNhbiBiZSByZWNvbXB1dGVkLgo+ID4KPiA+T2gs
IEkgdGhpbmsgSSB1bmRlcnN0YW5kIGl0LiBzdGFydF91cGRhdGUgbXVzdCBvbmx5IGJlIGNhbGxl
ZCBvbmNlCj4gPl9iZWZvcmVfIHRoZSBzZXF1ZW5jZSB0byB1cGRhdGUgdGhlIG1pY3JvY29kZSBv
biBhbGwgQ1BVcyBpcwo+ID5wZXJmb3JtZWQsIHdoaWxlIGVuZF91cGRhdGUgbmVlZHMgdG8gYmUg
Y2FsbGVkIG9uIF9lYWNoXyBDUFUgYWZ0ZXIgdGhlCj4gPnVwZGF0ZSBoYXMgYmVlbiBjb21wbGV0
ZWQgaW4gb3JkZXIgdG8gYWNjb3VudCBmb3IgYW55IGVycmF0YXMuCj4gPgo+ID5UaGUgbmFtZSBm
b3IgdGhvc2UgaG9va3Mgc2hvdWxkIGJlIGltcHJvdmVkLCBJIGd1ZXNzIHJlbmFtaW5nCj4gPmVu
ZF91cGRhdGUgdG8gZW5kX3VwZGF0ZV9lYWNoIG9yIGVuZF91cGRhdGVfcGVyY3B1IHdvdWxkIGJl
IGNsZWFyZXIgaW4KPiA+b3JkZXIgdG8gbWFrZSBpdCBjbGVhciB0aGF0IHN0YXJ0X3VwZGF0ZSBp
cyBnbG9iYWwsIHdoaWxlIGVuZF91cGRhdGUKPiA+aXMgcGVyY3B1LiBBbnl3YXksIEkgZG9uJ3Qg
d2FudCB0byBkZWxheSB0aGlzIHNlcmllcyBmb3IgYSBuYW1pbmcgbml0Lgo+ID4KPiA+SSdtIHN0
aWxsIHVuc3VyZSB3aGVyZSBzdGFydF91cGRhdGUgaXMgY2FsbGVkIGZvciB0aGUgcmVzdW1lIGZy
b20KPiA+c3VzcGVuc2lvbiBjYXNlLCBJIGRvbid0IHNlZW0gdG8gc2VlIGFueSBjYWxsIHRvIHN0
YXJ0X3VwZGF0ZSBuZWl0aGVyCj4gPmluIGVudGVyX3N0YXRlIG9yIG1pY3JvY29kZV91cGRhdGVf
b25lLCBoZW5jZSBJIHRoaW5rIHRoaXMgaXMgbWlzc2luZz8KPiAKPiBOby4gQWN0dWFsbHksIG5v
IGNhbGwgb2Ygc3RhcnRfdXBkYXRlIGZvciByZXN1bWUgY2FzZS4KPiAKPiA+Cj4gPkkgd291bGQg
ZXhwZWN0IHlvdSBuZWVkIHRvIGNsZWFuIG9zdndfc3RhdHVzIGFsc28gb24gcmVzdW1lIGZyb20K
PiA+c3VzcGVuc2lvbiwgaW4gY2FzZSBtaWNyb2NvZGUgbG9hZGluZyBmYWlscz8gT3IgZWxzZSB5
b3Ugd2lsbCBiZQo+ID5jYXJyeWluZyBhIHN0YWxlIG9zdndfc3RhdHVzLgo+IAo+IFRoZW4gd2Ug
bmVlZCB0byBzZW5kIElQSSB0byBhbGwgb3RoZXIgQ1BVcyB0byByZWNvbXB1dGUgb3N2d19zdGF0
ZS4KCldoeSB3b3VsZCB5b3UgbmVlZCB0byBzZW5kIGFuIElQST8gQXJlbid0IG90aGVyIENQVXMg
Z29pbmcgdG8gdXBkYXRlCnRoZSBtaWNyb2NvZGUsIGFuZCBoZW5jZSBjYWxsIGVuZF91cGRhdGU/
CgpBRkFJQ1QgeW91IG9ubHkgbmVlZCB0byBjYWxsIHN0YXJ0X3VwZGF0ZSBhZnRlciByZXR1cm5p
bmcgZnJvbQpzdXNwZW5zaW9uIGFuZCBiZWZvcmUgYW55IENQVSB1cGRhdGVzIGl0J3MgbWljcm9j
b2RlLiBUaGVuIG9zdndfc3RhdHVzCndpbGwgYmUgdXBkYXRlZCBieSBlYWNoIENQVSBhcyB0aGUg
bWljcm9jb2RlIGdldHMgbG9hZGVkPwoKPiBCdXQKPiBJIHRoaW5rIGl0IGlzIG5vdCBuZWNlc3Nh
cnkuIElmIHVjb2RlIGNhY2hlIGlzbid0IGNoYW5nZWQgZHVyaW5nIHRoZQo+IENQVSdzIHN1c3Bl
bnNpb24gcGVyaW9kLCB0aGVyZSBpcyBub3Qgc3RhbGUgb3N2dyBiaXQgKGFzc3VtaW5nIE9TVlcg
b24KPiB0aGUgcmVzdW1pbmcgQ1BVIHdvbid0IGNoYW5nZSkuIElmIHRoZSB1Y29kZSBjYWNoZSBp
cyB1cGRhdGVkICh0aGVyZQo+IG11c3QgYmUgYSBsYXRlIHVjb2RlIGxvYWRpbmcpLCBvc3Z3X3N0
YXR1cyBzaG91bGQgaGF2ZSBiZWVuIGNsZWFuZWQKPiBiZWZvcmUgbGF0ZSB1Y29kZSBsb2FkaW5n
LgoKSXQgY291bGQgYmUgcG9zc2libGUgdGhhdCBhbiB1Y29kZSB0aGF0IHByZXZpb3VzbHkgbG9h
ZGVkIGZpbmUgdGhyb3cKYW4gZXJyb3IsIGJ1dCBJIGFncmVlIHRoYXQncyBxdWl0ZSB1bmxpa2Vs
eS4gQW55d2F5IHRoZSBmaXggc2VlbWVkCnRyaXZpYWwgdG8gbWUsIGJ1dCBtYXliZSBJJ20gbWlz
c2luZyBzb21ldGhpbmcuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
