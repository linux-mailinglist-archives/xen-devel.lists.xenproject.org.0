Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3092232FAA
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:31:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXm41-0002o3-4O; Mon, 03 Jun 2019 12:27:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXm3z-0002nC-Gj
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:27:43 +0000
X-Inumbo-ID: f9b906e4-85fa-11e9-9fcf-336492711862
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9b906e4-85fa-11e9-9fcf-336492711862;
 Mon, 03 Jun 2019 12:27:39 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL02.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL02.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL02.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: tfCXhO82ivCs1L11dQ7dQYzVyNJaZ7CUr48tS1CwPAPmtLWg7mO3Iaoqg1i+k/HZZG10+4/ePt
 A2HX7vNSyTi1nfN/kX+Q0YOmqIW9Dh3BUl1tlCS2axIMBB2YXeslucAztJXQpbaiAqAWXA/g5y
 RTn4DOgbc4eG6ccFJMpmzSd3rQRe8bDUKQ7v9zxESNvNVQvl4J8mFoFrwsmNLppGrKQXb07bhb
 kPPo4NErJG2/NlnluMQvZLbq68NX8RsDuI47jIST9pfJbwEcG44oGAsyFXHqsYQPa/YWInGp+W
 Dgo=
X-SBRS: 2.7
X-MesageID: 1213218
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1213218"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:25:26 +0100
Message-ID: <1559564728-17167-4-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/5] xen/vm-event: Remove unnecessary
 vm_event_domain indirection
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHVzZSBvZiAoKnZlZCktPiBsZWFkcyB0byBwb29yIGNvZGUgZ2VuZXJhdGlvbiwgYXMgdGhl
IGNvbXBpbGVyIGNhbid0CmFzc3VtZSB0aGUgcG9pbnRlciBoYXNuJ3QgY2hhbmdlZCwgYW5kIHJl
c3VsdHMgaW4gaGFyZC10by1mb2xsb3cgY29kZS4KCkZvciBib3RoIHZtX2V2ZW50X3tlbixkaXN9
YWJsZSgpLCByZW5hbWUgdGhlIHZlZCBwYXJhbWV0ZXIgdG8gcF92ZWQsIGFuZAp3b3JrIHByaW1h
cmlseSB3aXRoIGEgbG9jYWwgdmVkIHBvaW50ZXIuCgpUaGlzIGhhcyBhIGtleSBhZHZhbnRhZ2Ug
aW4gdm1fZXZlbnRfZW5hYmxlKCksIGluIHRoYXQgdGhlIHBhcnRpYWxseQpjb25zdHJ1Y3RlZCB2
bV9ldmVudF9kb21haW4gb25seSBiZWNvbWVzIGdsb2JhbGx5IHZpc2libGUgb25jZSBpdCBpcwpm
dWxseSBjb25zdHJ1Y3RlZC4gIEFzIGEgY29uc2VxdWVuY2UsIHRoZSBzcGlubG9jayBkb2Vzbid0
IG5lZWQgaG9sZGluZy4KCkZ1cnRoZXJtb3JlLCByZWFycmFuZ2UgdGhlIG9yZGVyIG9mIG9wZXJh
dGlvbnMgdG8gYmUgbW9yZSBzZW5zaWJsZS4KQ2hlY2sgZm9yIHJlcGVhdGVkIGVuYWJsZXMgYW5k
IGFuIGJhZCBIVk1fUEFSQU0gYmVmb3JlIGFsbG9jYXRpbmcKbWVtb3J5LCBhbmQgZ2F0aGVyIHRo
ZSB0cml2aWFsIHNldHVwIGludG8gb25lIHBsYWNlLCBkcm9wcGluZyB0aGUKcmVkdW5kYW50IHpl
cm9pbmcuCgpObyBwcmFjdGljYWwgY2hhbmdlIHRoYXQgY2FsbGVycyB3aWxsIG5vdGljZS4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0t
LQpDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgpDQzogVGFt
YXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDQzogUGV0cmUgUGlyY2FsYWJ1IDxw
cGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgfCA5
MCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCA1MCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5kZXgg
ZGI5NzVlOS4uZGNiYTk4YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVudC5jCisrKyBi
L3hlbi9jb21tb24vdm1fZXZlbnQuYwpAQCAtMzgsNzQgKzM4LDYzIEBACiBzdGF0aWMgaW50IHZt
X2V2ZW50X2VuYWJsZSgKICAgICBzdHJ1Y3QgZG9tYWluICpkLAogICAgIHN0cnVjdCB4ZW5fZG9t
Y3RsX3ZtX2V2ZW50X29wICp2ZWMsCi0gICAgc3RydWN0IHZtX2V2ZW50X2RvbWFpbiAqKnZlZCwK
KyAgICBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICoqcF92ZWQsCiAgICAgaW50IHBhdXNlX2ZsYWcs
CiAgICAgaW50IHBhcmFtLAogICAgIHhlbl9ldmVudF9jaGFubmVsX25vdGlmaWNhdGlvbl90IG5v
dGlmaWNhdGlvbl9mbikKIHsKICAgICBpbnQgcmM7CiAgICAgdW5zaWduZWQgbG9uZyByaW5nX2dm
biA9IGQtPmFyY2guaHZtLnBhcmFtc1twYXJhbV07CisgICAgc3RydWN0IHZtX2V2ZW50X2RvbWFp
biAqdmVkOwogCi0gICAgaWYgKCAhKnZlZCApCi0gICAgICAgICp2ZWQgPSB4emFsbG9jKHN0cnVj
dCB2bV9ldmVudF9kb21haW4pOwotICAgIGlmICggISp2ZWQgKQotICAgICAgICByZXR1cm4gLUVO
T01FTTsKLQotICAgIC8qIE9ubHkgb25lIGhlbHBlciBhdCBhIHRpbWUuIElmIHRoZSBoZWxwZXIg
Y3Jhc2hlZCwKLSAgICAgKiB0aGUgcmluZyBpcyBpbiBhbiB1bmRlZmluZWQgc3RhdGUgYW5kIHNv
IGlzIHRoZSBndWVzdC4KKyAgICAvKgorICAgICAqIE9ubHkgb25lIGNvbm5lY3RlZCBhZ2VudCBh
dCBhIHRpbWUuICBJZiB0aGUgaGVscGVyIGNyYXNoZWQsIHRoZSByaW5nIGlzCisgICAgICogaW4g
YW4gdW5kZWZpbmVkIHN0YXRlLCBhbmQgdGhlIGd1ZXN0IGlzIG1vc3QgbGlrZWx5IHVucmVjb3Zl
cmFibGUuCiAgICAgICovCi0gICAgaWYgKCAoKnZlZCktPnJpbmdfcGFnZSApCi0gICAgICAgIHJl
dHVybiAtRUJVU1k7OworICAgIGlmICggKnBfdmVkICE9IE5VTEwgKQorICAgICAgICByZXR1cm4g
LUVCVVNZOwogCi0gICAgLyogVGhlIHBhcmFtZXRlciBkZWZhdWx0cyB0byB6ZXJvLCBhbmQgaXQg
c2hvdWxkIGJlCi0gICAgICogc2V0IHRvIHNvbWV0aGluZyAqLworICAgIC8qIE5vIGNob3NlbiBy
aW5nIEdGTj8gIE5vdGhpbmcgd2UgY2FuIGRvLiAqLwogICAgIGlmICggcmluZ19nZm4gPT0gMCAp
CiAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKIAotICAgIHNwaW5fbG9ja19pbml0KCYoKnZl
ZCktPmxvY2spOwotICAgIHNwaW5fbG9jaygmKCp2ZWQpLT5sb2NrKTsKKyAgICB2ZWQgPSB4emFs
bG9jKHN0cnVjdCB2bV9ldmVudF9kb21haW4pOworICAgIGlmICggIXZlZCApCisgICAgICAgIHJl
dHVybiAtRU5PTUVNOwogCi0gICAgcmMgPSB2bV9ldmVudF9pbml0X2RvbWFpbihkKTsKKyAgICAv
KiBUcml2aWFsIHNldHVwLiAqLworICAgIHNwaW5fbG9ja19pbml0KCZ2ZWQtPmxvY2spOworICAg
IGluaXRfd2FpdHF1ZXVlX2hlYWQoJnZlZC0+d3EpOworICAgIHZlZC0+cGF1c2VfZmxhZyA9IHBh
dXNlX2ZsYWc7CiAKKyAgICByYyA9IHZtX2V2ZW50X2luaXRfZG9tYWluKGQpOwogICAgIGlmICgg
cmMgPCAwICkKICAgICAgICAgZ290byBlcnI7CiAKLSAgICByYyA9IHByZXBhcmVfcmluZ19mb3Jf
aGVscGVyKGQsIHJpbmdfZ2ZuLCAmKCp2ZWQpLT5yaW5nX3BnX3N0cnVjdCwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICYoKnZlZCktPnJpbmdfcGFnZSk7CisgICAgcmMgPSBwcmVw
YXJlX3JpbmdfZm9yX2hlbHBlcihkLCByaW5nX2dmbiwgJnZlZC0+cmluZ19wZ19zdHJ1Y3QsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmdmVkLT5yaW5nX3BhZ2UpOwogICAgIGlm
ICggcmMgPCAwICkKICAgICAgICAgZ290byBlcnI7CiAKLSAgICAvKiBTZXQgdGhlIG51bWJlciBv
ZiBjdXJyZW50bHkgYmxvY2tlZCB2Q1BVcyB0byAwLiAqLwotICAgICgqdmVkKS0+YmxvY2tlZCA9
IDA7CisgICAgRlJPTlRfUklOR19JTklUKCZ2ZWQtPmZyb250X3JpbmcsCisgICAgICAgICAgICAg
ICAgICAgICh2bV9ldmVudF9zcmluZ190ICopdmVkLT5yaW5nX3BhZ2UsCisgICAgICAgICAgICAg
ICAgICAgIFBBR0VfU0laRSk7CiAKLSAgICAvKiBBbGxvY2F0ZSBldmVudCBjaGFubmVsICovCiAg
ICAgcmMgPSBhbGxvY191bmJvdW5kX3hlbl9ldmVudF9jaGFubmVsKGQsIDAsIGN1cnJlbnQtPmRv
bWFpbi0+ZG9tYWluX2lkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBub3RpZmljYXRpb25fZm4pOwogICAgIGlmICggcmMgPCAwICkKICAgICAgICAgZ290byBlcnI7
CiAKLSAgICAoKnZlZCktPnhlbl9wb3J0ID0gdmVjLT51LmVuYWJsZS5wb3J0ID0gcmM7CisgICAg
dmVkLT54ZW5fcG9ydCA9IHZlYy0+dS5lbmFibGUucG9ydCA9IHJjOwogCi0gICAgLyogUHJlcGFy
ZSByaW5nIGJ1ZmZlciAqLwotICAgIEZST05UX1JJTkdfSU5JVCgmKCp2ZWQpLT5mcm9udF9yaW5n
LAotICAgICAgICAgICAgICAgICAgICAodm1fZXZlbnRfc3JpbmdfdCAqKSgqdmVkKS0+cmluZ19w
YWdlLAotICAgICAgICAgICAgICAgICAgICBQQUdFX1NJWkUpOwotCi0gICAgLyogU2F2ZSB0aGUg
cGF1c2UgZmxhZyBmb3IgdGhpcyBwYXJ0aWN1bGFyIHJpbmcuICovCi0gICAgKCp2ZWQpLT5wYXVz
ZV9mbGFnID0gcGF1c2VfZmxhZzsKLQotICAgIC8qIEluaXRpYWxpemUgdGhlIGxhc3QtY2hhbmNl
IHdhaXQgcXVldWUuICovCi0gICAgaW5pdF93YWl0cXVldWVfaGVhZCgmKCp2ZWQpLT53cSk7Cisg
ICAgLyogU3VjY2Vzcy4gIEZpbGwgaW4gdGhlIGRvbWFpbidzIGFwcHJvcHJpYXRlIHZlZC4gKi8K
KyAgICAqcF92ZWQgPSB2ZWQ7CiAKLSAgICBzcGluX3VubG9jaygmKCp2ZWQpLT5sb2NrKTsKICAg
ICByZXR1cm4gMDsKIAogIGVycjoKLSAgICBkZXN0cm95X3JpbmdfZm9yX2hlbHBlcigmKCp2ZWQp
LT5yaW5nX3BhZ2UsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgKCp2ZWQpLT5yaW5nX3Bn
X3N0cnVjdCk7Ci0gICAgc3Bpbl91bmxvY2soJigqdmVkKS0+bG9jayk7Ci0gICAgeGZyZWUoKnZl
ZCk7Ci0gICAgKnZlZCA9IE5VTEw7CisgICAgZGVzdHJveV9yaW5nX2Zvcl9oZWxwZXIoJnZlZC0+
cmluZ19wYWdlLCB2ZWQtPnJpbmdfcGdfc3RydWN0KTsKKyAgICB4ZnJlZSh2ZWQpOwogCiAgICAg
cmV0dXJuIHJjOwogfQpAQCAtMTkwLDQzICsxNzksNDQgQEAgdm9pZCB2bV9ldmVudF93YWtlKHN0
cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCkKICAgICAgICAgdm1f
ZXZlbnRfd2FrZV9ibG9ja2VkKGQsIHZlZCk7CiB9CiAKLXN0YXRpYyBpbnQgdm1fZXZlbnRfZGlz
YWJsZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluICoqdmVkKQorc3Rh
dGljIGludCB2bV9ldmVudF9kaXNhYmxlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB2bV9ldmVu
dF9kb21haW4gKipwX3ZlZCkKIHsKLSAgICBpZiAoIHZtX2V2ZW50X2NoZWNrX3JpbmcoKnZlZCkg
KQorICAgIHN0cnVjdCB2bV9ldmVudF9kb21haW4gKnZlZCA9ICpwX3ZlZDsKKworICAgIGlmICgg
dm1fZXZlbnRfY2hlY2tfcmluZyh2ZWQpICkKICAgICB7CiAgICAgICAgIHN0cnVjdCB2Y3B1ICp2
OwogCi0gICAgICAgIHNwaW5fbG9jaygmKCp2ZWQpLT5sb2NrKTsKKyAgICAgICAgc3Bpbl9sb2Nr
KCZ2ZWQtPmxvY2spOwogCi0gICAgICAgIGlmICggIWxpc3RfZW1wdHkoJigqdmVkKS0+d3EubGlz
dCkgKQorICAgICAgICBpZiAoICFsaXN0X2VtcHR5KCZ2ZWQtPndxLmxpc3QpICkKICAgICAgICAg
ewotICAgICAgICAgICAgc3Bpbl91bmxvY2soJigqdmVkKS0+bG9jayk7CisgICAgICAgICAgICBz
cGluX3VubG9jaygmdmVkLT5sb2NrKTsKICAgICAgICAgICAgIHJldHVybiAtRUJVU1k7CiAgICAg
ICAgIH0KIAogICAgICAgICAvKiBGcmVlIGRvbVUncyBldmVudCBjaGFubmVsIGFuZCBsZWF2ZSB0
aGUgb3RoZXIgb25lIHVuYm91bmQgKi8KLSAgICAgICAgZnJlZV94ZW5fZXZlbnRfY2hhbm5lbChk
LCAoKnZlZCktPnhlbl9wb3J0KTsKKyAgICAgICAgZnJlZV94ZW5fZXZlbnRfY2hhbm5lbChkLCB2
ZWQtPnhlbl9wb3J0KTsKIAogICAgICAgICAvKiBVbmJsb2NrIGFsbCB2Q1BVcyAqLwogICAgICAg
ICBmb3JfZWFjaF92Y3B1ICggZCwgdiApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGlmICggdGVz
dF9hbmRfY2xlYXJfYml0KCgqdmVkKS0+cGF1c2VfZmxhZywgJnYtPnBhdXNlX2ZsYWdzKSApCisg
ICAgICAgICAgICBpZiAoIHRlc3RfYW5kX2NsZWFyX2JpdCh2ZWQtPnBhdXNlX2ZsYWcsICZ2LT5w
YXVzZV9mbGFncykgKQogICAgICAgICAgICAgewogICAgICAgICAgICAgICAgIHZjcHVfdW5wYXVz
ZSh2KTsKLSAgICAgICAgICAgICAgICAoKnZlZCktPmJsb2NrZWQtLTsKKyAgICAgICAgICAgICAg
ICB2ZWQtPmJsb2NrZWQtLTsKICAgICAgICAgICAgIH0KICAgICAgICAgfQogCi0gICAgICAgIGRl
c3Ryb3lfcmluZ19mb3JfaGVscGVyKCYoKnZlZCktPnJpbmdfcGFnZSwKLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgKCp2ZWQpLT5yaW5nX3BnX3N0cnVjdCk7CisgICAgICAgIGRlc3Ry
b3lfcmluZ19mb3JfaGVscGVyKCZ2ZWQtPnJpbmdfcGFnZSwgdmVkLT5yaW5nX3BnX3N0cnVjdCk7
CiAKICAgICAgICAgdm1fZXZlbnRfY2xlYW51cF9kb21haW4oZCk7CiAKLSAgICAgICAgc3Bpbl91
bmxvY2soJigqdmVkKS0+bG9jayk7CisgICAgICAgIHNwaW5fdW5sb2NrKCZ2ZWQtPmxvY2spOwog
ICAgIH0KIAotICAgIHhmcmVlKCp2ZWQpOwotICAgICp2ZWQgPSBOVUxMOworICAgIHhmcmVlKHZl
ZCk7CisgICAgKnBfdmVkID0gTlVMTDsKIAogICAgIHJldHVybiAwOwogfQotLSAKMi4xLjQKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
