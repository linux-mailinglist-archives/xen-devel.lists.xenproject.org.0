Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90310AFA7C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 12:35:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7zvy-0000Q7-6P; Wed, 11 Sep 2019 10:33:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AiaO=XG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1i7zvw-0000P1-AV
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 10:33:08 +0000
X-Inumbo-ID: 7a46ec36-d47f-11e9-b299-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7a46ec36-d47f-11e9-b299-bc764e2007e4;
 Wed, 11 Sep 2019 10:32:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u14so19450744ljj.11
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 03:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=D1tmQx4QQQTXiGm/taYp9ljWrLsYP/6Sdp2V1mTvY5Q=;
 b=mkSkUftQESBwTE4pIFjxK9nOfDpujozkVjuwu1pLch7xAXRF/bECdIU1TZyHk5wChg
 UOWQlOXQPb+UjPLj1fcfEKamv9s8PynMB/StH3U1vRP3AVaxbIt6pFCra/d5IR0oaQ7N
 y1dARxwpsAU8HA4wOmcyUrXnodrkPo2Z2BlzebyvDBGOSb5pOKWcckzW0t2j7WZ1hVT7
 R0m8q0eaAzywezFAe9j1YCCFj/MzugvLzL2bEl1hD7r+TQXlb1Z6aydmgpSAnAFAVSFH
 4ybJJfc3bCZccsg+w7QQKvZRgQdFcaChtvEEeXHp1GLQq+AB+t2h01uvp+cZrj+uefcl
 dLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=D1tmQx4QQQTXiGm/taYp9ljWrLsYP/6Sdp2V1mTvY5Q=;
 b=Gi0uxWIXJRxiLsFeowNR8QaCk/ZcT1BtiEG0h9rrZLOUU8AtRKatA5tq85Y/B457TX
 GSAEGcWY6QaHXIn52YV45MESDIi6t9t589qYFQunRgHe/5lMYFuqrPiw6TGQCQUURhN4
 dk84kLfOtbKFMUU6oF+JqELdjN/UP8cYBrvJT99dmF2eI47erFfP2buIWNwjR+jDV+iI
 9H9yU+V2/D8ZSDA4NEDvsjbdUSKCSVbqMWNMBnBBaFW5DShDKhh8gcHiwiJClCpdnXvC
 vmX8mXh2R3rjThzcxUC9eYjF14RBiZfqk6dSW8YvVi+ZXCyAsWO2wX+Ut2YdNuKOSJpG
 Ur3w==
X-Gm-Message-State: APjAAAUNA9baGP0Pw155WKcVU6WkOAm9+rc2Lp4h3KsxRqPw4WdNmUXY
 R1d+k5tH2c9GYhBGHP8r6zkenr/m40U=
X-Google-Smtp-Source: APXvYqzHZOS70e5XAk+zkJW0cCEdc6izNMK3UieVBImeIDCwGtsLRl0Oq/AKUp5DG3TGajQ0KAUjAw==
X-Received: by 2002:a2e:504f:: with SMTP id v15mr23161379ljd.67.1568197957942; 
 Wed, 11 Sep 2019 03:32:37 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id w27sm4585275ljd.55.2019.09.11.03.32.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 11 Sep 2019 03:32:37 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 13:32:21 +0300
Message-Id: <1568197942-15374-9-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
References: <1568197942-15374-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 8/9] sched:credit: get guest time from time
 accounting code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCldoaWxlIHRoZSBD
