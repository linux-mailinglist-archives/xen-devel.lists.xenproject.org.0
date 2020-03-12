Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AAC182FF9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 13:10:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCMbl-0001hV-C7; Thu, 12 Mar 2020 12:06:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCMbj-0001hQ-Bq
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 12:06:35 +0000
X-Inumbo-ID: ea8ce27e-6459-11ea-92cf-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea8ce27e-6459-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584014794;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=ysJJt/GVETxaUjCw93u3eF1LmTeRxAY0zjPQqv6Owqs=;
 b=BNVR8feKujerfRxYYzeXXRh/R9LiX9x2AtojmhwkDHRM/XaolsbBg/QW
 SR/+mv+gJeJp55zswVqHt2ETApdpa2oiDAerAtwhf7j7JZw5Jl19MPzMt
 LI0VHRNVfra46FbyMVv1yocNfPoEj9eQcHuk9qDOq3gj16n2B3gEsFxGF o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xzdlv9kV8isRG4UoWkNB2qlrjxt+n4VS6s6rDkpKgW5fR54Hd1PoxhuI1Bgw+7G5SlFj9UNMZB
 FKl2ILqXm2VUN8CMnM/ivytrYhem00NXqTNvQtZnsHPaGLLJAwAbZtTnGwOP5MH6QfRvkgU/88
 KqUQrh0kp253dfw4Ht/txMGHVLhB8oF3AXsdifwX9o/KpTO1AxFGW6dx78tkW3l9EQWETMq6O2
 sNYbswVROmplanQc6I2b7gV8tgh6g2PB7jW2vjBllvFN2cIHeQn9h1VlI8mNk/DfqbhFRDZyAI
 cpI=
X-SBRS: 2.7
X-MesageID: 14463587
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,544,1574139600"; d="scan'208";a="14463587"
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200311183455.23729-1-andrew.cooper3@citrix.com>
 <20200312093035.GE24458@Air-de-Roger.citrite.net>
 <20200312105846.GH24458@Air-de-Roger.citrite.net>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <42b11579-cce8-63aa-7fdb-29d834e77fa2@citrix.com>
Date: Thu, 12 Mar 2020 12:06:30 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312105846.GH24458@Air-de-Roger.citrite.net>
Content-Language: en-US
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
 Kevin Tian <kevin.tian@intel.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDMvMjAyMCAxMDo1OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIE1h
