Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D547DAF6
	for <lists+xen-devel@lfdr.de>; Thu,  1 Aug 2019 14:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht9pt-0002Ka-Ty; Thu, 01 Aug 2019 12:05:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H9Oh=V5=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1ht9ps-0002KT-N7
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 12:05:32 +0000
X-Inumbo-ID: a85e2090-b454-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a85e2090-b454-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 12:05:31 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c9so50003261lfh.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2019 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lsh6Uzyr0dItLdqmqOxb7/3w2WzbhbJL6Ehl7l0MBko=;
 b=SJCtxtf5kNzEDFLfBRoOEhcyf7foNfHw41J9NeLTbEFGHv0J2OyAzw+eiPPpM0EgLh
 cU8LwlwpNteYofgi9xj+XKc0+BY08FnHaVqaOEG9B1mwMXfsOzubA12LuhAjm2Pzgk/Q
 3Ot972HRyLrjLwhw5nZzBPTKpdAOlCLzjjTGmCCYt2/XSXMAE1CVyWsskQj0j/6y1IrQ
 9ne4+5F8fDgC/tyCAT99A+0tadCU+4bbPzoTyAh4rJwHmTlOL3uAPY+6CAbsj+rGgoxv
 up1OChNBOOj5UTlviF/Wo9du3zNgFof0ZBXB4ZsU+uZ0EkOfOHP16Vg6zfkRA1gnOP4C
 c08A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lsh6Uzyr0dItLdqmqOxb7/3w2WzbhbJL6Ehl7l0MBko=;
 b=Cc84Kiqj2DjozcGr4nrvYv2aPlsdYRiBteYvkdaxf5xPT14cSofp7zEZ/gbipwfdqF
 UMm9aZFI+wlNetIByTMj6Mr3kS4h9L69qK/XWgkmwDbw/ZHAO+Qc75rA/V4o3noQOSj1
 mouI7VV/Qib/Ci/hDSOAtoE2gFJ1QLM0NLehD2bg+OP/iWWifd/ixzcf+647TIECun02
 JxZanMoWLecMHl/XScDSHEK2gdjSXFW4vn2dE6rfefChydxDRO7dNpbqCrt6b4XH190K
 n+ZgRwOawt0ihSlchPj++LYi5bnwXCtOLaLq25N9hfkwei4oxRtQ1TPDL4eduoz9SnPb
 x9gg==
X-Gm-Message-State: APjAAAXnS6TxfS7eC5Q6PUB2gK0Elon0bjbQ69E2f2VFF4aL/eAgAuwZ
 FrPAX/uwDvkVLWPWCcjWV55e7UjW3sw=
X-Google-Smtp-Source: APXvYqz2qz4hA1OV7wGwx2A/wZlH6ZAiE4PbbJp2Q7X0SMugVa9lugR67VQ5bsVWaKAtrWErigBIgQ==
X-Received: by 2002:a19:8c57:: with SMTP id i23mr59581232lfj.192.1564661129949; 
 Thu, 01 Aug 2019 05:05:29 -0700 (PDT)
