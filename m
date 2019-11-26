Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 010FD109DF3
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:28:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuz-0004mn-Hr; Tue, 26 Nov 2019 12:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuy-0004mE-2s
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:26:08 +0000
X-Inumbo-ID: e4d8f9be-1047-11ea-83b8-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4d8f9be-1047-11ea-83b8-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771156; x=1606307156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=/laFxNcH/lbdJyRn9B6n9rnY/QQHFJTi9mwBzFuoGHE=;
 b=UaGzxFlgy8x0IKWTAu6eDkseVwh1qucNZIoaxCca/eDx7AOUbdLLdObX
 olqbwGau2LJGJN1jNWD/HqINT0HMnDwEQu+dFnbN1W5gJIdtyKtJQlnhw
 Cnye4NelOXrSxAbPARA7Gaj++d0ir07TfkRtOxtCUB9GHAgzTvxG6t6Cd 8=;
IronPort-SDR: 6E7xrhbiOQ/DdYaJigipAOiMqN+rbjtdrpv2ZxRtdMhvu/etKUARgV848/TNlbkdMFgiqmZj75
 0M+RGGeBD3QQ==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="4943831"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 26 Nov 2019 12:25:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id A17F2A1E84; Tue, 26 Nov 2019 12:25:54 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:40 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:38 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:36 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:11 +0000
