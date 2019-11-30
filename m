Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA5310DD15
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 09:15:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaxrs-0003YI-SC; Sat, 30 Nov 2019 08:12:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yXSD=ZW=gmail.com=julian.tuminaro@srs-us1.protection.inumbo.net>)
 id 1iaxrs-0003YD-0v
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 08:12:40 +0000
X-Inumbo-ID: 2c8458cc-1349-11ea-83b8-bc764e2007e4
Received: from mail-pj1-x1041.google.com (unknown [2607:f8b0:4864:20::1041])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c8458cc-1349-11ea-83b8-bc764e2007e4;
 Sat, 30 Nov 2019 08:12:39 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id y21so14408802pjn.9
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 00:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wLfgnpdGWKio5wC+JlRASPkvtt/gDsqC3rQIKJmNYLQ=;
 b=YWGLh6B6bhmemXGHUYGwGHilAjbsJcyKYRkQPOA3voTYcTGgdTNcERfIMQwBca1nDL
 D3vmFEFduk1SyFGbpRuOpLQ9fhmojXibGU2eh1h4bpdUfTJCeEnJxtLis6mkFkvM+u/s
 jV1WznfrdzFUPeyVmVo3uiUlGY1LIfq0u1MuLHqIIZqNDOd5AhTpEk80XxSh4qSNlzQD
 Es5mgvZEBz0Bo/29FwOwpGcQ671+9/MtazbxdrzqUYIlg8bTzHMIgGaPsGuK4M7FG9Bn
 Tw0PEJoAs/DPLkZ5WAyEjAiHJKTSj6UzalF2uBBfKAlvD503S6FK26Gxnq/9SRBqlqX9
 HQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wLfgnpdGWKio5wC+JlRASPkvtt/gDsqC3rQIKJmNYLQ=;
 b=gxNRut24Uz1vSk9HUTMTYAnr/QbxQgZvFYutGSTjHC9TeezysQBimUAROkn662iqql
 Przs2JUtFbA/ZzRYOS9w9jqVAYyVxcQEG4ls30TLYuNK0P5PGX+wLukDTLFzMrhAAoxc
 HRATwVMkjjrOwe17WJugeMhv2g1ksM9fU84gpM4dEtJLp3qF27GHlM0Wdc8Oo66bRVVX
 uC75F40yfffAoZ5ycChsaMp2InsSPWrB4zqsx66rkcGnrVkjGoDg1LEK9vrj6+PbN0yJ
 k37R5ic4KdfyQlNLX5mRsfMxJxtIBkzR7jv55dEJ3H3ZX4Tv9EqekQAI8tktgc7xcPhN
 Pxyg==
X-Gm-Message-State: APjAAAU6q6IyFETQg+DLDbQaEWR5qIphTowOMVkKeeIoFoNV7dOnhxgs
 5banFM2k+3rQ0kmSkZOB/5KX9tPkEu/xSA==
X-Google-Smtp-Source: APXvYqzoW9EEKg/braQnKVyBil/Uc5c9H0h2viQkmFDfMDLnlbE/6OuRrY/WrlB5Z+C3Y4LV8sKh4Q==
X-Received: by 2002:a17:90a:bcf:: with SMTP id
 x15mr24137945pjd.0.1575101558225; 
 Sat, 30 Nov 2019 00:12:38 -0800 (PST)
Received: from localhost.localdomain (c-24-5-132-18.hsd1.ca.comcast.net.
 [24.5.132.18])
 by smtp.gmail.com with ESMTPSA id w3sm15996224pfd.161.2019.11.30.00.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 00:12:37 -0800 (PST)
From: Julian Tuminaro <julian.tuminaro@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 30 Nov 2019 03:11:18 -0500
Message-Id: <20191130081118.18676-1-julian.tuminaro@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] Fix the KDD_LOG statements to use appropriate
 format specifier for printing uint64_t
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
Cc: Wei Liu <wei.liu2@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, Paul Durrant <pdurrant@amazon.com>,
 Jenish Rakholiya <rjenish@cmu.edu>, Ian Jackson <ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UHJldmlvdXMgY29tbWl0IGluIGtkZC5jIGhhZCBhIHNtYWxsIGlzc3VlIHdoaWNoIGxlYWQgdG8g
