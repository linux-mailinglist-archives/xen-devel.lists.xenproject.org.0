Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4218BB206
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:14:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLIM-0007Zm-Uw; Mon, 23 Sep 2019 10:10:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLIL-0007ZH-9y
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:10:13 +0000
X-Inumbo-ID: 42ff5546-ddea-11e9-b76c-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42ff5546-ddea-11e9-b76c-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:43 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id f22so1465785wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A9Koh0GsgVCT4pN4yJPa3MEazXKb1HbGcXbrkIuJu84=;
 b=CzQiMu1j5ykcWRa7i26QUa658su7ucyXKJ7qqbkXENsYZTyR9G9TG9roMnN39oxSmx
 pnpUcJh3SF5Fq36vhAP4zXeO2CWPAJ6q0w7A6vy46YaJRp0gXteCF0Vww1xUKzOiearF
 ogxwHX3SjYUqNfI2uvhywoWK+LdRua/v/B98EmYEsRqF3RA/ut8KIdNQfnRAFN9rQQPC
 Y1KPQeyPRCLjpeunk4CYqXEERxeGhy+Q4D2gPc7b9E8tGBrqP5guW+Prjxv14QUzRIqp
 ++NOKbJqAG4YKerw5UVIyPu6wHjUNrCqttd0HB72Z633u3CQ6vptZSRG/0qSXFwat8lK
 vq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A9Koh0GsgVCT4pN4yJPa3MEazXKb1HbGcXbrkIuJu84=;
 b=LXc8KpaWrjA4uF7VgM0uTPiZkREawmH1iTGrDAxiQORJRKBa1PGSZXdjvqh4jRxqLK
 5lyHpU7zi569hkheTqFy+fNBoYWMRINcsE8am/V69ogTGpHFvaEFo6lGu3IaqXeWXY6t
 L2a2L2UWv34DYe5eBBXfbPrO7zkybJPyvAfPcSfrVR5uE8TahzvtCbqTuKMq3/EFr/6M
 OoeyeI7KSPelWq3g1ti0XILCeCtYoLOI6bCKnlCabn/CPnlGkKnHX4wNGIxnjoUC5oAY
 d/Ya+REq9cGEE5ITU5SFTN0M4WeYCf0X6hBcbDOKUX2gNo8L9Vo9CPgb+KXDL8xE9HmA
 CS9Q==
X-Gm-Message-State: APjAAAUm4lrH0BUjWDwm0IaJDKyQQOcDOH7WDyyRULnSzCYllhLLVo0v
 sLE3991DVJHDYns+TV8PcKfD8O51
X-Google-Smtp-Source: APXvYqwAn9PhG51WV0+u8bBUzZr7Q+/AVjkqcTH2tpe/NlUId/KPRDCUW46hZSu7fGR3T37VIonBPw==
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr14268922wmi.151.1569233382211; 
 Mon, 23 Sep 2019 03:09:42 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:41 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:30 +0100
Message-Id: <20190923100931.29670-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 7/8] x86: introduce CONFIG_HYPERV
 and hyperv directory
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

