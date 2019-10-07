Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBCACE716
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 17:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHUhj-0006oN-BU; Mon, 07 Oct 2019 15:13:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0SFq=YA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1iHUhh-0006o1-NB
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 15:13:41 +0000
X-Inumbo-ID: 004593ce-e915-11e9-8c93-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 004593ce-e915-11e9-8c93-bc764e2007e4;
 Mon, 07 Oct 2019 15:13:22 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id r5so19712303qtd.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2019 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJRUOKvva5SLQ3Yr7539G+VB4p4r5aLPOvKs+CyiVbA=;
 b=YxdGMLfDM9zzVkeza3Z/PJHpdIk+Ls3pmKxvgSkI0YCRhMEcAIIEyft7svew0LH6jq
 sAUaT9TxcfrHdhLYcH7gqMwzlvyg9ekCR7cyVapi3MtlEUo0EXfVWhsOcmUCqiwQRIg5
 10UWzY0FPaffJ2cO3utvRGMK519XY5sfgf0LbjNE/xGSI1faEWaRc7pSA/mdtq1xWe8I
 dOxYGPFBv1DhS7lblDGccbSNwev20PNUN2D4FVXylAa8qQGh/xGu3s5mASRkujDMNqvf
 sqRDL1zLRxyVhVYAtmFktCRpIkoLQV0JgWrVQjxi2ALhR/x2UZWTRrZQD32YISMoCw6q
 Mlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJRUOKvva5SLQ3Yr7539G+VB4p4r5aLPOvKs+CyiVbA=;
 b=AC4s8JyGdPypGMgpDcB7wgAjsGFSJKucqw1ZUP1ndtB+45TGUact5Zdn0Z7AOw5YqT
 4/uAXjiJ1UTF/9tGQ3rguldfIeIJ0BDhbyj9m2eQrfV3Xpq6UnzxhXOehYwSWYytbh83
 azuMSUoKiwVXcfFr9sqM+WaR6ij1a8fxhSocQu0Ce1FKdyY106K43wvvZs3S+y/ABRF0
 e2V4QFl5wB+Wm/CmCKwao4cAxfVbe5XqtM3grx/8lbEeoIg3B+RSUKMOICQmedlwVFEW
 KoZfg8nPAL7Rln4d/eXxOFNUP5wEKxP2GcOR3/zMKRrExE1nniy7gwyZ3AcLT2OLH0cn
 Ux9Q==
X-Gm-Message-State: APjAAAWDG7IK0xZy79QEOCLMw9VGgIqHEBVFtgCqLhf2TPzJBY305EpL
 nhQRuxV7JMfyQbzE5hkgjUSwduPo
X-Google-Smtp-Source: APXvYqzVk64vhu/ZdN8eKk0DeCll8ZmeZyAj6CigP0BLVi6+bqSdNrny7mL7x03P5QjLROfXVNee4Q==
X-Received: by 2002:a0c:88f0:: with SMTP id 45mr27359942qvo.78.1570461201345; 
 Mon, 07 Oct 2019 08:13:21 -0700 (PDT)
Received: from five.crux.rad.ainfosec.com (209-217-208-226.northland.net.
 [209.217.208.226])
 by smtp.googlemail.com with ESMTPSA id c185sm8354313qkg.74.2019.10.07.08.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 08:13:20 -0700 (PDT)
