Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3FA6D81A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 03:02:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoHEs-0004Hq-00; Fri, 19 Jul 2019 00:59:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yb9I=VQ=gmail.com=nadav.amit@srs-us1.protection.inumbo.net>)
 id 1hoHEq-0004Hl-OR
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 00:59:08 +0000
X-Inumbo-ID: 67993dd0-a9c0-11e9-953c-532004bc9e96
Received: from mail-pf1-f195.google.com (unknown [209.85.210.195])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67993dd0-a9c0-11e9-953c-532004bc9e96;
 Fri, 19 Jul 2019 00:59:05 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i189so13387019pfg.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 17:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z7W4PDkWeXaZPrNUK/c+i+vfjf2MjCOK5AU8zvB9S68=;
 b=YhQkka4cOuW1Dy23uoAgIwJQX59V86DpiWOOyfLCKsPqvAo52Bpu3GRaXBOJAj+0uS
 syFr0rO9X8itQwCYNHrvV3t4HevZEZLCgANc90zu1o6BSEAzCX9n52EkCxqNGoZZlvtO
 0TfnyvQr2vHm+NaxICw1QX3VAMW+jFJ2oXVN5yy67gfPQx8NaHnXxpym/zWZqmdYY9CG
 b3j1Yi89rjNGztaE7RLzwZxOJhf4m3Qv7FSGtdkOP8ctNZ2Pd/JPdwehRbgnmpmy4Bu3
 cVmWdyWis+B01sswbcdILEv+LOQyqfGPJNun0WvLMYQ5udoraQ5i8BqinWRVhuK8XAnx
 9iRA==
X-Gm-Message-State: APjAAAXNvgIIQW+96hM1rCLi+QymhWave27mHdAagBz3eL1p138cg56a
 +3wyTLGGjPhovLTa+yqUAzE=
X-Google-Smtp-Source: APXvYqxNQ0/uVeaBzcrQoRXrm7ObjvZMyoE1Ndm/375Wyb17fCmZyR76u8EhnAcUCW/z5bktSF56tQ==
X-Received: by 2002:a63:bd0a:: with SMTP id a10mr50136769pgf.55.1563497944208; 
 Thu, 18 Jul 2019 17:59:04 -0700 (PDT)
Received: from htb-2n-eng-dhcp405.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id j128sm14025166pfg.28.2019.07.18.17.59.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Jul 2019 17:59:03 -0700 (PDT)
From: Nadav Amit <namit@vmware.com>
To: Andy Lutomirski <luto@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>
Date: Thu, 18 Jul 2019 17:58:32 -0700
Message-Id: <20190719005837.4150-5-namit@vmware.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719005837.4150-1-namit@vmware.com>
References: <20190719005837.4150-1-namit@vmware.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/9] x86/mm/tlb: Flush remote and local TLBs
 concurrently
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
Cc: Sasha Levin <sashal@kernel.org>, Juergen Gross <jgross@suse.com>,
 linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Nadav Amit <namit@vmware.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VG8gaW1wcm92ZSBUTEIgc2hvb3Rkb3duIHBlcmZvcm1hbmNlLCBmbHVzaCB0aGUgcmVtb3RlIGFu
