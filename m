Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7911F72D
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 17:11:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQvUW-0004Wm-Va; Wed, 15 May 2019 15:06:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YIY1=TP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQvUT-0004Wh-PB
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 15:06:46 +0000
X-Inumbo-ID: 0c3a383b-7723-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0c3a383b-7723-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557932802;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=EI2sv9uL8hwDaaKTspU7HU5tpMumzFYKjCTIIbhN4ws=;
 b=VeS8TYTQmMTNnroYs6wz7C3NcIyPU7eEpBUC8v62HbOILBGciU1mnWPaR9U4t7nNK9
 pQ0A++82Dmj9HVUtfL9EAKgY1Dzko7LOpHRzab1ESr4tawsuCih7vYUcZ87ptlGJ7F7r
 Xa/v7uNrcatog5z0q3qfFIKuEWHl4iGLBLI/NJ0hI9UuMcZSJyS/23Kwf5NhUyFao9gk
 SsKTraa2+IPrnMzGm0rMX9Xq/o/qpl/Up2lUOG+fGoAMu4A3IDrvt2QRO9XL+qvYn0YF
 iW6VDBnAfd/Ilpt6rR30frt5lp4WaoxlnU5jr5bcTxv6KN7QXtSXRZQKFU1bDK+6iEPU
 FkMQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS3GpFjw=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4FF6aBIk
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 15 May 2019 17:06:36 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Date: Wed, 15 May 2019 17:06:32 +0200
Message-Id: <20190515150632.16269-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1] hotplug/Linux: fix starting of xenstored
 with systemd
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
Cc: Wei Liu <wei.liu2@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBoYXJkIHRvIHRyaWdnZXIgcmFjZSB3aXRoIGFub3RoZXIgdW5yZWxhdGVkIHN5c3RlbWQgc2Vy
dmljZSBhbmQKeGVuc3RvcmVkLnNlcnZpY2UgdW52ZWlsZWQgYSBidWcgaW4gdGhlIHdheSBob3cg
eGVuc3RvcmVkIGlzIGxhdW5jaGVkCndpdGggc3lzdGVtZC4KCmxhdW5jaC14ZW5zdG9yZSBtYXkg
c3RhcnQgZWl0aGVyIGEgZGFlbW9uIG9yIGEgZG9tYWluLiBJbiBjYXNlIGEgZG9tYWluCmlzIHVz
ZWQsIHN5c3RlbWQtbm90aWZ5IHdhcyBjYWxsZWQuIElmIGFub3RoZXIgc2VydmljZSB0cmlnZ2Vy
ZWQgYQpyZXN0YXJ0IG9mIHN5c3RlbWQgd2hpbGUgeGVuc3RvcmVkLnNlcnZpY2Ugd2FzIGV4ZWN1
dGVkLCBzeXN0ZW1kIG1heQp0ZW1wb3JhcnkgbG9zZSB0cmFjayBvZiBzZXJ2aWNlcyB3aXRoIFR5
cGU9bm90aWZ5LiBBcyBhIHJlc3VsdCwKeGVuc3RvcmVkLnNlcnZpY2Ugd291bGQgYmUgbWFya2Vk
IGFzIGZhaWxlZCBhbmQgdW5pdHMgdGhhdCBkZXBlbmQgb24gaXQKd2lsbCBub3QgYmUgc3RhcnRl
ZCBhbnltb3JlLiBUaGlzIGJyZWFrcyB0aGUgZW5pcmUgWGVuIHRvb2xzdGFjay4KCkN1cnJlbnRs
eSB0aGUgZGVjaXNpb24gd2hpY2ggdmFyaWFudCBvZiB4ZW5zdG9yZSBzaG91bGQgYmUgdXNlZCBp
cwpjb250cm9sbGVkIHZpYSAvZXRjL3N5c2NvbmZpZy94ZW5jb21tb25zOlhFTlNUT1JFVFlQRT1b
ZG9tYWlufGRhZW1vbl0uClRoaXMgY2hhbmdlIHByZXNlcnZlcyB0aGlzIGZ1bmN0aW9uYWxpdHkg
Zm9yIHRoZSBzeXN2IGFuZCBzeXN0ZW1kLgoKT25lIHdheSB0byBmaXggaXQgaXMgdG8gaGFuZGxl
IHRoZSBkb21haW4gY2FzZSBhcyBUeXBlPW9uZXNob3QgYmVjYXVzZQp0aGVyZSBpcyBub3RoaW5n
IHRvIG1vbml0b3IgZm9yIHN5c3RlbWQuIFRoZSBkYWVtb24gY2FzZSBoYXMgdG8gYmUKaGFuZGxl
ZCBhcyBUeXBlPXNpbXBsZSwgd2hpY2ggaXMgdGhlIGRlZmF1bHQgaWYgbm8gVHlwZT0gaXMgc3Bl
Y2lmaWVkLgpBIHNpbmdsZSB1bml0IGNhbiBoYXZlIGp1c3Qgb25lIHR5cGUsIHNvIGEgbmV3IHVu
aXQgZm9yIHRoZSBkYWVtb24gY2FzZQpoYXMgdG8gYmUgY3JlYXRlZCB0byBwcmVzZXJ2ZSBleGlz
dGluZyBzZXR1cHMgZHVyaW5nIHVwZ3JhZGluZyBvZiBYZW4uClRoaXMgbmV3IHhlbnN0b3JlZC1k
YWVtb24uc2VydmljZSBpcyBzdGFydGVkIG9uIGRlbWFuZCBieSB0aGUgZXhpc3RpbmcKeGVuc3Rv
cmVkLnNlcnZpY2UuIFNpbmNlIGl0IGlzIGEgc2VwYXJhdGUgdW5pdCwgc3lzdGVtZCB3aWxsIHN1
cGVydmlzZQp0aGUgeGVuc3RvcmVkIGRhZW1vbiBpbiBkb20wLgoKbGF1bmNoLXhlbnN0b3JlIGV4
cGVjdHMgbm93IHR3byBhcmd1bWVudHMsIHRoZSB0eXBlIG9mIHRoZSBpbml0CnN5c3RlbSwgYW5k
IHRoZSBvcHRpb25hbCB4ZW5zdG9yZSB0eXBlLiBUaGUgc3lzdGVtZC1ub3RpZnkgY2FsbHMgYXJl
CnJlbW92ZWQgYmVjYXVzZSBzeXN0ZW1kIGRvZXMgbm90IGV4cGVjdCBhbnkgbm90aWZpY2F0aW9u
IHdpdGggdGhlCnVwZGF0ZWQgLnNlcnZpY2UgZmlsZXMuIEluIGNhc2UgdGhlIGluaXQgc3lzdGVt
IGlzIHN5c3RlbWQgdGhlIGRhZW1vbgpvciBpbml0LXhlbnN0b3JlLWRvbWFpbiBpcyBzdGFydGVk
IHZpYSBleGVjIHRvIG1ha2Ugc3VyZSBzeXN0ZW1kCm1vbml0b3JzIHRoZSBwcm9jZXNzIGl0IGhh
cyBqdXN0IGxhdW5jaGVkLiBWYXJpb3VzIHRoaW5ncyBzcGVjaWZpYyB0bwplaXRoZXIgc3lzdiBv
ciBzeXN0ZW1kIGFyZSBub3cgaGFuZGxlZCBzZXBhcmF0ZWx5LgoKVGhlIHN0YXJ0IG9mIHhlbnN0
b3JlZC1kYWVtb24uc2VydmljZSBpbiBsYXVuY2gteGVuc3RvcmUgd2lsbAplc3NlbnRpYWxseSBj
YWxsIHRoaXMgaGVscGVyIHR3aWNlLiBBIHNlcGFyYXRlIGludGVybmFsIHN0YXRlIGlzCmludHJv
ZHVjZWQgdG8gZGVhbCB3aXRoIHRoaXMuIFRoaXMgaXMgcmVxdWlyZWQgdG8gaGFuZGxlIHRoZSB4
ZW5jb21tb25zCmNhc2UgZXhwbGFpbmVkIGFib3ZlLgoKQSBmb2xsb3d1cCBjaGFuZ2Ugd2lsbCBy
ZW1vdmUgdGhlIGNvZGUgd2hpY2ggY2FsbHMgdG8gc2Rfbm90aWZ5LCB0aGV5CmFyZSBub3QgbmVl
ZGVkIGFmdGVyIHRoZSBzZXBhcmF0aW9uIG9mIFR5cGU9b25lc2hvdCBmb3IgZG9tYWluIGFuZApU
eXBlPXNpbXBsZSBmb3IgZGFlbW9uLgoKU2lnbmVkLW9mZi1ieTogT2xhZiBIZXJpbmcgPG9sYWZA
YWVwZmxlLmRlPgotLS0KClRlc3RlZCB3aXRoIHN5c3RlbWQgb24gU0xFMTUuCnN5c3YgY2FzZSB1
bnRlc3RlZCBiZWNhdXNlIHN1cHBvcnQgZm9yIFNMRTExIHdhcyBkcm9wcGVkIGEgd2hpbGUgYWdv
LgoKIHRvb2xzL2NvbmZpZ3VyZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDMgKy0KIHRvb2xzL2NvbmZpZ3VyZS5hYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDEgKwogdG9vbHMvaG90cGx1Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbiAgICAgICAg
ICAgfCAgMiArLQogdG9vbHMvaG90cGx1Zy9MaW51eC9sYXVuY2gteGVuc3RvcmUuaW4gICAgICAg
ICAgICAgfCA2NiArKysrKysrKysrKysrKysrKy0tLS0tCiAuLi4vTGludXgvc3lzdGVtZC94ZW5z
dG9yZWQtZGFlbW9uLnNlcnZpY2UuaW4gICAgICB8IDE3ICsrKysrKwogdG9vbHMvaG90cGx1Zy9M
aW51eC9zeXN0ZW1kL3hlbnN0b3JlZC5zZXJ2aWNlLmluICAgfCAgNSArLQogNiBmaWxlcyBjaGFu
Z2VkLCA3NCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCB0b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuc3RvcmVkLWRhZW1vbi5zZXJ2aWNlLmlu
CgpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmlndXJlIGIvdG9vbHMvY29uZmlndXJlCmluZGV4IDBi
ZTBiZTc1ZGUuLjI2MTJjMTE0OTAgMTAwNzU1Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyZQorKysgYi90
b29scy9jb25maWd1cmUKQEAgLTk3NjEsNyArOTc2MSw3IEBAIGZpCiAKIGlmIHRlc3QgIngkc3lz
dGVtZCIgPSAieHkiOyB0aGVuIDoKIAotICAgIGFjX2NvbmZpZ19maWxlcz0iJGFjX2NvbmZpZ19m
aWxlcyBob3RwbHVnL0xpbnV4L3N5c3RlbWQvcHJvYy14ZW4ubW91bnQgaG90cGx1Zy9MaW51eC9z
eXN0ZW1kL3Zhci1saWIteGVuc3RvcmVkLm1vdW50IGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW4t
aW5pdC1kb20wLnNlcnZpY2UgaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbi1xZW11LWRvbTAtZGlz
ay1iYWNrZW5kLnNlcnZpY2UgaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbi13YXRjaGRvZy5zZXJ2
aWNlIGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5jb25zb2xlZC5zZXJ2aWNlIGhvdHBsdWcvTGlu
dXgvc3lzdGVtZC94ZW5kb21haW5zLnNlcnZpY2UgaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbmRy
aXZlcmRvbWFpbi5zZXJ2aWNlIGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5zdG9yZWQuc2Vydmlj
ZSIKKyAgICBhY19jb25maWdfZmlsZXM9IiRhY19jb25maWdfZmlsZXMgaG90cGx1Zy9MaW51eC9z
eXN0ZW1kL3Byb2MteGVuLm1vdW50IGhvdHBsdWcvTGludXgvc3lzdGVtZC92YXItbGliLXhlbnN0
b3JlZC5tb3VudCBob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuLWluaXQtZG9tMC5zZXJ2aWNlIGhv
dHBsdWcvTGludXgvc3lzdGVtZC94ZW4tcWVtdS1kb20wLWRpc2stYmFja2VuZC5zZXJ2aWNlIGhv
dHBsdWcvTGludXgvc3lzdGVtZC94ZW4td2F0Y2hkb2cuc2VydmljZSBob3RwbHVnL0xpbnV4L3N5
c3RlbWQveGVuY29uc29sZWQuc2VydmljZSBob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuZG9tYWlu
cy5zZXJ2aWNlIGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5kcml2ZXJkb21haW4uc2VydmljZSBo
b3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuc3RvcmVkLnNlcnZpY2UgaG90cGx1Zy9MaW51eC9zeXN0
ZW1kL3hlbnN0b3JlZC1kYWVtb24uc2VydmljZSIKIAogCiBmaQpAQCAtMTA1MTYsNiArMTA1MTYs
NyBAQCBkbwogICAgICJob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuZG9tYWlucy5zZXJ2aWNlIikg
Q09ORklHX0ZJTEVTPSIkQ09ORklHX0ZJTEVTIGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5kb21h
aW5zLnNlcnZpY2UiIDs7CiAgICAgImhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5kcml2ZXJkb21h
aW4uc2VydmljZSIpIENPTkZJR19GSUxFUz0iJENPTkZJR19GSUxFUyBob3RwbHVnL0xpbnV4L3N5
c3RlbWQveGVuZHJpdmVyZG9tYWluLnNlcnZpY2UiIDs7CiAgICAgImhvdHBsdWcvTGludXgvc3lz
dGVtZC94ZW5zdG9yZWQuc2VydmljZSIpIENPTkZJR19GSUxFUz0iJENPTkZJR19GSUxFUyBob3Rw
bHVnL0xpbnV4L3N5c3RlbWQveGVuc3RvcmVkLnNlcnZpY2UiIDs7CisgICAgImhvdHBsdWcvTGlu
dXgvc3lzdGVtZC94ZW5zdG9yZWQtZGFlbW9uLnNlcnZpY2UiKSBDT05GSUdfRklMRVM9IiRDT05G
SUdfRklMRVMgaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbnN0b3JlZC1kYWVtb24uc2VydmljZSIg
OzsKIAogICAqKSBhc19mbl9lcnJvciAkPyAiaW52YWxpZCBhcmd1bWVudDogXGAkYWNfY29uZmln
X3RhcmdldCciICIkTElORU5PIiA1OzsKICAgZXNhYwpkaWZmIC0tZ2l0IGEvdG9vbHMvY29uZmln
dXJlLmFjIGIvdG9vbHMvY29uZmlndXJlLmFjCmluZGV4IGZjZjI4MmU3NGUuLmM2MWEzMjdkNzMg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL2NvbmZpZ3VyZS5hYworKysgYi90b29scy9jb25maWd1cmUuYWMK
QEAgLTQ4MSw2ICs0ODEsNyBAQCBBU19JRihbdGVzdCAieCRzeXN0ZW1kIiA9ICJ4eSJdLCBbCiAg
ICAgaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbmRvbWFpbnMuc2VydmljZQogICAgIGhvdHBsdWcv
TGludXgvc3lzdGVtZC94ZW5kcml2ZXJkb21haW4uc2VydmljZQogICAgIGhvdHBsdWcvTGludXgv
c3lzdGVtZC94ZW5zdG9yZWQuc2VydmljZQorICAgIGhvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5z
dG9yZWQtZGFlbW9uLnNlcnZpY2UKICAgICBdKQogXSkKIApkaWZmIC0tZ2l0IGEvdG9vbHMvaG90
cGx1Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbiBiL3Rvb2xzL2hvdHBsdWcvTGludXgvaW5p
dC5kL3hlbmNvbW1vbnMuaW4KaW5kZXggN2ZkNjkwM2I5OC4uZTVhOTEzNTBhMiAxMDA2NDQKLS0t
IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9pbml0LmQveGVuY29tbW9ucy5pbgorKysgYi90b29scy9o
b3RwbHVnL0xpbnV4L2luaXQuZC94ZW5jb21tb25zLmluCkBAIC02MCw3ICs2MCw3IEBAIGRvX3N0
YXJ0ICgpIHsKIAlta2RpciAtbTcwMCAtcCAke1hFTl9MT0NLX0RJUn0KIAlta2RpciAtcCAke1hF
Tl9MT0dfRElSfQogCi0JQFhFTl9TQ1JJUFRfRElSQC9sYXVuY2gteGVuc3RvcmUgfHwgZXhpdCAx
CisJQFhFTl9TQ1JJUFRfRElSQC9sYXVuY2gteGVuc3RvcmUgJ3N5c3YnICIke1hFTlNUT1JFVFlQ
RX0iIHx8IGV4aXQgMQogCiAJZWNobyBTZXR0aW5nIGRvbWFpbiAwIG5hbWUsIGRvbWlkIGFuZCBK
U09OIGNvbmZpZy4uLgogCSR7TElCRVhFQ19CSU59L3hlbi1pbml0LWRvbTAgJHtYRU5fRE9NMF9V
VUlEfQpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9sYXVuY2gteGVuc3RvcmUuaW4g
Yi90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbgppbmRleCA5OTFkZWM4ZDI1
Li5lOTdlMzM5NDgxIDEwMDY0NAotLS0gYS90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5z
dG9yZS5pbgorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbgpAQCAt
MTUsNiArMTUsMjYgQEAKICMgTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgbGlicmFyeTsgSWYgbm90
LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgogIwogCitpbml0ZD0kMQoreGVu
c3RvcmVfdHlwZT0kMgorbWF5YmVfZXhlYz0KKworY2FzZSAiJGluaXRkIiBpbgorCXN5c3YpIDs7
CisJc3lzdGVtZCkgbWF5YmVfZXhlYz0nZXhlYycgOzsKKwkqKQorCWVjaG8gImZpcnN0IGFyZ3Vt
ZW50IG11c3QgYmUgJ3N5c3YnIG9yICdzeXN0ZW1kJyIKKwlleGl0IDEKKwk7OworZXNhYworY2Fz
ZSAiJHhlbnN0b3JlX3R5cGUiIGluCisJIiJ8ZGFlbW9ufGRvbWFpbnxzdXBlcnZpc2VkLWJ5LXN5
c3RlbWQpIDs7CisJKikKKwllY2hvICJzZWNvbmQgYXJndW1lbnQgbXVzdCBiZSBvbmUgb2YgJ2Rh
ZW1vbicsICAnZG9tYWluJywgJ3N1cGVydmlzZWQtYnktc3lzdGVtZCcsIG9yIGVtcHR5IgorCWV4
aXQgMQorCTs7Citlc2FjCisKIFhFTlNUT1JFRD1AWEVOU1RPUkVEQAogCiAuIEBYRU5fU0NSSVBU
X0RJUkAvaG90cGx1Z3BhdGguc2gKQEAgLTQ0LDE1ICs2NCw3IEBAIHRpbWVvdXRfeGVuc3RvcmUg
KCkgewogCXJldHVybiAwCiB9CiAKLXRlc3RfeGVuc3RvcmUgJiYgZXhpdCAwCi0KLXRlc3QgLWYg
QENPTkZJR19ESVJAL0BDT05GSUdfTEVBRl9ESVJAL3hlbmNvbW1vbnMgJiYgLiBAQ09ORklHX0RJ
UkAvQENPTkZJR19MRUFGX0RJUkAveGVuY29tbW9ucwotCi1bICIkWEVOU1RPUkVUWVBFIiA9ICIi
IF0gJiYgWEVOU1RPUkVUWVBFPWRhZW1vbgotCi0vYmluL21rZGlyIC1wIEBYRU5fUlVOX0RJUkAK
LQotWyAiJFhFTlNUT1JFVFlQRSIgPSAiZGFlbW9uIiBdICYmIHsKK3J1bl94ZW5zdG9yZWQgKCkg
ewogCVsgLXogIiRYRU5TVE9SRURfUk9PVERJUiIgXSAmJiBYRU5TVE9SRURfUk9PVERJUj0iQFhF
Tl9MSUJfU1RPUkVEQCIKIAlbIC16ICIkWEVOU1RPUkVEX1RSQUNFIiBdIHx8IFhFTlNUT1JFRF9B
UkdTPSIkWEVOU1RPUkVEX0FSR1MgLVQgQFhFTl9MT0dfRElSQC94ZW5zdG9yZWQtdHJhY2UubG9n
IgogCVsgLXogIiRYRU5TVE9SRUQiIF0gJiYgWEVOU1RPUkVEPUBYRU5TVE9SRURACkBAIC02MSwx
NSArNzMsNDAgQEAgdGVzdCAtZiBAQ09ORklHX0RJUkAvQENPTkZJR19MRUFGX0RJUkAveGVuY29t
bW9ucyAmJiAuIEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUYKIAkJZXhpdCAxCiAJfQogCi0JZWNo
byAtbiBTdGFydGluZyAkWEVOU1RPUkVELi4uCi0JJFhFTlNUT1JFRCAtLXBpZC1maWxlIEBYRU5f
UlVOX0RJUkAveGVuc3RvcmVkLnBpZCAkWEVOU1RPUkVEX0FSR1MKKwkke21heWJlX2V4ZWN9ICRY
RU5TVE9SRUQgLS1waWQtZmlsZSBAWEVOX1JVTl9ESVJAL3hlbnN0b3JlZC5waWQgJFhFTlNUT1JF
RF9BUkdTCit9CisKK2lmIHRlc3QgIiRpbml0ZCIgPSAnc3lzdicgOyB0aGVuCisJdGVzdF94ZW5z
dG9yZSAmJiBleGl0IDAKK2ZpCiAKLQlzeXN0ZW1kLW5vdGlmeSAtLWJvb3RlZCAyPi9kZXYvbnVs
bCB8fCB0aW1lb3V0X3hlbnN0b3JlICRYRU5TVE9SRUQgfHwgZXhpdCAxCit0ZXN0IC1mIEBDT05G
SUdfRElSQC9AQ09ORklHX0xFQUZfRElSQC94ZW5jb21tb25zICYmIC4gQENPTkZJR19ESVJAL0BD
T05GSUdfTEVBRl9ESVJAL3hlbmNvbW1vbnMKKworWyAiJFhFTlNUT1JFVFlQRSIgPSAiIiBdICYm
IFhFTlNUT1JFVFlQRT1kYWVtb24KK1sgIiR4ZW5zdG9yZV90eXBlIiA9ICIiIF0gJiYgeGVuc3Rv
cmVfdHlwZT0iJFhFTlNUT1JFVFlQRSIKKworL2Jpbi9ta2RpciAtcCBAWEVOX1JVTl9ESVJACisK
K1sgIiR4ZW5zdG9yZV90eXBlIiA9ICJzdXBlcnZpc2VkLWJ5LXN5c3RlbWQiIF0gJiYgeworCVhF
TlNUT1JFRF9BUkdTPSIkWEVOU1RPUkVEX0FSR1MgLU4iCisJcnVuX3hlbnN0b3JlZAorCWV4aXQg
MQorfQorCitbICIkeGVuc3RvcmVfdHlwZSIgPSAiZGFlbW9uIiBdICYmIHsKKworCWlmIHRlc3Qg
IiRpbml0ZCIgPSAnc3lzdicgOyB0aGVuCisJCWVjaG8gLW4gU3RhcnRpbmcgJFhFTlNUT1JFRC4u
LgorCQlydW5feGVuc3RvcmVkCisJCXRpbWVvdXRfeGVuc3RvcmUgJFhFTlNUT1JFRCB8fCBleGl0
IDEKKwllbHNlCisJCXN5c3RlbWN0bCBzdGFydCB4ZW5zdG9yZWQtZGFlbW9uLnNlcnZpY2UKKwlm
aQogCiAJZXhpdCAwCiB9CiAKLVsgIiRYRU5TVE9SRVRZUEUiID0gImRvbWFpbiIgXSAmJiB7Citb
ICIkeGVuc3RvcmVfdHlwZSIgPSAiZG9tYWluIiBdICYmIHsKIAlbIC16ICIkWEVOU1RPUkVfRE9N
QUlOX0tFUk5FTCIgXSAmJiBYRU5TVE9SRV9ET01BSU5fS0VSTkVMPUBMSUJFWEVDQC9ib290L3hl
bnN0b3JlLXN0dWJkb20uZ3oKIAlYRU5TVE9SRV9ET01BSU5fQVJHUz0iJFhFTlNUT1JFX0RPTUFJ
Tl9BUkdTIC0ta2VybmVsICRYRU5TVE9SRV9ET01BSU5fS0VSTkVMIgogCVsgLXogIiRYRU5TVE9S
RV9ET01BSU5fU0laRSIgXSAmJiBYRU5TVE9SRV9ET01BSU5fU0laRT04CkBAIC03Nyw4ICsxMTQs
NyBAQCB0ZXN0IC1mIEBDT05GSUdfRElSQC9AQ09ORklHX0xFQUZfRElSQC94ZW5jb21tb25zICYm
IC4gQENPTkZJR19ESVJAL0BDT05GSUdfTEVBRgogCVsgLXogIiRYRU5TVE9SRV9NQVhfRE9NQUlO
X1NJWkUiIF0gfHwgWEVOU1RPUkVfRE9NQUlOX0FSR1M9IiRYRU5TVE9SRV9ET01BSU5fQVJHUyAt
LW1heG1lbSAkWEVOU1RPUkVfTUFYX0RPTUFJTl9TSVpFIgogCiAJZWNobyAtbiBTdGFydGluZyAk
WEVOU1RPUkVfRE9NQUlOX0tFUk5FTC4uLgotCSR7TElCRVhFQ19CSU59L2luaXQteGVuc3RvcmUt
ZG9tYWluICRYRU5TVE9SRV9ET01BSU5fQVJHUyB8fCBleGl0IDEKLQlzeXN0ZW1kLW5vdGlmeSAt
LXJlYWR5IDI+L2Rldi9udWxsCisJJHttYXliZV9leGVjfSAke0xJQkVYRUNfQklOfS9pbml0LXhl
bnN0b3JlLWRvbWFpbiAkWEVOU1RPUkVfRE9NQUlOX0FSR1MgfHwgZXhpdCAxCiAKIAlleGl0IDAK
IH0KZGlmZiAtLWdpdCBhL3Rvb2xzL2hvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5zdG9yZWQtZGFl
bW9uLnNlcnZpY2UuaW4gYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuc3RvcmVkLWRh
ZW1vbi5zZXJ2aWNlLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjUx
NThkZjMwNGIKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQv
eGVuc3RvcmVkLWRhZW1vbi5zZXJ2aWNlLmluCkBAIC0wLDAgKzEsMTcgQEAKK1tVbml0XQorRGVz
Y3JpcHRpb249VGhlIHhlbnN0b3JlIGRhZW1vbiBpbiBkb20wCitSZXF1aXJlcz1wcm9jLXhlbi5t
b3VudCB2YXItbGliLXhlbnN0b3JlZC5tb3VudAorQWZ0ZXI9cHJvYy14ZW4ubW91bnQgdmFyLWxp
Yi14ZW5zdG9yZWQubW91bnQKK0JlZm9yZT1saWJ2aXJ0ZC5zZXJ2aWNlIGxpYnZpcnQtZ3Vlc3Rz
LnNlcnZpY2UKK1JlZnVzZU1hbnVhbFN0b3A9dHJ1ZQorQ29uZGl0aW9uUGF0aEV4aXN0cz0vcHJv
Yy94ZW4vY2FwYWJpbGl0aWVzCisKK1tTZXJ2aWNlXQorUElERmlsZT1AWEVOX1JVTl9ESVJAL3hl
bnN0b3JlZC5waWQKK0V4ZWNTdGFydFByZT0vYmluL2dyZXAgLXEgY29udHJvbF9kIC9wcm9jL3hl
bi9jYXBhYmlsaXRpZXMKK0V4ZWNTdGFydD1AWEVOX1NDUklQVF9ESVJAL2xhdW5jaC14ZW5zdG9y
ZSAnc3lzdGVtZCcgJ3N1cGVydmlzZWQtYnktc3lzdGVtZCcKKworW0luc3RhbGxdCitXYW50ZWRC
eT1tdWx0aS11c2VyLnRhcmdldAorQWxzbz1wcm9jLXhlbi5tb3VudAorQWxzbz12YXItbGliLXhl
bnN0b3JlZC5tb3VudApkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hl
bnN0b3JlZC5zZXJ2aWNlLmluIGIvdG9vbHMvaG90cGx1Zy9MaW51eC9zeXN0ZW1kL3hlbnN0b3Jl
ZC5zZXJ2aWNlLmluCmluZGV4IDgwYzFkNDA4YTUuLjI2OGUzMzM5OWIgMTAwNjQ0Ci0tLSBhL3Rv
b2xzL2hvdHBsdWcvTGludXgvc3lzdGVtZC94ZW5zdG9yZWQuc2VydmljZS5pbgorKysgYi90b29s
cy9ob3RwbHVnL0xpbnV4L3N5c3RlbWQveGVuc3RvcmVkLnNlcnZpY2UuaW4KQEAgLTcsMTEgKzcs
MTAgQEAgUmVmdXNlTWFudWFsU3RvcD10cnVlCiBDb25kaXRpb25QYXRoRXhpc3RzPS9wcm9jL3hl
bi9jYXBhYmlsaXRpZXMKIAogW1NlcnZpY2VdCi1UeXBlPW5vdGlmeQotTm90aWZ5QWNjZXNzPWFs
bAorVHlwZT1vbmVzaG90CiBSZW1haW5BZnRlckV4aXQ9dHJ1ZQogRXhlY1N0YXJ0UHJlPS9iaW4v
Z3JlcCAtcSBjb250cm9sX2QgL3Byb2MveGVuL2NhcGFiaWxpdGllcwotRXhlY1N0YXJ0PUBYRU5f
U0NSSVBUX0RJUkAvbGF1bmNoLXhlbnN0b3JlCitFeGVjU3RhcnQ9QFhFTl9TQ1JJUFRfRElSQC9s
YXVuY2gteGVuc3RvcmUgJ3N5c3RlbWQnICcnCiAKIFtJbnN0YWxsXQogV2FudGVkQnk9bXVsdGkt
dXNlci50YXJnZXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