From: Nick Rosbrook <rosbrookn@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  7 Oct 2019 11:12:52 -0400
Message-Id: <1a60b855c0886c8e7147d48923f16b4d0815db81.1570456846.git.rosbrookn@ainfosec.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1570456846.git.rosbrookn@ainfosec.com>
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 05/24] golang/xenlight: define KeyValueList
 builtin type
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4KCkRlZmluZSBLZXlW
YWx1ZUxpc3QgYnVpbHRpbiB0eXBlLCBhbmFsYWdvdXMgdG8gbGlieGxfa2V5X3ZhbHVlX2xpc3Qg
YXMKbWFwW3N0cmluZ11zdHJpbmcsIGFuZCBpbXBsZW1lbnQgaXRzIGZyb21DIGFuZCB0b0MgZnVu
Y3Rpb25zLgoKU2lnbmVkLW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2Vj
LmNvbT4KLS0tCkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CkNj
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+CgogdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIHwgMzMgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9nb2xhbmcveGVubGlnaHQveGVu
bGlnaHQuZ28gYi90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KaW5kZXggNGQ0ZmFk
MmE5ZC4uODE5NmE0Mjg1NSAxMDA2NDQKLS0tIGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxp
Z2h0LmdvCisrKyBiL3Rvb2xzL2dvbGFuZy94ZW5saWdodC94ZW5saWdodC5nbwpAQCAtMjAyLDEx
ICsyMDIsNDIgQEAgZnVuYyAoY2h3Y2FwIEMubGlieGxfaHdjYXApIHRvR28oKSAoZ2h3Y2FwIEh3
Y2FwKSB7CiAJcmV0dXJuCiB9CiAKKy8vIEtleVZhbHVlTGlzdCByZXByZXNlbnRzIGEgbGlieGxf
a2V5X3ZhbHVlX2xpc3QuCit0eXBlIEtleVZhbHVlTGlzdCBtYXBbc3RyaW5nXXN0cmluZworCitm
dW5jIChrdmwgS2V5VmFsdWVMaXN0KSBmcm9tQyhja3ZsICpDLmxpYnhsX2tleV92YWx1ZV9saXN0
KSBlcnJvciB7CisJc2l6ZSA6PSBpbnQoQy5saWJ4bF9rZXlfdmFsdWVfbGlzdF9sZW5ndGgoY2t2
bCkpCisJbGlzdCA6PSAoKlsxIDw8IDMwXSpDLmNoYXIpKHVuc2FmZS5Qb2ludGVyKGNrdmwpKVs6
c2l6ZTpzaXplXQorCisJZm9yIGkgOj0gMDsgaSA8IHNpemUqMjsgaSArPSAyIHsKKwkJa3ZsW0Mu
R29TdHJpbmcobGlzdFtpXSldID0gQy5Hb1N0cmluZyhsaXN0W2krMV0pCisJfQorCisJcmV0dXJu
IG5pbAorfQorCitmdW5jIChrdmwgS2V5VmFsdWVMaXN0KSB0b0MoKSAoQy5saWJ4bF9rZXlfdmFs
dWVfbGlzdCwgZXJyb3IpIHsKKwkvLyBBZGQgZXh0cmEgc2xvdCBmb3Igc2VudGluZWwKKwl2YXIg
Y2hhciAqQy5jaGFyCisJY3NpemUgOj0gMipsZW4oa3ZsKSArIDEKKwlja3ZsIDo9IChDLmxpYnhs
X2tleV92YWx1ZV9saXN0KShDLm1hbGxvYyhDLnVsb25nKGNzaXplKSAqIEMudWxvbmcodW5zYWZl
LlNpemVvZihjaGFyKSkpKQorCWNsaXN0IDo9ICgqWzEgPDwgMzFdKkMuY2hhcikodW5zYWZlLlBv
aW50ZXIoY2t2bCkpWzpjc2l6ZTpjc2l6ZV0KKworCWkgOj0gMAorCWZvciBrLCB2IDo9IHJhbmdl
IGt2bCB7CisJCWNsaXN0W2ldID0gQy5DU3RyaW5nKGspCisJCWNsaXN0W2krMV0gPSBDLkNTdHJp
bmcodikKKwkJaSArPSAyCisJfQorCWNsaXN0W2xlbihjbGlzdCktMV0gPSBuaWwKKworCXJldHVy
biBja3ZsLCBuaWwKK30KKwogLy8gdHlwZWRlZiBzdHJ1Y3QgewogLy8gICAgIHVpbnQzMl90IHNp
emU7ICAgICAgICAgIC8qIG51bWJlciBvZiBieXRlcyBpbiBtYXAgKi8KIC8vICAgICB1aW50OF90
ICptYXA7CiAvLyB9IGxpYnhsX2JpdG1hcDsKLQogLy8gSW1wbGVtZW50IHRoZSBHbyBiaXRtYXAg
dHlwZSBzdWNoIHRoYXQgdGhlIHVuZGVybHlpbmcgZGF0YSBjYW4KIC8vIGVhc2lseSBiZSBjb3Bp
ZWQgaW4gYW5kIG91dC4gIE5CIHRoYXQgd2Ugc3RpbGwgaGF2ZSB0byBkbyBjb3BpZXMKIC8vIGJv
dGggZGlyZWN0aW9ucywgYmVjYXVzZSBjZ28gcnVudGltZSByZXN0cmljdGlvbnMgZm9yYmlkIHBh
c3NpbmcgdG8KLS0gCjIuMTkuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
