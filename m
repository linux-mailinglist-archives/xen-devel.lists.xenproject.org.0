Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF67A952
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:20:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRyy-0001g9-JA; Tue, 30 Jul 2019 13:16:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wvG0=V3=amazon.de=prvs=10786bff1=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hsRyx-0001fy-5T
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:15:59 +0000
X-Inumbo-ID: 29f095a4-b2cc-11e9-9257-67f4f74de37c
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29f095a4-b2cc-11e9-9257-67f4f74de37c;
 Tue, 30 Jul 2019 13:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1564492556; x=1596028556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=yxZuxym18sXpcj2SP7bh1BFXoFjWkH/yVOuGe+/4WfE=;
 b=jsL8msajgpKdaUTmXLNDKZP1qeTH3Ao96ikM1lgjR8sdEZir7ddrW7Kt
 ialtbdT6IkItidEJDU3a29bHxcUriTKDBmKWnpM87Xus8UPolFDypSzk7
 r3SmOWdTiILwGYTiPycbYktD1j4vkcnMz9cW56J/Bk9p4d7XQdMiInLTh c=;
X-IronPort-AV: E=Sophos;i="5.64,326,1559520000"; d="scan'208";a="814923745"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Jul 2019 13:15:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 8BABF221CA2; Tue, 30 Jul 2019 13:15:54 +0000 (UTC)
Received: from EX13D08UEE001.ant.amazon.com (10.43.62.126) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 13:15:54 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D08UEE001.ant.amazon.com (10.43.62.126) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 13:15:53 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.109.93.13) by
 mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Tue, 30 Jul 2019 13:15:49 +0000
From: Norbert Manthey <nmanthey@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 15:15:02 +0200
Message-ID: <1564492503-22716-2-git-send-email-nmanthey@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564492503-22716-1-git-send-email-nmanthey@amazon.de>
References: <1564492503-22716-1-git-send-email-nmanthey@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH L1TF MDS GT v4 1/2] common/grant_table: harden
 bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Jan Beulich <jbeulich@suse.com>, Martin Mazein <amazein@amazon.de>,
 Bjoern Doebel <doebel@amazon.de>, Norbert Manthey <nmanthey@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R3Vlc3RzIGNhbiBpc3N1ZSBncmFudCB0YWJsZSBvcGVyYXRpb25zIGFuZCBwcm92aWRlIGd1ZXN0
