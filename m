Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B493495EE
	for <lists+xen-devel@lfdr.de>; Thu, 25 Mar 2021 16:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101430.194070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCt-0007o1-0G; Thu, 25 Mar 2021 15:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101430.194070; Thu, 25 Mar 2021 15:47:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPSCs-0007nA-Sn; Thu, 25 Mar 2021 15:47:34 +0000
Received: by outflank-mailman (input) for mailman id 101430;
 Thu, 25 Mar 2021 15:47:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cfrO=IX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lPSCr-0007aB-F3
 for xen-devel@lists.xenproject.org; Thu, 25 Mar 2021 15:47:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91115468-f32f-492c-94d9-9f0247d5b79e;
 Thu, 25 Mar 2021 15:47:21 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 91115468-f32f-492c-94d9-9f0247d5b79e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616687241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4G0liXTRoDoxxIpwz1j4AW2gX9FwMKi9LjHo2rv5814=;
  b=UFmXr3e+um0gQHcr6EYuUUR3wJ/DwqqAIX7cUKtC/i4WriTFs6eMSA5D
   VBuTfzcP4mv5bASl/rewfgwzTUgsljlaEgM9YibipzxOmTBLvwOykEdxV
   thJQRGFlKSSSgP0G/fW4NgEPmX4CCjtusJxsQ3uHBcYGLyyfESxoCYYFZ
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: d5zVYAoBaPH2rc92zSFHnUOB+hyEuPfKp1nE0rWC6EKm1OIMuGPyJsJZyqI1QpTcbxsGN+idti
 1hIfE8DfuOh3zPTFz4dXZ03ImCfsKDfxOSRLCvqtDV4EAv+ICVgXsnoqM8gALRXMMc9fAJa7po
 5j1cDUWWU2F8z5a3kODXlAv2G/yYic+Dvv2KrrVl4z25JUUML4YGpNIJ7HeRt+TjmADGxXa8uw
 SZhvxAsp+B9kdKZuOTT6eP+29qqOyfJ+6/LLcnq1YG6S3LEf4GSE9grPaWKgRQcNcxPk3Pe4vE
 vBc=
X-SBRS: 5.1
X-MesageID: 40500442
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tWIFRqDV8spf94blHeh+sceALOonbusQ8zAX/mhsVB1YddGZnc
 iynPIdkST5kioVRWtIo729EYOLKEm9ybde544NMbC+GDT3oWfAFvAH0aLO4R3FXxf/+OlUyL
 t6f8FFYuHYIFBmga/BjzWQPM0nxLC8npyAocf74zNTQRpxa6dmhj0JbzqzNkFtXgFJCd4YOf
 Onl6l6jgGtc3gWcci3b0NtN4T+jubGiY78Zlo+DwMngTPksRqT9LX4HxKEty1uMQ9n/LFKyw
 n4uj283IqPmbWRyhjQ12jchq4m5efJ+594K+GnzuQQIjXooA60aIpmQK3qhkFInMifrGwEvf
 OJjxA8P9liy365RBDLnTLdnzPO/Rxry3j+xUSWiXHuyPaJOg4SOo56qq9yNj76gnBQ2+1U4e
 Zw8E+y86dzN1fmmh/w4tDZPisa7XackD4ZvsM4y0BEXZB2Us42kaUvuHl7Pb0nByzA5IUuAI
 BVfbvhzccTS1+cYnzD11MfueCEbzA2FheCdEAIptaY5ThQhGx41EsV3qUk7w89yK4=
X-IronPort-AV: E=Sophos;i="5.81,277,1610427600"; 
   d="scan'208";a="40500442"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <devel@edk2.groups.io>
CC: <xen-devel@lists.xenproject.org>, Jordan Justen
	<jordan.l.justen@intel.com>, Anthony PERARD <anthony.perard@citrix.com>, "Ard
 Biesheuvel" <ard.biesheuvel@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2 3/7] OvmfPkg/IndustryStandard/Xen: Apply EDK2 coding style to XEN_VCPU_TIME_INFO