V2UgdXNlIHRoZSBzYW1lIGNvZGUgc3RydWN0dXJlIGFzIHdlIGRpZCBmb3IgWGVuIGNvZGUuCgpB
cyBzdGFydGVycywgZGV0ZWN0IEh5cGVyLVYgaW4gcHJvYmVfaHlwZXJ2LiBNb3JlIGNvbXBsZXgK
ZnVuY3Rpb25hbGl0eSB3aWxsIGJlIGFkZGVkIGxhdGVyLgoKU2lnbmVkLW9mZi1ieTogV2VpIExp
dSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvS2NvbmZpZyAgICAgICAg
ICAgICAgIHwgIDkgKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSAgICAgICAgfCAg
MSArCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIHwgIDEgKwogeGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICB8ICAzICstCiB4ZW4vaW5j
bHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgIHwgIDEgKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9n
dWVzdC9oeXBlcnYuaCB8IDQ4ICsrKysrKysrKysrKysrKysrKysrKysrCiA3IGZpbGVzIGNoYW5n
ZWQsIDEyNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5oCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2
L0tjb25maWcgYi94ZW4vYXJjaC94ODYvS2NvbmZpZwppbmRleCA1ODRiZGMxYmI4Li5jNWE5M2Jh
YmZlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvS2NvbmZpZworKysgYi94ZW4vYXJjaC94ODYv
S2NvbmZpZwpAQCAtMTYzLDYgKzE2MywxNSBAQCBlbmRjaG9pY2UKIGNvbmZpZyBHVUVTVAogCWJv
b2wKIAorY29uZmlnIEhZUEVSVl9HVUVTVAorCWRlZl9ib29sIG4KKwlzZWxlY3QgR1VFU1QKKwlw
cm9tcHQgIkh5cGVyLVYgR3Vlc3QiCisJLS0taGVscC0tLQorCSAgU3VwcG9ydCBmb3IgWGVuIGRl
dGVjdGluZyB3aGVuIGl0IGlzIHJ1bm5pbmcgdW5kZXIgSHlwZXItVi4KKworCSAgSWYgdW5zdXJl
LCBzYXkgTi4KKwogY29uZmlnIFhFTl9HVUVTVAogCWRlZl9ib29sIG4KIAlzZWxlY3QgR1VFU1QK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9NYWtlZmlsZQppbmRleCBmNjNkNjRiYmVlLi5mMTY0MTk2NzcyIDEwMDY0NAotLS0gYS94
ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L01ha2Vm
aWxlCkBAIC0xLDMgKzEsNCBAQAogb2JqLXkgKz0gaHlwZXJ2aXNvci5vCiAKK3N1YmRpci0kKENP
TkZJR19IWVBFUlZfR1VFU1QpICs9IGh5cGVydgogc3ViZGlyLSQoQ09ORklHX1hFTl9HVUVTVCkg
Kz0geGVuCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwMDAwMDAwMDAwLi42ODE3MDEwOWE5Ci0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQpAQCAtMCwwICsxIEBACitvYmoteSArPSBoeXBlcnYu
bwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNDg4ZTljMTRhMwotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTAsMCArMSw2MyBAQAorLyoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgorICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisgKgorICogU3VwcG9ydCBm
b3IgZGV0ZWN0aW5nIGFuZCBydW5uaW5nIHVuZGVyIEh5cGVyLVYuCisgKgorICogVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2Rp
ZnkKKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgYXMgcHVibGlzaGVkIGJ5CisgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRo
ZXIgdmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkg
bGF0ZXIgdmVyc2lvbi4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhl
IGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5U
WTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqIFlvdSBzaG91
bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
CisgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251
Lm9yZy9saWNlbnNlcy8+LgorICoKKyAqIENvcHlyaWdodCAoYykgMjAxOSBNaWNyb3NvZnQuCisg
Ki8KKyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgorCisjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CisKK2Jv
b2wgX19yZWFkX21vc3RseSBoeXBlcnZfZ3Vlc3Q7CisKK2Jvb2wgX19pbml0IHByb2JlX2h5cGVy
dih2b2lkKQoreworICAgIHVpbnQzMl90IGVheCwgZWJ4LCBlY3gsIGVkeDsKKworICAgIGlmICgg
aHlwZXJ2X2d1ZXN0ICkKKyAgICAgICAgcmV0dXJuIHRydWU7CisKKyAgICBjcHVpZCgweDQwMDAw
MDAwLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKKyAgICBpZiAoIChlYnggPT0gMHg3MjYzNjk0
ZCkgJiYgLyogIk1pY3IiICovCisgICAgICAgICAoZWN4ID09IDB4NjY2ZjczNmYpICYmIC8qICJv
c29mIiAqLworICAgICAgICAgKGVkeCA9PSAweDc2NDgyMDc0KSApICAvKiAidCBIdiIgKi8KKyAg
ICAgICAgaHlwZXJ2X2d1ZXN0ID0gdHJ1ZTsKKworICAgIHJldHVybiBoeXBlcnZfZ3Vlc3Q7Cit9
CisKK3ZvaWQgX19pbml0IGh5cGVydl9zZXR1cCh2b2lkKQoreworfQorCit2b2lkIGh5cGVydl9h
cF9zZXR1cCh2b2lkKQoreworfQorCit2b2lkIGh5cGVydl9yZXN1bWUodm9pZCkKK3sKK30KKwor
LyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJT
RCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJz
LW1vZGU6IG5pbAorICogRW5kOgorICovCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2aXNvci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwppbmRleCBmYjU3
MmIwNDAyLi4xN2Q1NmNkMDVlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
aXNvci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKQEAgLTM3LDcgKzM3
LDggQEAgdm9pZCBfX2luaXQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKQogICAgIGlmICggcHJvYmVf
eGVuKCkgKQogICAgICAgICByZXR1cm47CiAKLSAgICAvKiBIeXBlci1WIHByb2JpbmcgdG8gZm9s
bG93LiAqLworICAgIGlmICggcHJvYmVfaHlwZXJ2KCkgKQorICAgICAgICByZXR1cm47CiB9CiAK
IHN0YXRpYyB2b2lkIF9faW5pdCBpbml0X21lbW1hcCh2b2lkKQpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC5oCmluZGV4
IDhlMTY3MTY1YWUuLjk0NDQ4NjA2ZDQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
Z3Vlc3QuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmgKQEAgLTIwLDYgKzIwLDcg
QEAKICNkZWZpbmUgX19YODZfR1VFU1RfSF9fCiAKICNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJj
YWxsLmg+CisjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi5oPgogI2luY2x1ZGUgPGFzbS9ndWVz
dC9oeXBlcnZpc29yLmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0L3B2aC1ib290Lmg+CiAjaW5jbHVk
ZSA8YXNtL2d1ZXN0L3hlbi5oPgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVz
dC9oeXBlcnYuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKbmV3IGZpbGUg
bW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMzBlNTEzNWE3MgotLS0gL2Rldi9udWxsCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTAsMCArMSw0OCBAQAor
LyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKgorICogYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAorICoKKyAq
IFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhl
IEdOVSBHZW5lcmFsIFB1YmxpYworICogTGljZW5zZSwgdmVyc2lvbiAyLCBhcyBwdWJsaXNoZWQg
YnkgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbi4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMg
ZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
CisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
ICBTZWUgdGhlIEdOVQorICogR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxz
LgorICoKKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5l
cmFsIFB1YmxpYworICogTGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBz
ZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorICoKKyAqIENvcHlyaWdodCAoYykg
MjAxOSBNaWNyb3NvZnQuCisgKi8KKworI2lmbmRlZiBfX1g4Nl9HVUVTVF9IWVBFUlZfSF9fCisj
ZGVmaW5lIF9fWDg2X0dVRVNUX0hZUEVSVl9IX18KKworI2lmZGVmIENPTkZJR19IWVBFUlZfR1VF
U1QKKworZXh0ZXJuIGJvb2wgaHlwZXJ2X2d1ZXN0OworCitib29sIHByb2JlX2h5cGVydih2b2lk
KTsKK3ZvaWQgaHlwZXJ2X3NldHVwKHZvaWQpOwordm9pZCBoeXBlcnZfYXBfc2V0dXAodm9pZCk7
Cit2b2lkIGh5cGVydl9yZXN1bWUodm9pZCk7CisKKyNlbHNlCisKKyNkZWZpbmUgaHlwZXJ2X2d1
ZXN0IDAKKworc3RhdGljIGlubGluZSBib29sIHByb2JlX2h5cGVydih2b2lkKSB7IHJldHVybiBm
YWxzZTsgfQorCisjZW5kaWYgLyogQ09ORklHX0hZUEVSVl9HVUVTVCAqLworI2VuZGlmIC8qIF9f
WDg2X0dVRVNUX0hZUEVSVl9IX18gKi8KKworLyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIG1v
ZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAqIGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0
YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAorICogRW5kOgorICovCi0tIAoy
LjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
