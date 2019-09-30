Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C48C23D8
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 17:03:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iExAR-00061Y-2A; Mon, 30 Sep 2019 15:00:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m4o0=XZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iExAQ-00061T-CA
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 15:00:50 +0000
X-Inumbo-ID: 16889564-e393-11e9-97fb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by localhost (Halon) with ESMTPS
 id 16889564-e393-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 15:00:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b9so11763262wrs.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2019 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S7DX9jEP3gZCVm87z48Cftl6GSSS7LrDNyjVbG4WsC4=;
 b=kQrx3F6OCDQPmeZes9RrMss32NG/xAeK1/MTyX0jSXFKBcw8EY/w5PWiGctImDRAx0
 y/ONQgXJZS2IY0OHpbhkBEeORsj6ImwKkCcvJXgujBmEJXlJTAOtJYs5pVzhWcNBgB88
 CBVOIAQHDyfoeu9nF/wz0vhog6ipvSXLIYFJKIq/dmASKkt3uU0uyTtWaqrk9cuBr8c8
 i3D+pDcxyeyqN7gj/9OhESf3IfDNF/aiOAT1RTMN4zn/GCW6Cvf7TJxzuGypjWkrQsVN
 X4G+BmF2QdMgcC8HoL2bZVJeB/agiJsHZ/N8/Ye45Wl3e7Tu2CvqTiCzN3blGZsM5uJ4
 vMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=S7DX9jEP3gZCVm87z48Cftl6GSSS7LrDNyjVbG4WsC4=;
 b=mpoVcUbg5BTdIQb3MAY/RMEoTJa5m64Oh7F1FqTlkelN7RkklQ0sSeAYjqK+TR9eOK
 +LmvR3SaPB00fT3L6+8jhGnzNdFWsjk9gbDhMIEJdyvpcMI+Mj+GKZ1ZOOqWzHeQE1jq
 JFAIeM/lpwIGmBgVuN8NxO6GA/zBIOIO9pl/2mkAHNgvUxMmU5vkWjewktKZPrLKdkJT
 0D4CX15sEAgzGLdCZn875a8dh16pHsEfkAllRSsiA2YXsMJ2uG78B3OgEpm7l47Gapqu
 Q2NjMDT4LNEborUTkcSKQ1BRbjuobXimWNJQySgk20YHQg8s0KRFnYlmof90EpPXRGvO
 /9vw==
X-Gm-Message-State: APjAAAWRSPoiJZ/DTYRSoLmcx4ZkoqHPlp7JOxvnB7TgQfIeCeHCf1dM
 t/eImXT0EVHZj7BsepbrqoPRaJcF5YE=
X-Google-Smtp-Source: APXvYqz8ceECOiIEiCBjN61hYwUrCPHmclhL6w7Vxq41m02opgNn0uXPloz1YcovSGqAVlfNuVU9kQ==
X-Received: by 2002:a5d:4f0b:: with SMTP id c11mr13735793wru.63.1569855648430; 
 Mon, 30 Sep 2019 08:00:48 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id f143sm32870852wme.40.2019.09.30.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2019 08:00:47 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 30 Sep 2019 16:00:34 +0100
