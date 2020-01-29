Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299E14D1DC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 21:23:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwtq7-0006tl-CZ; Wed, 29 Jan 2020 20:21:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bu37=3S=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iwtq5-0006sR-0K
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 20:21:29 +0000
X-Inumbo-ID: d61964f8-42d4-11ea-b211-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d61964f8-42d4-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 20:20:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y11so1043480wrt.6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 12:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RzyOqBOVVAhQpV3lENjn6NyUC6dkaBmuVSXJthxFeDo=;
 b=tVwiF6rLrO3eOWMXW337suntCd+02cBaulZA8iz82SvDHIxXPKlDhU1WZ693ML3BP3
 NjXO1XHGo6EysyZ7CLntBoluIMWcFu3zjM8M3rfs5ybgF8J1eMQ9mgUMMfZta2eSy30X
 +qXiwES7EhGudr8CxQWMrCMb7bdrKhaC7tl+0o3Pm+x6lrU+3hwQvvWRleEjuj9PBtg0
 ANx80USJP9IpNK3dInzDkZaWTMSNftycTRToW6J97TlmbeQukfKVyk41jlzaW/ZUNpqE
 Hen0LoURoeFWY+CeDOT5I/EM7s12rNrHhOAJFyYIFpn+NdWo89VmD0XA220eQT3RRGkY
 1wJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RzyOqBOVVAhQpV3lENjn6NyUC6dkaBmuVSXJthxFeDo=;
 b=tWSjO5VNplATU1mAzBkZe6v3dGVn2pOz0DLncmhwDzKPYrEEPp6zteKalqLmtbPo/3
 h94PB0uO5rKmmN+A+gcL8xFfte29w60YMJw7k9BSGsmE4ZnbfLUOmQdtsBc2GxKn7Ckh
 txJZiSPGVxAkJWqmy7azYxHU/1rC10RWNdKDQ12U/0CElJEhjMbNKVkJ9vV4X/dJPafw
 +wRtUzBa3vvlUE+aX8F5tAAxZOF3KV2aZxu/y06DnD8Drt7Te1z+pxlBP9GqYA7ePOob
 9r2KLcCJbCNTclHE3hqLblxNCoK1yyin4nRuwNHgJAylqCvEWP6MoSjsPZL+y/WQ4enF
 f72g==
X-Gm-Message-State: APjAAAXRBbVKPNt1WWNSBcEcMgGUVpSuCHo3S4iX+OWIT4h9s8v8XEeD
 ih+SVTRKcwR6zeb5s36Thl4Mi0WkMjs=
X-Google-Smtp-Source: APXvYqzwjLjlOp06e+zlACqgmsdgD2iIe6NpsKXB8oa29a81W/0W/Qetj2PJHKKKNz4LwsuofXKrcA==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr624231wrn.386.1580329247544; 
 Wed, 29 Jan 2020 12:20:47 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 a22sm3564115wmd.20.2020.01.29.12.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 12:20:47 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 29 Jan 2020 20:20:32 +0000
Message-Id: <20200129202034.15052-11-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200129202034.15052-1-liuwe@microsoft.com>
References: <20200129202034.15052-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 10/12] x86/hyperv: provide percpu hypercall
 input page
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
 Michael Kelley <mikelley@microsoft.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SHlwZXItVidzIGlucHV0IC8gb3V0cHV0IGFyZ3VtZW50IG11c3QgYmUgOCBieXRlcyBhbGlnbmVk
