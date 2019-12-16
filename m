Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721D21205D1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:33:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpWA-0003tF-P0; Mon, 16 Dec 2019 12:30:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6OJ0=2G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1igpW9-0003sv-KX
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:30:29 +0000
X-Inumbo-ID: d76498e8-1fff-11ea-9398-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d76498e8-1fff-11ea-9398-12813bfff9fa;
 Mon, 16 Dec 2019 12:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576499428;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J4J8y0Ngy6enetmpTcnbVmaHe3/c2WWgbiVRwGdknSs=;
 b=UQkB8whsVQYv4t2GttTZrJ9mDpJrDu5WcoRtU5JsS4RjGB0GjLwvb7lU
 qytXCV73Kc091Npj/zsdcUV2gwg2MgO61CJz0ioCKc+Yc14xphM1WF2WO
 IV8edusSaom+3iNyzcIlBa1TlGQCYW7pFUgLMdl9a7IcZGig7+jAhV+7u k=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Dfe/2gJrynT7dyu/pEs2qLGcICnBYD8cnRdiCDN9SN7hjWKmWS20HcVyvryhLPYFXiULaL34cF
 tA8rn0k1uFPzvtRslXkLuNglyJrCS6Sk9BSp3JkCBtv+0iVfSoLKNNO0ABBrgizZw48ecjpxrl
 MzCWZ9e0BJrpvxMkzuNkNREP89wGboquhL0Q9aMetDNvkpM4Ga5yOyKVQNF97eiePLLHFWuWw2
 HYqPZxeB7yr18AcaR3Ruf3+6/94Jjyq85dF5hSBX8aT5CZtRgSyh8xycJdeqxfdNL9x7WQcgYD
 1+4=
X-SBRS: 2.7
X-MesageID: 9712647
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; 
   d="scan'208";a="9712647"
Date: Mon, 16 Dec 2019 13:30:20 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191216123020.GN11756@Air-de-Roger>
References: <1576277282-6590-1-git-send-email-igor.druzhinin@citrix.com>
 <1576277282-6590-3-git-send-email-igor.druzhinin@citrix.com>
 <20191216100058.GM11756@Air-de-Roger>
 <ccecb779-66e6-57a3-3eb8-e15e4d0e0839@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ccecb779-66e6-57a3-3eb8-e15e4d0e0839@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/2] x86/time: update vtsc_last with cmpxchg
 and drop vtsc_lock
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>, andrew.cooper3@citrix.com,
 wl@xen.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMTI6MjE6MDlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTYuMTIuMjAxOSAxMTowMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRGVjIDEzLCAyMDE5IGF0IDEwOjQ4OjAyUE0gKzAwMDAsIElnb3IgRHJ1emhpbmluIHdy