IGNvbnRyb2xsZWQKZGF0YSB0byB0aGVtLiBUaGlzIGRhdGEgaXMgdXNlZCBhcyBpbmRleCBmb3Ig
bWVtb3J5IGxvYWRzIGFmdGVyIGJvdW5kCmNoZWNrcyBoYXZlIGJlZW4gZG9uZS4gVG8gYXZvaWQg
c3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLCB3ZQp1c2UgdGhlIGFycmF5X2luZGV4
X25vc3BlYyBtYWNybyB3aGVyZSBhcHBsaWNhYmxlLCBvciB0aGUgbWFjcm8KYmxvY2tfc3BlY3Vs
YXRpb24uIE5vdGUsIHRoZSBibG9ja19zcGVjdWxhdGlvbiBtYWNybyBpcyB1c2VkIG9uIGFsbApw
YXRoIGluIHNoYXJlZF9lbnRyeV9oZWFkZXIgYW5kIG5yX2dyYW50X2VudHJpZXMuIFRoaXMgd2F5
LCBhZnRlciBhCmNhbGwgdG8gc3VjaCBhIGZ1bmN0aW9uLCBhbGwgYm91bmQgY2hlY2tzIHRoYXQg
aGFwcGVuZWQgYmVmb3JlIGJlY29tZQphcmNoaXRlY3R1cmFsIHZpc2libGUsIHNvIHRoYXQgbm8g
YWRkaXRpb25hbCBwcm90ZWN0aW9uIGlzIHJlcXVpcmVkCmZvciBjb3JyZXNwb25kaW5nIGFycmF5
IGFjY2Vzc2VzLiBBcyB0aGUgd2F5IHdlIGludHJvZHVjZSBhbiBsZmVuY2UKaW5zdHJ1Y3Rpb24g
bWlnaHQgYWxsb3cgdGhlIGNvbXBpbGVyIHRvIHJlbG9hZCBjZXJ0YWluIHZhbHVlcyBmcm9tCm1l
bW9yeSBtdWx0aXBsZSB0aW1lcywgd2UgdHJ5IHRvIGF2b2lkIHNwZWN1bGF0aXZlbHkgY29udGlu
dWluZwpleGVjdXRpb24gd2l0aCBzdGFsZSByZWdpc3RlciBkYXRhIGJ5IG1vdmluZyByZWxldmFu
dCBkYXRhIGludG8KZnVuY3Rpb24gbG9jYWwgdmFyaWFibGVzLgoKU3BlY3VsYXRpdmUgZXhlY3V0
aW9uIGlzIG5vdCBibG9ja2VkIGluIGNhc2Ugb25lIG9mIHRoZSBmb2xsb3dpbmcKcHJvcGVydGll
cyBpcyB0cnVlOgogLSBwYXRoIGNhbm5vdCBiZSB0cmlnZ2VyZWQgYnkgdGhlIGd1ZXN0CiAtIHBh
dGggZG9lcyBub3QgcmV0dXJuIHRvIHRoZSBndWVzdAogLSBwYXRoIGRvZXMgbm90IHJlc3VsdCBp
biBhbiBvdXQtb2YtYm91bmQgYWNjZXNzCgpPbmx5IHRoZSBjb21iaW5hdGlvbiBvZiB0aGUgYWJv
dmUgcHJvcGVydGllcyBhbGxvd3MgdG8gYWN0dWFsbHkgbGVhawpjb250aW51b3VzIGNodW5rcyBv
ZiBtZW1vcnkuIFRoZXJlZm9yZSwgd2Ugb25seSBhZGQgdGhlIHBlbmFsdHkgb2YKcHJvdGVjdGl2
ZSBtZWNoYW5pc21zIGluIGNhc2UgYSBwb3RlbnRpYWwgc3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5k
CmFjY2VzcyBtYXRjaGVzIGFsbCB0aGUgYWJvdmUgcHJvcGVydGllcy4KClRoaXMgY29tbWl0IGFk
ZHJlc3NlcyBvbmx5IG91dC1vZi1ib3VuZCBhY2Nlc3NlcyB3aG9zZSBpbmRleCBpcwpkaXJlY3Rs
eSBjb250cm9sbGVkIGJ5IHRoZSBndWVzdCwgYW5kIHRoZSBpbmRleCBpcyBjaGVja2VkIGJlZm9y
ZS4KUG90ZW50aWFsIG91dC1vZi1ib3VuZCBhY2Nlc3NlcyB0aGF0IGFyZSBjYXVzZWQgYnkgc3Bl
Y3VsYXRpdmVseQpldmFsdWF0aW5nIHRoZSB2ZXJzaW9uIG9mIHRoZSBjdXJyZW50IHRhYmxlIGFy
ZSBub3QgYWRkcmVzc2VkIGluIHRoaXMKY29tbWl0LiBIZW5jZSwgc3BlY3VsYXRpdmUgb3V0LW9m
LWJvdW5kIGFjY2Vzc2VzIG1pZ2h0IHN0aWxsIGJlCnBvc3NpYmxlLCBmb3IgZXhhbXBsZSBpbiBn
bnR0YWJfZ2V0X3N0YXR1c19mcmFtZV9tZm4sIHdoZW4gY2FsbGluZwpnbnR0YWJfZ3Jvd190YWJs
ZSwgdGhlIGFzc2VydGlvbiB0aGF0IHRoZSBncmFudCB0YWJsZSB2ZXJzaW9uIGVxdWFscwp0d28g
bWlnaHQgbm90IGhvbGQgdW5kZXIgc3BlY3VsYXRpb24uCgpUaGlzIGlzIHBhcnQgb2YgdGhlIHNw
ZWN1bGF0aXZlIGhhcmRlbmluZyBlZmZvcnQuCgpTaWduZWQtb2ZmLWJ5OiBOb3JiZXJ0IE1hbnRo
ZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KLS0tCgpOb3RlczoKICB2MzogIERyb3AgY29uZGl0aW9uIHRvIG5vdCBmaXgg
ZGVmZWN0cyBpbiBjb21taXQgbWVzc2FnZS4KICAgICAgIENvcHkgaW4gcmV2aWV3ZWQtYnkuCgog
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIHwgNzIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwg
MjEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCi0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwor
KysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMKQEAgLTkxMSw2ICs5MTEsNyBAQCBtYXBfZ3Jh
bnRfcmVmKAogewogICAgIHN0cnVjdCBkb21haW4gKmxkLCAqcmQsICpvd25lciA9IE5VTEw7CiAg
ICAgc3RydWN0IGdyYW50X3RhYmxlICpsZ3QsICpyZ3Q7CisgICAgZ3JhbnRfcmVmX3QgcmVmOwog
ICAgIHN0cnVjdCB2Y3B1ICAgKmxlZDsKICAgICBncmFudF9oYW5kbGVfdCBoYW5kbGU7CiAgICAg
bWZuX3QgbWZuOwpAQCAtOTc0LDEzICs5NzUsMTUgQEAgbWFwX2dyYW50X3JlZigKICAgICBncmFu
dF9yZWFkX2xvY2socmd0KTsKIAogICAgIC8qIEJvdW5kcyBjaGVjayBvbiB0aGUgZ3JhbnQgcmVm
ICovCi0gICAgaWYgKCB1bmxpa2VseShvcC0+cmVmID49IG5yX2dyYW50X2VudHJpZXMocmd0KSkp
CisgICAgcmVmID0gb3AtPnJlZjsKKyAgICBpZiAoIHVubGlrZWx5KHJlZiA+PSBucl9ncmFudF9l
bnRyaWVzKHJndCkpKQogICAgICAgICBQSU5fRkFJTCh1bmxvY2tfb3V0LCBHTlRTVF9iYWRfZ250
cmVmLCAiQmFkIHJlZiAlI3ggZm9yIGQlZFxuIiwKLSAgICAgICAgICAgICAgICAgb3AtPnJlZiwg
cmd0LT5kb21haW4tPmRvbWFpbl9pZCk7CisgICAgICAgICAgICAgICAgIHJlZiwgcmd0LT5kb21h
aW4tPmRvbWFpbl9pZCk7CiAKLSAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9w
LT5yZWYpOwotICAgIHNoYWggPSBzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwgb3AtPnJlZik7Ci0g
ICAgc3RhdHVzID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+ZmxhZ3MgOiAmc3RhdHVz
X2VudHJ5KHJndCwgb3AtPnJlZik7CisgICAgLyogVGhpcyBjYWxsIGFsc28gZW5zdXJlcyB0aGUg
YWJvdmUgY2hlY2sgY2Fubm90IGJlIHBhc3NlZCBzcGVjdWxhdGl2ZWx5ICovCisgICAgc2hhaCA9
IHNoYXJlZF9lbnRyeV9oZWFkZXIocmd0LCByZWYpOworICAgIHN0YXR1cyA9IHJndC0+Z3RfdmVy
c2lvbiA9PSAxID8gJnNoYWgtPmZsYWdzIDogJnN0YXR1c19lbnRyeShyZ3QsIHJlZik7CisgICAg
YWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCByZWYpOwogCiAgICAgLyogSWYgYWxyZWFk
eSBwaW5uZWQsIGNoZWNrIHRoZSBhY3RpdmUgZG9taWQgYW5kIGF2b2lkIHJlZmNudCBvdmVyZmxv
dy4gKi8KICAgICBpZiAoIGFjdC0+cGluICYmCkBAIC0xMDAzLDggKzEwMDYsOCBAQCBtYXBfZ3Jh
bnRfcmVmKAogICAgICAgICBpZiAoICFhY3QtPnBpbiApCiAgICAgICAgIHsKICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgZ2ZuID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPwotICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzaGFyZWRfZW50cnlfdjEocmd0LCBvcC0+cmVmKS5mcmFtZSA6
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNoYXJlZF9lbnRyeV92MihyZ3QsIG9w
LT5yZWYpLmZ1bGxfcGFnZS5mcmFtZTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2hhcmVkX2VudHJ5X3YxKHJndCwgcmVmKS5mcmFtZSA6CisgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHNoYXJlZF9lbnRyeV92MihyZ3QsIHJlZikuZnVsbF9wYWdlLmZyYW1lOwogCiAg
ICAgICAgICAgICByYyA9IGdldF9wYWdlZF9mcmFtZShnZm4sICZtZm4sICZwZywKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIG9wLT5mbGFncyAmIEdOVE1BUF9yZWFkb25seSwgcmQp
OwpAQCAtMTAxNyw3ICsxMDIwLDcgQEAgbWFwX2dyYW50X3JlZigKICAgICAgICAgICAgIGFjdC0+
bGVuZ3RoID0gUEFHRV9TSVpFOwogICAgICAgICAgICAgYWN0LT5pc19zdWJfcGFnZSA9IGZhbHNl
OwogICAgICAgICAgICAgYWN0LT50cmFuc19kb21haW4gPSByZDsKLSAgICAgICAgICAgIGFjdC0+
dHJhbnNfZ3JlZiA9IG9wLT5yZWY7CisgICAgICAgICAgICBhY3QtPnRyYW5zX2dyZWYgPSByZWY7
CiAgICAgICAgIH0KICAgICB9CiAKQEAgLTEyNjgsNiArMTI3MSw3IEBAIHVubWFwX2NvbW1vbigK
ICAgICBkb21pZF90ICAgICAgICAgIGRvbTsKICAgICBzdHJ1Y3QgZG9tYWluICAgKmxkLCAqcmQ7
CiAgICAgc3RydWN0IGdyYW50X3RhYmxlICpsZ3QsICpyZ3Q7CisgICAgZ3JhbnRfcmVmX3QgcmVm
OwogICAgIHN0cnVjdCBhY3RpdmVfZ3JhbnRfZW50cnkgKmFjdDsKICAgICBzMTYgICAgICAgICAg
ICAgIHJjID0gMDsKICAgICBzdHJ1Y3QgZ3JhbnRfbWFwcGluZyAqbWFwOwpAQCAtMTMyMSw2ICsx
MzI1LDcgQEAgdW5tYXBfY29tbW9uKAogCiAgICAgb3AtPnJkID0gcmQ7CiAgICAgb3AtPnJlZiA9
IG1hcC0+cmVmOworICAgIHJlZiA9IG1hcC0+cmVmOwogCiAgICAgLyoKICAgICAgKiBXZSBjYW4n
dCBhc3N1bWUgdGhlcmUgd2FzIG5vIHJhY2luZyB1bm1hcCBmb3IgdGhpcyBtYXB0cmFjayBlbnRy
eSwKQEAgLTEzMzAsNyArMTMzNSw3IEBAIHVubWFwX2NvbW1vbigKICAgICAgKiBpbnZhbGlkIGxv
Y2suCiAgICAgICovCiAgICAgc21wX3JtYigpOwotICAgIGlmICggdW5saWtlbHkob3AtPnJlZiA+
PSBucl9ncmFudF9lbnRyaWVzKHJndCkpICkKKyAgICBpZiAoIHVubGlrZWx5KHJlZiA+PSBucl9n
cmFudF9lbnRyaWVzKHJndCkpICkKICAgICB7CiAgICAgICAgIGdkcHJpbnRrKFhFTkxPR19XQVJO
SU5HLCAiVW5zdGFibGUgZCVkIGhhbmRsZSAlI3hcbiIsCiAgICAgICAgICAgICAgICAgIHJndC0+
ZG9tYWluLT5kb21haW5faWQsIG9wLT5oYW5kbGUpOwpAQCAtMTMzOSw3ICsxMzQ0LDEwIEBAIHVu
bWFwX2NvbW1vbigKICAgICAgICAgZ290byB1bmxvY2tfb3V0OwogICAgIH0KIAotICAgIGFjdCA9
IGFjdGl2ZV9lbnRyeV9hY3F1aXJlKHJndCwgb3AtPnJlZik7CisgICAgLyogTWFrZSBzdXJlIHRo
ZSBhYm92ZSBib3VuZCBjaGVjayBjYW5ub3QgYmUgYnlwYXNzZWQgc3BlY3VsYXRpdmVseSAqLwor
ICAgIGJsb2NrX3NwZWN1bGF0aW9uKCk7CisKKyAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWly
ZShyZ3QsIHJlZik7CiAKICAgICAvKgogICAgICAqIE5vdGUgdGhhdCB3ZSAoYWIpdXNlIHRoZSBh
Y3RpdmUgZW50cnkgbG9jayBoZXJlIHRvIHByb3RlY3QgYWdhaW5zdApAQCAtMTM1Miw3ICsxMzYw
LDcgQEAgdW5tYXBfY29tbW9uKAogICAgIGZsYWdzID0gcmVhZF9hdG9taWMoJm1hcC0+ZmxhZ3Mp
OwogICAgIHNtcF9ybWIoKTsKICAgICBpZiAoIHVubGlrZWx5KCFmbGFncykgfHwgdW5saWtlbHko
bWFwLT5kb21pZCAhPSBkb20pIHx8Ci0gICAgICAgICB1bmxpa2VseShtYXAtPnJlZiAhPSBvcC0+
cmVmKSApCisgICAgICAgICB1bmxpa2VseShtYXAtPnJlZiAhPSByZWYpICkKICAgICB7CiAgICAg
ICAgIGdkcHJpbnRrKFhFTkxPR19XQVJOSU5HLCAiVW5zdGFibGUgaGFuZGxlICUjeFxuIiwgb3At
PmhhbmRsZSk7CiAgICAgICAgIHJjID0gR05UU1RfYmFkX2hhbmRsZTsKQEAgLTE0MzcsNyArMTQ0
NSw3IEBAIHVubWFwX2NvbW1vbl9jb21wbGV0ZShzdHJ1Y3QgZ250dGFiX3VubWFwX2NvbW1vbiAq
b3ApCiAgICAgdWludDE2X3QgKnN0YXR1czsKICAgICB1bnNpZ25lZCBpbnQgY2xlYXJfZmxhZ3Mg
PSAwOwogCi0gICAgaWYgKCAhb3AtPmRvbmUgKQorICAgIGlmICggZXZhbHVhdGVfbm9zcGVjKCFv
cC0+ZG9uZSkgKQogICAgIHsKICAgICAgICAgLyogdW5tYXBfY29tbW9uKCkgZGlkbid0IGRvIGFu
eXRoaW5nIC0gbm90aGluZyB0byBjb21wbGV0ZS4gKi8KICAgICAgICAgcmV0dXJuOwpAQCAtMjA0
Nyw2ICsyMDU1LDcgQEAgZ250dGFiX3ByZXBhcmVfZm9yX3RyYW5zZmVyKAogICAgICAgICBnb3Rv
IGZhaWw7CiAgICAgfQogCisgICAgLyogVGhpcyBjYWxsIGFsc28gZW5zdXJlcyB0aGUgYWJvdmUg
Y2hlY2sgY2Fubm90IGJlIHBhc3NlZCBzcGVjdWxhdGl2ZWx5ICovCiAgICAgcmF3X3NoYWggPSAo
dWludDMyX3QgKilzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwgcmVmKTsKICAgICBzY29tYm8ucmF3
ID0gQUNDRVNTX09OQ0UoKnJhd19zaGFoKTsKIApAQCAtMjI0Myw3ICsyMjUyLDEyIEBAIGdudHRh
Yl90cmFuc2ZlcigKICAgICAgICAgc3Bpbl91bmxvY2soJmUtPnBhZ2VfYWxsb2NfbG9jayk7CiAg
ICAgICAgIG9rYXkgPSBnbnR0YWJfcHJlcGFyZV9mb3JfdHJhbnNmZXIoZSwgZCwgZ29wLnJlZik7
CiAKLSAgICAgICAgaWYgKCB1bmxpa2VseSghb2theSB8fCBhc3NpZ25fcGFnZXMoZSwgcGFnZSwg
MCwgTUVNRl9ub19yZWZjb3VudCkpICkKKyAgICAgICAgLyoKKyAgICAgICAgICogTWFrZSBzdXJl
IHRoZSByZWZlcmVuY2UgYm91bmQgY2hlY2sgaW4gZ250dGFiX3ByZXBhcmVfZm9yX3RyYW5zZmVy
CisgICAgICAgICAqIGlzIHJlc3BlY3RlZCBhbmQgc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGlzIGJs
b2NrZWQgYWNjb3JkaW5nbHkKKyAgICAgICAgICovCisgICAgICAgIGlmICggdW5saWtlbHkoIWV2
YWx1YXRlX25vc3BlYyhva2F5KSkgfHwKKyAgICAgICAgICAgIHVubGlrZWx5KGFzc2lnbl9wYWdl
cyhlLCBwYWdlLCAwLCBNRU1GX25vX3JlZmNvdW50KSkgKQogICAgICAgICB7CiAgICAgICAgICAg
ICBib29sIGRyb3BfZG9tX3JlZjsKIApAQCAtMjQ0MSw4ICsyNDU1LDEwIEBAIGFjcXVpcmVfZ3Jh
bnRfZm9yX2NvcHkoCiAgICAgICAgIFBJTl9GQUlMKGd0X3VubG9ja19vdXQsIEdOVFNUX2JhZF9n
bnRyZWYsCiAgICAgICAgICAgICAgICAgICJCYWQgZ3JhbnQgcmVmZXJlbmNlICUjeFxuIiwgZ3Jl
Zik7CiAKLSAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIGdyZWYpOworICAgIC8q
IFRoaXMgY2FsbCBhbHNvIGVuc3VyZXMgdGhlIGFib3ZlIGNoZWNrIGNhbm5vdCBiZSBwYXNzZWQg
c3BlY3VsYXRpdmVseSAqLwogICAgIHNoYWggPSBzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwgZ3Jl
Zik7CisgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCBncmVmKTsKKwogICAgIGlm
ICggcmd0LT5ndF92ZXJzaW9uID09IDEgKQogICAgIHsKICAgICAgICAgc2hhMiA9IE5VTEw7CkBA
IC0yODYxLDYgKzI4NzcsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9jb3B5X2J1Zihjb25zdCBzdHJ1
Y3QgZ250dGFiX2NvcHkgKm9wLAogICAgICAgICAgICAgICAgICBvcC0+ZGVzdC5vZmZzZXQsIGRl
c3QtPnB0ci5vZmZzZXQsCiAgICAgICAgICAgICAgICAgIG9wLT5sZW4sIGRlc3QtPmxlbik7CiAK
KyAgICAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIGNoZWNrcyBhcmUgbm90IGJ5cGFzc2VkIHNwZWN1
bGF0aXZlbHkgKi8KKyAgICBibG9ja19zcGVjdWxhdGlvbigpOworCiAgICAgbWVtY3B5KGRlc3Qt
PnZpcnQgKyBvcC0+ZGVzdC5vZmZzZXQsIHNyYy0+dmlydCArIG9wLT5zb3VyY2Uub2Zmc2V0LAog
ICAgICAgICAgICBvcC0+bGVuKTsKICAgICBnbnR0YWJfbWFya19kaXJ0eShkZXN0LT5kb21haW4s
IGRlc3QtPm1mbik7CkBAIC0yOTgwLDcgKzI5OTksNyBAQCBnbnR0YWJfc2V0X3ZlcnNpb24oWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTShnbnR0YWJfc2V0X3ZlcnNpb25fdCkgdW9wKQogICAgIHN0cnVj
dCBncmFudF90YWJsZSAqZ3QgPSBjdXJyZC0+Z3JhbnRfdGFibGU7CiAgICAgZ3JhbnRfZW50cnlf
djFfdCByZXNlcnZlZF9lbnRyaWVzW0dOVFRBQl9OUl9SRVNFUlZFRF9FTlRSSUVTXTsKICAgICBp
bnQgcmVzOwotICAgIHVuc2lnbmVkIGludCBpOworICAgIHVuc2lnbmVkIGludCBpLCBucl9lbnRz
OwogCiAgICAgaWYgKCBjb3B5X2Zyb21fZ3Vlc3QoJm9wLCB1b3AsIDEpICkKICAgICAgICAgcmV0
dXJuIC1FRkFVTFQ7CkBAIC0zMDA0LDcgKzMwMjMsOCBAQCBnbnR0YWJfc2V0X3ZlcnNpb24oWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTShnbnR0YWJfc2V0X3ZlcnNpb25fdCkgdW9wKQogICAgICAqIGFy
ZSBhbGxvd2VkIHRvIGJlIGluIHVzZSAoeGVuc3RvcmUveGVuY29uc29sZSBrZWVwcyB0aGVtIG1h
cHBlZCkuCiAgICAgICogKFlvdSBuZWVkIHRvIGNoYW5nZSB0aGUgdmVyc2lvbiBudW1iZXIgZm9y
IGUuZy4ga2V4ZWMuKQogICAgICAqLwotICAgIGZvciAoIGkgPSBHTlRUQUJfTlJfUkVTRVJWRURf
RU5UUklFUzsgaSA8IG5yX2dyYW50X2VudHJpZXMoZ3QpOyBpKysgKQorICAgIG5yX2VudHMgPSBu
cl9ncmFudF9lbnRyaWVzKGd0KTsKKyAgICBmb3IgKCBpID0gR05UVEFCX05SX1JFU0VSVkVEX0VO
VFJJRVM7IGkgPCBucl9lbnRzOyBpKysgKQogICAgIHsKICAgICAgICAgaWYgKCByZWFkX2F0b21p
YygmX2FjdGl2ZV9lbnRyeShndCwgaSkucGluKSAhPSAwICkKICAgICAgICAgewpAQCAtMzI0Niw2
ICszMjY2LDkgQEAgc3dhcF9ncmFudF9yZWYoZ3JhbnRfcmVmX3QgcmVmX2EsIGdyYW50X3JlZl90
IHJlZl9iKQogICAgIGlmICggdW5saWtlbHkocmVmX2IgPj0gbnJfZ3JhbnRfZW50cmllcyhkLT5n
cmFudF90YWJsZSkpKQogICAgICAgICBQSU5fRkFJTChvdXQsIEdOVFNUX2JhZF9nbnRyZWYsICJC
YWQgcmVmLWIgJSN4XG4iLCByZWZfYik7CiAKKyAgICAvKiBNYWtlIHN1cmUgdGhlIGFib3ZlIGNo
ZWNrcyBhcmUgbm90IGJ5cGFzc2VkIHNwZWN1bGF0aXZlbHkgKi8KKyAgICBibG9ja19zcGVjdWxh
dGlvbigpOworCiAgICAgLyogU3dhcHBpbmcgdGhlIHNhbWUgcmVmIGlzIGEgbm8tb3AuICovCiAg
ICAgaWYgKCByZWZfYSA9PSByZWZfYiApCiAgICAgICAgIGdvdG8gb3V0OwpAQCAtMzcyMCwxMyAr
Mzc0MywxNCBAQCB2b2lkIGdyYW50X3RhYmxlX3dhcm5fYWN0aXZlX2dyYW50cyhzdHJ1Y3QgZG9t
YWluICpkKQogICAgIHN0cnVjdCBncmFudF90YWJsZSAqZ3QgPSBkLT5ncmFudF90YWJsZTsKICAg
ICBzdHJ1Y3QgYWN0aXZlX2dyYW50X2VudHJ5ICphY3Q7CiAgICAgZ3JhbnRfcmVmX3QgcmVmOwot
ICAgIHVuc2lnbmVkIGludCBucl9hY3RpdmUgPSAwOworICAgIHVuc2lnbmVkIGludCBucl9hY3Rp
dmUgPSAwLCBucl9lbnRzOwogCiAjZGVmaW5lIFdBUk5fR1JBTlRfTUFYIDEwCiAKICAgICBncmFu
dF9yZWFkX2xvY2soZ3QpOwogCi0gICAgZm9yICggcmVmID0gMDsgcmVmICE9IG5yX2dyYW50X2Vu
dHJpZXMoZ3QpOyByZWYrKyApCisgICAgbnJfZW50cyA9IG5yX2dyYW50X2VudHJpZXMoZ3QpOwor
ICAgIGZvciAoIHJlZiA9IDA7IHJlZiAhPSBucl9lbnRzOyByZWYrKyApCiAgICAgewogICAgICAg
ICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShndCwgcmVmKTsKICAgICAgICAgaWYgKCAhYWN0
LT5waW4gKQpAQCAtMzg3Niw3ICszOTAwLDkgQEAgc3RhdGljIGludCBnbnR0YWJfZ2V0X3N0YXR1
c19mcmFtZV9tZm4oc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
OwogICAgIH0KIAotICAgICptZm4gPSBfbWZuKHZpcnRfdG9fbWZuKGd0LT5zdGF0dXNbaWR4XSkp
OworICAgIC8qIE1ha2Ugc3VyZSBpZHggaXMgYm91bmRlZCB3cnQgbnJfc3RhdHVzX2ZyYW1lcyAq
LworICAgICptZm4gPSBfbWZuKHZpcnRfdG9fbWZuKAorICAgICAgICAgICAgICAgIGd0LT5zdGF0
dXNbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgbnJfc3RhdHVzX2ZyYW1lcyhndCkpXSkpOwogICAg
IHJldHVybiAwOwogfQogCkBAIC0zOTA1LDcgKzM5MzEsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9n
ZXRfc2hhcmVkX2ZyYW1lX21mbihzdHJ1Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7CiAgICAgfQogCi0gICAgKm1mbiA9IF9tZm4odmlydF90b19tZm4oZ3QtPnNoYXJl
ZF9yYXdbaWR4XSkpOworICAgIC8qIE1ha2Ugc3VyZSBpZHggaXMgYm91bmRlZCB3cnQgbnJfc3Rh
dHVzX2ZyYW1lcyAqLworICAgICptZm4gPSBfbWZuKHZpcnRfdG9fbWZuKAorICAgICAgICAgICAg
ICAgIGd0LT5zaGFyZWRfcmF3W2FycmF5X2luZGV4X25vc3BlYyhpZHgsIG5yX2dyYW50X2ZyYW1l
cyhndCkpXSkpOwogICAgIHJldHVybiAwOwogfQogCkBAIC0zOTc1LDYgKzQwMDMsNyBAQCBzdGF0
aWMgdm9pZCBnbnR0YWJfdXNhZ2VfcHJpbnQoc3RydWN0IGRvbWFpbiAqcmQpCiAgICAgaW50IGZp
cnN0ID0gMTsKICAgICBncmFudF9yZWZfdCByZWY7CiAgICAgc3RydWN0IGdyYW50X3RhYmxlICpn
dCA9IHJkLT5ncmFudF90YWJsZTsKKyAgICB1bnNpZ25lZCBpbnQgbnJfZW50czsKIAogICAgIHBy
aW50aygiICAgICAgLS0tLS0tLS0gYWN0aXZlIC0tLS0tLS0tICAgICAgIC0tLS0tLS0tIHNoYXJl
ZCAtLS0tLS0tLVxuIik7CiAgICAgcHJpbnRrKCJbcmVmXSBsb2NhbGRvbSBtZm4gICAgICBwaW4g
ICAgICAgICAgbG9jYWxkb20gZ21mbiAgICAgZmxhZ3NcbiIpOwpAQCAtMzk4Nyw3ICs0MDE2LDgg
QEAgc3RhdGljIHZvaWQgZ250dGFiX3VzYWdlX3ByaW50KHN0cnVjdCBkb21haW4gKnJkKQogICAg
ICAgICAgICBucl9ncmFudF9mcmFtZXMoZ3QpLCBndC0+bWF4X2dyYW50X2ZyYW1lcywKICAgICAg
ICAgICAgbnJfbWFwdHJhY2tfZnJhbWVzKGd0KSwgZ3QtPm1heF9tYXB0cmFja19mcmFtZXMpOwog
Ci0gICAgZm9yICggcmVmID0gMDsgcmVmICE9IG5yX2dyYW50X2VudHJpZXMoZ3QpOyByZWYrKyAp
CisgICAgbnJfZW50cyA9IG5yX2dyYW50X2VudHJpZXMoZ3QpOworICAgIGZvciAoIHJlZiA9IDA7
IHJlZiAhPSBucl9lbnRzOyByZWYrKyApCiAgICAgewogICAgICAgICBzdHJ1Y3QgYWN0aXZlX2dy
YW50X2VudHJ5ICphY3Q7CiAgICAgICAgIHN0cnVjdCBncmFudF9lbnRyeV9oZWFkZXIgKnNoYTsK
LS0gCjIuNy40CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1
c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2No
bGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0
ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3
IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
