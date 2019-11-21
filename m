Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9F810595C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 19:17:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXqxL-0003hN-0F; Thu, 21 Nov 2019 18:13:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPri=ZN=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iXqxJ-0003hI-FJ
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 18:13:25 +0000
X-Inumbo-ID: 96eea124-0c8a-11ea-adbe-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96eea124-0c8a-11ea-adbe-bc764e2007e4;
 Thu, 21 Nov 2019 18:13:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g3so4265107ljl.11
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 10:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2nFxr7Xu/diPrmiZ2lQwCKQk5pMVYzc6UewNtSI1se0=;
 b=ugd7ysV1LVrqfy6km/l+1ydSr1CV2PO8jyDfQ7jITO2vC4urK0zMvu1wi+SFjZ7VG9
 /z1kLI+Z3nPLWX6VfkZlTMfrkSx8s8rb70lFhpos/RnbdWibnPtUUxNMDvD/fDmq5mJp
 2rm6cCvwn/FGT60NGUreikQt3S1q0Oa4MDTXDVA3niSMno6hHlLr4eaGwMOmRabAVKp/
 HT8Zp1xFrBwS37lAp5OXmJtoR74JpuiB6fSvXcIou0yTUfl0fVjX2gH0oBA7T+zbmLxV
 nm4VEEaL21f2rxv+3FdgwuMRDCNOYYWCBKyai7KP6piz37PTdqdFETHqM5FYOh8xYX+A
 +PeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2nFxr7Xu/diPrmiZ2lQwCKQk5pMVYzc6UewNtSI1se0=;
 b=g3bgkhxUses/v9ncXgNvRY1d7LzQfbFy2ljwKPUvAM1lItkCyuGZiEPvImTrUaCgnd
 yBT71s6bRJerAhG0NoePMbRd/pAbX+MAt6joqjrwby5bEk8zakEG3VgmzSUaFmwEvYDq
 kVQ4Pt7xY0xgtipOezfNOCpgBGCYp4D+CsRoLdgWmvvUDZyKCtnANgZGK7HRSCyw8zbe
 lei8wHu7FG/plHiYJPN3KR4vlGS+u06ZSrlK+p6zuyTXYgZzt/ZvHkOJlxtaCi6zN8nl
 KWNf8QxehQgf5YS3YiIkhz6WBcn1o8VV4JfAYcMIAK9HF4K8Yq7PTiS3t2IgIekInHDL
 adHQ==
X-Gm-Message-State: APjAAAVD+XktZyDb4i1EWRActHURrgwP8XMKHJTSSuI15xCFAi7z/O8c
 t51q4QVq8aqVqAn4sm34JLjPTDpU2JS/rQ==
X-Google-Smtp-Source: APXvYqwk86NoCAioN94QRGrbIfV6ymVgjwJIuWYsPgWk+z4uVM2CPvGJTbcOY2lMcIaRxugHdmn9Hw==
X-Received: by 2002:a2e:8e27:: with SMTP id r7mr9134266ljk.101.1574359995845; 
 Thu, 21 Nov 2019 10:13:15 -0800 (PST)
