Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332C15ACDF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:11:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1ua4-0003Pe-6n; Wed, 12 Feb 2020 16:09:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MKKR=4A=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j1ua2-0003PM-Ct
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:09:38 +0000
X-Inumbo-ID: 0a39bdcc-4db2-11ea-ade5-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a39bdcc-4db2-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 16:09:26 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id q9so2939044wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2020 08:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Neo9830nXS7pOHb+tEopg55AY8hDgs4S3FCPUyPLXyc=;
 b=uTqzjhbdHb9xJGGlznMWGTb1+KO10EabT4tw5XrIe3eh02zPsW6EBh1BnVdolyD6eG
 AIGlGBPWvKYv1MTEI96D3ov1uyP+iESzcskd9jXykramPBd4RDuJebihE6hNoby8rxvv
 fHHkLQo3+BH4MTucB9QlLjyxWtMFXCSkCsUYU6+Neg0G4uz9a3v6NPJRHOBPM/2ihoZT
 nPaMdRUWE2XWBdwRf8+v43iiiGFuTxNhNB5EavOkV46r6kxXrsZNTk5A1Qo5DglXsrmD
 ls4g6szvx+8RCEnTUpJpJeoY35EQz6sebuTiuprtPYk5HbUMdt1ydtHDnP5yUzv+50rL
 8RzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Neo9830nXS7pOHb+tEopg55AY8hDgs4S3FCPUyPLXyc=;
 b=ucaGFS8YLY4069zvTBHiDZsD6/6K5/1qBTpN5vxrjKfeiLgp5OxWIm+oK/CUerOsDc
 zFXFfaPDSpO8QIHnFviptyKYxSveJf/oXCY5IGN0/AoizFdPS5YN0WfLRTphyaPexMif
 Ua2H90ongjZFKVGQ1RZ1zfj9wqPhZICcSf4dxVQzqpeCwXf1CFhZ6LF5Ef0soGIIS4cN
 b4cIWF3dIFvIeuDPWiH4UCfPHUnXdx93lagn5Q8tIuoPlGJGuhIBQqsyKeDXMKCnA44b
 DCmse0y3VJy47288m0frsoxzLLpQmCNLyr1CJiU68dt1O/tZbFa1+PBp2LH81JVWRW54
 SjAg==
X-Gm-Message-State: APjAAAVstBCZBKAuprpBB8xO580g/yi4KolPfUS3S1/YqjeTavYhIrP+
 wUPTRzbF7uePbsH6AZ/1GNzsFx4y
X-Google-Smtp-Source: APXvYqypzgUZ6Pr+AaXzzaZNTLtFB9Amlm9cg/SCercxqodyxS4Nq+PtpRlpGxUXuiT7yuKrP7Ml8g==
X-Received: by 2002:a7b:c5da:: with SMTP id n26mr13089439wmk.138.1581523765260; 
 Wed, 12 Feb 2020 08:09:25 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 o4sm1142500wrx.25.2020.02.12.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 08:09:24 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 16:09:17 +0000
