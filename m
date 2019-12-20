Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EED04127DD8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:38:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJN7-0006Ji-Gs; Fri, 20 Dec 2019 14:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9gvH=2K=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1iiJN6-0006Im-7e
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:35:16 +0000
X-Inumbo-ID: effcda44-2335-11ea-b6f1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id effcda44-2335-11ea-b6f1-bc764e2007e4;
 Fri, 20 Dec 2019 14:35:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 641B02465E;
 Fri, 20 Dec 2019 14:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576852515;
 bh=cef2ALIBEnBzxkYG45vbt3FVcHCfQJFOp3MYNavC4e0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2PND1+PivRSwfqQVRK1NKRtuSPfXdH7T4FGlkwzkqSTw5MPOUOmDR3WmtaXXYUMfl
 0f82TMKwlt6by5zLr4aPEZCeaczJNax4tLu5eVhJf5UZSXBf2oVAXmoWENWoVsxrnD
 ZC3cmJiST7oWZl9cADug76KfOamDQz2odlxixXdk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 20 Dec 2019 09:34:31 -0500
Message-Id: <20191220143433.9922-32-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220143433.9922-1-sashal@kernel.org>
References: <20191220143433.9922-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Subject: [Xen-devel] [PATCH AUTOSEL 4.19 32/34] xen-blkback: prevent
 premature module unload
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Paul Durrant <pdurrant@amazon.com>, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKWyBVcHN0cmVhbSBjb21t
aXQgZmEyYWM2NTdmOTc4M2YwODkxYjI5MzU0OTBhZmU5YTdmZDI5ZDNmYSBdCgpPYmplY3RzIGFs
bG9jYXRlZCBieSB4ZW5fYmxraWZfYWxsb2MgY29tZSBmcm9tIHRoZSAnYmxraWZfY2FjaGUnIGtt
ZW0KY2FjaGUuIFRoaXMgY2FjaGUgaXMgZGVzdG95ZWQgd2hlbiB4ZW4tYmxraWYgaXMgdW5sb2Fk
ZWQgc28gaXQgaXMKbmVjZXNzYXJ5IHRvIHdhaXQgZm9yIHRoZSBkZWZlcnJlZCBmcmVlIHJvdXRp
bmUgdXNlZCBmb3Igc3VjaCBvYmplY3RzIHRvCmNvbXBsZXRlLiBUaGlzIG5lY2Vzc2l0eSB3YXMg
bWlzc2VkIGluIGNvbW1pdCAxNDg1NTk1NGY2MzYgInhlbi1ibGtiYWNrOgphbGxvdyBtb2R1bGUg
dG8gYmUgY2xlYW5seSB1bmxvYWRlZCIuIFRoaXMgcGF0Y2ggZml4ZXMgdGhlIHByb2JsZW0gYnkK
dGFraW5nL3JlbGVhc2luZyBleHRyYSBtb2R1bGUgcmVmZXJlbmNlcyBpbiB4ZW5fYmxraWZfYWxs
b2MvZnJlZSgpCnJlc3BlY3RpdmVseS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1
cnJhbnRAYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBh
dUBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBk
cml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgMTAgKysrKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3hl
bi1ibGtiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYwpp
bmRleCA1NTg2OWIzNjJmZGZiLi4yNWM0MWNlMDcwYTdmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2Js
b2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jCisrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sv
eGVuYnVzLmMKQEAgLTE3OSw2ICsxNzksMTUgQEAgc3RhdGljIHN0cnVjdCB4ZW5fYmxraWYgKnhl
bl9ibGtpZl9hbGxvYyhkb21pZF90IGRvbWlkKQogCWJsa2lmLT5kb21pZCA9IGRvbWlkOwogCWF0
b21pY19zZXQoJmJsa2lmLT5yZWZjbnQsIDEpOwogCWluaXRfY29tcGxldGlvbigmYmxraWYtPmRy
YWluX2NvbXBsZXRlKTsKKworCS8qCisJICogQmVjYXVzZSBmcmVlaW5nIGJhY2sgdG8gdGhlIGNh
Y2hlIG1heSBiZSBkZWZlcnJlZCwgaXQgaXMgbm90CisJICogc2FmZSB0byB1bmxvYWQgdGhlIG1v
ZHVsZSAoYW5kIGhlbmNlIGRlc3Ryb3kgdGhlIGNhY2hlKSB1bnRpbAorCSAqIHRoaXMgaGFzIGNv
bXBsZXRlZC4gVG8gcHJldmVudCBwcmVtYXR1cmUgdW5sb2FkaW5nLCB0YWtlIGFuCisJICogZXh0
cmEgbW9kdWxlIHJlZmVyZW5jZSBoZXJlIGFuZCByZWxlYXNlIG9ubHkgd2hlbiB0aGUgb2JqZWN0
CisJICogaGFzIGJlZW4gZnJlZWQgYmFjayB0byB0aGUgY2FjaGUuCisJICovCisJX19tb2R1bGVf
Z2V0KFRISVNfTU9EVUxFKTsKIAlJTklUX1dPUksoJmJsa2lmLT5mcmVlX3dvcmssIHhlbl9ibGtp
Zl9kZWZlcnJlZF9mcmVlKTsKIAogCXJldHVybiBibGtpZjsKQEAgLTMyOCw2ICszMzcsNyBAQCBz
dGF0aWMgdm9pZCB4ZW5fYmxraWZfZnJlZShzdHJ1Y3QgeGVuX2Jsa2lmICpibGtpZikKIAogCS8q
IE1ha2Ugc3VyZSBldmVyeXRoaW5nIGlzIGRyYWluZWQgYmVmb3JlIHNodXR0aW5nIGRvd24gKi8K
IAlrbWVtX2NhY2hlX2ZyZWUoeGVuX2Jsa2lmX2NhY2hlcCwgYmxraWYpOworCW1vZHVsZV9wdXQo
VEhJU19NT0RVTEUpOwogfQogCiBpbnQgX19pbml0IHhlbl9ibGtpZl9pbnRlcmZhY2VfaW5pdCh2
b2lkKQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
