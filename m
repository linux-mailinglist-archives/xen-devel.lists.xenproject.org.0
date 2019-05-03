Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE18130E8
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:08:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMZk6-0001We-AN; Fri, 03 May 2019 15:04:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMZk4-0001WZ-79
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:04:52 +0000
X-Inumbo-ID: c4c6c5e2-6db4-11e9-b184-8705b175f1f1
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4c6c5e2-6db4-11e9-b184-8705b175f1f1;
 Fri, 03 May 2019 15:04:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85072069"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
Date: Fri, 3 May 2019 17:04:01 +0200
Message-ID: <20190503150401.15904-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen-blkfront: switch kcalloc to kvcalloc for
 large array allocation
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
Cc: Juergen Gross <jgross@suse.com>, Jens Axboe <axboe@kernel.dk>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUncyBubyByZWFzb24gdG8gcmVxdWVzdCBwaHlzaWNhbGx5IGNvbnRpZ3VvdXMgbWVtb3J5
IGZvciB0aG9zZQphbGxvY2F0aW9ucy4KClJlcG9ydGVkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IEtvbnJhZCBSemVzenV0
ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IEplbnMgQXhib2UgPGF4Ym9lQGtl
cm5lbC5kaz4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogbGludXgtYmxv
Y2tAdmdlci5rZXJuZWwub3JnCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVy
cy9ibG9jay94ZW4tYmxrZnJvbnQuYyB8IDM4ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgYi9kcml2ZXJzL2Js
b2NrL3hlbi1ibGtmcm9udC5jCmluZGV4IGQ0M2E1Njc3Y2NiYy4uYTc0ZDAzOTEzODIyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCisrKyBiL2RyaXZlcnMvYmxvY2sv
eGVuLWJsa2Zyb250LmMKQEAgLTEzMTAsMTEgKzEzMTAsMTEgQEAgc3RhdGljIHZvaWQgYmxraWZf
ZnJlZV9yaW5nKHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKQogCQl9CiAKIGZyZWVf
c2hhZG93OgotCQlrZnJlZShyaW5mby0+c2hhZG93W2ldLmdyYW50c191c2VkKTsKKwkJa3ZmcmVl
KHJpbmZvLT5zaGFkb3dbaV0uZ3JhbnRzX3VzZWQpOwogCQlyaW5mby0+c2hhZG93W2ldLmdyYW50
c191c2VkID0gTlVMTDsKLQkJa2ZyZWUocmluZm8tPnNoYWRvd1tpXS5pbmRpcmVjdF9ncmFudHMp
OworCQlrdmZyZWUocmluZm8tPnNoYWRvd1tpXS5pbmRpcmVjdF9ncmFudHMpOwogCQlyaW5mby0+
c2hhZG93W2ldLmluZGlyZWN0X2dyYW50cyA9IE5VTEw7Ci0JCWtmcmVlKHJpbmZvLT5zaGFkb3db
aV0uc2cpOworCQlrdmZyZWUocmluZm8tPnNoYWRvd1tpXS5zZyk7CiAJCXJpbmZvLT5zaGFkb3db
aV0uc2cgPSBOVUxMOwogCX0KIApAQCAtMTM1Myw3ICsxMzUzLDcgQEAgc3RhdGljIHZvaWQgYmxr
aWZfZnJlZShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbywgaW50IHN1c3BlbmQpCiAJZm9yIChp
ID0gMDsgaSA8IGluZm8tPm5yX3JpbmdzOyBpKyspCiAJCWJsa2lmX2ZyZWVfcmluZygmaW5mby0+
cmluZm9baV0pOwogCi0Ja2ZyZWUoaW5mby0+cmluZm8pOworCWt2ZnJlZShpbmZvLT5yaW5mbyk7
CiAJaW5mby0+cmluZm8gPSBOVUxMOwogCWluZm8tPm5yX3JpbmdzID0gMDsKIH0KQEAgLTE5MTQs
OSArMTkxNCw5IEBAIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9udF9pbmZv
ICppbmZvKQogCWlmICghaW5mby0+bnJfcmluZ3MpCiAJCWluZm8tPm5yX3JpbmdzID0gMTsKIAot
CWluZm8tPnJpbmZvID0ga2NhbGxvYyhpbmZvLT5ucl9yaW5ncywKLQkJCSAgICAgIHNpemVvZihz
dHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvKSwKLQkJCSAgICAgIEdGUF9LRVJORUwpOworCWluZm8t
PnJpbmZvID0ga3ZjYWxsb2MoaW5mby0+bnJfcmluZ3MsCisJCQkgICAgICAgc2l6ZW9mKHN0cnVj
dCBibGtmcm9udF9yaW5nX2luZm8pLAorCQkJICAgICAgIEdGUF9LRVJORUwpOwogCWlmICghaW5m
by0+cmluZm8pIHsKIAkJeGVuYnVzX2Rldl9mYXRhbChpbmZvLT54YmRldiwgLUVOT01FTSwgImFs
bG9jYXRpbmcgcmluZ19pbmZvIHN0cnVjdHVyZSIpOwogCQlpbmZvLT5ucl9yaW5ncyA9IDA7CkBA
IC0yMjMyLDE3ICsyMjMyLDE3IEBAIHN0YXRpYyBpbnQgYmxrZnJvbnRfc2V0dXBfaW5kaXJlY3Qo
c3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8pCiAKIAlmb3IgKGkgPSAwOyBpIDwgQkxL
X1JJTkdfU0laRShpbmZvKTsgaSsrKSB7CiAJCXJpbmZvLT5zaGFkb3dbaV0uZ3JhbnRzX3VzZWQg
PQotCQkJa2NhbGxvYyhncmFudHMsCi0JCQkJc2l6ZW9mKHJpbmZvLT5zaGFkb3dbaV0uZ3JhbnRz
X3VzZWRbMF0pLAotCQkJCUdGUF9OT0lPKTsKLQkJcmluZm8tPnNoYWRvd1tpXS5zZyA9IGtjYWxs
b2MocHNlZ3MsCi0JCQkJCSAgICAgIHNpemVvZihyaW5mby0+c2hhZG93W2ldLnNnWzBdKSwKLQkJ
CQkJICAgICAgR0ZQX05PSU8pOworCQkJa3ZjYWxsb2MoZ3JhbnRzLAorCQkJCSBzaXplb2Yocmlu
Zm8tPnNoYWRvd1tpXS5ncmFudHNfdXNlZFswXSksCisJCQkJIEdGUF9OT0lPKTsKKwkJcmluZm8t
PnNoYWRvd1tpXS5zZyA9IGt2Y2FsbG9jKHBzZWdzLAorCQkJCQkgICAgICAgc2l6ZW9mKHJpbmZv
LT5zaGFkb3dbaV0uc2dbMF0pLAorCQkJCQkgICAgICAgR0ZQX05PSU8pOwogCQlpZiAoaW5mby0+
bWF4X2luZGlyZWN0X3NlZ21lbnRzKQogCQkJcmluZm8tPnNoYWRvd1tpXS5pbmRpcmVjdF9ncmFu
dHMgPQotCQkJCWtjYWxsb2MoSU5ESVJFQ1RfR1JFRlMoZ3JhbnRzKSwKLQkJCQkJc2l6ZW9mKHJp
bmZvLT5zaGFkb3dbaV0uaW5kaXJlY3RfZ3JhbnRzWzBdKSwKLQkJCQkJR0ZQX05PSU8pOworCQkJ
CWt2Y2FsbG9jKElORElSRUNUX0dSRUZTKGdyYW50cyksCisJCQkJCSBzaXplb2YocmluZm8tPnNo
YWRvd1tpXS5pbmRpcmVjdF9ncmFudHNbMF0pLAorCQkJCQkgR0ZQX05PSU8pOwogCQlpZiAoKHJp
bmZvLT5zaGFkb3dbaV0uZ3JhbnRzX3VzZWQgPT0gTlVMTCkgfHwKIAkJCShyaW5mby0+c2hhZG93
W2ldLnNnID09IE5VTEwpIHx8CiAJCSAgICAgKGluZm8tPm1heF9pbmRpcmVjdF9zZWdtZW50cyAm
JgpAQCAtMjI1NiwxMSArMjI1NiwxMSBAQCBzdGF0aWMgaW50IGJsa2Zyb250X3NldHVwX2luZGly
ZWN0KHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKQogCiBvdXRfb2ZfbWVtb3J5Ogog
CWZvciAoaSA9IDA7IGkgPCBCTEtfUklOR19TSVpFKGluZm8pOyBpKyspIHsKLQkJa2ZyZWUocmlu
Zm8tPnNoYWRvd1tpXS5ncmFudHNfdXNlZCk7CisJCWt2ZnJlZShyaW5mby0+c2hhZG93W2ldLmdy
YW50c191c2VkKTsKIAkJcmluZm8tPnNoYWRvd1tpXS5ncmFudHNfdXNlZCA9IE5VTEw7Ci0JCWtm
cmVlKHJpbmZvLT5zaGFkb3dbaV0uc2cpOworCQlrdmZyZWUocmluZm8tPnNoYWRvd1tpXS5zZyk7
CiAJCXJpbmZvLT5zaGFkb3dbaV0uc2cgPSBOVUxMOwotCQlrZnJlZShyaW5mby0+c2hhZG93W2ld
LmluZGlyZWN0X2dyYW50cyk7CisJCWt2ZnJlZShyaW5mby0+c2hhZG93W2ldLmluZGlyZWN0X2dy
YW50cyk7CiAJCXJpbmZvLT5zaGFkb3dbaV0uaW5kaXJlY3RfZ3JhbnRzID0gTlVMTDsKIAl9CiAJ
aWYgKCFsaXN0X2VtcHR5KCZyaW5mby0+aW5kaXJlY3RfcGFnZXMpKSB7Ci0tIAoyLjE3LjIgKEFw
cGxlIEdpdC0xMTMpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
