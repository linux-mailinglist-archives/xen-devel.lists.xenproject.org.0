Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B03DF247
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 18:00:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMa4H-0008M6-3e; Mon, 21 Oct 2019 15:58:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMa4E-0008Kx-Sc
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:57:58 +0000
X-Inumbo-ID: 7b970542-f41b-11e9-bbab-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b970542-f41b-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 15:57:29 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f22so13350541wmc.2
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uz0cS8L1R521fTEVFm/na4uChFFZ0A6x5sP6HVSJ75Y=;
 b=RpYQA9UTZA3W/Fwz6T+Ti1SufM8dwZLv3CQz4+1q0tT0Je3aWk4yrmQyAKYOqw5rpz
 e1cbfcVBK4BP7ADh/HbgIRaF16e15L6o4tM1z11xF2Lhx0Pif73lZA1KbLRSanOifRSG
 T8PJSn4erosWoMqoQCXtt6ph1fxCvm8WXr3bQk01cXquEtuwu0v3VIvb7J249RiPxAw0
 H/6/jPE/hgrdHBJLPGOGr9l9We5HdrKYbdyntQuRsUtka42gvlAMfTuEPB5/NR4D8Cjc
 wl8uUGCJK1gpgOoY2vxYkS1tNOtxyKsLlF/gmofBjPH2U8Rb7CGDURCdKkZ9/ziIeCRh
 OS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=uz0cS8L1R521fTEVFm/na4uChFFZ0A6x5sP6HVSJ75Y=;
 b=atxhQHj84L4nrLKLhvovjqovyaUV6Xhc+lqoEXIJzutcgaqs4M4vciYCpdVvdSKhD3
 O2DCpyGCjGOf6P32Lf6CWIKM7+JTF9GyCMPEesTBfS0yUZi+CE09Ml4GQq+GNReIEwx2
 55gFjBxEyqDHL3McclubNk83EeN5F8ww+OE9E6Ydp9rZHaVgQ2P19n07pxYBI270j54t
 uv0AweW2oHF/l5VCWvvsN3biMrjckvsn7ZX/EcjNA8mBPeO8vXgwPVl8zvpyND8bwHSs
 S2k/JCIho/7xz8n2xa/9znv0nzzm41kBq1YsT7za+9pn18aFIJy5q8AuTRLkKk7zcPY+
 JOLA==
X-Gm-Message-State: APjAAAWSFhEU2wGmiyJZZqje10sfJm5WSgPj5r4nffitv5ifIbFP9NjU
 JdEtwRcIprNKFacBtCCEpx6GVGBO+FU=
X-Google-Smtp-Source: APXvYqxl/DJi3lmFlYPpP/hatAwpG7yl3D+pn563UVteuV6a/m3MEG3ZuxYSWnxyh0y0HFEqN4Kjiw==
X-Received: by 2002:a1c:a78b:: with SMTP id q133mr7388392wme.115.1571673448058; 
 Mon, 21 Oct 2019 08:57:28 -0700 (PDT)
