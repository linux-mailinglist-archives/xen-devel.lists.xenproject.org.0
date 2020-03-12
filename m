Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D091182C88
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 10:34:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCKAw-0003zK-0P; Thu, 12 Mar 2020 09:30:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=abR8=45=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jCKAu-0003zF-Ih
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 09:30:44 +0000
X-Inumbo-ID: 25369a5c-6444-11ea-bec1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25369a5c-6444-11ea-bec1-bc764e2007e4;
 Thu, 12 Mar 2020 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584005444;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UwrX7U2f3/+EUa4S4jOvpOyPxPXH5MEAZZtdqyJSfOM=;
 b=Zk8RozqZIIcrUhO38d8sGsurWo8EELgHasLXxc2NN/HV1bSoHEgTYynG
 1GyFwkPl5Kr0t+PumkPOEgHmW7jJ+YK5ivnppkqXVOAlXs06kRH2TJF9d
 EQrvqbNTkeFJQo+IGBIScITvczVVp1w73ejQUfHjaS/7nwIVCVGYLBMnF M=;
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
IronPort-SDR: UiZi0JOBjwpm7bQps03KjKwOdeYJo2IuJNoSDdK/C+edqiTvDkF5ysigvmb2JzUjj5jpOtRati
 BWf928WbMzyDP4IN6FZ/saGvulsAvRxDacB68CB7A4Jk3SikF0wOJ8/CIbRtvTQo/XpM11R3/7
 iAY84ktK4JJZvZ/DbfQWzdNAJdLmoryok7MABvmmfDRbLQkZrOPOotwscFaLUn109cTGeyaW7/
 82VmgD4PRNxdGCqkcGDemDJIhavLtf4K7T3ZpYH9BoUXoyNUfhExwX54ShpwSW8KD8r63mVMBW
 /7k=
