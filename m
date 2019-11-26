Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD29109DEA
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 13:27:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZuq-0004h7-5z; Tue, 26 Nov 2019 12:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZZuo-0004gB-2j
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 12:25:58 +0000
X-Inumbo-ID: e44c2584-1047-11ea-b155-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e44c2584-1047-11ea-b155-bc764e2007e4;
 Tue, 26 Nov 2019 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574771155; x=1606307155;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=50AhAuBAE5m0jf5j6Fmj7aXkFQ8mnxULZxRdTlVDKHQ=;
 b=QP5+VWmDgU8xOR4jutIo0LDtflqOSrfSUhjRE7WuE+47uleBdnxan1G/
 rXhmOdKDp7nPytg/wXxYpJgPEWz1O+1stSXEDm/2OYC73LuHfYs9YIqWo
 6S3gIyEZ+kJEED28vZOYg8woLUP11vhr1bzxzhq6Jak2kXx0/v80n5e9a I=;
IronPort-SDR: XYBvMYaqpiSxDt1V80n2S+aQOLKeSvX52wziuRzrwetkp0sA741L/bheqgAfq7o8cFzgiMvDmX
 3ieBFH28imhw==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="5818610"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Nov 2019 12:25:54 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id B11A7A1895; Tue, 26 Nov 2019 12:25:52 +0000 (UTC)
Received: from EX13D05EUC002.ant.amazon.com (10.43.164.231) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:37 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D05EUC002.ant.amazon.com (10.43.164.231) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 12:25:35 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Tue, 26 Nov 2019 12:25:33 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 26 Nov 2019 12:25:10 +0000
Message-ID: <20191126122511.7409-7-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20191126122511.7409-1-wipawel@amazon.de>
References: <20191126122511.7409-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 6/7] livepatch-build: Strip transient or
 unneeded symbols
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

