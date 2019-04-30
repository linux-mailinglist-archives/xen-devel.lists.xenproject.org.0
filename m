Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 603B310161
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 23:06:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLZu0-0007gO-Je; Tue, 30 Apr 2019 21:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLZtz-0007fA-40
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 21:02:59 +0000
X-Inumbo-ID: 5493ddf8-6b8b-11e9-864f-c3c12dfa35a3
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5493ddf8-6b8b-11e9-864f-c3c12dfa35a3;
 Tue, 30 Apr 2019 21:02:57 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED113217D4;
 Tue, 30 Apr 2019 21:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556658177;
 bh=/KzwmMHcUZr+ZQbrHigLZctPcmSGXv9IFLUWU57xvyY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=olRoOH/AQOwS9u1+WbhXnyVa7DePykcS84+sV+HKX3SgMkGR3N5a/VM4VXSLbehuW
 jEVUkPPpueyl6CY7E5fM6uTdXKYfUQTI/gc7u835K+HgWH6RRWt4Fct257AN6VTj3V
 dpsofv4AqXoLDPMdx9EcjDIdfYmRA7DF2yQiz030=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 14:02:47 -0700
Message-Id: <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH v2 05/10] libxl/xl: add memory policy option to
 iomem
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, ian.jackson@eu.citrix.com, wei.liu2@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbmV3IG1lbW9yeSBwb2xpY3kgb3B0aW9uIGZvciB0aGUgaW9tZW0gcGFyYW1ldGVyLgpQ
b3NzaWJsZSB2YWx1ZXMgYXJlOgotIGFybV9kZXZtZW0sIGRldmljZSBuR1JFLCB0aGUgZGVmYXVs
dCBvbiBBUk0KLSBhcm1fbWVtb3J5LCBXQiBjYWNoYWJsZSBtZW1vcnkKLSB4ODZfdWM6IHVuY2Fj
aGFibGUgbWVtb3J5LCB0aGUgZGVmYXVsdCBvbiB4ODYKClN0b3JlIHRoZSBwYXJhbWV0ZXIgaW4g
YSBuZXcgZmllbGQgaW4gbGlieGxfaW9tZW1fcmFuZ2UuCgpQYXNzIHRoZSBtZW1vcnkgcG9saWN5
IG9wdGlvbiB0byB4Y19kb21haW5fbWVtX21hcF9wb2xpY3kuCgpTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+CkNDOiBpYW4uamFja3NvbkBldS5j
aXRyaXguY29tCkNDOiB3ZWkubGl1MkBjaXRyaXguY29tCi0tLQpDaGFuZ2VzIGluIHYyOgotIGFk
ZCAjZGVmaW5lIExJQlhMX0hBVkVfTUVNT1JZX1BPTElDWQotIGFiaWxpdHkgdG8gcGFydCB0aGUg
bWVtb3J5IHBvbGljeSBwYXJhbWV0ZXIgZXZlbiBpZiBnZm4gaXMgbm90IHBhc3NlZAotIHJlbmFt
ZSBjYWNoZV9wb2xpY3kgdG8gbWVtb3J5IHBvbGljeQotIHJlbmFtZSBNRU1PUllfUE9MSUNZX0RF
Vk1FTSB0byBNRU1PUllfUE9MSUNZX0FSTV9ERVZfbkdSRQotIHJlbmFtZSBNRU1PUllfUE9MSUNZ
X01FTU9SWSB0byBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0IKLSByZW5hbWUgbWVtb3J5IHRvIGFy
bV9tZW1vcnkgYW5kIGRldm1lbSB0byBhcm1fZGV2bWVtCi0gZXhwYW5kIHRoZSBub24tc2VjdXJp
dHkgc3VwcG9ydCBzdGF0dXMgdG8gbm9uIGRldmljZSBwYXNzdGhyb3VnaCBpb21lbQogIGNvbmZp
Z3VyYXRpb25zCi0gcmVuYW1lIGlvbWVtIG9wdGlvbnMKLSBhZGQgeDg2IHNwZWNpZmljIGlvbWVt
IG9wdGlvbgotLS0KIFNVUFBPUlQubWQgICAgICAgICAgICAgICAgICB8ICAyICstCiBkb2NzL21h
bi94bC5jZmcuNS5wb2QuaW4gICAgfCAgNyArKysrKystCiB0b29scy9saWJ4bC9saWJ4bC5oICAg
ICAgICAgfCAgNSArKysrKwogdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMgIHwgMjEgKysrKysr
KysrKysrKysrKysrKy0tCiB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwgfCAgOSArKysrKysr
KysKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysr
Ky0KIDYgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9TVVBQT1JULm1kIGIvU1VQUE9SVC5tZAppbmRleCBlNGZiMTViLi5mMjlhMjk5
IDEwMDY0NAotLS0gYS9TVVBQT1JULm1kCisrKyBiL1NVUFBPUlQubWQKQEAgLTY0OSw3ICs2NDks
NyBAQCB0byBiZSB1c2VkIGluIGFkZGl0aW9uIHRvIFFFTVUuCiAKIAlTdGF0dXM6IEV4cGVyaW1l
bnRhbAogCi0jIyMgQVJNL05vbi1QQ0kgZGV2aWNlIHBhc3N0aHJvdWdoCisjIyMgQVJNL05vbi1Q
Q0kgZGV2aWNlIHBhc3N0aHJvdWdoIGFuZCBvdGhlciBpb21lbSBjb25maWd1cmF0aW9ucwogCiAg
ICAgU3RhdHVzOiBTdXBwb3J0ZWQsIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQKIApkaWZmIC0tZ2l0
IGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluIGIvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCmlu
ZGV4IGM3ZDcwZTYuLmM4NTg1N2UgMTAwNjQ0Ci0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5p
bgorKysgYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KQEAgLTEyMjIsNyArMTIyMiw3IEBAIGlz
IGdpdmVuIGluIGhleGFkZWNpbWFsIGZvcm1hdCBhbmQgbWF5IGVpdGhlciBiZSBhIHJhbmdlLCBl
LmcuIEM8MmY4LTJmZj4KIEl0IGlzIHJlY29tbWVuZGVkIHRvIG9ubHkgdXNlIHRoaXMgb3B0aW9u
IGZvciB0cnVzdGVkIFZNcyB1bmRlcgogYWRtaW5pc3RyYXRvcidzIGNvbnRyb2wuCiAKLT1pdGVt
IEI8aW9tZW09WyAiSU9NRU1fU1RBUlQsTlVNX1BBR0VTW0BHRk5dIiwgIklPTUVNX1NUQVJULE5V
TV9QQUdFU1tAR0ZOXSIsIC4uLl0+Cis9aXRlbSBCPGlvbWVtPVsgIklPTUVNX1NUQVJULE5VTV9Q
QUdFU1tAR0ZOXSxNRU1PUllfUE9MSUNZIiwgIklPTUVNX1NUQVJULE5VTV9QQUdFU1tAR0ZOXVss
TUVNT1JZX1BPTElDWV0iLCAuLi5dPgogCiBBbGxvdyBhdXRvLXRyYW5zbGF0ZWQgZG9tYWlucyB0
byBhY2Nlc3Mgc3BlY2lmaWMgaGFyZHdhcmUgSS9PIG1lbW9yeSBwYWdlcy4KIApAQCAtMTIzMyw2
ICsxMjMzLDExIEBAIEI8R0ZOPiBpcyBub3Qgc3BlY2lmaWVkLCB0aGUgbWFwcGluZyB3aWxsIGJl
IHBlcmZvcm1lZCB1c2luZyBCPElPTUVNX1NUQVJUPgogYXMgYSBzdGFydCBpbiB0aGUgZ3Vlc3Qn
cyBhZGRyZXNzIHNwYWNlLCB0aGVyZWZvcmUgcGVyZm9ybWluZyBhIDE6MSBtYXBwaW5nCiBieSBk
ZWZhdWx0LgogQWxsIG9mIHRoZXNlIHZhbHVlcyBtdXN0IGJlIGdpdmVuIGluIGhleGFkZWNpbWFs
IGZvcm1hdC4KK0I8TUVNT1JZX1BPTElDWT4gZm9yIEFSTSBwbGF0Zm9ybXM6CisgIC0gImFybV9k
ZXZtZW0iIGZvciBEZXZpY2UgbkdSRSwgdGhlIGRlZmF1bHQgb24gQVJNCisgIC0gImFybV9tZW1v
cnkiIGZvciBPdXRlciBTaGFyZWFibGUgV3JpdGUtQmFjayBDYWNoZWFibGUgTWVtb3J5CitCPE1F
TU9SWV9QT0xJQ1k+IGNhbiBiZSBmb3IgeDg2IHBsYXRmb3JtczoKKyAgLSAieDg2X3VjIiBmb3Ig
VW5jYWNoYWJsZSBNZW1vcnksIHRoZSBkZWZhdWx0IG9uIHg4NgogCiBOb3RlIHRoYXQgdGhlIElP
TU1VIHdvbid0IGJlIHVwZGF0ZWQgd2l0aCB0aGUgbWFwcGluZ3Mgc3BlY2lmaWVkIHdpdGggdGhp
cwogb3B0aW9uLiBUaGlzIG9wdGlvbiB0aGVyZWZvcmUgc2hvdWxkIG5vdCBiZSB1c2VkIHRvIHBh
c3MgdGhyb3VnaCBhbnkKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsLmggYi90b29scy9s
aWJ4bC9saWJ4bC5oCmluZGV4IDQ4MjQ5OWEuLjIzNjYzMzEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xp
YnhsL2xpYnhsLmgKKysrIGIvdG9vbHMvbGlieGwvbGlieGwuaApAQCAtMzc5LDYgKzM3OSwxMSBA
QAogI2RlZmluZSBMSUJYTF9IQVZFX0JVSUxESU5GT19CT09UTE9BREVSX0FSR1MgMQogCiAvKgor
ICogU3VwcG9ydCBzcGVjaWZ5aW5nIG1lbW9yeSBwb2xpY3kgaW5mb3JtYXRpb24gZm9yIG1lbW9y
eSBtYXBwaW5ncy4KKyAqLworI2RlZmluZSBMSUJYTF9IQVZFX01FTU9SWV9QT0xJQ1kgMQorCisv
KgogICogTElCWExfSEFWRV9FWFRFTkRFRF9WS0IgaW5kaWNhdGVzIHRoYXQgbGlieGxfZGV2aWNl
X3ZrYiBoYXMgZXh0ZW5kZWQgZmllbGRzOgogICogIC0gdW5pcXVlX2lkOwogICogIC0gZmVhdHVy
ZV9kaXNhYmxlX2tleWJvYXJkOwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMgYi90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYwppbmRleCA4OWZlODBmLi5hNmM1ZTMwIDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYworKysgYi90b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYwpAQCAtNDE1LDYgKzQxNSwyMSBAQCBzdGF0aWMgdm9pZCBpbml0X2NvbnNv
bGVfaW5mbyhsaWJ4bF9fZ2MgKmdjLAogICAgICAgIE9ubHkgJ2NoYW5uZWxzJyB3aGVuIG1hcHBl
ZCB0byBjb25zb2xlcyBoYXZlIGEgc3RyaW5nIG5hbWUuICovCiB9CiAKK3N0YXRpYyB1aW50MzJf
dCBsaWJ4bF9fbWVtb3J5X3BvbGljeV90b194YyhsaWJ4bF9tZW1vcnlfcG9saWN5IGMpCit7Cisg
ICAgc3dpdGNoIChjKSB7CisgICAgY2FzZSBMSUJYTF9NRU1PUllfUE9MSUNZX0FSTV9NRU1fV0I6
CisgICAgICAgIHJldHVybiBNRU1PUllfUE9MSUNZX0FSTV9NRU1fV0I7CisgICAgY2FzZSBMSUJY
TF9NRU1PUllfUE9MSUNZX0FSTV9ERVZfTkdSRToKKyAgICAgICAgcmV0dXJuIE1FTU9SWV9QT0xJ
Q1lfQVJNX0RFVl9uR1JFOworICAgIGNhc2UgTElCWExfTUVNT1JZX1BPTElDWV9YODZfVUM6Cisg
ICAgICAgIHJldHVybiBNRU1PUllfUE9MSUNZX1g4Nl9VQzsKKyAgICBjYXNlIExJQlhMX01FTU9S
WV9QT0xJQ1lfREVGQVVMVDoKKyAgICBkZWZhdWx0OgorICAgICAgICByZXR1cm4gTUVNT1JZX1BP
TElDWV9ERUZBVUxUOworICAgIH0KK30KKwogaW50IGxpYnhsX19kb21haW5fYnVpbGQobGlieGxf
X2djICpnYywKICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX2RvbWFpbl9jb25maWcgKmRf
Y29uZmlnLAogICAgICAgICAgICAgICAgICAgICAgICAgdWludDMyX3QgZG9taWQsCkBAIC0xMzY5
LDkgKzEzODQsMTEgQEAgc3RhdGljIHZvaWQgZG9tY3JlYXRlX2xhdW5jaF9kbShsaWJ4bF9fZWdj
ICplZ2MsIGxpYnhsX19tdWx0aWRldiAqbXVsdGlkZXYsCiAgICAgICAgICAgICByZXQgPSBFUlJP
Ul9GQUlMOwogICAgICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgICAgIH0KLSAgICAgICAg
cmV0ID0geGNfZG9tYWluX21lbW9yeV9tYXBwaW5nKENUWC0+eGNoLCBkb21pZCwKKyAgICAgICAg
cmV0ID0geGNfZG9tYWluX21lbV9tYXBfcG9saWN5KENUWC0+eGNoLCBkb21pZCwKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvLT5nZm4sIGlvLT5zdGFydCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvLT5udW1iZXIsIDEpOworICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW8tPm51bWJlciwgMSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX19tZW1vcnlfcG9saWN5X3RvX3hj
KAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvLT5tZW1vcnlf
cG9saWN5KSk7CiAgICAgICAgIGlmIChyZXQgPCAwKSB7CiAgICAgICAgICAgICBMT0dFRChFUlJP
UiwgZG9taWQsCiAgICAgICAgICAgICAgICAgICAiZmFpbGVkIHRvIG1hcCB0byBkb21haW4gaW9t
ZW0gcmFuZ2UgJSJQUkl4NjQiLSUiUFJJeDY0CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4
bF90eXBlcy5pZGwgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKaW5kZXggY2I0NzAyZi4u
NGRiOGE2MiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsCisrKyBiL3Rv
b2xzL2xpYnhsL2xpYnhsX3R5cGVzLmlkbApAQCAtMjcyLDYgKzI3MiwxMyBAQCBsaWJ4bF9pb3Bv
cnRfcmFuZ2UgPSBTdHJ1Y3QoImlvcG9ydF9yYW5nZSIsIFsKICAgICAoIm51bWJlciIsIHVpbnQz
MiksCiAgICAgXSkKIAorbGlieGxfbWVtb3J5X3BvbGljeSA9IEVudW1lcmF0aW9uKCJtZW1vcnlf
cG9saWN5IiwgWworICAgICgwLCAiZGVmYXVsdCIpLAorICAgICgxLCAiQVJNX0Rldl9uR1JFIiks
CisgICAgKDIsICJBUk1fTWVtX1dCIiksCisgICAgKDMsICJ4ODZfVUMiKSwKKyAgICBdLCBpbml0
X3ZhbCA9ICJMSUJYTF9NRU1PUllfUE9MSUNZX0RFRkFVTFQiKQorCiBsaWJ4bF9pb21lbV9yYW5n
ZSA9IFN0cnVjdCgiaW9tZW1fcmFuZ2UiLCBbCiAgICAgIyBzdGFydCBob3N0IGZyYW1lIG51bWJl
ciB0byBiZSBtYXBwZWQgdG8gdGhlIGd1ZXN0CiAgICAgKCJzdGFydCIsIHVpbnQ2NCksCkBAIC0y
NzksNiArMjg2LDggQEAgbGlieGxfaW9tZW1fcmFuZ2UgPSBTdHJ1Y3QoImlvbWVtX3JhbmdlIiwg
WwogICAgICgibnVtYmVyIiwgdWludDY0KSwKICAgICAjIGd1ZXN0IGZyYW1lIG51bWJlciB1c2Vk
IGFzIGEgc3RhcnQgZm9yIHRoZSBtYXBwaW5nCiAgICAgKCJnZm4iLCB1aW50NjQsIHsnaW5pdF92
YWwnOiAiTElCWExfSU5WQUxJRF9HRk4ifSksCisgICAgIyBtZW1vcnlfcG9saWN5IG9mIHRoZSBt
ZW1vcnkgcmVnaW9uCisgICAgKCJtZW1vcnlfcG9saWN5IiwgbGlieGxfbWVtb3J5X3BvbGljeSks
CiAgICAgXSkKIAogbGlieGxfdmdhX2ludGVyZmFjZV9pbmZvID0gU3RydWN0KCJ2Z2FfaW50ZXJm
YWNlX2luZm8iLCBbCmRpZmYgLS1naXQgYS90b29scy94bC94bF9wYXJzZS5jIGIvdG9vbHMveGwv
eGxfcGFyc2UuYwppbmRleCAzNTJjZDIxLi5lZDU2OTMxIDEwMDY0NAotLS0gYS90b29scy94bC94
bF9wYXJzZS5jCisrKyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKQEAgLTE4ODMsNiArMTg4Myw3IEBA
IHZvaWQgcGFyc2VfY29uZmlnX2RhdGEoY29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwKICAgICAg
ICAgfQogICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbnVtX2lvbWVtOyBpKyspIHsKICAgICAgICAg
ICAgIGludCB1c2VkOworICAgICAgICAgICAgY29uc3QgY2hhciAqbWVtcG9saWN5OwogCiAgICAg
ICAgICAgICBidWYgPSB4bHVfY2ZnX2dldF9saXN0aXRlbSAoaW9tZW0sIGkpOwogICAgICAgICAg
ICAgaWYgKCFidWYpIHsKQEAgLTE4OTUsMTEgKzE4OTYsMzAgQEAgdm9pZCBwYXJzZV9jb25maWdf
ZGF0YShjb25zdCBjaGFyICpjb25maWdfc291cmNlLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICZiX2luZm8tPmlvbWVtW2ldLnN0YXJ0LAogICAgICAgICAgICAgICAgICAgICAgICAgICZiX2lu
Zm8tPmlvbWVtW2ldLm51bWJlciwgJnVzZWQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgJmJf
aW5mby0+aW9tZW1baV0uZ2ZuLCAmdXNlZCk7Ci0gICAgICAgICAgICBpZiAocmV0IDwgMiB8fCBi
dWZbdXNlZF0gIT0gJ1wwJykgeworICAgICAgICAgICAgaWYgKHJldCA8IDIpIHsKICAgICAgICAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwKICAgICAgICAgICAgICAgICAgICAgICAgICJ4bDogSW52
YWxpZCBhcmd1bWVudCBwYXJzaW5nIGlvbWVtOiAlc1xuIiwgYnVmKTsKICAgICAgICAgICAgICAg
ICBleGl0KDEpOwogICAgICAgICAgICAgfQorICAgICAgICAgICAgbWVtcG9saWN5ID0gJmJ1Zlt1
c2VkXTsKKyAgICAgICAgICAgIGlmIChzdHJsZW4obWVtcG9saWN5KSA+IDEpIHsKKyAgICAgICAg
ICAgICAgICBtZW1wb2xpY3krKzsKKyAgICAgICAgICAgICAgICBpZiAoIXN0cmNtcChtZW1wb2xp
Y3ksICJhcm1fZGV2bWVtIikpCisgICAgICAgICAgICAgICAgICAgIGJfaW5mby0+aW9tZW1baV0u
bWVtb3J5X3BvbGljeSA9CisgICAgICAgICAgICAgICAgICAgICAgICBMSUJYTF9NRU1PUllfUE9M
SUNZX0FSTV9ERVZfTkdSRTsKKyAgICAgICAgICAgICAgICBlbHNlIGlmICghc3RyY21wKG1lbXBv
bGljeSwgIng4Nl91YyIpKQorICAgICAgICAgICAgICAgICAgICBiX2luZm8tPmlvbWVtW2ldLm1l
bW9yeV9wb2xpY3kgPQorICAgICAgICAgICAgICAgICAgICAgICAgTElCWExfTUVNT1JZX1BPTElD
WV9YODZfVUM7CisgICAgICAgICAgICAgICAgZWxzZSBpZiAoIXN0cmNtcChtZW1wb2xpY3ksICJh
cm1fbWVtb3J5IikpCisgICAgICAgICAgICAgICAgICAgIGJfaW5mby0+aW9tZW1baV0ubWVtb3J5
X3BvbGljeSA9CisgICAgICAgICAgICAgICAgICAgICAgICBMSUJYTF9NRU1PUllfUE9MSUNZX0FS
TV9NRU1fV0I7CisgICAgICAgICAgICAgICAgZWxzZSB7CisgICAgICAgICAgICAgICAgICAgIGZw
cmludGYoc3RkZXJyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICJ4bDogSW52YWxpZCBp
b21lbSBtZW1vcnkgcG9saWN5IHBhcmFtZXRlcjogJXNcbiIsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbWVtcG9saWN5KTsKKyAgICAgICAgICAgICAgICAgICAgZXhpdCgxKTsKKyAgICAg
ICAgICAgICAgICB9CisgICAgICAgICAgICB9CiAgICAgICAgIH0KICAgICB9CiAKLS0gCjEuOS4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
