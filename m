Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3758E12FA21
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 17:12:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inPW7-0005hZ-53; Fri, 03 Jan 2020 16:09:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fV2H=2Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1inPW5-0005gn-Mf
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 16:09:37 +0000
X-Inumbo-ID: 5d648e3e-2e43-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d648e3e-2e43-11ea-b6f1-bc764e2007e4;
 Fri, 03 Jan 2020 16:09:05 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d16so42885705wre.10
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jan 2020 08:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QxvxkFsBq9Bc5+7I063/jL+c+OhXWyTgW7n8J0N8R6s=;
 b=aLHpkybuVzC/g9a2pgPZck1nlSkeJ97bBZ6COKF2fLL1RNsJYXZymDjD+k39c6qEUk
 uqdbh6qeBxDoH8k+DmbPlECAckHel9QdG2FcqakMg7d0/jQfJBQvccYiE8MJhC5bZDqz
 5Lglb4UZHpa3gatpwAcAk9zhglDtVXk93iKmwcU8Hpo5TlJsVtX/Syx4gqfYaYdSlJX+
 obqS0vT2BGiv/ft4QWF8w42503Vt8f4wajzSZZNdSQ8wgTaGHwJMi21IA1TfFqDia4gE
 IFyBE3J6ANtY3u6bAvPhKX8DlgWvYJNVoqNs2bVeMwJbwCz1uZ4Wii0N4esk0JYp67FT
 YV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QxvxkFsBq9Bc5+7I063/jL+c+OhXWyTgW7n8J0N8R6s=;
 b=IJY1rnVoMrgMhv563bmJTC7mXAUi67XU61iYBnZQMAD+WjQ+jiLE7TJ89zSBp/u0/9
 9HIvo5p/Fz5hF9u4qyCj0UD0D028SozkyDkdk5lz9QVEV54WwpoGSVkafGMtbivNOTWd
 43w5sBgyJOJEAMdwmC2YN6Oh89h58B3XdltukFieTO/kzqX7lfmhZ9CFwWj6SOZilypR
 XxyQAXIJ/snalXeCLRULJqmgVzqNozMeFkJA8Px0eG8rkiGHzRI3pGj1DQ6hrAW9xs94
 t6bLzG9Ux2sqgIbDdT9jmH6SZhbO6eRRTDCbPXt6tGYSGgVB702TheKddZS4YXt3TkVv
 yk2g==
X-Gm-Message-State: APjAAAXEFIOycpiral3uE1zYw241Zz+aqcPfMdNJgWQQh0yC8ZgKparn
 Q/n/WJuimv9+K3QDEeTGNSj0yOWet/uFag==
X-Google-Smtp-Source: APXvYqzg54U/jtCaQ8LIaT9EwOnit73cCh1PWTZ+FGutrIgePQed6FkLIv3g+t3ZdHIQNRrVsnxhPA==
X-Received: by 2002:a5d:608a:: with SMTP id w10mr83549018wrt.136.1578067744831; 
 Fri, 03 Jan 2020 08:09:04 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id z11sm61000235wrt.82.2020.01.03.08.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 08:09:04 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Fri,  3 Jan 2020 16:08:25 +0000
