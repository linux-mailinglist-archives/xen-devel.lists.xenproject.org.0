Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD9914582B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 15:48:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHGV-0000tF-AY; Wed, 22 Jan 2020 14:45:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8xH2=3L=amazon.co.uk=prvs=28361e846=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuHGT-0000sW-Cs
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 14:45:53 +0000
X-Inumbo-ID: e35b106c-3d25-11ea-bc69-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e35b106c-3d25-11ea-bc69-12813bfff9fa;
 Wed, 22 Jan 2020 14:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1579704352; x=1611240352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QvgFKvGyTQaswpocmdKa1EQeslVgQ9v2aSNNOAQ/JZ4=;
 b=RCnsNiaoFdNPTRaHzQEgqmI87IrJBxpHyLmZAgt2bUO8gLJUsCUaGKKL
 xn3qY4fmNYUqcdY3PAb5OKxh6HmTL/H0pr5lX7KIjdE0xg3vsOdtb49iw
 3TimJ6KbimJKqff/o4Dry+ksNs7M61OLTZiZxpFy0iNpcDgANXAHTMzJb E=;
IronPort-SDR: GK4/4D2THS8RdINwrNZH9JWA9qK6zfnY/KoDwq1YSCtrQ3+xHy08pux8PgS4PXddm/e1cmA4dk
 Lq0CzlX8wLiw==
X-IronPort-AV: E=Sophos;i="5.70,350,1574121600"; d="scan'208";a="14221895"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 22 Jan 2020 14:45:52 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id BF8D6A0679; Wed, 22 Jan 2020 14:45:50 +0000 (UTC)
Received: from EX13D32EUB003.ant.amazon.com (10.43.166.165) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Wed, 22 Jan 2020 14:45:03 +0000
Received: from EX13MTAUEE002.ant.amazon.com (10.43.62.24) by
 EX13D32EUB003.ant.amazon.com (10.43.166.165) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 22 Jan 2020 14:45:02 +0000
Received: from u2f063a87eabd5f.cbg10.amazon.com (10.125.106.135) by
 mail-relay.amazon.com (10.43.62.224) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 22 Jan 2020 14:45:00 +0000
