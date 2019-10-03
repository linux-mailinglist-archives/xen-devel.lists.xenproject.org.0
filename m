Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8A8C963D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 03:38:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFq25-0003jM-5n; Thu, 03 Oct 2019 01:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLgg=X4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFq24-0003j5-Eq
 for xen-devel@lists.xen.org; Thu, 03 Oct 2019 01:35:52 +0000
X-Inumbo-ID: 1a2f6391-e57e-11e9-971d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 1a2f6391-e57e-11e9-971d-12813bfff9fa;
 Thu, 03 Oct 2019 01:35:38 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 91E3D222C3;
 Thu,  3 Oct 2019 01:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570066538;
 bh=1xWwpES9nhtB0ZlGxDbrbZiX3cEcb7ulrb2c3OZatNk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IelNuad8be2fz4duH6vT/LGGBU8Yh4oH9qWRtgrkGQmdSIipXT7WdLxMCcvvAsk/k
 ygkEo1nC3n96f9kyWCYyTc764veG5VkXAbpj3+olre1etOw4jlskuyTgrws5XiE0ch
 0lVcnYzd7FO0piQHh3Kyks/hgaVAhczTfq20yyNc=
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien.grall@arm.com
Date: Wed,  2 Oct 2019 18:35:26 -0700
Message-Id: <20191003013526.30768-8-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1910021833180.2691@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v8 8/8] xen/arm: add dom0-less device assignment
 info to docs
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, sstabellini@kernel.org,
 andrii_anisov@epam.com, Achin.Gupta@arm.com, xen-devel@lists.xen.org,
 Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGluZm8gYWJvdXQgdGhlIFNQSSB1c2VkIGZvciB0aGUgdmlydHVhbCBwbDAxMS4KClNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KCi0tLQpD
