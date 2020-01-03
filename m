Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DEC12FA26
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:12:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPVx-0005aG-BV; Fri, 03 Jan 2020 16:09:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPVv-0005ZG-Lo
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:27 +0000
X-Inumbo-ID: 5c099f48-2e43-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c099f48-2e43-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so42927838wrh.5
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CQAPrwZ6zHYdeecjna9SU+ovWbg6SlC0hmlnmabw3K0=;
 b=gmCFLGnFcf+29R1n5v0xIWDuW3zWHEzSWuTJErOBQYqfjFbu4+LY+8t0UDm6Scl4d+
 Yb/BlmUMcNvH7G0tXDLB/0tpUmsIolrrwTd04qfX+uGSzVJxqe3obvWDdGq1UMOj2WLG
 l43pZD3fIx+5+t2UTf9T8BCKPftCDDaSyGCILETg+EQFtbpAWoVN0dPi5WWMakKXwVfx
 wvQZlImx2HGb0irF7dkRPvCFVoLBoZGifjOUZyyL1ObNhhaugvhOGTPc1Zy0jrk5y7dW
 jO9RUQ7Ntve/jPdROGyoPeKaGINVS1M0Yo0uk30SNsLyGB0mZLiQoOidu6KeUTRHG0S3
 M5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CQAPrwZ6zHYdeecjna9SU+ovWbg6SlC0hmlnmabw3K0=;
 b=BmvHGAxUiOmOEjdhfA/scbq7l98V0yxSnZsAlh1Q63wgfix/wNlqt1lOT4WOThH2tV
 XgRQm0Nt7apEs3wAPx0hVbQ02MqRs+C/pYE2rKhHlJzQLxt13zN6/mKLjMSH2qpT4UuL
 ygMBvw/QwNpEAcYL6vS3mc4fIDjpnR6gvEihtB4Lh+edXVQiMgwceB1Q9QTcN+bWLHQW
 fCD1yXSLAx7l45LlaP5HXJvFuzV9kdCl10TEnh+tao55mGzuf7RDtqEg9lyeuxwqQJJg
 tCoORGFC+6ku5Inakce9GY+bjab9Y+3qiorAbg+n7ejgx1dzJN8ELAj+yCRWnyCkb/T+
 KtYA==
X-Gm-Message-State: APjAAAV367xutEqH07KFLI/6RgEX4p89dLLWNbZdxfC5c52Lbsbx0A2V
 lIxENzakYCV1mdbYMtYFwUU0gbdyZ/D3DQ==
X-Google-Smtp-Source: APXvYqyWeqNbXCdXFT2fFknZH+3j9VXX2ry3FTDYp8zpb2KWhKVx4hj6hXbMX0G6+30mCzVZ/fLI/g==
X-Received: by 2002:adf:fd07:: with SMTP id e7mr86811193wrr.21.1578067742550; 
 Fri, 03 Jan 2020 08:09:02 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:09:02 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:23 +0000
