Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38102763B8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:42:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxbk-0006Ym-J6; Fri, 26 Jul 2019 10:37:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqxbj-0006YS-2Y
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:37:51 +0000
X-Inumbo-ID: 6966fc2c-af91-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6966fc2c-af91-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:37:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z28so51094529ljn.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 03:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=C3x4QZ/H4fgKZsJV2PbcUbwqhU719ym2cTFrlww8kZY=;
 b=R/H0E1/6+rMg/3WCvEe9/KLRWuqeREmPZE3AiKSsOgN9nnoBk1j6TVzacFxVdnCtHR
 gU845z7hckIYtECJwT5+b0deaH/YpeBEcUDUmpjzua9Pik8s91Pdt4tySnpDlhsOJjdl
 PWsSFPxunfvwbeM8saD9kH1vLKmQ+cslg+941l009y8uwAD4f2OQ06PsLjmKtXP0ZfhA
 VYcFkWtfgiETEcjlKo1ev+/37DMVujdrNPhQy7028ldUXW53k5ZG9smambKHS6TdXLV7
 Vw03wzHDPA9AFRi24+XHNq857R+zhhNRAeTSKsonu82m4GHH4cEkrUzO82B+U09Cy0Dp
 uUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=C3x4QZ/H4fgKZsJV2PbcUbwqhU719ym2cTFrlww8kZY=;
 b=J1vLbQ7z+AjiuGe+BdGreybqd2XFokllHjkpXsiqFLV/6A/sSrEjXYY7gCXFVa6jEn
 vCFWh7TF9FCcPzMZIl/VU54vMtjLuyiqV36PFcZJtwHIg6BA9vqvOSRypCITjG1rHMrv
 3O/WLoptJrsPTaCvqEDIZskYt/7PKybwu4nkBklS2o6sIGtUYa9pZxHLq9QVhgE2UlSM
 3IZYWEF85JUExps+NbFUGDgQVGEIuWr06I8Iz/fGPX3eC8rLgp4Z2XGzvLCvOHjbFJxk
 9V5wVcevGm5tTmnorpCqKD0Xw+I4AP3GTghfmjBN4VJrGx+KEKK1Wfmgjci4W07koplT
 hAqw==
X-Gm-Message-State: APjAAAXCLAHjwGABuj8RSShmoXx21rotsJB7O8zWqEursn+RSPL3Fb25
 6m45duncWg367Abgeg1d5gO4LTsG
X-Google-Smtp-Source: APXvYqyT8un3YLD9G2tfwX3LQueJ5HDZkWbzbOKu5Ef/7cVWGME2KZ90taK4tZyTRDrpxTuM+UzZSg==
X-Received: by 2002:a2e:9950:: with SMTP id r16mr31882783ljj.173.1564137467625; 
 Fri, 26 Jul 2019 03:37:47 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m4sm9938274ljc.56.2019.07.26.03.37.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 03:37:47 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 13:37:36 +0300