Received: from debian.mshome.net (54.163.200.146.dyn.plus.net.
 [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id x12sm5667410wru.93.2019.10.21.08.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:57:27 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 21 Oct 2019 16:57:16 +0100
Message-Id: <20191021155718.28653-8-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021155718.28653-1-liuwe@microsoft.com>
References: <20191021155718.28653-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next v3 7/9] x86: switch xen implementation
 to use hypervisor framework
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

VGFrZSB0aGUgY2hhbmNlIHRvIGNoYW5nZSBwcm9iZV9oeXBlcnZpc29yIHRvIGh5cGVydmlzb3Jf
cHJvYmUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0K
VjM6CjEuIEFkZHJlc3MgUm9nZXIncyBjb21tZW50cwoyLiBDaGFuZ2UgeGVuX2h5cGVydmlzb3Jf
b3BzIHRvIHhlbl9vcHMKLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgfCAz
MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVu
L3B2aC1ib290LmMgfCAgMiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICAgIHwg
MjYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAg
ICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggICB8ICA2ICsr
KystLQogNSBmaWxlcyBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYwppbmRleCA4OWI5YWU0ZGUwLi4zM2JmMWE3NjlkIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnZpc29yLmMKQEAgLTIyLDcgKzIyLDcgQEAKICNpbmNsdWRlIDx4ZW4vdHlw
ZXMuaD4KIAogI2luY2x1ZGUgPGFzbS9jYWNoZS5oPgotI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBl
cnZpc29yLmg+CisjaW5jbHVkZSA8YXNtL2d1ZXN0Lmg+CiAKIHN0YXRpYyBzdHJ1Y3QgaHlwZXJ2
aXNvcl9vcHMgKmhvcHMgX19yZWFkX21vc3RseTsKIApAQCAtMzEsOSArMzEsMzkgQEAgYm9vbCBo
eXBlcnZpc29yX3Byb2JlKHZvaWQpCiAgICAgaWYgKCBob3BzICkKICAgICAgICAgcmV0dXJuIHRy
dWU7CiAKKyAgICAvKiBUb28gZWFybHkgdG8gdXNlIGNwdV9oYXNfaHlwZXJ2aXNvciAqLworICAg
IGlmICggIShjcHVpZF9lY3goMSkgJiBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNP
UikpICkKKyAgICAgICAgcmV0dXJuIGZhbHNlOworCisjaWZkZWYgQ09ORklHX1hFTl9HVUVTVAor
ICAgIGlmICggeGVuX3Byb2JlKCkgKQorICAgIHsKKyAgICAgICAgaG9wcyA9ICZ4ZW5fb3BzOwor
ICAgICAgICByZXR1cm4gdHJ1ZTsKKyAgICB9CisjZW5kaWYKKwogICAgIHJldHVybiBmYWxzZTsK
IH0KIAordm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCit7CisgICAgaWYgKCBob3BzICYmIGhv
cHMtPnNldHVwICkKKyAgICAgICAgaG9wcy0+c2V0dXAoKTsKK30KKwordm9pZCBoeXBlcnZpc29y
X2FwX3NldHVwKHZvaWQpCit7CisgICAgaWYgKCBob3BzICYmIGhvcHMtPmFwX3NldHVwICkKKyAg
ICAgICAgaG9wcy0+YXBfc2V0dXAoKTsKK30KKwordm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lk
KQoreworICAgIGlmICggaG9wcyAmJiBob3BzLT5yZXN1bWUgKQorICAgICAgICBob3BzLT5yZXN1
bWUoKTsKK30KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoKICAqIG1vZGU6IEMKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4vcHZoLWJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC94ZW4vcHZoLWJvb3QuYwppbmRleCBjYThlMTU2ZjdkLi40OTg2MjVlYWUwIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3B2aC1ib290LmMKKysrIGIveGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi9wdmgtYm9vdC5jCkBAIC0xMDMsNyArMTAzLDcgQEAgdm9pZCBfX2luaXQgcHZoX2lu
aXQobXVsdGlib290X2luZm9fdCAqKm1iaSwgbW9kdWxlX3QgKiptb2QpCiB7CiAgICAgY29udmVy
dF9wdmhfaW5mbyhtYmksIG1vZCk7CiAKLSAgICBwcm9iZV9oeXBlcnZpc29yKCk7CisgICAgaHlw
ZXJ2aXNvcl9wcm9iZSgpOwogICAgIEFTU0VSVCh4ZW5fZ3Vlc3QpOwogCiAgICAgZ2V0X21lbW9y
eV9tYXAoKTsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IDk4OTUwMjVkMDIuLjY1NTQzNWMxZjcgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L3hlbi94ZW4uYwpAQCAtNjcsMjQgKzY3LDE5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBm
aW5kX3hlbl9sZWF2ZXModm9pZCkKICAgICB9CiB9CiAKLXZvaWQgX19pbml0IHByb2JlX2h5cGVy
dmlzb3Iodm9pZCkKK2Jvb2wgX19pbml0IHhlbl9wcm9iZSh2b2lkKQogewotICAgIGlmICggeGVu
X2d1ZXN0ICkKLSAgICAgICAgcmV0dXJuOwotCi0gICAgLyogVG9vIGVhcmx5IHRvIHVzZSBjcHVf
aGFzX2h5cGVydmlzb3IgKi8KLSAgICBpZiAoICEoY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9tYXNr
KFg4Nl9GRUFUVVJFX0hZUEVSVklTT1IpKSApCi0gICAgICAgIHJldHVybjsKLQogICAgIGZpbmRf
eGVuX2xlYXZlcygpOwogCiAgICAgaWYgKCAheGVuX2NwdWlkX2Jhc2UgKQotICAgICAgICByZXR1
cm47CisgICAgICAgIHJldHVybiBmYWxzZTsKIAogICAgIC8qIEZpbGwgdGhlIGh5cGVyY2FsbCBw
YWdlLiAqLwogICAgIHdybXNybChjcHVpZF9lYngoeGVuX2NwdWlkX2Jhc2UgKyAyKSwgX19wYSho
eXBlcmNhbGxfcGFnZSkpOwogCiAgICAgeGVuX2d1ZXN0ID0gdHJ1ZTsKKworICAgIHJldHVybiB0
cnVlOwogfQogCiBzdGF0aWMgdm9pZCBtYXBfc2hhcmVkX2luZm8odm9pZCkKQEAgLTI0OSw3ICsy
NDQsNyBAQCBzdGF0aWMgdm9pZCBpbml0X2V2dGNobih2b2lkKQogICAgIH0KIH0KIAotdm9pZCBf
X2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQorc3RhdGljIHZvaWQgX19pbml0IHhlbl9zZXR1
cCh2b2lkKQogewogICAgIGluaXRfbWVtbWFwKCk7CiAKQEAgLTI3Nyw3ICsyNzIsNyBAQCB2b2lk
IF9faW5pdCBoeXBlcnZpc29yX3NldHVwKHZvaWQpCiAgICAgaW5pdF9ldnRjaG4oKTsKIH0KIAot
dm9pZCBoeXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCitzdGF0aWMgdm9pZCB4ZW5fYXBfc2V0dXAo
dm9pZCkKIHsKICAgICBzZXRfdmNwdV9pZCgpOwogICAgIG1hcF92Y3B1aW5mbygpOwpAQCAtMzA3
LDcgKzMwMiw3IEBAIHN0YXRpYyB2b2lkIGFwX3Jlc3VtZSh2b2lkICp1bnVzZWQpCiAgICAgaW5p
dF9ldnRjaG4oKTsKIH0KIAotdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQorc3RhdGljIHZv
aWQgeGVuX3Jlc3VtZSh2b2lkKQogewogICAgIC8qIFJlc2V0IHNoYXJlZCBpbmZvIHBhZ2UuICov
CiAgICAgbWFwX3NoYXJlZF9pbmZvKCk7CkBAIC0zMzAsNiArMzI1LDEzIEBAIHZvaWQgaHlwZXJ2
aXNvcl9yZXN1bWUodm9pZCkKICAgICAgICAgcHZfY29uc29sZV9pbml0KCk7CiB9CiAKK3N0cnVj
dCBoeXBlcnZpc29yX29wcyB4ZW5fb3BzID0geworICAgIC5uYW1lID0gIlhlbiIsCisgICAgLnNl
dHVwID0geGVuX3NldHVwLAorICAgIC5hcF9zZXR1cCA9IHhlbl9hcF9zZXR1cCwKKyAgICAucmVz
dW1lID0geGVuX3Jlc3VtZSwKK307CisKIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2Rl
OiBDCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1
cC5jCmluZGV4IGRlYzYwZDAzMDEuLjBlZTExYjE1YTYgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC03NjMsNyArNzYzLDcgQEAg
dm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKICAg
ICAgKiBhbGxvY2luZyBhbnkgeGVuaGVhcCBzdHJ1Y3R1cmVzIHdhbnRlZCBpbiBsb3dlciBtZW1v
cnkuICovCiAgICAga2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7CiAKLSAgICBwcm9iZV9oeXBl
cnZpc29yKCk7CisgICAgaHlwZXJ2aXNvcl9wcm9iZSgpOwogCiAgICAgcGFyc2VfdmlkZW9faW5m
bygpOwogCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaAppbmRleCA4MjIxZmMxMzI1Li5jM2M2YmVhMjRm
IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmgKQEAgLTIzLDYgKzIzLDcgQEAKIAogI2luY2x1ZGUg
PGFzbS9lODIwLmg+CiAjaW5jbHVkZSA8YXNtL2ZpeG1hcC5oPgorI2luY2x1ZGUgPGFzbS9ndWVz
dC9oeXBlcnZpc29yLmg+CiAKICNkZWZpbmUgWEVOX3NoYXJlZF9pbmZvICgoc3RydWN0IHNoYXJl
ZF9pbmZvICopZml4X3RvX3ZpcnQoRklYX1hFTl9TSEFSRURfSU5GTykpCiAKQEAgLTMxLDggKzMy
LDkgQEAKIGV4dGVybiBib29sIHhlbl9ndWVzdDsKIGV4dGVybiBib29sIHB2X2NvbnNvbGU7CiBl
eHRlcm4gdWludDMyX3QgeGVuX2NwdWlkX2Jhc2U7CitleHRlcm4gc3RydWN0IGh5cGVydmlzb3Jf
b3BzIHhlbl9vcHM7CiAKLXZvaWQgcHJvYmVfaHlwZXJ2aXNvcih2b2lkKTsKK2Jvb2wgeGVuX3By
b2JlKHZvaWQpOwogaW50IHhlbl9hbGxvY191bnVzZWRfcGFnZShtZm5fdCAqbWZuKTsKIGludCB4
ZW5fZnJlZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pOwogCkBAIC00NCw3ICs0Niw3IEBAIERFQ0xB
UkVfUEVSX0NQVShzdHJ1Y3QgdmNwdV9pbmZvICosIHZjcHVfaW5mbyk7CiAjZGVmaW5lIHhlbl9n
dWVzdCAwCiAjZGVmaW5lIHB2X2NvbnNvbGUgMAogCi1zdGF0aWMgaW5saW5lIHZvaWQgcHJvYmVf
aHlwZXJ2aXNvcih2b2lkKSB7fQorc3RhdGljIGlubGluZSBib29sIHhlbl9wcm9iZSh2b2lkKSB7
IHJldHVybiBmYWxzZTsgfQogCiAjZW5kaWYgLyogQ09ORklHX1hFTl9HVUVTVCAqLwogI2VuZGlm
IC8qIF9fWDg2X0dVRVNUX1hFTl9IX18gKi8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
