Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5241143B7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 16:35:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ict83-0007Yo-G1; Thu, 05 Dec 2019 15:33:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ict81-0007Yi-NN
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 15:33:17 +0000
X-Inumbo-ID: 8e52cab4-1774-11ea-822b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e52cab4-1774-11ea-822b-12813bfff9fa;
 Thu, 05 Dec 2019 15:33:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B118B2DB;
 Thu,  5 Dec 2019 15:33:15 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
Date: Thu, 5 Dec 2019 16:33:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gb3JkZXIgdG8gYXZvaWQgcGVybWFuZW50bHkgaGF2aW5nIHRvIGFzayB0aGF0IG5vIG5ldyBj
b21tYW5kIGxpbmUKb3B0aW9ucyB1c2luZyB1bmRlcnNjb3JlcyBiZSBpbnRyb2R1Y2VkIChhbGJl
aXQgSSdtIGxpa2VseSB0byBzdGlsbCBtYWtlCnJlbWFya3MpLCBhbmQgaW4gb3JkZXIgdG8gYWxz
byBhbGxvdyBleHRlbmRpbmcgdGhlIHVzZSBvZiBoeXBoZW5zIHRvCnByZS1leGlzdGluZyBvbmVz
LCBpbnRyb2R1Y2UgY3VzdG9tIGNvbXBhcmlzb24gZnVuY3Rpb25zIHRyZWF0aW5nIGJvdGgKY2hh
cmFjdGVycyBhcyBtYXRjaGluZy4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KCi0tLSBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYworKysg
Yi9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKQEAgLTcyLDYgKzcyLDExIEBAIFNv
bWUgb3B0aW9ucyB0YWtlIGEgY29tbWEgc2VwYXJhdGVkIGxpc3QKIFNvbWUgcGFyYW1ldGVycyBh
Y3QgYXMgY29tYmluYXRpb25zIG9mIHRoZSBhYm92ZSwgbW9zdCBjb21tb25seSBhIG1peAogb2Yg
Qm9vbGVhbiBhbmQgU3RyaW5nLiAgVGhlc2UgYXJlIG5vdGVkIGluIHRoZSByZWxldmFudCBzZWN0
aW9ucy4KIAorIyMjIFNwZWxsaW5nCisKK1BhcmFtZXRlciBuYW1lcyBtYXkgaW5jbHVkZSBoeXBo
ZW5zIG9yIHVuZGVyc2NvcmVzLiAgVGhlc2UgYXJlCitnZW5lcmFsbHkgYmVpbmcgdHJlYXRlZCBh
cyBtYXRjaGluZyBvbmUgYW5vdGhlciBieSB0aGUgcGFyc2luZyBsb2dpYy4KKwogIyMgUGFyYW1l
dGVyIGRldGFpbHMKIAogIyMjIGFjcGkKLS0tIGEveGVuL2NvbW1vbi9rZXJuZWwuYworKysgYi94
ZW4vY29tbW9uL2tlcm5lbC5jCkBAIC0yMyw2ICsyMyw0OSBAQCBlbnVtIHN5c3RlbV9zdGF0ZSBz
eXN0ZW1fc3RhdGUgPSBTWVNfU1RBCiB4ZW5fY29tbWFuZGxpbmVfdCBzYXZlZF9jbWRsaW5lOwog
c3RhdGljIGNvbnN0IGNoYXIgX19pbml0Y29uc3Qgb3B0X2J1aWx0aW5fY21kbGluZVtdID0gQ09O
RklHX0NNRExJTkU7CiAKK3N0YXRpYyBpbnQgY2RpZmYodW5zaWduZWQgY2hhciBjMSwgdW5zaWdu
ZWQgY2hhciBjMikKK3sKKyAgICBpbnQgcmVzID0gYzEgLSBjMjsKKworICAgIGlmICggcmVzICYm
IChjMSBeIGMyKSA9PSAoJy0nIF4gJ18nKSAmJgorICAgICAgICAgKGMxID09ICctJyB8fCBjMSA9
PSAnXycpICkKKyAgICAgICAgcmVzID0gMDsKKworICAgIHJldHVybiByZXM7Cit9CisKKy8qCisg
KiBTdHJpbmcgY29tcGFyaXNvbiBmdW5jdGlvbnMgbW9zdGx5IG1hdGNoaW5nIHN0cmNtcCgpIC8g
c3RybmNtcCgpLAorICogZXhjZXB0IHRoYXQgdGhleSB0cmVhdCAnLScgYW5kICdfJyBhcyBtYXRj
aGluZyBvbmUgYW5vdGhlci4KKyAqLworc3RhdGljIGludCBfc3RyY21wKGNvbnN0IGNoYXIgKnMx
LCBjb25zdCBjaGFyICpzMikKK3sKKyAgICBpbnQgcmVzOworCisgICAgZm9yICggOyA7ICsrczEs
ICsrczIgKQorICAgIHsKKyAgICAgICAgcmVzID0gY2RpZmYoKnMxLCAqczIpOworICAgICAgICBp
ZiAoIHJlcyB8fCAhKnMxICkKKyAgICAgICAgICAgIGJyZWFrOworICAgIH0KKworICAgIHJldHVy
biByZXM7Cit9CisKK3N0YXRpYyBpbnQgX3N0cm5jbXAoY29uc3QgY2hhciAqczEsIGNvbnN0IGNo
YXIgKnMyLCBzaXplX3QgbikKK3sKKyAgICBpbnQgcmVzID0gMDsKKworICAgIGZvciAoIDsgbi0t
OyArK3MxLCArK3MyICkKKyAgICB7CisgICAgICAgIHJlcyA9IGNkaWZmKCpzMSwgKnMyKTsKKyAg
ICAgICAgaWYgKCByZXMgfHwgISpzMSApCisgICAgICAgICAgICBicmVhazsKKyAgICB9CisKKyAg
ICByZXR1cm4gcmVzOworfQorCiBzdGF0aWMgaW50IGFzc2lnbl9pbnRlZ2VyX3BhcmFtKGNvbnN0
IHN0cnVjdCBrZXJuZWxfcGFyYW0gKnBhcmFtLCB1aW50NjRfdCB2YWwpCiB7CiAgICAgc3dpdGNo
ICggcGFyYW0tPmxlbiApCkBAIC05NCw3ICsxMzcsNyBAQCBzdGF0aWMgaW50IHBhcnNlX3BhcmFt
cyhjb25zdCBjaGFyICpjbWRsCiAKICAgICAgICAgLyogQm9vbGVhbiBwYXJhbWV0ZXJzIGNhbiBi
ZSBpbnZlcnRlZCB3aXRoICduby0nIHByZWZpeC4gKi8KICAgICAgICAga2V5ID0gb3B0a2V5Owot
ICAgICAgICBib29sX2Fzc2VydCA9ICEhc3RybmNtcCgibm8tIiwgb3B0a2V5LCAzKTsKKyAgICAg
ICAgYm9vbF9hc3NlcnQgPSAhIV9zdHJuY21wKCJuby0iLCBvcHRrZXksIDMpOwogICAgICAgICBp
ZiAoICFib29sX2Fzc2VydCApCiAgICAgICAgICAgICBvcHRrZXkgKz0gMzsKIApAQCAtMTA1LDEx
ICsxNDgsMTEgQEAgc3RhdGljIGludCBwYXJzZV9wYXJhbXMoY29uc3QgY2hhciAqY21kbAogICAg
ICAgICAgICAgaW50IHJjdG1wOwogICAgICAgICAgICAgY29uc3QgY2hhciAqczsKIAotICAgICAg
ICAgICAgaWYgKCBzdHJjbXAocGFyYW0tPm5hbWUsIG9wdGtleSkgKQorICAgICAgICAgICAgaWYg
KCBfc3RyY21wKHBhcmFtLT5uYW1lLCBvcHRrZXkpICkKICAgICAgICAgICAgIHsKICAgICAgICAg
ICAgICAgICBpZiAoIHBhcmFtLT50eXBlID09IE9QVF9DVVNUT00gJiYgcSAmJgogICAgICAgICAg
ICAgICAgICAgICAgc3RybGVuKHBhcmFtLT5uYW1lKSA9PSBxICsgMSAtIG9wdCAmJgotICAgICAg
ICAgICAgICAgICAgICAgIXN0cm5jbXAocGFyYW0tPm5hbWUsIG9wdCwgcSArIDEgLSBvcHQpICkK
KyAgICAgICAgICAgICAgICAgICAgICFfc3RybmNtcChwYXJhbS0+bmFtZSwgb3B0LCBxICsgMSAt
IG9wdCkgKQogICAgICAgICAgICAgICAgIHsKICAgICAgICAgICAgICAgICAgICAgZm91bmQgPSB0
cnVlOwogICAgICAgICAgICAgICAgICAgICBvcHR2YWxbLTFdID0gJz0nOwpAQCAtMjc1LDcgKzMx
OCw3IEBAIGludCBwYXJzZV9ib29sKGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIKIGludCBwYXJz
ZV9ib29sZWFuKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IGNoYXIgKnMsIGNvbnN0IGNoYXIgKmUp
CiB7CiAgICAgc2l6ZV90IHNsZW4sIG5sZW47Ci0gICAgaW50IHZhbCA9ICEhc3RybmNtcChzLCAi
bm8tIiwgMyk7CisgICAgaW50IHZhbCA9ICEhX3N0cm5jbXAocywgIm5vLSIsIDMpOwogCiAgICAg
aWYgKCAhdmFsICkKICAgICAgICAgcyArPSAzOwpAQCAtMjg0LDcgKzMyNyw3IEBAIGludCBwYXJz
ZV9ib29sZWFuKGNvbnN0IGNoYXIgKm5hbWUsIGNvbnMKICAgICBubGVuID0gc3RybGVuKG5hbWUp
OwogCiAgICAgLyogRG9lcyBzIG5vdyBzdGFydCB3aXRoIG5hbWU/ICovCi0gICAgaWYgKCBzbGVu
IDwgbmxlbiB8fCBzdHJuY21wKHMsIG5hbWUsIG5sZW4pICkKKyAgICBpZiAoIHNsZW4gPCBubGVu
IHx8IF9zdHJuY21wKHMsIG5hbWUsIG5sZW4pICkKICAgICAgICAgcmV0dXJuIC0xOwogCiAgICAg
LyogRXhhY3QsIHVuYWRvcm5lZCBuYW1lPyAgUmVzdWx0IGRlcGVuZHMgb24gdGhlICduby0nIHBy
ZWZpeC4gKi8KQEAgLTMwNCw3ICszNDcsNyBAQCBpbnQgY21kbGluZV9zdHJjbXAoY29uc3QgY2hh
ciAqZnJhZywgY29uCiAgICAgZm9yICggOyA7IGZyYWcrKywgbmFtZSsrICkKICAgICB7CiAgICAg
ICAgIHVuc2lnbmVkIGNoYXIgZiA9ICpmcmFnLCBuID0gKm5hbWU7Ci0gICAgICAgIGludCByZXMg
PSBmIC0gbjsKKyAgICAgICAgaW50IHJlcyA9IGNkaWZmKGYsIG4pOwogCiAgICAgICAgIGlmICgg
cmVzIHx8IG4gPT0gJ1wwJyApCiAgICAgICAgIHsKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
