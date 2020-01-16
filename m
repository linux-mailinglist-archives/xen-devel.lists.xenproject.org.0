Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D12C113E56F
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:14:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8hS-0007gv-Fg; Thu, 16 Jan 2020 17:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rOD0=3F=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1is8hQ-0007go-W8
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:12:53 +0000
X-Inumbo-ID: 6dcb69a6-3883-11ea-8782-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6dcb69a6-3883-11ea-8782-12813bfff9fa;
 Thu, 16 Jan 2020 17:12:52 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D630924696;
 Thu, 16 Jan 2020 17:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194771;
 bh=1fFE5iS0h/osjV3rPKtgPo6w7c/71rYCJlFdfhgNAiU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VkGyH10iHJloPIXZkpdzQK2vZtP+Vi3B3kAilrdsy1lliUM4bFNRvtgq9ltXf5q9Q
 GawzRQfygTo6DHCDbM/JExP4OuXaQC2VMWwVRfov70E5veUSVddTpLlvwWRzbfIWd9
 f7sU2yCsHWDTVikMFb/b3qDHIlvPDozoGY6sHN74=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:03:48 -0500
Message-Id: <20200116170509.12787-327-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 590/671] net: add
 {READ|WRITE}_ONCE() annotations on ->rskq_accept_head
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
Cc: Sasha Levin <sashal@kernel.org>, xen-devel@lists.xenproject.org,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRXJpYyBEdW1hemV0IDxlZHVtYXpldEBnb29nbGUuY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgNjBiMTczY2EzZDFjZDE3ODJiZDAwOTZkYzE3Mjk4ZWMyNDJmNmZiMSBdCgpyZXFza19xdWV1
ZV9lbXB0eSgpIGlzIGNhbGxlZCBmcm9tIGluZXRfY3NrX2xpc3Rlbl9wb2xsKCkgd2hpbGUKb3Ro
ZXIgY3B1cyBtaWdodCB3cml0ZSAtPnJza3FfYWNjZXB0X2hlYWQgdmFsdWUuCgpVc2Uge1JFQUR8
V1JJVEV9X09OQ0UoKSB0byBhdm9pZCBjb21waWxlciB0cmlja3MKYW5kIHBvdGVudGlhbCBLQ1NB
TiBzcGxhdHMuCgpGaXhlczogZmZmMWYzMDAxY2M1ICgidGNwOiBhZGQgYSBzcGlubG9jayB0byBw
cm90ZWN0IHN0cnVjdCByZXF1ZXN0X3NvY2tfcXVldWUiKQpTaWduZWQtb2ZmLWJ5OiBFcmljIER1
bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IEpha3ViIEtpY2luc2tp
IDxqYWt1Yi5raWNpbnNraUBuZXRyb25vbWUuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZp
biA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy94ZW4vcHZjYWxscy1iYWNrLmMgICAg
ICB8IDIgKy0KIGluY2x1ZGUvbmV0L3JlcXVlc3Rfc29jay5oICAgICAgfCA0ICsrLS0KIG5ldC9p
cHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9wdmNh
bGxzLWJhY2suYyBiL2RyaXZlcnMveGVuL3B2Y2FsbHMtYmFjay5jCmluZGV4IGQ0ZWEzMzU4MWFj
Mi4uYjNmYmZlZDI4NjgyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYwor
KysgYi9kcml2ZXJzL3hlbi9wdmNhbGxzLWJhY2suYwpAQCAtNzg0LDcgKzc4NCw3IEBAIHN0YXRp
YyBpbnQgcHZjYWxsc19iYWNrX3BvbGwoc3RydWN0IHhlbmJ1c19kZXZpY2UgKmRldiwKIAltYXBw
YXNzLT5yZXFjb3B5ID0gKnJlcTsKIAlpY3NrID0gaW5ldF9jc2sobWFwcGFzcy0+c29jay0+c2sp
OwogCXF1ZXVlID0gJmljc2stPmljc2tfYWNjZXB0X3F1ZXVlOwotCWRhdGEgPSBxdWV1ZS0+cnNr
cV9hY2NlcHRfaGVhZCAhPSBOVUxMOworCWRhdGEgPSBSRUFEX09OQ0UocXVldWUtPnJza3FfYWNj
ZXB0X2hlYWQpICE9IE5VTEw7CiAJaWYgKGRhdGEpIHsKIAkJbWFwcGFzcy0+cmVxY29weS5jbWQg
PSAwOwogCQlyZXQgPSAwOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9uZXQvcmVxdWVzdF9zb2NrLmgg
Yi9pbmNsdWRlL25ldC9yZXF1ZXN0X3NvY2suaAppbmRleCAzNDcwMTU1MTVhN2QuLjE2NTM0MzVm
MThmNSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9uZXQvcmVxdWVzdF9zb2NrLmgKKysrIGIvaW5jbHVk
ZS9uZXQvcmVxdWVzdF9zb2NrLmgKQEAgLTE4Myw3ICsxODMsNyBAQCB2b2lkIHJlcXNrX2Zhc3Rv
cGVuX3JlbW92ZShzdHJ1Y3Qgc29jayAqc2ssIHN0cnVjdCByZXF1ZXN0X3NvY2sgKnJlcSwKIAog
c3RhdGljIGlubGluZSBib29sIHJlcXNrX3F1ZXVlX2VtcHR5KGNvbnN0IHN0cnVjdCByZXF1ZXN0
X3NvY2tfcXVldWUgKnF1ZXVlKQogewotCXJldHVybiBxdWV1ZS0+cnNrcV9hY2NlcHRfaGVhZCA9
PSBOVUxMOworCXJldHVybiBSRUFEX09OQ0UocXVldWUtPnJza3FfYWNjZXB0X2hlYWQpID09IE5V
TEw7CiB9CiAKIHN0YXRpYyBpbmxpbmUgc3RydWN0IHJlcXVlc3Rfc29jayAqcmVxc2tfcXVldWVf
cmVtb3ZlKHN0cnVjdCByZXF1ZXN0X3NvY2tfcXVldWUgKnF1ZXVlLApAQCAtMTk1LDcgKzE5NSw3
IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHJlcXVlc3Rfc29jayAqcmVxc2tfcXVldWVfcmVtb3Zl
KHN0cnVjdCByZXF1ZXN0X3NvY2tfcXVldWUKIAlyZXEgPSBxdWV1ZS0+cnNrcV9hY2NlcHRfaGVh
ZDsKIAlpZiAocmVxKSB7CiAJCXNrX2FjY2VwdHFfcmVtb3ZlZChwYXJlbnQpOwotCQlxdWV1ZS0+
cnNrcV9hY2NlcHRfaGVhZCA9IHJlcS0+ZGxfbmV4dDsKKwkJV1JJVEVfT05DRShxdWV1ZS0+cnNr
cV9hY2NlcHRfaGVhZCwgcmVxLT5kbF9uZXh0KTsKIAkJaWYgKHF1ZXVlLT5yc2txX2FjY2VwdF9o
ZWFkID09IE5VTEwpCiAJCQlxdWV1ZS0+cnNrcV9hY2NlcHRfdGFpbCA9IE5VTEw7CiAJfQpkaWZm
IC0tZ2l0IGEvbmV0L2lwdjQvaW5ldF9jb25uZWN0aW9uX3NvY2suYyBiL25ldC9pcHY0L2luZXRf
Y29ubmVjdGlvbl9zb2NrLmMKaW5kZXggNjM2YTExYzU2Y2Y1Li43OTMyMDg1OGU3MTkgMTAwNjQ0
Ci0tLSBhL25ldC9pcHY0L2luZXRfY29ubmVjdGlvbl9zb2NrLmMKKysrIGIvbmV0L2lwdjQvaW5l
dF9jb25uZWN0aW9uX3NvY2suYwpAQCAtOTM3LDcgKzkzNyw3IEBAIHN0cnVjdCBzb2NrICppbmV0
X2Nza19yZXFza19xdWV1ZV9hZGQoc3RydWN0IHNvY2sgKnNrLAogCQlyZXEtPnNrID0gY2hpbGQ7
CiAJCXJlcS0+ZGxfbmV4dCA9IE5VTEw7CiAJCWlmIChxdWV1ZS0+cnNrcV9hY2NlcHRfaGVhZCA9
PSBOVUxMKQotCQkJcXVldWUtPnJza3FfYWNjZXB0X2hlYWQgPSByZXE7CisJCQlXUklURV9PTkNF
KHF1ZXVlLT5yc2txX2FjY2VwdF9oZWFkLCByZXEpOwogCQllbHNlCiAJCQlxdWV1ZS0+cnNrcV9h
Y2NlcHRfdGFpbC0+ZGxfbmV4dCA9IHJlcTsKIAkJcXVldWUtPnJza3FfYWNjZXB0X3RhaWwgPSBy
ZXE7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
