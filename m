Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD1C130802
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 13:36:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io561-00071i-3E; Sun, 05 Jan 2020 12:33:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ep8Y=22=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1io560-00071d-9f
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 12:33:28 +0000
X-Inumbo-ID: 91a3671a-2fb7-11ea-aa17-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91a3671a-2fb7-11ea-aa17-12813bfff9fa;
 Sun, 05 Jan 2020 12:33:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2CBAAEC5;
 Sun,  5 Jan 2020 12:33:25 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sun,  5 Jan 2020 13:33:23 +0100
Message-Id: <20200105123323.12492-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] xen/sched: fix resuming from S3 with smt=0
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
Cc: Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiByZXN1bWluZyBmcm9tIFMzIGFuZCBzbXQ9MCBvciBtYXhjcHVzPSBhcmUgc3BlY2lmaWVk
IHdlIG11c3Qgbm90CmRvIGFueXRoaW5nIGluIGNwdV9zY2hlZHVsZV9jYWxsYmFjaygpLiBUaGlz
IGlzIG5vdCB0cnVlIHRvZGF5IGZvcgp0YWtpbmcgZG93biBhIGNwdSBkdXJpbmcgcmVzdW1lLgoK
SWYgYW55dGhpbmcgZ29lcyB3cm9uZyBkdXJpbmcgcmVzdW1lIGFsbCB0aGUgc2NoZWR1bGVyIHJl
bGF0ZWQgZXJyb3IKaGFuZGxpbmcgaXMgaW4gY3B1cG9vbC5jLCBzbyB3ZSBjYW4ganVzdCBiYWls
IG91dCBlYXJseSBmcm9tCmNwdV9zY2hlZHVsZV9jYWxsYmFjaygpIHdoZW4gc3VzcGVuZGluZyBv
ciByZXN1bWluZy4KClRoaXMgZml4ZXMgY29tbWl0IDA3NjNjZDI2ODc4OTdiNTVlNyAoInhlbi9z
Y2hlZDogZG9uJ3QgZGlzYWJsZQpzY2hlZHVsZXIgb24gY3B1cyBkdXJpbmcgc3VzcGVuZCIpLgoK
UmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNp
YmxldGhpbmdzbGFiLmNvbT4KVGVzdGVkLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kg
PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB4ZW4vY29tbW9uL3NjaGVkdWxlLmMgfCAxNSAr
KysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9z
Y2hlZHVsZS5jCmluZGV4IGU3MGNjNzBhNjUuLjU0YTA3ZmY5ZTggMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTI1NjIsNiAr
MjU2MiwxMyBAQCBzdGF0aWMgaW50IGNwdV9zY2hlZHVsZV9jYWxsYmFjaygKICAgICB1bnNpZ25l
ZCBpbnQgY3B1ID0gKHVuc2lnbmVkIGxvbmcpaGNwdTsKICAgICBpbnQgcmMgPSAwOwogCisgICAg
LyoKKyAgICAgKiBBbGwgc2NoZWR1bGVyIHJlbGF0ZWQgc3VzcGVuZC9yZXN1bWUgaGFuZGxpbmcg
bmVlZGVkIGlzIGRvbmUgaW4KKyAgICAgKiBjcHVwb29sLmMuCisgICAgICovCisgICAgaWYgKCBz
eXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYWN0aXZlICkKKyAgICAgICAgcmV0dXJuIE5PVElGWV9E
T05FOworCiAgICAgcmN1X3JlYWRfbG9jaygmc2NoZWRfcmVzX3JjdWxvY2spOwogCiAgICAgLyoK
QEAgLTI1ODksOCArMjU5Niw3IEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX2NhbGxiYWNrKAog
ICAgIHN3aXRjaCAoIGFjdGlvbiApCiAgICAgewogICAgIGNhc2UgQ1BVX1VQX1BSRVBBUkU6Ci0g
ICAgICAgIGlmICggc3lzdGVtX3N0YXRlICE9IFNZU19TVEFURV9yZXN1bWUgKQotICAgICAgICAg
ICAgcmMgPSBjcHVfc2NoZWR1bGVfdXAoY3B1KTsKKyAgICAgICAgcmMgPSBjcHVfc2NoZWR1bGVf
dXAoY3B1KTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBDUFVfRE9XTl9QUkVQQVJFOgogICAg
ICAgICByY3VfcmVhZF9sb2NrKCZkb21saXN0X3JlYWRfbG9jayk7CkBAIC0yNTk4LDEzICsyNjA0
LDEwIEBAIHN0YXRpYyBpbnQgY3B1X3NjaGVkdWxlX2NhbGxiYWNrKAogICAgICAgICByY3VfcmVh
ZF91bmxvY2soJmRvbWxpc3RfcmVhZF9sb2NrKTsKICAgICAgICAgYnJlYWs7CiAgICAgY2FzZSBD
UFVfREVBRDoKLSAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX3N1c3BlbmQg
KQotICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIHNjaGVkX3JtX2NwdShjcHUpOwogICAgICAg
ICBicmVhazsKICAgICBjYXNlIENQVV9VUF9DQU5DRUxFRDoKLSAgICAgICAgaWYgKCBzeXN0ZW1f
c3RhdGUgIT0gU1lTX1NUQVRFX3Jlc3VtZSApCi0gICAgICAgICAgICBjcHVfc2NoZWR1bGVfZG93
bihjcHUpOworICAgICAgICBjcHVfc2NoZWR1bGVfZG93bihjcHUpOwogICAgICAgICBicmVhazsK
ICAgICBkZWZhdWx0OgogICAgICAgICBicmVhazsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
