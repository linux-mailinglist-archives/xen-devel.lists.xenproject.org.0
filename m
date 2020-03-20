Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AAD18D12A
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 15:38:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFIlQ-0000p0-US; Fri, 20 Mar 2020 14:36:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WMS9=5F=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jFIlQ-0000or-B9
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 14:36:44 +0000
X-Inumbo-ID: 36c95cdb-6ab8-11ea-bd8d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36c95cdb-6ab8-11ea-bd8d-12813bfff9fa;
 Fri, 20 Mar 2020 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584715003;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=+InaeLMDit7KA/GrvF38TtF6ZClbCT1k4zfZdSWE9AI=;
 b=BjBx4TyLlY2bJPGX40yq2at6gr4Y7YccPCuV35kr3PimwfP71VoCCMf2
 wTmVF4hnT3+ra4SMvp86KS1JXcTLC4T8L4YbuddqB64Fm4ADerh374+lA
 7fKrzr54tOiYacPR8GK9+hN6NtOaOA4Ozhow7uKTLc/wg0BfTc5doU/u0 I=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YangDzTHU2T53TTUNYQp+BnUgUsQ55WzitjaVqfoolhq4EcYoqcn3Ej93OEUbfLy6h13a19jm/
 nfwShCS+Yz2RL3RVWsjy/owmzbFYkqX3Ez7bdP/qfSW/yE6xjLkOaoPRwY2ihoblQ4ib91IL+F
 n3YzRyLQ9WPjZ8KL61R7kYue7Io6T8zOLG81qPdmY3NR8n0cuZIM+zzIUIynEazNYrueWL7ACj
 Y/x/sa0sriRdg1RJLRKi7Mf5eVb2mESmJYySwE0EDM5biV1VBIRLtDB1NBLb0NLTnyZ0duJg2S
 zJc=
X-SBRS: 2.7
X-MesageID: 15000071
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="15000071"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24180.54519.789153.991856@mariner.uk.xensource.com>
Date: Fri, 20 Mar 2020 14:36:39 +0000
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20200319204025.2649661-2-dwmw2@infradead.org>,
 <a7d98bb58f9c81d28728e564f7a9b04917dbc0b0.camel@infradead.org>
