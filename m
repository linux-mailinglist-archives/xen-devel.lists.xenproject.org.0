Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB47A151D72
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:40:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0H4-0001mN-Ks; Tue, 04 Feb 2020 15:38:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0H2-0001l1-B3
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:38:00 +0000
X-Inumbo-ID: 3b6f9898-4764-11ea-b211-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3b6f9898-4764-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y17so23643826wrh.5
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ixwCG7/dZigNeiQzjDCIJqTFxi0+dHXprIOccPvDWlE=;
 b=W9n4dXVH3YhHhSFNQL7ay9oK4yb/l8DW3qCFgZWh8/LZ4SI1Em49MYLmkAXflaXf6p
 eLlYcGKHMElmRemTL2RGXusI7flXFfrp5VnE4xnoBdIpVybjR3WqfIzuDtviB+5DQXNz
 f4mkUdPIvwFmRF9LT3LLMolrIDKnuRZ+j13v4el9wiiabiV74XCT3hHFAilD6GqhAjPK
 PSVtB85f+9FQqflfbwTFEAJxKv0tZddxzr/SNMQD/9jQpTY5XeZ6JSk1umCeOXk7VT8n
 U4mr//9c6/trOH6trb+tqqAIfcK2fMh6gpaaorNejoYR9peen5GZPjX9/vgkfFSq9ScO
 W/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ixwCG7/dZigNeiQzjDCIJqTFxi0+dHXprIOccPvDWlE=;
 b=JtTkc7ehz3K1pkLiQodeFFSX+LFQn1rDUpr2St+Fo5DgmyCEAkRMN11gFpynb/Kc54
 SK/RODFhPHYCl+M9+ih1LXIWTi7VSZf17fh4zCixhSmBV4DQBcKNzFFgGOpOPqFQaXlz
 29ejBjYerg+CGLMzENkXh8VS6vXPWqng6iEEL7yQR+Az54BMol1ErzP14LGSXFOJE+6D
 KO2CwK65EU/rCD6pAUtJhNrn3kF0pLijM40Acn4e0aKFKmBKz6AyrjWIqR5dCVcsGMJE
 RAZKsCk1EMZpJItN4NEIlWEEFWEv44o8uwWfLSuEVkf0TcufxZxbMoRmK1fkIgFRi8Bb
 zklQ==
X-Gm-Message-State: APjAAAWTd54nFj21NQXtbtgBEY/ajXWnROYW3fz+cVKcHFbFSFh8tYQz
 3yD8fCl46rm8BW/kvJAVb1wcEQ8D14g=
X-Google-Smtp-Source: APXvYqyiU6qRLPBWmWeyDX9Fop1YYuoqvKApCuYZBDwUm8hYOrjIIB9n2ASEN5V7azHy7AQqGI39zw==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr24264342wrx.39.1580830640287; 
 Tue, 04 Feb 2020 07:37:20 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:19 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:37:04 +0000
Message-Id: <20200204153704.15934-11-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 10/10] x86/hyperv: setup VP assist page
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