aGFuZ2VzIGluIHY4OgotIHJlbW92ZSBzZW50ZW5jZSBhYm91dCB4ZW4scGF0aCBiZWluZyBvcHRp
b25hbAoKQ2hhbmdlcyBpbiB2NzoKLSBhZGQgeGVuLGZvcmNlLWFzc2lnbi13aXRob3V0LWlvbW11
Ci0gY2xhcmlmeSB4ZW4scmVnIGFuZCB4ZW4scGF0aCBnbyB0b2dldGhlcgotIHJlbW92ZSBhY2tl
ZC1ieSBkdWUgdG8gY2hhbmdlcwoKQ2hhbmdlcyBpbiB2NjoKLSBmaXggbnJfc3BpcyBkZXNjcmlw
dGlvbgotIGFkZCBhY2sKCkNoYW5nZXMgaW4gdjU6Ci0gaW1wcm92ZSB3b3JkaW5nCgpDaGFuZ2Vz
IGluIHY0OgotIGZpeCBzcGVsbGluZwotIGFkZCAibXVsdGlib290LG1vZHVsZSIKLSBpbXByb3Zl
IGNvbW1pdCBtZXNzYWdlCi0gaW1wcm92ZSBkb2MKLSBleHBhbmQgdGhlIG5yX3NwaXMgYW5kIHZw
bDAxMSBzZWN0aW9ucyBhbmQgaW5jbHVkZSBpbmZvcm1hdGlvbiBhYm91dAogIHRoZSB2cGwwMTEg
U1BJCi0gbW92ZSBwYXNzdGhyb3VnaCBpbmZvcm1hdGlvbiB0byBkb2NzL21pc2MvYXJtL3Bhc3N0
aHJvdWdoLnR4dAoKQ2hhbmdlcyBpbiB2MzoKLSBhZGQgbnJfc3BpcwotIGNoYW5nZSBkZXNjcmlw
dGlvbiBvZiBpbnRlcnJ1cHRzIGFuZCBpbnRlcnJ1cHQtcGFyZW50CgpDaGFuZ2VzIGluIHYyOgot
IGRldmljZSB0cmVlIGZyYWdtZW50IGxvYWRlZCBpbiBjYWNoZWFibGUgbWVtb3J5Ci0gcmVuYW1l
IG11bHRpYm9vdCxkdGIgdG8gbXVsdGlib290LGRldmljZS10cmVlCi0gcmVuYW1lICJwYXRoIiB0
byAieGVuLHBhdGgiCi0gYWRkIGEgbm90ZSBhYm91dCBkZXZpY2UgbWVtb3J5IG1hcHBpbmcKLSBp
bnRyb2R1Y2UgeGVuLHJlZwotIHNwZWNpZnkgb25seSB0aGUgR0lDIGlzIHN1cHBvcnRlZAotLS0K
IGRvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQgfCAgNDQgKysrKysrKysrKy0K
IGRvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0ICAgICAgICAgfCAxMDYgKysrKysrKysrKysr
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTQ5IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jvb3Rpbmcu
dHh0IGIvZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dAppbmRleCAzMTdhOWU5
NjJhLi42NDllMDBkMDlmIDEwMDY0NAotLS0gYS9kb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2Jv
b3RpbmcudHh0CisrKyBiL2RvY3MvbWlzYy9hcm0vZGV2aWNlLXRyZWUvYm9vdGluZy50eHQKQEAg
LTE0Niw3ICsxNDYsMTggQEAgd2l0aCB0aGUgZm9sbG93aW5nIHByb3BlcnRpZXM6CiAKIC0gdnBs
MDExCiAKLSAgICBBbiBlbXB0eSBwcm9wZXJ0eSB0byBlbmFibGUvZGlzYWJsZSBhIHZpcnR1YWwg
cGwwMTEgZm9yIHRoZSBndWVzdCB0byB1c2UuCisgICAgQW4gZW1wdHkgcHJvcGVydHkgdG8gZW5h
YmxlL2Rpc2FibGUgYSB2aXJ0dWFsIHBsMDExIGZvciB0aGUgZ3Vlc3QgdG8KKyAgICB1c2UuIFRo
ZSB2aXJ0dWFsIHBsMDExIHVzZXMgU1BJIG51bWJlciAwIChzZWUgR1VFU1RfVlBMMDExX1NQSSku
CisgICAgUGxlYXNlIG5vdGUgdGhhdCB0aGUgU1BJIHVzZWQgZm9yIHRoZSB2aXJ0dWFsIHBsMDEx
IGNvdWxkIGNsYXNoIHdpdGggdGhlCisgICAgcGh5c2ljYWwgU1BJIG9mIGEgcGh5c2ljYWwgZGV2
aWNlIGFzc2lnbmVkIHRvIHRoZSBndWVzdC4KKworLSBucl9zcGlzCisKKyAgICBPcHRpb25hbC4g
QSAzMi1iaXQgaW50ZWdlciBzcGVjaWZ5aW5nIHRoZSBudW1iZXIgb2YgU1BJcyAoU2hhcmVkCisg
ICAgUGVyaXBoZXJhbCBJbnRlcnJ1cHRzKSB0byBhbGxvY2F0ZSBmb3IgdGhlIGRvbWFpbi4gSWYg
bnJfc3BpcyBpcworICAgIG1pc3NpbmcsIHRoZSBtYXggbnVtYmVyIG9mIFNQSXMgc3VwcG9ydGVk
IGJ5IHRoZSBwaHlzaWNhbCBHSUMgaXMKKyAgICB1c2VkLCBvciBHVUVTVF9WUEwwMTFfU1BJKzEg
aWYgdnBsMDExIGlzIGVuYWJsZWQsIHdoaWNoZXZlciBpcworICAgIGdyZWF0ZXIuCiAKIC0gI2Fk
ZHJlc3MtY2VsbHMgYW5kICNzaXplLWNlbGxzCiAKQEAgLTIyNiwzICsyMzcsMzQgQEAgY2hvc2Vu
IHsKICAgICAgICAgfTsKICAgICB9OwogfTsKKworCitEZXZpY2UgQXNzaWdubWVudAorPT09PT09
PT09PT09PT09PT0KKworRGV2aWNlIEFzc2lnbm1lbnQgKFBhc3N0aHJvdWdoKSBpcyBzdXBwb3J0
ZWQgYnkgYWRkaW5nIGFub3RoZXIgbW9kdWxlLAorYWxvbmdzaWRlIHRoZSBrZXJuZWwgYW5kIHJh
bWRpc2ssIHdpdGggdGhlIGRldmljZSB0cmVlIGZyYWdtZW50Citjb3JyZXNwb25kaW5nIHRvIHRo
ZSBkZXZpY2Ugbm9kZSB0byBhc3NpZ24gdG8gdGhlIGd1ZXN0LgorCitUaGUgZHRiIHN1Yi1ub2Rl
IHNob3VsZCBoYXZlIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKKworLSBjb21wYXRpYmxlCisK
KyAgICAibXVsdGlib290LGRldmljZS10cmVlIiBhbmQgIm11bHRpYm9vdCxtb2R1bGUiCisKKy0g
cmVnCisKKyAgICBTcGVjaWZpZXMgdGhlIHBoeXNpY2FsIGFkZHJlc3Mgb2YgdGhlIGRldmljZSB0
cmVlIGJpbmFyeSBmcmFnbWVudAorICAgIFJBTSBhbmQgaXRzIGxlbmd0aC4KKworQXMgYW4gZXhh
bXBsZToKKworICAgICAgICBtb2R1bGVAMHhjMDAwMDAwIHsKKyAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAibXVsdGlib290LGRldmljZS10cmVlIiwgIm11bHRpYm9vdCxtb2R1bGUiOworICAgICAg
ICAgICAgcmVnID0gPDB4MCAweGMwMDAwMDAgMHhmZmZmZmY+OworICAgICAgICB9OworCitUaGUg
RFRCIGZyYWdtZW50IGlzIGxvYWRlZCBhdCAweGMwMDAwMDAgaW4gdGhlIGV4YW1wbGUgYWJvdmUu
IEl0IHNob3VsZAorZm9sbG93IHRoZSBjb252ZW50aW9uIGV4cGxhaW5lZCBpbiBkb2NzL21pc2Mv
YXJtL3Bhc3N0aHJvdWdoLnR4dC4gVGhlCitEVEIgZnJhZ21lbnQgd2lsbCBiZSBhZGRlZCB0byB0
aGUgZ3Vlc3QgZGV2aWNlIHRyZWUsIHNvIHRoYXQgdGhlIGd1ZXN0CitrZXJuZWwgd2lsbCBiZSBh
YmxlIHRvIGRpc2NvdmVyIHRoZSBkZXZpY2UuCmRpZmYgLS1naXQgYS9kb2NzL21pc2MvYXJtL3Bh
c3N0aHJvdWdoLnR4dCBiL2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0CmluZGV4IDBlZmJk
MTIyZGUuLjY4MjZlMWYzNDEgMTAwNjQ0Ci0tLSBhL2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gu
dHh0CisrKyBiL2RvY3MvbWlzYy9hcm0vcGFzc3Rocm91Z2gudHh0CkBAIC04MCw2ICs4MCwxMTIg
QEAgU1BJIG51bWJlcnMgc3RhcnQgZnJvbSAzMiwgaW4gdGhpcyBleGFtcGxlIDgwICsgMzIgPSAx
MTIuCiBTZWUgbWFuIFt4bC5jZmddIGZvciB0aGUgaW9tZW0gZm9ybWF0LiBUaGUgcmVnIHByb3Bl
cnR5IGlzIGp1c3QgYSBwYWlyCiBvZiBhZGRyZXNzLCB0aGVuIHNpemUgbnVtYmVycywgZWFjaCBv
ZiB0aGVtIGNhbiBvY2N1cHkgMSBvciAyIGNlbGxzLgogCisKK0RvbTAtbGVzcyBEZXZpY2UgUGFz
c3Rocm91Z2gKKz09PT09PT09PT09PT09PT09PT09PT09PT09PT0KKworVGhlIHBhcnRpYWwgZGV2
aWNlIHRyZWUgZm9yIGRvbTAtbGVzcyBndWVzdHMgc2hvdWxkIGhhdmUgdGhlIGZvbGxvd2luZwor
cHJvcGVydGllcyBmb3IgZWFjaCBub2RlIGNvcnJlc3BvbmRpbmcgdG8gYSBwaHlzaWNhbCBkZXZp
Y2UgdG8gYXNzaWduIHRvCit0aGUgZ3Vlc3Q6CisKKy0geGVuLHJlZworCisgIFRoZSB4ZW4scmVn
IHByb3BlcnR5IGlzIGFuIGFycmF5IG9mOgorCisgICAgPHBoeXNfYWRkciBzaXplIGd1ZXN0X2Fk
ZHI+CisKKyAgVGhleSBzcGVjaWZ5IHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFuZCBzaXplIG9mIHRo
ZSBkZXZpY2UgbWVtb3J5CisgIHJhbmdlcyB0b2dldGhlciB3aXRoIHRoZSBjb3JyZXNwb25kaW5n
IGd1ZXN0IGFkZHJlc3MgdG8gbWFwIHRoZW0gdG8uCisgIFRoZSBzaXplIG9mIGBwaHlzX2FkZHIn
IGFuZCBgZ3Vlc3RfYWRkcicgaXMgZGV0ZXJtaW5lZCBieQorICAjYWRkcmVzcy1jZWxscywgdGhl
IHNpemUgb2YgYHNpemUnIGlzIGRldGVybWluZWQgYnkgI3NpemUtY2VsbHMsIG9mCisgIHRoZSBw
YXJ0aWFsIGRldmljZSB0cmVlLgorICBUaGUgbWVtb3J5IHdpbGwgYmUgbWFwcGVkIGFzIGRldmlj
ZSBtZW1vcnkgaW4gdGhlIGd1ZXN0IChEZXZpY2UtbkduUkUpLgorCistIHhlbixwYXRoCisKKyAg
QSBzdHJpbmcgcHJvcGVydHkgcmVwcmVzZW50aW5nIHRoZSBwYXRoIGluIHRoZSBob3N0IGRldmlj
ZSB0cmVlIHRvIHRoZQorICBjb3JyZXNwb25kaW5nIGRldmljZSBub2RlLgorCistIHhlbixmb3Jj
ZS1hc3NpZ24td2l0aG91dC1pb21tdQorICBJZiB4ZW4sZm9yY2UtYXNzaWduLXdpdGhvdXQtaW9t
bXUgaXMgcHJlc2VudCBYZW4gY29udGludWVzIGJvb3RpbmcKKyAgZXZlbiBvbiBJT01NVSBzZXR1
cCBlcnJvcnMgZm9yIHRoZSBkZXZpY2UgKGkuZS4gdGhlIGRldmljZSBpcyBub3QKKyAgcHJvdGVj
dGVkIGJ5IGFuIElPTU1VKS4KKworSW4gYWRkaXRpb24sIGEgc3BlY2lhbCAvZ2ljIG5vZGUgaXMg
ZXhwZWN0ZWQgYXMgYSBwbGFjZWhvbGRlciBmb3IgdGhlCitmdWxsIEdJQyBub2RlIHRoYXQgd2ls
bCBiZSBhZGRlZCBieSBYZW4gZm9yIHRoZSBndWVzdC4gL2dpYyBjYW4gYmUKK3JlZmVyZW5jZWQg
Ynkgb3RoZXIgcHJvcGVydGllcyBpbiB0aGUgZGV2aWNlIHRyZWUgZnJhZ21lbnQuIEZvcgoraW5z
dGFuY2UsIGl0IGNhbiBiZSByZWZlcmVuY2VkIGJ5IGludGVycnVwdC1wYXJlbnQgdW5kZXIgYSBk
ZXZpY2Ugbm9kZS4KK1hlbiB3aWxsIHRha2UgY2FyZSBvZiByZXBsYWNpbmcgdGhlICJnaWMiIHBs
YWNlaG9sZGVyIG5vZGUgZm9yIGEKK2NvbXBsZXRlIEdJQyBub2RlIHdoaWxlIHJldGFpbmluZyBh
bGwgdGhlIHJlZmVyZW5jZXMgY29ycmVjdGx5LiBUaGUgbmV3CitHSUMgbm9kZSBjcmVhdGVkIGJ5
IFhlbiBpcyBhIHJlZ3VsYXIgaW50ZXJydXB0LWNvbnRyb2xsZXJAPHVuaXQ+IG5vZGUuCisKKyAg
ICBnaWM6IGdpYyB7CisgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MHgzPjsKKyAgICAgICAg
aW50ZXJydXB0LWNvbnRyb2xsZXI7CisgICAgfTsKKworTm90ZSB0aGF0IHRoZSAjaW50ZXJydXB0
LWNlbGxzIGFuZCBpbnRlcnJ1cHQtY29udHJvbGxlciBwcm9wZXJ0aWVzIGFyZQorbm90IGFjdHVh
bGx5IHJlcXVpcmVkLCBob3dldmVyLCBEVEMgZXhwZWN0cyB0aGVtIHRvIGJlIHByZXNlbnQgaWYg
Z2ljIGlzCityZWZlcmVuY2VkIGJ5IGludGVycnVwdC1wYXJlbnQgb3Igc2ltaWxhci4KKworCitF
eGFtcGxlCis9PT09PT09CisKK1RoZSBmb2xsb3dpbmcgaXMgYSByZWFsLXdvcmxkIGV4YW1wbGUg
b2YgYSBkZXZpY2UgdHJlZSBmcmFnbWVudCB0bworYXNzaWduIGEgbmV0d29yayBjYXJkIHRvIGEg
ZG9tMC1sZXNzIGd1ZXN0IG9uIFhpbGlueCBVbHRyYXNjYWxlKyBNUFNvQzoKKworL2R0cy12MS87
CisKKy8geworICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICNzaXplLWNlbGxzID0gPDE+
OworCisgICAgZ2ljOiBnaWMgeworICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDM+OworICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsKKyAgICB9OworCisgICAgcGFzc3Rocm91Z2ggewor
ICAgICAgICBjb21wYXRpYmxlID0gInNpbXBsZS1idXMiOworICAgICAgICByYW5nZXM7CisgICAg
ICAgICNhZGRyZXNzLWNlbGxzID0gPDI+OworICAgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsKKwor
ICAgICAgICBtaXNjX2NsazogbWlzY19jbGsgeworICAgICAgICAgICAgI2Nsb2NrLWNlbGxzID0g
PDA+OworICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDB4NzczNTk0MD47CisgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKKyAgICAgICAgfTsKKworICAgICAgICBl
dGhlcm5ldEBmZjBlMDAwMCB7CisgICAgICAgICAgICBjb21wYXRpYmxlID0gImNkbnMsenlucW1w
LWdlbSI7CisgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7CisgICAgICAgICAgICByZWcgPSA8
MHgwIDB4ZmYwZTAwMDAgMHgxMDAwPjsKKyAgICAgICAgICAgIGNsb2NrLW5hbWVzID0gInBjbGsi
LCAiaGNsayIsICJ0eF9jbGsiLCAicnhfY2xrIjsKKyAgICAgICAgICAgICNhZGRyZXNzLWNlbGxz
ID0gPDE+OworICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MD47CisgICAgICAgICAgICBjbG9j
a3MgPSA8Jm1pc2NfY2xrICZtaXNjX2NsayAmbWlzY19jbGsgJm1pc2NfY2xrPjsKKyAgICAgICAg
ICAgIHBoeS1tb2RlID0gInJnbWlpLWlkIjsKKyAgICAgICAgICAgIHhsbngscHRwLWVuZXQtY2xv
Y2sgPSA8MD47CisgICAgICAgICAgICBsb2NhbC1tYWMtYWRkcmVzcyA9IFswMCAwYSAzNSAwMCAy
MiAwMV07CisgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OworICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDwwIDYzIDB4NCAwIDYzIDB4ND47CisgICAgICAgICAgICB4ZW4scGF0
aCA9ICIvYW1iYS9ldGhlcm5ldEBmZjBlMDAwMCI7CisgICAgICAgICAgICB4ZW4scmVnID0gPDB4
MCAweGZmMGUwMDAwIDB4MTAwMCAweDAgMHhmZjBlMDAwMD47CisKKyAgICAgICAgICAgIHBoeUBj
IHsKKyAgICAgICAgICAgICAgICByZWcgPSA8MHhjPjsKKyAgICAgICAgICAgICAgICB0aSxyeC1p
bnRlcm5hbC1kZWxheSA9IDwweDg+OworICAgICAgICAgICAgICAgIHRpLHR4LWludGVybmFsLWRl
bGF5ID0gPDB4YT47CisgICAgICAgICAgICAgICAgdGksZmlmby1kZXB0aCA9IDwweDE+OworICAg
ICAgICAgICAgICAgIHRpLHJ4Y3RybC1zdHJhcC13b3JrYTsKKyAgICAgICAgICAgIH07CisgICAg
ICAgIH07CisgICAgfTsKK307CisKKwogW2FybSxnaWMudHh0XTogaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybSxn
aWMudHh0CiBbYXJtLGdpYy12My50eHRdOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvYXJtLGdpYy12My50eHQKIFt4
bC5jZmddOiBodHRwczovL3hlbmJpdHMueGVuLm9yZy9kb2NzL3Vuc3RhYmxlL21hbi94bC5jZmcu
NS5odG1sCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
