Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3FA13093B
	for <lists+xen-devel@lfdr.de>; Sun,  5 Jan 2020 17:51:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1io94f-0003lK-HA; Sun, 05 Jan 2020 16:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FFS2=22=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1io94e-0003lE-GJ
 for xen-devel@lists.xenproject.org; Sun, 05 Jan 2020 16:48:20 +0000
X-Inumbo-ID: 2ad8ff7e-2fdb-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ad8ff7e-2fdb-11ea-88e7-bc764e2007e4;
 Sun, 05 Jan 2020 16:48:15 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id t2so47085503wrr.1
 for <xen-devel@lists.xenproject.org>; Sun, 05 Jan 2020 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AeVdaCAPZTMCoRydrJF1kMnbXuo4DmKCUTwBKEx4Ftg=;
 b=r2DLRQlnqCJ7OG+Mer+waKGjvZSZCpgrzpLqRNHx1gEa4cCYhpLVd5NG0HeKiK0Sw9
 voIZ1yQQxiplU5Bon+03bFsjCYg6SxNhWo8TsK4QYzyDpxYEDUHsW0HfZbRMQ5hbDgap
 Y0T+Yp5lW/v9wgT/7B1mkb/SKvcCS9L0fMf3s/RWTIS2EFsJYEZRWQi1B7ytAvbEiIn4
 s1/ct04HglCk8qYtqVF4aqJ6TuQ0lB44tqRQy+RGHe0DH/K5eHQdQfUt1diy0hAedbaL
 udxhnPcaikQZASY7SLB9qhc2yJMUS8iwQBC1GJOkfoeSD1idI6+pkzIqKUXMt0cHxL61
 EXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AeVdaCAPZTMCoRydrJF1kMnbXuo4DmKCUTwBKEx4Ftg=;
 b=azwgb+/a6sHlm9sOszb8duBIGLyBPBP+zKzydACqSevQtO/YPsHBMdEpYGxLyEziT0
 nHJzqRPUyaKhabz57+uqVYPhBbLQuo7swbFDDwsifNmxBLJTABn8iI0YwI7q+HjnLeyv
 cz6o48zf3LNbVoOoAM5DqZ4rooI7R9EhCsMib/uHrxr9GxALR1jWgqTkBesCvjD/GQNs
 WU+sdy18aZQkQ/V8Qde7Tz6zsGazoivAKK5a8jsi7rongiqrLfbWNZmiYAXPqo75J0sg
 anQ6wII7io2eAsZQeRDGojUJ8qSNtUGjUCv91sNFHEQP37ocSVmpDBiQLBdnJxXb+lXI
 5eVw==
X-Gm-Message-State: APjAAAXhABOuDn+OCEAGpUin/vPxCBMn1r6zagAf5yr934PttSJJMf5g
 gb2uQ4c9f8gDKsXDQKrJ+HMsmXn0tsk=
X-Google-Smtp-Source: APXvYqxiumd4z+uBIL06RQRkKx6Fu8H8snAD5+UsfaXvVHj4Wp8rcpwPsWGxoTHD527Xsy9yOKTG/A==
X-Received: by 2002:a05:6000:118d:: with SMTP id
 g13mr3845255wrx.141.1578242894685; 
 Sun, 05 Jan 2020 08:48:14 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id y139sm20834028wmd.24.2020.01.05.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jan 2020 08:48:14 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun,  5 Jan 2020 16:47:57 +0000
Message-Id: <20200105164801.26278-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200105164801.26278-1-liuwe@microsoft.com>
References: <20200105164801.26278-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
