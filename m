Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5F011D41F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 18:35:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifSKF-0002Sj-Od; Thu, 12 Dec 2019 17:32:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NkF/=2C=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ifSKD-0002SV-QG
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 17:32:29 +0000
X-Inumbo-ID: 5b563bf2-1d05-11ea-8dd6-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b563bf2-1d05-11ea-8dd6-12813bfff9fa;
 Thu, 12 Dec 2019 17:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576171944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=S3XOjE923yJW50Y3WjCDBdwMxrtN/r34Znt75Upw2U4=;
 b=dmm+YR8xEipY9mV2+m07uOA/i0bcotttdVbDF8cHp6NuWrZgILZX7k49
 eSKSzdGU4nfbM/NEaD2uyNb0WYzeQYMgHc+0ENypDIe5RAQhxwy6DpRsI
 +q3Lby+bZcVisAViZAw+tGo493555ISq0NjImbdU5qylpXZHSYYhFbcn8 Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZwA3rOBYAS0bps1kTi5Ma6yzTYotUqBOa5Rs7w7Z1gziRt83FHkDWUNkLDsV6l577ySudHktpn
 CP+Pd9Zmc1nUFdGIbDi+XKe46ELVnfwJgcIIEKEvGb8NWWyfpdN1GUr6uIoOaL/cCzrT3H5U++
 FHiebq5s4mbxSaaNE+DibeY0sYGAtGxUMbzMH3RiaPjzX6O1A+4AgH6g16n9Mo8aLGgEf8MmXc
 +5t7jMGmCG8ydo14MW7cVExYtCXX2CGLrkrMraRBX0iZYCMMfp1gwGPbhAVJf+uQio0Bgn7/vx
 WTQ=
X-SBRS: 2.7
X-MesageID: 9961410
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; 
   d="scan'208";a="9961410"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 17:32:01 +0000