VlAgYXNzaXN0IHBhZ2UgaXMgcmF0aGVyIGltcG9ydGFudCBhcyB3ZSBuZWVkIHRvIHRvZ2dsZSBz
b21lIGJpdHMgaW4gaXQKZm9yIGVmZmljaWVudCBuZXN0ZWQgdmlydHVhbGlzYXRpb24uCgpTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgpSZXZpZXdlZC1ieTogUGF1
bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQp2NjoKMS4gVXNlIGh2X3ZwX2Fzc2lzdF9w
YWdlX21zcgoyLiBNYWtlIGNvZGUgc2hvcnRlcgozLiBQcmVzZXJ2ZSByc3ZkUCBmaWVsZHMKCnY1
OgoxLiBEZWFsIHdpdGggZXJyb3IgcHJvcGVybHkgaW5zdGVhZCBvZiBhbHdheXMgcGFuaWNraW5n
CjIuIFN3YXAgcGVyY3B1IHZhcmlhYmxlcyBkZWNsYXJhdGlvbnMnIGxvY2F0aW9uCgp2NDoKMS4g
VXNlIHByaXZhdGUuaAoyLiBQcmV2ZW50IGxlYWsKCnYzOgoxLiBVc2UgeGVuaGVhcCBwYWdlCjIu
IERyb3Agc2V0X3ZwX2Fzc2lzdAoKdjI6CjEuIFVzZSBIVl9IWVBfUEFHRV9TSElGVCBpbnN0ZWFk
Ci0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyAgfCAzNyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgg
fCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jIGIveGVuL2Fy
Y2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwppbmRleCBlMzFjNGIzMGI4Li4yNDhmODU0ZDZl
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKQEAgLTMxLDYgKzMxLDcgQEAKIAogc3Ry
dWN0IG1zX2h5cGVydl9pbmZvIF9fcmVhZF9tb3N0bHkgbXNfaHlwZXJ2OwogREVGSU5FX1BFUl9D
UFVfUkVBRF9NT1NUTFkodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKK0RFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKHZvaWQgKiwgaHZfdnBfYXNzaXN0KTsKIERFRklORV9QRVJfQ1BVX1JFQURfTU9T
VExZKHVuc2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwogCiBzdGF0aWMgdWludDY0X3QgZ2VuZXJh
dGVfZ3Vlc3RfaWQodm9pZCkKQEAgLTE1NSw2ICsxNTYsMzEgQEAgc3RhdGljIGludCBzZXR1cF9o
eXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBz
ZXR1cF92cF9hc3Npc3Qodm9pZCkKK3sKKyAgICB1bmlvbiBodl92cF9hc3Npc3RfcGFnZV9tc3Ig
bXNyOworCisgICAgaWYgKCAhdGhpc19jcHUoaHZfdnBfYXNzaXN0KSApCisgICAgeworICAgICAg
ICB0aGlzX2NwdShodl92cF9hc3Npc3QpID0gYWxsb2NfeGVuaGVhcF9wYWdlKCk7CisgICAgICAg
IGlmICggIXRoaXNfY3B1KGh2X3ZwX2Fzc2lzdCkgKQorICAgICAgICB7CisgICAgICAgICAgICBw
cmludGsoIkNQVSV1OiBGYWlsZWQgdG8gYWxsb2NhdGUgdnBfYXNzaXN0IHBhZ2VcbiIsCisgICAg
ICAgICAgICAgICAgICAgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKKyAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOworICAgICAgICB9CisKKyAgICAgICAgY2xlYXJfcGFnZSh0aGlzX2NwdShodl92cF9h
c3Npc3QpKTsKKyAgICB9CisKKyAgICByZG1zcmwoSFZfWDY0X01TUl9WUF9BU1NJU1RfUEFHRSwg
bXNyLnJhdyk7CisgICAgbXNyLnBmbiA9IHZpcnRfdG9fbWZuKHRoaXNfY3B1KGh2X3ZwX2Fzc2lz
dCkpOworICAgIG1zci5lbmFibGVkID0gMTsKKyAgICB3cm1zcmwoSFZfWDY0X01TUl9WUF9BU1NJ
U1RfUEFHRSwgbXNyLnJhdyk7CisKKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGljIHZvaWQgX19p
bml0IHNldHVwKHZvaWQpCiB7CiAgICAgQVNNX0NPTlNUQU5UKEhWX0hDQUxMX1BBR0UsIF9fZml4
X3hfdG9fdmlydChGSVhfWF9IWVBFUlZfSENBTEwpKTsKQEAgLTE2MywxMSArMTg5LDIwIEBAIHN0
YXRpYyB2b2lkIF9faW5pdCBzZXR1cCh2b2lkKQogCiAgICAgaWYgKCBzZXR1cF9oeXBlcmNhbGxf
cGNwdV9hcmcoKSApCiAgICAgICAgIHBhbmljKCJIeXBlci1WIGh5cGVyY2FsbCBwZXJjcHUgYXJn
IHNldHVwIGZhaWxlZFxuIik7CisKKyAgICBpZiAoIHNldHVwX3ZwX2Fzc2lzdCgpICkKKyAgICAg
ICAgcGFuaWMoIlZQIGFzc2lzdCBwYWdlIHNldHVwIGZhaWxlZFxuIik7CiB9CiAKIHN0YXRpYyBp
bnQgYXBfc2V0dXAodm9pZCkKIHsKLSAgICByZXR1cm4gc2V0dXBfaHlwZXJjYWxsX3BjcHVfYXJn
KCk7CisgICAgaW50IHJjOworCisgICAgcmMgPSBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcoKTsK
KyAgICBpZiAoIHJjICkKKyAgICAgICAgcmV0dXJuIHJjOworCisgICAgcmV0dXJuIHNldHVwX3Zw
X2Fzc2lzdCgpOwogfQogCiBzdGF0aWMgdm9pZCBfX2luaXQgZTgyMF9maXh1cChzdHJ1Y3QgZTgy
MG1hcCAqZTgyMCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0
ZS5oIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKaW5kZXggZDE3NjVkNGYy
My4uOTU2ZWZmODMxZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2
YXRlLmgKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKQEAgLTI1LDYg
KzI1LDcgQEAKICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKIERFQ0xBUkVfUEVSX0NQVSh2b2lk
ICosIGh2X2lucHV0X3BhZ2UpOworREVDTEFSRV9QRVJfQ1BVKHZvaWQgKiwgaHZfdnBfYXNzaXN0
KTsKIERFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogI2VuZGlm
IC8qIF9fWEVOX0hZUEVSVl9QUklWSUFURV9IX18gICovCi0tIAoyLjIwLjEKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