ciAxMiwgMjAyMCBhdCAxMDozMDozNUFNICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
PiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAwNjozNDo1NVBNICswMDAwLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+Pj4gYy9zIGM0Nzk4NGFhYmVhZCAibnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9y
IE1TUiBiaXRtYXBzIiBpbnRyb2R1Y2VkIGEgdXNlIG9mCj4+PiBtYXBfZG9tYWluX3BhZ2UoKSB3
aGljaCBtYXkgZ2V0IHVzZWQgaW4gdGhlIG1pZGRsZSBvZiBjb250ZXh0IHN3aXRjaC4KPj4+Cj4+
PiBUaGlzIGlzIG5vdCBzYWZlLCBhbmQgY2F1c2VzIFhlbiB0byBkZWFkbG9jayBvbiB0aGUgbWFw
Y2FjaGUgbG9jazoKPj4+Cj4+PiAgIChYRU4pIFhlbiBjYWxsIHRyYWNlOgo+Pj4gICAoWEVOKSAg
ICBbPGZmZmY4MmQwODAyMmQ2YWU+XSBSIF9zcGluX2xvY2srMHgzNC8weDVlCj4+PiAgIChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDMyMTlkNz5dIEYgbWFwX2RvbWFpbl9wYWdlKzB4MjUwLzB4NTI3Cj4+
PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDM1NjMzMj5dIEYgZG9fcGFnZV9mYXVsdCsweDQyMC8w
eDc4MAo+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzOGRhM2Q+XSBGIHg4Nl82NC9lbnRyeS5T
I2hhbmRsZV9leGNlcHRpb25fc2F2ZWQrMHg2OC8weDk0Cj4+PiAgIChYRU4pICAgIFs8ZmZmZjgy
ZDA4MDMxNzI5Zj5dIEYgX19maW5kX25leHRfemVyb19iaXQrMHgyOC8weDY5Cj4+PiAgIChYRU4p
ICAgIFs8ZmZmZjgyZDA4MDMyMWE0ZD5dIEYgbWFwX2RvbWFpbl9wYWdlKzB4MmM2LzB4NTI3Cj4+
PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5ZWViMj5dIEYgbnZteF91cGRhdGVfZXhlY19jb250
cm9sKzB4MWQ3LzB4MzIzCj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDI5OWY1YT5dIEYgdm14
X3VwZGF0ZV9jcHVfZXhlY19jb250cm9sKzB4MjMvMHg0MAo+Pj4gICAoWEVOKSAgICBbPGZmZmY4
MmQwODAyOWEzZjc+XSBGIGFyY2gveDg2L2h2bS92bXgvdm14LmMjdm14X2N0eHRfc3dpdGNoX2Zy
b20rMHhiNy8weDEyMQo+Pj4gICAoWEVOKSAgICBbPGZmZmY4MmQwODAzMWQ3OTY+XSBGIGFyY2gv
eDg2L2RvbWFpbi5jI19fY29udGV4dF9zd2l0Y2grMHgxMjQvMHg0YTkKPj4+ICAgKFhFTikgICAg
WzxmZmZmODJkMDgwMzIwOTI1Pl0gRiBjb250ZXh0X3N3aXRjaCsweDE1NC8weDYyYwo+Pj4gICAo
WEVOKSAgICBbPGZmZmY4MmQwODAyNTJmM2U+XSBGIGNvbW1vbi9zY2hlZC9jb3JlLmMjc2NoZWRf
Y29udGV4dF9zd2l0Y2grMHgxNmEvMHgxNzUKPj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMjUz
ODc3Pl0gRiBjb21tb24vc2NoZWQvY29yZS5jI3NjaGVkdWxlKzB4MmFkLzB4MmJjCj4+PiAgIChY
RU4pICAgIFs8ZmZmZjgyZDA4MDIyY2M5Nz5dIEYgY29tbW9uL3NvZnRpcnEuYyNfX2RvX3NvZnRp
cnErMHhiNy8weGM4Cj4+PiAgIChYRU4pICAgIFs8ZmZmZjgyZDA4MDIyY2QzOD5dIEYgZG9fc29m
dGlycSsweDE4LzB4MWEKPj4+ICAgKFhFTikgICAgWzxmZmZmODJkMDgwMmEyZmJiPl0gRiB2bXhf
YXNtX2RvX3ZtZW50cnkrMHgyYi8weDMwCj4+Pgo+Pj4gQ29udmVydCB0aGUgZG9taGVhcCBwYWdl
IGludG8gYmVpbmcgYSB4ZW5oZWFwIHBhZ2UuCj4+IEZpeGVzOiBjNDc5ODRhYWJlYWQ1MzkxICgn
bnZteDogaW1wbGVtZW50IHN1cHBvcnQgZm9yIE1TUiBiaXRtYXBzJykKPj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+PiAtLS0K
Pj4+IENDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+PiBDQzogV2VpIExpdSA8
d2xAeGVuLm9yZz4KPj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KPj4+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPj4+Cj4+PiBJIHN1
c3BlY3QgdGhpcyBpcyB0aGUgbm90LXF1aXRlLWNvbnNpc3RlbnQtZW5vdWdoLXRvLWJpc2VjdCBp
c3N1ZSB3aGljaAo+Pj4gT1NTVGVzdCBpcyBoaXR0aW5nIGFuZCBpbnRlcmZlcmluZyB3aXRoIHB1
c2hlcyB0byBtYXN0ZXIuCj4+PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMg
ICAgICAgIHwgMTkgKysrKy0tLS0tLS0tLS0tLS0tLQo+Pj4gIHhlbi9pbmNsdWRlL2FzbS14ODYv
aHZtL3ZteC92dm14LmggfCAgMiArLQo+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxNiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCj4+PiBpbmRleCA5MjZh
MTFjMTVmLi5mMDQ5OTIwMTk2IDEwMDY0NAo+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgv
dnZteC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKPj4+IEBAIC0xMzAs
MTIgKzEzMCw5IEBAIGludCBudm14X3ZjcHVfaW5pdGlhbGlzZShzdHJ1Y3QgdmNwdSAqdikKPj4+
ICAKPj4+ICAgICAgaWYgKCBjcHVfaGFzX3ZteF9tc3JfYml0bWFwICkKPj4+ICAgICAgewo+Pj4g
LSAgICAgICAgbnZteC0+bXNyX21lcmdlZCA9IGFsbG9jX2RvbWhlYXBfcGFnZShkLCBNRU1GX25v
X293bmVyKTsKPj4+ICsgICAgICAgIG52bXgtPm1zcl9tZXJnZWQgPSBhbGxvY194ZW5oZWFwX3Bh
Z2UoKTsKPj4gQ291bGQgd2UgYWxzbyB1c2UgX19tYXBfZG9tYWluX3BhZ2VfZ2xvYmFsIGhlcmUg
KGtlZXBpbmcgdGhlIGRvbWhlYXAKPj4gYWxsb2NhdGlvbikgaW4gb3JkZXIgdG8gbWFwIHRoZSBw
YWdlIG9uIGluaXQgYW5kIGtlZXAgaXQgbWFwcGVkIHVudGlsCj4+IHRoZSBkb21haW4gaXMgZGVz
dHJveWVkPwo+IEp1c3QgcmVhZCAnbnZteCBkZWFkbG9jayB3aXRoIE1TUiBiaXRtYXBzJyBub3cg
YW5kIHJlYWxpemVkIHRoYXQgeW91Cj4gbWVudGlvbiB1c2luZyBtYXBfZG9tYWluX3BhZ2VfZ2xv
YmFsIHRoZXJlIGFzIGFuIG9wdGlvbiBhbHNvLCBzbyBJCj4gZ3Vlc3MgeW91IHdlbnQgd2l0aCB0
aGUgeGVuaGVhcCBwYWdlIG9wdGlvbiBiZWNhdXNlIGl0IHdhcyBzaW1wbGVyLgoKQSBkb21oZWFw
IHBhZ2Ugd2hpY2ggaXMgbWFwcGVkIGdsb2JhbGx5IGZvciBpdHMgZW50aXJlIGxpZmV0aW1lIGlz
CnN0cmljdGx5IGdyZWF0ZXIgb3ZlcmhlYWQgdGhhbiBhIHhlbmhlYXAgcGFnZSwgYmVjYXVzZSBp
dCBhbHNvIHVzZXMgdm1hcApzcGFjZS4KCmdsb2JhbCBkb21oZWFwIG1hcHBpbmdzIGFyZSBmb3Ig
d2hlcmUgd2UgbmVlZCB0byBtYWludGFpbiBhIG1hcHBpbmcgZm9yCm1vcmUgdGhhbiBhIHNpbmds
ZSB0cmFuc2llbnQgYWNjZXNzLCBidXQgd2UgZG9uJ3Qga25vdyBpZi93aGF0L3doZXJlIGF0CnRo
ZSB0aW1lIHRoZSBkb21haW4gaXMgY3JlYXRlZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