IGFuIG5vdCBjcm9zcwpwYWdlIGJvdW5kYXJ5LiBPbmUgd2F5IHRvIHNhdGlzZnkgdGhvc2UgcmVx
dWlyZW1lbnRzIGlzIHRvIHVzZSBwZXJjcHUKcGFnZS4KCkZvciB0aGUgZm9yZXNlZWFibGUgZnV0
dXJlIHdlIG9ubHkgbmVlZCB0byBwcm92aWRlIGlucHV0IGZvciBUTEIKYW5kIEFQSUMgaHlwZXJj
YWxscywgc28gc2tpcCBzZXR0aW5nIHVwIGFuIG91dHB1dCBwYWdlLgoKV2Ugd2lsbCBhbHNvIG5l
ZWQgdG8gcHJvdmlkZSBhbiBhcF9zZXR1cCBob29rIGZvciBzZWNvbmRhcnkgY3B1cyB0bwpzZXR1
cCBpdHMgb3duIGlucHV0IHBhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNy
b3NvZnQuY29tPgotLS0KdjU6CjEuIEFkanVzdCB0byBuZXcgYXBfc2V0dXAKMi4gQ2hhbmdlIHZh
cmlhYmxlIG5hbWUgdG8gaHZfcGNwdV9pbnB1dF9wYWdlCgp2NDoKMS4gQ2hhbmdlIHdvcmRpbmcg
aW4gY29tbWl0IG1lc3NhZ2UKMi4gUHJldmVudCBsZWFrCjMuIEludHJvZHVjZSBhIHByaXZhdGUg
aGVhZGVyCgp2MzoKMS4gVXNlIHhlbmhlYXAgcGFnZSBpbnN0ZWFkCjIuIERyb3AgcGFnZSB0cmFj
a2luZyBzdHJ1Y3R1cmUKMy4gRHJvcCBQYXVsJ3MgcmV2aWV3IHRhZwotLS0KIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgMjkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKykKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCmluZGV4IDQzODdiNjU0MWUuLmYwZmFjY2NiYWQgMTAwNjQ0
Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwpAQCAtMjcsNyArMjcsMTAgQEAKICNpbmNsdWRlIDxh
c20vZ3Vlc3QvaHlwZXJ2LXRsZnMuaD4KICNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+CiAKKyNp
bmNsdWRlICJwcml2YXRlLmgiCisKIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5
IG1zX2h5cGVydjsKK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHZvaWQgKiwgaHZfcGNwdV9p
bnB1dF9wYWdlKTsKIAogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRlX2d1ZXN0X2lkKHZvaWQpCiB7
CkBAIC0xMjcsMTQgKzEzMCw0MiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBfaHlwZXJjYWxs
X3BhZ2Uodm9pZCkKICAgICB9CiB9CiAKK3N0YXRpYyBpbnQgc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKHZvaWQpCit7CisgICAgdm9pZCAqbWFwcGluZzsKKworICAgIGlmICggdGhpc19jcHUoaHZf
cGNwdV9pbnB1dF9wYWdlKSApCisgICAgICAgIHJldHVybiAwOworCisgICAgbWFwcGluZyA9IGFs
bG9jX3hlbmhlYXBfcGFnZSgpOworICAgIGlmICggIW1hcHBpbmcgKQorICAgIHsKKyAgICAgICAg
cHJpbnRrKCJGYWlsZWQgdG8gYWxsb2NhdGUgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yIENQVSV1
XG4iLAorICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKyAgICAgICAgcmV0dXJu
IC1FTk9NRU07CisgICAgfQorCisgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9wYWdlKSA9IG1h
cHBpbmc7CisKKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZv
aWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKKyAgICBpZiAoIHNldHVwX2h5cGVy
Y2FsbF9wY3B1X2FyZygpICkKKyAgICAgICAgcGFuaWMoIkh5cGVyY2FsbCBwZXJjcHUgYXJnIHNl
dHVwIGZhaWxlZFxuIik7Cit9CisKK3N0YXRpYyBpbnQgYXBfc2V0dXAodm9pZCkKK3sKKyAgICBy
ZXR1cm4gc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJnKCk7CiB9CiAKIHN0YXRpYyBjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzID0gewogICAgIC5uYW1lID0gIkh5cGVyLVYiLAogICAgIC5z
ZXR1cCA9IHNldHVwLAorICAgIC5hcF9zZXR1cCA9IGFwX3NldHVwLAogfTsKIAogc3RhdGljIHZv
aWQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9ucyh2b2lkKQpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3ByaXZhdGUuaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5hMzM5
Mjc0OTg1Ci0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2
YXRlLmgKQEAgLTAsMCArMSwyOSBAQAorLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICogYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAorICoKKyAqIERlZmluaXRpb25zIC8gZGVjbGFyYXRp
b25zIG9ubHkgdXNlZnVsIHRvIEh5cGVyLVYgY29kZS4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICog
aXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBw
dWJsaXNoZWQgYnkKKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJz
aW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2
ZXJzaW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0
aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRo
b3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBG
SVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUKKyAqIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqIGFs
b25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xp
Y2Vuc2VzLz4uCisgKgorICogQ29weXJpZ2h0IChjKSAyMDIwIE1pY3Jvc29mdC4KKyAqLworCisj
aWZuZGVmIF9fWEVOX0hZUEVSVl9QUklWSUFURV9IX18KKyNkZWZpbmUgX19YRU5fSFlQRVJWX1BS
SVZJQVRFX0hfXworCisjaW5jbHVkZSA8eGVuL3BlcmNwdS5oPgorCitERUNMQVJFX1BFUl9DUFUo
dm9pZCAqLCBodl9wY3B1X2lucHV0X3BhZ2UpOworCisjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BS
SVZJQVRFX0hfXyAgKi8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