Message-Id: <20190930150044.5734-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v2 0/9] Port Xen to Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsCgpUaGlzIGlzIHZlcnNpb24gMiBvZiB0aGUgcGF0Y2ggc2VyaWVzLgoKVGhpcyBpcyB0
aGUgdmVyeSBmaXJzdCBzdGFnZSBmb3IgcG9ydGluZyBYZW4gdG8gcnVuIG9uIEh5cGVyLVYgd2l0
aCBhbGwgdGhlCmdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIuICBXaXRoIHRoaXMgc2VyaWVz
LCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKSHlwZXItViBhbmQgcHJpbnRzIG91dCBhIG1l
c3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0IHRoZSBjb2RlIHN0cnVjdHVyZQphbmQg
a2NvbmZpZyBvcHRpb25zIGFncmVlZCB1cG9uLgoKVGhlcmUgYXJlIHR3byBtYWpvciBhcmVhcyB0
byBiZSB3b3JrZWQgb246CiAgKiBNYWtlIERvbTAgYWJsZSB0byB1c2UgSHlwZXItVidzIHN5bnRo
ZXRpYyBkZXZpY2VzLgogICogTWFrZSBYZW4gdXNlIG9mIHRoZSBzeW50aGV0aWMgdGltZXIsIHJl
ZmVyZW5jZSBUU0MgYW5kIGVubGlnaHRlbm1lbnQgVk1DUwogICAgYW5kIG90aGVyIGludGVyZmFj
ZXMuCgpUaGV5IGFyZW4ndCB0cml2aWFsLCBhbmQgdGltZSBjYW4gYmUgc2NhcmNlIG9uIG15IHNp
ZGUsIHNvIEkgaW50ZW5kIHRvIHBvc3QKcGF0Y2hlcyBwaWVjZSBtZWFsIHdoZW4gdGhleSBhcmUg
cmVhZHkuCgpRdWVzdGlvbnMgYW5kIGNvbW1lbnRzIGFyZSB3ZWxjb21lLgoKVGhhbmtzLApXZWku
CgotLS0KQ2hhbmdlcyBpbiB2MjoKMS4gSW50cm9kdWNlIGFuZCB1c2UgYSBoeXBlcnZpc29yIGZy
YW1ld29yawoyLiBLZWVwIG1lbW1hcCBpbmZyYSB1bmRlciBYZW4gZm9yIG5vdwoKQ2M6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpXZWkgTGl1ICg5KToKICB4ODY6IGludHJvZHVj
ZSBDT05GSUdfR1VFU1QgYW5kIG1vdmUgY29kZQogIHg4NjogaW5jbHVkZSBhc21fZGVmbnMuaCBk
aXJlY3RseSBpbiBoeXBlcmNhbGwuaAogIHg4NjogZHJvcCBoeXBlcnZpc29yX2NwdWlkX2Jhc2UK
ICB4ODY6IGluY2x1ZGUgeGVuL2xpYi5oIGluIGd1ZXN0L2h5cGVyY2FsbC5oCiAgeDg2OiBpbnRy
b2R1Y2UgaHlwZXJ2aXNvciBmcmFtZXdvcmsKICB4ODY6IHJlbmFtZSBoeXBlcnZpc29yX3thbGxv
YyxmcmVlfV91bnVzZWRfcGFnZQogIHg4Njogc3dpdGNoIHhlbiBpbXBsZW1lbnRhdGlvbiB0byB1
c2UgaHlwZXJ2aXNvciBmcmFtZXdvcmsKICB4ODY6IGJlIG1vcmUgdmVyYm9zZSB3aGVuIHJ1bm5p
bmcgb24gYSBoeXBlcnZpc29yCiAgeDg2OiBpbnRyb2R1Y2UgQ09ORklHX0hZUEVSViBhbmQgZGV0
ZWN0aW9uIGNvZGUKCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAxMyArKysKIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
fCAgNiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZSAgICAgICAgICAgIHwg
IDEgKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyAgICAgICAgICAgIHwgNjkg
KysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAg
ICAgICAgIHwgODIgKysrKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9N
YWtlZmlsZSAgICAgICAgICAgICAgIHwgIDQgKwogeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVu
fS9oeXBlcmNhbGxfcGFnZS5TIHwgIDAKIHhlbi9hcmNoL3g4Ni9ndWVzdC97ID0+IHhlbn0vcHZo
LWJvb3QuYyAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5j
ICAgICAgICAgICAgfCAzOSArKysrLS0tLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstCiB4ZW4vYXJjaC94ODYvc2V0dXAuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oICAgICAg
ICAgICAgICAgICAgIHwgIDIgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwu
aCAgICAgICAgIHwgIDQgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaCAgICAg
ICAgICAgIHwgNDUgKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZp
c29yLmggICAgICAgIHwgNjMgKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3QveGVuLmggICAgICAgICAgICAgICB8IDI0ICsrLS0tLQogMTcgZmlsZXMgY2hhbmdlZCwgMzIx
IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9n
dWVzdC94ZW4vTWFrZWZpbGUKIHJlbmFtZSB4ZW4vYXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L2h5
cGVyY2FsbF9wYWdlLlMgKDEwMCUpCiByZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVu
fS9wdmgtYm9vdC5jICg5OSUpCiByZW5hbWUgeGVuL2FyY2gveDg2L2d1ZXN0L3sgPT4geGVufS94
ZW4uYyAoOTMlKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qv
aHlwZXJ2LmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaAoKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
