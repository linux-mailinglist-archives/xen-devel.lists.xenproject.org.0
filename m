Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B184BB200
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:13:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLIS-0007cE-9r; Mon, 23 Sep 2019 10:10:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=iV5N=XS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iCLIQ-0007bP-Ae
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:10:18 +0000
X-Inumbo-ID: 43626438-ddea-11e9-a337-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43626438-ddea-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 10:09:43 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so13226060wrx.5
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2019 03:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yhsc+HWc7UY9B6qKVRW2bcLWA9bzINIqtexNLDZik88=;
 b=QKRgf39r53CdG9wwxV68nU2s5oulVwOKADpxfCmy1r1qR9gHBpgv5K5xN5opulNiV6
 /htwusVkgpUef7gYdY9ObiFwOKlEwaYHFDdRZOv6Mz0pTSBHhBQEHO8DnOLcLPlm+dmg
 yQ5zkGENiKEV58SsV9zZ99yCwAfK6egxyRFn/HnzUqY90Z0hXPMB6H7uEooZO0ADoJbA
 nNZ0jeIFDUGoGw4cEFALnNP+mmHnENxE8UnEm+rc5HnX+biA9PDU8zDfIS7U+ZSEnMB2
 7yNDETG08daHxYgH9IDeA8mN7UalWpJk4oS9AHG/m2qBc9FkOBcf6PJIMmcHhzmz6G9b
 qcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Yhsc+HWc7UY9B6qKVRW2bcLWA9bzINIqtexNLDZik88=;
 b=I139a5GBEiaaYcrC9kI3Lam3pHAJopeD25lY7cKBKCrpKjTvGyWm3N8jNDEFuw/XmJ
 zOhd1tnEcD6t8UQJvgdFYEs/IZoBZhYyeVvxwpgwq5ZUpa4zt/FGAkYNtJNp76dk+CV7
 sGtUynpGyq6Pt+WnnzsQ8fdAhm98Bs4aq2FkPFq5gwNMDq79egqTOWBRzogrn/akVcGA
 5gr5lT8V6z5W3FcfuxMDSKZaOp7yvn5zRw7V+VskWJQcFLr+RW28NCzQY+JGf3DcMFpl
 NFG+TmWixS93ZwI7Lim9RPbpYAyILhVLpyRq5s2hxy2eH1nhPBTBGClmVlA/slnCnQ57
 G0XQ==
X-Gm-Message-State: APjAAAWVzhKxxhEqCSY4fjXb3zmviUrisvvKgdGq9tIiPKF9Z0Opc284
 41yERIiGaUikqCVpoZP4IA+TGiBw
X-Google-Smtp-Source: APXvYqz4dzc1WRlkX8HPkBrx46odkk5LysJbmR/OKnNJk/kGwJkrNc0dd9t2LH5yd9MNx8UwxU0x2A==
X-Received: by 2002:adf:ed05:: with SMTP id a5mr20955854wro.35.1569233383004; 
 Mon, 23 Sep 2019 03:09:43 -0700 (PDT)
Received: from debian.mshome.net (207.148.159.143.dyn.plus.net.
 [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id s10sm18241662wmf.48.2019.09.23.03.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:09:42 -0700 (PDT)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 23 Sep 2019 11:09:31 +0100
Message-Id: <20190923100931.29670-9-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190923100931.29670-1-liuwe@microsoft.com>
References: <20190923100931.29670-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-next RFC 8/8] x86: be more verbose when
 running nested
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

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyB8IDExICsrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2
L3NldHVwLmMKaW5kZXggZGVjNjBkMDMwMS4uYmJjYzVhNTAzZCAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L3NldHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTc4OSw2ICs3ODks
MTcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlf
cCkKIAogICAgIHByaW50aygiWGVuIGltYWdlIGxvYWQgYmFzZSBhZGRyZXNzOiAlI2x4XG4iLCB4
ZW5fcGh5c19zdGFydCk7CiAKKyNpZmRlZiBDT05GSUdfR1VFU1QKKyNpZmRlZiBDT05GSUdfWEVO
X0dVRVNUCisgICAgaWYgKCB4ZW5fZ3Vlc3QgKQorICAgICAgICBwcmludGsoIlJ1bm5pbmcgb24g
WGVuIGh5cGVydmlzb3JcbiIpOworI2VuZGlmCisjaWZkZWYgQ09ORklHX0hZUEVSVl9HVUVTVAor
ICAgIGlmICggaHlwZXJ2X2d1ZXN0ICkKKyAgICAgICAgcHJpbnRrKCJSdW5uaW5nIG9uIEh5cGVy
LVZcbiIpOworI2VuZGlmCisjZW5kaWYKKwogI2lmZGVmIENPTkZJR19WSURFTwogICAgIHByaW50
aygiVmlkZW8gaW5mb3JtYXRpb246XG4iKTsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
