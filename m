Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938C974C1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 10:23:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0Lra-0000Ay-Ga; Wed, 21 Aug 2019 08:21:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0LrY-000089-C1
 for xen-devel@lists.xen.org; Wed, 21 Aug 2019 08:21:00 +0000
X-Inumbo-ID: 995cd5e0-c3ec-11e9-adc2-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 995cd5e0-c3ec-11e9-adc2-12813bfff9fa;
 Wed, 21 Aug 2019 08:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566375656; x=1597911656;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ZUK7mnqnzUvJEAC7JpM+QGwFjzUJUb1yYGxdXUmn7KY=;
 b=k0Z8j+CKP7aEFB+O3dD998cge71ElQdvyLYohY4v/E23EcaN0eR1qVuN
 z/wGIG8R2y0HSYkorKt/OtQ16vm8NoRTQUoTpstXhVPY0NjjWa5sk/9ME
 6emk2natPDe2WqYyKjYL6YATsh2tTOIF1uuBb0FJrbGE0qwUuVqtZnR/j w=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="410765065"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 08:20:55 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7FBCCA244A; Wed, 21 Aug 2019 08:20:54 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:20:21 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 08:20:20 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server
 id
 15.0.1367.3 via Frontend Transport; Wed, 21 Aug 2019 08:20:17 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Wed, 21 Aug 2019 08:19:25 +0000
Message-ID: <20190821081931.90887-9-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
In-Reply-To: <20190821081931.90887-1-wipawel@amazon.de>
References: <20190821081931.90887-1-wipawel@amazon.de>
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH 08/14] livepatch: always print XENLOG_ERR
 information
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wipawel@amazon.com, Wei Liu <wl@xen.org>, Ross
 Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, mpohlack@amazon.com,
 Pawel Wieczorkiewicz <wipawel@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBsb3Qgb2YgbGVnaXRpbWF0ZSBlcnJvciBtZXNzYWdlcyB3ZXJlIGhpZGRlbiBiZWhpbmQgZGVi