X-SBRS: 2.7
X-MesageID: 13805774
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="13805774"
Date: Thu, 12 Mar 2020 10:30:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200312093035.GE24458@Air-de-Roger.citrite.net>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311183455.23729-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/vvmx: Fix deadlock with MSR bitmap
 merging
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDY6MzQ6NTVQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBjL3MgYzQ3OTg0YWFiZWFkICJudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNS
IGJpdG1hcHMiIGludHJvZHVjZWQgYSB1c2Ugb2YKPiBtYXBfZG9tYWluX3BhZ2UoKSB3aGljaCBt
YXkgZ2V0IHVzZWQgaW4gdGhlIG1pZGRsZSBvZiBjb250ZXh0IHN3aXRjaC4KPiAKPiBUaGlzIGlz
IG5vdCBzYWZlLCBhbmQgY2F1c2VzIFhlbiB0byBkZWFkbG9jayBvbiB0aGUgbWFwY2FjaGUgbG9j
azoKPiAKPiAgIChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgw
MjJkNmFlPl0gUiBfc3Bpbl9sb2NrKzB4MzQvMHg1ZQo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgw
MzIxOWQ3Pl0gRiBtYXBfZG9tYWluX3BhZ2UrMHgyNTAvMHg1MjcKPiAgIChYRU4pICAgIFs8ZmZm
ZjgyZDA4MDM1NjMzMj5dIEYgZG9fcGFnZV9mYXVsdCsweDQyMC8weDc4MAo+ICAgKFhFTikgICAg
WzxmZmZmODJkMDgwMzhkYTNkPl0gRiB4ODZfNjQvZW50cnkuUyNoYW5kbGVfZXhjZXB0aW9uX3Nh
dmVkKzB4NjgvMHg5NAo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMzE3MjlmPl0gRiBfX2ZpbmRf
bmV4dF96ZXJvX2JpdCsweDI4LzB4NjkKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDMyMWE0ZD5d
IEYgbWFwX2RvbWFpbl9wYWdlKzB4MmM2LzB4NTI3Cj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAy
OWVlYjI+XSBGIG52bXhfdXBkYXRlX2V4ZWNfY29udHJvbCsweDFkNy8weDMyMwo+ICAgKFhFTikg
ICAgWzxmZmZmODJkMDgwMjk5ZjVhPl0gRiB2bXhfdXBkYXRlX2NwdV9leGVjX2NvbnRyb2wrMHgy
My8weDQwCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyOWEzZjc+XSBGIGFyY2gveDg2L2h2bS92
bXgvdm14LmMjdm14X2N0eHRfc3dpdGNoX2Zyb20rMHhiNy8weDEyMQo+ICAgKFhFTikgICAgWzxm
ZmZmODJkMDgwMzFkNzk2Pl0gRiBhcmNoL3g4Ni9kb21haW4uYyNfX2NvbnRleHRfc3dpdGNoKzB4
MTI0LzB4NGE5Cj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMjA5MjU+XSBGIGNvbnRleHRfc3dp
dGNoKzB4MTU0LzB4NjJjCj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAyNTJmM2U+XSBGIGNvbW1v
bi9zY2hlZC9jb3JlLmMjc2NoZWRfY29udGV4dF9zd2l0Y2grMHgxNmEvMHgxNzUKPiAgIChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDI1Mzg3Nz5dIEYgY29tbW9uL3NjaGVkL2NvcmUuYyNzY2hlZHVsZSsw
eDJhZC8weDJiYwo+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjJjYzk3Pl0gRiBjb21tb24vc29m
dGlycS5jI19fZG9fc29mdGlycSsweGI3LzB4YzgKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIy
Y2QzOD5dIEYgZG9fc29mdGlycSsweDE4LzB4MWEKPiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDJh
MmZiYj5dIEYgdm14X2FzbV9kb192bWVudHJ5KzB4MmIvMHgzMAo+IAo+IENvbnZlcnQgdGhlIGRv
bWhlYXAgcGFnZSBpbnRvIGJlaW5nIGEgeGVuaGVhcCBwYWdlLgoKRml4ZXM6IGM0Nzk4NGFhYmVh
ZDUzOTEgKCdudm14OiBpbXBsZW1lbnQgc3VwcG9ydCBmb3IgTVNSIGJpdG1hcHMnKQoKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0t
LQo+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4gQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4gQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+
IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiAKPiBJIHN1c3BlY3QgdGhp
cyBpcyB0aGUgbm90LXF1aXRlLWNvbnNpc3RlbnQtZW5vdWdoLXRvLWJpc2VjdCBpc3N1ZSB3aGlj
aAo+IE9TU1Rlc3QgaXMgaGl0dGluZyBhbmQgaW50ZXJmZXJpbmcgd2l0aCBwdXNoZXMgdG8gbWFz
dGVyLgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgICAgICAgIHwgMTkgKysr
Ky0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdnZteC5oIHwg
IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92dm14LmMKPiBpbmRleCA5MjZhMTFjMTVmLi5mMDQ5OTIwMTk2IDEwMDY0
NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9odm0vdm14L3Z2bXguYwo+IEBAIC0xMzAsMTIgKzEzMCw5IEBAIGludCBudm14X3ZjcHVfaW5p
dGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKPiAgCj4gICAgICBpZiAoIGNwdV9oYXNfdm14X21zcl9i
aXRtYXAgKQo+ICAgICAgewo+IC0gICAgICAgIG52bXgtPm1zcl9tZXJnZWQgPSBhbGxvY19kb21o
ZWFwX3BhZ2UoZCwgTUVNRl9ub19vd25lcik7Cj4gKyAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9
IGFsbG9jX3hlbmhlYXBfcGFnZSgpOwoKQ291bGQgd2UgYWxzbyB1c2UgX19tYXBfZG9tYWluX3Bh
Z2VfZ2xvYmFsIGhlcmUgKGtlZXBpbmcgdGhlIGRvbWhlYXAKYWxsb2NhdGlvbikgaW4gb3JkZXIg
dG8gbWFwIHRoZSBwYWdlIG9uIGluaXQgYW5kIGtlZXAgaXQgbWFwcGVkIHVudGlsCnRoZSBkb21h
aW4gaXMgZGVzdHJveWVkPwoKPiAgICAgICAgICBpZiAoICFudm14LT5tc3JfbWVyZ2VkICkKPiAt
ICAgICAgICB7Cj4gLSAgICAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19FUlIsICJuZXN0OiBhbGxv
Y2F0aW9uIGZvciBNU1IgYml0bWFwIGZhaWxlZFxuIik7CgpJIGtub3cgdGhlIG1lc3NhZ2UgaXMg
bm90IHNwZWNpYWxseSBoZWxwZnVsLCBidXQgdGhhdCBzZWVtcyB0byBiZQppbmxpbmUgd2l0aCBo
b3cgZXJyb3IgaGFuZGxpbmcgaXMgZG9uZSBpbiBudm14X3ZjcHVfaW5pdGlhbGlzZS4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
