Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E215A145D18
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:27:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuMXu-0006LW-Ri; Wed, 22 Jan 2020 20:24:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vKfK=3L=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iuMXt-0006Kr-0j
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 20:24:13 +0000
X-Inumbo-ID: 1ab8b9d6-3d55-11ea-aecd-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ab8b9d6-3d55-11ea-aecd-bc764e2007e4;
 Wed, 22 Jan 2020 20:23:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id d16so475116wre.10
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 12:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YBVOWoTwbZt9RyjSkTi/ui/Jx6IMZiyjvsALlSN6nSE=;
 b=t7h5F9pi2aI+55TSpCLtn2rYRhsgcOeZSKkqceGIwlLZ12DZuXOEWQYuKn0r1Gk1Vi
 H1iFskjWdIccISsgsS8621EpA3z70oHSPlyy4ZDpHemT/Q9K4I5jknw/V/6cTgpPrFG9
 QqxTRW0+ADCG584d/dgjdwI5mRDrGNpR+kDJ+5GT1AtwO4m7HeECHhNQBptN/69t7WnV
 3AiQ3suzxDBoAbl3/hGuM2WDsgfpqic8/aLlNejYkTnULhx0F1z3sYftParDWlYffcM7
 cNaoAGQ2/tJsmuV1ZreGVDPcabUwzvt+9U8Uy7jBXAKMzOIP8uL4B21JgAC4qqNpkTRN
 xhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YBVOWoTwbZt9RyjSkTi/ui/Jx6IMZiyjvsALlSN6nSE=;
 b=AO0V2UkNUcV2K/UZHisY+LdRoSoPfCACvZ+FIYd8rAD+lA1ZmnM8GafFQS1om9hSkR
 0lxCTuk48lMSGYIuidvX73aHVrx/u8N4V5PF20/Ym3pdKsXV4wFOmRSzDG2LMKI/K0yn
 osRWMaPxIod+RYp9sxql+qo+jj+UbyzX9iLzC80pFI20ZSyOhqGNnyW7pSJpmqW1OyN9
 h7lAzWDoRU9U1KYXax0wfGQBcIlZsRrcEUV8cYH8U3ICbERBbiO0PweEVGxzJMb+5d7t
 Eowaz1e1VPFoAMZJDvHDdgEARZzAUlMUeEq0jMlVlN8aOob7giOuH1wzNLCrO9YaBq1h
 I1CQ==
X-Gm-Message-State: APjAAAUXakRtSQothBTOC++pTC+U5kMpYK76ZfYDv94ITRs/rqzaYlWk
 Iouo5hS4VJGJvJukBGqP3vOsy4cb/PLu+g==
X-Google-Smtp-Source: APXvYqyAuuFKdrMyEvBBl88vXcykiPuUdzNUrlZbFli+SHlAWWXlKZQlqT+j+Zb4nGDz4nikvOW4pg==
X-Received: by 2002:a05:6000:160d:: with SMTP id
 u13mr12590691wrb.22.1579724631245; 
 Wed, 22 Jan 2020 12:23:51 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 r6sm60267992wrq.92.2020.01.22.12.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 12:23:50 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Wed, 22 Jan 2020 20:23:41 +0000
