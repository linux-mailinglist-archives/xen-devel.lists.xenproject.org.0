Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27559141858
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 16:43:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isqCA-0002Js-Uk; Sat, 18 Jan 2020 15:39:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s8pn=3H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1isqC9-0002Jn-Eb
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 15:39:29 +0000
X-Inumbo-ID: b5cfc1e4-3a08-11ea-b74a-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5cfc1e4-3a08-11ea-b74a-12813bfff9fa;
 Sat, 18 Jan 2020 15:39:27 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so25394986wrn.7
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 07:39:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SU5vRiHtz0LXgwj6/4FgHV0+8NkUOLc0keDDb9+i/ak=;
 b=Vxg5staP2x67gP7eKpqcZlC+c2ABxloWG3T0u1azJ0JBorPBSPJA7pCWuvRNPvdCaI
 i3KYyI/l1BwtefngMAZtvx2Gq7cnWpe3+7QfrwNAhruWioyInKQAcapR0WxtwT1vTZ3i
 OWy4K5U93LUODLLU4QZeRWISNxQb6tloL+2DGwluUWA8s49xZqSmgoDzgTPYrHXCnS/Q
 4TuDo+8uxP4itCfLZ6RQmMxDawDZ/vik0t9x1T69Ei0Efr3s1OrIVyZl3GuA3x97zMIi
 EJDxb1EWudRYdeDgrn9fxe+RyjNZPUVdDt37IOHztrLTfXWt3fAPYwwLsg5JVuAczW+R
 QmPA==
X-Gm-Message-State: APjAAAV+L91zt/4FgJn4LgNWU/Zn7s0TMtsk4H331axwXN1NxpPdsQPe
 i5qqPTM7qS9WCp4mR9d8+rI4IBwEBobufw==
X-Google-Smtp-Source: APXvYqxLErFM49esb6u/4FEvt6xbC2kpw0UrcNXii8P2QyAxv30fgFLk0zGlwjnnwPAigc5du/7JZA==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr8711249wrm.13.1579361966646;
 Sat, 18 Jan 2020 07:39:26 -0800 (PST)