dWcgcHJpbnRrCm9ubHkuIE1vc3Qgb2YgdGhlc2UgbWVzc2FnZXMgY2FuIGJlIHRyaWdnZXJlZCBi
eSBsb2FkaW5nIGEgbWFsZm9ybWVkCmhvdHBhdGNoIHBheWxvYWQgYW5kIGFyZSBwcmljZWxlc3Mg
Zm9yIHVuZGVyc3RhbmRpbmcgaXNzdWVzIHdpdGggc3VjaApwYXlsb2Fkcy4KVGh1cywgYWx3YXlz
IGRpc3BsYXkgYWxsIHJlbGV2YW50IFhFTkxPR19FUlIgbWVzc2FnZXMuCgpTaWduZWQtb2ZmLWJ5
OiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBB
bWl0IFNoYWggPGFhbXNAYW1hem9uLmRlPgpSZXZpZXdlZC1ieTogTWFydGluIE1hemVpbiA8YW1h
emVpbkBhbWF6b24uZGU+ClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxAYW1hem9u
LmRlPgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5j
b20+Ci0tLQogeGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jIHwgMTYgKysrKysrKystLS0tLS0tLQog
eGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgIHwgMzggKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jIGIveGVuL2FyY2gv
eDg2L2xpdmVwYXRjaC5jCmluZGV4IDQwNmViOTEwY2MuLjQzNmVlNDBmZTEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9saXZlcGF0Y2guYworKysgYi94ZW4vYXJjaC94ODYvbGl2ZXBhdGNoLmMK
QEAgLTEyNiw3ICsxMjYsNyBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfdmVyaWZ5X2VsZihjb25zdCBz
dHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmKQogICAgICAgICAgaGRyLT5lX2lkZW50W0VJX0NMQVNT
XSAhPSBFTEZDTEFTUzY0IHx8CiAgICAgICAgICBoZHItPmVfaWRlbnRbRUlfREFUQV0gIT0gRUxG
REFUQTJMU0IgKQogICAgIHsKLSAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0gg
IiVzOiBVbnN1cHBvcnRlZCBFTEYgTWFjaGluZSB0eXBlIVxuIiwKKyAgICAgICAgcHJpbnRrKFhF
TkxPR19FUlIgTElWRVBBVENIICIlczogVW5zdXBwb3J0ZWQgRUxGIE1hY2hpbmUgdHlwZSFcbiIs
CiAgICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
OwogICAgIH0KQEAgLTE1Miw3ICsxNTIsNyBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfcGVyZm9ybV9y
ZWwoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2VsZl9zZWMgKmJhc2UsCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGxpdmVwYXRjaF9lbGZfc2VjICpyZWxhKQog
ewotICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogU0hUX1JFTCByZWxvY2F0
aW9uIHVuc3VwcG9ydGVkXG4iLAorICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6
IFNIVF9SRUwgcmVsb2NhdGlvbiB1bnN1cHBvcnRlZFxuIiwKICAgICAgICAgICAgIGVsZi0+bmFt
ZSk7CiAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogfQpAQCAtMTcyLDE5ICsxNzIsMTkgQEAgaW50
IGFyY2hfbGl2ZXBhdGNoX3BlcmZvcm1fcmVsYShzdHJ1Y3QgbGl2ZXBhdGNoX2VsZiAqZWxmLAog
CiAgICAgICAgIGlmICggc3ltbmR4ID09IFNUTl9VTkRFRiApCiAgICAgICAgIHsKLSAgICAgICAg
ICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogRW5jb3VudGVyZWQgU1ROX1VO
REVGXG4iLAorICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogRW5j
b3VudGVyZWQgU1ROX1VOREVGXG4iLAogICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUpOwog
ICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICB9CiAgICAgICAgIGVsc2Ug
aWYgKCBzeW1uZHggPj0gZWxmLT5uc3ltICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50
ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBSZWxhdGl2ZSByZWxvY2F0aW9uIHdhbnRzIHN5
bWJvbEAldSB3aGljaCBpcyBwYXN0IGVuZCFcbiIsCisgICAgICAgICAgICBwcmludGsoWEVOTE9H
X0VSUiBMSVZFUEFUQ0ggIiVzOiBSZWxhdGl2ZSByZWxvY2F0aW9uIHdhbnRzIHN5bWJvbEAldSB3
aGljaCBpcyBwYXN0IGVuZCFcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgc3lt
bmR4KTsKICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwogICAgICAgICB9CiAgICAgICAgIGVs
c2UgaWYgKCAhZWxmLT5zeW1bc3ltbmR4XS5zeW0gKQogICAgICAgICB7Ci0gICAgICAgICAgICBk
cHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IE5vIHN5bWJvbEAldVxuIiwKKyAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6IE5vIHN5bWJvbEAldVxuIiwK
ICAgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBzeW1uZHgpOwogICAgICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KQEAgLTIyMiwxNCArMjIyLDE0IEBAIGludCBhcmNoX2xp
dmVwYXRjaF9wZXJmb3JtX3JlbGEoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwKICAgICAgICAg
ICAgICooaW50MzJfdCAqKWRlc3QgPSB2YWw7CiAgICAgICAgICAgICBpZiAoIChpbnQ2NF90KXZh
bCAhPSAqKGludDMyX3QgKilkZXN0ICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBk
cHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IE92ZXJmbG93IGluIHJlbG9jYXRpb24g
JXUgaW4gJXMgZm9yICVzIVxuIiwKKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBM
SVZFUEFUQ0ggIiVzOiBPdmVyZmxvdyBpbiByZWxvY2F0aW9uICV1IGluICVzIGZvciAlcyFcbiIs
CiAgICAgICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGksIHJlbGEtPm5hbWUsIGJhc2Ut
Pm5hbWUpOwogICAgICAgICAgICAgICAgIHJldHVybiAtRU9WRVJGTE9XOwogICAgICAgICAgICAg
fQogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgZGVmYXVsdDoKLSAgICAgICAgICAgIGRw
cmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlczogVW5oYW5kbGVkIHJlbG9jYXRpb24gJWx1
XG4iLAorICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogVW5oYW5k
bGVkIHJlbG9jYXRpb24gJWx1XG4iLAogICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIEVM
RjY0X1JfVFlQRShyLT5yX2luZm8pKTsKICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsK
ICAgICAgICAgfQpAQCAtMjM4LDcgKzIzOCw3IEBAIGludCBhcmNoX2xpdmVwYXRjaF9wZXJmb3Jt
X3JlbGEoc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwKICAgICByZXR1cm4gMDsKIAogIGJhZF9v
ZmZzZXQ6Ci0gICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBSZWxhdGl2ZSBy
ZWxvY2F0aW9uIG9mZnNldCBpcyBwYXN0ICVzIHNlY3Rpb24hXG4iLAorICAgIHByaW50ayhYRU5M
T0dfRVJSIExJVkVQQVRDSCAiJXM6IFJlbGF0aXZlIHJlbG9jYXRpb24gb2Zmc2V0IGlzIHBhc3Qg
JXMgc2VjdGlvbiFcbiIsCiAgICAgICAgICAgICBlbGYtPm5hbWUsIGJhc2UtPm5hbWUpOwogICAg
IHJldHVybiAtRUlOVkFMOwogfQpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYyBi
L3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXggYzRhMTA3ZDkxYy4uNTg1ZWM5ODE5YSAxMDA2
NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYworKysgYi94ZW4vY29tbW9uL2xpdmVwYXRj
aC5jCkBAIC0yMTcsNyArMjE3LDcgQEAgc3RhdGljIGludCByZXNvbHZlX29sZF9hZGRyZXNzKHN0
cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZiwKICAgICAgICAgZi0+b2xkX2FkZHIgPSAodm9pZCAqKWxp
dmVwYXRjaF9zeW1ib2xzX2xvb2t1cF9ieV9uYW1lKGYtPm5hbWUpOwogICAgICAgICBpZiAoICFm
LT5vbGRfYWRkciApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwg
TElWRVBBVENIICIlczogQ291bGQgbm90IHJlc29sdmUgb2xkIGFkZHJlc3Mgb2YgJXNcbiIsCisg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBDb3VsZCBub3QgcmVz
b2x2ZSBvbGQgYWRkcmVzcyBvZiAlc1xuIiwKICAgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1l
LCBmLT5uYW1lKTsKICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwogICAgICAgICB9CkBAIC0z
MzYsNyArMzM2LDcgQEAgc3RhdGljIGludCBtb3ZlX3BheWxvYWQoc3RydWN0IHBheWxvYWQgKnBh
eWxvYWQsIHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYpCiAgICAgdGV4dF9idWYgPSB2bWFsbG9j
X3hlbihzaXplICogUEFHRV9TSVpFKTsKICAgICBpZiAoICF0ZXh0X2J1ZiApCiAgICAgewotICAg
ICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IENvdWxkIG5vdCBhbGxvY2F0
ZSBtZW1vcnkgZm9yIHBheWxvYWQhXG4iLAorICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZF
UEFUQ0ggIiVzOiBDb3VsZCBub3QgYWxsb2NhdGUgbWVtb3J5IGZvciBwYXlsb2FkIVxuIiwKICAg
ICAgICAgICAgICAgICBlbGYtPm5hbWUpOwogICAgICAgICByYyA9IC1FTk9NRU07CiAgICAgICAg
IGdvdG8gb3V0OwpAQCAtNDM0LDcgKzQzNCw3IEBAIHN0YXRpYyBib29sIHNlY3Rpb25fb2soY29u
c3Qgc3RydWN0IGxpdmVwYXRjaF9lbGYgKmVsZiwKIAogICAgIGlmICggc2VjLT5zZWMtPnNoX3Np
emUgJSBzeiApCiAgICAgewotICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAi
JXM6IFdyb25nIHNpemUgJSJQUkl1RWxmV29yZCIgb2YgJXMgKG11c3QgYmUgbXVsdGlwbGUgb2Yg
JXp1KVxuIiwKKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogV3Jvbmcg
c2l6ZSAlIlBSSXVFbGZXb3JkIiBvZiAlcyAobXVzdCBiZSBtdWx0aXBsZSBvZiAlenUpXG4iLAog
ICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgc2VjLT5zZWMtPnNoX3NpemUsIHNlYy0+bmFtZSwg
c3opOwogICAgICAgICByZXR1cm4gZmFsc2U7CiAgICAgfQpAQCAtNDU2LDcgKzQ1Niw3IEBAIHN0
YXRpYyBpbnQgY2hlY2tfeGVuX2J1aWxkX2lkKGNvbnN0IHN0cnVjdCBwYXlsb2FkICpwYXlsb2Fk
KQogICAgICAgICByZXR1cm4gcmM7CiAKICAgICBpZiAoIHBheWxvYWQtPnhlbl9kZXAubGVuICE9
IGxlbiB8fCBtZW1jbXAoaWQsIHBheWxvYWQtPnhlbl9kZXAucCwgbGVuKSApIHsKLSAgICAgICAg
ZHByaW50ayhYRU5MT0dfRVJSLCAiJXMlczogY2hlY2sgYWdhaW5zdCBoeXBlcnZpc29yIGJ1aWxk
LWlkIGZhaWxlZCFcbiIsCisgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXMl
czogY2hlY2sgYWdhaW5zdCBoeXBlcnZpc29yIGJ1aWxkLWlkIGZhaWxlZCFcbiIsCiAgICAgICAg
ICAgICAgICAgTElWRVBBVENILCBwYXlsb2FkLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FSU5W
QUw7CiAgICAgfQpAQCAtNDc5LDIxICs0NzksMjEgQEAgc3RhdGljIGludCBjaGVja19zcGVjaWFs
X3NlY3Rpb25zKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hfZWxmICplbGYpCiAgICAgICAgIHNlYyA9
IGxpdmVwYXRjaF9lbGZfc2VjX2J5X25hbWUoZWxmLCBuYW1lc1tpXSk7CiAgICAgICAgIGlmICgg
IXNlYyApCiAgICAgICAgIHsKLSAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBB
VENIICIlczogJXMgaXMgbWlzc2luZyFcbiIsCisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VS
UiBMSVZFUEFUQ0ggIiVzOiAlcyBpcyBtaXNzaW5nIVxuIiwKICAgICAgICAgICAgICAgICAgICAg
ZWxmLT5uYW1lLCBuYW1lc1tpXSk7CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICAg
ICAgfQogCiAgICAgICAgIGlmICggIXNlYy0+c2VjLT5zaF9zaXplICkKICAgICAgICAgewotICAg
ICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiAlcyBpcyBlbXB0eSFc
biIsCisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiAlcyBpcyBl
bXB0eSFcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgbmFtZXNbaV0pOwogICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KIAogICAgICAgICBpZiAoIHRlc3Rf
YW5kX3NldF9iaXQoaSwgZm91bmQpICkKICAgICAgICAgewotICAgICAgICAgICAgZHByaW50ayhY
RU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiAlcyB3YXMgc2VlbiBtb3JlIHRoYW4gb25jZSFcbiIs
CisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiAlcyB3YXMgc2Vl
biBtb3JlIHRoYW4gb25jZSFcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgbmFt
ZXNbaV0pOwogICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgIH0KQEAgLTUyOSwy
MSArNTI5LDIxIEBAIHN0YXRpYyBpbnQgY2hlY2tfcGF0Y2hpbmdfc2VjdGlvbnMoY29uc3Qgc3Ry
dWN0IGxpdmVwYXRjaF9lbGYgKmVsZikKICAgICAgICAgc2VjID0gbGl2ZXBhdGNoX2VsZl9zZWNf
YnlfbmFtZShlbGYsIG5hbWVzW2ldKTsKICAgICAgICAgaWYgKCAhc2VjICkKICAgICAgICAgewot
ICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfSU5GTywgTElWRVBBVENIICIlczogJXMgaXMgbWlz
c2luZyFcbiIsCisgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19ERUJVRywgTElWRVBBVENIICIl
czogJXMgaXMgbWlzc2luZyFcbiIsCiAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFtZSwgbmFt
ZXNbaV0pOwogICAgICAgICAgICAgY29udGludWU7IC8qIFRoaXMgc2VjdGlvbiBpcyBvcHRpb25h
bCAqLwogICAgICAgICB9CiAKICAgICAgICAgaWYgKCAhc2VjLT5zZWMtPnNoX3NpemUgKQogICAg
ICAgICB7Ci0gICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6ICVz
IGlzIGVtcHR5IVxuIiwKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAi
JXM6ICVzIGlzIGVtcHR5IVxuIiwKICAgICAgICAgICAgICAgICAgICAgZWxmLT5uYW1lLCBuYW1l
c1tpXSk7CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICAgICAgfQogCiAgICAgICAg
IGlmICggdGVzdF9hbmRfc2V0X2JpdChpLCBmb3VuZCkgKQogICAgICAgICB7Ci0gICAgICAgICAg
ICBkcHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6ICVzIHdhcyBzZWVuIG1vcmUgdGhh
biBvbmNlIVxuIiwKKyAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXM6
ICVzIHdhcyBzZWVuIG1vcmUgdGhhbiBvbmNlIVxuIiwKICAgICAgICAgICAgICAgICAgICAgZWxm
LT5uYW1lLCBuYW1lc1tpXSk7CiAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICAgICAg
fQpAQCAtNjE1LDcgKzYxNSw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9wYXlsb2FkKHN0cnVjdCBw
YXlsb2FkICpwYXlsb2FkLAogCiAgICAgICAgICAgICBpZiAoIGYtPnZlcnNpb24gIT0gTElWRVBB
VENIX1BBWUxPQURfVkVSU0lPTiApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgZHBy
aW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBXcm9uZyB2ZXJzaW9uICgldSkuIEV4cGVj
dGVkICVkIVxuIiwKKyAgICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0gg
IiVzOiBXcm9uZyB2ZXJzaW9uICgldSkuIEV4cGVjdGVkICVkIVxuIiwKICAgICAgICAgICAgICAg
ICAgICAgICAgIGVsZi0+bmFtZSwgZi0+dmVyc2lvbiwgTElWRVBBVENIX1BBWUxPQURfVkVSU0lP
Tik7CiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICAgICAgfQpA
QCAtNjIzLDcgKzYyMyw3IEBAIHN0YXRpYyBpbnQgcHJlcGFyZV9wYXlsb2FkKHN0cnVjdCBwYXls
b2FkICpwYXlsb2FkLAogICAgICAgICAgICAgLyogJ29sZF9hZGRyJywgJ25ld19hZGRyJywgJ25l
d19zaXplJyBjYW4gYWxsIGJlIHplcm8uICovCiAgICAgICAgICAgICBpZiAoICFmLT5vbGRfc2l6
ZSApCiAgICAgICAgICAgICB7Ci0gICAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBM
SVZFUEFUQ0ggIiVzOiBBZGRyZXNzIG9yIHNpemUgZmllbGRzIGFyZSB6ZXJvIVxuIiwKKyAgICAg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBBZGRyZXNzIG9yIHNp
emUgZmllbGRzIGFyZSB6ZXJvIVxuIiwKICAgICAgICAgICAgICAgICAgICAgICAgIGVsZi0+bmFt
ZSk7CiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgICAgICAgICB9CkBAIC03
NjIsMTQgKzc2MiwxNCBAQCBzdGF0aWMgaW50IHByZXBhcmVfcGF5bG9hZChzdHJ1Y3QgcGF5bG9h
ZCAqcGF5bG9hZCwKICAgICAgICAgICAgIGlmICggKGluc3RyIDwgcmVnaW9uLT5zdGFydCAmJiBp
bnN0ciA+PSByZWdpb24tPmVuZCkgfHwKICAgICAgICAgICAgICAgICAgKHJlcGxhY2VtZW50IDwg
cmVnaW9uLT5zdGFydCAmJiByZXBsYWNlbWVudCA+PSByZWdpb24tPmVuZCkgKQogICAgICAgICAg
ICAgewotICAgICAgICAgICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENIICIlcyBB
bHQgcGF0Y2hpbmcgb3V0c2lkZSBwYXlsb2FkOiAlcCFcbiIsCisgICAgICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlcyBBbHQgcGF0Y2hpbmcgb3V0c2lkZSBwYXlsb2Fk
OiAlcCFcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICBlbGYtPm5hbWUsIGluc3RyKTsKICAg
ICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKICAgICAgICAgICAgIH0KICAgICAgICAgfQog
ICAgICAgICBhcHBseV9hbHRlcm5hdGl2ZXMoc3RhcnQsIGVuZCk7CiAjZWxzZQotICAgICAgICBk
cHJpbnRrKFhFTkxPR19FUlIsIExJVkVQQVRDSCAiJXM6IFdlIGRvbid0IHN1cHBvcnQgYWx0ZXJu
YXRpdmUgcGF0Y2hpbmchXG4iLAorICAgICAgICBwcmludGsoWEVOTE9HX0VSUiBMSVZFUEFUQ0gg
IiVzOiBXZSBkb24ndCBzdXBwb3J0IGFsdGVybmF0aXZlIHBhdGNoaW5nIVxuIiwKICAgICAgICAg
ICAgICAgICBlbGYtPm5hbWUpOwogICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAjZW5kaWYK
QEAgLTc5Miw3ICs3OTIsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfcGF5bG9hZChzdHJ1Y3QgcGF5
bG9hZCAqcGF5bG9hZCwKICAgICAgICAgcmVnaW9uLT5leCA9IHM7CiAgICAgICAgIHJlZ2lvbi0+
ZXhfZW5kID0gZTsKICNlbHNlCi0gICAgICAgIGRwcmludGsoWEVOTE9HX0VSUiwgTElWRVBBVENI
ICIlczogV2UgZG9uJ3Qgc3VwcG9ydCAuZXhfdGFibGUhXG4iLAorICAgICAgICBwcmludGsoWEVO
TE9HX0VSUiBMSVZFUEFUQ0ggIiVzOiBXZSBkb24ndCBzdXBwb3J0IC5leF90YWJsZSFcbiIsCiAg
ICAgICAgICAgICAgICAgZWxmLT5uYW1lKTsKICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwog
I2VuZGlmCkBAIC05MDEsNyArOTAxLDcgQEAgc3RhdGljIGludCBidWlsZF9zeW1ib2xfdGFibGUo
c3RydWN0IHBheWxvYWQgKnBheWxvYWQsCiAgICAgICAgICAgICBpZiAoIHN5bWJvbHNfbG9va3Vw
X2J5X25hbWUoc3ltdGFiW2ldLm5hbWUpIHx8CiAgICAgICAgICAgICAgICAgIGxpdmVwYXRjaF9z
eW1ib2xzX2xvb2t1cF9ieV9uYW1lKHN5bXRhYltpXS5uYW1lKSApCiAgICAgICAgICAgICB7Ci0g
ICAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfRVJSLCBMSVZFUEFUQ0ggIiVzOiBkdXBsaWNh
dGUgbmV3IHN5bWJvbDogJXNcbiIsCisgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIg
TElWRVBBVENIICIlczogZHVwbGljYXRlIG5ldyBzeW1ib2w6ICVzXG4iLAogICAgICAgICAgICAg
ICAgICAgICAgICAgZWxmLT5uYW1lLCBzeW10YWJbaV0ubmFtZSk7CiAgICAgICAgICAgICAgICAg
eGZyZWUoc3ltdGFiKTsKICAgICAgICAgICAgICAgICB4ZnJlZShzdHJ0YWIpOwpAQCAtMTY1Miw3
ICsxNjUyLDcgQEAgc3RhdGljIGludCBidWlsZF9pZF9kZXAoc3RydWN0IHBheWxvYWQgKnBheWxv
YWQsIGJvb2xfdCBpbnRlcm5hbCkKICAgICBpZiAoIHBheWxvYWQtPmRlcC5sZW4gIT0gbGVuIHx8
CiAgICAgICAgICBtZW1jbXAoaWQsIHBheWxvYWQtPmRlcC5wLCBsZW4pICkKICAgICB7Ci0gICAg
ICAgIGRwcmludGsoWEVOTE9HX0VSUiwgIiVzJXM6IGNoZWNrIGFnYWluc3QgJXMgYnVpbGQtaWQg
ZmFpbGVkIVxuIiwKKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlcyVzOiBj
aGVjayBhZ2FpbnN0ICVzIGJ1aWxkLWlkIGZhaWxlZCFcbiIsCiAgICAgICAgICAgICAgICAgTElW
RVBBVENILCBwYXlsb2FkLT5uYW1lLCBuYW1lKTsKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAg
ICAgfQpAQCAtMTcxMiw3ICsxNzEyLDcgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfYWN0aW9uKHN0
cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9hY3Rpb24gKmFjdGlvbikKICAgICAgICAgICAgIC8q
IFdlIHNob3VsZCBiZSB0aGUgbGFzdCBhcHBsaWVkIG9uZS4gKi8KICAgICAgICAgICAgIGlmICgg
cCAhPSBkYXRhICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxP
R19FUlIsICIlcyVzOiBjYW4ndCB1bmxvYWQuIFRvcCBpcyAlcyFcbiIsCisgICAgICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlcyVzOiBjYW4ndCB1bmxvYWQuIFRvcCBp
cyAlcyFcbiIsCiAgICAgICAgICAgICAgICAgICAgICAgICBMSVZFUEFUQ0gsIGRhdGEtPm5hbWUs
IHAtPm5hbWUpOwogICAgICAgICAgICAgICAgIHJjID0gLUVCVVNZOwogICAgICAgICAgICAgICAg
IGJyZWFrOwpAQCAtMTc0OCw3ICsxNzQ4LDcgQEAgc3RhdGljIGludCBsaXZlcGF0Y2hfYWN0aW9u
KHN0cnVjdCB4ZW5fc3lzY3RsX2xpdmVwYXRjaF9hY3Rpb24gKmFjdGlvbikKICAgICAgICAgICAg
ICAqLwogICAgICAgICAgICAgaWYgKCBkYXRhLT5yZXZlcnRlZCAmJiAhZGF0YS0+c2FmZV90b19y
ZWFwcGx5ICkKICAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBkcHJpbnRrKFhFTkxPR19F
UlIsICIlcyVzOiBjYW4ndCByZXZlcnQgYXMgcGF5bG9hZCBoYXMgLmRhdGEuIFBsZWFzZSB1bmxv
YWQhXG4iLAorICAgICAgICAgICAgICAgIHByaW50ayhYRU5MT0dfRVJSIExJVkVQQVRDSCAiJXMl
czogY2FuJ3QgcmV2ZXJ0IGFzIHBheWxvYWQgaGFzIC5kYXRhLiBQbGVhc2UgdW5sb2FkIVxuIiwK
ICAgICAgICAgICAgICAgICAgICAgICAgIExJVkVQQVRDSCwgZGF0YS0+bmFtZSk7CiAgICAgICAg
ICAgICAgICAgZGF0YS0+cmMgPSAtRUlOVkFMOwogICAgICAgICAgICAgICAgIGJyZWFrOwotLSAK
Mi4xNi41CgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vu
c3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFl
Z2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5i
dXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3
OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
