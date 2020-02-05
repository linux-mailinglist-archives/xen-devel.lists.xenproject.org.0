Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E1F15319E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:19:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKYJ-0005Rf-5n; Wed, 05 Feb 2020 13:17:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKYH-0005RU-S0
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:17:09 +0000
X-Inumbo-ID: cfbd8a04-4819-11ea-90f7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfbd8a04-4819-11ea-90f7-12813bfff9fa;
 Wed, 05 Feb 2020 13:17:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05FA1AC69;
 Wed,  5 Feb 2020 13:17:08 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <bc374d4c-e072-ca72-8b85-2120569e24e6@suse.com>
Date: Wed, 5 Feb 2020 14:17:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 6/6] domctl/vNUMA: avoid arithmetic overflow
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
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hlY2tpbmcgdGhlIHJlc3VsdCBvZiBhIG11bHRpcGxpY2F0aW9uIGFnYWluc3QgYSBjZXJ0YWlu
IGxpbWl0IGhhcyBubwpzdWZmaWNpZW50IGltcGxpY2F0aW9uIG9uIHRoZSBvcmlnaW5hbCB2YWx1
ZSdzIHJhbmdlLiBJbiB0aGUgY2FzZSBoZXJlCml0IGlzIGluIHBhcnRpY3VsYXIgcHJvYmxlbWF0
aWMgdGhhdCB3aGlsZSBoYW5kbGluZyB0aGUgZG9tY3RsIHdlIGRvCgogICAgaWYgKCBjb3B5X2Zy
b21fZ3Vlc3QoaW5mby0+dmRpc3RhbmNlLCB1aW5mby0+dmRpc3RhbmNlLAogICAgICAgICAgICAg
ICAgICAgICAgICAgbnJfdm5vZGVzICogbnJfdm5vZGVzKSApCiAgICAgICAgZ290byB2bnVtYV9m
YWlsOwoKd2hpY2ggbWVhbnMgY29weWluZyBzaXplb2YodW5zaWduZWQgaW50KSAqIChucl92bm9k
ZXMgKiBucl92bm9kZXMpCmJ5dGVzLCBhbmQgdGhlIGhhbmRsaW5nIG9mIFhFTk1FTV9nZXRfdm51
bWFpbmZvIHNpbWlsYXJseSBoYXMKCiAgICAgICAgdG1wLnZkaXN0YW5jZSA9IHhtYWxsb2NfYXJy
YXkodW5zaWduZWQgaW50LCBkb21fdm5vZGVzICogZG9tX3Zub2Rlcyk7Cgp3aGljaCBtZWFucyBh
bGxvY2F0aW5nIHNpemVvZih1bnNpZ25lZCBpbnQpICogKGRvbV92bm9kZXMgKiBkb21fdm5vZGVz
KQpieXRlcywgd2hlcmVhcyBpbiB0aGVuIGdvZXMgb24gZG9pbmcgdGhpczoKCiAgICAgICAgbWVt
Y3B5KHRtcC52ZGlzdGFuY2UsIGQtPnZudW1hLT52ZGlzdGFuY2UsCiAgICAgICAgICAgICAgIHNp
emVvZigqZC0+dm51bWEtPnZkaXN0YW5jZSkgKiBkb21fdm5vZGVzICogZG9tX3Zub2Rlcyk7CgpO
b3RlIHRoZSBsYWNrIG9mIHBhcmVudGhlc2VzIGluIHRoZSBtdWx0aXBsaWNhdGlvbiBleHByZXNz
aW9uLgoKQWRqdXN0IHRoZSBvdmVyZmxvdyBjaGVjaywgbW92aW5nIHRoZSBtdXN0LW5vdC1iZS16
ZXJvIG9uZSByaWdodCBuZXh0IHRvCml0IHRvIGF2b2lkIHF1ZXN0aW9ucyBvbiB3aGV0aGVyIHRo
ZXJlIG1pZ2h0IGJlIGRpdmlzaW9uIGJ5IHplcm8uCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCisrKyBiL3hl
bi9jb21tb24vZG9tY3RsLmMKQEAgLTI2Myw3ICsyNjMsOCBAQCBzdGF0aWMgc3RydWN0IHZudW1h
X2luZm8gKnZudW1hX2FsbG9jKHVuCiAgICAgICogQ2hlY2sgaWYgYW55IG9mIHRoZSBhbGxvY2F0
aW9ucyBhcmUgYmlnZ2VyIHRoYW4gUEFHRV9TSVpFLgogICAgICAqIFNlZSBYU0EtNzcuCiAgICAg
ICovCi0gICAgaWYgKCBucl92bm9kZXMgKiBucl92bm9kZXMgPiAoUEFHRV9TSVpFIC8gc2l6ZW9m
KCp2bnVtYS0+dmRpc3RhbmNlKSkgfHwKKyAgICBpZiAoIG5yX3Zub2RlcyA9PSAwIHx8CisgICAg
ICAgICBucl92bm9kZXMgPiAoUEFHRV9TSVpFIC8gc2l6ZW9mKCp2bnVtYS0+dmRpc3RhbmNlKSAv
IG5yX3Zub2RlcykgfHwKICAgICAgICAgIG5yX3JhbmdlcyA+IChQQUdFX1NJWkUgLyBzaXplb2Yo
KnZudW1hLT52bWVtcmFuZ2UpKSApCiAgICAgICAgIHJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwog
CkBAIC0zMDIsNyArMzAzLDcgQEAgc3RhdGljIHN0cnVjdCB2bnVtYV9pbmZvICp2bnVtYV9pbml0
KGNvbgogCiAgICAgbnJfdm5vZGVzID0gdWluZm8tPm5yX3Zub2RlczsKIAotICAgIGlmICggbnJf
dm5vZGVzID09IDAgfHwgdWluZm8tPm5yX3ZjcHVzICE9IGQtPm1heF92Y3B1cyB8fCB1aW5mby0+
cGFkICE9IDAgKQorICAgIGlmICggdWluZm8tPm5yX3ZjcHVzICE9IGQtPm1heF92Y3B1cyB8fCB1
aW5mby0+cGFkICE9IDAgKQogICAgICAgICByZXR1cm4gRVJSX1BUUihyZXQpOwogCiAgICAgaW5m
byA9IHZudW1hX2FsbG9jKG5yX3Zub2RlcywgdWluZm8tPm5yX3ZtZW1yYW5nZXMsIGQtPm1heF92
Y3B1cyk7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
