Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA802B1D0B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 15:21:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26515.54929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdZwl-0000W4-SS; Fri, 13 Nov 2020 14:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26515.54929; Fri, 13 Nov 2020 14:21:03 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdZwl-0000Vf-Ox; Fri, 13 Nov 2020 14:21:03 +0000
Received: by outflank-mailman (input) for mailman id 26515;
 Fri, 13 Nov 2020 14:19:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
 id 1kdZvA-0008EU-NP
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:19:25 +0000
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21da5738-23df-4304-a15c-d31f7b61fd64;
 Fri, 13 Nov 2020 14:19:23 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 13 Nov 2020 14:19:01 +0000
Received: from EX13D37EUB004.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id F3D6BA0819; Fri, 13 Nov 2020 14:19:00 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D37EUB004.ant.amazon.com (10.43.166.187) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Nov 2020 14:18:59 +0000
Received: from dev-dsk-doebel-2a-b41c32f5.us-west-2.amazon.com (172.19.225.92)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 13 Nov 2020 14:18:58 +0000
Received: by dev-dsk-doebel-2a-b41c32f5.us-west-2.amazon.com (Postfix,
 from userid 3160037)
 id 1FE8EA27B6; Fri, 13 Nov 2020 14:18:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
	id 1kdZvA-0008EU-NP
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 14:19:25 +0000
X-Inumbo-ID: 21da5738-23df-4304-a15c-d31f7b61fd64
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 21da5738-23df-4304-a15c-d31f7b61fd64;
	Fri, 13 Nov 2020 14:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1605277163; x=1636813163;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uEC5EXOc4YcDJzP4U01LmoW19H30dbThY1jdb+RYew8=;
  b=rG5BmM2/12ebjmGn0qKQtjHPY3qSIbT8sydr905NI8H8upBsgWq+GNqY
   SdQpZ9iWwx/X2J4N5M082D9c5CPFAFHmKSvSfOUuEzxX9YiJlot7NBK1l
   4nvbhDCzTZjoxmapaEsMiu6rT/Ytei4VA+E5z3Vo9PLLcXOMDLfMnda1Z
   c=;
X-IronPort-AV: E=Sophos;i="5.77,475,1596499200"; 
   d="scan'208";a="64882752"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP; 13 Nov 2020 14:19:01 +0000
Received: from EX13D37EUB004.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS id F3D6BA0819;
	Fri, 13 Nov 2020 14:19:00 +0000 (UTC)
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D37EUB004.ant.amazon.com (10.43.166.187) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 13 Nov 2020 14:18:59 +0000
Received: from dev-dsk-doebel-2a-b41c32f5.us-west-2.amazon.com (172.19.225.92)
 by mail-relay.amazon.com (10.43.61.243) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 13 Nov 2020 14:18:58 +0000
