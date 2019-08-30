Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84450A367E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 14:15:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3flU-0007Py-1I; Fri, 30 Aug 2019 12:12:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MMg=W2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3flS-0007Pt-8X
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 12:12:26 +0000
X-Inumbo-ID: 6d3b5874-cb1f-11e9-ae82-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6d3b5874-cb1f-11e9-ae82-12813bfff9fa;
 Fri, 30 Aug 2019 12:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567167145;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H/z/cfpqyZwxYlFGRq0O0ZSOs3GSY9e/4qur6bL5pVE=;
 b=bzLf1+xv4fK33VRBMXInpdkMsmdyRyBWHRsXv/KRNyu6szAIRU5SkiSS
 JL0+M/1qrF6kV6I3F52t1sxL4WGd1gS7Dv7ySJ2kCsfI1qv+VCpw3VltZ
 xTM7m4ds7Q1vvi799f8LY73AGkWgObbGwPJAOCeHiNb50Hdit6fjb4UOs I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: l/2C+hfAaoOLRQ+m+1+QU+nuW8/H7+5jiUHTArWzRUyAhP0IhL3AZI1A3fEUReD/2Mu3DyCY6+
 FnXFmrDQiqIRXDyilxP0cpZxqbaFtK1bdyGEDZbvEwEvZqkvnRnl0M8FqiRyRHGuUepqBPCLuV
 BPw4qB+dRfFynsidrcffPsnMOiz60eo+NZMnLWvUAx++g8zSRU/8IIil+yjul9WQI8i4wMXr67
 1LVZmUqFKbM70Ksb45IsGfvdkZS1VhRc3kdVdtuXU426I3vnxpEIldr0mT0gdO/irDyGM5DIeN
 Fsk=
