Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF87105A03
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:54:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXrXc-00074U-1O; Thu, 21 Nov 2019 18:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXrXa-00074L-Ga
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:50:54 +0000
X-Inumbo-ID: d8206af6-0c8f-11ea-984a-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8206af6-0c8f-11ea-984a-bc764e2007e4;
 Thu, 21 Nov 2019 18:50:53 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id l17so4937255wmh.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oK//4eWPwKiz07S4xOiSY1AsXbRsxv+kBltxwHfY7+k=;
 b=HC1ETjxj9NMsO3gBpPzfp92ojjeu4EXj5TjD0XCSIf5DrhSVqRG+qC7V9eOc1ah0TX
 axTwYkOPbArXktAEdiqKy1HMFm69zNfDc8d5ns7sFUD54EK+fxqk+y7L46WwPuxlntv/
 38c05anVxR2MKFKndojOW7Rp14PBx5AOGA2mbL0qL/SCMy+hULs/odGqlnDNuWWxuOWw
 14gH2uTyIWSFD3gEAI0w52hpvuLPlMsu3pKQL7IcnYWS8HRz4NyOnuFam928AIi4pIQo
 BXLwGuUOo1BJzZwwGjtf6zhUyPxn4Mo42HeAKfLxWdVG1vLBl1vOyXQxeuzUGZQ/Qr0i
 kaDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=oK//4eWPwKiz07S4xOiSY1AsXbRsxv+kBltxwHfY7+k=;
 b=Mlpb+S+LopOZf8hFimOSoNOrNMSPHWfaAofayc6ti1KpyUd4s1OmfAxUpb9iX3YAxu
 /B588/kSSQcqDdlLWM1nvxn9C4yZ0hKsTaPvQ9KVA8Cc0s3yCfjEzkR/zTMmUXZsoHEh
 aY7ImYQ0+WzCHMCf4S8tz0ovOlOqbxNuBXLS8CndbCCzg6zQ9PvavjGpZFH4Pu2dP3e3
 TaV0BBFatvxlPHOlKmoQGMwFlhtUUuYII9eeVJDKQL7PvkFNnow0mTC0YfbRVF6zCeLJ
 MiaGDKPMy0V+/RPWQfVCLQdMO3w7k0Y7KlpQDLCJUKVqgg4diSH9Mx2VHuoU8eNwi0TI
 9mkQ==
X-Gm-Message-State: APjAAAVchElWOc9hAFiD4Y7rjaAS9haC7po9PlZZrMR5Xtcj7zgyOhz+
 Yt8MIm+55JP8EmuFWQtCY3xH+bgz75V9rQ==
X-Google-Smtp-Source: APXvYqzx7ziX2KiJpABDqvLNU+y2TYc9ZoeN2fA3vDv3zDE+OoV8CRPeykght7+w7y6SKkIs04JBbQ==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr11243113wmd.171.1574362252944; 
 Thu, 21 Nov 2019 10:50:52 -0800 (PST)
Received: from debian.mshome.net (74.162.147.147.dyn.plus.net.
 [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id f24sm535776wmb.37.2019.11.21.10.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:50:52 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 18:50:41 +0000
Message-Id: <20191121185049.16666-1-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/8] Port Xen to Hyper-V
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

UGxlYXNlIHNlZSBpbmRpdmlkdWFsIHBhdGNoZXMgZm9yIGNoYW5nZXMuCgpDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIApDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIApDYzogV2VpIExp
dSA8d2xAeGVuLm9yZz4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIApDYzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IApDYzogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+CgpXZWkgTGl1ICg4KToKICB4
ODY6IGludHJvZHVjZSBDT05GSUdfR1VFU1QgYW5kIG1vdmUgY29kZQogIHg4NjogYWRkIG1pc3Np
bmcgaGVhZGVycyBpbiBoeXBlcmNhbGwuaAogIHg4NjogZHJvcCBoeXBlcnZpc29yX2NwdWlkX2Jh
c2UKICB4ODY6IGludHJvZHVjZSBoeXBlcnZpc29yIGZyYW1ld29yawogIHg4NjogcmVuYW1lIGh5
cGVydmlzb3Jfe2FsbG9jLGZyZWV9X3VudXNlZF9wYWdlCiAgeDg2OiBzd2l0Y2ggeGVuIGd1ZXN0
IGltcGxlbWVudGF0aW9uIHRvIHVzZSBoeXBlcnZpc29yIGZyYW1ld29yawogIHg4NjogYmUgbW9y
ZSB2ZXJib3NlIHdoZW4gcnVubmluZyBvbiBhIGh5cGVydmlzb3IKICB4ODY6IGludHJvZHVjZSBD
T05GSUdfSFlQRVJWIGFuZCBkZXRlY3Rpb24gY29kZQoKIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKy0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvTWFrZWZp
bGUgICAgICAgICAgICAgICAgICAgfCAgNiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9N
YWtlZmlsZSAgICAgICAgICAgIHwgIDEgKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBl
cnYuYyAgICAgICAgICAgIHwgNTQgKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyAgICAgICAgICAgICAgIHwgODAgKysrKysrKysrKysrKysrKysrKwogeGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgIDQgKwogeGVuL2FyY2gv
eDg2L2d1ZXN0L3sgPT4geGVufS9oeXBlcmNhbGxfcGFnZS5TIHwgIDAKIHhlbi9hcmNoL3g4Ni9n
dWVzdC97ID0+IHhlbn0vcHZoLWJvb3QuYyAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvZ3Vl
c3QveyA9PiB4ZW59L3hlbi5jICAgICAgICAgICAgfCA2MCArKysrKysrLS0tLS0tLQogeGVuL2Fy
Y2gveDg2L3B2L3NoaW0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0KIHhlbi9hcmNo
L3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICstCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0LmggICAgICAgICAgICAgICAgICAgfCAgMiArCiB4ZW4vaW5jbHVkZS9h
c20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oICAgICAgICAgfCAgNCArCiB4ZW4vaW5jbHVkZS9hc20t
eDg2L2d1ZXN0L2h5cGVydi5oICAgICAgICAgICAgfCA0MyArKysrKysrKysrCiB4ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCAgICAgICAgfCA2MiArKysrKysrKysrKysrKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94ZW4uaCAgICAgICAgICAgICAgIHwgMjMgKystLS0t
CiAxNyBmaWxlcyBjaGFuZ2VkLCAzMTQgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi9NYWtlZmlsZQogcmVuYW1lIHhlbi9hcmNo
L3g4Ni9ndWVzdC97ID0+IHhlbn0vaHlwZXJjYWxsX3BhZ2UuUyAoMTAwJSkKIHJlbmFtZSB4ZW4v
YXJjaC94ODYvZ3Vlc3QveyA9PiB4ZW59L3B2aC1ib290LmMgKDk5JSkKIHJlbmFtZSB4ZW4vYXJj
aC94ODYvZ3Vlc3QveyA9PiB4ZW59L3hlbi5jICg5NCUpCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9p
bmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCgotLSAKMi4yMC4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