ZCBsb2NhbCBUTEJzCmNvbmN1cnJlbnRseS4gSW50cm9kdWNlIGZsdXNoX3RsYl9tdWx0aSgpIHRo
YXQgZG9lcyBzby4gSW50cm9kdWNlCnBhcmF2aXJ0dWFsIHZlcnNpb25zIG9mIGZsdXNoX3RsYl9t
dWx0aSgpIGZvciBLVk0sIFhlbiBhbmQgaHlwZXItdiAoWGVuCmFuZCBoeXBlci12IGFyZSBvbmx5
IGNvbXBpbGUtdGVzdGVkKS4KCldoaWxlIHRoZSB1cGRhdGVkIHNtcCBpbmZyYXN0cnVjdHVyZSBp
cyBjYXBhYmxlIG9mIHJ1bm5pbmcgYSBmdW5jdGlvbiBvbgphIHNpbmdsZSBsb2NhbCBjb3JlLCBp
dCBpcyBub3Qgb3B0aW1pemVkIGZvciB0aGlzIGNhc2UuIFRoZSBtdWx0aXBsZQpmdW5jdGlvbiBj
YWxscyBhbmQgdGhlIGluZGlyZWN0IGJyYW5jaCBpbnRyb2R1Y2Ugc29tZSBvdmVyaGVhZCwgYW5k
Cm1pZ2h0IG1ha2UgbG9jYWwgVExCIGZsdXNoZXMgc2xvd2VyIHRoYW4gdGhleSB3ZXJlIGJlZm9y
ZSB0aGUgcmVjZW50CmNoYW5nZXMuCgpCZWZvcmUgY2FsbGluZyB0aGUgU01QIGluZnJhc3RydWN0
dXJlLCBjaGVjayBpZiBvbmx5IGEgbG9jYWwgVExCIGZsdXNoCmlzIG5lZWRlZCB0byByZXN0b3Jl
IHRoZSBsb3N0IHBlcmZvcm1hbmNlIGluIHRoaXMgY29tbW9uIGNhc2UuIFRoaXMKcmVxdWlyZXMg
dG8gY2hlY2sgbW1fY3B1bWFzaygpIG9uZSBtb3JlIHRpbWUsIGJ1dCB1bmxlc3MgdGhpcyBtYXNr
IGlzCnVwZGF0ZWQgdmVyeSBmcmVxdWVudGx5LCB0aGlzIHNob3VsZCBpbXBhY3QgcGVyZm9ybWFu
Y2UgbmVnYXRpdmVseS4KCkNjOiAiSy4gWS4gU3Jpbml2YXNhbiIgPGt5c0BtaWNyb3NvZnQuY29t
PgpDYzogSGFpeWFuZyBaaGFuZyA8aGFpeWFuZ3pAbWljcm9zb2Z0LmNvbT4KQ2M6IFN0ZXBoZW4g
SGVtbWluZ2VyIDxzdGhlbW1pbkBtaWNyb3NvZnQuY29tPgpDYzogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNj
OiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBA
YWxpZW44LmRlPgpDYzogeDg2QGtlcm5lbC5vcmcKQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBEYXZl
IEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgpDYzogQW5keSBMdXRvbWlyc2tp
IDxsdXRvQGtlcm5lbC5vcmc+CkNjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5v
cmc+CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzog
bGludXgtaHlwZXJ2QHZnZXIua2VybmVsLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZwpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKQ2M6IGt2
bUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBOYWRhdiBBbWl0IDxuYW1pdEB2bXdhcmUuY29tPgotLS0KIGFyY2gveDg2L2h5
cGVydi9tbXUuYyAgICAgICAgICAgICAgICAgfCAxMCArKystLS0KIGFyY2gveDg2L2luY2x1ZGUv
YXNtL3BhcmF2aXJ0LmggICAgICAgfCAgNiArKy0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJh
dmlydF90eXBlcy5oIHwgIDQgKy0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5oICAg
ICAgIHwgIDggKystLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL3RyYWNlL2h5cGVydi5oICAgfCAg
MiArLQogYXJjaC94ODYva2VybmVsL2t2bS5jICAgICAgICAgICAgICAgICB8IDExICsrKysrLS0K
IGFyY2gveDg2L2tlcm5lbC9wYXJhdmlydC5jICAgICAgICAgICAgfCAgMiArLQogYXJjaC94ODYv
bW0vdGxiLmMgICAgICAgICAgICAgICAgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLQogYXJjaC94ODYveGVuL21tdV9wdi5jICAgICAgICAgICAgICAgICB8IDExICsrKy0tLS0K
IGluY2x1ZGUvdHJhY2UvZXZlbnRzL3hlbi5oICAgICAgICAgICAgfCAgMiArLQogMTAgZmlsZXMg
Y2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYvaHlwZXJ2L21tdS5jIGIvYXJjaC94ODYvaHlwZXJ2L21tdS5jCmluZGV4IGU2NWQ3
ZmU2NDg5Zi4uODc0MGQ4YjIxZGIzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9oeXBlcnYvbW11LmMK
KysrIGIvYXJjaC94ODYvaHlwZXJ2L21tdS5jCkBAIC01MCw4ICs1MCw4IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGZpbGxfZ3ZhX2xpc3QodTY0IGd2YV9saXN0W10sIGludCBvZmZzZXQsCiAJcmV0dXJu
IGd2YV9uIC0gb2Zmc2V0OwogfQogCi1zdGF0aWMgdm9pZCBoeXBlcnZfZmx1c2hfdGxiX290aGVy
cyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKLQkJCQkgICAgY29uc3Qgc3RydWN0IGZsdXNo
X3RsYl9pbmZvICppbmZvKQorc3RhdGljIHZvaWQgaHlwZXJ2X2ZsdXNoX3RsYl9tdWx0aShjb25z
dCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKKwkJCQkgICBjb25zdCBzdHJ1Y3QgZmx1c2hfdGxiX2lu
Zm8gKmluZm8pCiB7CiAJaW50IGNwdSwgdmNwdSwgZ3ZhX24sIG1heF9ndmFzOwogCXN0cnVjdCBo
dl90bGJfZmx1c2ggKipmbHVzaF9wY3B1OwpAQCAtNTksNyArNTksNyBAQCBzdGF0aWMgdm9pZCBo
eXBlcnZfZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywKIAl1NjQg
c3RhdHVzID0gVTY0X01BWDsKIAl1bnNpZ25lZCBsb25nIGZsYWdzOwogCi0JdHJhY2VfaHlwZXJ2
X21tdV9mbHVzaF90bGJfb3RoZXJzKGNwdXMsIGluZm8pOworCXRyYWNlX2h5cGVydl9tbXVfZmx1
c2hfdGxiX211bHRpKGNwdXMsIGluZm8pOwogCiAJaWYgKCFodl9oeXBlcmNhbGxfcGcpCiAJCWdv
dG8gZG9fbmF0aXZlOwpAQCAtMTU2LDcgKzE1Niw3IEBAIHN0YXRpYyB2b2lkIGh5cGVydl9mbHVz
aF90bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLAogCWlmICghKHN0YXR1cyAm
IEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSykpCiAJCXJldHVybjsKIGRvX25hdGl2ZToKLQluYXRp
dmVfZmx1c2hfdGxiX290aGVycyhjcHVzLCBpbmZvKTsKKwluYXRpdmVfZmx1c2hfdGxiX211bHRp
KGNwdXMsIGluZm8pOwogfQogCiBzdGF0aWMgdTY0IGh5cGVydl9mbHVzaF90bGJfb3RoZXJzX2V4
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVzLApAQCAtMjMxLDYgKzIzMSw2IEBAIHZvaWQgaHlw
ZXJ2X3NldHVwX21tdV9vcHModm9pZCkKIAkJcmV0dXJuOwogCiAJcHJfaW5mbygiVXNpbmcgaHlw
ZXJjYWxsIGZvciByZW1vdGUgVExCIGZsdXNoXG4iKTsKLQlwdl9vcHMubW11LmZsdXNoX3RsYl9v
dGhlcnMgPSBoeXBlcnZfZmx1c2hfdGxiX290aGVyczsKKwlwdl9vcHMubW11LmZsdXNoX3RsYl9t
dWx0aSA9IGh5cGVydl9mbHVzaF90bGJfbXVsdGk7CiAJcHZfb3BzLm1tdS50bGJfcmVtb3ZlX3Rh
YmxlID0gdGxiX3JlbW92ZV90YWJsZTsKIH0KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3BhcmF2aXJ0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydC5oCmluZGV4IGRj
ZTI2ZjFkMTNlMS4uOGM2YzIzOTQzOTNiIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9wYXJhdmlydC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0LmgKQEAgLTYy
LDEwICs2MiwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19mbHVzaF90bGJfb25lX3VzZXIodW5z
aWduZWQgbG9uZyBhZGRyKQogCVBWT1BfVkNBTEwxKG1tdS5mbHVzaF90bGJfb25lX3VzZXIsIGFk
ZHIpOwogfQogCi1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1
Y3QgY3B1bWFzayAqY3B1bWFzaywKLQkJCQkgICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZv
ICppbmZvKQorc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX3RsYl9tdWx0aShjb25zdCBzdHJ1Y3Qg
Y3B1bWFzayAqY3B1bWFzaywKKwkJCQkgICBjb25zdCBzdHJ1Y3QgZmx1c2hfdGxiX2luZm8gKmlu
Zm8pCiB7Ci0JUFZPUF9WQ0FMTDIobW11LmZsdXNoX3RsYl9vdGhlcnMsIGNwdW1hc2ssIGluZm8p
OworCVBWT1BfVkNBTEwyKG1tdS5mbHVzaF90bGJfbXVsdGksIGNwdW1hc2ssIGluZm8pOwogfQog
CiBzdGF0aWMgaW5saW5lIHZvaWQgcGFyYXZpcnRfdGxiX3JlbW92ZV90YWJsZShzdHJ1Y3QgbW11
X2dhdGhlciAqdGxiLCB2b2lkICp0YWJsZSkKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3BhcmF2aXJ0X3R5cGVzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBl
cy5oCmluZGV4IDYzOWIyZGY0NDVlZS4uYzgyOTY5ZjM4ODQ1IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9wYXJhdmlydF90eXBlcy5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L3BhcmF2aXJ0X3R5cGVzLmgKQEAgLTIxMSw4ICsyMTEsOCBAQCBzdHJ1Y3QgcHZfbW11X29wcyB7
CiAJdm9pZCAoKmZsdXNoX3RsYl91c2VyKSh2b2lkKTsKIAl2b2lkICgqZmx1c2hfdGxiX2tlcm5l
bCkodm9pZCk7CiAJdm9pZCAoKmZsdXNoX3RsYl9vbmVfdXNlcikodW5zaWduZWQgbG9uZyBhZGRy
KTsKLQl2b2lkICgqZmx1c2hfdGxiX290aGVycykoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMs
Ci0JCQkJIGNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbyk7CisJdm9pZCAoKmZsdXNo
X3RsYl9tdWx0aSkoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdXMsCisJCQkJY29uc3Qgc3RydWN0
IGZsdXNoX3RsYl9pbmZvICppbmZvKTsKIAogCXZvaWQgKCp0bGJfcmVtb3ZlX3RhYmxlKShzdHJ1
Y3QgbW11X2dhdGhlciAqdGxiLCB2b2lkICp0YWJsZSk7CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2luY2x1ZGUvYXNtL3RsYmZsdXNoLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90bGJmbHVzaC5o
CmluZGV4IGRlZTM3NTgzMTk2Mi4uNjEwZTQ3ZGM2NmVmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9p
bmNsdWRlL2FzbS90bGJmbHVzaC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3RsYmZsdXNo
LmgKQEAgLTUxNyw3ICs1MTcsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19mbHVzaF90bGJfb25l
X2tlcm5lbCh1bnNpZ25lZCBsb25nIGFkZHIpCiAgKiAgLSBmbHVzaF90bGJfcGFnZSh2bWEsIHZt
YWRkcikgZmx1c2hlcyBvbmUgcGFnZQogICogIC0gZmx1c2hfdGxiX3JhbmdlKHZtYSwgc3RhcnQs
IGVuZCkgZmx1c2hlcyBhIHJhbmdlIG9mIHBhZ2VzCiAgKiAgLSBmbHVzaF90bGJfa2VybmVsX3Jh
bmdlKHN0YXJ0LCBlbmQpIGZsdXNoZXMgYSByYW5nZSBvZiBrZXJuZWwgcGFnZXMKLSAqICAtIGZs
dXNoX3RsYl9vdGhlcnMoY3B1bWFzaywgaW5mbykgZmx1c2hlcyBUTEJzIG9uIG90aGVyIGNwdXMK
KyAqICAtIGZsdXNoX3RsYl9tdWx0aShjcHVtYXNrLCBpbmZvKSBmbHVzaGVzIFRMQnMgb24gbXVs
dGlwbGUgY3B1cwogICoKICAqIC4uYnV0IHRoZSBpMzg2IGhhcyBzb21ld2hhdCBsaW1pdGVkIHRs
YiBmbHVzaGluZyBjYXBhYmlsaXRpZXMsCiAgKiBhbmQgcGFnZS1ncmFudWxhciBmbHVzaGVzIGFy
ZSBhdmFpbGFibGUgb25seSBvbiBpNDg2IGFuZCB1cC4KQEAgLTU2OSw3ICs1NjksNyBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgZmx1c2hfdGxiX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
IHVuc2lnbmVkIGxvbmcgYSkKIAlmbHVzaF90bGJfbW1fcmFuZ2Uodm1hLT52bV9tbSwgYSwgYSAr
IFBBR0VfU0laRSwgUEFHRV9TSElGVCwgZmFsc2UpOwogfQogCi12b2lkIG5hdGl2ZV9mbHVzaF90
bGJfb3RoZXJzKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAordm9pZCBuYXRpdmVfZmx1
c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAogCQkJICAgICBjb25z
dCBzdHJ1Y3QgZmx1c2hfdGxiX2luZm8gKmluZm8pOwogCiBzdGF0aWMgaW5saW5lIHU2NCBpbmNf
bW1fdGxiX2dlbihzdHJ1Y3QgbW1fc3RydWN0ICptbSkKQEAgLTU5Myw4ICs1OTMsOCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgYXJjaF90bGJiYXRjaF9hZGRfbW0oc3RydWN0IGFyY2hfdGxiZmx1c2hf
dW5tYXBfYmF0Y2ggKmJhdGNoLAogZXh0ZXJuIHZvaWQgYXJjaF90bGJiYXRjaF9mbHVzaChzdHJ1
Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCAqYmF0Y2gpOwogCiAjaWZuZGVmIENPTkZJR19Q
QVJBVklSVAotI2RlZmluZSBmbHVzaF90bGJfb3RoZXJzKG1hc2ssIGluZm8pCVwKLQluYXRpdmVf
Zmx1c2hfdGxiX290aGVycyhtYXNrLCBpbmZvKQorI2RlZmluZSBmbHVzaF90bGJfbXVsdGkobWFz
aywgaW5mbykJXAorCW5hdGl2ZV9mbHVzaF90bGJfbXVsdGkobWFzaywgaW5mbykKIAogI2RlZmlu
ZSBwYXJhdmlydF90bGJfcmVtb3ZlX3RhYmxlKHRsYiwgcGFnZSkgXAogCXRsYl9yZW1vdmVfcGFn
ZSh0bGIsICh2b2lkICopKHBhZ2UpKQpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
dHJhY2UvaHlwZXJ2LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS90cmFjZS9oeXBlcnYuaAppbmRl
eCBhY2U0NjRmMDk2ODEuLjg1Y2E4NTYwYzdmOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20vdHJhY2UvaHlwZXJ2LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vdHJhY2UvaHlw
ZXJ2LmgKQEAgLTgsNyArOCw3IEBACiAKICNpZiBJU19FTkFCTEVEKENPTkZJR19IWVBFUlYpCiAK
LVRSQUNFX0VWRU5UKGh5cGVydl9tbXVfZmx1c2hfdGxiX290aGVycywKK1RSQUNFX0VWRU5UKGh5
cGVydl9tbXVfZmx1c2hfdGxiX211bHRpLAogCSAgICBUUF9QUk9UTyhjb25zdCBzdHJ1Y3QgY3B1
bWFzayAqY3B1cywKIAkJICAgICBjb25zdCBzdHJ1Y3QgZmx1c2hfdGxiX2luZm8gKmluZm8pLAog
CSAgICBUUF9BUkdTKGNwdXMsIGluZm8pLApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2t2
bS5jIGIvYXJjaC94ODYva2VybmVsL2t2bS5jCmluZGV4IGI3ZjM0ZmUyMTcxZS4uZGU0MDY1N2Q5
MDI1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwva3ZtLmMKKysrIGIvYXJjaC94ODYva2Vy
bmVsL2t2bS5jCkBAIC01OTUsNyArNTk1LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGt2bV9hcGZf
dHJhcF9pbml0KHZvaWQpCiAKIHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBf
X3B2X3RsYl9tYXNrKTsKIAotc3RhdGljIHZvaWQga3ZtX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qg
c3RydWN0IGNwdW1hc2sgKmNwdW1hc2ssCitzdGF0aWMgdm9pZCBrdm1fZmx1c2hfdGxiX211bHRp
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAogCQkJY29uc3Qgc3RydWN0IGZsdXNoX3Rs
Yl9pbmZvICppbmZvKQogewogCXU4IHN0YXRlOwpAQCAtNjA5LDYgKzYwOSwxMSBAQCBzdGF0aWMg
dm9pZCBrdm1fZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1bWFzaywK
IAkgKiBxdWV1ZSBmbHVzaF9vbl9lbnRlciBmb3IgcHJlLWVtcHRlZCB2Q1BVcwogCSAqLwogCWZv
cl9lYWNoX2NwdShjcHUsIGZsdXNobWFzaykgeworCQkvKgorCQkgKiBUaGUgbG9jYWwgdkNQVSBp
cyBuZXZlciBwcmVlbXB0ZWQsIHNvIHdlIGRvIG5vdCBleHBsaWNpdGx5CisJCSAqIHNraXAgY2hl
Y2sgZm9yIGxvY2FsIHZDUFUgLSBpdCB3aWxsIG5ldmVyIGJlIGNsZWFyZWQgZnJvbQorCQkgKiBm
bHVzaG1hc2suCisJCSAqLwogCQlzcmMgPSAmcGVyX2NwdShzdGVhbF90aW1lLCBjcHUpOwogCQlz
dGF0ZSA9IFJFQURfT05DRShzcmMtPnByZWVtcHRlZCk7CiAJCWlmICgoc3RhdGUgJiBLVk1fVkNQ
VV9QUkVFTVBURUQpKSB7CkBAIC02MTgsNyArNjIzLDcgQEAgc3RhdGljIHZvaWQga3ZtX2ZsdXNo
X3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdW1hc2ssCiAJCX0KIAl9CiAKLQlu
YXRpdmVfZmx1c2hfdGxiX290aGVycyhmbHVzaG1hc2ssIGluZm8pOworCW5hdGl2ZV9mbHVzaF90
bGJfbXVsdGkoZmx1c2htYXNrLCBpbmZvKTsKIH0KIAogc3RhdGljIHZvaWQgX19pbml0IGt2bV9n
dWVzdF9pbml0KHZvaWQpCkBAIC02NDMsNyArNjQ4LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGt2
bV9ndWVzdF9pbml0KHZvaWQpCiAJaWYgKGt2bV9wYXJhX2hhc19mZWF0dXJlKEtWTV9GRUFUVVJF
X1BWX1RMQl9GTFVTSCkgJiYKIAkgICAgIWt2bV9wYXJhX2hhc19oaW50KEtWTV9ISU5UU19SRUFM
VElNRSkgJiYKIAkgICAga3ZtX3BhcmFfaGFzX2ZlYXR1cmUoS1ZNX0ZFQVRVUkVfU1RFQUxfVElN
RSkpIHsKLQkJcHZfb3BzLm1tdS5mbHVzaF90bGJfb3RoZXJzID0ga3ZtX2ZsdXNoX3RsYl9vdGhl
cnM7CisJCXB2X29wcy5tbXUuZmx1c2hfdGxiX211bHRpID0ga3ZtX2ZsdXNoX3RsYl9tdWx0aTsK
IAkJcHZfb3BzLm1tdS50bGJfcmVtb3ZlX3RhYmxlID0gdGxiX3JlbW92ZV90YWJsZTsKIAl9CiAK
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC9wYXJhdmlydC5jIGIvYXJjaC94ODYva2VybmVs
L3BhcmF2aXJ0LmMKaW5kZXggMGFhNjI1NmVlZGQ4Li42YWY0MDg0NGE3MzAgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2tlcm5lbC9wYXJhdmlydC5jCisrKyBiL2FyY2gveDg2L2tlcm5lbC9wYXJhdmly
dC5jCkBAIC0zNjMsNyArMzYzLDcgQEAgc3RydWN0IHBhcmF2aXJ0X3BhdGNoX3RlbXBsYXRlIHB2
X29wcyA9IHsKIAkubW11LmZsdXNoX3RsYl91c2VyCT0gbmF0aXZlX2ZsdXNoX3RsYiwKIAkubW11
LmZsdXNoX3RsYl9rZXJuZWwJPSBuYXRpdmVfZmx1c2hfdGxiX2dsb2JhbCwKIAkubW11LmZsdXNo
X3RsYl9vbmVfdXNlcgk9IG5hdGl2ZV9mbHVzaF90bGJfb25lX3VzZXIsCi0JLm1tdS5mbHVzaF90
bGJfb3RoZXJzCT0gbmF0aXZlX2ZsdXNoX3RsYl9vdGhlcnMsCisJLm1tdS5mbHVzaF90bGJfbXVs
dGkJPSBuYXRpdmVfZmx1c2hfdGxiX211bHRpLAogCS5tbXUudGxiX3JlbW92ZV90YWJsZQk9CiAJ
CQkodm9pZCAoKikoc3RydWN0IG1tdV9nYXRoZXIgKiwgdm9pZCAqKSl0bGJfcmVtb3ZlX3BhZ2Us
CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L21tL3RsYi5jIGIvYXJjaC94ODYvbW0vdGxiLmMKaW5k
ZXggYWJiZjU1ZmE4YjgxLi42M2MwMDkwOGJkZDkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L21tL3Rs
Yi5jCisrKyBiL2FyY2gveDg2L21tL3RsYi5jCkBAIC01NTEsNyArNTUxLDcgQEAgc3RhdGljIHZv
aWQgZmx1c2hfdGxiX2Z1bmNfY29tbW9uKGNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqZiwK
IAkJICogZ2FyYmFnZSBpbnRvIG91ciBUTEIuICBTaW5jZSBzd2l0Y2hpbmcgdG8gaW5pdF9tbSBp
cyBiYXJlbHkKIAkJICogc2xvd2VyIHRoYW4gYSBtaW5pbWFsIGZsdXNoLCBqdXN0IHN3aXRjaCB0
byBpbml0X21tLgogCQkgKgotCQkgKiBUaGlzIHNob3VsZCBiZSByYXJlLCB3aXRoIG5hdGl2ZV9m
bHVzaF90bGJfb3RoZXJzIHNraXBwaW5nCisJCSAqIFRoaXMgc2hvdWxkIGJlIHJhcmUsIHdpdGgg
bmF0aXZlX2ZsdXNoX3RsYl9tdWx0aSgpIHNraXBwaW5nCiAJCSAqIElQSXMgdG8gbGF6eSBUTEIg
bW9kZSBDUFVzLgogCQkgKi8KIAkJc3dpdGNoX21tX2lycXNfb2ZmKE5VTEwsICZpbml0X21tLCBO
VUxMKTsKQEAgLTY2NSw5ICs2NjUsMTQgQEAgc3RhdGljIGJvb2wgdGxiX2lzX25vdF9sYXp5KGlu
dCBjcHUpCiAKIHN0YXRpYyBERUZJTkVfUEVSX0NQVShjcHVtYXNrX3QsIGZsdXNoX3RsYl9tYXNr
KTsKIAotdm9pZCBuYXRpdmVfZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAq
Y3B1bWFzaywKLQkJCSAgICAgY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQordm9p
ZCBuYXRpdmVfZmx1c2hfdGxiX211bHRpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAor
CQkJICAgIGNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAqaW5mbykKIHsKKwkvKgorCSAqIERv
IGFjY291bnRpbmcgYW5kIHRyYWNpbmcuIE5vdGUgdGhhdCB0aGVyZSBhcmUgKGFuZCBoYXZlIGFs
d2F5cyBiZWVuKQorCSAqIGNhc2VzIGluIHdoaWNoIGEgcmVtb3RlIFRMQiBmbHVzaCB3aWxsIGJl
IHRyYWNlZCwgYnV0IGV2ZW50dWFsbHkKKwkgKiB3b3VsZCBub3QgaGFwcGVuLgorCSAqLwogCWNv
dW50X3ZtX3RsYl9ldmVudChOUl9UTEJfUkVNT1RFX0ZMVVNIKTsKIAlpZiAoaW5mby0+ZW5kID09
IFRMQl9GTFVTSF9BTEwpCiAJCXRyYWNlX3RsYl9mbHVzaChUTEJfUkVNT1RFX1NFTkRfSVBJLCBU
TEJfRkxVU0hfQUxMKTsKQEAgLTY4NywxMCArNjkyLDEyIEBAIHZvaWQgbmF0aXZlX2ZsdXNoX3Rs
Yl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdW1hc2ssCiAJCSAqIG1lYW5zIHRoYXQg
dGhlIHBlcmNwdSB0bGJfZ2VuIHZhcmlhYmxlcyB3b24ndCBiZSB1cGRhdGVkCiAJCSAqIGFuZCB3
ZSdsbCBkbyBwb2ludGxlc3MgZmx1c2hlcyBvbiBmdXR1cmUgY29udGV4dCBzd2l0Y2hlcy4KIAkJ
ICoKLQkJICogUmF0aGVyIHRoYW4gaG9va2luZyBuYXRpdmVfZmx1c2hfdGxiX290aGVycygpIGhl
cmUsIEkgdGhpbmsKKwkJICogUmF0aGVyIHRoYW4gaG9va2luZyBuYXRpdmVfZmx1c2hfdGxiX211
bHRpKCkgaGVyZSwgSSB0aGluawogCQkgKiB0aGF0IFVWIHNob3VsZCBiZSB1cGRhdGVkIHNvIHRo
YXQgc21wX2NhbGxfZnVuY3Rpb25fbWFueSgpLAogCQkgKiBldGMsIGFyZSBvcHRpbWFsIG9uIFVW
LgogCQkgKi8KKwkJZmx1c2hfdGxiX2Z1bmNfbG9jYWwoKHZvaWQgKilpbmZvKTsKKwogCQljcHVt
YXNrID0gdXZfZmx1c2hfdGxiX290aGVycyhjcHVtYXNrLCBpbmZvKTsKIAkJaWYgKGNwdW1hc2sp
CiAJCQlzbXBfY2FsbF9mdW5jdGlvbl9tYW55KGNwdW1hc2ssIGZsdXNoX3RsYl9mdW5jX3JlbW90
ZSwKQEAgLTcwOSw4ICs3MTYsOSBAQCB2b2lkIG5hdGl2ZV9mbHVzaF90bGJfb3RoZXJzKGNvbnN0
IHN0cnVjdCBjcHVtYXNrICpjcHVtYXNrLAogCSAqIGRvaW5nIGEgc3BlY3VsYXRpdmUgbWVtb3J5
IGFjY2Vzcy4KIAkgKi8KIAlpZiAoaW5mby0+ZnJlZWRfdGFibGVzKSB7Ci0JCXNtcF9jYWxsX2Z1
bmN0aW9uX21hbnkoY3B1bWFzaywgZmx1c2hfdGxiX2Z1bmNfcmVtb3RlLAotCQkJICAgICAgICh2
b2lkICopaW5mbywgMSk7CisJCV9fc21wX2NhbGxfZnVuY3Rpb25fbWFueShjcHVtYXNrLCBmbHVz
aF90bGJfZnVuY19yZW1vdGUsCisJCQkJCSBmbHVzaF90bGJfZnVuY19sb2NhbCwKKwkJCQkJICh2
b2lkICopaW5mbywgMSk7CiAJfSBlbHNlIHsKIAkJLyoKIAkJICogQWx0aG91Z2ggd2UgY291bGQg
aGF2ZSB1c2VkIG9uX2VhY2hfY3B1X2NvbmRfbWFzaygpLApAQCAtNzM3LDcgKzc0NSw4IEBAIHZv
aWQgbmF0aXZlX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sgKmNwdW1hc2ss
CiAJCQlpZiAodGxiX2lzX25vdF9sYXp5KGNwdSkpCiAJCQkJX19jcHVtYXNrX3NldF9jcHUoY3B1
LCBjb25kX2NwdW1hc2spOwogCQl9Ci0JCXNtcF9jYWxsX2Z1bmN0aW9uX21hbnkoY29uZF9jcHVt
YXNrLCBmbHVzaF90bGJfZnVuY19yZW1vdGUsCisJCV9fc21wX2NhbGxfZnVuY3Rpb25fbWFueShj
b25kX2NwdW1hc2ssIGZsdXNoX3RsYl9mdW5jX3JlbW90ZSwKKwkJCQkJIGZsdXNoX3RsYl9mdW5j
X2xvY2FsLAogCQkJCQkgKHZvaWQgKilpbmZvLCAxKTsKIAl9CiB9CkBAIC04MTgsMTYgKzgyNywy
MCBAQCB2b2lkIGZsdXNoX3RsYl9tbV9yYW5nZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyBzdGFydCwKIAlpbmZvID0gZ2V0X2ZsdXNoX3RsYl9pbmZvKG1tLCBzdGFydCwgZW5k
LCBzdHJpZGVfc2hpZnQsIGZyZWVkX3RhYmxlcywKIAkJCQkgIG5ld190bGJfZ2VuKTsKIAotCWlm
IChtbSA9PSB0aGlzX2NwdV9yZWFkKGNwdV90bGJzdGF0ZS5sb2FkZWRfbW0pKSB7CisJLyoKKwkg
KiBmbHVzaF90bGJfbXVsdGkoKSBpcyBub3Qgb3B0aW1pemVkIGZvciB0aGUgY29tbW9uIGNhc2Ug
aW4gd2hpY2ggb25seQorCSAqIGEgbG9jYWwgVExCIGZsdXNoIGlzIG5lZWRlZC4gT3B0aW1pemUg
dGhpcyB1c2UtY2FzZSBieSBjYWxsaW5nCisJICogZmx1c2hfdGxiX2Z1bmNfbG9jYWwoKSBkaXJl
Y3RseSBpbiB0aGlzIGNhc2UuCisJICovCisJaWYgKGNwdW1hc2tfYW55X2J1dChtbV9jcHVtYXNr
KG1tKSwgY3B1KSA8IG5yX2NwdV9pZHMpIHsKKwkJZmx1c2hfdGxiX211bHRpKG1tX2NwdW1hc2so
bW0pLCBpbmZvKTsKKwl9IGVsc2UgaWYgKG1tID09IHRoaXNfY3B1X3JlYWQoY3B1X3RsYnN0YXRl
LmxvYWRlZF9tbSkpIHsKIAkJbG9ja2RlcF9hc3NlcnRfaXJxc19lbmFibGVkKCk7CiAJCWxvY2Fs
X2lycV9kaXNhYmxlKCk7CiAJCWZsdXNoX3RsYl9mdW5jX2xvY2FsKGluZm8pOwogCQlsb2NhbF9p
cnFfZW5hYmxlKCk7CiAJfQogCi0JaWYgKGNwdW1hc2tfYW55X2J1dChtbV9jcHVtYXNrKG1tKSwg
Y3B1KSA8IG5yX2NwdV9pZHMpCi0JCWZsdXNoX3RsYl9vdGhlcnMobW1fY3B1bWFzayhtbSksIGlu
Zm8pOwotCiAJcHV0X2ZsdXNoX3RsYl9pbmZvKCk7CiAJcHV0X2NwdSgpOwogfQpAQCAtODkwLDE2
ICs5MDMsMjAgQEAgdm9pZCBhcmNoX3RsYmJhdGNoX2ZsdXNoKHN0cnVjdCBhcmNoX3RsYmZsdXNo
X3VubWFwX2JhdGNoICpiYXRjaCkKIHsKIAlpbnQgY3B1ID0gZ2V0X2NwdSgpOwogCi0JaWYgKGNw
dW1hc2tfdGVzdF9jcHUoY3B1LCAmYmF0Y2gtPmNwdW1hc2spKSB7CisJLyoKKwkgKiBmbHVzaF90
bGJfbXVsdGkoKSBpcyBub3Qgb3B0aW1pemVkIGZvciB0aGUgY29tbW9uIGNhc2UgaW4gd2hpY2gg
b25seQorCSAqIGEgbG9jYWwgVExCIGZsdXNoIGlzIG5lZWRlZC4gT3B0aW1pemUgdGhpcyB1c2Ut
Y2FzZSBieSBjYWxsaW5nCisJICogZmx1c2hfdGxiX2Z1bmNfbG9jYWwoKSBkaXJlY3RseSBpbiB0
aGlzIGNhc2UuCisJICovCisJaWYgKGNwdW1hc2tfYW55X2J1dCgmYmF0Y2gtPmNwdW1hc2ssIGNw
dSkgPCBucl9jcHVfaWRzKSB7CisJCWZsdXNoX3RsYl9tdWx0aSgmYmF0Y2gtPmNwdW1hc2ssICZm
dWxsX2ZsdXNoX3RsYl9pbmZvKTsKKwl9IGVsc2UgaWYgKGNwdW1hc2tfdGVzdF9jcHUoY3B1LCAm
YmF0Y2gtPmNwdW1hc2spKSB7CiAJCWxvY2tkZXBfYXNzZXJ0X2lycXNfZW5hYmxlZCgpOwogCQls
b2NhbF9pcnFfZGlzYWJsZSgpOwogCQlmbHVzaF90bGJfZnVuY19sb2NhbCgodm9pZCAqKSZmdWxs
X2ZsdXNoX3RsYl9pbmZvKTsKIAkJbG9jYWxfaXJxX2VuYWJsZSgpOwogCX0KIAotCWlmIChjcHVt
YXNrX2FueV9idXQoJmJhdGNoLT5jcHVtYXNrLCBjcHUpIDwgbnJfY3B1X2lkcykKLQkJZmx1c2hf
dGxiX290aGVycygmYmF0Y2gtPmNwdW1hc2ssICZmdWxsX2ZsdXNoX3RsYl9pbmZvKTsKLQogCWNw
dW1hc2tfY2xlYXIoJmJhdGNoLT5jcHVtYXNrKTsKIAogCXB1dF9jcHUoKTsKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L3hlbi9tbXVfcHYuYyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwppbmRleCAyNmU4
YjMyNjk2NmQuLjQ4ZjdjN2ViNGRiYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYveGVuL21tdV9wdi5j
CisrKyBiL2FyY2gveDg2L3hlbi9tbXVfcHYuYwpAQCAtMTM0NSw4ICsxMzQ1LDggQEAgc3RhdGlj
IHZvaWQgeGVuX2ZsdXNoX3RsYl9vbmVfdXNlcih1bnNpZ25lZCBsb25nIGFkZHIpCiAJcHJlZW1w
dF9lbmFibGUoKTsKIH0KIAotc3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qg
c3RydWN0IGNwdW1hc2sgKmNwdXMsCi0JCQkJIGNvbnN0IHN0cnVjdCBmbHVzaF90bGJfaW5mbyAq
aW5mbykKK3N0YXRpYyB2b2lkIHhlbl9mbHVzaF90bGJfbXVsdGkoY29uc3Qgc3RydWN0IGNwdW1h
c2sgKmNwdXMsCisJCQkJY29uc3Qgc3RydWN0IGZsdXNoX3RsYl9pbmZvICppbmZvKQogewogCXN0
cnVjdCB7CiAJCXN0cnVjdCBtbXVleHRfb3Agb3A7CkBAIC0xMzU2LDcgKzEzNTYsNyBAQCBzdGF0
aWMgdm9pZCB4ZW5fZmx1c2hfdGxiX290aGVycyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywK
IAljb25zdCBzaXplX3QgbWNfZW50cnlfc2l6ZSA9IHNpemVvZihhcmdzLT5vcCkgKwogCQlzaXpl
b2YoYXJncy0+bWFza1swXSkgKiBCSVRTX1RPX0xPTkdTKG51bV9wb3NzaWJsZV9jcHVzKCkpOwog
Ci0JdHJhY2VfeGVuX21tdV9mbHVzaF90bGJfb3RoZXJzKGNwdXMsIGluZm8tPm1tLCBpbmZvLT5z
dGFydCwgaW5mby0+ZW5kKTsKKwl0cmFjZV94ZW5fbW11X2ZsdXNoX3RsYl9tdWx0aShjcHVzLCBp
bmZvLT5tbSwgaW5mby0+c3RhcnQsIGluZm8tPmVuZCk7CiAKIAlpZiAoY3B1bWFza19lbXB0eShj
cHVzKSkKIAkJcmV0dXJuOwkJLyogbm90aGluZyB0byBkbyAqLwpAQCAtMTM2NSw5ICsxMzY1LDgg
QEAgc3RhdGljIHZvaWQgeGVuX2ZsdXNoX3RsYl9vdGhlcnMoY29uc3Qgc3RydWN0IGNwdW1hc2sg
KmNwdXMsCiAJYXJncyA9IG1jcy5hcmdzOwogCWFyZ3MtPm9wLmFyZzIudmNwdW1hc2sgPSB0b19j
cHVtYXNrKGFyZ3MtPm1hc2spOwogCi0JLyogUmVtb3ZlIHVzLCBhbmQgYW55IG9mZmxpbmUgQ1BV
Uy4gKi8KKwkvKiBSZW1vdmUgYW55IG9mZmxpbmUgQ1BVcyAqLwogCWNwdW1hc2tfYW5kKHRvX2Nw
dW1hc2soYXJncy0+bWFzayksIGNwdXMsIGNwdV9vbmxpbmVfbWFzayk7Ci0JY3B1bWFza19jbGVh
cl9jcHUoc21wX3Byb2Nlc3Nvcl9pZCgpLCB0b19jcHVtYXNrKGFyZ3MtPm1hc2spKTsKIAogCWFy
Z3MtPm9wLmNtZCA9IE1NVUVYVF9UTEJfRkxVU0hfTVVMVEk7CiAJaWYgKGluZm8tPmVuZCAhPSBU
TEJfRkxVU0hfQUxMICYmCkBAIC0yMzk2LDcgKzIzOTUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IHB2X21tdV9vcHMgeGVuX21tdV9vcHMgX19pbml0Y29uc3QgPSB7CiAJLmZsdXNoX3RsYl91c2Vy
ID0geGVuX2ZsdXNoX3RsYiwKIAkuZmx1c2hfdGxiX2tlcm5lbCA9IHhlbl9mbHVzaF90bGIsCiAJ
LmZsdXNoX3RsYl9vbmVfdXNlciA9IHhlbl9mbHVzaF90bGJfb25lX3VzZXIsCi0JLmZsdXNoX3Rs
Yl9vdGhlcnMgPSB4ZW5fZmx1c2hfdGxiX290aGVycywKKwkuZmx1c2hfdGxiX211bHRpID0geGVu
X2ZsdXNoX3RsYl9tdWx0aSwKIAkudGxiX3JlbW92ZV90YWJsZSA9IHRsYl9yZW1vdmVfdGFibGUs
CiAKIAkucGdkX2FsbG9jID0geGVuX3BnZF9hbGxvYywKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJh
Y2UvZXZlbnRzL3hlbi5oIGIvaW5jbHVkZS90cmFjZS9ldmVudHMveGVuLmgKaW5kZXggOWEwZThh
ZjIxMzEwLi41NDYwMjJhY2YxNjAgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL3hl
bi5oCisrKyBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL3hlbi5oCkBAIC0zNjIsNyArMzYyLDcgQEAg
VFJBQ0VfRVZFTlQoeGVuX21tdV9mbHVzaF90bGJfb25lX3VzZXIsCiAJICAgIFRQX3ByaW50aygi
YWRkciAlbHgiLCBfX2VudHJ5LT5hZGRyKQogCSk7CiAKLVRSQUNFX0VWRU5UKHhlbl9tbXVfZmx1
c2hfdGxiX290aGVycywKK1RSQUNFX0VWRU5UKHhlbl9tbXVfZmx1c2hfdGxiX211bHRpLAogCSAg
ICBUUF9QUk9UTyhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1cywgc3RydWN0IG1tX3N0cnVjdCAq
bW0sCiAJCSAgICAgdW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCksCiAJICAg
IFRQX0FSR1MoY3B1cywgbW0sIGFkZHIsIGVuZCksCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