X-SBRS: 2.7
X-MesageID: 4945005
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="4945005"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] x86/domain: don't destroy IOREQ servers on soft reset
Thread-Index: AQHVXyoCsVDawlEnKUiOGKMrtXmQfacTmeCw
Date: Fri, 30 Aug 2019 12:12:21 +0000
Message-ID: <814e8dd518f549a7a19e70e4ad5b14be@AMSPEX02CL03.citrite.net>
References: <1567166206-13872-1-git-send-email-igor.druzhinin@citrix.com>
In-Reply-To: <1567166206-13872-1-git-send-email-igor.druzhinin@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] x86/domain: don't destroy IOREQ servers on
 soft reset
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>, "wl@xen.org" <wl@xen.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgo+IFNlbnQ6IDMwIEF1Z3VzdCAyMDE5IDEyOjU3Cj4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBqYmV1bGljaEBzdXNlLmNvbTsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFBhdWwgRHVycmFudAo+
IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHdsQHhlbi5vcmc7IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBJZ29yIERydXpoaW5pbgo+IDxpZ29yLmRydXpoaW5pbkBj
aXRyaXguY29tPgo+IFN1YmplY3Q6IFtQQVRDSF0geDg2L2RvbWFpbjogZG9uJ3QgZGVzdHJveSBJ
T1JFUSBzZXJ2ZXJzIG9uIHNvZnQgcmVzZXQKPiAKPiBQZXJmb3JtaW5nIHNvZnQgcmVzZXQgc2hv
dWxkIG5vdCBvcHBvcnR1bmlzdGljYWxseSBraWxsIElPUkVRIHNlcnZlcnMKPiBmb3IgZGV2aWNl
IGVtdWxhdG9ycyB0aGF0IG1pZ2h0IGJlIGN1cnJlbnRseSBydW5uaW5nIGZvciBhIGRvbWFpbi4K
PiBFdmVyeSBlbXVsYXRvciBpcyBzdXBwb3NlZCB0byBjbGVhbiB1cCBJT1JFUSBzZXJ2ZXJzIGZv
ciBpdHNlbGYgb24gZXhpdC4KPiBUaGlzIGFsbG93cyBhIHRvb2xzdGFjayB0byBlbGVjdCB3aGV0
aGVyIG9yIG5vdCBhIHBhcnRpY3VsYXIgZGV2aWNlCj4gbW9kZWwgc2hvdWxkIGJlIHJlc3RhcnRl
ZC4KPiAKPiBUaGUgb3JpZ2luYWwgY29kZSB3YXMgaW50cm9kdWNlZCBpbiAzMjM1Y2JmZSAoImFy
Y2gtc3BlY2lmaWMgaG9va3MgZm9yCj4gZG9tYWluX3NvZnRfcmVzZXQoKSIpIGxpa2VseSBkdWUg
dG8gdGhlIGZhY3QgJ2RlZmF1bHQnIElPUkVRIHNlcnZlcgo+IGV4aXN0ZWQgaW4gWGVuIGF0IHRo
ZSB0aW1lIGFuZCB1c2VkIGJ5IFFFTVUgZGlkbid0IGhhdmUgYW4gQVBJIGNhbGwgdG8KPiBkZXN0
cm95LiBTaW5jZSB0aGUgcmVtb3ZhbCBvZiAnZGVmYXVsdCcgSU9SRVEgc2VydmVyIGZyb20gWGVu
IHRoaXMKPiByZWFzb24gaGFzIGdvbmUgYXdheS4KPiAKPiBTaW5jZSBjb21taXQgYmE3ZmRkNjRi
ICgieGVuOiBjbGVhbnVwIElPUkVRIHNlcnZlciBvbiBleGl0IikgUUVNVSBub3cKPiBkZXN0cm95
cyBJT1JFUSBzZXJ2ZXIgZm9yIGl0c2VsZiBhcyBldmVyeSBvdGhlciBkZXZpY2UgZW11bGF0b3IK
PiBpcyBzdXBwb3NlZCB0byBkby4gSXQncyBub3cgc2FmZSB0byByZW1vdmUgdGhpcyBjb2RlIGZy
b20gc29mdCByZXNldAo+IHBhdGggLSBleGlzdGluZyBzeXN0ZW1zIHdpdGggb2xkIFFFTVUgc2hv
dWxkIGJlIGFibGUgdG8gd29yayBhcwo+IGV2ZW4gaWYgdGhlcmUgYXJlIElPUkVRIHNlcnZlcnMg
bGVmdCBiZWhpbmQsIGEgbmV3IFFFTVUgaW5zdGFuY2Ugd2lsbAo+IG92ZXJyaWRlIGl0cyByYW5n
ZXMgYW55d2F5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpo
aW5pbkBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+Cgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICB8IDIg
LS0KPiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgfCA1IC0tLS0tCj4gIHhlbi9pbmNs
dWRlL2FzbS14ODYvaHZtL2h2bS5oIHwgMSAtCj4gIDMgZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVuL2FyY2gv
eDg2L2RvbWFpbi5jCj4gaW5kZXggMmRmMzEyMy4uOTU3ZjA1OSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC94ODYvZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKPiBAQCAtNzEz
LDggKzcxMyw2IEBAIGludCBhcmNoX2RvbWFpbl9zb2Z0X3Jlc2V0KHN0cnVjdCBkb21haW4gKmQp
Cj4gICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkKPiAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAKPiAtICAgIGh2bV9kb21haW5fc29mdF9yZXNldChkKTsKPiAtCj4gICAgICBzcGluX2xv
Y2soJmQtPmV2ZW50X2xvY2spOwo+ICAgICAgZm9yICggaSA9IDA7IGkgPCBkLT5ucl9waXJxcyA7
IGkrKyApCj4gICAgICB7Cj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gaW5kZXggMDI5ZWVhMy4uMmI4MTg5OSAxMDA2NDQKPiAt
LS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0u
Ywo+IEBAIC01MDQ1LDExICs1MDQ1LDYgQEAgdm9pZCBodm1fdG9nZ2xlX3NpbmdsZXN0ZXAoc3Ry
dWN0IHZjcHUgKnYpCj4gICAgICB2LT5hcmNoLmh2bS5zaW5nbGVfc3RlcCA9ICF2LT5hcmNoLmh2
bS5zaW5nbGVfc3RlcDsKPiAgfQo+IAo+IC12b2lkIGh2bV9kb21haW5fc29mdF9yZXNldChzdHJ1
Y3QgZG9tYWluICpkKQo+IC17Cj4gLSAgICBodm1fZGVzdHJveV9hbGxfaW9yZXFfc2VydmVycyhk
KTsKPiAtfQo+IC0KPiAgLyoKPiAgICogU2VnbWVudCBjYWNoZXMgaW4gVk1DQi9WTUNTIGFyZSBp
bmNvbnNpc3RlbnQgYWJvdXQgd2hpY2ggYml0cyBhcmUgY2hlY2tlZCwKPiAgICogaW1wb3J0YW50
LCBhbmQgcHJlc2VydmVkIGFjcm9zcyB2bWVudHJ5L2V4aXQuICBDb29rIHRoZSB2YWx1ZXMgdG8g
bWFrZSB0aGVtCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIGIv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPiBpbmRleCBiMzI3YmQyLi40ZTcyZDA3IDEw
MDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oCj4gKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgKPiBAQCAtMjQwLDcgKzI0MCw2IEBAIGV4dGVybiBjb25z
dCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICpzdGFydF92bXgodm9pZCk7Cj4gIGludCBodm1f
ZG9tYWluX2luaXRpYWxpc2Uoc3RydWN0IGRvbWFpbiAqZCk7Cj4gIHZvaWQgaHZtX2RvbWFpbl9y
ZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluICpkKTsKPiAgdm9pZCBodm1fZG9tYWlu
X2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4gLXZvaWQgaHZtX2RvbWFpbl9zb2Z0X3Jlc2V0
KHN0cnVjdCBkb21haW4gKmQpOwo+IAo+ICBpbnQgaHZtX3ZjcHVfaW5pdGlhbGlzZShzdHJ1Y3Qg
dmNwdSAqdik7Cj4gIHZvaWQgaHZtX3ZjcHVfZGVzdHJveShzdHJ1Y3QgdmNwdSAqdik7Cj4gLS0K
PiAyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
