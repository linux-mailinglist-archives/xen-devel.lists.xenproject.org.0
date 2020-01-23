Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C87146AD6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 15:06:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iud4k-0008KC-SB; Thu, 23 Jan 2020 14:03:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iud4j-0008K7-Js
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 14:03:13 +0000
X-Inumbo-ID: 1841bc86-3de9-11ea-be31-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1841bc86-3de9-11ea-be31-12813bfff9fa;
 Thu, 23 Jan 2020 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579788193; x=1611324193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zqKYidNvsK8h/OpacGe4mSxOxGU+MIOju+Nrm+U9kyY=;
 b=W8RaOTeIQoFswRbe0tVnFLS/Rsg1WQnvoHhaa9sf5EoXsEZTKmzW6GAx
 PNdb/1I1Tdp1/RNqrMYTk2Ll6K+stXKTA8lnlFF3OMqKiKklO9Djpv81q
 gp9kA36Ni/Afc1Nl4Xdhn0JhKxsTRSQLZGzVpHOGBwb4eAyIvgsTMyNWV E=;
IronPort-SDR: t8MinLthiwBuDaH19VqSZRmc632w9MZwhSLs7yd8fBuCd2fBng5D0rxyJW3pyDxCDRRquueIz4
 cdXT2vpZvzXw==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="13852627"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-859fe132.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Jan 2020 14:03:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-859fe132.us-west-2.amazon.com (Postfix) with ESMTPS
 id 00427223228; Thu, 23 Jan 2020 14:03:10 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 14:03:10 +0000
