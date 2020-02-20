Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 047AC165794
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 07:26:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4fF4-0000Sx-V2; Thu, 20 Feb 2020 06:23:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ySgZ=4I=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1j4fF3-0000Ss-Vl
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 06:23:22 +0000
X-Inumbo-ID: 7d961a5c-53a9-11ea-b0fd-bc764e2007e4
Received: from mail-pj1-x1043.google.com (unknown [2607:f8b0:4864:20::1043])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d961a5c-53a9-11ea-b0fd-bc764e2007e4;
 Thu, 20 Feb 2020 06:23:21 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id e9so430363pjr.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 22:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pK6zifq3Fj1hZPmmtdvS+UBS/FWrDP/7PRY/z1oHHl8=;
 b=KZPJA/xXWgvj7+EDceNGW99DsMGfVsrwZtMNYFEQmEcfbi6t1Ltywm8yF3gRS+KFsW
 YYa/KruX+agIH6tt/eZGI71UjpwjuT3jsuFYNKw+P7dbnGut/vUuytmTV4wCLvbb1OWN
 mFx5qdjyKzEPpPz0IfGRUIg5ongLMg7FFfcz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pK6zifq3Fj1hZPmmtdvS+UBS/FWrDP/7PRY/z1oHHl8=;
 b=cEB9S8aIKqH0zoTjeE9VMtpHNCeHbhGAd/RZGnf5KgksZO92k1V+f9DcP2QvI1N0AF
 Hk1vSmOE6Vy3vIq+Y2S1JZl9QkRSHxAG4BPrqSwXNxMUwclbdQhZJxtv2g164iktZiPo
 65BDH8gu68VBT2z9CUkbCm2Vdyff+20EP51STFf9F8ieL/a9OTTxfQkcJaANaSvpV89C
 mqRY6ehWJIQ7U9Oim9s1EuXMoIBRfQ5oHMSwNBAOQi9NkwV0iRgv5kh1TXjOnWY7nXMQ
 N1xfZCrR6SVdoFR6dDsZOwwVxJyxIBCYzzG22jCUPeUQYfnv5Fk0qWNxKEHvPT+HbMSx
 pgsA==
X-Gm-Message-State: APjAAAW31zwB07iYOX0TzfeWiSnwOmDgcJyJmqlAtY35yfx1SF7CPHQP
 aPA60XqfYBnsbeMt72WwcBlEJw==
X-Google-Smtp-Source: APXvYqx1kik6D0tY4SYKS7j1S0Bqg7hWpfmaq2nth5vTea0tU8wMl9ddGmg2GgyqqThc+95RG3/LrA==
X-Received: by 2002:a17:90a:f316:: with SMTP id
 ca22mr1759190pjb.59.1582179800527; 
 Wed, 19 Feb 2020 22:23:20 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 3sm1760480pfi.13.2020.02.19.22.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 22:23:19 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>