Message-Id: <1564137460-25629-4-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 3/6] sysctl: extend XEN_SYSCTL_getcpuinfo interface
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkV4dGVuZCBYRU5f
U1lTQ1RMX2dldGNwdWluZm8gaW50ZXJmYWNlIHdpdGggZ3Vlc3QgYW5kIGh5cGVydmlzb3IKdGlt
ZSBpbmZvcm1hdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlz
b3ZAZXBhbS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgICAgIHwgMjIgKysrKysr
KysrKysrKysrKysrKysrKwogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgIHwgIDIgKysKIHhl
bi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICAyICsrCiB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aCAgICAgfCAgMiArKwogNCBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4
IDBhMzhkNGEuLjllODgwNWQgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysg
Yi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTIxNyw2ICsyMTcsMjggQEAgdWludDY0X3QgZ2V0
X2NwdV9pZGxlX3RpbWUodW5zaWduZWQgaW50IGNwdSkKICAgICByZXR1cm4gc3RhdGUudGltZVtS
VU5TVEFURV9ibG9ja2VkXTsKIH0KIAordWludDY0X3QgZ2V0X2NwdV9ndWVzdF90aW1lKHVuc2ln
bmVkIGludCBjcHUpCit7CisgICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyBzdGF0ZSA9IHsg
MCB9OworICAgIHN0cnVjdCB2Y3B1ICp2ID0gaWRsZV92Y3B1W2NwdV07CisKKyAgICBpZiAoIGNw
dV9vbmxpbmUoY3B1KSAmJiB2ICkKKyAgICAgICAgdmNwdV9ydW5zdGF0ZV9nZXQodiwgJnN0YXRl
KTsKKworICAgIHJldHVybiBzdGF0ZS50aW1lW1JVTlNUQVRFX3J1bm5hYmxlXTsKK30KKwordWlu
dDY0X3QgZ2V0X2NwdV9oeXBfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQoreworICAgIHN0cnVjdCB2
Y3B1X3J1bnN0YXRlX2luZm8gc3RhdGUgPSB7IDAgfTsKKyAgICBzdHJ1Y3QgdmNwdSAqdiA9IGlk
bGVfdmNwdVtjcHVdOworCisgICAgaWYgKCBjcHVfb25saW5lKGNwdSkgJiYgdiApCisgICAgICAg
IHZjcHVfcnVuc3RhdGVfZ2V0KHYsICZzdGF0ZSk7CisKKyAgICByZXR1cm4gc3RhdGUudGltZVtS
VU5TVEFURV9ydW5uaW5nXTsKK30KKwogLyoKICAqIElmIGxvY2tzIGFyZSBkaWZmZXJlbnQsIHRh
a2UgdGhlIG9uZSB3aXRoIHRoZSBsb3dlciBhZGRyZXNzIGZpcnN0LgogICogVGhpcyBhdm9pZHMg
ZGVhZC0gb3IgbGl2ZS1sb2NrcyB3aGVuIHRoaXMgY29kZSBpcyBydW5uaW5nIG9uIGJvdGgKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc3lzY3RsLmMgYi94ZW4vY29tbW9uL3N5c2N0bC5jCmluZGV4
IDc2NWVmZmQuLmM0YWJiMTEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc3lzY3RsLmMKKysrIGIv
eGVuL2NvbW1vbi9zeXNjdGwuYwpAQCAtMTUyLDYgKzE1Miw4IEBAIGxvbmcgZG9fc3lzY3RsKFhF
Tl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX3N5c2N0bF90KSB1X3N5c2N0bCkKICAgICAgICAgZm9y
ICggaSA9IDA7IGkgPCBucl9jcHVzOyBpKysgKQogICAgICAgICB7CiAgICAgICAgICAgICBjcHVp
bmZvLmlkbGV0aW1lID0gZ2V0X2NwdV9pZGxlX3RpbWUoaSk7CisgICAgICAgICAgICBjcHVpbmZv
Lmd1ZXN0dGltZSA9IGdldF9jcHVfZ3Vlc3RfdGltZShpKTsKKyAgICAgICAgICAgIGNwdWluZm8u
aHlwdGltZSA9IGdldF9jcHVfaHlwX3RpbWUoaSk7CiAKICAgICAgICAgICAgIGlmICggY29weV90
b19ndWVzdF9vZmZzZXQob3AtPnUuZ2V0Y3B1aW5mby5pbmZvLCBpLCAmY3B1aW5mbywgMSkgKQog
ICAgICAgICAgICAgICAgIGdvdG8gb3V0OwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGlj
L3N5c2N0bC5oIGIveGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oCmluZGV4IDkxYzQ4ZGMuLjFh
NGU0ZGUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAorKysgYi94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKQEAgLTE2NCw2ICsxNjQsOCBAQCBzdHJ1Y3QgeGVuX3N5
c2N0bF9kZWJ1Z19rZXlzIHsKIC8qIFhFTl9TWVNDVExfZ2V0Y3B1aW5mbyAqLwogc3RydWN0IHhl
bl9zeXNjdGxfY3B1aW5mbyB7CiAgICAgdWludDY0X2FsaWduZWRfdCBpZGxldGltZTsKKyAgICB1
aW50NjRfYWxpZ25lZF90IGh5cHRpbWU7CisgICAgdWludDY0X2FsaWduZWRfdCBndWVzdHRpbWU7
CiB9OwogdHlwZWRlZiBzdHJ1Y3QgeGVuX3N5c2N0bF9jcHVpbmZvIHhlbl9zeXNjdGxfY3B1aW5m
b190OwogREVGSU5FX1hFTl9HVUVTVF9IQU5ETEUoeGVuX3N5c2N0bF9jcHVpbmZvX3QpOwpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQu
aAppbmRleCBiNDBjOGZkLi41ZTI4Nzk3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaApAQCAtODgyLDYgKzg4Miw4IEBAIGlu
dCB2Y3B1X3Bpbl9vdmVycmlkZShzdHJ1Y3QgdmNwdSAqdiwgaW50IGNwdSk7CiAKIHZvaWQgdmNw
dV9ydW5zdGF0ZV9nZXQoc3RydWN0IHZjcHUgKnYsIHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8g
KnJ1bnN0YXRlKTsKIHVpbnQ2NF90IGdldF9jcHVfaWRsZV90aW1lKHVuc2lnbmVkIGludCBjcHUp
OwordWludDY0X3QgZ2V0X2NwdV9oeXBfdGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKK3VpbnQ2NF90
IGdldF9jcHVfZ3Vlc3RfdGltZSh1bnNpZ25lZCBpbnQgY3B1KTsKIAogLyoKICAqIFVzZWQgYnkg
aWRsZSBsb29wIHRvIGRlY2lkZSB3aGV0aGVyIHRoZXJlIGlzIHdvcmsgdG8gZG86Ci0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