SW4gdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBmaW5hbCBob3RwYXRjaCBtb2R1bGUgZmlsZSBt
YWtlIHN1cmUgdG8Kc3RyaXAgYWxsIHRyYW5zaWVudCBzeW1ib2xzIHRoYXQgaGF2ZSBub3QgYmVl
biBjYXVnaHQgYW5kIHJlbW92ZWQgYnkKY3JlYXRlLWRpZmYtb2JqZWN0IHByb2Nlc3NpbmcuIEZv
ciBub3cgdGhlc2UgYXJlIG9ubHkgdGhlIGhvb2tzCmtwYXRjaCBsb2FkL3VubG9hZCBzeW1ib2xz
LgoKRm9yIGFsbCBuZXcgb2JqZWN0IGZpbGVzIHRoYXQgYXJlIGNhcnJpZWQgYWxvbmcgZm9yIHRo
ZSBmaW5hbCBsaW5raW5nCnRoZSB0cmFuc2llbnQgaG9va3Mgc3ltYm9scyBhcmUgbm90IHN0cmlw
cGVkIGFuZCBuZWl0aGVyIGFyZSBhbnkKdW5uZWVkZWQgc3ltYm9scy4gU3RyaXAgdGhlIHRyYW5z
aWVudCBob29rcyBzeW1ib2xzIGV4cGxpY2l0bHkgZnJvbQpyZXN1bHRpbmcgb2JqZWN0IGZpbGUu
CkFkZCBhIG5ldyBvcHRpb24gJy0tc3RyaXAnIHRvIGFkZGl0aW9uYWxseSBzdHJpcCBhbGwgdW5u
ZWVkZWQgc3ltYm9scwpmcm9tIG5ldyBvYmplY3QgZmlsZXMuCgpTaWduZWQtb2ZmLWJ5OiBQYXdl
bCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Ci0tLQpDaGFuZ2VkIHNpbmNlIHYy
OgogICogQWRkZWQgJy0tc3RyaXAnIG9wdGlvbiBmb3Igc3RyaXBwaW5nIHVubmVlZGVkIHN5bWJv
bHMgb3B0aW9uYWxseS4KLS0tCiBsaXZlcGF0Y2gtYnVpbGQgfCAzMyArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGl2ZXBhdGNoLWJ1aWxkIGIvbGl2ZXBhdGNoLWJ1aWxk
CmluZGV4IGI4YTE3MjguLjllNWJhZDMgMTAwNzU1Ci0tLSBhL2xpdmVwYXRjaC1idWlsZAorKysg
Yi9saXZlcGF0Y2gtYnVpbGQKQEAgLTMyLDYgKzMyLDcgQEAgU0tJUD0KIERFUEVORFM9CiBYRU5f
REVQRU5EUz0KIFBSRUxJTks9CitTVFJJUD0wCiBYRU5TWU1TPXhlbi1zeW1zCiAKIHdhcm4oKSB7
CkBAIC0xMTEsNiArMTEyLDI4IEBAIGZ1bmN0aW9uIGJ1aWxkX3NwZWNpYWwoKQogICAgIHVuc2V0
IExJVkVQQVRDSF9DQVBUVVJFX0RJUgogfQogCitzdHJpcF9leHRyYV9zeW1ib2xzICgpCit7Cisg
ICAgbG9jYWwgLXIgRklMRT0iJDEiCisgICAgbG9jYWwgLWEgU1RSSVBfQ01EX09QVFM9KCkKKyAg
ICBsb2NhbCAtYSBTWU1fUFJFRklYPSgibGl2ZXBhdGNoX2xvYWRfZGF0YV8iCisgICAgICAgICAg
ICAgICAgICAgICAgICAgImxpdmVwYXRjaF91bmxvYWRfZGF0YV8iCisgICAgICAgICAgICAgICAg
ICAgICAgICAgImxpdmVwYXRjaF9wcmVhcHBseV9kYXRhXyIKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAibGl2ZXBhdGNoX2FwcGx5X2RhdGFfIgorICAgICAgICAgICAgICAgICAgICAgICAgICJs
aXZlcGF0Y2hfcG9zdGFwcGx5X2RhdGFfIgorICAgICAgICAgICAgICAgICAgICAgICAgICJsaXZl
cGF0Y2hfcHJlcmV2ZXJ0X2RhdGFfIgorICAgICAgICAgICAgICAgICAgICAgICAgICJsaXZlcGF0
Y2hfcmV2ZXJ0X2RhdGFfIgorICAgICAgICAgICAgICAgICAgICAgICAgICJsaXZlcGF0Y2hfcG9z
dHJldmVydF9kYXRhXyIpCisKKyAgICBTVFJJUF9DTURfT1BUUys9KCItdyIpCisgICAgZm9yIHN5
bSBpbiAiJHtTWU1fUFJFRklYW0BdfSI7IGRvCisgICAgICAgIFNUUklQX0NNRF9PUFRTKz0oIi1O
IikKKyAgICAgICAgU1RSSVBfQ01EX09QVFMrPSgiXCIke3N5bX0qXCIiKQorICAgIGRvbmUKKwor
ICAgIHN0cmlwICIke1NUUklQX0NNRF9PUFRTW0BdfSIgIiRGSUxFIgorfQorCiBmdW5jdGlvbiBj
cmVhdGVfcGF0Y2goKQogewogICAgIGVjaG8gIkV4dHJhY3RpbmcgbmV3IGFuZCBtb2RpZmllZCBF
TEYgc2VjdGlvbnMuLi4iCkBAIC0xNTAsNiArMTczLDcgQEAgZnVuY3Rpb24gY3JlYXRlX3BhdGNo
KCkKICAgICBORVdfRklMRVM9JChjb21tIC0yMyA8KGNkIHBhdGNoZWQveGVuICYmIGZpbmQgLiAt
dHlwZSBmIC1uYW1lICcqLm8nIHwgc29ydCkgPChjZCBvcmlnaW5hbC94ZW4gJiYgZmluZCAuIC10
eXBlIGYgLW5hbWUgJyoubycgfCBzb3J0KSkKICAgICBmb3IgaSBpbiAkTkVXX0ZJTEVTOyBkbwog
ICAgICAgICBjcCAicGF0Y2hlZC8kaSIgIm91dHB1dC8kaSIKKyAgICAgICAgW1sgJFNUUklQIC1l
cSAxIF1dICYmIHN0cmlwIC0tc3RyaXAtdW5uZWVkZWQgIm91dHB1dC8kaSIKICAgICAgICAgQ0hB
TkdFRD0xCiAgICAgZG9uZQogCkBAIC0xNzYsNiArMjAwLDggQEAgZnVuY3Rpb24gY3JlYXRlX3Bh
dGNoKCkKICAgICAgICAgIiR7VE9PTFNESVJ9Ii9wcmVsaW5rICRkZWJ1Z29wdCBvdXRwdXQubyAi
JHtQQVRDSE5BTUV9LmxpdmVwYXRjaCIgIiRYRU5TWU1TIiAmPj4gIiR7T1VUUFVUfS9wcmVsaW5r
LmxvZyIgfHwgZGllCiAgICAgZmkKIAorICAgIHN0cmlwX2V4dHJhX3N5bWJvbHMgIiR7UEFUQ0hO
QU1FfS5saXZlcGF0Y2giCisKICAgICBvYmpjb3B5IC0tYWRkLXNlY3Rpb24gLmxpdmVwYXRjaC5k
ZXBlbmRzPWRlcGVuZHMuYmluICIke1BBVENITkFNRX0ubGl2ZXBhdGNoIgogICAgIG9iamNvcHkg
LS1zZXQtc2VjdGlvbi1mbGFncyAubGl2ZXBhdGNoLmRlcGVuZHM9YWxsb2MscmVhZG9ubHkgIiR7
UEFUQ0hOQU1FfS5saXZlcGF0Y2giCiAKQEAgLTE5OCwxMSArMjI0LDEyIEBAIHVzYWdlKCkgewog
ICAgIGVjaG8gIiAgICAgICAgLS1kZXBlbmRzICAgICAgICAgIFJlcXVpcmVkIGJ1aWxkLWlkIiA+
JjIKICAgICBlY2hvICIgICAgICAgIC0teGVuLWRlcGVuZHMgICAgICBSZXF1aXJlZCBYZW4gYnVp
bGQtaWQiID4mMgogICAgIGVjaG8gIiAgICAgICAgLS1wcmVsaW5rICAgICAgICAgIFByZWxpbmsi
ID4mMgorICAgIGVjaG8gIiAgICAgICAgLS1zdHJpcCAgICAgICAgICAgIFJlbW92ZSBhbGwgc3lt
Ym9scyB0aGF0IGFyZSBub3QgbmVlZGVkIGZvciByZWxvY2F0aW9uIHByb2Nlc3NpbmcuIiA+JjIK
IH0KIAogZmluZF90b29scyB8fCBkaWUgImNhbid0IGZpbmQgc3VwcG9ydGluZyB0b29scyIKIAot
b3B0aW9ucz0kKGdldG9wdCAtbyBoczpwOmM6bzpqOms6ZCAtbCAiaGVscCxzcmNkaXI6LHBhdGNo
Oixjb25maWc6LG91dHB1dDosY3B1czosc2tpcDosZGVidWcseGVuLWRlYnVnLHhlbi1zeW1zOixk
ZXBlbmRzOix4ZW4tZGVwZW5kczoscHJlbGluayIgLS0gIiRAIikgfHwgZGllICJnZXRvcHQgZmFp
bGVkIgorb3B0aW9ucz0kKGdldG9wdCAtbyBoczpwOmM6bzpqOms6ZCAtbCAiaGVscCxzcmNkaXI6
LHBhdGNoOixjb25maWc6LG91dHB1dDosY3B1czosc2tpcDosZGVidWcseGVuLWRlYnVnLHhlbi1z
eW1zOixkZXBlbmRzOix4ZW4tZGVwZW5kczoscHJlbGluayxzdHJpcCIgLS0gIiRAIikgfHwgZGll
ICJnZXRvcHQgZmFpbGVkIgogCiBldmFsIHNldCAtLSAiJG9wdGlvbnMiCiAKQEAgLTI3MCw2ICsy
OTcsMTAgQEAgd2hpbGUgW1sgJCMgLWd0IDAgXV07IGRvCiAgICAgICAgICAgICBQUkVMSU5LPS0t
cmVzb2x2ZQogICAgICAgICAgICAgc2hpZnQKICAgICAgICAgICAgIDs7CisgICAgICAgIC0tc3Ry
aXApCisgICAgICAgICAgICBTVFJJUD0xCisgICAgICAgICAgICBzaGlmdAorICAgICAgICAgICAg
OzsKICAgICAgICAgLS0pCiAgICAgICAgICAgICBzaGlmdAogICAgICAgICAgICAgYnJlYWsKLS0g
CjIuMTYuNQoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNl
bnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxh
ZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVu
YnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4
NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