Date: Wed, 19 Feb 2020 22:23:18 -0800
Message-Id: <20200220062318.69299-1-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/xen: Distribute switch variables for
 initialization
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Alexander Potapenko <glider@google.com>, Kees Cook <keescook@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VmFyaWFibGVzIGRlY2xhcmVkIGluIGEgc3dpdGNoIHN0YXRlbWVudCBiZWZvcmUgYW55IGNhc2Ug
c3RhdGVtZW50cwpjYW5ub3QgYmUgYXV0b21hdGljYWxseSBpbml0aWFsaXplZCB3aXRoIGNvbXBp
bGVyIGluc3RydW1lbnRhdGlvbiAoYXMKdGhleSBhcmUgbm90IHBhcnQgb2YgYW55IGV4ZWN1dGlv
biBmbG93KS4gV2l0aCBHQ0MncyBwcm9wb3NlZCBhdXRvbWF0aWMKc3RhY2sgdmFyaWFibGUgaW5p
dGlhbGl6YXRpb24gZmVhdHVyZSwgdGhpcyB0cmlnZ2VycyBhIHdhcm5pbmcgKGFuZCB0aGV5CmRv
bid0IGdldCBpbml0aWFsaXplZCkuIENsYW5nJ3MgYXV0b21hdGljIHN0YWNrIHZhcmlhYmxlIGlu
aXRpYWxpemF0aW9uCih2aWEgQ09ORklHX0lOSVRfU1RBQ0tfQUxMPXkpIGRvZXNuJ3QgdGhyb3cg
YSB3YXJuaW5nLCBidXQgaXQgYWxzbwpkb2Vzbid0IGluaXRpYWxpemUgc3VjaCB2YXJpYWJsZXNb
MV0uIE5vdGUgdGhhdCB0aGVzZSB3YXJuaW5ncyAob3Igc2lsZW50CnNraXBwaW5nKSBoYXBwZW4g
YmVmb3JlIHRoZSBkZWFkLXN0b3JlIGVsaW1pbmF0aW9uIG9wdGltaXphdGlvbiBwaGFzZSwKc28g
ZXZlbiB3aGVuIHRoZSBhdXRvbWF0aWMgaW5pdGlhbGl6YXRpb25zIGFyZSBsYXRlciBlbGlkZWQg
aW4gZmF2b3Igb2YKZGlyZWN0IGluaXRpYWxpemF0aW9ucywgdGhlIHdhcm5pbmdzIHJlbWFpbi4K
ClRvIGF2b2lkIHRoZXNlIHByb2JsZW1zLCBtb3ZlIHN1Y2ggdmFyaWFibGVzIGludG8gdGhlICJj
YXNlIiB3aGVyZQp0aGV5J3JlIHVzZWQgb3IgbGlmdCB0aGVtIHVwIGludG8gdGhlIG1haW4gZnVu
Y3Rpb24gYm9keS4KCmFyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYzogSW4gZnVuY3Rpb24g4oCY
eGVuX3dyaXRlX21zcl9zYWZl4oCZOgphcmNoL3g4Ni94ZW4vZW5saWdodGVuX3B2LmM6OTA0OjEy
OiB3YXJuaW5nOiBzdGF0ZW1lbnQgd2lsbCBuZXZlciBiZSBleGVjdXRlZCBbLVdzd2l0Y2gtdW5y
ZWFjaGFibGVdCiAgOTA0IHwgICB1bnNpZ25lZCB3aGljaDsKICAgICAgfCAgICAgICAgICAgIF5+
fn5+CgpbMV0gaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3dfYnVnLmNnaT9pZD00NDkxNgoKU2ln
bmVkLW9mZi1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+Ci0tLQogYXJjaC94
ODYveGVuL2VubGlnaHRlbl9wdi5jIHwgICAgNyArKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9l
bmxpZ2h0ZW5fcHYuYyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwppbmRleCAxZjc1NmZm
ZmZlOGIuLjc4OWRjMTJiNzk2MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL2VubGlnaHRlbl9w
di5jCisrKyBiL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5fcHYuYwpAQCAtODk2LDE0ICs4OTYsMTUg
QEAgc3RhdGljIHU2NCB4ZW5fcmVhZF9tc3Jfc2FmZSh1bnNpZ25lZCBpbnQgbXNyLCBpbnQgKmVy
cikKIHN0YXRpYyBpbnQgeGVuX3dyaXRlX21zcl9zYWZlKHVuc2lnbmVkIGludCBtc3IsIHVuc2ln
bmVkIGxvdywgdW5zaWduZWQgaGlnaCkKIHsKIAlpbnQgcmV0OworI2lmZGVmIENPTkZJR19YODZf
NjQKKwl1bnNpZ25lZCB3aGljaDsKKwl1NjQgYmFzZTsKKyNlbmRpZgogCiAJcmV0ID0gMDsKIAog
CXN3aXRjaCAobXNyKSB7CiAjaWZkZWYgQ09ORklHX1g4Nl82NAotCQl1bnNpZ25lZCB3aGljaDsK
LQkJdTY0IGJhc2U7Ci0KIAljYXNlIE1TUl9GU19CQVNFOgkJd2hpY2ggPSBTRUdCQVNFX0ZTOyBn
b3RvIHNldDsKIAljYXNlIE1TUl9LRVJORUxfR1NfQkFTRToJd2hpY2ggPSBTRUdCQVNFX0dTX1VT
RVI7IGdvdG8gc2V0OwogCWNhc2UgTVNSX0dTX0JBU0U6CQl3aGljaCA9IFNFR0JBU0VfR1NfS0VS
TkVMOyBnb3RvIHNldDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
