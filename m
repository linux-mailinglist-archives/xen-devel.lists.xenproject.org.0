Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2AE15ACE0
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:11:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1uZu-0003Mo-EJ; Wed, 12 Feb 2020 16:09:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MKKR=4A=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j1uZs-0003Mi-Cp
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:09:28 +0000
X-Inumbo-ID: 08b8acc4-4db2-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08b8acc4-4db2-11ea-ade5-bc764e2007e4;
 Wed, 12 Feb 2020 16:09:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z3so3076546wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Feb 2020 08:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w4/mKx/qtd0NynVOwfww2yoUw6w2UGTwgak3PQ9DLDE=;
 b=aFjNnTOsfQJbduTfX8S08F4A+E8kABjSFR3ZIs6lvMdExpd6s6mI67LE+0gZ2kNbau
 S4nu33b/QoLfi/IOUWQA3usfgsl1+/WOCZ4ZCUmrJqky7DoLNaGUj6jlvPx5QHhkx2gk
 7z7J0bSQINA/CtnYPiHxNYBKibnrFaPUbLyuVNw3m/DmB4NptTPhgDL0weQiSt7fUcT7
 7SDDVKh0BPTfTyji7gTvycZTi5ojKUl5abiyi+8PEFgajeOw0AZv0Fsw7QxDQvOYT9cv
 g2/OnGFe93+xOJjBM4euD1REqJ5RhPjQWeWgxZYKh0GdZp0ES+q7ebnzc1nH8xtcdM55
 uwUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=w4/mKx/qtd0NynVOwfww2yoUw6w2UGTwgak3PQ9DLDE=;
 b=lb8KURgeyyidtHUhxhS/glaP6WwUhgC2xaVySwP0boh2KeLda48TMVSyJOUVUTC/T7
 x/5B9/yLp+f3MZPwDWPXgPG3n3yPQlmD8pvGh0H4ZTx/uotpr5D1AYOuapXQPrwVfAqz
 PYshyYReG0J8/Qvk/E1XjczEBv/6pWa288WPwMqliR76NwyBm2fqDLpNbvIwiYaBj8Bd
 8OM617qmjGnh3Dd3F85f9pNGKbvnRFykklB4pC/UdYeTtzqZxpMZYgDKC7Y6wENn0StC
 5LepY/xZ9MNj4dQwolaEZ6RUlB95TqNvXl4zNOddfG24TBvZM0fAeZUZO1DiKgTaWL/F
 ik8g==
X-Gm-Message-State: APjAAAU6TlkysoVjwpRmkzFZjxK+OQJUm1yFfJpjMu7XDhLz1PuaBdDF
 VKgJp2g/nSAn09K2U4ZqGivxj1xb
X-Google-Smtp-Source: APXvYqxv6ZxvAJ8EBNiZ22MO7NLcpNYu3QGMUvJAs6bDhvDhiBz0CxVsfpR13SFygtSqm4pTJYi8DQ==
X-Received: by 2002:a05:6000:10d1:: with SMTP id
 b17mr15768677wrx.298.1581523762841; 
 Wed, 12 Feb 2020 08:09:22 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 o4sm1142500wrx.25.2020.02.12.08.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 08:09:22 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 16:09:15 +0000
Message-Id: <20200212160918.18470-2-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212160918.18470-1-liuwe@microsoft.com>
References: <20200212160918.18470-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/4] x86/hyperv: misc cleanup
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

Q2hhbmdlIGh2X3ZwX2luZGV4IHRvIHVzZSB1aW50MzJfdCBiZWNhdXNlIHRoYXQgaXMgd2hhdCBp
cyBkZWZpbmVkIGluIFRMRlMuCgpBZGQgIl9hZGRyIiBzdWZmaXggdG8gaHZfZG9fcmVwX2h5cGVy
Y2FsbCdzIHBhcmFtZXRlcnMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3Nv
ZnQuY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgICAgICAgfCAy
ICstCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCAgICAgIHwgMiArLQogeGVu
L2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaCB8IDUgKysrLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L2h5cGVydi5jCmluZGV4IDcwZjRjZDVhZTAuLmI3MDQ0ZjcxOTMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYwpAQCAtMzEsNyArMzEsNyBAQAogc3RydWN0IG1zX2h5cGVydl9pbmZv
IF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2OwogREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9p
ZCAqLCBodl9pbnB1dF9wYWdlKTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwg
aHZfdnBfYXNzaXN0KTsKLURFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHVuc2lnbmVkIGludCwg
aHZfdnBfaW5kZXgpOworREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodWludDMyX3QsIGh2X3Zw
X2luZGV4KTsKIAogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCiB7CmRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaCBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCmluZGV4IDk1NmVmZjgzMWYuLmViMTRlYTQzZTUg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCkBAIC0yNiw2ICsyNiw2IEBACiAKIERF
Q0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOwogREVDTEFSRV9QRVJfQ1BVKHZv
aWQgKiwgaHZfdnBfYXNzaXN0KTsKLURFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3Zw
X2luZGV4KTsKK0RFQ0xBUkVfUEVSX0NQVSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwogCiAjZW5k
aWYgLyogX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8KZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1
ZXN0L2h5cGVydi1oY2FsbC5oCmluZGV4IDRkM2IxMzFiM2EuLjMzOTZjYWNjZGQgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LWhjYWxsLmgKKysrIGIveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaApAQCAtNjEsNyArNjEsOCBAQCBzdGF0
aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2Zhc3RfaHlwZXJjYWxsKHVpbnQxNl90IGNvZGUsCiAK
IHN0YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfZG9fcmVwX2h5cGVyY2FsbCh1aW50MTZfdCBjb2Rl
LCB1aW50MTZfdCByZXBfY291bnQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDE2X3QgdmFyaGVhZF9zaXplLAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgaW5wdXQsIHBhZGRyX3Qgb3V0cHV0KQorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRyX3QgaW5wdXRfYWRkciwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IG91dHB1
dF9hZGRyKQogewogICAgIHVpbnQ2NF90IGNvbnRyb2wgPSBjb2RlOwogICAgIHVpbnQ2NF90IHN0
YXR1czsKQEAgLTcxLDcgKzcyLDcgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19yZXBf
aHlwZXJjYWxsKHVpbnQxNl90IGNvZGUsIHVpbnQxNl90IHJlcF9jb3VudCwKICAgICBjb250cm9s
IHw9ICh1aW50NjRfdClyZXBfY291bnQgPDwgSFZfSFlQRVJDQUxMX1JFUF9DT01QX09GRlNFVDsK
IAogICAgIGRvIHsKLSAgICAgICAgc3RhdHVzID0gaHZfZG9faHlwZXJjYWxsKGNvbnRyb2wsIGlu
cHV0LCBvdXRwdXQpOworICAgICAgICBzdGF0dXMgPSBodl9kb19oeXBlcmNhbGwoY29udHJvbCwg
aW5wdXRfYWRkciwgb3V0cHV0X2FkZHIpOwogICAgICAgICBpZiAoIChzdGF0dXMgJiBIVl9IWVBF
UkNBTExfUkVTVUxUX01BU0spICE9IEhWX1NUQVRVU19TVUNDRVNTICkKICAgICAgICAgICAgIGJy
ZWFrOwogCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
