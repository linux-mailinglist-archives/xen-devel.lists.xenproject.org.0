Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22854BB208
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:14:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLI3-0006rK-Ee; Mon, 23 Sep 2019 10:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLI1-0006qr-9f
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:09:53 +0000
X-Inumbo-ID: 40facc62-ddea-11e9-a337-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40facc62-ddea-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id y21so8621697wmi.0
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qOnvgxTYDq1RQTeNxzoSrcZSvYUJJofuL+Y7imyRsBI=;
 b=XY2tDeIpfAvkFQx8RaGzo+iVyMmjmvXl9fW/7EsS2TKQEe5+W4FJvsK5uFqCU2Vh4p
 fnm35QH83HqiHJyc49LzyuBVW66t8HFGUtQzoZfxtcKDrnldKFqrwL9LBXsrLyolCTcx
 excyCe720WLnb+F8jTQ+cej7gIZtpyGHbjECnV1PpHXlZUOdc2XbRYZ8gzumiHOqTUu1
 BsjBGj1u+RHBe4+w2YCmNkjPlJf8aBN8HNtKI5EDyol2DiYqWNjYzOX9P0dSO/Js+2lW
 Bj1FDc8Hk3Nr953IPKKnMEkKTDZDNpVBDDSGUYeMVSUoSUr6T3HpJeiGQ/csN3vI/jV/
 YkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qOnvgxTYDq1RQTeNxzoSrcZSvYUJJofuL+Y7imyRsBI=;
 b=Lt4sX7bZPQfOKu+Ha3fkfaRmbHGOQr/IH+2UqoMh6wwcHEayH7kWdsAGQC51Yo4qQk
 MlUfJrpBFRl4FHiWNICq4pLRpnRLBXR1W5CtTN5KOXseRmw8ieUmxqqvqDG1kBAh7cJ5
 nkT8uiE4FB4pY1RniG8py0WfJIY/vc6E3rm32tpbAUk/x9E4G5MLTaYfRi9uczfA4jP4
 kpYfp1OLgCj63FjYHu5v4WiFtwQFDgWS97Pdr8HuRtTFaw+HtboLzXy57JxHkUIb3fWF
 5wStrUV3Iihh1w2HaZnGbUvTgSkJRnkfkGRLALGGxDTS7nGcAFtAk0j0VgO6G1pFt5GX
 nf+Q==
X-Gm-Message-State: APjAAAX92WK9iaAE8tGmrcpSx0rhcJuub45/o6zVqPMkioK1ignjZ/cL
 Evq9NmAS6zrOUSN0xja2ST5SA0kq
X-Google-Smtp-Source: APXvYqxP5XgaxhG1fhSiuV5+Hw+0TvnZxKbGApNAIrK1/bqxkw2Qt/sRHIOZBBUqNWAJj7J2CdQHsQ==
X-Received: by 2002:a1c:3904:: with SMTP id g4mr13797846wma.116.1569233378852; 
 Mon, 23 Sep 2019 03:09:38 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:38 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:26 +0100
Message-Id: <20190923100931.29670-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 3/8] x86: drop hypervisor_cpuid_base
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

VGhlIG9ubHkgdXNlciBpcyBYZW4gc3BlY2lmaWMgY29kZSBpbiBQViBzaGltLiBXZSBjYW4gdGhl
cmVmb3JlIGV4cG9ydAp0aGUgdmFyaWFibGUgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBXZWkg
TGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVu
LmMgICAgfCA3ICstLS0tLS0KIHhlbi9hcmNoL3g4Ni9wdi9zaGltLmMgICAgICAgICAgfCAyICst
CiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIHwgMiArLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKaW5kZXgg
N2I3YTViYWRhYi4uNzhmYzYwMzk5NiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L3hl
bi94ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zNyw3ICszNyw3
IEBACiAKIGJvb2wgX19yZWFkX21vc3RseSB4ZW5fZ3Vlc3Q7CiAKLXN0YXRpYyBfX3JlYWRfbW9z
dGx5IHVpbnQzMl90IHhlbl9jcHVpZF9iYXNlOworX19yZWFkX21vc3RseSB1aW50MzJfdCB4ZW5f
Y3B1aWRfYmFzZTsKIGV4dGVybiBjaGFyIGh5cGVyY2FsbF9wYWdlW107CiBzdGF0aWMgc3RydWN0
IHJhbmdlc2V0ICptZW07CiAKQEAgLTMwMSwxMSArMzAxLDYgQEAgaW50IGh5cGVydmlzb3JfZnJl
ZV91bnVzZWRfcGFnZShtZm5fdCBtZm4pCiAgICAgcmV0dXJuIHJhbmdlc2V0X3JlbW92ZV9yYW5n
ZShtZW0sIG1mbl94KG1mbiksIG1mbl94KG1mbikpOwogfQogCi11aW50MzJfdCBoeXBlcnZpc29y
X2NwdWlkX2Jhc2Uodm9pZCkKLXsKLSAgICByZXR1cm4geGVuX2NwdWlkX2Jhc2U7Ci19Ci0KIHN0
YXRpYyB2b2lkIGFwX3Jlc3VtZSh2b2lkICp1bnVzZWQpCiB7CiAgICAgbWFwX3ZjcHVpbmZvKCk7
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3No
aW0uYwppbmRleCAzMjRjYTI3ZjkzLi4xYjE3NGMyNGRmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94
ODYvcHYvc2hpbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKQEAgLTk5Miw3ICs5OTIs
NyBAQCBkb21pZF90IGdldF9pbml0aWFsX2RvbWFpbl9pZCh2b2lkKQogICAgIGlmICggIXB2X3No
aW0gKQogICAgICAgICByZXR1cm4gMDsKIAotICAgIGNwdWlkKGh5cGVydmlzb3JfY3B1aWRfYmFz
ZSgpICsgNCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7CisgICAgY3B1aWQoeGVuX2NwdWlkX2Jh
c2UgKyA0LCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKIAogICAgIHJldHVybiAoZWF4ICYgWEVO
X0hWTV9DUFVJRF9ET01JRF9QUkVTRU5UKSA/IGVjeCA6IDE7CiB9CmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94
ZW4uaAppbmRleCA3ZTA0ZTRhN2FiLi5iMDE1ZWQxODgzIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L3hlbi5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVu
LmgKQEAgLTMwLDEzICszMCwxMyBAQAogCiBleHRlcm4gYm9vbCB4ZW5fZ3Vlc3Q7CiBleHRlcm4g
Ym9vbCBwdl9jb25zb2xlOworZXh0ZXJuIHVpbnQzMl90IHhlbl9jcHVpZF9iYXNlOwogCiB2b2lk
IHByb2JlX2h5cGVydmlzb3Iodm9pZCk7CiB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7CiB2
b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7CiBpbnQgaHlwZXJ2aXNvcl9hbGxvY191bnVz
ZWRfcGFnZShtZm5fdCAqbWZuKTsKIGludCBoeXBlcnZpc29yX2ZyZWVfdW51c2VkX3BhZ2UobWZu
X3QgbWZuKTsKLXVpbnQzMl90IGh5cGVydmlzb3JfY3B1aWRfYmFzZSh2b2lkKTsKIHZvaWQgaHlw
ZXJ2aXNvcl9yZXN1bWUodm9pZCk7CiAKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIHZj
cHVfaWQpOwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
