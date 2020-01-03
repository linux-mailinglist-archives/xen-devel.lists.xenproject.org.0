Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C212FA1F
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:12:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVm-0005Ua-Lw; Fri, 03 Jan 2020 16:09:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVl-0005UK-Lp
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:17 +0000
X-Inumbo-ID: 5afe3b9a-2e43-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5afe3b9a-2e43-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id b19so8784888wmj.4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeVdaCAPZTMCoRydrJF1kMnbXuo4DmKCUTwBKEx4Ftg=;
 b=f4X1oyi9sh1zTPgxK6RoOIEv5yHCPevuLRvYvmGuDyfr9FjEB0LxhAwbi8Exzfzy4v
 mzjBfnW5J7mE5yx3GHq2mSMGHPzXu3X+D6RlXQQxzlGJx5UH53s4Lg7DRRoS/P1yk7/Z
 c1mk6hbHBh1aNg6LSgTIDkB52V68a7SMx54j+Uv5/xq8+WgAbcFptDjceC9euxe/lA1l
 0QHdrX+oB4XrfMHud3UZYDi8dEjFia9ymeOmnbiNlNBtkvXJ/0r9K/QdVvGZqG0OoMgI
 hRtLfCm99Hk2jzKoBHVj4DjhMz6FRiXAB86P6OBolTwy2Fqv2JHfV/8YhjVSDlWs/oRr
 W71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AeVdaCAPZTMCoRydrJF1kMnbXuo4DmKCUTwBKEx4Ftg=;
 b=XyfSTd9fKbDSEzDLvroDqw1Gxs+ghiuHJz0LK0rCiHp+zaWhDz4XTaas4xKMCk9tXh
 Hmly2z98Hyh60347vOmlXHLisW7V+T8vieXy55HoUQim6Z6C08p+yAsDuHX4sJ+ff+AV
 +IckcdqifCePajrigEYmeTs7Nv9RT01oVYA9iLPMo40W38IKcRVBsOx2LizCuG/4g8Be
 OWq7Wfba/PggMtxW78pUMKNboPqQDKsJAl6ODasf1iANVvp21K+3h6qYd9QUZZoqGR8N
 4EFWL5HIG15Jne8PhB8nhhy+9dNC8wXup4FzFbFUmVTnDjJF1GeX0QCAhDYoWHnNcVV3
 koSQ==
X-Gm-Message-State: APjAAAXe1EdVGB6A/79Gq8bJsmEc0586U7IgjtRDiVdfBxop/jHeK4Rx
 VOvnineyHve6W/06ooQrPDfXBRUSWkdBkQ==
X-Google-Smtp-Source: APXvYqxbMR8RYP5sL+FAKCqyBnntlD2gxHmRqxI+cznR9X69weUoxjSyDz5vfC81rfyr/nYC37V8VQ==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr20167401wme.69.1578067740767; 
 Fri, 03 Jan 2020 08:09:00 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:09:00 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:21 +0000