b3RlOgo+ID4+IE5vdyB0aGF0IHZ0c2NfbGFzdCBpcyB0aGUgb25seSBlbnRpdHkgcHJvdGVjdGVk
IGJ5IHZ0c2NfbG9jayB3ZSBjYW4KPiA+PiBzaW1wbHkgdXBkYXRlIGl0IHVzaW5nIGEgc2luZ2xl
IGF0b21pYyBvcGVyYXRpb24gYW5kIGRyb3AgdGhlIHNwaW5sb2NrCj4gPj4gZW50aXJlbHkuIFRo
aXMgaXMgZXh0cmVtZWx5IGltcG9ydGFudCBmb3IgdGhlIGNhc2Ugb2YgcnVubmluZyBuZXN0ZWQK
PiA+PiAoZS5nLiBzaGltIGluc3RhbmNlIHdpdGggbG90cyBvZiB2Q1BVcyBhc3NpZ25lZCkgc2lu
Y2UgaWYgcHJlZW1wdGlvbgo+ID4+IGhhcHBlbnMgc29tZXdoZXJlIGluc2lkZSB0aGUgY3JpdGlj
YWwgc2VjdGlvbiB0aGF0IHdvdWxkIGltbWVkaWF0ZWx5Cj4gPj4gbWVhbiB0aGF0IG90aGVyIHZD
UFUgc3RvcCBwcm9ncmVzc2luZyAoYW5kIHByb2JhYmx5IGJlaW5nIHByZWVtcHRlZAo+ID4+IGFz
IHdlbGwpIHdhaXRpbmcgZm9yIHRoZSBzcGlubG9jayB0byBiZSBmcmVlZC4KPiA+Pgo+ID4+IFRo
aXMgZml4ZXMgY29uc3RhbnQgc2hpbSBndWVzdCBib290IGxvY2t1cHMgd2l0aCB+MzIgdkNQVXMg
aWYgdGhlcmUgaXMKPiA+PiB2Q1BVIG92ZXJjb21taXQgcHJlc2VudCAod2hpY2ggaW5jcmVhc2Vz
IHRoZSBsaWtlbGlob29kIG9mIHByZWVtcHRpb24pLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTog
SWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4gPj4gLS0tCj4gPj4g
IHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgfCAgMSAtCj4gPj4gIHhlbi9hcmNoL3g4Ni90
aW1lLmMgICAgICAgICAgfCAxNiArKysrKystLS0tLS0tLS0tCj4gPj4gIHhlbi9pbmNsdWRlL2Fz
bS14ODYvZG9tYWluLmggfCAgMSAtCj4gPj4gIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxMiBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
ZG9tYWluLmMgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiA+PiBpbmRleCBiZWQxOWZjLi45NDUz
MWJlIDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+ID4+ICsrKyBiL3hl
bi9hcmNoL3g4Ni9kb21haW4uYwo+ID4+IEBAIC01MzksNyArNTM5LDYgQEAgaW50IGFyY2hfZG9t
YWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLAo+ID4+ICAgICAgSU5JVF9QQUdFX0xJU1RfSEVB
RCgmZC0+YXJjaC5yZWxtZW1fbGlzdCk7Cj4gPj4gIAo+ID4+ICAgICAgc3Bpbl9sb2NrX2luaXQo
JmQtPmFyY2guZTgyMF9sb2NrKTsKPiA+PiAtICAgIHNwaW5fbG9ja19pbml0KCZkLT5hcmNoLnZ0
c2NfbG9jayk7Cj4gPj4gIAo+ID4+ICAgICAgLyogTWluaW1hbCBpbml0aWFsaXNhdGlvbiBmb3Ig
dGhlIGlkbGUgZG9tYWluLiAqLwo+ID4+ICAgICAgaWYgKCB1bmxpa2VseShpc19pZGxlX2RvbWFp
bihkKSkgKQo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvdGltZS5jIGIveGVuL2FyY2gv
eDg2L3RpbWUuYwo+ID4+IGluZGV4IDIxNjE2OWEuLjIwMjQ0NmYgMTAwNjQ0Cj4gPj4gLS0tIGEv
eGVuL2FyY2gveDg2L3RpbWUuYwo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni90aW1lLmMKPiA+PiBA
QCAtMjEzMCwxOSArMjEzMCwxNSBAQCB1NjQgZ3RzY190b19ndGltZShzdHJ1Y3QgZG9tYWluICpk
LCB1NjQgdHNjKQo+ID4+ICAKPiA+PiAgdWludDY0X3QgcHZfc29mdF9yZHRzYyhjb25zdCBzdHJ1
Y3QgdmNwdSAqdiwgY29uc3Qgc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gPj4gIHsKPiA+
PiAtICAgIHNfdGltZV90IG5vdyA9IGdldF9zX3RpbWUoKTsKPiA+PiArICAgIHNfdGltZV90IG9s
ZCwgbmV3LCBub3cgPSBnZXRfc190aW1lKCk7Cj4gPj4gICAgICBzdHJ1Y3QgZG9tYWluICpkID0g
di0+ZG9tYWluOwo+ID4+ICAKPiA+PiAtICAgIHNwaW5fbG9jaygmZC0+YXJjaC52dHNjX2xvY2sp
Owo+ID4+IC0KPiA+PiAtICAgIGlmICggKGludDY0X3QpKG5vdyAtIGQtPmFyY2gudnRzY19sYXN0
KSA+IDAgKQo+ID4+IC0gICAgICAgIGQtPmFyY2gudnRzY19sYXN0ID0gbm93Owo+ID4+IC0gICAg
ZWxzZQo+ID4+IC0gICAgICAgIG5vdyA9ICsrZC0+YXJjaC52dHNjX2xhc3Q7Cj4gPj4gLQo+ID4+
IC0gICAgc3Bpbl91bmxvY2soJmQtPmFyY2gudnRzY19sb2NrKTsKPiA+PiArICAgIGRvIHsKPiA+
PiArICAgICAgICBvbGQgPSBkLT5hcmNoLnZ0c2NfbGFzdDsKPiA+PiArICAgICAgICBuZXcgPSAo
aW50NjRfdCkobm93IC0gZC0+YXJjaC52dHNjX2xhc3QpID4gMCA/IG5vdyA6IG9sZCArIDE7Cj4g
PiAKPiA+IFdoeSBkbyB5b3UgbmVlZCB0byBkbyB0aGlzIHN1YnRyYWN0aW9uPyBJc24ndCBpdCBl
YXNpZXIgdG8ganVzdCBkbzoKPiA+IAo+ID4gbmV3ID0gbm93ID4gZC0+YXJjaC52dHNjX2xhc3Qg
PyBub3cgOiBvbGQgKyAxOwo+IAo+IFRoaXMgd291bGRuJ3QgYmUgcmVsaWFibGUgd2hlbiB0aGUg
VFNDIHdyYXBzLiBSZW1lbWJlciB0aGF0IGZpcm13YXJlCj4gbWF5IHNldCB0aGUgVFNDLCBhbmQg
aXQgaGFzIGJlZW4gc2VlbiB0byBiZSBzZXQgdG8gdmVyeSBsYXJnZQo+IChlZmZlY3RpdmVseSBu
ZWdhdGl2ZSwgaWYgdGhleSB3ZXJlIHNpZ25lZCBxdWFudGl0aWVzKSB2YWx1ZXMsCgpzX3RpbWVf
dCBpcyBhIHNpZ25lZCB2YWx1ZSBBRkFJQ1QgKHM2NCkuCgo+IHdoaWNoCj4gd2lsbCB0aGVuIGV2
ZW50dWFsbHkgd3JhcCAod2hlcmVhcyB3ZSdyZSBub3QgdHlwaWNhbGx5IGNvbmNlcm5lZCBvZgo+
IDY0LWJpdCBjb3VudGVycyB3cmFwcGluZyB3aGVuIHRoZXkgc3RhcnQgZnJvbSB6ZXJvKS4KCkJ1
dCBnZXRfc190aW1lIHJldHVybnMgdGhlIHN5c3RlbSB0aW1lIGluIG5zIHNpbmNlIGJvb3QsIG5v
dCB0aGUgVFNDCnZhbHVlLCBoZW5jZSBpdCB3aWxsIHN0YXJ0IGZyb20gMCBhbmQgd2Ugc2hvdWxk
bid0IGJlIGNvbmNlcm5lZCBhYm91dAp3cmFwcz8KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
