Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D3A17A94A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:54:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sme-0001Hb-Lz; Thu, 05 Mar 2020 15:51:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eGB2=4W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9smc-0001HW-Mi
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:51:34 +0000
X-Inumbo-ID: 2ecdc7ad-5ef9-11ea-a608-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ecdc7ad-5ef9-11ea-a608-12813bfff9fa;
 Thu, 05 Mar 2020 15:51:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2381EAF9F;
 Thu,  5 Mar 2020 15:51:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu,  5 Mar 2020 16:51:29 +0100
Message-Id: <20200305155129.28326-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3] xen/blkfront: fix ring info addressing
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDAyNjVkNmU4ZGRiODkwICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVt
b3J5IHNpemUgdG8KYWN0dWFsIHVzZSBjYXNlIikgbWFkZSBzdHJ1Y3QgYmxrZnJvbnRfcmluZ19p
bmZvIHNpemUgZHluYW1pYy4gVGhpcyBpcwpmaW5lIHdoZW4gcnVubmluZyB3aXRoIG9ubHkgb25l
IHF1ZXVlLCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCmFkZHJlc3Npbmcgb2YgdGhlIHNp
bmdsZSBxdWV1ZXMgaGFzIHRvIGJlIGFkYXB0ZWQgYXMgdGhlIHN0cnVjdHMgYXJlCmFsbG9jYXRl
ZCBpbiBhbiBhcnJheS4KCkZpeGVzOiAwMjY1ZDZlOGRkYjg5MCAoInhlbi9ibGtmcm9udDogbGlt
aXQgYWxsb2NhdGVkIG1lbW9yeSBzaXplIHRvIGFjdHVhbCB1c2UgY2FzZSIpClJlcG9ydGVkLWJ5
OiBTYW5kZXIgRWlrZWxlbmJvb20gPGxpbnV4QGVpa2VsZW5ib29tLml0PgpUZXN0ZWQtYnk6IFNh
bmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQWNrZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KVjI6Ci0gZ2V0IHJpZCBvZiByaW5mb19wdHIoKSBo
ZWxwZXIKLSB1c2UgcHJvcGVyIHBhcmVudGhlc2lzIGluIGZvcl9lYWNoX3JpbmZvKCkKLSByZW5h
bWUgcmluZm8gcGFyYW1ldGVyIG9mIGZvcl9lYWNoX3JpbmZvKCkKClYzOgotIGFkZGVkIGlubGlu
ZSBhbmQgY29uc3QgdG8gZ2V0X3JpbmZvKCkKLS0tCiBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jIHwgODAgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxr
ZnJvbnQuYwppbmRleCBlMmFkNmJiYTIyODEuLjlkZjUxNmE1NmJiMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ibG9jay94ZW4tYmxrZnJvbnQuYworKysgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9u
dC5jCkBAIC0yMTMsNiArMjEzLDcgQEAgc3RydWN0IGJsa2Zyb250X2luZm8KIAlzdHJ1Y3QgYmxr
X21xX3RhZ19zZXQgdGFnX3NldDsKIAlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbzsK
IAl1bnNpZ25lZCBpbnQgbnJfcmluZ3M7CisJdW5zaWduZWQgaW50IHJpbmZvX3NpemU7CiAJLyog
U2F2ZSB1bmNvbXBsZXRlIHJlcXMgYW5kIGJpb3MgZm9yIG1pZ3JhdGlvbi4gKi8KIAlzdHJ1Y3Qg
bGlzdF9oZWFkIHJlcXVlc3RzOwogCXN0cnVjdCBiaW9fbGlzdCBiaW9fbGlzdDsKQEAgLTI1OSw2
ICsyNjAsMTggQEAgc3RhdGljIGludCBibGtmcm9udF9zZXR1cF9pbmRpcmVjdChzdHJ1Y3QgYmxr
ZnJvbnRfcmluZ19pbmZvICpyaW5mbyk7CiBzdGF0aWMgdm9pZCBibGtmcm9udF9nYXRoZXJfYmFj
a2VuZF9mZWF0dXJlcyhzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7CiBzdGF0aWMgaW50IG5l
Z290aWF0ZV9tcShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7CiAKKyNkZWZpbmUgZm9yX2Vh
Y2hfcmluZm8oaW5mbywgcHRyLCBpZHgpCQkJCVwKKwlmb3IgKChwdHIpID0gKGluZm8pLT5yaW5m
bywgKGlkeCkgPSAwOwkJCVwKKwkgICAgIChpZHgpIDwgKGluZm8pLT5ucl9yaW5nczsJCQkJXAor
CSAgICAgKGlkeCkrKywgKHB0cikgPSAodm9pZCAqKShwdHIpICsgKGluZm8pLT5yaW5mb19zaXpl
KQorCitzdGF0aWMgaW5saW5lIHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKgorZ2V0X3JpbmZv
KGNvbnN0IHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvLCB1bnNpZ25lZCBpbnQgaSkKK3sKKwlC
VUdfT04oaSA+PSBpbmZvLT5ucl9yaW5ncyk7CisJcmV0dXJuICh2b2lkICopaW5mby0+cmluZm8g
KyBpICogaW5mby0+cmluZm9fc2l6ZTsKK30KKwogc3RhdGljIGludCBnZXRfaWRfZnJvbV9mcmVl
bGlzdChzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbykKIHsKIAl1bnNpZ25lZCBsb25n
IGZyZWUgPSByaW5mby0+c2hhZG93X2ZyZWU7CkBAIC04ODMsOCArODk2LDcgQEAgc3RhdGljIGJs
a19zdGF0dXNfdCBibGtpZl9xdWV1ZV9ycShzdHJ1Y3QgYmxrX21xX2h3X2N0eCAqaGN0eCwKIAlz
dHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyA9IGhjdHgtPnF1ZXVlLT5xdWV1ZWRhdGE7CiAJc3Ry
dWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8gPSBOVUxMOwogCi0JQlVHX09OKGluZm8tPm5y
X3JpbmdzIDw9IHFpZCk7Ci0JcmluZm8gPSAmaW5mby0+cmluZm9bcWlkXTsKKwlyaW5mbyA9IGdl
dF9yaW5mbyhpbmZvLCBxaWQpOwogCWJsa19tcV9zdGFydF9yZXF1ZXN0KHFkLT5ycSk7CiAJc3Bp
bl9sb2NrX2lycXNhdmUoJnJpbmZvLT5yaW5nX2xvY2ssIGZsYWdzKTsKIAlpZiAoUklOR19GVUxM
KCZyaW5mby0+cmluZykpCkBAIC0xMTgxLDYgKzExOTMsNyBAQCBzdGF0aWMgaW50IHhsdmJkX2Fs
bG9jX2dlbmRpc2soYmxraWZfc2VjdG9yX3QgY2FwYWNpdHksCiBzdGF0aWMgdm9pZCB4bHZiZF9y
ZWxlYXNlX2dlbmRpc2soc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCiB7CiAJdW5zaWduZWQg
aW50IG1pbm9yLCBucl9taW5vcnMsIGk7CisJc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmlu
Zm87CiAKIAlpZiAoaW5mby0+cnEgPT0gTlVMTCkKIAkJcmV0dXJuOwpAQCAtMTE4OCw5ICsxMjAx
LDcgQEAgc3RhdGljIHZvaWQgeGx2YmRfcmVsZWFzZV9nZW5kaXNrKHN0cnVjdCBibGtmcm9udF9p
bmZvICppbmZvKQogCS8qIE5vIG1vcmUgYmxraWZfcmVxdWVzdCgpLiAqLwogCWJsa19tcV9zdG9w
X2h3X3F1ZXVlcyhpbmZvLT5ycSk7CiAKLQlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7
IGkrKykgewotCQlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbyA9ICZpbmZvLT5yaW5m
b1tpXTsKLQorCWZvcl9lYWNoX3JpbmZvKGluZm8sIHJpbmZvLCBpKSB7CiAJCS8qIE5vIG1vcmUg
Z250dGFiIGNhbGxiYWNrIHdvcmsuICovCiAJCWdudHRhYl9jYW5jZWxfZnJlZV9jYWxsYmFjaygm
cmluZm8tPmNhbGxiYWNrKTsKIApAQCAtMTMzOSw2ICsxMzUwLDcgQEAgc3RhdGljIHZvaWQgYmxr
aWZfZnJlZV9yaW5nKHN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKQogc3RhdGljIHZv
aWQgYmxraWZfZnJlZShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbywgaW50IHN1c3BlbmQpCiB7
CiAJdW5zaWduZWQgaW50IGk7CisJc3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm87CiAK
IAkvKiBQcmV2ZW50IG5ldyByZXF1ZXN0cyBiZWluZyBpc3N1ZWQgdW50aWwgd2UgZml4IHRoaW5n
cyB1cC4gKi8KIAlpbmZvLT5jb25uZWN0ZWQgPSBzdXNwZW5kID8KQEAgLTEzNDcsOCArMTM1OSw4
IEBAIHN0YXRpYyB2b2lkIGJsa2lmX2ZyZWUoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8sIGlu
dCBzdXNwZW5kKQogCWlmIChpbmZvLT5ycSkKIAkJYmxrX21xX3N0b3BfaHdfcXVldWVzKGluZm8t
PnJxKTsKIAotCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9yaW5nczsgaSsrKQotCQlibGtpZl9m
cmVlX3JpbmcoJmluZm8tPnJpbmZvW2ldKTsKKwlmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywg
aSkKKwkJYmxraWZfZnJlZV9yaW5nKHJpbmZvKTsKIAogCWt2ZnJlZShpbmZvLT5yaW5mbyk7CiAJ
aW5mby0+cmluZm8gPSBOVUxMOwpAQCAtMTc3NSw2ICsxNzg3LDcgQEAgc3RhdGljIGludCB0YWxr
X3RvX2Jsa2JhY2soc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAlpbnQgZXJyOwogCXVuc2ln
bmVkIGludCBpLCBtYXhfcGFnZV9vcmRlcjsKIAl1bnNpZ25lZCBpbnQgcmluZ19wYWdlX29yZGVy
OworCXN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvOwogCiAJaWYgKCFpbmZvKQogCQly
ZXR1cm4gLUVOT0RFVjsKQEAgLTE3ODgsOSArMTgwMSw3IEBAIHN0YXRpYyBpbnQgdGFsa190b19i
bGtiYWNrKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiAJaWYgKGVycikKIAkJZ290byBkZXN0
cm95X2Jsa3Jpbmc7CiAKLQlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7IGkrKykgewot
CQlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5mbyA9ICZpbmZvLT5yaW5mb1tpXTsKLQor
CWZvcl9lYWNoX3JpbmZvKGluZm8sIHJpbmZvLCBpKSB7CiAJCS8qIENyZWF0ZSBzaGFyZWQgcmlu
ZywgYWxsb2MgZXZlbnQgY2hhbm5lbC4gKi8KIAkJZXJyID0gc2V0dXBfYmxrcmluZyhkZXYsIHJp
bmZvKTsKIAkJaWYgKGVycikKQEAgLTE4MTUsNyArMTgyNiw3IEBAIHN0YXRpYyBpbnQgdGFsa190
b19ibGtiYWNrKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsCiAKIAkvKiBXZSBhbHJlYWR5IGdv
dCB0aGUgbnVtYmVyIG9mIHF1ZXVlcy9yaW5ncyBpbiBfcHJvYmUgKi8KIAlpZiAoaW5mby0+bnJf
cmluZ3MgPT0gMSkgewotCQllcnIgPSB3cml0ZV9wZXJfcmluZ19ub2Rlcyh4YnQsICZpbmZvLT5y
aW5mb1swXSwgZGV2LT5ub2RlbmFtZSk7CisJCWVyciA9IHdyaXRlX3Blcl9yaW5nX25vZGVzKHhi
dCwgaW5mby0+cmluZm8sIGRldi0+bm9kZW5hbWUpOwogCQlpZiAoZXJyKQogCQkJZ290byBkZXN0
cm95X2Jsa3Jpbmc7CiAJfSBlbHNlIHsKQEAgLTE4MzcsMTAgKzE4NDgsMTAgQEAgc3RhdGljIGlu
dCB0YWxrX3RvX2Jsa2JhY2soc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAkJCWdvdG8gYWJv
cnRfdHJhbnNhY3Rpb247CiAJCX0KIAotCQlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7
IGkrKykgeworCQlmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywgaSkgewogCQkJbWVtc2V0KHBh
dGgsIDAsIHBhdGhzaXplKTsKIAkJCXNucHJpbnRmKHBhdGgsIHBhdGhzaXplLCAiJXMvcXVldWUt
JXUiLCBkZXYtPm5vZGVuYW1lLCBpKTsKLQkJCWVyciA9IHdyaXRlX3Blcl9yaW5nX25vZGVzKHhi
dCwgJmluZm8tPnJpbmZvW2ldLCBwYXRoKTsKKwkJCWVyciA9IHdyaXRlX3Blcl9yaW5nX25vZGVz
KHhidCwgcmluZm8sIHBhdGgpOwogCQkJaWYgKGVycikgewogCQkJCWtmcmVlKHBhdGgpOwogCQkJ
CWdvdG8gZGVzdHJveV9ibGtyaW5nOwpAQCAtMTg2OCw5ICsxODc5LDggQEAgc3RhdGljIGludCB0
YWxrX3RvX2Jsa2JhY2soc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAkJZ290byBkZXN0cm95
X2Jsa3Jpbmc7CiAJfQogCi0JZm9yIChpID0gMDsgaSA8IGluZm8tPm5yX3JpbmdzOyBpKyspIHsK
Kwlmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywgaSkgewogCQl1bnNpZ25lZCBpbnQgajsKLQkJ
c3RydWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqcmluZm8gPSAmaW5mby0+cmluZm9baV07CiAKIAkJ
Zm9yIChqID0gMDsgaiA8IEJMS19SSU5HX1NJWkUoaW5mbyk7IGorKykKIAkJCXJpbmZvLT5zaGFk
b3dbal0ucmVxLnUucncuaWQgPSBqICsgMTsKQEAgLTE5MDAsNiArMTkxMCw3IEBAIHN0YXRpYyBp
bnQgbmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQogewogCXVuc2lnbmVk
IGludCBiYWNrZW5kX21heF9xdWV1ZXM7CiAJdW5zaWduZWQgaW50IGk7CisJc3RydWN0IGJsa2Zy
b250X3JpbmdfaW5mbyAqcmluZm87CiAKIAlCVUdfT04oaW5mby0+bnJfcmluZ3MpOwogCkBAIC0x
OTExLDIwICsxOTIyLDE2IEBAIHN0YXRpYyBpbnQgbmVnb3RpYXRlX21xKHN0cnVjdCBibGtmcm9u
dF9pbmZvICppbmZvKQogCWlmICghaW5mby0+bnJfcmluZ3MpCiAJCWluZm8tPm5yX3JpbmdzID0g
MTsKIAotCWluZm8tPnJpbmZvID0ga3ZjYWxsb2MoaW5mby0+bnJfcmluZ3MsCi0JCQkgICAgICAg
c3RydWN0X3NpemUoaW5mby0+cmluZm8sIHNoYWRvdywKLQkJCQkJICAgQkxLX1JJTkdfU0laRShp
bmZvKSksCi0JCQkgICAgICAgR0ZQX0tFUk5FTCk7CisJaW5mby0+cmluZm9fc2l6ZSA9IHN0cnVj
dF9zaXplKGluZm8tPnJpbmZvLCBzaGFkb3csCisJCQkJICAgICAgIEJMS19SSU5HX1NJWkUoaW5m
bykpOworCWluZm8tPnJpbmZvID0ga3ZjYWxsb2MoaW5mby0+bnJfcmluZ3MsIGluZm8tPnJpbmZv
X3NpemUsIEdGUF9LRVJORUwpOwogCWlmICghaW5mby0+cmluZm8pIHsKIAkJeGVuYnVzX2Rldl9m
YXRhbChpbmZvLT54YmRldiwgLUVOT01FTSwgImFsbG9jYXRpbmcgcmluZ19pbmZvIHN0cnVjdHVy
ZSIpOwogCQlpbmZvLT5ucl9yaW5ncyA9IDA7CiAJCXJldHVybiAtRU5PTUVNOwogCX0KIAotCWZv
ciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9yaW5nczsgaSsrKSB7Ci0JCXN0cnVjdCBibGtmcm9udF9y
aW5nX2luZm8gKnJpbmZvOwotCi0JCXJpbmZvID0gJmluZm8tPnJpbmZvW2ldOworCWZvcl9lYWNo
X3JpbmZvKGluZm8sIHJpbmZvLCBpKSB7CiAJCUlOSVRfTElTVF9IRUFEKCZyaW5mby0+aW5kaXJl
Y3RfcGFnZXMpOwogCQlJTklUX0xJU1RfSEVBRCgmcmluZm8tPmdyYW50cyk7CiAJCXJpbmZvLT5k
ZXZfaW5mbyA9IGluZm87CkBAIC0yMDE3LDYgKzIwMjQsNyBAQCBzdGF0aWMgaW50IGJsa2lmX3Jl
Y292ZXIoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCiAJaW50IHJjOwogCXN0cnVjdCBiaW8g
KmJpbzsKIAl1bnNpZ25lZCBpbnQgc2VnczsKKwlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpy
aW5mbzsKIAogCWJsa2Zyb250X2dhdGhlcl9iYWNrZW5kX2ZlYXR1cmVzKGluZm8pOwogCS8qIFJl
c2V0IGxpbWl0cyBjaGFuZ2VkIGJ5IGJsa19tcV91cGRhdGVfbnJfaHdfcXVldWVzKCkuICovCkBA
IC0yMDI0LDkgKzIwMzIsNyBAQCBzdGF0aWMgaW50IGJsa2lmX3JlY292ZXIoc3RydWN0IGJsa2Zy
b250X2luZm8gKmluZm8pCiAJc2VncyA9IGluZm8tPm1heF9pbmRpcmVjdF9zZWdtZW50cyA/IDog
QkxLSUZfTUFYX1NFR01FTlRTX1BFUl9SRVFVRVNUOwogCWJsa19xdWV1ZV9tYXhfc2VnbWVudHMo
aW5mby0+cnEsIHNlZ3MgLyBHUkFOVFNfUEVSX1BTRUcpOwogCi0JZm9yIChyX2luZGV4ID0gMDsg
cl9pbmRleCA8IGluZm8tPm5yX3JpbmdzOyByX2luZGV4KyspIHsKLQkJc3RydWN0IGJsa2Zyb250
X3JpbmdfaW5mbyAqcmluZm8gPSAmaW5mby0+cmluZm9bcl9pbmRleF07Ci0KKwlmb3JfZWFjaF9y
aW5mbyhpbmZvLCByaW5mbywgcl9pbmRleCkgewogCQlyYyA9IGJsa2Zyb250X3NldHVwX2luZGly
ZWN0KHJpbmZvKTsKIAkJaWYgKHJjKQogCQkJcmV0dXJuIHJjOwpAQCAtMjAzNiwxMCArMjA0Miw3
IEBAIHN0YXRpYyBpbnQgYmxraWZfcmVjb3ZlcihzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbykK
IAkvKiBOb3cgc2FmZSBmb3IgdXMgdG8gdXNlIHRoZSBzaGFyZWQgcmluZyAqLwogCWluZm8tPmNv
bm5lY3RlZCA9IEJMS0lGX1NUQVRFX0NPTk5FQ1RFRDsKIAotCWZvciAocl9pbmRleCA9IDA7IHJf
aW5kZXggPCBpbmZvLT5ucl9yaW5nczsgcl9pbmRleCsrKSB7Ci0JCXN0cnVjdCBibGtmcm9udF9y
aW5nX2luZm8gKnJpbmZvOwotCi0JCXJpbmZvID0gJmluZm8tPnJpbmZvW3JfaW5kZXhdOworCWZv
cl9lYWNoX3JpbmZvKGluZm8sIHJpbmZvLCByX2luZGV4KSB7CiAJCS8qIEtpY2sgYW55IG90aGVy
IG5ldyByZXF1ZXN0cyBxdWV1ZWQgc2luY2Ugd2UgcmVzdW1lZCAqLwogCQlraWNrX3BlbmRpbmdf
cmVxdWVzdF9xdWV1ZXMocmluZm8pOwogCX0KQEAgLTIwNzIsMTMgKzIwNzUsMTMgQEAgc3RhdGlj
IGludCBibGtmcm9udF9yZXN1bWUoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldikKIAlzdHJ1Y3Qg
YmxrZnJvbnRfaW5mbyAqaW5mbyA9IGRldl9nZXRfZHJ2ZGF0YSgmZGV2LT5kZXYpOwogCWludCBl
cnIgPSAwOwogCXVuc2lnbmVkIGludCBpLCBqOworCXN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8g
KnJpbmZvOwogCiAJZGV2X2RiZygmZGV2LT5kZXYsICJibGtmcm9udF9yZXN1bWU6ICVzXG4iLCBk
ZXYtPm5vZGVuYW1lKTsKIAogCWJpb19saXN0X2luaXQoJmluZm8tPmJpb19saXN0KTsKIAlJTklU
X0xJU1RfSEVBRCgmaW5mby0+cmVxdWVzdHMpOwotCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9y
aW5nczsgaSsrKSB7Ci0JCXN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvID0gJmluZm8t
PnJpbmZvW2ldOworCWZvcl9lYWNoX3JpbmZvKGluZm8sIHJpbmZvLCBpKSB7CiAJCXN0cnVjdCBi
aW9fbGlzdCBtZXJnZV9iaW87CiAJCXN0cnVjdCBibGtfc2hhZG93ICpzaGFkb3cgPSByaW5mby0+
c2hhZG93OwogCkBAIC0yMzM3LDYgKzIzNDAsNyBAQCBzdGF0aWMgdm9pZCBibGtmcm9udF9jb25u
ZWN0KHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQogCXVuc2lnbmVkIGludCBiaW5mbzsKIAlj
aGFyICplbnZwW10gPSB7ICJSRVNJWkU9MSIsIE5VTEwgfTsKIAlpbnQgZXJyLCBpOworCXN0cnVj
dCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvOwogCiAJc3dpdGNoIChpbmZvLT5jb25uZWN0ZWQp
IHsKIAljYXNlIEJMS0lGX1NUQVRFX0NPTk5FQ1RFRDoKQEAgLTIzOTQsOCArMjM5OCw4IEBAIHN0
YXRpYyB2b2lkIGJsa2Zyb250X2Nvbm5lY3Qoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCiAJ
CQkJCQkgICAgInBoeXNpY2FsLXNlY3Rvci1zaXplIiwKIAkJCQkJCSAgICBzZWN0b3Jfc2l6ZSk7
CiAJYmxrZnJvbnRfZ2F0aGVyX2JhY2tlbmRfZmVhdHVyZXMoaW5mbyk7Ci0JZm9yIChpID0gMDsg
aSA8IGluZm8tPm5yX3JpbmdzOyBpKyspIHsKLQkJZXJyID0gYmxrZnJvbnRfc2V0dXBfaW5kaXJl
Y3QoJmluZm8tPnJpbmZvW2ldKTsKKwlmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywgaSkgewor
CQllcnIgPSBibGtmcm9udF9zZXR1cF9pbmRpcmVjdChyaW5mbyk7CiAJCWlmIChlcnIpIHsKIAkJ
CXhlbmJ1c19kZXZfZmF0YWwoaW5mby0+eGJkZXYsIGVyciwgInNldHVwX2luZGlyZWN0IGF0ICVz
IiwKIAkJCQkJIGluZm8tPnhiZGV2LT5vdGhlcmVuZCk7CkBAIC0yNDE2LDggKzI0MjAsOCBAQCBz
dGF0aWMgdm9pZCBibGtmcm9udF9jb25uZWN0KHN0cnVjdCBibGtmcm9udF9pbmZvICppbmZvKQog
CiAJLyogS2ljayBwZW5kaW5nIHJlcXVlc3RzLiAqLwogCWluZm8tPmNvbm5lY3RlZCA9IEJMS0lG
X1NUQVRFX0NPTk5FQ1RFRDsKLQlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnJfcmluZ3M7IGkrKykK
LQkJa2lja19wZW5kaW5nX3JlcXVlc3RfcXVldWVzKCZpbmZvLT5yaW5mb1tpXSk7CisJZm9yX2Vh
Y2hfcmluZm8oaW5mbywgcmluZm8sIGkpCisJCWtpY2tfcGVuZGluZ19yZXF1ZXN0X3F1ZXVlcyhy
aW5mbyk7CiAKIAlkZXZpY2VfYWRkX2Rpc2soJmluZm8tPnhiZGV2LT5kZXYsIGluZm8tPmdkLCBO
VUxMKTsKIApAQCAtMjY1Miw5ICsyNjU2LDkgQEAgc3RhdGljIHZvaWQgcHVyZ2VfcGVyc2lzdGVu
dF9ncmFudHMoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pCiB7CiAJdW5zaWduZWQgaW50IGk7
CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKKwlzdHJ1Y3QgYmxrZnJvbnRfcmluZ19pbmZvICpyaW5m
bzsKIAotCWZvciAoaSA9IDA7IGkgPCBpbmZvLT5ucl9yaW5nczsgaSsrKSB7Ci0JCXN0cnVjdCBi
bGtmcm9udF9yaW5nX2luZm8gKnJpbmZvID0gJmluZm8tPnJpbmZvW2ldOworCWZvcl9lYWNoX3Jp
bmZvKGluZm8sIHJpbmZvLCBpKSB7CiAJCXN0cnVjdCBncmFudCAqZ250X2xpc3RfZW50cnksICp0
bXA7CiAKIAkJc3Bpbl9sb2NrX2lycXNhdmUoJnJpbmZvLT5yaW5nX2xvY2ssIGZsYWdzKTsKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
