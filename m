Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB111E73C1
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 15:35:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP65E-0004Kv-Oa; Mon, 28 Oct 2019 14:33:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=es4G=YV=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iP65D-0004Kq-3W
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 14:33:23 +0000
X-Inumbo-ID: e41751d4-f98f-11e9-94fa-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e41751d4-f98f-11e9-94fa-12813bfff9fa;
 Mon, 28 Oct 2019 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572273202;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=b6fWKt+TwHlqLmowEQmcP1y68ve6z+Jow0Fr63zPECw=;
 b=FOrHrTBZWUfiIJ6+Ozuff7o+G4TdrYhrcDIMcDp2g8K+yPgTCPn+cMWt
 lNczNgNhSmoKHN2U7p6AZDszlAPw3t5kDubBpkSkms9sqgXQ0dyMAslD7
 liQmh47h6gWLaHZfbcsEpZMVgOl0u/Hi3gW6v/1ibPNCOkrVOL9fKCvYc E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ty+dhDnGQC8hpt0EXj7f1NfYkO8WQLXChAhJDQRQUMbOlsKYPRXBHfrO8ecYh5inFKnUFwOB/U
 PA0SdzCJv/lIsedXuF37a70ZHLz1Tb+MPVlLcpjEGLJlyt0tcignHa9jXokCjiEjRIrRlRgb4P
 pa6USeIoZo7KY37J2YJ33u1G5deiICf/aXsQItJwpNV38IM0DRVl/rhtc3oGdQJDaM6bhjkY6w
 9rc1GQMalXIcy3dvs1qi7OoAzdEu1UQ0G335O30csF5a3hKJrFmQRmuEF2J2bQY3Jxh16SV6bv
 4/Q=
X-SBRS: 2.7
X-MesageID: 7505202
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,240,1569297600"; 
   d="scan'208";a="7505202"
Date: Mon, 28 Oct 2019 14:33:13 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Petre Pircalabu <ppircalabu@bitdefender.com>
Message-ID: <20191028143313.GA1162@perard.uk.xensource.com>
References: <a9c29042189f2f862ffc0ad9af732afb254bbb83.1572045542.git.ppircalabu@bitdefender.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9c29042189f2f862ffc0ad9af732afb254bbb83.1572045542.git.ppircalabu@bitdefender.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Subject: Re: [Xen-devel] [PATCH] tools/ocaml: Fix build error with Arch Linux
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christian Lindig <christian.lindig@citrix.com>, David
 Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU2F0LCBPY3QgMjYsIDIwMTkgYXQgMDI6MjE6MTBBTSArMDMwMCwgUGV0cmUgUGlyY2FsYWJ1
