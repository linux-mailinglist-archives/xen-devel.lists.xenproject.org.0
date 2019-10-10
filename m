Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B269FD27CD
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 13:10:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIWEq-0006yv-3T; Thu, 10 Oct 2019 11:04:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t5VA=YD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iIWEo-0006xv-PM
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 11:04:06 +0000
X-Inumbo-ID: a9b20bf6-eb4d-11e9-80e3-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9b20bf6-eb4d-11e9-80e3-bc764e2007e4;
 Thu, 10 Oct 2019 11:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570705440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hhRu1nFIWPw7WnQfPcGb340mQo7QXPNxztF11mDjH6A=;
 b=DY3aoiQlJ/ysiHE7ku7p0zXigNagnVX5XKuENMSQrjUi7k8I/uyeSVBP
 fUfnfJRO2GgJQEHKVrYpeNeK3Rzw5ucTpytLhFcoGYmtwdRzAndSDw73O
 gIgm3yET0QBtuoXd0tGQeDkc87vAavwiU6lYpb/x7mcgKf6K2XkPJApE2 Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iEALV9aL7iyaDKnZ9Nwh/8CMJKfaLW7A/sBEVwzoXtacnLKg+CfIQ2+McpjbYd1bgl2Ua9K5cx
 wDARz6aVaS5YD8p6xR+BUJkfiRXfNJE060dSKAKmfeG3E3lHtEE6e0zy2lTnvtcGnvMXuvHYom
 KHlmmEtO/L0rfg5Mo/8gcqJdwprm4FcRfF1AfFMBBMVPWl2H9QZ/9hgwcaup4565dKmx0KhvlM
 7eS0Yac0eno9rECd/FSOoo0pUHwZV4ZM1UJUxW7gI1vYqkIMDRj1Z1vbRyU4e59nhWQlcLlTr3
 i50=
X-SBRS: 2.7
X-MesageID: 6972754
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,279,1566878400"; 
   d="scan'208";a="6972754"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 13:03:38 +0200