Message-ID: <20191126122511.7409-8-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 7/7] livepatch-build: Strip all metadata
 symbols from hotpatch modules
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, mpohlack@amazon.com, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RyaXAgYWxsIHVubmVlZGVkIG1ldGFkYXRhIHN5bWJvbHMgZnJvbSBnZW5lcmF0ZWQgaG90cGF0
Y2ggbW9kdWxlcy4KVGhlIG1ldGFkYXRhIHN5bWJvbHMgYXJlIHRoZSBzeW1ib2xzIGZyb20gbWV0
YWRhdGEtbGlrZSBzZWN0aW9ucyAoZS5nLgonLmxpdmVwYXRjaC5mdW5jcycpIG9yIGxpdmVwYXRj
aCBob29rcyBzeW1ib2xzIChkZWZpbmVkIGJ5IGEgc2V0IG9mCnByZWZpeGVzLiBFLmcuICdsaXZl
cGF0Y2hfbG9hZF9kYXRhXycpLgoKQnkgZGVmYXVsdCB0aGUgY3JlYXRlLWRpZmYtb2JqZWN0IGRv
ZXMgbm90IGNyZWF0ZSBzeW1ib2xzIGluIG1ldGFkYXRhCnNlY3Rpb25zLiBIb3dldmVyLCBzdWNo
IHN5bWJvbHMgbWF5IGJlIGltcGxpY2l0bHkgYWRkZWQgYnkgc3BlY2l5aW5nCmV4dHJhIGVudHJp
ZXMgaW4gdGhlIHNlY3Rpb25zIG1hbnVhbGx5IChpbiBhIGdpdmVuIHBhdGNoKS4KVGhlIHN5bWJv
bHMgYXJlIG5vdCBuZWVkZWQgZm9yIHRoZSBob3RwYXRjaCBtb2R1bGVzIGFuZCBzaG91bGQgYmUK
c3RyaXBwZWQgdG8gYXZvaWQgc3ltYm9sIG5hbWVzIGNvbGxpc2lvbnMgYW5kIHRvIHNhdmUgaG90
cGF0Y2ggZmlsZXMKc3BhY2UuCgpTaWduZWQtb2ZmLWJ5OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8
d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdl
cndhbGxAY2l0cml4LmNvbT4KLS0tCiBsaXZlcGF0Y2gtYnVpbGQgfCA1NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saXZlcGF0
Y2gtYnVpbGQgYi9saXZlcGF0Y2gtYnVpbGQKaW5kZXggOWU1YmFkMy4uZTE3MTVlYSAxMDA3NTUK
LS0tIGEvbGl2ZXBhdGNoLWJ1aWxkCisrKyBiL2xpdmVwYXRjaC1idWlsZApAQCAtMTEyLDEwICsx
MTIsMzkgQEAgZnVuY3Rpb24gYnVpbGRfc3BlY2lhbCgpCiAgICAgdW5zZXQgTElWRVBBVENIX0NB
UFRVUkVfRElSCiB9CiAKLXN0cmlwX2V4dHJhX3N5bWJvbHMgKCkKK2VsZl9zZWN0aW9uX2V4aXN0
cyAoKQoreworICAgIGxvY2FsIEVMRj0iJDEiCisgICAgbG9jYWwgU0VDPSIkMiIKKworICAgIG9i
amR1bXAgLWggLWogIiRTRUMiICIkRUxGIiAmPiAvZGV2L251bGwKK30KKworIyBFeHRyYWN0IGEg
c2V0IG9mIHVuaXF1ZSBzeW1ib2xzIGZvciBhIHNwZWNpZmllZCBzZWN0aW9uLgorZWxmX2V4dHJh
Y3Rfc2VjdGlvbl9zeW1ib2xzICgpCit7CisgICAgbG9jYWwgLXIgRUxGPSIkMSIKKyAgICBsb2Nh
bCAtciBTRUM9IiQyIgorCisgICAgaWYgZWxmX3NlY3Rpb25fZXhpc3RzICIkRUxGIiAiJFNFQyIK
KyAgICB0aGVuCisgICAgICAgICMgRXhhbXBsZSBvYmpkdW1wIGNvbW1hbmQgb3V0cHV0IHRvIGJl
IHBhcnNlZDoKKyAgICAgICAgIworICAgICAgICAjIFNZTUJPTCBUQUJMRToKKyAgICAgICAgIyAw
MDAwMDAwMDAwMDAwMDAwIGwgICAgZCAgLmxpdmVwYXRjaC5mdW5jcyAgICAwMDAwMDAwMDAwMDAw
MDAwIC5saXZlcGF0Y2guZnVuY3MKKyAgICAgICAgb2JqZHVtcCAtdyAtaiAiJFNFQyIgLXQgIiRF
TEYiIHwgYXdrICcvXlNZTUJPTCBUQUJMRTovIHtzZWVuID0gMTsgbmV4dH0gc2VlbiAmJiAkTkYg
e3ByaW50ICRORn0nIHwgc29ydCAtdQorICAgIGZpCit9CisKKyMgU3RyaXAgYWxsIG1ldGFkYXRh
IHN5bWJvbHMgYmVsb25naW5nIHRvIGEgbWV0YWRhdGEgc2VjdGlvbgorIyBvciB3aG9zZSBuYW1l
IHN0YXJ0cyB3aXRoIGEgbGl2ZXBhdGNoIGhvb2sgcHJlZml4LgorIyBUaGUgZnVuY3Rpb24gY29u
c3RydWN0cyB0aGUgJ3N0cmlwJyB1dGlsaXR5IGNvbW1hbmQgbGluZQorIyBhbmQgdGhlbiBpbnZv
a2VzIHN0cmlwIHdpdGggdGhhdCBjb21tYW5kIGxpbmUuCitzdHJpcF9tZXRhZGF0YV9zeW1ib2xz
ICgpCiB7CiAgICAgbG9jYWwgLXIgRklMRT0iJDEiCiAgICAgbG9jYWwgLWEgU1RSSVBfQ01EX09Q
VFM9KCkKKyAgICBsb2NhbCAtYSBTWU1fU0VDVElPTlM9KCIubGl2ZXBhdGNoLmZ1bmNzIikKICAg
ICBsb2NhbCAtYSBTWU1fUFJFRklYPSgibGl2ZXBhdGNoX2xvYWRfZGF0YV8iCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgImxpdmVwYXRjaF91bmxvYWRfZGF0YV8iCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgImxpdmVwYXRjaF9wcmVhcHBseV9kYXRhXyIKQEAgLTEyNCwxMyArMTUzLDM1IEBA
IHN0cmlwX2V4dHJhX3N5bWJvbHMgKCkKICAgICAgICAgICAgICAgICAgICAgICAgICAibGl2ZXBh
dGNoX3ByZXJldmVydF9kYXRhXyIKICAgICAgICAgICAgICAgICAgICAgICAgICAibGl2ZXBhdGNo
X3JldmVydF9kYXRhXyIKICAgICAgICAgICAgICAgICAgICAgICAgICAibGl2ZXBhdGNoX3Bvc3Ry
ZXZlcnRfZGF0YV8iKQorICAgIGxvY2FsIC1hIFNZTVM9KCkKIAorICAgICMgRW5hYmxlIHdpbGRj
YXJkCiAgICAgU1RSSVBfQ01EX09QVFMrPSgiLXciKQorCisgICAgIyBTdHJpcCBhbGwgbGl2ZXBh
dGNoIGhvb2tzIG1ldGFkYXRhIHN5bWJvbHMKICAgICBmb3Igc3ltIGluICIke1NZTV9QUkVGSVhb
QF19IjsgZG8KICAgICAgICAgU1RSSVBfQ01EX09QVFMrPSgiLU4iKQogICAgICAgICBTVFJJUF9D
TURfT1BUUys9KCJcIiR7c3ltfSpcIiIpCiAgICAgZG9uZQogCisgICAgIyBGaW5kIGFsbCBzeW1i
b2xzIGZyb20gbWV0YWRhdGEgc2VjdGlvbnMKKyAgICAjIE5vdGU6IFRoZXJlIG1heSBiZSBuYW1l
IGNvbmZsaWN0cyBiZXR3ZWVuIGdsb2JhbAorICAgICMgYW5kIGxvY2FsIHN5bWJvbHMgYmVsb25n
aW5nIHRvIHRoZSBzYW1lIHNlY3Rpb24uCisgICAgIyBGb3IgdGhlICcubGl2ZXBhdGNoLmZ1bmNz
JyBzZWN0aW9uIGl0IGlzIG5vdCBhCisgICAgIyBwcm9ibGVtLiBUaGluayBhYm91dCBpdCBiZWZv
cmUgYWRkaW5nIG1vcmUgc2VjdGlvbnMuCisgICAgZm9yIHNlYyBpbiAiJHtTWU1fU0VDVElPTlNb
QF19IjsgZG8KKyAgICAgICAgU1lNUys9KCQoZWxmX2V4dHJhY3Rfc2VjdGlvbl9zeW1ib2xzICIk
RklMRSIgIiRzZWMiKSkKKyAgICBkb25lCisKKyAgICAjIFN0cmlwIG1ldGFkYXRhIHNlY3Rpb25z
JyBzeW1ib2xzCisgICAgaWYgWyAkeyNTWU1TW0BdfSAtZ3QgMCBdCisgICAgdGhlbgorICAgICAg
ICBmb3Igc3ltIGluICIke1NZTVNbQF19IjsgZG8KKyAgICAgICAgICAgIFNUUklQX0NNRF9PUFRT
Kz0oIi1OIikKKyAgICAgICAgICAgIFNUUklQX0NNRF9PUFRTKz0oIiR7c3ltfSIpCisgICAgICAg
IGRvbmUKKyAgICBmaQorCiAgICAgc3RyaXAgIiR7U1RSSVBfQ01EX09QVFNbQF19IiAiJEZJTEUi
CiB9CiAKQEAgLTIwMCw3ICsyNTEsNyBAQCBmdW5jdGlvbiBjcmVhdGVfcGF0Y2goKQogICAgICAg
ICAiJHtUT09MU0RJUn0iL3ByZWxpbmsgJGRlYnVnb3B0IG91dHB1dC5vICIke1BBVENITkFNRX0u
bGl2ZXBhdGNoIiAiJFhFTlNZTVMiICY+PiAiJHtPVVRQVVR9L3ByZWxpbmsubG9nIiB8fCBkaWUK
ICAgICBmaQogCi0gICAgc3RyaXBfZXh0cmFfc3ltYm9scyAiJHtQQVRDSE5BTUV9LmxpdmVwYXRj
aCIKKyAgICBzdHJpcF9tZXRhZGF0YV9zeW1ib2xzICIke1BBVENITkFNRX0ubGl2ZXBhdGNoIgog
CiAgICAgb2JqY29weSAtLWFkZC1zZWN0aW9uIC5saXZlcGF0Y2guZGVwZW5kcz1kZXBlbmRzLmJp
biAiJHtQQVRDSE5BTUV9LmxpdmVwYXRjaCIKICAgICBvYmpjb3B5IC0tc2V0LXNlY3Rpb24tZmxh
Z3MgLmxpdmVwYXRjaC5kZXBlbmRzPWFsbG9jLHJlYWRvbmx5ICIke1BBVENITkFNRX0ubGl2ZXBh
dGNoIgotLSAKMi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21i
SApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3Rp
YW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENo
YXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAy
ODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