Received: from ufe34d9ed68d054.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id f1sm39985114wrp.93.2020.01.18.07.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jan 2020 07:39:26 -0800 (PST)
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Date: Sat, 18 Jan 2020 15:39:24 +0000
Message-Id: <20200118153924.10878-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] xen/arm: gic: Remove pointless assertion
 against enum gic_sgi
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrii Anisov <andrii_anisov@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIEFybSBDb21waWxlciB3aWxsIGNvbXBsYWluIHRoYXQgdGhlIGFzc2VydGlvbnMgQVNTRVJU
KHNnaSA8IDE2KSBpcwphbHdheXMgdHJ1ZS4gVGhpcyBpcyBiZWNhdXNlIHNnaSBpcyBhIGl0ZW0g
b2YgdGhlIGVudW0gZ2ljX3NnaSBhbmQKc2hvdWxkIGFsd2F5cyBjb250YWluIGxlc3MgdGhhbiAx
NiBTR0lzLgoKUmF0aGVyIHRoYW4gdXNpbmcgQVNTRVJUcywgaW50cm9kdWNlIGEgbmV3IGl0ZW0g
aW4gdGhlIG51bSB0aGF0IGNvdWxkIGJlCmNoZWNrZWQgYWdhaW5zdCBhIGJ1aWxkIHRpbWUuCgpU
YWtlIHRoZSBvcHBvcnR1bml0eSB0byByZW1vdmUgdGhlIHNwZWNpZmljIGFzc2lnbmVkIHZhbHVl
cyBmb3IgZWFjaAppdGVtcy4gVGhpcyBpcyBmaW5lIGJlY2F1c2UgZW51bSBhbHdheXMgc3RhcnRz
IGF0IHplcm8gYW5kIHZhbHVlcyB3aWxsCmJlIGFzc2lnbmVkIGJ5IGluY3JlbWVudCBvZiBvbmUu
IE5vbmUgb2Ygb3VyIGNvZGUgYWxzbyByZWx5IG9uIGhhcmRjb2RlZAp2YWx1ZS4KClNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+CkNDOiBBbmRyaWkgQW5pc292IDxh
bmRyaWlfYW5pc292QGVwYW0uY29tPgotLS0KIHhlbi9hcmNoL2FybS9naWMuYyAgICAgICAgfCAx
MiArKysrKystLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmggfCAgNyArKysrLS0tCiAy
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2dpYy5jIGIveGVuL2FyY2gvYXJtL2dpYy5jCmluZGV4IDExMzY1
NWE3ODkuLmQ2MjNjNTdjYjkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9naWMuYworKysgYi94
ZW4vYXJjaC9hcm0vZ2ljLmMKQEAgLTQ0LDYgKzQ0LDEyIEBAIERFRklORV9QRVJfQ1BVKHVpbnQ2
NF90LCBscl9tYXNrKTsKIAogY29uc3Qgc3RydWN0IGdpY19od19vcGVyYXRpb25zICpnaWNfaHdf
b3BzOwogCitzdGF0aWMgdm9pZCBfX2luaXQgX19tYXliZV91bnVzZWQgYnVpbGRfYXNzZXJ0aW9u
cyh2b2lkKQoreworICAgIC8qIENoZWNrIG91ciBlbnVtIGdpY19zZ2kgb25seSBjb3ZlcnMgU0dJ
cyAqLworICAgIEJVSUxEX0JVR19PTihHSUNfU0dJX01BWCA+IE5SX0dJQ19TR0kpOworfQorCiB2
b2lkIHJlZ2lzdGVyX2dpY19vcHMoY29uc3Qgc3RydWN0IGdpY19od19vcGVyYXRpb25zICpvcHMp
CiB7CiAgICAgZ2ljX2h3X29wcyA9IG9wczsKQEAgLTI5NCw4ICszMDAsNiBAQCB2b2lkIF9faW5p
dCBnaWNfaW5pdCh2b2lkKQogCiB2b2lkIHNlbmRfU0dJX21hc2soY29uc3QgY3B1bWFza190ICpj
cHVtYXNrLCBlbnVtIGdpY19zZ2kgc2dpKQogewotICAgIEFTU0VSVChzZ2kgPCAxNik7IC8qIFRo
ZXJlIGFyZSBvbmx5IDE2IFNHSXMgKi8KLQogICAgIGdpY19od19vcHMtPnNlbmRfU0dJKHNnaSwg
U0dJX1RBUkdFVF9MSVNULCBjcHVtYXNrKTsKIH0KIApAQCAtMzA2LDE1ICszMTAsMTEgQEAgdm9p
ZCBzZW5kX1NHSV9vbmUodW5zaWduZWQgaW50IGNwdSwgZW51bSBnaWNfc2dpIHNnaSkKIAogdm9p
ZCBzZW5kX1NHSV9zZWxmKGVudW0gZ2ljX3NnaSBzZ2kpCiB7Ci0gICAgQVNTRVJUKHNnaSA8IDE2
KTsgLyogVGhlcmUgYXJlIG9ubHkgMTYgU0dJcyAqLwotCiAgICAgZ2ljX2h3X29wcy0+c2VuZF9T
R0koc2dpLCBTR0lfVEFSR0VUX1NFTEYsIE5VTEwpOwogfQogCiB2b2lkIHNlbmRfU0dJX2FsbGJ1
dHNlbGYoZW51bSBnaWNfc2dpIHNnaSkKIHsKLSAgIEFTU0VSVChzZ2kgPCAxNik7IC8qIFRoZXJl
IGFyZSBvbmx5IDE2IFNHSXMgKi8KLQogICAgZ2ljX2h3X29wcy0+c2VuZF9TR0koc2dpLCBTR0lf
VEFSR0VUX09USEVSUywgTlVMTCk7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1h
cm0vZ2ljLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL2dpYy5oCmluZGV4IDc5M2QzMjRiMzMuLmJh
ODcwNTIzYmIgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ2ljLmgKKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9naWMuaApAQCAtMjc3LDkgKzI3NywxMCBAQCBleHRlcm4gdm9pZCBn
aWNfcmVzdG9yZV9zdGF0ZShzdHJ1Y3QgdmNwdSAqdik7CiAKIC8qIFNHSSAoQUtBIElQSXMpICov
CiBlbnVtIGdpY19zZ2kgewotICAgIEdJQ19TR0lfRVZFTlRfQ0hFQ0sgPSAwLAotICAgIEdJQ19T
R0lfRFVNUF9TVEFURSAgPSAxLAotICAgIEdJQ19TR0lfQ0FMTF9GVU5DVElPTiA9IDIsCisgICAg
R0lDX1NHSV9FVkVOVF9DSEVDSywKKyAgICBHSUNfU0dJX0RVTVBfU1RBVEUsCisgICAgR0lDX1NH
SV9DQUxMX0ZVTkNUSU9OLAorICAgIEdJQ19TR0lfTUFYLAogfTsKIAogLyogU0dJIGlycSBtb2Rl
IHR5cGVzICovCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
