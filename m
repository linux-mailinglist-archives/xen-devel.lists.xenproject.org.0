Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308CD763B5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 12:42:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxbj-0006YT-9x; Fri, 26 Jul 2019 10:37:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gQyu=VX=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hqxbh-0006YG-Oi
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 10:37:49 +0000
X-Inumbo-ID: 6890b12e-af91-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6890b12e-af91-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 10:37:48 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id t28so51004234lje.9
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 03:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=r+8JnlZestTVxlER6RMuaC2epWUTI/v8WDaAeYWwhA0=;
 b=RErUSs4OfOW/pF16O1aJVbU3Hhci+OMHYQPUk2SEsqu4CYSMr9MwQIgkWyIIPO/yvp
 qGPQOfBQFNHUiuojaa2stI9YYWn7ptUKN7+6Xisdjrzlv6L5DtPy+qD15r3hpHWGNqRw
 MyH9te2o+rJVHwlsKBzYnHNAJ/qEPaImQEB+cz0ozfInPKstUj+m5gS4RofLWvphvdJy
 p1/zSAvhBDeFosLUoqdt7AU7w1JxbdBw0CxwJyo4m6gjUUXqBFgjujvS88TmqIb4EucG
 eY0hfn8R/bYIeBvpj+DvmG4uZO0AQPY4CyZrBw0/MY6gZ5XTM7Z2vCDm5eAbgbbRBk0U
 FUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=r+8JnlZestTVxlER6RMuaC2epWUTI/v8WDaAeYWwhA0=;
 b=Q2nzZhVjBZ4Rf3kBXs+7iVLDAT3YrRL2/1FFnDtX8KU0vyoZCQdpHokwPDQKjBiw6x
 hTj5YtEH7FtUGAQTaXdvVmFtSIDiEX8idYP3fzb9rjEuP1AKKSBn3bd6kkHJfLhV5tcP
 zZtCmrZqGGS336VbgrH0dD2ZWgM2qo0YPC/r9NGSiLn7fftvpP0RY3fg23By4S9TQdxf
 O4wwcmpttAeKB4qrEv5UHejxLgJVyP8xdfcaX86UmVnwZJlO7pazEcSn0pV4+onUqEQ6
 qsFwNtrOq37IDczzv9O37bff0aCfcVB9gkpPVtpIAtjbdkY9R6b+9iyN1tA5bLJfKTGb
 u//Q==
X-Gm-Message-State: APjAAAW1E3qgZyRi7yK8BkflNCatvLTFCPHhGC4Lu5qLaI1CAtrXboh6
 +C4qpgGfmDN0Zio6x+uygZbxBxWO
X-Google-Smtp-Source: APXvYqzHH/Xa7A2eRVemlcQHIS8r9ZHsUY98TbT8rBeFeaJFRSzBtBgMe01uVPHjzTX70sZs9qqx3g==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr49167542ljg.134.1564137466198; 
 Fri, 26 Jul 2019 03:37:46 -0700 (PDT)
Received: from aanisov-work.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id m4sm9938274ljc.56.2019.07.26.03.37.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 26 Jul 2019 03:37:45 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 26 Jul 2019 13:37:35 +0300
Message-Id: <1564137460-25629-3-git-send-email-andrii.anisov@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
Subject: [Xen-devel] [RFC 2/6] schedule: account true system idle time
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
 Andrii Anisov <andrii_anisov@epam.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCkN1cnJlbnRseSB0