Message-Id: <20200103160825.19377-7-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 6/8] x86/hyperv: provide percpu hypercall
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SHlwZXItVidzIGlucHV0IC8gb3V0cHV0IGFyZ3VtZW50IG11c3QgYmUgOCBieXRlcyBhbGlnbmVk
IGFuIG5vdCBjcm9zcwpwYWdlIGJvdW5kYXJ5LiBUaGUgZWFzaWVzdCB3YXkgdG8gc2F0aXNmeSB0
aG9zZSByZXF1aXJlbWVudHMgaXMgdG8gdXNlCnBlcmNwdSBwYWdlLgoKRm9yIHRoZSBmb3Jlc2Vl
YWJsZSBmdXR1cmUgd2Ugb25seSBuZWVkIHRvIHByb3ZpZGUgaW5wdXQgZm9yIFRMQgphbmQgQVBJ
QyBoeXBlcmNhbGxzLCBzbyBza2lwIHNldHRpbmcgdXAgYW4gb3V0cHV0IHBhZ2UuCgpUaGUgcGFn
ZSB0cmFja2luZyBzdHJ1Y3R1cmUgaXMgbm90IGJvdW5kIHRvIGh5cGVyY2FsbCBiZWNhdXNlIGl0
IGlzIGEKY29tbW9uIHBhdHRlcm4gZm9yIFhlbiB0byB3cml0ZSBndWVzdCBwaHlzaWNhbCBhZGRy
ZXNzIHRvIEh5cGVyLVYgd2hpbGUKYXQgdGhlIHNhbWUgdGltZSBhY2Nlc3NpbmcgdGhlIHBhZ2Ug
dmlhIGEgcG9pbnRlci4KCldlIHdpbGwgYWxzbyBuZWVkIHRvIHByb3ZpZGUgYW4gYXBfc2V0dXAg
aG9vayBmb3Igc2Vjb25kYXJ5IGNwdXMgdG8Kc2V0dXAgaXRzIG93biBpbnB1dCBwYWdlLgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT4KUmV2aWV3ZWQtYnk6IFBh
dWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgotLS0KIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
aHlwZXJ2LmMgfCAyNiArKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC9oeXBlcnYuaCB8ICA4ICsrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDM0IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCAzODFiZTJhNjhj
Li4wMzAyN2JkNDUzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTI3LDYgKzI3
LDcgQEAKIHN0cnVjdCBtc19oeXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIAog
ZXh0ZXJuIGNoYXIgaHZfaHlwZXJjYWxsX3BhZ2VbXTsKK0RFRklORV9QRVJfQ1BVX1JFQURfTU9T
VExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0X2FyZyk7CiAKIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgb3BzOwogY29uc3Qgc3RydWN0IGh5cGVydmlz
b3Jfb3BzICpfX2luaXQgaHlwZXJ2X3Byb2JlKHZvaWQpCkBAIC04MywxNCArODQsMzkgQEAgc3Rh
dGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAgICAgd3Jtc3JsKEhW
X1g2NF9NU1JfSFlQRVJDQUxMLCBoeXBlcmNhbGxfbXNyLmFzX3VpbnQ2NCk7CiB9CiAKK3N0YXRp
YyB2b2lkIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZyh2b2lkKQoreworICAgIHN0cnVjdCBwYWdl
X2luZm8gKnBnOworICAgIHZvaWQgKm1hcHBpbmc7CisgICAgdW5zaWduZWQgaW50IGNwdSA9IHNt
cF9wcm9jZXNzb3JfaWQoKTsKKworICAgIHBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEwsIDAp
OworICAgIGlmICggIXBnICkKKyAgICAgICAgcGFuaWMoIkZhaWxlZCB0byBzZXR1cCBoeXBlcmNh
bGwgaW5wdXQgcGFnZSBmb3IgJXVcbiIsIGNwdSk7CisKKyAgICBtYXBwaW5nID0gX19tYXBfZG9t
YWluX3BhZ2VfZ2xvYmFsKHBnKTsKKyAgICBpZiAoICFtYXBwaW5nICkKKyAgICAgICAgcGFuaWMo
IkZhaWxlZCB0byBtYXAgaHlwZXJjYWxsIGlucHV0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOworCisg
ICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpLm1hZGRyID0gcGFnZV90b19tYWRkcihwZyk7
CisgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpLm1hcHBpbmcgPSBtYXBwaW5nOworfQor
CiBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXAodm9pZCkKIHsKICAgICBzZXR1cF9oeXBlcmNhbGxf
cGFnZSgpOworICAgIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOworfQorCitzdGF0aWMgdm9p
ZCBhcF9zZXR1cCh2b2lkKQoreworICAgIHNldHVwX2h5cGVyY2FsbF9wY3B1X2FyZygpOwogfQog
CiBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9wcyA9IHsKICAgICAubmFtZSA9
ICJIeXBlci1WIiwKICAgICAuc2V0dXAgPSBzZXR1cCwKKyAgICAuYXBfc2V0dXAgPSBhcF9zZXR1
cCwKIH07CiAKIC8qCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAppbmRleCBjN2E3ZjMyYmQ1
Li44M2YyOTc0NjhmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVy
di5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTUxLDYgKzUx
LDggQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9zY2FsZV90c2ModWludDY0X3QgdHNjLCB1
aW50NjRfdCBzY2FsZSwKIAogI2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKIAorI2luY2x1ZGUg
PHhlbi9wZXJjcHUuaD4KKwogI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+CiAKIHN0
cnVjdCBtc19oeXBlcnZfaW5mbyB7CkBAIC02Myw2ICs2NSwxMiBAQCBzdHJ1Y3QgbXNfaHlwZXJ2
X2luZm8gewogfTsKIGV4dGVybiBzdHJ1Y3QgbXNfaHlwZXJ2X2luZm8gbXNfaHlwZXJ2OwogCitz
dHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSB7CisgICAgcGFkZHJfdCBtYWRkcjsKKyAgICB2b2lkICpt
YXBwaW5nOworfTsKK0RFQ0xBUkVfUEVSX0NQVShzdHJ1Y3QgaHlwZXJ2X3BjcHVfcGFnZSwgaHZf
cGNwdV9pbnB1dF9hcmcpOworCiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgKmh5cGVydl9w
cm9iZSh2b2lkKTsKIAogI2Vsc2UKLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