Message-ID: <20191212173203.1692762-3-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212173203.1692762-1-george.dunlap@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/4] x86/mm: Implement common put_data_pages for
 put_page_from_l[23]e
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm90aCBwdXRfcGFnZV9mcm9tX2wyZSBhbmQgcHV0X3BhZ2VfZnJvbV9sM2UgaGFuZGxlIGhhdmlu
ZyBzdXBlcnBhZ2UKZW50cmllcyBieSBsb29waW5nIG92ZXIgZWFjaCBwYWdlIGFuZCAicHV0Ii1p
bmcgZWFjaCBvbmUgaW5kaXZpZHVhbGx5LgpBcyB3aXRoIHB1dHRpbmcgcGFnZSB0YWJsZSBlbnRy
aWVzLCB0aGlzIGNvZGUgaXMgZnVuY3Rpb25hbGx5CmlkZW50aWNhbCwgYnV0IGZvciBzb21lIHJl
YXNvbiBkaWZmZXJlbnQuICBNb3Jlb3ZlciwgdGhlcmUgaXMgYWxyZWFkeQphIGNvbW1vbiBmdW5j
dGlvbiwgcHV0X2RhdGFfcGFnZSgpLCB0byBoYW5kbGUgYXV0b21hdGljYWxseSBzd2FwcGluZwpi
ZXR3ZWVuIHB1dF9wYWdlKCkgKGZvciByZWFkLW9ubHkgcGFnZXMpIG9yIHB1dF9wYWdlX2FuZF90
eXBlKCkgKGZvcgpyZWFkLXdyaXRlIHBhZ2VzKS4KClJlcGxhY2UgdGhpcyB3aXRoIHB1dF9kYXRh
X3BhZ2VzKCkgKHBsdXJhbCksIHdoaWNoIGRvZXMgdGhlIGVudGlyZQpsb29wLCBhcyB3ZWxsIGFz
IHRoZSBwdXRfcGFnZSAvIHB1dF9wYWdlX2FuZF90eXBlIHN3aXRjaC4KClNpZ25lZC1vZmYtYnk6
IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KLS0tCk5CIHRoYXQgSSd2
ZSB1c2VkIHRoZSAic2ltcGxlIGZvciBsb29wIiB2ZXJzaW9uIHRvIG1ha2UgaXQgZWFzeSB0byBz
ZWUKd2hhdCdzIGdvaW5nIG9uLCByYXRoZXIgdGhhbiB0aGUgImRvIHsgfSB3aGlsZSgpIiB2ZXJz
aW9uIHdoaWNoIHVzZXMgJgphbmQgY29tcGFyZSB0byB6ZXJvIHJhdGhlciB0aGFuIGNvbXBhcmlu
ZyB0byB0aGUgbWF4LgoKQ0M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L21tLmMgfCA1MiArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDMyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKaW5kZXggZDhh
MGViMmFhNS4uYzA1MDM5YWIyMSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tLmMKKysrIGIv
eGVuL2FyY2gveDg2L21tLmMKQEAgLTEyODksMTQgKzEyODksNiBAQCB2b2lkIHB1dF9wYWdlX2Zy
b21fbDFlKGwxX3BnZW50cnlfdCBsMWUsIHN0cnVjdCBkb21haW4gKmwxZV9vd25lcikKIH0KIAog
I2lmZGVmIENPTkZJR19QVgotc3RhdGljIHZvaWQgcHV0X2RhdGFfcGFnZShzdHJ1Y3QgcGFnZV9p
bmZvICpwYWdlLCBib29sIHdyaXRlYWJsZSkKLXsKLSAgICBpZiAoIHdyaXRlYWJsZSApCi0gICAg
ICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOwotICAgIGVsc2UKLSAgICAgICAgcHV0X3BhZ2Uo
cGFnZSk7Ci19Ci0KIHN0YXRpYyBpbnQgcHV0X3B0X3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGcs
IHN0cnVjdCBwYWdlX2luZm8gKnB0cGcsCiAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBmbGFncykKIHsKQEAgLTEzMTksNiArMTMxMSwyMCBAQCBzdGF0aWMgaW50IHB1dF9wdF9w
YWdlKHN0cnVjdCBwYWdlX2luZm8gKnBnLCBzdHJ1Y3QgcGFnZV9pbmZvICpwdHBnLAogICAgIHJl
dHVybiByYzsKIH0KIAorc3RhdGljIGludCBwdXRfZGF0YV9wYWdlcyhzdHJ1Y3QgcGFnZV9pbmZv
ICpwYWdlLCBib29sIHdyaXRlYWJsZSwgaW50IHB0X3NoaWZ0KQoreworICAgIGludCBpLCBjb3Vu
dCA9IDEgPDwgKHB0X3NoaWZ0IC0gUEFHRV9TSElGVCk7CisKKyAgICBBU1NFUlQoIShtZm5feChw
YWdlX3RvX21mbihwYWdlKSkgJiAoY291bnQgLSAxKSkpOworICAgIGZvciAoIGkgPSAwOyBpIDwg
Y291bnQgOyBpKyssIHBhZ2UrKyApCisgICAgICAgIGlmICggd3JpdGVhYmxlICkKKyAgICAgICAg
ICAgIHB1dF9wYWdlX2FuZF90eXBlKHBhZ2UpOworICAgICAgICBlbHNlCisgICAgICAgICAgICBw
dXRfcGFnZShwYWdlKTsKKworICAgIHJldHVybiAwOworfQorCiAvKgogICogTkIuIFZpcnR1YWwg
YWRkcmVzcyAnbDJlJyBtYXBzIHRvIGEgbWFjaGluZSBhZGRyZXNzIHdpdGhpbiBmcmFtZSAncGZu
Jy4KICAqIE5vdGUgYWxzbyB0aGF0IHRoaXMgYXV0b21hdGljYWxseSBkZWFscyBjb3JyZWN0bHkg
d2l0aCBsaW5lYXIgcC50LidzLgpAQCAtMTMzMCwxOCArMTMzNiw5IEBAIHN0YXRpYyBpbnQgcHV0
X3BhZ2VfZnJvbV9sMmUobDJfcGdlbnRyeV90IGwyZSwgdW5zaWduZWQgbG9uZyBwZm4sCiAgICAg
ICAgIHJldHVybiAxOwogCiAgICAgaWYgKCBsMmVfZ2V0X2ZsYWdzKGwyZSkgJiBfUEFHRV9QU0Ug
KQotICAgIHsKLSAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSA9IGwyZV9nZXRfcGFnZShs
MmUpOwotICAgICAgICBib29sIHdyaXRlYWJsZSA9IGwyZV9nZXRfZmxhZ3MobDJlKSAmIF9QQUdF
X1JXOwotICAgICAgICB1bnNpZ25lZCBpbnQgaTsKLQotICAgICAgICBBU1NFUlQoIShtZm5feChw
YWdlX3RvX21mbihwYWdlKSkgJgotICAgICAgICAgICAgICAgICAoKDFVTCA8PCAoTDJfUEFHRVRB
QkxFX1NISUZUIC0gUEFHRV9TSElGVCkpIC0gMSkpKTsKLSAgICAgICAgZm9yICggaSA9IDA7IGkg
PCAoMXUgPDwgUEFHRVRBQkxFX09SREVSKTsgaSsrLCBwYWdlKysgKQotICAgICAgICAgICAgcHV0
X2RhdGFfcGFnZShwYWdlLCB3cml0ZWFibGUpOwotCi0gICAgICAgIHJldHVybiAwOwotICAgIH0K
KyAgICAgICAgcmV0dXJuIHB1dF9kYXRhX3BhZ2VzKGwyZV9nZXRfcGFnZShsMmUpLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbDJlX2dldF9mbGFncyhsMmUpICYgX1BBR0VfUlcsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBMMl9QQUdFVEFCTEVfU0hJRlQpOwogCiAgICAg
cmV0dXJuIHB1dF9wdF9wYWdlKGwyZV9nZXRfcGFnZShsMmUpLCBtZm5fdG9fcGFnZShfbWZuKHBm
bikpLCBmbGFncyk7CiB9CkBAIC0xMzUzLDE4ICsxMzUwLDkgQEAgc3RhdGljIGludCBwdXRfcGFn
ZV9mcm9tX2wzZShsM19wZ2VudHJ5X3QgbDNlLCB1bnNpZ25lZCBsb25nIHBmbiwKICAgICAgICAg
cmV0dXJuIDE7CiAKICAgICBpZiAoIHVubGlrZWx5KGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdF
X1BTRSkgKQotICAgIHsKLSAgICAgICAgdW5zaWduZWQgbG9uZyBtZm4gPSBsM2VfZ2V0X3Bmbihs
M2UpOwotICAgICAgICBib29sIHdyaXRlYWJsZSA9IGwzZV9nZXRfZmxhZ3MobDNlKSAmIF9QQUdF
X1JXOwotCi0gICAgICAgIEFTU0VSVCghKGZsYWdzICYgUFRGX3BhcnRpYWxfc2V0KSk7Ci0gICAg
ICAgIEFTU0VSVCghKG1mbiAmICgoMVVMIDw8IChMM19QQUdFVEFCTEVfU0hJRlQgLSBQQUdFX1NI
SUZUKSkgLSAxKSkpOwotICAgICAgICBkbyB7Ci0gICAgICAgICAgICBwdXRfZGF0YV9wYWdlKG1m
bl90b19wYWdlKF9tZm4obWZuKSksIHdyaXRlYWJsZSk7Ci0gICAgICAgIH0gd2hpbGUgKCArK21m
biAmICgoMVVMIDw8IChMM19QQUdFVEFCTEVfU0hJRlQgLSBQQUdFX1NISUZUKSkgLSAxKSApOwot
Ci0gICAgICAgIHJldHVybiAwOwotICAgIH0KKyAgICAgICAgcmV0dXJuIHB1dF9kYXRhX3BhZ2Vz
KGwzZV9nZXRfcGFnZShsM2UpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbDNlX2dl
dF9mbGFncyhsM2UpICYgX1BBR0VfUlcsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBM
M19QQUdFVEFCTEVfU0hJRlQpOwogCiAgICAgcmV0dXJuIHB1dF9wdF9wYWdlKGwzZV9nZXRfcGFn
ZShsM2UpLCBtZm5fdG9fcGFnZShfbWZuKHBmbikpLCBmbGFncyk7CiB9Ci0tIAoyLjI0LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