From: Paul Durrant <pdurrant@amazon.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 14:44:46 +0000
Message-ID: <20200122144446.919-8-pdurrant@amazon.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122144446.919-1-pdurrant@amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v4 7/7] xl: allow domid to be preserved on
 save/restore or migrate
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBwYXRjaCBhZGRzIGEgJy1EJyBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIHNhdmUgYW5kIG1p
Z3JhdGUgdG8gYWxsb3cKdGhlIGRvbWFpbiBpZCB0byBiZSBpbmNvcnBvcmF0ZWQgaW50byB0aGUg
c2F2ZWQgZG9tYWluIGNvbmZpZ3VyYXRpb24gYW5kCmhlbmNlIGJlIHByZXNlcnZlZC4KClNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KLS0tCkNjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNjOiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4KCnYyOgog
LSBIZWF2aWx5IHJlLXdvcmtlZCBiYXNlZCBvbiBuZXcgbGlieGxfZG9tYWluX2NyZWF0ZV9pbmZv
Ci0tLQogZG9jcy9tYW4veGwuMS5wb2QuaW4gICAgICB8IDE0ICsrKysrKysrKysrKysrCiB0b29s
cy94bC94bC5oICAgICAgICAgICAgIHwgIDEgKwogdG9vbHMveGwveGxfY21kdGFibGUuYyAgICB8
ICA2ICsrKystLQogdG9vbHMveGwveGxfbWlncmF0ZS5jICAgICB8IDE1ICsrKysrKysrKystLS0t
LQogdG9vbHMveGwveGxfc2F2ZXJlc3RvcmUuYyB8IDE5ICsrKysrKysrKysrKysrLS0tLS0KIHRv
b2xzL3hsL3hsX3ZtY29udHJvbC5jICAgfCAgMyArKy0KIDYgZmlsZXMgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZG9jcy9tYW4veGwuMS5w
b2QuaW4gYi9kb2NzL21hbi94bC4xLnBvZC5pbgppbmRleCBkNGI1ZThlMzYyLi45MzdlZGE2OTBm
IDEwMDY0NAotLS0gYS9kb2NzL21hbi94bC4xLnBvZC5pbgorKysgYi9kb2NzL21hbi94bC4xLnBv
ZC5pbgpAQCAtNDkwLDYgKzQ5MCwxMyBAQCBEaXNwbGF5IGh1Z2UgKCEpIGFtb3VudCBvZiBkZWJ1
ZyBpbmZvcm1hdGlvbiBkdXJpbmcgdGhlIG1pZ3JhdGlvbiBwcm9jZXNzLgogCiBMZWF2ZSB0aGUg
ZG9tYWluIG9uIHRoZSByZWNlaXZlIHNpZGUgcGF1c2VkIGFmdGVyIG1pZ3JhdGlvbi4KIAorPWl0
ZW0gQjwtRD4KKworUHJlc2VydmUgdGhlIEI8ZG9tYWluLWlkPiBpbiB0aGUgZG9tYWluIGNvbmln
dXJhdGlvbiB0aGF0IGlzIHRyYW5zZmVycmVkCitzdWNoIHRoYXQgaXQgd2lsbCBiZSBpZGVudGlj
YWwgb24gdGhlIGRlc3RpbmF0aW9uIGhvc3QsIHVubGVzcyB0aGF0Citjb25maWd1cmF0aW9uIGlz
IG92ZXJyaWRkZW4gdXNpbmcgdGhlIEI8LUM+IG9wdGlvbi4gTm90ZSB0aGF0IGl0IGlzIG5vdAor
cG9zc2libGUgdG8gdXNlIHRoaXMgb3B0aW9uIGZvciBhICdsb2NhbGhvc3QnIG1pZ3JhdGlvbi4K
KwogPWJhY2sKIAogPWl0ZW0gQjxyZW11cz4gW0k8T1BUSU9OUz5dIEk8ZG9tYWluLWlkPiBJPGhv
c3Q+CkBAIC02OTIsNiArNjk5LDEzIEBAIExlYXZlIHRoZSBkb21haW4gcnVubmluZyBhZnRlciBj
cmVhdGluZyB0aGUgc25hcHNob3QuCiAKIExlYXZlIHRoZSBkb21haW4gcGF1c2VkIGFmdGVyIGNy
ZWF0aW5nIHRoZSBzbmFwc2hvdC4KIAorPWl0ZW0gQjwtRD4KKworUHJlc2VydmUgdGhlIEI8ZG9t
YWluLWlkPiBpbiB0aGUgZG9tYWluIGNvbmlndXJhdGlvbiB0aGF0IGlzIGVtYmVkZGVkIGluCit0
aGUgc3RhdGUgZmlsZSBzdWNoIHRoYXQgaXQgd2lsbCBiZSBpZGVudGljYWwgd2hlbiB0aGUgZG9t
YWluIGlzIHJlc3RvcmVkLAordW5sZXNzIHRoYXQgY29uZmlndXJhdGlvbiBpcyBvdmVycmlkZGVu
LiAoU2VlIHRoZSBCPHJlc3RvcmU+IG9wZXJhdGlvbgorYWJvdmUpLgorCiA9YmFjawogCiA9aXRl
bSBCPHNoYXJpbmc+IFtJPGRvbWFpbi1pZD5dCmRpZmYgLS1naXQgYS90b29scy94bC94bC5oIGIv
dG9vbHMveGwveGwuaAppbmRleCAyYjQ3MDllZmIyLi4wNjU2OWM2YzRhIDEwMDY0NAotLS0gYS90
b29scy94bC94bC5oCisrKyBiL3Rvb2xzL3hsL3hsLmgKQEAgLTk5LDYgKzk5LDcgQEAgc3RydWN0
IHNhdmVfZmlsZV9oZWFkZXIgewogI2RlZmluZSBTQVZFRklMRV9CWVRFT1JERVJfVkFMVUUgKCh1
aW50MzJfdCkweDAxMDIwMzA0VUwpCiAKIHZvaWQgc2F2ZV9kb21haW5fY29yZV9iZWdpbih1aW50
MzJfdCBkb21pZCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgcHJlc2VydmVfZG9t
aWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3ZlcnJpZGVfY29u
ZmlnX2ZpbGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDhfdCAqKmNvbmZpZ19k
YXRhX3IsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ICpjb25maWdfbGVuX3IpOwpk
aWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfY21kdGFibGUuYyBiL3Rvb2xzL3hsL3hsX2NtZHRhYmxl
LmMKaW5kZXggM2IzMDJiMmYyMC4uMDgzMzUzOTRlNSAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxf
Y21kdGFibGUuYworKysgYi90b29scy94bC94bF9jbWR0YWJsZS5jCkBAIC0xNTMsNyArMTUzLDgg
QEAgc3RydWN0IGNtZF9zcGVjIGNtZF90YWJsZVtdID0gewogICAgICAgIltvcHRpb25zXSA8RG9t
YWluPiA8Q2hlY2twb2ludEZpbGU+IFs8Q29uZmlnRmlsZT5dIiwKICAgICAgICItaCAgUHJpbnQg
dGhpcyBoZWxwLlxuIgogICAgICAgIi1jICBMZWF2ZSBkb21haW4gcnVubmluZyBhZnRlciBjcmVh
dGluZyB0aGUgc25hcHNob3QuXG4iCi0gICAgICAiLXAgIExlYXZlIGRvbWFpbiBwYXVzZWQgYWZ0
ZXIgY3JlYXRpbmcgdGhlIHNuYXBzaG90LiIKKyAgICAgICItcCAgTGVhdmUgZG9tYWluIHBhdXNl
ZCBhZnRlciBjcmVhdGluZyB0aGUgc25hcHNob3QuXG4iCisgICAgICAiLUQgIFN0b3JlIHRoZSBk
b21haW4gaWQgaW4gdGhlIGNvbmZpZ3JhdGlvbi4iCiAgICAgfSwKICAgICB7ICJtaWdyYXRlIiwK
ICAgICAgICZtYWluX21pZ3JhdGUsIDAsIDEsCkBAIC0xNjcsNyArMTY4LDggQEAgc3RydWN0IGNt
ZF9zcGVjIGNtZF90YWJsZVtdID0gewogICAgICAgIi1lICAgICAgICAgICAgICBEbyBub3Qgd2Fp
dCBpbiB0aGUgYmFja2dyb3VuZCAob24gPGhvc3Q+KSBmb3IgdGhlIGRlYXRoXG4iCiAgICAgICAi
ICAgICAgICAgICAgICAgIG9mIHRoZSBkb21haW4uXG4iCiAgICAgICAiLS1kZWJ1ZyAgICAgICAg
IFByaW50IGh1Z2UgKCEpIGFtb3VudCBvZiBkZWJ1ZyBkdXJpbmcgdGhlIG1pZ3JhdGlvbiBwcm9j
ZXNzLlxuIgotICAgICAgIi1wICAgICAgICAgICAgICBEbyBub3QgdW5wYXVzZSBkb21haW4gYWZ0
ZXIgbWlncmF0aW5nIGl0LiIKKyAgICAgICItcCAgICAgICAgICAgICAgRG8gbm90IHVucGF1c2Ug
ZG9tYWluIGFmdGVyIG1pZ3JhdGluZyBpdC5cbiIKKyAgICAgICItRCAgICAgICAgICAgICAgUHJl
c2VydmUgdGhlIGRvbWFpbiBpZCIKICAgICB9LAogICAgIHsgInJlc3RvcmUiLAogICAgICAgJm1h
aW5fcmVzdG9yZSwgMCwgMSwKZGlmZiAtLWdpdCBhL3Rvb2xzL3hsL3hsX21pZ3JhdGUuYyBiL3Rv
b2xzL3hsL3hsX21pZ3JhdGUuYwppbmRleCAyMmYwNDI5Yjg0Li4wODEzYmViODAxIDEwMDY0NAot
LS0gYS90b29scy94bC94bF9taWdyYXRlLmMKKysrIGIvdG9vbHMveGwveGxfbWlncmF0ZS5jCkBA
IC0xNzYsNyArMTc2LDggQEAgc3RhdGljIHZvaWQgbWlncmF0ZV9kb19wcmVhbWJsZShpbnQgc2Vu
ZF9mZCwgaW50IHJlY3ZfZmQsIHBpZF90IGNoaWxkLAogCiB9CiAKLXN0YXRpYyB2b2lkIG1pZ3Jh
dGVfZG9tYWluKHVpbnQzMl90IGRvbWlkLCBjb25zdCBjaGFyICpydW5lLCBpbnQgZGVidWcsCitz
dGF0aWMgdm9pZCBtaWdyYXRlX2RvbWFpbih1aW50MzJfdCBkb21pZCwgaW50IHByZXNlcnZlX2Rv
bWlkLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqcnVuZSwgaW50IGRl
YnVnLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3ZlcnJpZGVfY29u
ZmlnX2ZpbGUpCiB7CiAgICAgcGlkX3QgY2hpbGQgPSAtMTsKQEAgLTE4Nyw3ICsxODgsNyBAQCBz
dGF0aWMgdm9pZCBtaWdyYXRlX2RvbWFpbih1aW50MzJfdCBkb21pZCwgY29uc3QgY2hhciAqcnVu
ZSwgaW50IGRlYnVnLAogICAgIHVpbnQ4X3QgKmNvbmZpZ19kYXRhOwogICAgIGludCBjb25maWdf
bGVuLCBmbGFncyA9IExJQlhMX1NVU1BFTkRfTElWRTsKIAotICAgIHNhdmVfZG9tYWluX2NvcmVf
YmVnaW4oZG9taWQsIG92ZXJyaWRlX2NvbmZpZ19maWxlLAorICAgIHNhdmVfZG9tYWluX2NvcmVf
YmVnaW4oZG9taWQsIHByZXNlcnZlX2RvbWlkLCBvdmVycmlkZV9jb25maWdfZmlsZSwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZjb25maWdfZGF0YSwgJmNvbmZpZ19sZW4pOwogCiAgICAg
aWYgKCFjb25maWdfbGVuKSB7CkBAIC01MzcsMTMgKzUzOCwxNCBAQCBpbnQgbWFpbl9taWdyYXRl
KGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICBjaGFyICpydW5lID0gTlVMTDsKICAgICBjaGFy
ICpob3N0OwogICAgIGludCBvcHQsIGRhZW1vbml6ZSA9IDEsIG1vbml0b3IgPSAxLCBkZWJ1ZyA9
IDAsIHBhdXNlX2FmdGVyX21pZ3JhdGlvbiA9IDA7CisgICAgaW50IHByZXNlcnZlX2RvbWlkID0g
MDsKICAgICBzdGF0aWMgc3RydWN0IG9wdGlvbiBvcHRzW10gPSB7CiAgICAgICAgIHsiZGVidWci
LCAwLCAwLCAweDEwMH0sCiAgICAgICAgIHsibGl2ZSIsIDAsIDAsIDB4MjAwfSwKICAgICAgICAg
Q09NTU9OX0xPTkdfT1BUUwogICAgIH07CiAKLSAgICBTV0lUQ0hfRk9SRUFDSF9PUFQob3B0LCAi
RkM6czplcCIsIG9wdHMsICJtaWdyYXRlIiwgMikgeworICAgIFNXSVRDSF9GT1JFQUNIX09QVChv
cHQsICJGQzpzOmVwRCIsIG9wdHMsICJtaWdyYXRlIiwgMikgewogICAgIGNhc2UgJ0MnOgogICAg
ICAgICBjb25maWdfZmlsZW5hbWUgPSBvcHRhcmc7CiAgICAgICAgIGJyZWFrOwpAQCAtNTYwLDYg
KzU2Miw5IEBAIGludCBtYWluX21pZ3JhdGUoaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgIGNh
c2UgJ3AnOgogICAgICAgICBwYXVzZV9hZnRlcl9taWdyYXRpb24gPSAxOwogICAgICAgICBicmVh
azsKKyAgICBjYXNlICdEJzoKKyAgICAgICAgcHJlc2VydmVfZG9taWQgPSAxOworICAgICAgICBi
cmVhazsKICAgICBjYXNlIDB4MTAwOiAvKiAtLWRlYnVnICovCiAgICAgICAgIGRlYnVnID0gMTsK
ICAgICAgICAgYnJlYWs7CkBAIC01OTYsNyArNjAxLDcgQEAgaW50IG1haW5fbWlncmF0ZShpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCiAgICAgICAgICAgICAgICAgICBwYXVzZV9hZnRlcl9taWdyYXRp
b24gPyAiIC1wIiA6ICIiKTsKICAgICB9CiAKLSAgICBtaWdyYXRlX2RvbWFpbihkb21pZCwgcnVu
ZSwgZGVidWcsIGNvbmZpZ19maWxlbmFtZSk7CisgICAgbWlncmF0ZV9kb21haW4oZG9taWQsIHBy
ZXNlcnZlX2RvbWlkLCBydW5lLCBkZWJ1ZywgY29uZmlnX2ZpbGVuYW1lKTsKICAgICByZXR1cm4g
RVhJVF9TVUNDRVNTOwogfQogCkBAIC03MTYsNyArNzIxLDcgQEAgaW50IG1haW5fcmVtdXMoaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQogICAgICAgICAgICAgfQogICAgICAgICB9CiAKLSAgICAgICAg
c2F2ZV9kb21haW5fY29yZV9iZWdpbihkb21pZCwgTlVMTCwgJmNvbmZpZ19kYXRhLCAmY29uZmln
X2xlbik7CisgICAgICAgIHNhdmVfZG9tYWluX2NvcmVfYmVnaW4oZG9taWQsIDAsIE5VTEwsICZj
b25maWdfZGF0YSwgJmNvbmZpZ19sZW4pOwogCiAgICAgICAgIGlmICghY29uZmlnX2xlbikgewog
ICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJObyBjb25maWcgZmlsZSBzdG9yZWQgZm9yIHJ1
bm5pbmcgZG9tYWluIGFuZCAiCmRpZmYgLS1naXQgYS90b29scy94bC94bF9zYXZlcmVzdG9yZS5j
IGIvdG9vbHMveGwveGxfc2F2ZXJlc3RvcmUuYwppbmRleCA5YmUwMzNmZTY1Li45NTNkNzkxZDFh
IDEwMDY0NAotLS0gYS90b29scy94bC94bF9zYXZlcmVzdG9yZS5jCisrKyBiL3Rvb2xzL3hsL3hs
X3NhdmVyZXN0b3JlLmMKQEAgLTMyLDYgKzMyLDcgQEAKICNpZm5kZWYgTElCWExfSEFWRV9OT19T
VVNQRU5EX1JFU1VNRQogCiB2b2lkIHNhdmVfZG9tYWluX2NvcmVfYmVnaW4odWludDMyX3QgZG9t
aWQsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IHByZXNlcnZlX2RvbWlkLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIgKm92ZXJyaWRlX2NvbmZpZ19maWxl
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgKipjb25maWdfZGF0YV9yLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCAqY29uZmlnX2xlbl9yKQpAQCAtNjIsNiAr
NjMsOCBAQCB2b2lkIHNhdmVfZG9tYWluX2NvcmVfYmVnaW4odWludDMyX3QgZG9taWQsCiAgICAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwgInVuYWJsZSB0byByZXRyaWV2ZSBkb21haW4gY29uZmln
dXJhdGlvblxuIik7CiAgICAgICAgICAgICBleGl0KEVYSVRfRkFJTFVSRSk7CiAgICAgICAgIH0K
KworICAgICAgICBkX2NvbmZpZy5jX2luZm8uZG9taWQgPSBwcmVzZXJ2ZV9kb21pZCA/IGRvbWlk
IDogMDsKICAgICB9CiAKICAgICBjb25maWdfYyA9IGxpYnhsX2RvbWFpbl9jb25maWdfdG9fanNv
bihjdHgsICZkX2NvbmZpZyk7CkBAIC0xMjAsMTQgKzEyMywxNSBAQCB2b2lkIHNhdmVfZG9tYWlu
X2NvcmVfd3JpdGVjb25maWcoaW50IGZkLCBjb25zdCBjaGFyICpzb3VyY2UsCiAgICAgICAgICAg
ICBoZHIub3B0aW9uYWxfZGF0YV9sZW4pOwogfQogCi1zdGF0aWMgaW50IHNhdmVfZG9tYWluKHVp
bnQzMl90IGRvbWlkLCBjb25zdCBjaGFyICpmaWxlbmFtZSwgaW50IGNoZWNrcG9pbnQsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50IGxlYXZlcGF1c2VkLCBjb25zdCBjaGFyICpvdmVy
cmlkZV9jb25maWdfZmlsZSkKK3N0YXRpYyBpbnQgc2F2ZV9kb21haW4odWludDMyX3QgZG9taWQs
IGludCBwcmVzZXJ2ZV9kb21pZCwKKyAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
ZmlsZW5hbWUsIGludCBjaGVja3BvaW50LAorICAgICAgICAgICAgICAgICAgICAgICBpbnQgbGVh
dmVwYXVzZWQsIGNvbnN0IGNoYXIgKm92ZXJyaWRlX2NvbmZpZ19maWxlKQogewogICAgIGludCBm
ZDsKICAgICB1aW50OF90ICpjb25maWdfZGF0YTsKICAgICBpbnQgY29uZmlnX2xlbjsKIAotICAg
IHNhdmVfZG9tYWluX2NvcmVfYmVnaW4oZG9taWQsIG92ZXJyaWRlX2NvbmZpZ19maWxlLAorICAg
IHNhdmVfZG9tYWluX2NvcmVfYmVnaW4oZG9taWQsIHByZXNlcnZlX2RvbWlkLCBvdmVycmlkZV9j
b25maWdfZmlsZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjb25maWdfZGF0YSwgJmNv
bmZpZ19sZW4pOwogCiAgICAgaWYgKCFjb25maWdfbGVuKSB7CkBAIC0yMzYsMTUgKzI0MCwxOSBA
QCBpbnQgbWFpbl9zYXZlKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICBjb25zdCBjaGFyICpj
b25maWdfZmlsZW5hbWUgPSBOVUxMOwogICAgIGludCBjaGVja3BvaW50ID0gMDsKICAgICBpbnQg
bGVhdmVwYXVzZWQgPSAwOworICAgIGludCBwcmVzZXJ2ZV9kb21pZCA9IDA7CiAgICAgaW50IG9w
dDsKIAotICAgIFNXSVRDSF9GT1JFQUNIX09QVChvcHQsICJjcCIsIE5VTEwsICJzYXZlIiwgMikg
eworICAgIFNXSVRDSF9GT1JFQUNIX09QVChvcHQsICJjcEQiLCBOVUxMLCAic2F2ZSIsIDIpIHsK
ICAgICBjYXNlICdjJzoKICAgICAgICAgY2hlY2twb2ludCA9IDE7CiAgICAgICAgIGJyZWFrOwog
ICAgIGNhc2UgJ3AnOgogICAgICAgICBsZWF2ZXBhdXNlZCA9IDE7CiAgICAgICAgIGJyZWFrOwor
ICAgIGNhc2UgJ0QnOgorICAgICAgICBwcmVzZXJ2ZV9kb21pZCA9IDE7CisgICAgICAgIGJyZWFr
OwogICAgIH0KIAogICAgIGlmIChhcmdjLW9wdGluZCA+IDMpIHsKQEAgLTI1Nyw3ICsyNjUsOCBA
QCBpbnQgbWFpbl9zYXZlKGludCBhcmdjLCBjaGFyICoqYXJndikKICAgICBpZiAoIGFyZ2MgLSBv
cHRpbmQgPj0gMyApCiAgICAgICAgIGNvbmZpZ19maWxlbmFtZSA9IGFyZ3Zbb3B0aW5kICsgMl07
CiAKLSAgICBzYXZlX2RvbWFpbihkb21pZCwgZmlsZW5hbWUsIGNoZWNrcG9pbnQsIGxlYXZlcGF1
c2VkLCBjb25maWdfZmlsZW5hbWUpOworICAgIHNhdmVfZG9tYWluKGRvbWlkLCBwcmVzZXJ2ZV9k
b21pZCwgZmlsZW5hbWUsIGNoZWNrcG9pbnQsIGxlYXZlcGF1c2VkLAorICAgICAgICAgICAgICAg
IGNvbmZpZ19maWxlbmFtZSk7CiAgICAgcmV0dXJuIEVYSVRfU1VDQ0VTUzsKIH0KIApkaWZmIC0t
Z2l0IGEvdG9vbHMveGwveGxfdm1jb250cm9sLmMgYi90b29scy94bC94bF92bWNvbnRyb2wuYwpp
bmRleCAzOTI5MmFjZmU2Li4yZTJkNDI3NDkyIDEwMDY0NAotLS0gYS90b29scy94bC94bF92bWNv
bnRyb2wuYworKysgYi90b29scy94bC94bF92bWNvbnRyb2wuYwpAQCAtODk5LDcgKzg5OSw4IEBA
IHN0YXJ0OgogICAgICAgICBhdXRvY29ubmVjdF9jb25zb2xlX2hvdyA9IDA7CiAgICAgfQogCi0g
ICAgZF9jb25maWcuY19pbmZvLmRvbWlkID0gZG9taWRfcG9saWN5OworICAgIGlmICghbGlieGxf
ZG9taWRfdmFsaWRfZ3Vlc3QoZF9jb25maWcuY19pbmZvLmRvbWlkKSkKKyAgICAgICAgZF9jb25m
aWcuY19pbmZvLmRvbWlkID0gZG9taWRfcG9saWN5OwogCiAgICAgaWYgKCByZXN0b3JpbmcgKSB7
CiAgICAgICAgIGxpYnhsX2RvbWFpbl9yZXN0b3JlX3BhcmFtcyBwYXJhbXM7Ci0tIAoyLjIwLjEK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