Received: from 3489.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id u18sm12147150lfe.65.2019.08.01.05.05.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 05:05:29 -0700 (PDT)
From: Viktor Mitin <viktor.mitin.19@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  1 Aug 2019 15:04:51 +0300
Message-Id: <20190801120452.6814-2-viktor.mitin.19@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
Subject: [Xen-devel] [PATCH v5 1/2] xen/arm: extend fdt_property_interrupts
 to support DomU
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>, Viktor Mitin <viktor.mitin.19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RXh0ZW5kIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzIHRvIGRlYWwgd2l0aCBvdGhlciBkb21haW4g
dGhhbiB0aGUgaHdkb20uCgpUaGUgcHJvdG90eXBlIG9mIGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRz
KCkgaGFzIGJlZW4gbW9kaWZpZWQKdG8gc3VwcG9ydCBib3RoIGh3ZG9tIGFuZCBkb21VIGluIG9u
ZSBmdW5jdGlvbi4KClRoZSBuZXcgcHJvdG90eXBlIG9mIG1ha2VfdGltZXJfbm9kZSBmdW5jdGlv
biBpcyByZXF1aXJlZApzaW5jZSBtYWtlX3RpbWVyX25vZGUgY2FsbHMgZmR0X3Byb3BlcnR5X2lu
dGVycnVwdHMgd2hpY2ggdXNlcyBraW5mbzoKCiBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbykKClRoaXMgaXMgYSBwcmVwYXJhdG9yeSBmb3IgdGhlIG5leHQg
cGF0Y2ggd2hpY2ggY29uc29saWRhdGVzCm1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90aW1lcl9k
b21VX25vZGUiLgpPcmlnaW5hbCBnb2FsIGlzIHRvIGNvbnNvbGlkYXRlIG1ha2VfdGltZXIgZnVu
Y3Rpb25zLgoKU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgpTaWduZWQtb2ZmLWJ5OiBWaWt0b3IgTWl0aW4gPHZpa3Rvcl9taXRpbkBlcGFtLmNvbT4KLS0t
CiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9i
dWlsZC5jCmluZGV4IDRjODQwNDE1NWEuLmJjN2QxN2RkMmMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYworKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAg
LTYyMSwxNyArNjIxLDIwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXRfaW50ZXJydXB0KGdpY19p
bnRlcnJ1cHRfdCBpbnRlcnJ1cHQsCiAgKiAgImludGVycnVwdHMiOiBjb250YWlucyB0aGUgbGlz
dCBvZiBpbnRlcnJ1cHRzCiAgKiAgImludGVycnVwdC1wYXJlbnQiOiBsaW5rIHRvIHRoZSBHSUMK
ICAqLwotc3RhdGljIGludCBfX2luaXQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHModm9pZCAqZmR0
LCBnaWNfaW50ZXJydXB0X3QgKmludHIsCitzdGF0aWMgaW50IF9faW5pdCBmZHRfcHJvcGVydHlf
aW50ZXJydXB0cyhjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2ljX2ludGVycnVwdF90ICppbnRyLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbnVtX2lycSkK
IHsKICAgICBpbnQgcmVzOworICAgIHVpbnQzMl90IHBoYW5kbGUgPSBpc19oYXJkd2FyZV9kb21h
aW4oa2luZm8tPmQpID8KKyAgICAgICAgICAgICAgICAgICAgICAgZHRfaW50ZXJydXB0X2NvbnRy
b2xsZXItPnBoYW5kbGUgOiBHVUVTVF9QSEFORExFX0dJQzsKCi0gICAgcmVzID0gZmR0X3Byb3Bl
cnR5KGZkdCwgImludGVycnVwdHMiLCBpbnRyLCBzaXplb2YgKGludHJbMF0pICogbnVtX2lycSk7
CisgICAgcmVzID0gZmR0X3Byb3BlcnR5KGtpbmZvLT5mZHQsICJpbnRlcnJ1cHRzIiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgaW50ciwgc2l6ZW9mIChpbnRyWzBdKSAqIG51bV9pcnEpOwogICAg
IGlmICggcmVzICkKICAgICAgICAgcmV0dXJuIHJlczsKCi0gICAgcmVzID0gZmR0X3Byb3BlcnR5
X2NlbGwoZmR0LCAiaW50ZXJydXB0LXBhcmVudCIsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZHRfaW50ZXJydXB0X2NvbnRyb2xsZXItPnBoYW5kbGUpOworICAgIHJlcyA9IGZkdF9wcm9w
ZXJ0eV9jZWxsKGtpbmZvLT5mZHQsICJpbnRlcnJ1cHQtcGFyZW50IiwgcGhhbmRsZSk7CgogICAg
IHJldHVybiByZXM7CiB9CkBAIC03MzMsNyArNzM2LDcgQEAgc3RhdGljIGludCBfX2luaXQgbWFr
ZV9oeXBlcnZpc29yX25vZGUoc3RydWN0IGRvbWFpbiAqZCwKICAgICAgKiAgVE9ETzogSGFuZGxl
IHByb3Blcmx5IHRoZSBjcHVtYXNrOwogICAgICAqLwogICAgIHNldF9pbnRlcnJ1cHQoaW50ciwg
ZC0+YXJjaC5ldnRjaG5faXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7Ci0gICAgcmVz
ID0gZmR0X3Byb3BlcnR5X2ludGVycnVwdHMoZmR0LCAmaW50ciwgMSk7CisgICAgcmVzID0gZmR0
X3Byb3BlcnR5X2ludGVycnVwdHMoa2luZm8sICZpbnRyLCAxKTsKICAgICBpZiAoIHJlcyApCiAg
ICAgICAgIHJldHVybiByZXM7CgpAQCAtOTYwLDggKzk2Myw5IEBAIHN0YXRpYyBpbnQgX19pbml0
IG1ha2VfZ2ljX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0LAogICAgIHJl
dHVybiByZXM7CiB9Cgotc3RhdGljIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0
cnVjdCBkb21haW4gKmQsIHZvaWQgKmZkdCkKK3N0YXRpYyBpbnQgX19pbml0IG1ha2VfdGltZXJf
bm9kZShjb25zdCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQogeworICAgIHZvaWQgKmZkdCA9
IGtpbmZvLT5mZHQ7CiAgICAgc3RhdGljIGNvbnN0IHN0cnVjdCBkdF9kZXZpY2VfbWF0Y2ggdGlt
ZXJfaWRzW10gX19pbml0Y29uc3QgPQogICAgIHsKICAgICAgICAgRFRfTUFUQ0hfQ09NUEFUSUJM
RSgiYXJtLGFybXY3LXRpbWVyIiksCkBAIC0xMDE2LDcgKzEwMjAsNyBAQCBzdGF0aWMgaW50IF9f
aW5pdCBtYWtlX3RpbWVyX25vZGUoY29uc3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQog
ICAgIGR0X2RwcmludGsoIiAgVmlydCBpbnRlcnJ1cHQgJXVcbiIsIGlycSk7CiAgICAgc2V0X2lu
dGVycnVwdChpbnRyc1syXSwgaXJxLCAweGYsIERUX0lSUV9UWVBFX0xFVkVMX0xPVyk7CgotICAg
IHJlcyA9IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGZkdCwgaW50cnMsIDMpOworICAgIHJlcyA9
IGZkdF9wcm9wZXJ0eV9pbnRlcnJ1cHRzKGtpbmZvLCBpbnRycywgMyk7CiAgICAgaWYgKCByZXMg
KQogICAgICAgICByZXR1cm4gcmVzOwoKQEAgLTEzNzcsNyArMTM4MSw3IEBAIHN0YXRpYyBpbnQg
X19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAq
a2luZm8sCiAgICAgaWYgKCBkZXZpY2VfZ2V0X2NsYXNzKG5vZGUpID09IERFVklDRV9HSUMgKQog
ICAgICAgICByZXR1cm4gbWFrZV9naWNfbm9kZShkLCBraW5mby0+ZmR0LCBub2RlKTsKICAgICBp
ZiAoIGR0X21hdGNoX25vZGUodGltZXJfbWF0Y2hlcywgbm9kZSkgKQotICAgICAgICByZXR1cm4g
bWFrZV90aW1lcl9ub2RlKGQsIGtpbmZvLT5mZHQpOworICAgICAgICByZXR1cm4gbWFrZV90aW1l
cl9ub2RlKGtpbmZvKTsKCiAgICAgLyogU2tpcCBub2RlcyB1c2VkIGJ5IFhlbiAqLwogICAgIGlm
ICggZHRfZGV2aWNlX3VzZWRfYnkobm9kZSkgPT0gRE9NSURfWEVOICkKLS0KMi4xNy4xCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