Message-Id: <20200212160918.18470-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212160918.18470-1-liuwe@microsoft.com>
References: <20200212160918.18470-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/4] x86/hyperv: skeleton for L0 assisted TLB
 flush
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW1wbGVtZW50IGEgYmFzaWMgaG9vayBmb3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoLiBUaGUgaG9v
ayBuZWVkcyB0bwpjaGVjayBpZiBwcmVyZXF1aXNpdGVzIGFyZSBtZXQuIElmIHRoZXkgYXJlIG5v
dCBtZXQsIGl0IHJldHVybnMgYW4gZXJyb3IKbnVtYmVyIHRvIGZhbGwgYmFjayB0byBuYXRpdmUg
Zmx1c2hlcy4KCkludHJvZHVjZSBhIG5ldyB2YXJpYWJsZSB0byBpbmRpY2F0ZSBpZiBoeXBlcmNh
bGwgcGFnZSBpcyByZWFkeS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZSAgfCAgMSArCiB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jICB8IDE3ICsrKysrKysrKysrKwogeGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysKIHhlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvdGxiLmMgICAgIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
IDQgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmls
ZQppbmRleCA2ODE3MDEwOWE5Li4xODkwMmMzM2U5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L01ha2VmaWxlCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFr
ZWZpbGUKQEAgLTEgKzEsMiBAQAogb2JqLXkgKz0gaHlwZXJ2Lm8KK29iai15ICs9IHRsYi5vCmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCBiNzA0NGY3MTkzLi4xY2RjODhlMjdjIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTMzLDYgKzMzLDggQEAgREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKIERFRklORV9QRVJfQ1BV
X1JFQURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHVpbnQzMl90LCBodl92cF9pbmRleCk7CiAKK3N0YXRpYyBib29sIF9fcmVhZF9tb3N0
bHkgaHZfaGNhbGxfcGFnZV9yZWFkeTsKKwogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0
X2lkKHZvaWQpCiB7CiAgICAgdW5pb24gaHZfZ3Vlc3Rfb3NfaWQgaWQgPSB7fTsKQEAgLTExOSw2
ICsxMjEsOCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxsX3BhZ2Uodm9pZCkK
ICAgICBCVUdfT04oIWh5cGVyY2FsbF9tc3IuZW5hYmxlKTsKIAogICAgIHNldF9maXhtYXBfeChG
SVhfWF9IWVBFUlZfSENBTEwsIG1mbiA8PCBQQUdFX1NISUZUKTsKKworICAgIGh2X2hjYWxsX3Bh
Z2VfcmVhZHkgPSB0cnVlOwogfQogCiBzdGF0aWMgaW50IHNldHVwX2h5cGVyY2FsbF9wY3B1X2Fy
Zyh2b2lkKQpAQCAtMTk5LDExICsyMDMsMjQgQEAgc3RhdGljIHZvaWQgX19pbml0IGU4MjBfZml4
dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiAgICAgICAgIHBhbmljKCJVbmFibGUgdG8gcmVzZXJ2
ZSBIeXBlci1WIGh5cGVyY2FsbCByYW5nZVxuIik7CiB9CiAKK3N0YXRpYyBpbnQgZmx1c2hfdGxi
KGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCisgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCit7CisgICAgaWYgKCAhKG1zX2h5cGVydi5oaW50cyAm
IEhWX1g2NF9SRU1PVEVfVExCX0ZMVVNIX1JFQ09NTUVOREVEKSApCisgICAgICAgIHJldHVybiAt
RU9QTk9UU1VQUDsKKworICAgIGlmICggIWh2X2hjYWxsX3BhZ2VfcmVhZHkgfHwgIXRoaXNfY3B1
KGh2X2lucHV0X3BhZ2UpICkKKyAgICAgICAgcmV0dXJuIC1FTlhJTzsKKworICAgIHJldHVybiBo
eXBlcnZfZmx1c2hfdGxiKG1hc2ssIHZhLCBmbGFncyk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl9vcHMgX19pbml0ZGF0YSBvcHMgPSB7CiAgICAgLm5hbWUgPSAiSHlwZXIt
ViIsCiAgICAgLnNldHVwID0gc2V0dXAsCiAgICAgLmFwX3NldHVwID0gYXBfc2V0dXAsCiAgICAg
LmU4MjBfZml4dXAgPSBlODIwX2ZpeHVwLAorICAgIC5mbHVzaF90bGIgPSBmbHVzaF90bGIsCiB9
OwogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAppbmRleCBlYjE0ZWE0M2U1Li43
OGU1MmY3NGNlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUu
aAorKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaApAQCAtMjIsMTAgKzIy
LDE0IEBACiAjaWZuZGVmIF9fWEVOX0hZUEVSVl9QUklWSUFURV9IX18KICNkZWZpbmUgX19YRU5f
SFlQRVJWX1BSSVZJQVRFX0hfXwogCisjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KICNpbmNsdWRl
IDx4ZW4vcGVyY3B1Lmg+CiAKIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0X3BhZ2Up
OwogREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKIERFQ0xBUkVfUEVSX0NQ
VSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwogCitpbnQgaHlwZXJ2X2ZsdXNoX3RsYihjb25zdCBj
cHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAorICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGZsYWdzKTsKKwogI2VuZGlmIC8qIF9fWEVOX0hZUEVSVl9QUklWSUFURV9IX18g
ICovCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi40OGY1MjcyMjllCi0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi90bGIuYwpAQCAtMCwwICsxLDQxIEBACisvKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCisg
KiBhcmNoL3g4Ni9ndWVzdC9oeXBlcnYvdGxiLmMKKyAqCisgKiBTdXBwb3J0IGZvciBUTEIgbWFu
YWdlbWVudCB1c2luZyBoeXBlcmNhbGxzCisgKgorICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29m
dHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKKyAqIGl0IHVuZGVy
IHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5CisgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIgdmVyc2lvbiAyIG9m
IHRoZSBMaWNlbnNlLCBvcgorICogKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4K
KyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVu
IHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCisgKiBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorICoKKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZl
ZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlCisgKiBhbG9uZyB3aXRo
IHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+
LgorICoKKyAqIENvcHlyaWdodCAoYykgMjAyMCBNaWNyb3NvZnQuCisgKi8KKworI2luY2x1ZGUg
PHhlbi9jcHVtYXNrLmg+CisjaW5jbHVkZSA8eGVuL2Vycm5vLmg+CisKKyNpbmNsdWRlICJwcml2
YXRlLmgiCisKK2ludCBoeXBlcnZfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29u
c3Qgdm9pZCAqdmEsCisgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCit7
CisgICAgcmV0dXJuIC1FT1BOT1RTVVBQOworfQorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgor
ICogbW9kZTogQworICogYy1maWxlLXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZzZXQ6IDQK
KyAqIHRhYi13aWR0aDogNAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8K
LS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
