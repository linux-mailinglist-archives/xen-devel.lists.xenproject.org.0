Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7E214F0D3
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 17:46:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixZO9-0008ID-S4; Fri, 31 Jan 2020 16:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixZO7-0008Hz-Mx
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 16:43:23 +0000
X-Inumbo-ID: cb343e6c-4448-11ea-b211-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cb343e6c-4448-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 16:43:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 523F6AD3C;
 Fri, 31 Jan 2020 16:43:22 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Message-ID: <90e7ed4e-aff5-1b0b-e3a8-fbb4c058a7d1@suse.com>
Date: Fri, 31 Jan 2020 17:43:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d9ac8ea4-9f2a-93d5-7656-48d93930ed2e@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH v4 3/7] x86/HVM: introduce "curr" into
 hvmemul_rep_{mov, sto}s()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGEgbnVtYmVyIG9mIHVzZXMgb2YgImN1cnJlbnQiIGFscmVhZHksIGFuZCBtb3Jl
IG1heSBhcHBlYXIKZG93biB0aGUgcm9hZC4gTGF0Y2ggaW50byBhIGxvY2FsIHZhcmlhYmxlLgoK
QXQgdGhpcyBvY2Nhc2lvbiBhbHNvIGRyb3Agc3RyYXkgY2FzdHMgZnJvbSBjb2RlIGdldHRpbmcg
dG91Y2hlZCBhbnl3YXkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Ci0tLQp2NDogTmV3LgoKLS0tIGEveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKKysr
IGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKQEAgLTE3NDcsNyArMTc0Nyw4IEBAIHN0YXRp
YyBpbnQgaHZtZW11bF9yZXBfbW92cygKIHsKICAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAq
aHZtZW11bF9jdHh0ID0KICAgICAgICAgY29udGFpbmVyX29mKGN0eHQsIHN0cnVjdCBodm1fZW11
bGF0ZV9jdHh0LCBjdHh0KTsKLSAgICBzdHJ1Y3QgaHZtX3ZjcHVfaW8gKnZpbyA9ICZjdXJyZW50
LT5hcmNoLmh2bS5odm1faW87CisgICAgc3RydWN0IHZjcHUgKmN1cnIgPSBjdXJyZW50OworICAg
IHN0cnVjdCBodm1fdmNwdV9pbyAqdmlvID0gJmN1cnItPmFyY2guaHZtLmh2bV9pbzsKICAgICB1
bnNpZ25lZCBsb25nIHNhZGRyLCBkYWRkciwgYnl0ZXM7CiAgICAgcGFkZHJfdCBzZ3BhLCBkZ3Bh
OwogICAgIHVpbnQzMl90IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudDsKQEAgLTE4MDcsOCArMTgw
OCw4IEBAIHN0YXRpYyBpbnQgaHZtZW11bF9yZXBfbW92cygKICAgICB9CiAKICAgICAvKiBDaGVj
ayBmb3IgTU1JTyBvcHMgKi8KLSAgICAodm9pZCkgZ2V0X2dmbl9xdWVyeV91bmxvY2tlZChjdXJy
ZW50LT5kb21haW4sIHNncGEgPj4gUEFHRV9TSElGVCwgJnNwMm10KTsKLSAgICAodm9pZCkgZ2V0
X2dmbl9xdWVyeV91bmxvY2tlZChjdXJyZW50LT5kb21haW4sIGRncGEgPj4gUEFHRV9TSElGVCwg
JmRwMm10KTsKKyAgICBnZXRfZ2ZuX3F1ZXJ5X3VubG9ja2VkKGN1cnItPmRvbWFpbiwgc2dwYSA+
PiBQQUdFX1NISUZULCAmc3AybXQpOworICAgIGdldF9nZm5fcXVlcnlfdW5sb2NrZWQoY3Vyci0+
ZG9tYWluLCBkZ3BhID4+IFBBR0VfU0hJRlQsICZkcDJtdCk7CiAKICAgICBpZiAoIHNwMm10ID09
IHAybV9tbWlvX2RpcmVjdCB8fCBkcDJtdCA9PSBwMm1fbW1pb19kaXJlY3QgfHwKICAgICAgICAg
IChzcDJtdCA9PSBwMm1fbW1pb19kbSAmJiBkcDJtdCA9PSBwMm1fbW1pb19kbSkgKQpAQCAtMTg3
Myw3ICsxODc0LDcgQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9tb3ZzKAogICAgICAgICByYyA9
IGh2bV9jb3B5X2Zyb21fZ3Vlc3RfcGh5cyhidWYsIHNncGEsIGJ5dGVzKTsKIAogICAgIGlmICgg
cmMgPT0gSFZNVFJBTlNfb2theSApCi0gICAgICAgIHJjID0gaHZtX2NvcHlfdG9fZ3Vlc3RfcGh5
cyhkZ3BhLCBidWYsIGJ5dGVzLCBjdXJyZW50KTsKKyAgICAgICAgcmMgPSBodm1fY29weV90b19n
dWVzdF9waHlzKGRncGEsIGJ1ZiwgYnl0ZXMsIGN1cnIpOwogCiAgICAgeGZyZWUoYnVmKTsKIApA
QCAtMTkxMCw3ICsxOTExLDggQEAgc3RhdGljIGludCBodm1lbXVsX3JlcF9zdG9zKAogewogICAg
IHN0cnVjdCBodm1fZW11bGF0ZV9jdHh0ICpodm1lbXVsX2N0eHQgPQogICAgICAgICBjb250YWlu
ZXJfb2YoY3R4dCwgc3RydWN0IGh2bV9lbXVsYXRlX2N0eHQsIGN0eHQpOwotICAgIHN0cnVjdCBo
dm1fdmNwdV9pbyAqdmlvID0gJmN1cnJlbnQtPmFyY2guaHZtLmh2bV9pbzsKKyAgICBzdHJ1Y3Qg
dmNwdSAqY3VyciA9IGN1cnJlbnQ7CisgICAgc3RydWN0IGh2bV92Y3B1X2lvICp2aW8gPSAmY3Vy
ci0+YXJjaC5odm0uaHZtX2lvOwogICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgYnl0ZXM7CiAgICAg
cGFkZHJfdCBncGE7CiAgICAgcDJtX3R5cGVfdCBwMm10OwpAQCAtMTk0Myw3ICsxOTQ1LDcgQEAg
c3RhdGljIGludCBodm1lbXVsX3JlcF9zdG9zKAogICAgIH0KIAogICAgIC8qIENoZWNrIGZvciBN
TUlPIG9wICovCi0gICAgKHZvaWQpZ2V0X2dmbl9xdWVyeV91bmxvY2tlZChjdXJyZW50LT5kb21h
aW4sIGdwYSA+PiBQQUdFX1NISUZULCAmcDJtdCk7CisgICAgZ2V0X2dmbl9xdWVyeV91bmxvY2tl
ZChjdXJyLT5kb21haW4sIGdwYSA+PiBQQUdFX1NISUZULCAmcDJtdCk7CiAKICAgICBzd2l0Y2gg
KCBwMm10ICkKICAgICB7CkBAIC0xOTkyLDcgKzE5OTQsNyBAQCBzdGF0aWMgaW50IGh2bWVtdWxf
cmVwX3N0b3MoCiAgICAgICAgIGlmICggZGYgKQogICAgICAgICAgICAgZ3BhIC09IGJ5dGVzIC0g
Ynl0ZXNfcGVyX3JlcDsKIAotICAgICAgICByYyA9IGh2bV9jb3B5X3RvX2d1ZXN0X3BoeXMoZ3Bh
LCBidWYsIGJ5dGVzLCBjdXJyZW50KTsKKyAgICAgICAgcmMgPSBodm1fY29weV90b19ndWVzdF9w
aHlzKGdwYSwgYnVmLCBieXRlcywgY3Vycik7CiAKICAgICAgICAgaWYgKCBidWYgIT0gcF9kYXRh
ICkKICAgICAgICAgICAgIHhmcmVlKGJ1Zik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