Received: from al1-pc.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v12sm1855473lfb.47.2019.11.21.10.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 10:13:15 -0800 (PST)
From: Oleksandr Grytsov <al1img@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 21 Nov 2019 20:12:59 +0200
Message-Id: <20191121181300.6497-3-al1img@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191121181300.6497-1-al1img@gmail.com>
References: <20191121181300.6497-1-al1img@gmail.com>
Subject: [Xen-devel] [PATCH v2 2/3] libxl: rename VKB backend type "linux"
 to "pv"
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
Cc: anthony.perard@citrix.com, Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 ian.jackson@eu.citrix.com, wl@xen.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIEdyeXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgoKVGhl
cmUgYXJlIHR3byBraW5kIG9mIFZLQiBiYWNrZW5kczogUUVNVSBhbmQgdXNlciBzcGFjZSBQViBi
YWNrZW5kLgpGb3IgUFYgYmFja2VuZCAibGludXgiIGVudW0gaXMgdXNlZCBidXQgdGhpcyBuYW1l
IGlzIGNvbmZ1c2VkLiBSZW5hbWUKImxpbnV4IiBlbnVtIHRvICJwdiIgYXMgaXQgYmV0dGVyIG1h
dGNoZXMgdXNlciBzcGFjZSBQViBiYWNrZW5kLgoKU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEdy
eXRzb3YgPG9sZWtzYW5kcl9ncnl0c292QGVwYW0uY29tPgotLS0KIGRvY3MvbWFuL3hsLmNmZy41
LnBvZC5pbiAgICB8IDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgMiArLQog
dG9vbHMvbGlieGwvbGlieGxfdmtiLmMgICAgIHwgNCArKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5j
ZmcuNS5wb2QuaW4gYi9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4KaW5kZXggMjQ1ZDNmOTQ3Mi4u
MzdiZGM1OTVkMyAxMDA2NDQKLS0tIGEvZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluCisrKyBiL2Rv
Y3MvbWFuL3hsLmNmZy41LnBvZC5pbgpAQCAtMTU2Miw4ICsxNTYyLDggQEAgU3BlY2lmaWVzIHRo
ZSBiYWNrZW5kIGRvbWFpbiBuYW1lIG9yIGlkLgogCiA9aXRlbSBCPGJhY2tlbmQtdHlwZT10eXBl
PgogCi1TcGVjaWZpZXMgdGhlIGJhY2tlbmQgdHlwZTogcWVtdSAtIGZvciBRRU1VIGJhY2tlbmQg
b3IgbGludXggLSBmb3IgTGludXggUFYKLWRvbWFpbi4KK1NwZWNpZmllcyB0aGUgYmFja2VuZCB0
eXBlOiBxZW11IC0gZm9yIFFFTVUgYmFja2VuZCBvciBwdiAtIGZvciBQVgorYmFja2VuZC4KIAog
PWl0ZW0gQjxmZWF0dXJlLWRpc2FibGUta2V5Ym9hcmQ9Qk9PTEVBTj4KIApkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRs
CmluZGV4IDA1NDZkNzg2NWEuLjc1MWRhZDg4NzAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3R5cGVzLmlkbAorKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKQEAgLTI2MCw3
ICsyNjAsNyBAQCBsaWJ4bF92dWFydF90eXBlID0gRW51bWVyYXRpb24oInZ1YXJ0X3R5cGUiLCBb
CiBsaWJ4bF92a2JfYmFja2VuZCA9IEVudW1lcmF0aW9uKCJ2a2JfYmFja2VuZCIsIFsKICAgICAo
MCwgIlVOS05PV04iKSwKICAgICAoMSwgIlFFTVUiKSwKLSAgICAoMiwgIkxJTlVYIikKKyAgICAo
MiwgIlBWIikKICAgICBdKQogCiBsaWJ4bF9wYXNzdGhyb3VnaCA9IEVudW1lcmF0aW9uKCJwYXNz
dGhyb3VnaCIsIFsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX3ZrYi5jIGIvdG9vbHMv
bGlieGwvbGlieGxfdmtiLmMKaW5kZXggNGM0NGE4MTNjMS4uNWYwMThmNTViNyAxMDA2NDQKLS0t
IGEvdG9vbHMvbGlieGwvbGlieGxfdmtiLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfdmtiLmMK
QEAgLTExMyw3ICsxMTMsNyBAQCBzdGF0aWMgaW50IGxpYnhsX192a2JfZnJvbV94ZW5zdG9yZShs
aWJ4bF9fZ2MgKmdjLCBjb25zdCBjaGFyICpsaWJ4bF9wYXRoLAogICAgIGlmIChyYykgZ290byBv
dXQ7CiAKICAgICB2a2ItPmJhY2tlbmRfdHlwZSA9IGRldi5iYWNrZW5kX2tpbmQgPT0gTElCWExf
X0RFVklDRV9LSU5EX1ZJTlBVVCA/Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIExJQlhMX1ZLQl9CQUNLRU5EX0xJTlVYIDogTElCWExfVktCX0JBQ0tFTkRfUUVN
VTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTElCWExfVktC
X0JBQ0tFTkRfUFYgOiBMSUJYTF9WS0JfQkFDS0VORF9RRU1VOwogCiAgICAgdmtiLT51bmlxdWVf
aWQgPSB4c19yZWFkKENUWC0+eHNoLCBYQlRfTlVMTCwgR0NTUFJJTlRGKCIlcy8iWEVOS0JEX0ZJ
RUxEX1VOSVFVRV9JRCwgYmVfcGF0aCksIE5VTEwpOwogCkBAIC0yMTksNyArMjE5LDcgQEAgc3Rh
dGljIGludCBsaWJ4bF9fZGV2aWNlX2Zyb21fdmtiKGxpYnhsX19nYyAqZ2MsIHVpbnQzMl90IGRv
bWlkLAogewogICAgIGRldmljZS0+YmFja2VuZF9kZXZpZCAgID0gdHlwZS0+ZGV2aWQ7CiAgICAg
ZGV2aWNlLT5iYWNrZW5kX2RvbWlkICAgPSB0eXBlLT5iYWNrZW5kX2RvbWlkOwotICAgIGRldmlj
ZS0+YmFja2VuZF9raW5kICAgID0gdHlwZS0+YmFja2VuZF90eXBlID09IExJQlhMX1ZLQl9CQUNL
RU5EX0xJTlVYID8KKyAgICBkZXZpY2UtPmJhY2tlbmRfa2luZCAgICA9IHR5cGUtPmJhY2tlbmRf
dHlwZSA9PSBMSUJYTF9WS0JfQkFDS0VORF9QViA/CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBMSUJYTF9fREVWSUNFX0tJTkRfVklOUFVUIDogTElCWExfX0RFVklDRV9LSU5EX1ZLQkQ7
CiAgICAgZGV2aWNlLT5kZXZpZCAgICAgICAgICAgPSB0eXBlLT5kZXZpZDsKICAgICBkZXZpY2Ut
PmRvbWlkICAgICAgICAgICA9IGRvbWlkOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