aGUgaWRsZSB0aW1lIGlzIGJlaW5nIGFjY291bnRlZCBhcyBhIGlkbGUgdmNwdSBydW50aW1lLgpU
aGlzIGlzIG5vdCBlbnRpcmVseSBjb3JyZWN0LCBiZWNhdXNlIHRoZSBlbnRpdHkgbmFtZWQgaWRs
ZSB2Y3B1IGlzCmluIGZhY3QgYSBoeXBlcnZpc29yIHRhc2tzIHdvcmtlci4gRS5nLiBzb21lIHNv
ZnRpcnFzIGFyZSBwcm9jZXNzZWQKYnkgdGhlIGlkbGUgdmNwdS4KU28gbGV0cyBjaGFuZ2UgaWRs
ZSB2Y3B1IHRpbWUgYWNjb3VudGluZyBhbmQgc3BlY2lmeSBzeXN0ZW0gaWRsZSB0aW1lCmFzIGEg
aWRsZSB2Y3B1IGJsb2NrZWQgdGltZS4gRm9yIHRoaXMgd2Ugc2hvdWxkIGFwcHJvcHJpYXRlbHkg
Y2hhbmdlCmlkbGUgdmNwdSBydW5zdGF0ZXMgYXJvdW5kIHRoZSByZWFsIHByb2Nlc3NvciBpZGxl
IGVudHJ5LgoKU2lnbmVkLW9mZi1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KLS0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgfCAyNCArKysrKysrKysrKysrKysrKysr
KysrKysKIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8ICA0ICsrKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MjcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS9kb21haW4uYyBiL3hlbi9hcmNoL2FybS9kb21haW4uYwppbmRleCA5NDFiYmZmLi5hNGUwZmQ3
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluLmMKKysrIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbi5jCkBAIC0xOSw2ICsxOSw3IEBACiAjaW5jbHVkZSA8eGVuL3NjaGVkLmg+CiAjaW5jbHVk
ZSA8eGVuL3NvZnRpcnEuaD4KICNpbmNsdWRlIDx4ZW4vd2FpdC5oPgorI2luY2x1ZGUgPHhlbi9z
Y2hlZC1pZi5oPgogCiAjaW5jbHVkZSA8YXNtL2FsdGVybmF0aXZlLmg+CiAjaW5jbHVkZSA8YXNt
L2NwdWVycmF0YS5oPgpAQCAtNDIsNiArNDMsMjcgQEAKIAogREVGSU5FX1BFUl9DUFUoc3RydWN0
IHZjcHUgKiwgY3Vycl92Y3B1KTsKIAorc3RhdGljIGlubGluZSB2b2lkIGlkbGVfdmNwdV9ydW5z
dGF0ZV9jaGFuZ2UoCisgICAgdW5zaWduZWQgaW50IGNwdSwgaW50IG5ld19zdGF0ZSwgc190aW1l
X3QgbmV3X2VudHJ5X3RpbWUpCit7CisgICAgc190aW1lX3QgZGVsdGE7CisgICAgc3RydWN0IHZj
cHUgKnYgPSBpZGxlX3ZjcHVbY3B1XTsKKyAgICBzcGlubG9ja190ICpsb2NrID0gdmNwdV9zY2hl
ZHVsZV9sb2NrKHYpOworCisgICAgQVNTRVJUKHYgPT0gY3VycmVudCk7CisgICAgQVNTRVJUKHYt
PnJ1bnN0YXRlLnN0YXRlICE9IG5ld19zdGF0ZSk7CisKKyAgICBkZWx0YSA9IG5ld19lbnRyeV90
aW1lIC0gdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZTsKKyAgICBpZiAoIGRlbHRhID4gMCAp
CisgICAgeworICAgICAgICB2LT5ydW5zdGF0ZS50aW1lW3YtPnJ1bnN0YXRlLnN0YXRlXSArPSBk
ZWx0YTsKKyAgICAgICAgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSA9IG5ld19lbnRyeV90
aW1lOworICAgIH0KKworICAgIHYtPnJ1bnN0YXRlLnN0YXRlID0gbmV3X3N0YXRlOworICAgIHZj
cHVfc2NoZWR1bGVfdW5sb2NrKGxvY2ssIHYpOworfQorCiBzdGF0aWMgdm9pZCBkb19pZGxlKHZv
aWQpCiB7CiAgICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKQEAgLTUx
LDExICs3MywxMyBAQCBzdGF0aWMgdm9pZCBkb19pZGxlKHZvaWQpCiAgICAgcHJvY2Vzc19wZW5k
aW5nX3NvZnRpcnFzKCk7CiAKICAgICBsb2NhbF9pcnFfZGlzYWJsZSgpOworICAgIGlkbGVfdmNw
dV9ydW5zdGF0ZV9jaGFuZ2UoY3B1LCBSVU5TVEFURV9ibG9ja2VkLCBOT1coKSk7CiAgICAgaWYg
KCBjcHVfaXNfaGFsdGFibGUoY3B1KSApCiAgICAgewogICAgICAgICBkc2Ioc3kpOwogICAgICAg
ICB3ZmkoKTsKICAgICB9CisgICAgaWRsZV92Y3B1X3J1bnN0YXRlX2NoYW5nZShjcHUsIFJVTlNU
QVRFX3J1bm5pbmcsIE5PVygpKTsKICAgICBsb2NhbF9pcnFfZW5hYmxlKCk7CiAKICAgICBzY2hl
ZF90aWNrX3Jlc3VtZSgpOwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDM0OWY5NjIuLjBhMzhkNGEgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTIxNCw3
ICsyMTQsNyBAQCB1aW50NjRfdCBnZXRfY3B1X2lkbGVfdGltZSh1bnNpZ25lZCBpbnQgY3B1KQog
ICAgIGlmICggY3B1X29ubGluZShjcHUpICYmIHYgKQogICAgICAgICB2Y3B1X3J1bnN0YXRlX2dl
dCh2LCAmc3RhdGUpOwogCi0gICAgcmV0dXJuIHN0YXRlLnRpbWVbUlVOU1RBVEVfcnVubmluZ107
CisgICAgcmV0dXJuIHN0YXRlLnRpbWVbUlVOU1RBVEVfYmxvY2tlZF07CiB9CiAKIC8qCkBAIC05
MjIsNiArOTIyLDggQEAgdm9pZCB2Y3B1X2Jsb2NrKHZvaWQpCiB7CiAgICAgc3RydWN0IHZjcHUg
KnYgPSBjdXJyZW50OwogCisgICAgQVNTRVJUKCFpc19pZGxlX3ZjcHUodikpOworCiAgICAgc2V0
X2JpdChfVlBGX2Jsb2NrZWQsICZ2LT5wYXVzZV9mbGFncyk7CiAKICAgICBhcmNoX3ZjcHVfYmxv
Y2sodik7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