cmVkaXQgc2NoZWR1bGVyIGNvZGUgdXNlcyBndWVzdCB0aW1lIGZyb20gdGhlCm90aGVyIHBjcHUs
IHdlIGhhdmUgdG8gdXNlIGxvY2tlZCB0aW1lIGFjY291bnRpbmcuCgpTaWduZWQtb2ZmLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9jb21tb24vS2Nv
bmZpZyAgICAgICAgfCAgMSArCiB4ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jIHwgMTIgKysrKyst
LS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tjb25maWcKaW5k
ZXggYzE3NDhkZC4uZDE3YThiNCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBi
L3hlbi9jb21tb24vS2NvbmZpZwpAQCAtMjI3LDYgKzIyNyw3IEBAIGNvbmZpZyBUQUNDX05FRURT
X0xPQ0sKIGNvbmZpZyBTQ0hFRF9DUkVESVQKIAlib29sICJDcmVkaXQgc2NoZWR1bGVyIHN1cHBv
cnQiCiAJZGVmYXVsdCB5CisJc2VsZWN0IFRBQ0NfTkVFRFNfTE9DSwogCS0tLWhlbHAtLS0KIAkg
IFRoZSB0cmFkaXRpb25hbCBjcmVkaXQgc2NoZWR1bGVyIGlzIGEgZ2VuZXJhbCBwdXJwb3NlIHNj
aGVkdWxlci4KIApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyBiL3hlbi9j
b21tb24vc2NoZWRfY3JlZGl0LmMKaW5kZXggODFkZWU1ZS4uYWM2YjllNiAxMDA2NDQKLS0tIGEv
eGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYworKysgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5j
CkBAIC0zMjQsMTYgKzMyNCwxNSBAQCBydW5xX3JlbW92ZShzdHJ1Y3QgY3NjaGVkX3ZjcHUgKnN2
YykKICAgICBfX3J1bnFfcmVtb3ZlKHN2Yyk7CiB9CiAKLXN0YXRpYyB2b2lkIGJ1cm5fY3JlZGl0
cyhzdHJ1Y3QgY3NjaGVkX3ZjcHUgKnN2Yywgc190aW1lX3Qgbm93KQorc3RhdGljIHZvaWQgYnVy
bl9jcmVkaXRzKHN0cnVjdCBjc2NoZWRfdmNwdSAqc3ZjLCBzX3RpbWVfdCBkZWx0YSkKIHsKLSAg
ICBzX3RpbWVfdCBkZWx0YTsKICAgICB1aW50NjRfdCB2YWw7CiAgICAgdW5zaWduZWQgaW50IGNy
ZWRpdHM7CiAKICAgICAvKiBBc3NlcnQgc3ZjIGlzIGN1cnJlbnQgKi8KICAgICBBU1NFUlQoIHN2
YyA9PSBDU0NIRURfVkNQVShjdXJyX29uX2NwdShzdmMtPnZjcHUtPnByb2Nlc3NvcikpICk7CiAK
LSAgICBpZiAoIChkZWx0YSA9IG5vdyAtIHN2Yy0+c3RhcnRfdGltZSkgPD0gMCApCisgICAgaWYg
KCBkZWx0YSA8PSAwICkKICAgICAgICAgcmV0dXJuOwogCiAgICAgdmFsID0gZGVsdGEgKiBDU0NI
RURfQ1JFRElUU19QRVJfTVNFQyArIHN2Yy0+cmVzaWR1YWw7CkBAIC0zNDEsNyArMzQwLDYgQEAg
c3RhdGljIHZvaWQgYnVybl9jcmVkaXRzKHN0cnVjdCBjc2NoZWRfdmNwdSAqc3ZjLCBzX3RpbWVf
dCBub3cpCiAgICAgY3JlZGl0cyA9IHZhbDsKICAgICBBU1NFUlQoY3JlZGl0cyA9PSB2YWwpOyAv
KiBtYWtlIHN1cmUgd2UgaGF2ZW4ndCB0cnVuY2F0ZWQgdmFsICovCiAgICAgYXRvbWljX3N1Yihj
cmVkaXRzLCAmc3ZjLT5jcmVkaXQpOwotICAgIHN2Yy0+c3RhcnRfdGltZSArPSAoY3JlZGl0cyAq
IE1JTExJU0VDUygxKSkgLyBDU0NIRURfQ1JFRElUU19QRVJfTVNFQzsKIH0KIAogc3RhdGljIGJv
b2xfdCBfX3JlYWRfbW9zdGx5IG9wdF90aWNrbGVfb25lX2lkbGUgPSAxOwpAQCAtOTU2LDcgKzk1
NCw3IEBAIGNzY2hlZF92Y3B1X2FjY3Qoc3RydWN0IGNzY2hlZF9wcml2YXRlICpwcnYsIHVuc2ln
bmVkIGludCBjcHUpCiAgICAgLyoKICAgICAgKiBVcGRhdGUgY3JlZGl0cwogICAgICAqLwotICAg
IGJ1cm5fY3JlZGl0cyhzdmMsIE5PVygpKTsKKyAgICBidXJuX2NyZWRpdHMoc3ZjLCB0YWNjX2dl
dF9ndWVzdF90aW1lX2RlbHRhX3ZjcHUoc3ZjLT52Y3B1KSk7CiAKICAgICAvKgogICAgICAqIFB1
dCB0aGlzIFZDUFUgYW5kIGRvbWFpbiBiYWNrIG9uIHRoZSBhY3RpdmUgbGlzdCBpZiBpdCB3YXMK
QEAgLTE4NTYsMTQgKzE4NTQsMTQgQEAgY3NjaGVkX3NjaGVkdWxlKAogICAgICAgICAgICAgICAg
ICAgICAodW5zaWduZWQgY2hhciAqKSZkKTsKICAgICB9CiAKLSAgICBydW50aW1lID0gbm93IC0g
Y3VycmVudC0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZTsKKyAgICBydW50aW1lID0gdGFjY19n
ZXRfZ3Vlc3RfdGltZV9kZWx0YSgpOwogICAgIGlmICggcnVudGltZSA8IDAgKSAvKiBEb2VzIHRo
aXMgZXZlciBoYXBwZW4/ICovCiAgICAgICAgIHJ1bnRpbWUgPSAwOwogCiAgICAgaWYgKCAhaXNf
aWRsZV92Y3B1KHNjdXJyLT52Y3B1KSApCiAgICAgewogICAgICAgICAvKiBVcGRhdGUgY3JlZGl0
cyBvZiBhIG5vbi1pZGxlIFZDUFUuICovCi0gICAgICAgIGJ1cm5fY3JlZGl0cyhzY3Vyciwgbm93
KTsKKyAgICAgICAgYnVybl9jcmVkaXRzKHNjdXJyLCBydW50aW1lKTsKICAgICAgICAgc2N1cnIt
PnN0YXJ0X3RpbWUgLT0gbm93OwogICAgICAgICBzY3Vyci0+bGFzdF9zY2hlZF90aW1lID0gbm93
OwogICAgIH0KLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