Date: Thu, 25 Mar 2021 15:47:09 +0000
Message-ID: <20210325154713.670104-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210325154713.670104-1-anthony.perard@citrix.com>
References: <20210325154713.670104-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Type: text/plain

V2UgYXJlIGdvaW5nIHRvIHVzZSBuZXcgZmllbGRzIGZyb20gdGhlIFhlbiBoZWFkZXJzLiBBcHBs
eSB0aGUgRURLMgpjb2Rpbmcgc3R5bGUgc28gdGhhdCB0aGUgY29kZSB0aGF0IGlzIGdvaW5nIHRv
IHVzZSBpdCBkb2Vzbid0IGxvb2sgb3V0Cm9mIHBsYWNlLgoKUmVmOiBodHRwczovL2J1Z3ppbGxh
LnRpYW5vY29yZS5vcmcvc2hvd19idWcuY2dpP2lkPTI0OTAKU2lnbmVkLW9mZi1ieTogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBMYXN6bG8g
RXJzZWsgPGxlcnNla0ByZWRoYXQuY29tPgotLS0KCk5vdGVzOgogICAgdjI6CiAgICAtIGZpeCBj
YXNlIG9mIFRzYyogZmllbGQKCiBPdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4v
eGVuLmggfCAxNyArKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0
cnlTdGFuZGFyZC9YZW4veGVuLmggYi9Pdm1mUGtnL0luY2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9Y
ZW4veGVuLmgKaW5kZXggZTU1ZDkzMjYzMjg1Li43OWE0ZTIxMmU3YzIgMTAwNjQ0Ci0tLSBhL092
bWZQa2cvSW5jbHVkZS9JbmR1c3RyeVN0YW5kYXJkL1hlbi94ZW4uaAorKysgYi9Pdm1mUGtnL0lu
Y2x1ZGUvSW5kdXN0cnlTdGFuZGFyZC9YZW4veGVuLmgKQEAgLTE4MywxMCArMTgzLDEwIEBAIHN0
cnVjdCB2Y3B1X3RpbWVfaW5mbyB7CiAgICAgICogVGhlIGNvcnJlY3Qgd2F5IHRvIGludGVyYWN0
IHdpdGggdGhlIHZlcnNpb24gbnVtYmVyIGlzIHNpbWlsYXIgdG8NCiAgICAgICogTGludXgncyBz
ZXFsb2NrOiBzZWUgdGhlIGltcGxlbWVudGF0aW9ucyBvZiByZWFkX3NlcWJlZ2luL3JlYWRfc2Vx
cmV0cnkuDQogICAgICAqLw0KLSAgICBVSU5UMzIgdmVyc2lvbjsNCisgICAgVUlOVDMyIFZlcnNp
b247DQogICAgIFVJTlQzMiBwYWQwOw0KLSAgICBVSU5UNjQgdHNjX3RpbWVzdGFtcDsgICAvKiBU
U0MgYXQgbGFzdCB1cGRhdGUgb2YgdGltZSB2YWxzLiAgKi8NCi0gICAgVUlOVDY0IHN5c3RlbV90
aW1lOyAgICAgLyogVGltZSwgaW4gbmFub3NlY3MsIHNpbmNlIGJvb3QuICAgICovDQorICAgIFVJ
TlQ2NCBUc2NUaW1lc3RhbXA7ICAgLyogVFNDIGF0IGxhc3QgdXBkYXRlIG9mIHRpbWUgdmFscy4g
ICovDQorICAgIFVJTlQ2NCBTeXN0ZW1UaW1lOyAgICAgLyogVGltZSwgaW4gbmFub3NlY3MsIHNp
bmNlIGJvb3QuICAgICovDQogICAgIC8qDQogICAgICAqIEN1cnJlbnQgc3lzdGVtIHRpbWU6DQog
ICAgICAqICAgc3lzdGVtX3RpbWUgKw0KQEAgLTE5NCwxMSArMTk0LDExIEBAIHN0cnVjdCB2Y3B1
X3RpbWVfaW5mbyB7CiAgICAgICogQ1BVIGZyZXF1ZW5jeSAoSHopOg0KICAgICAgKiAgICgoMTBe
OSA8PCAzMikgLyB0c2NfdG9fc3lzdGVtX211bCkgPj4gdHNjX3NoaWZ0DQogICAgICAqLw0KLSAg
ICBVSU5UMzIgdHNjX3RvX3N5c3RlbV9tdWw7DQotICAgIElOVDggICB0c2Nfc2hpZnQ7DQorICAg
IFVJTlQzMiBUc2NUb1N5c3RlbU11bHRpcGxpZXI7DQorICAgIElOVDggICBUc2NTaGlmdDsNCiAg
ICAgSU5UOCAgIHBhZDFbM107DQogfTsgLyogMzIgYnl0ZXMgKi8NCi10eXBlZGVmIHN0cnVjdCB2
Y3B1X3RpbWVfaW5mbyB2Y3B1X3RpbWVfaW5mb190Ow0KK3R5cGVkZWYgc3RydWN0IHZjcHVfdGlt
ZV9pbmZvIFhFTl9WQ1BVX1RJTUVfSU5GTzsNCiANCiBzdHJ1Y3QgdmNwdV9pbmZvIHsNCiAgICAg
LyoNCkBAIC0yMzQsNyArMjM0LDcgQEAgc3RydWN0IHZjcHVfaW5mbyB7CiAjZW5kaWYgLyogWEVO
X0hBVkVfUFZfVVBDQUxMX01BU0sgKi8NCiAgICAgeGVuX3Vsb25nX3QgZXZ0Y2huX3BlbmRpbmdf
c2VsOw0KICAgICBzdHJ1Y3QgYXJjaF92Y3B1X2luZm8gYXJjaDsNCi0gICAgc3RydWN0IHZjcHVf
dGltZV9pbmZvIHRpbWU7DQorICAgIHN0cnVjdCB2Y3B1X3RpbWVfaW5mbyBUaW1lOw0KIH07IC8q
IDY0IGJ5dGVzICh4ODYpICovDQogI2lmbmRlZiBfX1hFTl9fDQogdHlwZWRlZiBzdHJ1Y3QgdmNw
dV9pbmZvIHZjcHVfaW5mb190Ow0KQEAgLTI1MCw3ICsyNTAsNyBAQCB0eXBlZGVmIHN0cnVjdCB2
Y3B1X2luZm8gdmNwdV9pbmZvX3Q7CiAgKiBvZiB0aGlzIHN0cnVjdHVyZSByZW1haW5pbmcgY29u
c3RhbnQuDQogICovDQogc3RydWN0IHNoYXJlZF9pbmZvIHsNCi0gICAgc3RydWN0IHZjcHVfaW5m
byB2Y3B1X2luZm9bWEVOX0xFR0FDWV9NQVhfVkNQVVNdOw0KKyAgICBzdHJ1Y3QgdmNwdV9pbmZv
IFZjcHVJbmZvW1hFTl9MRUdBQ1lfTUFYX1ZDUFVTXTsNCiANCiAgICAgLyoNCiAgICAgICogQSBk
b21haW4gY2FuIGNyZWF0ZSAiZXZlbnQgY2hhbm5lbHMiIG9uIHdoaWNoIGl0IGNhbiBzZW5kIGFu
ZCByZWNlaXZlDQpAQCAtMjk5LDYgKzI5OSw3IEBAIHN0cnVjdCBzaGFyZWRfaW5mbyB7CiB9Ow0K
ICNpZm5kZWYgX19YRU5fXw0KIHR5cGVkZWYgc3RydWN0IHNoYXJlZF9pbmZvIHNoYXJlZF9pbmZv
X3Q7DQordHlwZWRlZiBzdHJ1Y3Qgc2hhcmVkX2luZm8gWEVOX1NIQVJFRF9JTkZPOw0KICNlbmRp
Zg0KIA0KIC8qIFR1cm4gYSBwbGFpbiBudW1iZXIgaW50byBhIEMgVUlOVE4gY29uc3RhbnQuICov
DQotLSAKQW50aG9ueSBQRVJBUkQKCg==