References: <20200319204025.2649661-1-dwmw2@infradead.org>
 <20200319204025.2649661-2-dwmw2@infradead.org>
 <001a01d5fea7$230f5aa0$692e0fe0$@xen.org>
 <a7d98bb58f9c81d28728e564f7a9b04917dbc0b0.camel@infradead.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: [Xen-devel] [PATCH 2/2] tools/xenstore: Accumulate errors in
 xenstore-ls and exit appropriately [and 1 more messages]
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
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, paul@xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGF2aWQgV29vZGhvdXNlIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi8yXSB0b29s
cy94ZW5zdG9yZTogQWNjdW11bGF0ZSBlcnJvcnMgaW4geGVuc3RvcmUtbHMgYW5kIGV4aXQgYXBw
cm9wcmlhdGVseSIpOgo+IEl0J3MgcGF0Y2ggMSB3aGljaCBJIHJlYWxseSBjYXJlIGFib3V0OyB0
aGlzIHBhcnQgaXMganVzdCB5YWsgc2hhdmluZwo+IGF0IElhbidzIHByb21wdGluZy4KCkhpLiAg
VGhhbmtzIGZvciB3b3JraW5nIG9uIHRoaXMgY2xlYW51cC4KCkkgY29uZmVzcyB0aGF0IHdoaWxl
IHJldmlld2luZyB5b3VyIGNvZGUgSSBmZWx0IGEgYml0IGNvbmZ1c2VkIGFuZAp0aGlja2hlYWRl
ZC4gIChJIGhhdmUgaGFkIGEgZGlmZmljdWx0IHdlZWsuKSAgU28gSSB0aGluayB3aGF0IEkgYW0K
YWJvdXQgdG8gc2F5IG1heSBub3QgYmUgYXMgdXNlZnVsIG9yIHRydWUgYXMgaXQgb3VnaHQgdG8g
YmUuLi4uCgpZb3UnbGwgc2VlIEkndmUgcHV0IG15IFItYiBvbiBwYXRjaCAxLiAgRGVzcGl0ZSB0
aGF0LCBnaXZlbiB3aGF0CmFwcGVhcnMgaGVyZSBpbiBwYXRjaCAyLCBJIHRoaW5rIHlvdSBtaWdo
dCB3YW50IHRvIHRyeSB0byBsb29rIGludG8KdXNpbmcgeHNfdHJhbnNhY3Rpb25fe3N0YXJ0LGVu
ZH0gaW4geGVuc3RvcmUtbHMuICBUaGF0IG1pZ2h0IG1ha2UKdGhpbmdzIHNpbXBsZXIuCgpJbiBw
YXJ0aWN1bGFyIEkgdGhpbmsgdGhpcyBiZWNhdXNlIEknbSBub3Qgc3VyZSBJIGZ1bGx5IHVuZGVy
c3RhbmQgdGhlCmltcGxpY2F0aW9ucyBvZiB3aGVuIHRvIGlnbm9yZSBFQUNDRVMgZXJyb3JzLCBw
dXJwb3J0ZWRseSBvbiB0aGUKZ3JvdW5kcyB0aGF0IHRoZXkgbWlnaHQgYmUgY2F1c2VkIGJ5IGNv
bmN1cnJlbnQgdXBkYXRlcyB0byB4ZW5zdG9yZS4KTXkgaW5jbGluYXRpb24gaXMgdG8gdGhpbmsg
dGhhdCB0aGlzIGNhbid0IGJlIHJpZ2h0LiAgQnV0IGRvaW5nCmV2ZXJ5dGhpbmcgaW4gYSB0cmFu
c2FjdGlvbiB3b3VsZCBjb21wbGV0ZWx5IGVsaW1pbmF0ZSB0aGlzIGlzc3VlLgoKClJlZ2FyZGxl
c3Mgb2YgdGhhdCwgaXQgaXMgc3RpbGwgYSBidWcgdGhhdCB4ZW5zdG9yZS1scyBpZ25vcmVzIGVy
cm9ycwpmYXIgdG9vIG11Y2ggYW5kIEkgdmVyeSBtdWNoIHdlbGNvbWUgeW91ciBlZmZvcnRzIHRv
IGZpeCB0aGlzIGluIDIvLgoKSSBkb24ndCBrbm93IGlmIEkgYWxyZWFkeSBleHBsYWluZWQgbXkg
b3ZlcmFsbCB0aGVvcnkgYWJvdXQgdGhpcyBidXQ6CklTVE0gdGhhdCB4ZW5zdG9yZS1scyBzaG91
bGQgZXhpdCAwIGlmZiBpdCB3YXMgYWJsZSB0byBmaW5kIGFuZCBwcmludAphbGwgdGhlIGluZm9y
bWF0aW9uIHJlcXVlc3RlZC4gIElmIGl0IGV4aXRzIG5vbi0wIGl0IHNob3VsZCBoYXZlCnByaW50
ZWQgYXQgbGVhc3Qgb25lIHRoaW5nIHRvIHN0ZGVyci4KCgpEYXZpZCBXb29kaG91c2Ugd3JpdGVz
ICgiW1BBVENIIDIvMl0gdG9vbHMveGVuc3RvcmU6IEFjY3VtdWxhdGUgZXJyb3JzIGluIHhlbnN0
b3JlLWxzIGFuZCBleGl0IGFwcHJvcHJpYXRlbHkiKToKPiBGcm9tOiBEYXZpZCBXb29kaG91c2Ug
PGR3bXdAYW1hem9uLmNvLnVrPgo+IAo+IFJlcG9ydCBvbmx5IG9uZSBlcnJvciB0byBzdGRlcnIg
Zm9yIGVhY2ggbm9kZSwgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIGl0J3MKPiB4c19yZWFkLCB4c19n
ZXRfcGVybWlzc2lvbnMgb3IgeHNfZGlyZWN0b3J5IG9uIHRoZSBjaGlsZCB0aGF0IGZhaWxzLgo+
IAo+IEFsd2F5cyBleGl0IHdpdGggYSBub24temVybyBjb2RlIGlmIGFueSBmYWlsdXJlIGhhcHBl
bnMsIHJlcG9ydGluZyB0aGUKPiBsYXN0IGVycm9yIHRoYXQgb2NjdXJyZWQuCgpJIHRoaW5rIHRo
b3VnaCwgdGhhdCB0aGlzIHBhdGNoIGhhcyBzb21lIHJlbW5hbnRzIG9mIHByZXZpb3VzCml0ZXJh
dGlvbnMgaW4gaXQuCgo+IC1zdGF0aWMgdm9pZCBkb19scyhzdHJ1Y3QgeHNfaGFuZGxlICpoLCBj
aGFyICpwYXRoLCBpbnQgY3VyX2RlcHRoLCBpbnQgc2hvd19wZXJtcykKPiArc3RhdGljIGludCBk
b19scyhzdHJ1Y3QgeHNfaGFuZGxlICpoLCBjaGFyICpwYXRoLCBpbnQgY3VyX2RlcHRoLCBpbnQg
c2hvd19wZXJtcywgaW50IGVycm9yLCBpbnQgaWdub3JlX2Vycm9ycykKPiAgewo+ICAgICAgY2hh
ciAqKmU7Cj4gICAgICBjaGFyICpuZXdwYXRoLCAqdmFsOwo+IEBAIC0xNTAsOSArMTUwLDE2IEBA
IHN0YXRpYyB2b2lkIGRvX2xzKHN0cnVjdCB4c19oYW5kbGUgKmgsIGNoYXIgKnBhdGgsIGludCBj
dXJfZGVwdGgsIGludCBzaG93X3Blcm1zCj4gIAo+ICAgICAgZSA9IHhzX2RpcmVjdG9yeShoLCBY
QlRfTlVMTCwgcGF0aCwgJm51bSk7Cj4gICAgICBpZiAoZSA9PSBOVUxMKSB7Cj4gLSAgICAgICAg
aWYgKGN1cl9kZXB0aCAmJiBlcnJubyA9PSBFTk9FTlQpIHsKPiAtICAgICAgICAgICAgLyogSWYg
YSBub2RlIGRpc2FwcGVhcnMgd2hpbGUgcmVjdXJzaW5nLCBzaWxlbnRseSBtb3ZlIG9uLiAqLwo+
IC0gICAgICAgICAgICByZXR1cm47CgpJU1RNIHRoYXQgdGhpcyBjb2RlIG91Z2h0IHRvIGJlIHJl
dGFpbmVkLiAgSXQgaXMgc3RpbGwgdGhlIGNhc2UgdGhhdAp5b3Ugd2FudCB0byBpZ25vcmUgRU5P
RU5ULiAgKFVubGVzcyB5b3UgZG8gdGhlIHRyYW5zYWN0aW9uIHRoaW5nLikKCj4gKyAgICAgICAg
aWYgKGN1cl9kZXB0aCAmJiAoZXJybm8gPT0gRU5PRU5UIHx8IGVycm5vID09IEVBQ0NFUykpIHsK
PiArICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICogSWYgYSBub2RlIGRpc2FwcGVhcnMg
b3IgYmVjb21lcyBpbmFjY2Vzc2libGUgd2hpbGUgdHJhdmVyc2luZywKPiArICAgICAgICAgICAg
ICogb25seSBwcmludCBhbiBlcnJvciBpZiBwcmV2aW91cyBvcGVyYXRpb25zIG9uIHRoaXMgbm9k
ZSBoYXZlbid0Cj4gKyAgICAgICAgICAgICAqIGRvbmUgZG8uIFRoZW4gbW92ZSBvbi4KPiArICAg
ICAgICAgICAgICovCj4gKyAgICAgICAgICAgIGVycm9yID0gZXJybm87Cj4gKyAgICAgICAgICAg
IGlmICghaWdub3JlX2Vycm9ycykKPiArICAgICAgICAgICAgICAgIHdhcm4oInhzX2RpcmVjdG9y
eSAoJXMpIiwgcGF0aCk7Cj4gKyAgICAgICAgICAgIHJldHVybiBlcnJvcjsKClNvIHRoaXMgYnJh
bmNoIGlzIGp1c3QgZm9yIEVBQ0NFUyA/ICBXaGF0IGlzIHRoZSBqdXN0aWZpY2F0aW9uIGZvcgpo
YW5kbGluZyBFQUNDRVMgc3BlY2lhbGx5ID8gIE1heWJlIGl0IGlzIHRoZSBvbmx5ICJleHBlY3Rl
ZCIgZXJyb3IgPwoKPiBAQCAtMTk3LDcgKzIwNCw4IEBAIHN0YXRpYyB2b2lkIGRvX2xzKHN0cnVj
dCB4c19oYW5kbGUgKmgsIGNoYXIgKnBhdGgsIGludCBjdXJfZGVwdGgsIGludCBzaG93X3Blcm1z
Cj4gIAo+ICAgICAgICAgIC8qIFByaW50IHZhbHVlICovCj4gICAgICAgICAgaWYgKHZhbCA9PSBO
VUxMKSB7Cj4gLSAgICAgICAgICAgIHByaW50ZigiOlxuIik7Cj4gKyAgICAgICAgICAgIGVycm9y
ID0gZXJybm87Cj4gKyAgICAgICAgICAgIHByaW50ZigiOiAoJXMpIiwgc3RyZXJyb3IoZXJyb3Ip
KTsKCldlbGwgZG9uZSBmb3IgbWFraW5nIHRoZSBvdXRwdXQgdW5hbWJpZ3VvdXMuICBgPSAiLi4u
IicgdnMgYDogKC4uLiknCgo+IEBAIC0yMjIsNyArMjMwLDExIEBAIHN0YXRpYyB2b2lkIGRvX2xz
KHN0cnVjdCB4c19oYW5kbGUgKmgsIGNoYXIgKnBhdGgsIGludCBjdXJfZGVwdGgsIGludCBzaG93
X3Blcm1zCj4gICAgICAgICAgaWYgKHNob3dfcGVybXMpIHsKPiAgICAgICAgICAgICAgcGVybXMg
PSB4c19nZXRfcGVybWlzc2lvbnMoaCwgWEJUX05VTEwsIG5ld3BhdGgsICZucGVybXMpOwo+ICAg
ICAgICAgICAgICBpZiAocGVybXMgPT0gTlVMTCkgewo+IC0gICAgICAgICAgICAgICAgd2Fybigi
XG5jb3VsZCBub3QgYWNjZXNzIHBlcm1pc3Npb25zIGZvciAlcyIsIGVbaV0pOwo+ICsgICAgICAg
ICAgICAgICAgZXJyb3IgPSBlcnJubzsKPiArICAgICAgICAgICAgICAgIHZhbCA9IE5VTEw7Cj4g
KyAgICAgICAgICAgICAgICAvKiBEb24ndCByZXBlYXQgYW4gZXJyb3IgbWVzc2FnZSBpZiB4c19y
ZWFkKCkgYWxyZWFkeSBmYWlsZWQgKi8KPiArICAgICAgICAgICAgICAgIGlmICh2YWwpCj4gKyAg
ICAgICAgICAgICAgICAgICAgd2FybigiY291bGQgbm90IGFjY2VzcyBwZXJtaXNzaW9ucyBmb3Ig
JXMiLCBlW2ldKTsKCk1heWJlIHRoaXMgd2FudHMgdGhlIHNhbWUgRU5PRU5UIGhhbmRsaW5nIGFz
IGJlZm9yZSA/ICAoVW5sZXNzIHlvdSBkbwp4c190cmFuc2FjdGlvbl8qLikKCklESyB3aGF0IHRo
ZSBydWxlcyBhcmUgZm9yIHhzX2dldF9wZXJtaXNzaW9ucy5bMV0gRG9lcyBpdCByZXF1aXJlIHJl
YWQKYWNjZXNzID8gIElmIHNvIHRoZW4gSSB0aGluayBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gc2lt
cGx5IHNraXAgdGhlCnhzX2dldF9wZXJtaXNzaW9ucyBjYWxsIGlmIHZhbD09TlVMTC4gIEVzcGVj
aWFsbHkgaWYgeW91IGRvIHRoZQp4c190cmFuc2FjdGlvbl8qIHRoaW5nIC0gc2luY2UgaW4gdGhh
dCBjYXNlIHRoZSB4c19nZXRfcGVybWlzc2lvbnMKY2FsbCBzZWVtcyBkb29tZWQuCgpJIGhvcGUg
dGhpcyByZXZpZXcgd2FzIG9mIHNvbWUgdXNlLiAgUGxlYXNlIGNoYXQgdG8gbWUgb24gaXJjIG9y
IHJlcGx5CmJ5IGVtYWlsIGlmIGl0IGRvZXNuJ3Qgc2VlbSB0byBtYWtlIHNlbnNlLgoKSWFuLgoK
WzFdIFRoZSBpbi10cmVlIGRvY3MgcmVmZXIgaGVyZToKICBodHRwczovL3dpa2kueGVuLm9yZy93
aWtpL1hlbkJ1cyNQZXJtaXNzaW9ucwpidXQgdGhhdCBwYXJ0IG9mIHRoZSB3aWtpIHBhZ2UgZG9l
cyBub3Qgc2F5IHdoYXQgcGVybWlzc2lvbnMgYXJlCm5lZWRlZCBmb3IgR0VUX1BFUk1TIGFuZCBT
RVRfUEVSTVMgdGhlbXNlbHZlcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