d2FybmluZy9lcnJvciB3aGlsZSBjb21waWxpbmcKb24gMzItYml0IHN5c3RlbXMgZHVlIHRvIG1p
c21hdGNoIG9mIHR5cGUgc2l6ZSB3aGlsZSBkb2luZyB0eXBlIGNhc3QgZnJvbSB1aW50NjRfdCB0
bwp2b2lkICoKClNpZ25lZC1vZmYtYnk6IEplbmlzaCBSYWtob2xpeWEgPHJqZW5pc2hAY211LmVk
dT4KU2lnbmVkLW9mZi1ieTogSnVsaWFuIFR1bWluYXJvIDxqdHVtaW5hckBhbmRyZXcuY211LmVk
dT4KLS0tCiB0b29scy9kZWJ1Z2dlci9rZGQva2RkLmMgfCAxMSArKysrKy0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
b29scy9kZWJ1Z2dlci9rZGQva2RkLmMgYi90b29scy9kZWJ1Z2dlci9rZGQva2RkLmMKaW5kZXgg
NmQzZmViZWZkYS4uM2ViZGE5YjEyYyAxMDA2NDQKLS0tIGEvdG9vbHMvZGVidWdnZXIva2RkL2tk
ZC5jCisrKyBiL3Rvb2xzL2RlYnVnZ2VyL2tkZC9rZGQuYwpAQCAtNjEzLDcgKzYxMyw3IEBAIHN0
YXRpYyB2b2lkIGdldF9vc19pbmZvXzY0KGtkZF9zdGF0ZSAqcykKICAgICBpZHQwX2FkZHIgfD0g
KChidWYgPj4gMzIpICYgMHhmZmZmMDAwMCk7CiAgICAgaWR0MF9hZGRyIHw9IChidWYgJiAweGZm
ZmYpOwogCi0gICAgS0REX0xPRyhzLCAiaWR0MCBhZGRyOiAlcFxuIiwgKHZvaWQgKilpZHQwX2Fk
ZHIpOworICAgIEtERF9MT0cocywgImlkdDAgYWRkcjogMHglIlBSSXg2NCJcbiIsIGlkdDBfYWRk
cik7CiAKICAgICAvKgogICAgICAqIGdldCB0aGUgcGFnZSBzdGFydCBhbmQgbG9vayBmb3IgIk1a
IiBmaWxlIGhlYWRlciAtIHdlIGxpbWl0IHRoZSBzZWFyY2gKQEAgLTYyMSw3ICs2MjEsNiBAQCBz
dGF0aWMgdm9pZCBnZXRfb3NfaW5mb182NChrZGRfc3RhdGUgKnMpCiAgICAgICovCiAKICAgICBi
YXNlID0gaWR0MF9hZGRyICYgfihQQUdFX1NJWkUgLSAxKTsKLSAgICBLRERfTE9HKHMsICIlcFxu
IiwgKHZvaWQgKiliYXNlKTsKIAogICAgIHdoaWxlIChzZWFyY2hfbGltaXQpIHsKICAgICAgICAg
dWludDE2X3QgdmFsOwpAQCAtNjM4LDcgKzYzNyw3IEBAIHN0YXRpYyB2b2lkIGdldF9vc19pbmZv
XzY0KGtkZF9zdGF0ZSAqcykKICAgICAgICAgc2VhcmNoX2xpbWl0IC09IDE7CiAgICAgfQogCi0g
ICAgS0REX0xPRyhzLCAiYmFzZTogJXBcbiIsICh2b2lkICopYmFzZSk7CisgICAgS0REX0xPRyhz
LCAiYmFzZTogMHglIlBSSXg2NCJcbiIsIGJhc2UpOwogCiAgICAgLyogZm91bmQgdGhlIGRhdGEg
c2VjdGlvbiBzdGFydCAqLwogICAgIGlmIChnZXRfcGU2NF9zZWN0aW9ucyhzLCBiYXNlLCAiLmRh
dGEiLCAmZGF0YV9iYXNlLCAmZGF0YV9zaXplKSkKQEAgLTY4OSw5ICs2ODgsOSBAQCBzdGF0aWMg
dm9pZCBnZXRfb3NfaW5mb182NChrZGRfc3RhdGUgKnMpCiAgICAgaWYgKGNhZGRyIDwgZGF0YV9i
YXNlICsgZGF0YV9zaXplKSB7CiAgICAgICAgIC8qIGlmIGZvdW5kLCBzZXQgdGhlIGZpZWxkIGFu
ZCByZXR1cm4gKi8KIAotICAgICAgICBLRERfTE9HKHMsICJiYXNlOiAlcFxuIiwgKHZvaWQgKili
YXNlKTsKLSAgICAgICAgS0REX0xPRyhzLCAibW9kdWxlcyBsaXN0OiAlcFxuIiwgKHZvaWQgKilt
b2RwdHIpOwotICAgICAgICBLRERfTE9HKHMsICJrZGRsOiAlcFxuIiwgKHZvaWQgKilrZGRsKTsK
KyAgICAgICAgS0REX0xPRyhzLCAiYmFzZTogMHglIlBSSXg2NCJcbiIsIGJhc2UpOworICAgICAg
ICBLRERfTE9HKHMsICJtb2R1bGVzIGxpc3Q6IDB4JSJQUkl4NjQiXG4iLCBtb2RwdHIpOworICAg
ICAgICBLRERfTE9HKHMsICJrZGRsOiAweCUiUFJJeDY0IlxuIiwga2RkbCk7CiAgICAgICAgIEtE
RF9MT0cocywgIm1pbm9yIHZlcnNpb246IDB4JWh4XG4iLCBtaW5vcik7CiAKICAgICAgICAgcy0+
b3MuYmFzZSA9IGJhc2U7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