Message-Id: <20200122202343.5703-6-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122202343.5703-1-liuwe@microsoft.com>
References: <20200122202343.5703-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 5/7] x86/hyperv: provide percpu hypercall
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
b3NvZnQuY29tPgotLS0KdjQ6CjEuIENoYW5nZSB3b3JkaW5nIGluIGNvbW1pdCBtZXNzYWdlCjIu
IFByZXZlbnQgbGVhawozLiBJbnRyb2R1Y2UgYSBwcml2YXRlIGhlYWRlcgoKdjM6CjEuIFVzZSB4
ZW5oZWFwIHBhZ2UgaW5zdGVhZAoyLiBEcm9wIHBhZ2UgdHJhY2tpbmcgc3RydWN0dXJlCjMuIERy
b3AgUGF1bCdzIHJldmlldyB0YWcKLS0tCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKysKIHhlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvcHJpdmF0ZS5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMK
aW5kZXggNTM2Y2UwZDBkZC4uYzUxOTVhZjk0OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jCkBAIC0yNyw3ICsyNywxMCBAQAogI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxmcy5o
PgogI2luY2x1ZGUgPGFzbS9wcm9jZXNzb3IuaD4KIAorI2luY2x1ZGUgInByaXZhdGUuaCIKKwog
c3RydWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2OworREVGSU5FX1BF
Ul9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9wY3B1X2lucHV0X2FyZyk7CiAKIHN0YXRpYyB1
aW50NjRfdCBnZW5lcmF0ZV9ndWVzdF9pZCh2b2lkKQogewpAQCAtMTE5LDE0ICsxMjIsMzYgQEAg
c3RhdGljIHZvaWQgX19pbml0IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAgICAgfQogfQog
CitzdGF0aWMgdm9pZCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKK3sKKyAgICB2b2lk
ICptYXBwaW5nOworCisgICAgaWYgKCB0aGlzX2NwdShodl9wY3B1X2lucHV0X2FyZykgKQorICAg
ICAgICByZXR1cm47CisKKyAgICBtYXBwaW5nID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CisgICAg
aWYgKCAhbWFwcGluZyApCisgICAgICAgIHBhbmljKCJGYWlsZWQgdG8gYWxsb2NhdGUgaHlwZXJj
YWxsIGlucHV0IHBhZ2UgZm9yIENQVSV1XG4iLAorICAgICAgICAgICAgICBzbXBfcHJvY2Vzc29y
X2lkKCkpOworCisgICAgdGhpc19jcHUoaHZfcGNwdV9pbnB1dF9hcmcpID0gbWFwcGluZzsKK30K
Kwogc3RhdGljIHZvaWQgX19pbml0IHNldHVwKHZvaWQpCiB7CiAgICAgc2V0dXBfaHlwZXJjYWxs
X3BhZ2UoKTsKKyAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKK30KKworc3RhdGljIHZv
aWQgYXBfc2V0dXAodm9pZCkKK3sKKyAgICBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsKIH0K
IAogc3RhdGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CiAgICAgLm5hbWUg
PSAiSHlwZXItViIsCiAgICAgLnNldHVwID0gc2V0dXAsCisgICAgLmFwX3NldHVwID0gYXBfc2V0
dXAsCiB9OwogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2
YXRlLmggYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iNjkwMmI1NjM5Ci0tLSAvZGV2L251bGwKKysrIGIv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKQEAgLTAsMCArMSwyOSBAQAorLyoq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKgorICogYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAor
ICoKKyAqIERlZmluaXRpb25zIC8gZGVjbGFyYXRpb25zIG9ubHkgdXNlZnVsIHRvIEh5cGVyLVYg
Y29kZS4KKyAqCisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRp
c3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQorICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBH
TlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqIHRoZSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisg
KiAoYXQgeW91ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICog
YnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFu
dHkgb2YKKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVS
UE9TRS4gIFNlZSB0aGUKKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRl
dGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UKKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBu
b3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKgorICogQ29weXJpZ2h0
IChjKSAyMDIwIE1pY3Jvc29mdC4KKyAqLworCisjaWZuZGVmIF9fWEVOX0hZUEVSVl9QUklWSUFU
RV9IX18KKyNkZWZpbmUgX19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXworCisjaW5jbHVkZSA8eGVu
L3BlcmNwdS5oPgorCitERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl9wY3B1X2lucHV0X2FyZyk7
CisKKyNlbmRpZiAvKiBfX1hFTl9IWVBFUlZfUFJJVklBVEVfSF9fICAqLwotLSAKMi4yMC4xCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