Received: by dev-dsk-doebel-2a-b41c32f5.us-west-2.amazon.com (Postfix, from userid 3160037)
	id 1FE8EA27B6; Fri, 13 Nov 2020 14:18:57 +0000 (UTC)
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Bjoern Doebel <doebel@amazon.de>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
Date: Fri, 13 Nov 2020 14:18:23 +0000
Message-ID: <20201113141823.58712-1-doebel@amazon.de>
X-Mailer: git-send-email 2.16.6
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmlnaHQgbm93IHdlIGRvIG5vdCBoYXZlIGEgbWVjaGFuaXNtIHRvIGRldGVybWluZSB0aGUgdmVy
c2lvbiBvZiB0aGUKY3VycmVudGx5IHJ1bm5pbmcgeGVuc3RvcmVkIGF0IHJ1bnRpbWUuIEFzIHhl
bnN0b3JlZCBydW5zIHRocm91Z2hvdXQgdGhlCmxpZmV0aW1lIG9mIGEgWGVuIGhvc3QsIHRoaXMg
bWF5IGxlYWQgdG8gcHJvYmxlbXMgd2hlbiBuZXdlciB1c2VyIHNwYWNlCmJ1aWxkcyBhcmUgc3Rh
Z2VkLiBUaGVuLCB0aGUgcnVubmluZyB4ZW5zdG9yZWQgd2lsbCBubyBsb25nZXIgbWF0Y2ggdGhl
CnZlcnNpb24gb2YgdGhlIGluc3RhbGxlZCB4ZW5zdG9yZWQuCgpUbyBhbGxvdyB1c2VycyB0byBh
bHdheXMgaWRlbnRpZnkgdGhlIHJ1bm5pbmcgdmVyc2lvbiBvZiB4ZW5zdG9yZWQsIGFkZAphIGxp
bmtlci1nZW5lcmF0ZWQgdW5pcXVlIGJ1aWxkIElEIHRvIGV2ZXJ5IHhlbnN0b3JlZCBidWlsZC4g
QWRkCmZ1bmN0aW9uYWxpdHkgdG8gbG9nIHRoaXMgYnVpbGQgSUQgaW50byBhIGZpbGUgdXBvbiBz
ZXJ2aWNlIHN0YXJ0dXAuCgpTaWduZWQtb2ZmLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1h
em9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1hemVpbkBhbWF6b24uZGU+ClJl
dmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jby51az4KLS0tCiB0b29s
cy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbiB8ICAyICstCiB0b29scy94ZW5zdG9y
ZS9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICA0ICsrKwogdG9vbHMveGVuc3RvcmUvYnVpbGRp
ZF9zeW1ib2xzLmxkICAgICAgfCAxMCArKysrKysrCiB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRf
Y29yZS5jICAgICAgICB8ICA4ICsrKysrKwogdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUu
aCAgICAgICAgfCAgMyArKwogdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX21pbmlvcy5jICAgICAg
fCAgNCArKysKIHRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9wb3NpeC5jICAgICAgIHwgNTIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogNyBmaWxlcyBjaGFuZ2VkLCA4MiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMveGVuc3Rv
cmUvYnVpbGRpZF9zeW1ib2xzLmxkCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaG90cGx1Zy9MaW51eC9s
YXVuY2gteGVuc3RvcmUuaW4gYi90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5p
bgppbmRleCA5OTFkZWM4ZDI1Li5hNmYyMjU0MDMwIDEwMDY0NAotLS0gYS90b29scy9ob3RwbHVn
L0xpbnV4L2xhdW5jaC14ZW5zdG9yZS5pbgorKysgYi90b29scy9ob3RwbHVnL0xpbnV4L2xhdW5j
aC14ZW5zdG9yZS5pbgpAQCAtNjIsNyArNjIsNyBAQCB0ZXN0IC1mIEBDT05GSUdfRElSQC9AQ09O
RklHX0xFQUZfRElSQC94ZW5jb21tb25zICYmIC4gQENPTkZJR19ESVJAL0BDT05GSUdfTEVBRgog
CX0KIAogCWVjaG8gLW4gU3RhcnRpbmcgJFhFTlNUT1JFRC4uLgotCSRYRU5TVE9SRUQgLS1waWQt
ZmlsZSBAWEVOX1JVTl9ESVJAL3hlbnN0b3JlZC5waWQgJFhFTlNUT1JFRF9BUkdTCisJJFhFTlNU
T1JFRCAtLXBpZC1maWxlIEBYRU5fUlVOX0RJUkAveGVuc3RvcmVkLnBpZCAtLWJ1aWxkaWQtZmls
ZSBAWEVOX1JVTl9ESVJAL3hlbnN0b3JlZC5idWlsZGlkICRYRU5TVE9SRURfQVJHUwogCiAJc3lz
dGVtZC1ub3RpZnkgLS1ib290ZWQgMj4vZGV2L251bGwgfHwgdGltZW91dF94ZW5zdG9yZSAkWEVO
U1RPUkVEIHx8IGV4aXQgMQogCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS9NYWtlZmlsZSBi
L3Rvb2xzL3hlbnN0b3JlL01ha2VmaWxlCmluZGV4IDlhMGYwZDAxMmQuLmM2MzM1MDk4MGIgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL01ha2VmaWxlCisrKyBiL3Rvb2xzL3hlbnN0b3JlL01h
a2VmaWxlCkBAIC02Niw2ICs2NiwxMCBAQCAkKFhFTlNUT1JFRF9PQkpTKTogQ0ZMQUdTICs9ICQo
U1lTVEVNRF9DRkxBR1MpCiB4ZW5zdG9yZWQ6IExERkxBR1MgKz0gJChTWVNURU1EX0xJQlMpCiBl
bmRpZgogCisjIHhlbnN0b3JlZDogZW5mb3JjZSBjcmVhdGlvbiBvZiBhIGJ1aWxkSUQgc2VjdGlv
biBhbmQgdXNlIGEgbGlua2VyCisjIHNjcmlwdCB0byBhZGQgYWRkaXRpb25hbCBzeW1ib2xzIGFy
b3VuZCB0aGF0IHNlY3Rpb24KK3hlbnN0b3JlZDogTERGTEFHUyArPSAgLVdsLC0tYnVpbGQtaWQ9
c2hhMSAtV2wsLVQsYnVpbGRpZF9zeW1ib2xzLmxkCisKICQoWEVOU1RPUkVEX09CSlMpOiBDRkxB
R1MgKz0gJChDRkxBR1NfbGlieGVuZ250dGFiKQogCiB4ZW5zdG9yZWQ6ICQoWEVOU1RPUkVEX09C
SlMpCmRpZmYgLS1naXQgYS90b29scy94ZW5zdG9yZS9idWlsZGlkX3N5bWJvbHMubGQgYi90b29s
cy94ZW5zdG9yZS9idWlsZGlkX3N5bWJvbHMubGQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uZDc0MDI0YzRlOQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL3hlbnN0b3Jl
L2J1aWxkaWRfc3ltYm9scy5sZApAQCAtMCwwICsxLDEwIEBACitTRUNUSU9OUworeworICAgICAg
IF9fYnVpbGRpZF9ub3RlX3NlY3Rpb24gPSAuIDsKKyAgICAgICAubm90ZS5nbnUuYnVpbGQtaWQg
OgorICAgICAgIHsKKyAgICAgICAgICAgICAgICooLm5vdGUuZ251LmJ1aWxkLWlkKQorICAgICAg
IH0KKyAgICAgICBfX2J1aWxkaWRfZW5kID0gLiA7Cit9CitJTlNFUlQgQUZURVIgLmRhdGEKZGlm
ZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jCmluZGV4IGI0YmUzNzRkM2YuLmM2ZjEwN2JkZDkgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMKKysrIGIvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2NvcmUuYwpAQCAtMTg0NCw2ICsxODQ0LDcgQEAgc3RhdGljIHZvaWQgdXNhZ2Uo
dm9pZCkKIAogCiBzdGF0aWMgc3RydWN0IG9wdGlvbiBvcHRpb25zW10gPSB7CisJeyAiYnVpbGRp
ZC1maWxlIiwgMSwgTlVMTCwgJ0InIH0sCiAJeyAibm8tZG9tYWluLWluaXQiLCAwLCBOVUxMLCAn
RCcgfSwKIAl7ICJlbnRyeS1uYiIsIDEsIE5VTEwsICdFJyB9LAogCXsgInBpZC1maWxlIiwgMSwg
TlVMTCwgJ0YnIH0sCkBAIC0xODc1LDEyICsxODc2LDE2IEBAIGludCBtYWluKGludCBhcmdjLCBj
aGFyICphcmd2W10pCiAJYm9vbCBvdXRwdXRwaWQgPSBmYWxzZTsKIAlib29sIG5vX2RvbWFpbl9p
bml0ID0gZmFsc2U7CiAJY29uc3QgY2hhciAqcGlkZmlsZSA9IE5VTEw7CisJY29uc3QgY2hhciAq
YnVpbGRpZF9maWxlID0gTlVMTDsKIAlpbnQgdGltZW91dDsKIAogCiAJd2hpbGUgKChvcHQgPSBn
ZXRvcHRfbG9uZyhhcmdjLCBhcmd2LCAiREU6RjpITlBTOnQ6VDpSVlc6Iiwgb3B0aW9ucywKIAkJ
CQkgIE5VTEwpKSAhPSAtMSkgewogCQlzd2l0Y2ggKG9wdCkgeworCQljYXNlICdCJzoKKwkJCWJ1
aWxkaWRfZmlsZSA9IG9wdGFyZzsKKwkJCWJyZWFrOwogCQljYXNlICdEJzoKIAkJCW5vX2RvbWFp
bl9pbml0ID0gdHJ1ZTsKIAkJCWJyZWFrOwpAQCAtMTk0OCw2ICsxOTUzLDkgQEAgaW50IG1haW4o
aW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIAlpZiAocGlkZmlsZSkKIAkJd3JpdGVfcGlkZmlsZShw
aWRmaWxlKTsKIAorCWlmIChidWlsZGlkX2ZpbGUpCisJCXdyaXRlX2J1aWxkaWRfZmlsZShidWls
ZGlkX2ZpbGUpOworCiAJLyogVGFsbG9jIGxlYWsgcmVwb3J0cyBnbyB0byBzdGRlcnIsIHdoaWNo
IGlzIGNsb3NlZCBpZiB3ZSBmb3JrLiAqLwogCWlmICghZG9mb3JrKQogCQl0YWxsb2NfZW5hYmxl
X2xlYWtfcmVwb3J0X2Z1bGwoKTsKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmggYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5oCmluZGV4IDFkZjZhZDk0
YWIuLjcxMjI4MDYyNmMgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3Jl
LmgKKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuaApAQCAtMTkzLDYgKzE5Myw5
IEBAIHZvaWQgeGVuYnVzX25vdGlmeV9ydW5uaW5nKHZvaWQpOwogLyogV3JpdGUgb3V0IHRoZSBw
aWRmaWxlICovCiB2b2lkIHdyaXRlX3BpZGZpbGUoY29uc3QgY2hhciAqcGlkZmlsZSk7CiAKKy8q
IFdyaXRlIHRoZSBidWlsZGlkIGZpbGUgKi8KK3ZvaWQgd3JpdGVfYnVpbGRpZF9maWxlKGNvbnN0
IGNoYXIgKmJ1aWxkaWRmaWxlKTsKKwogLyogRm9yayBidXQgZG8gbm90IGNsb3NlIHRlcm1pbmFs
IEZEcyAqLwogdm9pZCBkYWVtb25pemUodm9pZCk7CiAvKiBDbG9zZSBzdGRpbi9zdGRvdXQvc3Rk
ZXJyIHRvIGNvbXBsZXRlIGRhZW1vbml6ZSAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX21pbmlvcy5jIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX21pbmlvcy5jCmlu
ZGV4IGM5NDQ5M2U1MmEuLmVmMTE1MWFlZTQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hlbnN0b3JlL3hl
bnN0b3JlZF9taW5pb3MuYworKysgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfbWluaW9zLmMK
QEAgLTI0LDYgKzI0LDEwIEBAIHZvaWQgd3JpdGVfcGlkZmlsZShjb25zdCBjaGFyICpwaWRmaWxl
KQogewogfQogCit2b2lkIHdyaXRlX2J1aWxkaWRfZmlsZShjb25zdCBjaGFyICpidWlsZGlkX2Zp
bGUpCit7Cit9CisKIHZvaWQgZGFlbW9uaXplKHZvaWQpCiB7CiB9CmRpZmYgLS1naXQgYS90b29s
cy94ZW5zdG9yZS94ZW5zdG9yZWRfcG9zaXguYyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9w
b3NpeC5jCmluZGV4IDFmOTYwM2ZlYTIuLmVjMDE3NjExZDYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3hl
bnN0b3JlL3hlbnN0b3JlZF9wb3NpeC5jCisrKyBiL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9w
b3NpeC5jCkBAIC0yMCw2ICsyMCw3IEBACiAjaW5jbHVkZSA8c3lzL3N0YXQuaD4KICNpbmNsdWRl
IDx1bmlzdGQuaD4KICNpbmNsdWRlIDxmY250bC5oPgorI2luY2x1ZGUgPHN0ZGludC5oPgogI2lu
Y2x1ZGUgPHN0ZGxpYi5oPgogI2luY2x1ZGUgPHN5cy9tbWFuLmg+CiAKQEAgLTQ4LDYgKzQ5LDU3
IEBAIHZvaWQgd3JpdGVfcGlkZmlsZShjb25zdCBjaGFyICpwaWRmaWxlKQogCWNsb3NlKGZkKTsK
IH0KIAorLyoKKyAqIFdlIGRvbid0IGhhdmUgYSB3b3JraW5nIGVsZi5oIGF2YWlsYWJsZSBoZXJl
LCBzbyBsZXQncyBkZWZpbmUgb3VyIHZlcnkgb3duCisgKiBkYXRhIHN0cnVjdHMgYW5kIGFjY2Vz
c29yIG1hY3JvcyBmb3IgRUxGIG5vdGVzLgorICoKKyAqIGh0dHBzOi8vZG9jcy5vcmFjbGUuY29t
L2NkL0UyMzgyNF8wMS9odG1sLzgxOS0wNjkwL2NoYXB0ZXI2LTE4MDQ4Lmh0bWw6CisgKiBGb3Ig
NjTigJNiaXQgb2JqZWN0cyBhbmQgMzLigJNiaXQgb2JqZWN0cywgZWFjaCBlbnRyeSBpcyBhbiBh
cnJheSBvZiA0LWJ5dGUKKyAqIHdvcmRzIGluIHRoZSBmb3JtYXQgb2YgdGhlIHRhcmdldCBwcm9j
ZXNzb3IuCisgKi8KK3R5cGVkZWYgc3RydWN0Cit7CisJdWludDMyX3QgbmFtZXN6OworCXVpbnQz
Ml90IGRlc2NzejsKKwl1aW50MzJfdCB0eXBlOworfSBlbGZfbm90ZV9oZHI7CisKKy8qIEVMRiBO
b3RlIGFjY2Vzc29ycywgY29waWVkIGZyb20gWGVuJ3MgZWxmLmggKi8KKyNkZWZpbmUgRUxGTk9U
RV9BTElHTihfbl8pICgoKF9uXykrMykmfjMpCisjZGVmaW5lIEVMRk5PVEVfTkFNRShfbl8pICgo
Y2hhciopKF9uXykgKyBzaXplb2YoKihfbl8pKSkKKyNkZWZpbmUgRUxGTk9URV9ERVNDKF9uXykg
KEVMRk5PVEVfTkFNRShfbl8pICsgRUxGTk9URV9BTElHTigoX25fKS0+bmFtZXN6KSkKKy8qIEdO
VSBMRDogdHlwZSA9PSBub3RlIChOVF9HTlVfQlVJTERfSUQgYXMgaW4KKyAqIGh0dHBzOi8vc291
cmNld2FyZS5vcmcvbWwvYmludXRpbHMvMjAwNy0wNy9tc2cwMDAxMi5odG1sKSovCisjZGVmaW5l
IE5UX0dOVV9CVUlMRF9JRCAzCisKKwordm9pZCB3cml0ZV9idWlsZGlkX2ZpbGUoY29uc3QgY2hh
ciAqYnVpbGRpZF9maWxlKQoreworCXVuc2lnbmVkIGludCBpID0gMDsKKwlGSUxFICpmZGVzYzsK
KwlleHRlcm4gZWxmX25vdGVfaGRyIF9fYnVpbGRpZF9ub3RlX3NlY3Rpb247CisJdW5zaWduZWQg
aW50IGlkX2xlbmd0aCA9IF9fYnVpbGRpZF9ub3RlX3NlY3Rpb24uZGVzY3N6OworCWNoYXIqIGRl
c2MgPSBFTEZOT1RFX0RFU0MoJl9fYnVpbGRpZF9ub3RlX3NlY3Rpb24pOworCisJaWYgKF9fYnVp
bGRpZF9ub3RlX3NlY3Rpb24udHlwZSAhPSBOVF9HTlVfQlVJTERfSUQpCisJCWJhcmYoIkV4cGVj
dGVkIEdOVV9CVUlMRElEIG5vdGUsIGJ1dCBmb3VuZCB0eXBlICclZCciLAorCQkgICAgIF9fYnVp
bGRpZF9ub3RlX3NlY3Rpb24udHlwZSk7CisKKwlmZGVzYyA9IGZvcGVuKGJ1aWxkaWRfZmlsZSwg
IncrIik7CisJaWYgKCFmZGVzYykKKwkJYmFyZl9wZXJyb3IoIkVycm9yIG9wZW5pbmcgYnVpbGRp
ZCBmaWxlICVzIiwgYnVpbGRpZF9maWxlKTsKKworCS8qIFdlIGV4aXQgc2lsZW50bHkgaWYgZGFl
bW9uIGFscmVhZHkgcnVubmluZy4gKi8KKwlpZiAobG9ja2YoZmlsZW5vKGZkZXNjKSwgRl9UTE9D
SywgMCkgPT0gLTEpCisJCWV4aXQoMCk7CisKKwlmb3IgKGkgPSAwOyBpIDwgaWRfbGVuZ3RoOyAr
K2kpCisJCWZwcmludGYoZmRlc2MsICIlMDJ4IiwgKHVuc2lnbmVkIGNoYXIpZGVzY1tpXSk7CisJ
ZnByaW50ZihmZGVzYywgIlxuIik7CisKKwlmY2xvc2UoZmRlc2MpOworfQorCiAvKiBTdGV2ZW5z
LiAqLwogdm9pZCBkYWVtb25pemUodm9pZCkKIHsKLS0gCjIuMTYuNgoKCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