Received: from EX13MTAUEB002.ant.amazon.com (10.43.60.12) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 14:03:09 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.60.234) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Thu, 23 Jan 2020 14:03:08 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 23 Jan 2020 14:03:03 +0000
Message-ID: <20200123140305.21050-2-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123140305.21050-1-pdurrant@amazon.com>
References: <20200123140305.21050-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 1/3] x86 / vmx: make apic_access_mfn type-safe
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIG1mbl90IHJhdGhlciB0aGFuIHVuc2lnbmVkIGxvbmcgYW5kIGNoYW5nZSBwcmV2aW91cyB0
ZXN0cyBhZ2FpbnN0IDAgdG8KdGVzdHMgYWdhaW5zdCBJTlZBTElEX01GTiAoYWxzbyBpbnRyb2R1
Y2luZyBpbml0aWFsaXphdGlvbiB0byB0aGF0IHZhbHVlKS4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmlu
LnRpYW5AaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNj
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2VyIFBhdSBNb25uw6kiIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KCnYz
OgogLSBVc2UgX21mbigwKSBpbnN0ZWFkIG9mIElOVkFMSURfTUZOCgp2MjoKIC0gU2V0IGFwaWNf
YWNjZXNzX21mbiB0byBJTlZBTElEX01GTiBpbiB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpIHRv
IG1ha2UKICAgdGhlIGZ1bmN0aW9uIGlkZW1wb3RlbnQKLS0tCiB4ZW4vYXJjaC94ODYvaHZtL210
cnIuYyAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAg
ICAgfCAxNCArKysrKysrLS0tLS0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3Mu
aCB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL210cnIuYyBiL3hlbi9hcmNoL3g4Ni9o
dm0vbXRyci5jCmluZGV4IDVhZDE1ZWFmZTAuLjgzNTZlOGRlM2QgMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vbXRyci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vbXRyci5jCkBAIC04MTgs
NyArODE4LDcgQEAgaW50IGVwdGVfZ2V0X2VudHJ5X2VtdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNp
Z25lZCBsb25nIGdmbiwgbWZuX3QgbWZuLAogCiAgICAgaWYgKCBkaXJlY3RfbW1pbyApCiAgICAg
ewotICAgICAgICBpZiAoIChtZm5feChtZm4pIF4gZC0+YXJjaC5odm0udm14LmFwaWNfYWNjZXNz
X21mbikgPj4gb3JkZXIgKQorICAgICAgICBpZiAoIChtZm5feChtZm4pIF4gbWZuX3goZC0+YXJj
aC5odm0udm14LmFwaWNfYWNjZXNzX21mbikpID4+IG9yZGVyICkKICAgICAgICAgICAgIHJldHVy
biBNVFJSX1RZUEVfVU5DQUNIQUJMRTsKICAgICAgICAgaWYgKCBvcmRlciApCiAgICAgICAgICAg
ICByZXR1cm4gLTE7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyBiL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCmluZGV4IGY4M2YxMDI2MzguLmIyNjJkMzhhN2MgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZteC5jCkBAIC0zMDM0LDcgKzMwMzQsNyBAQCBzdGF0aWMgaW50IHZteF9hbGxvY192
bGFwaWNfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkKQogICAgIG1mbiA9IHBhZ2VfdG9fbWZuKHBn
KTsKICAgICBjbGVhcl9kb21haW5fcGFnZShtZm4pOwogICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhf
Z3Vlc3QocGcsIGQsIFNIQVJFX3J3KTsKLSAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3Nf
bWZuID0gbWZuX3gobWZuKTsKKyAgICBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuID0g
bWZuOwogCiAgICAgcmV0dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBwYWRkcl90b19wZm4oQVBJ
Q19ERUZBVUxUX1BIWVNfQkFTRSksIG1mbiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFBBR0VfT1JERVJfNEssCkBAIC0zMDQzLDI0ICszMDQzLDI0IEBAIHN0YXRpYyBpbnQgdm14X2Fs
bG9jX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQpCiAKIHN0YXRpYyB2b2lkIHZteF9m
cmVlX3ZsYXBpY19tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQpCiB7Ci0gICAgdW5zaWduZWQgbG9u
ZyBtZm4gPSBkLT5hcmNoLmh2bS52bXguYXBpY19hY2Nlc3NfbWZuOworICAgIG1mbl90IG1mbiA9
IGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm47CiAKLSAgICBpZiAoIG1mbiAhPSAwICkK
LSAgICAgICAgZnJlZV9zaGFyZWRfZG9taGVhcF9wYWdlKG1mbl90b19wYWdlKF9tZm4obWZuKSkp
OworICAgIGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4gPSBfbWZuKDApOworICAgIGlm
ICggIW1mbl9lcShtZm4sIF9tZm4oMCkpICkKKyAgICAgICAgZnJlZV9zaGFyZWRfZG9taGVhcF9w
YWdlKG1mbl90b19wYWdlKG1mbikpOwogfQogCiBzdGF0aWMgdm9pZCB2bXhfaW5zdGFsbF92bGFw
aWNfbWFwcGluZyhzdHJ1Y3QgdmNwdSAqdikKIHsKICAgICBwYWRkcl90IHZpcnRfcGFnZV9tYSwg
YXBpY19wYWdlX21hOwogCi0gICAgaWYgKCB2LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2Fj
Y2Vzc19tZm4gPT0gMCApCisgICAgaWYgKCBtZm5fZXEodi0+ZG9tYWluLT5hcmNoLmh2bS52bXgu
YXBpY19hY2Nlc3NfbWZuLCBfbWZuKDApKSApCiAgICAgICAgIHJldHVybjsKIAogICAgIEFTU0VS
VChjcHVfaGFzX3ZteF92aXJ0dWFsaXplX2FwaWNfYWNjZXNzZXMpOwogCiAgICAgdmlydF9wYWdl
X21hID0gcGFnZV90b19tYWRkcih2Y3B1X3ZsYXBpYyh2KS0+cmVnc19wYWdlKTsKLSAgICBhcGlj
X3BhZ2VfbWEgPSB2LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm47Ci0gICAg
YXBpY19wYWdlX21hIDw8PSBQQUdFX1NISUZUOworICAgIGFwaWNfcGFnZV9tYSA9IG1mbl90b19t
YWRkcih2LT5kb21haW4tPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19tZm4pOwogCiAgICAgdm14
X3ZtY3NfZW50ZXIodik7CiAgICAgX192bXdyaXRlKFZJUlRVQUxfQVBJQ19QQUdFX0FERFIsIHZp
cnRfcGFnZV9tYSk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1j
cy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14L3ZtY3MuaAppbmRleCBhNTE0Mjk5MTQ0
Li5iZTQ2NjFhOTI5IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92bXgvdm1j
cy5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92bWNzLmgKQEAgLTU5LDcgKzU5
LDcgQEAgc3RydWN0IGVwdF9kYXRhIHsKICNkZWZpbmUgX1ZNWF9ET01BSU5fUE1MX0VOQUJMRUQg
ICAgMAogI2RlZmluZSBWTVhfRE9NQUlOX1BNTF9FTkFCTEVEICAgICAoMXVsIDw8IF9WTVhfRE9N
QUlOX1BNTF9FTkFCTEVEKQogc3RydWN0IHZteF9kb21haW4gewotICAgIHVuc2lnbmVkIGxvbmcg
YXBpY19hY2Nlc3NfbWZuOworICAgIG1mbl90IGFwaWNfYWNjZXNzX21mbjsKICAgICAvKiBWTVhf
RE9NQUlOXyogKi8KICAgICB1bnNpZ25lZCBpbnQgc3RhdHVzOwogCi0tIAoyLjIwLjEKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