IHdyb3RlOgo+IGdjYyAoR0NDKSA5LjIuMCBjb21wbGFpbnM6Cj4gCj4geGVudG9vbGxvZ19zdHVi
cy5jOiBJbiBmdW5jdGlvbiDigJhzdHViX3h0bF9vY2FtbF92bWVzc2FnZeKAmToKPiB4ZW50b29s
bG9nX3N0dWJzLmM6OTM6MTY6IGVycm9yOiBpbml0aWFsaXphdGlvbiBkaXNjYXJkcyDigJhjb25z
dOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Vycm9yPWRpc2NhcmRl
ZC1xdWFsaWZpZXJzXQo+ICAgIDkzIHwgIHZhbHVlICpmdW5jID0gY2FtbF9uYW1lZF92YWx1ZSh4
dGwtPnZtZXNzYWdlX2NiKSA7Cj4gICAgICAgfCAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+
fn5+CgpIaSBQZXRyZSwKClRoYW5rcyBmb3IgdGhlIHBhdGNoLCBpdCBsb29rcyBmaW5lLiBIb3dl
dmVyIGl0IHdvdWxkIGJlIG5pY2UgdG8gYWRkCnNvbWUgbW9yZSBjb250ZXh0IG9uIHdoeSBnY2Mg
Y29tcGxhaW5zLiBBIHF1aWNrIHNlYXJjaCBzZWVtcyB0byBsZWFkIHRvCmh0dHBzOi8vZ2l0aHVi
LmNvbS9vY2FtbC9vY2FtbC9jb21taXQvNGYwM2ExNDY3ZDI5Y2Y1ODdkZjVhMTkxODMwZjE1MjU1
MDZlZTBlMwogICAgIk1ha2UgY2FtbF9uYW1lZF92YWx1ZSByZXR1cm4gYSBjb25zdCB2YWx1ZSoi
CndoaWNoIGNoYW5nZSB0aGUgcHJvdG90eXBlIG9mIGNhbWxfbmFtZWRfdmFsdWUuCgpXaXRoIHRo
ZSBjb21taXQgbWVzc2FnZSBjaGFuZ2VkOgpSZXZpZXdlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpDQyBKw7xyZ2VuLCBJIHRoaW5rIGl0IHdvdWxkIGJl
IG5pY2UgdG8gaGF2ZSB0aGUgYnVpbGQgZml4IGluIHRoZQpyZWxlYXNlLgoKQ2hlZXJzLgoKCj4g
U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KPiAtLS0KPiAgdG9vbHMvb2NhbWwvbGlicy94ZW50b29sbG9nL3hlbnRvb2xsb2dfc3R1YnMu
YyB8ICA0ICsrLS0KPiAgdG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jICAgICAg
ICAgICB8IDIwICsrKysrKysrKystLS0tLS0tLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5z
ZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1s
L2xpYnMveGVudG9vbGxvZy94ZW50b29sbG9nX3N0dWJzLmMgYi90b29scy9vY2FtbC9saWJzL3hl
bnRvb2xsb2cveGVudG9vbGxvZ19zdHVicy5jCj4gaW5kZXggYWFkYzNkMS4uMWY3M2YyNiAxMDA2
NDQKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hlbnRvb2xsb2cveGVudG9vbGxvZ19zdHVicy5j
Cj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94ZW50b29sbG9nL3hlbnRvb2xsb2dfc3R1YnMuYwo+
IEBAIC05MCw3ICs5MCw3IEBAIHN0YXRpYyB2b2lkIHN0dWJfeHRsX29jYW1sX3ZtZXNzYWdlKHN0
cnVjdCB4ZW50b29sbG9nX2xvZ2dlciAqbG9nZ2VyLAo+ICAJQ0FNTHBhcmFtMCgpOwo+ICAJQ0FN
TGxvY2FsTihhcmdzLCA0KTsKPiAgCXN0cnVjdCBjYW1sX3h0bCAqeHRsID0gKHN0cnVjdCBjYW1s
X3h0bCopbG9nZ2VyOwo+IC0JdmFsdWUgKmZ1bmMgPSBjYW1sX25hbWVkX3ZhbHVlKHh0bC0+dm1l
c3NhZ2VfY2IpIDsKPiArCWNvbnN0IHZhbHVlICpmdW5jID0gY2FtbF9uYW1lZF92YWx1ZSh4dGwt
PnZtZXNzYWdlX2NiKSA7Cj4gIAljaGFyICptc2c7Cj4gIAo+ICAJaWYgKGZ1bmMgPT0gTlVMTCkK
PiBAQCAtMTIwLDcgKzEyMCw3IEBAIHN0YXRpYyB2b2lkIHN0dWJfeHRsX29jYW1sX3Byb2dyZXNz
KHN0cnVjdCB4ZW50b29sbG9nX2xvZ2dlciAqbG9nZ2VyLAo+ICAJQ0FNTHBhcmFtMCgpOwo+ICAJ
Q0FNTGxvY2FsTihhcmdzLCA1KTsKPiAgCXN0cnVjdCBjYW1sX3h0bCAqeHRsID0gKHN0cnVjdCBj
YW1sX3h0bCopbG9nZ2VyOwo+IC0JdmFsdWUgKmZ1bmMgPSBjYW1sX25hbWVkX3ZhbHVlKHh0bC0+
cHJvZ3Jlc3NfY2IpIDsKPiArCWNvbnN0IHZhbHVlICpmdW5jID0gY2FtbF9uYW1lZF92YWx1ZSh4
dGwtPnByb2dyZXNzX2NiKSA7Cj4gIAo+ICAJaWYgKGZ1bmMgPT0gTlVMTCkKPiAgCQljYW1sX3Jh
aXNlX3N5c19lcnJvcihjYW1sX2NvcHlfc3RyaW5nKCJVbmFibGUgdG8gZmluZCBjYWxsYmFjayIp
KTsKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jIGIv
dG9vbHMvb2NhbWwvbGlicy94bC94ZW5saWdodF9zdHVicy5jCj4gaW5kZXggZmYxNmI4Ny4uMTE4
MTk3MSAxMDA2NDQKPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hsL3hlbmxpZ2h0X3N0dWJzLmMK
PiArKysgYi90b29scy9vY2FtbC9saWJzL3hsL3hlbmxpZ2h0X3N0dWJzLmMKPiBAQCAtNzUsNyAr
NzUsNyBAQCBzdGF0aWMgdm9pZCBmYWlsd2l0aF94bChpbnQgZXJyb3IsIGNoYXIgKmZuYW1lKQo+
ICB7Cj4gIAlDQU1McGFyYW0wKCk7Cj4gIAlDQU1MbG9jYWwxKGFyZyk7Cj4gLQlzdGF0aWMgdmFs
dWUgKmV4YyA9IE5VTEw7Cj4gKwlzdGF0aWMgY29uc3QgdmFsdWUgKmV4YyA9IE5VTEw7Cj4gIAo+
ICAJLyogRmlyc3QgdGltZSBhcm91bmQsIGxvb2t1cCBieSBuYW1lICovCj4gIAlpZiAoIWV4YykK
PiBAQCAtNDI0LDcgKzQyNCw3IEBAIHZvaWQgYXN5bmNfY2FsbGJhY2sobGlieGxfY3R4ICpjdHgs
IGludCByYywgdm9pZCAqZm9yX2NhbGxiYWNrKQo+ICAJY2FtbF9sZWF2ZV9ibG9ja2luZ19zZWN0
aW9uKCk7Cj4gIAlDQU1McGFyYW0wKCk7Cj4gIAlDQU1MbG9jYWwyKGVycm9yLCB0bXApOwo+IC0J
c3RhdGljIHZhbHVlICpmdW5jID0gTlVMTDsKPiArCXN0YXRpYyBjb25zdCB2YWx1ZSAqZnVuYyA9
IE5VTEw7Cj4gIAl2YWx1ZSAqcCA9ICh2YWx1ZSAqKSBmb3JfY2FsbGJhY2s7Cj4gIAo+ICAJaWYg
KGZ1bmMgPT0gTlVMTCkgewo+IEBAIC0xMTMzLDcgKzExMzMsNyBAQCB2YWx1ZSBzdHViX2xpYnhs
X3hlbl9jb25zb2xlX3JlYWRfc3RhcnQodmFsdWUgY3R4LCB2YWx1ZSBjbGVhcikKPiAgCj4gIHN0
YXRpYyB2b2lkIHJhaXNlX2VvZih2b2lkKQo+ICB7Cj4gLQlzdGF0aWMgdmFsdWUgKmV4YyA9IE5V
TEw7Cj4gKwlzdGF0aWMgY29uc3QgdmFsdWUgKmV4YyA9IE5VTEw7Cj4gIAo+ICAJLyogRmlyc3Qg
dGltZSBhcm91bmQsIGxvb2t1cCBieSBuYW1lICovCj4gIAlpZiAoIWV4YykKPiBAQCAtMTI3NCw3
ICsxMjc0LDcgQEAgaW50IGZkX3JlZ2lzdGVyKHZvaWQgKnVzZXIsIGludCBmZCwgdm9pZCAqKmZv
cl9hcHBfcmVnaXN0cmF0aW9uX291dCwKPiAgCUNBTUxwYXJhbTAoKTsKPiAgCUNBTUxsb2NhbE4o
YXJncywgNCk7Cj4gIAlpbnQgcmV0ID0gMDsKPiAtCXN0YXRpYyB2YWx1ZSAqZnVuYyA9IE5VTEw7
Cj4gKwlzdGF0aWMgY29uc3QgdmFsdWUgKmZ1bmMgPSBOVUxMOwo+ICAJdmFsdWUgKnAgPSAodmFs
dWUgKikgdXNlcjsKPiAgCXZhbHVlICpmb3JfYXBwOwo+ICAKPiBAQCAtMTMxNyw3ICsxMzE3LDcg
QEAgaW50IGZkX21vZGlmeSh2b2lkICp1c2VyLCBpbnQgZmQsIHZvaWQgKipmb3JfYXBwX3JlZ2lz
dHJhdGlvbl91cGRhdGUsCj4gIAlDQU1McGFyYW0wKCk7Cj4gIAlDQU1MbG9jYWxOKGFyZ3MsIDQp
Owo+ICAJaW50IHJldCA9IDA7Cj4gLQlzdGF0aWMgdmFsdWUgKmZ1bmMgPSBOVUxMOwo+ICsJc3Rh
dGljIGNvbnN0IHZhbHVlICpmdW5jID0gTlVMTDsKPiAgCXZhbHVlICpwID0gKHZhbHVlICopIHVz
ZXI7Cj4gIAl2YWx1ZSAqZm9yX2FwcCA9ICpmb3JfYXBwX3JlZ2lzdHJhdGlvbl91cGRhdGU7Cj4g
IAo+IEBAIC0xMzU2LDcgKzEzNTYsNyBAQCB2b2lkIGZkX2RlcmVnaXN0ZXIodm9pZCAqdXNlciwg
aW50IGZkLCB2b2lkICpmb3JfYXBwX3JlZ2lzdHJhdGlvbikKPiAgCWNhbWxfbGVhdmVfYmxvY2tp
bmdfc2VjdGlvbigpOwo+ICAJQ0FNTHBhcmFtMCgpOwo+ICAJQ0FNTGxvY2FsTihhcmdzLCAzKTsK
PiAtCXN0YXRpYyB2YWx1ZSAqZnVuYyA9IE5VTEw7Cj4gKwlzdGF0aWMgY29uc3QgdmFsdWUgKmZ1
bmMgPSBOVUxMOwo+ICAJdmFsdWUgKnAgPSAodmFsdWUgKikgdXNlcjsKPiAgCXZhbHVlICpmb3Jf
YXBwID0gZm9yX2FwcF9yZWdpc3RyYXRpb247Cj4gIAo+IEBAIC0xMzk4LDcgKzEzOTgsNyBAQCBp
bnQgdGltZW91dF9yZWdpc3Rlcih2b2lkICp1c2VyLCB2b2lkICoqZm9yX2FwcF9yZWdpc3RyYXRp
b25fb3V0LAo+ICAJQ0FNTGxvY2FsMihzZWMsIHVzZWMpOwo+ICAJQ0FNTGxvY2FsTihhcmdzLCA0
KTsKPiAgCWludCByZXQgPSAwOwo+IC0Jc3RhdGljIHZhbHVlICpmdW5jID0gTlVMTDsKPiArCXN0
YXRpYyBjb25zdCB2YWx1ZSAqZnVuYyA9IE5VTEw7Cj4gIAl2YWx1ZSAqcCA9ICh2YWx1ZSAqKSB1
c2VyOwo+ICAJc3RydWN0IHRpbWVvdXRfaGFuZGxlcyAqaGFuZGxlczsKPiAgCj4gQEAgLTE0NTAs
NyArMTQ1MCw3IEBAIGludCB0aW1lb3V0X21vZGlmeSh2b2lkICp1c2VyLCB2b2lkICoqZm9yX2Fw
cF9yZWdpc3RyYXRpb25fdXBkYXRlLAo+ICAJQ0FNTGxvY2FsMShmb3JfYXBwX3VwZGF0ZSk7Cj4g
IAlDQU1MbG9jYWxOKGFyZ3MsIDIpOwo+ICAJaW50IHJldCA9IDA7Cj4gLQlzdGF0aWMgdmFsdWUg
KmZ1bmMgPSBOVUxMOwo+ICsJc3RhdGljIGNvbnN0IHZhbHVlICpmdW5jID0gTlVMTDsKPiAgCXZh
bHVlICpwID0gKHZhbHVlICopIHVzZXI7Cj4gIAlzdHJ1Y3QgdGltZW91dF9oYW5kbGVzICpoYW5k
bGVzID0gKmZvcl9hcHBfcmVnaXN0cmF0aW9uX3VwZGF0ZTsKPiAgCj4gQEAgLTE1NjYsNyArMTU2
Niw3IEBAIHZvaWQgZXZlbnRfb2NjdXJzKHZvaWQgKnVzZXIsIGxpYnhsX2V2ZW50ICpldmVudCkK
PiAgCUNBTUxwYXJhbTAoKTsKPiAgCUNBTUxsb2NhbE4oYXJncywgMik7Cj4gIAlzdHJ1Y3QgdXNl
cl93aXRoX2N0eCAqY191c2VyID0gKHN0cnVjdCB1c2VyX3dpdGhfY3R4ICopIHVzZXI7Cj4gLQlz
dGF0aWMgdmFsdWUgKmZ1bmMgPSBOVUxMOwo+ICsJc3RhdGljIGNvbnN0IHZhbHVlICpmdW5jID0g
TlVMTDsKPiAgCj4gIAlpZiAoZnVuYyA9PSBOVUxMKSB7Cj4gIAkJLyogRmlyc3QgdGltZSBhcm91
bmQsIGxvb2t1cCBieSBuYW1lICovCj4gQEAgLTE1ODksNyArMTU4OSw3IEBAIHZvaWQgZGlzYXN0
ZXIodm9pZCAqdXNlciwgbGlieGxfZXZlbnRfdHlwZSB0eXBlLAo+ICAJQ0FNTHBhcmFtMCgpOwo+
ICAJQ0FNTGxvY2FsTihhcmdzLCA0KTsKPiAgCXN0cnVjdCB1c2VyX3dpdGhfY3R4ICpjX3VzZXIg
PSAoc3RydWN0IHVzZXJfd2l0aF9jdHggKikgdXNlcjsKPiAtCXN0YXRpYyB2YWx1ZSAqZnVuYyA9
IE5VTEw7Cj4gKwlzdGF0aWMgY29uc3QgdmFsdWUgKmZ1bmMgPSBOVUxMOwo+ICAKPiAgCWlmIChm
dW5jID09IE5VTEwpIHsKPiAgCQkvKiBGaXJzdCB0aW1lIGFyb3VuZCwgbG9va3VwIGJ5IG5hbWUg
Ki8KPiAtLSAKPiAyLjcuNAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdAo+IFhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWwKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