Message-ID: <20191010110339.6447-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191010110339.6447-1-roger.pau@citrix.com>
References: <20191010110339.6447-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x2APIC: translate IO-APIC entries when
 enabling the IOMMU
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBpbnRlcnJ1cHQgcmVtYXBwaW5nIGlzIGVuYWJsZWQgYXMgcGFydCBvZiBlbmFibGluZyB4
MkFQSUMgdGhlCklPLUFQSUMgZW50cmllcyBhbHNvIG5lZWQgdG8gYmUgdHJhbnNsYXRlZCB0byB0
aGUgbmV3IGZvcm1hdCBhbmQgYWRkZWQKdG8gdGhlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGUu
CgpUaGlzIHByZXZlbnRzIElPTU1VIGludGVycnVwdCByZW1hcHBpbmcgZmF1bHRzIHdoZW4gYm9v
dGluZyBvbgpoYXJkd2FyZSB0aGF0IGhhcyB1bm1hc2tlZCBJTy1BUElDIHBpbnMuCgpSZXBvcnRl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9hcGljLmMgICAg
ICAgICAgIHwgMTIgKysrKysrKysrKy0tCiB4ZW4vYXJjaC94ODYvaW9fYXBpYy5jICAgICAgICB8
ICA1ICsrKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaCB8ICAzICsrLQogMyBmaWxl
cyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9hcGljLmMgYi94ZW4vYXJjaC94ODYvYXBpYy5jCmluZGV4IDZjZGI1MGNm
NDEuLjk4MTBkZTc0NzMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9hcGljLmMKKysrIGIveGVu
L2FyY2gveDg2L2FwaWMuYwpAQCAtNTE1LDcgKzUxNSw3IEBAIHN0YXRpYyB2b2lkIHJlc3VtZV94
MmFwaWModm9pZCkKICAgICBpb21tdV9lbmFibGVfeDJhcGljKCk7CiAgICAgX19lbmFibGVfeDJh
cGljKCk7CiAKLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAoaW9hcGljX2VudHJpZXMpOworICAg
IHJlc3RvcmVfSU9fQVBJQ19zZXR1cChpb2FwaWNfZW50cmllcywgdHJ1ZSk7CiAgICAgdW5tYXNr
XzgyNTlBKCk7CiAKIG91dDoKQEAgLTg4Nyw2ICs4ODcsNyBAQCB2b2lkIF9faW5pdCB4MmFwaWNf
YnNwX3NldHVwKHZvaWQpCiB7CiAgICAgc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgKippb2Fw
aWNfZW50cmllcyA9IE5VTEw7CiAgICAgY29uc3QgY2hhciAqb3JpZ19uYW1lOworICAgIGJvb2wg
aW9tbXVfZW5hYmxlZCA9IHRydWU7CiAKICAgICBpZiAoICFjcHVfaGFzX3gyYXBpYyApCiAgICAg
ICAgIHJldHVybjsKQEAgLTkzNCw2ICs5MzUsNyBAQCB2b2lkIF9faW5pdCB4MmFwaWNfYnNwX3Nl
dHVwKHZvaWQpCiAgICAgICAgIGlmICggIXgyYXBpY19lbmFibGVkICkKICAgICAgICAgewogICAg
ICAgICAgICAgcHJpbnRrKCJOb3QgZW5hYmxpbmcgeDJBUElDICh1cG9uIGZpcm13YXJlIHJlcXVl
c3QpXG4iKTsKKyAgICAgICAgICAgIGlvbW11X2VuYWJsZWQgPSBmYWxzZTsKICAgICAgICAgICAg
IGdvdG8gcmVzdG9yZV9vdXQ7CiAgICAgICAgIH0KICAgICAgICAgLyogZmFsbCB0aHJvdWdoICov
CkBAIC05NDQsNiArOTQ2LDcgQEAgdm9pZCBfX2luaXQgeDJhcGljX2JzcF9zZXR1cCh2b2lkKQog
CiAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSCiAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGVu
YWJsZSBJbnRlcnJ1cHQgUmVtYXBwaW5nOiBXaWxsIG5vdCBlbmFibGUgeDJBUElDLlxuIik7Cisg
ICAgICAgIGlvbW11X2VuYWJsZWQgPSBmYWxzZTsKICAgICAgICAgZ290byByZXN0b3JlX291dDsK
ICAgICB9CiAKQEAgLTk2MSw3ICs5NjQsMTIgQEAgdm9pZCBfX2luaXQgeDJhcGljX2JzcF9zZXR1
cCh2b2lkKQogICAgICAgICBwcmludGsoIlN3aXRjaGVkIHRvIEFQSUMgZHJpdmVyICVzXG4iLCBn
ZW5hcGljLm5hbWUpOwogCiByZXN0b3JlX291dDoKLSAgICByZXN0b3JlX0lPX0FQSUNfc2V0dXAo
aW9hcGljX2VudHJpZXMpOworICAgIC8qCisgICAgICogTkI6IGRvIG5vdCB1c2UgcmF3IG1vZGUg
d2hlbiByZXN0b3JpbmcgZW50cmllcyBpZiB0aGUgaW9tbXUgaGFzIGJlZW4KKyAgICAgKiBlbmFi
bGVkIGR1cmluZyB0aGUgcHJvY2VzcywgYmVjYXVzZSB0aGUgZW50cmllcyBuZWVkIHRvIGJlIHRy
YW5zbGF0ZWQKKyAgICAgKiBhbmQgYWRkZWQgdG8gdGhlIHJlbWFwcGluZyB0YWJsZSBpbiB0aGF0
IGNhc2UuCisgICAgICovCisgICAgcmVzdG9yZV9JT19BUElDX3NldHVwKGlvYXBpY19lbnRyaWVz
LCAhaW9tbXVfZW5hYmxlZCk7CiAgICAgdW5tYXNrXzgyNTlBKCk7CiAKIG91dDoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCmluZGV4
IDVkMjU4NjJiZDguLjM3ZWFiYzE2YzkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGlj
LmMKKysrIGIveGVuL2FyY2gveDg2L2lvX2FwaWMuYwpAQCAtMzc5LDcgKzM3OSw4IEBAIHZvaWQg
bWFza19JT19BUElDX3NldHVwKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2Vu
dHJpZXMpCiAvKgogICogUmVzdG9yZSBJTyBBUElDIGVudHJpZXMgd2hpY2ggd2FzIHNhdmVkIGlu
IGlvYXBpY19lbnRyaWVzLgogICovCi1pbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0cnVjdCBJ
T19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMpCitpbnQgcmVzdG9yZV9JT19BUElD
X3NldHVwKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmF3KQogewogICAgIGludCBhcGljLCBwaW47CiAK
QEAgLTM5NCw3ICszOTUsNyBAQCBpbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0cnVjdCBJT19B
UElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMpCiAgICAgICAgICAgICByZXR1cm4gLUVO
T01FTTsKIAogICAgICAgICBmb3IgKHBpbiA9IDA7IHBpbiA8IG5yX2lvYXBpY19lbnRyaWVzW2Fw
aWNdOyBwaW4rKykKLQkgICAgaW9hcGljX3dyaXRlX2VudHJ5KGFwaWMsIHBpbiwgMSwgaW9hcGlj
X2VudHJpZXNbYXBpY11bcGluXSk7CisJICAgIGlvYXBpY193cml0ZV9lbnRyeShhcGljLCBwaW4s
IHJhdywgaW9hcGljX2VudHJpZXNbYXBpY11bcGluXSk7CiAgICAgfQogCiAgICAgcmV0dXJuIDA7
CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2lvX2FwaWMuaCBiL3hlbi9pbmNsdWRl
L2FzbS14ODYvaW9fYXBpYy5oCmluZGV4IDBiMDQxZjA1NjUuLjk5ODkwNTE4NmIgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9fYXBpYy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaW9fYXBpYy5oCkBAIC0xOTcsNyArMTk3LDggQEAgZXh0ZXJuIHN0cnVjdCBJT19BUElDX3Jv
dXRlX2VudHJ5ICoqYWxsb2NfaW9hcGljX2VudHJpZXModm9pZCk7CiBleHRlcm4gdm9pZCBmcmVl
X2lvYXBpY19lbnRyaWVzKHN0cnVjdCBJT19BUElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJp
ZXMpOwogZXh0ZXJuIGludCBzYXZlX0lPX0FQSUNfc2V0dXAoc3RydWN0IElPX0FQSUNfcm91dGVf
ZW50cnkgKippb2FwaWNfZW50cmllcyk7CiBleHRlcm4gdm9pZCBtYXNrX0lPX0FQSUNfc2V0dXAo
c3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgKippb2FwaWNfZW50cmllcyk7Ci1leHRlcm4gaW50
IHJlc3RvcmVfSU9fQVBJQ19zZXR1cChzdHJ1Y3QgSU9fQVBJQ19yb3V0ZV9lbnRyeSAqKmlvYXBp
Y19lbnRyaWVzKTsKK2V4dGVybiBpbnQgcmVzdG9yZV9JT19BUElDX3NldHVwKHN0cnVjdCBJT19B
UElDX3JvdXRlX2VudHJ5ICoqaW9hcGljX2VudHJpZXMsCisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIHJhdyk7CiAKIHVuc2lnbmVkIGhpZ2hlc3RfZ3NpKHZvaWQpOwogCi0t
IAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