Message-Id: <20200103160825.19377-9-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200103160825.19377-1-liuwe@microsoft.com>
References: <20200103160825.19377-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 8/8] x86/hyperv: setup VP assist page
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

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4KZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpQcmVlbXB0
aXZlbHkgc3BsaXQgb3V0IHNldF92cF9hc3Npc3QgcGFnZSB3aGljaCB3aWxsIGJlIHVzZWQgaW4g
dGhlIHJlc3VtZQpwYXRoLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0
LmNvbT4KLS0tCnYyOgoxLiBVc2UgSFZfSFlQX1BBR0VfU0hJRlQgaW5zdGVhZAotLS0KIHhlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAzNCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCAgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYu
YwppbmRleCA1YzVhZWQ0NmNiLi5jZjZhZDEzZTQ4IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlw
ZXJ2LmMKQEAgLTI5LDYgKzI5LDcgQEAgc3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0
bHkgbXNfaHlwZXJ2OwogZXh0ZXJuIGNoYXIgaHZfaHlwZXJjYWxsX3BhZ2VbXTsKIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdlLCBodl9wY3B1X2lucHV0
X2FyZyk7CiBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2lu
ZGV4KTsKK0RFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBoeXBlcnZfcGNwdV9wYWdl
LCBodl92cF9hc3Npc3QpOwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIG9w
czsKIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyAqX19pbml0IGh5cGVydl9wcm9iZSh2b2lk
KQpAQCAtMTA3LDE1ICsxMDgsNDggQEAgc3RhdGljIHZvaWQgc2V0dXBfaHlwZXJjYWxsX3BjcHVf
YXJnKHZvaWQpCiAgICAgdGhpc19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5kZXhfbXNyOwogfQog
CitzdGF0aWMgdm9pZCBzZXRfdnBfYXNzaXN0KHZvaWQpCit7CisgICAgdWludDY0X3QgdmFsID0g
cGFkZHJfdG9fcGZuKHRoaXNfY3B1KGh2X3ZwX2Fzc2lzdCkubWFkZHIpOworCisgICAgdmFsID0g
KHZhbCA8PCBIVl9IWVBfUEFHRV9TSElGVCkgfCBIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFX0VO
QUJMRTsKKworICAgIHdybXNybChIVl9YNjRfTVNSX1ZQX0FTU0lTVF9QQUdFLCB2YWwpOworfQor
CitzdGF0aWMgdm9pZCBzZXR1cF92cF9hc3Npc3Qodm9pZCkKK3sKKyAgICBzdHJ1Y3QgcGFnZV9p
bmZvICpwZzsKKyAgICB2b2lkICptYXBwaW5nOworICAgIHVuc2lnbmVkIGludCBjcHUgPSBzbXBf
cHJvY2Vzc29yX2lkKCk7CisKKyAgICBwZyA9IGFsbG9jX2RvbWhlYXBfcGFnZShOVUxMLCAwKTsK
KyAgICBpZiAoICFwZyApCisgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgdnBfYXNz
aXN0IHBhZ2UgZm9yICV1XG4iLCBjcHUpOworCisgICAgbWFwcGluZyA9IF9fbWFwX2RvbWFpbl9w
YWdlX2dsb2JhbChwZyk7CisgICAgaWYgKCAhbWFwcGluZyApCisgICAgICAgIHBhbmljKCJGYWls
ZWQgdG8gbWFwIHZwX2Fzc2lzdCBwYWdlIGZvciAldVxuIiwgY3B1KTsKKworICAgIGNsZWFyX3Bh
Z2UobWFwcGluZyk7CisKKyAgICB0aGlzX2NwdShodl92cF9hc3Npc3QpLm1hZGRyID0gcGFnZV90
b19tYWRkcihwZyk7CisgICAgdGhpc19jcHUoaHZfdnBfYXNzaXN0KS5tYXBwaW5nID0gbWFwcGlu
ZzsKKworICAgIHNldF92cF9hc3Npc3QoKTsKK30KKwogc3RhdGljIHZvaWQgX19pbml0IHNldHVw
KHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxsX3BhZ2UoKTsKICAgICBzZXR1cF9oeXBlcmNh
bGxfcGNwdV9hcmcoKTsKKyAgICBzZXR1cF92cF9hc3Npc3QoKTsKIH0KIAogc3RhdGljIHZvaWQg
YXBfc2V0dXAodm9pZCkKIHsKICAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKKyAgICBz
ZXR1cF92cF9hc3Npc3QoKTsKIH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29w
cyBvcHMgPSB7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5o
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYuaAppbmRleCA0YjYzNTgyOWYzLi45
MTdmNGUwMmMyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydi5o
CisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgKQEAgLTcxLDYgKzcxLDcg
QEAgc3RydWN0IGh5cGVydl9wY3B1X3BhZ2UgewogfTsKIERFQ0xBUkVfUEVSX0NQVShzdHJ1Y3Qg
aHlwZXJ2X3BjcHVfcGFnZSwgaHZfcGNwdV9pbnB1dF9hcmcpOwogREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOworREVDTEFSRV9QRVJfQ1BVKHN0cnVjdCBoeXBlcnZf
cGNwdV9wYWdlLCBodl92cF9hc3Npc3QpOwogCiBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
Kmh5cGVydl9wcm9iZSh2b2lkKTsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