Message-Id: <20200103160825.19377-5-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/8] x86/hyperv: setup hypercall page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCnYyOgoxLiBG
aXggaXNzdWUgZGlzY292ZXJlZCBieSBNaWNoYWVsCjIuIFVzZSBhIHN0YXRpY2FsbHkgYWxsb2Nh
dGVkIHBhZ2UgYXMgaHlwZXJjYWxsIHBhZ2UKLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlICAgICAgICAgfCAgMSArCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
Y2FsbF9wYWdlLlMgfCAyMSArKysrKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9oeXBlcnYuYyAgICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKy0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJjYWxsX3BhZ2UuUwoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L01ha2VmaWxlCmluZGV4IDY4MTcwMTA5YTkuLjFhODg4N2QyZjQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQpAQCAtMSArMSwyIEBACitvYmoteSArPSBoeXBlcmNh
bGxfcGFnZS5vCiBvYmoteSArPSBoeXBlcnYubwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcmNhbGxfcGFnZS5TIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcmNhbGxfcGFnZS5TCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjZk
NmFiOTEzYmUKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5
cGVyY2FsbF9wYWdlLlMKQEAgLTAsMCArMSwyMSBAQAorI2luY2x1ZGUgPGFzbS9hc21fZGVmbnMu
aD4KKyNpbmNsdWRlIDxhc20vcGFnZS5oPgorCisgICAgICAgIC5zZWN0aW9uICIudGV4dC5wYWdl
X2FsaWduZWQiLCAiYXgiLCBAcHJvZ2JpdHMKKyAgICAgICAgLnAyYWxpZ24gUEFHRV9TSElGVAor
R0xPQkFMKGh2X2h5cGVyY2FsbF9wYWdlKQorICAgICAgICAvKiBSZXR1cm4gLTEgZm9yICJub3Qg
eWV0IHJlYWR5IiBzdGF0ZSAqLworICAgICAgICBtb3YgLTEsICVyYXgKKyAgICAgICAgcmV0Cisx
OgorICAgICAgICAvKiBGaWxsIHRoZSByZXN0IHdpdGggYHJldGAgKi8KKyAgICAgICAgLmZpbGwg
UEFHRV9TSVpFIC0gKDFiIC0gaHZfaHlwZXJjYWxsX3BhZ2UpLCAxLCAweGMzCisgICAgICAgIC50
eXBlIGh2X2h5cGVyY2FsbF9wYWdlLCBTVFRfT0JKRUNUCisgICAgICAgIC5zaXplIGh2X2h5cGVy
Y2FsbF9wYWdlLCBQQUdFX1NJWkUKKworLyoKKyAqIExvY2FsIHZhcmlhYmxlczoKKyAqIHRhYi13
aWR0aDogOAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L2h5cGVydi5jCmluZGV4IDhkMzgzMTNkN2EuLjM4MWJlMmE2OGMgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwpAQCAtMTksMTYgKzE5LDE2IEBACiAgKiBDb3B5cmlnaHQg
KGMpIDIwMTkgTWljcm9zb2Z0LgogICovCiAjaW5jbHVkZSA8eGVuL2luaXQuaD4KKyNpbmNsdWRl
IDx4ZW4vZG9tYWluX3BhZ2UuaD4KIAogI2luY2x1ZGUgPGFzbS9ndWVzdC5oPgogI2luY2x1ZGUg
PGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5oPgogCiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gX19yZWFk
X21vc3RseSBtc19oeXBlcnY7CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
b3BzID0gewotICAgIC5uYW1lID0gIkh5cGVyLVYiLAotfTsKK2V4dGVybiBjaGFyIGh2X2h5cGVy
Y2FsbF9wYWdlW107CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwog
Y29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiB7
CiAgICAgdWludDMyX3QgZWF4LCBlYngsIGVjeCwgZWR4OwpAQCAtNzIsNiArNzIsMjcgQEAgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCiAgICAg
cmV0dXJuICZvcHM7CiB9CiAKK3N0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9oeXBlcmNhbGxfcGFn
ZSh2b2lkKQoreworICAgIHVuaW9uIGh2X3g2NF9tc3JfaHlwZXJjYWxsX2NvbnRlbnRzIGh5cGVy
Y2FsbF9tc3I7CisKKyAgICByZG1zcmwoSFZfWDY0X01TUl9IWVBFUkNBTEwsIGh5cGVyY2FsbF9t
c3IuYXNfdWludDY0KTsKKyAgICBoeXBlcmNhbGxfbXNyLmVuYWJsZSA9IDE7CisgICAgaHlwZXJj
YWxsX21zci5ndWVzdF9waHlzaWNhbF9hZGRyZXNzID0KKyAgICAgICAgX19wYShodl9oeXBlcmNh
bGxfcGFnZSkgPj4gSFZfSFlQX1BBR0VfU0hJRlQ7CisgICAgd3Jtc3JsKEhWX1g2NF9NU1JfSFlQ
RVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7Cit9CisKK3N0YXRpYyB2b2lkIF9faW5p
dCBzZXR1cCh2b2lkKQoreworICAgIHNldHVwX2h5cGVyY2FsbF9wYWdlKCk7Cit9CisKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0geworICAgIC5uYW1lID0gIkh5cGVy
LVYiLAorICAgIC5zZXR1cCA9IHNldHVwLAorfTsKKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoK
ICAqIG1vZGU6IEMKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
