Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8670716140F
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 14:58:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3gs6-0006KR-7u; Mon, 17 Feb 2020 13:55:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7Mk=4F=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1j3gs4-0006Jv-VI
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 13:55:36 +0000
X-Inumbo-ID: 24d98958-518d-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24d98958-518d-11ea-ade5-bc764e2007e4;
 Mon, 17 Feb 2020 13:55:24 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g3so19813193wrs.12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2020 05:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/n18PxJCMQcDNziI7TYERKCu5xatQmIITtNR1Ioqht4=;
 b=LWGaO59sIJAREqIYKvNJfeuYFcBQQ4NmYWxk2sYvCARuXJwXHjGRQTYF+yW9cIe8zC
 eT498WIHwMtqIh8Kc/PxF+KplHddnsIsWYxK5tHQPfNkc411AL3N5uGqxRdFtVTaXMaW
 xA8nMpnY5wEltqAFKVFYX8p5KHhFprZkXq2N5M+3tTo2LWA7noRozYX2wJq+fdyn8MfQ
 MeN4XbZGjYwu1Fmi6ok1g1DKTvkugPD5xNvKuqRmj4Fi59X0XY9q/LGOS8UZl7vzli5B
 WdXRFzWpoqUF6yPty+2vb9iT2CAINwKq0qokqZz36A08SUDCCzFyEW6Cgct3++vuVrbU
 zj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/n18PxJCMQcDNziI7TYERKCu5xatQmIITtNR1Ioqht4=;
 b=hgUHMo76hes6U8UyRAPUezAQp2pyM8IIyGSfLVx5bl/9g1gTKf/4TegkEzNKe1Sz/H
 1sR13zUZm2pfva91Tah/cSKXKK3JfBnYNsawE1lig3M6psuhE/bcOjUJ9uoGqxe8aV6c
 1QpErqkRrWsqEp4G0Sx3XzYhOFYL23PlOwtqxOch/Ya6A1j9TxZaLl1wOizHdJRen9CS
 C/2xYBGNbKt9M1TEca1p/bSFGzKhcJCiSiUZXbxEh3Z5E3RiqSUmZvqApeIsjpQsH4oh
 yv93VUVnB1TNlvQ9lK535nzWgcRI1e/eqBVG6irmLt6BYH4+gYQfbEpPhY6kuSO7C3oL
 +0+g==
X-Gm-Message-State: APjAAAVpXP9BQHztqtq3PxOqsk5PQgxqh48BbfyoLWtS3j/sNqyD4rZ7
 pE09hNzxIo7y310Tg0Dw6Kn7s495
X-Google-Smtp-Source: APXvYqwoGaEtpzAaSbBYELOL4SpTzxl0+XGOReyr3m+XAIN6uzJC/Pq6iodaU/TcKod/y+PfyN2B2A==
X-Received: by 2002:adf:f606:: with SMTP id t6mr22339738wrp.304.1581947723152; 
 Mon, 17 Feb 2020 05:55:23 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 m3sm1021533wrs.53.2020.02.17.05.55.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2020 05:55:22 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 13:55:17 +0000
Message-Id: <20200217135517.5826-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200217135517.5826-1-liuwe@microsoft.com>
References: <20200217135517.5826-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/3] x86/hyperv: L0 assisted TLB flush
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

SW1wbGVtZW50IEwwIGFzc2lzdGVkIFRMQiBmbHVzaCBmb3IgWGVuIG9uIEh5cGVyLVYuIEl0IHRh
a2VzIGFkdmFudGFnZQpvZiBzZXZlcmFsIGh5cGVyY2FsbHM6CgogKiBIVkNBTExfRkxVU0hfVklS
VFVBTF9BRERSRVNTX0xJU1QKICogSFZDQUxMX0ZMVVNIX1ZJUlRVQUxfQUREUkVTU19MSVNUX0VY
CiAqIEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0UKICogSFZDQUxMX0ZMVVNIX1ZJ
UlRVQUxfQUREUkVTU19TUEFDRV9FWAoKUGljayB0aGUgbW9zdCBlZmZpY2llbnQgaHlwZXJjYWxs
cyBhdmFpbGFibGUuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29t
PgotLS0KdjM6CjEuIEFkZHJlc3MgbW9yZSBjb21tZW50cy4KMi4gRml4IHVzYWdlIG9mIG1heF92
cF9pbmRleC4KMy4gVXNlIHRoZSBmaWxsX2d2YV9saXN0IGFsZ29yaXRobSBmcm9tIExpbnV4LgoK
djI6CjEuIEFkZHJlc3MgUm9nZXIgYW5kIEphbidzIGNvbW1lbnRzIHJlIHR5cGVzIGV0Yy4KMi4g
Rml4IHBvaW50ZXIgYXJpdGhtZXRpYy4KMy4gTWlzYyBpbXByb3ZlbWVudCB0byBjb2RlLgotLS0K
IHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgIHwgICAxICsKIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oIHwgICA5ICsrCiB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlw
ZXJ2L3RsYi5jICAgICB8IDE3MyArKysrKysrKysrKysrKysrKysrKysrKysrKystCiB4ZW4vYXJj
aC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwuYyAgICB8ICA3NCArKysrKysrKysrKysKIDQgZmlsZXMg
Y2hhbmdlZCwgMjU2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEw
MDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3V0aWwuYwoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2
L01ha2VmaWxlCmluZGV4IDE4OTAyYzMzZTkuLjBlMzk0MTA5NjggMTAwNjQ0Ci0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9NYWtlZmlsZQpAQCAtMSwyICsxLDMgQEAKIG9iai15ICs9IGh5cGVydi5vCiBvYmoteSAr
PSB0bGIubworb2JqLXkgKz0gdXRpbC5vCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L3ByaXZhdGUuaCBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCmlu
ZGV4IDUwOWJlZGFhZmEuLjc5YTc3OTMwYTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvcHJpdmF0ZS5oCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0
ZS5oCkBAIC0yNCwxMiArMjQsMjEgQEAKIAogI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5j
bHVkZSA8eGVuL3BlcmNwdS5oPgorI2luY2x1ZGUgPHhlbi90eXBlcy5oPgogCiBERUNMQVJFX1BF
Ul9DUFUodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKIERFQ0xBUkVfUEVSX0NQVSh2b2lkICosIGh2
X3ZwX2Fzc2lzdCk7CiBERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7
CiAKK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGh2X3ZwX2luZGV4KHVuc2lnbmVkIGludCBj
cHUpCit7CisgICAgcmV0dXJuIHBlcl9jcHUoaHZfdnBfaW5kZXgsIGNwdSk7Cit9CisKIGludCBo
eXBlcnZfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsCiAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpOwogCisvKiBSZXR1cm5zIG51
bWJlciBvZiBiYW5rcywgLWV2IGlmIGVycm9yICovCitpbnQgY3B1bWFza190b192cHNldChzdHJ1
Y3QgaHZfdnBzZXQgKnZwc2V0LCBjb25zdCBjcHVtYXNrX3QgKm1hc2spOworCiAjZW5kaWYgLyog
X19YRU5fSFlQRVJWX1BSSVZJQVRFX0hfXyAgKi8KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvdGxiLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jCmluZGV4
IDQ4ZjUyNzIyOWUuLjhjZDFjNmYwZWQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9o
eXBlcnYvdGxiLmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi90bGIuYwpAQCAtMTks
MTcgKzE5LDE4OCBAQAogICogQ29weXJpZ2h0IChjKSAyMDIwIE1pY3Jvc29mdC4KICAqLwogCisj
aW5jbHVkZSA8eGVuL2NwdS5oPgogI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8
eGVuL2Vycm5vLmg+CiAKKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlwZXJ2Lmg+CisjaW5jbHVkZSA8
YXNtL2d1ZXN0L2h5cGVydi1oY2FsbC5oPgorI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnYtdGxm
cy5oPgorCiAjaW5jbHVkZSAicHJpdmF0ZS5oIgogCisvKgorICogSXQgaXMgcG9zc2libGUgdG8g
ZW5jb2RlIHVwIHRvIDQwOTYgcGFnZXMgdXNpbmcgdGhlIGxvd2VyIDEyIGJpdHMKKyAqIGluIGFu
IGVsZW1lbnQgb2YgZ3ZhX2xpc3QKKyAqLworI2RlZmluZSBIVl9UTEJfRkxVU0hfVU5JVCAoNDA5
NiAqIFBBR0VfU0laRSkKKworc3RhdGljIHVuc2lnbmVkIGludCBmaWxsX2d2YV9saXN0KHVpbnQ2
NF90ICpndmFfbGlzdCwgY29uc3Qgdm9pZCAqdmEsCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQoreworICAgIHVuc2lnbmVkIGxvbmcgY3VyID0g
KHVuc2lnbmVkIGxvbmcpdmE7CisgICAgLyogZW5kIGlzIDEgcGFzdCB0aGUgcmFuZ2UgdG8gYmUg
Zmx1c2hlZCAqLworICAgIHVuc2lnbmVkIGxvbmcgZW5kID0gY3VyICsgKFBBR0VfU0laRSA8PCBv
cmRlcik7CisgICAgdW5zaWduZWQgaW50IG4gPSAwOworCisgICAgZG8geworICAgICAgICB1bnNp
Z25lZCBsb25nIGRpZmYgPSBlbmQgLSBjdXI7CisKKyAgICAgICAgZ3ZhX2xpc3Rbbl0gPSBjdXIg
JiBQQUdFX01BU0s7CisKKyAgICAgICAgLyoKKyAgICAgICAgICogVXNlIGxvd2VyIDEyIGJpdHMg
dG8gZW5jb2RlIHRoZSBudW1iZXIgb2YgYWRkaXRpb25hbCBwYWdlcworICAgICAgICAgKiB0byBm
bHVzaAorICAgICAgICAgKi8KKyAgICAgICAgaWYgKCBkaWZmID49IEhWX1RMQl9GTFVTSF9VTklU
ICkKKyAgICAgICAgeworICAgICAgICAgICAgZ3ZhX2xpc3Rbbl0gfD0gflBBR0VfTUFTSzsKKyAg
ICAgICAgICAgIGN1ciArPSBIVl9UTEJfRkxVU0hfVU5JVDsKKyAgICAgICAgfQorICAgICAgICBl
bHNlCisgICAgICAgIHsKKyAgICAgICAgICAgIGd2YV9saXN0W25dIHw9IChkaWZmIC0gMSkgPj4g
UEFHRV9TSElGVDsKKyAgICAgICAgICAgIGN1ciA9IGVuZDsKKyAgICAgICAgfQorCisgICAgICAg
IG4rKzsKKyAgICB9IHdoaWxlICggY3VyIDwgZW5kICk7CisKKyAgICByZXR1cm4gbjsKK30KKwor
c3RhdGljIHVpbnQ2NF90IGZsdXNoX3RsYl9leChjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0
IHZvaWQgKnZhLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxh
Z3MpCit7CisgICAgc3RydWN0IGh2X3RsYl9mbHVzaF9leCAqZmx1c2ggPSB0aGlzX2NwdShodl9p
bnB1dF9wYWdlKTsKKyAgICBpbnQgbnJfYmFua3M7CisgICAgdW5zaWduZWQgaW50IG1heF9ndmFz
LCBvcmRlciA9IGZsYWdzICYgRkxVU0hfT1JERVJfTUFTSzsKKyAgICB1aW50NjRfdCAqZ3ZhX2xp
c3Q7CisKKyAgICBpZiAoICFmbHVzaCB8fCBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpICkKKyAgICB7
CisgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOworICAgICAgICByZXR1cm4gfjBVTEw7Cisg
ICAgfQorCisgICAgaWYgKCAhKG1zX2h5cGVydi5oaW50cyAmIEhWX1g2NF9FWF9QUk9DRVNTT1Jf
TUFTS1NfUkVDT01NRU5ERUQpICkKKyAgICAgICAgcmV0dXJuIH4wVUxMOworCisgICAgZmx1c2gt
PmFkZHJlc3Nfc3BhY2UgPSAwOworICAgIGZsdXNoLT5mbGFncyA9IEhWX0ZMVVNIX0FMTF9WSVJU
VUFMX0FERFJFU1NfU1BBQ0VTOworICAgIGlmICggIShmbGFncyAmIEZMVVNIX1RMQl9HTE9CQUwp
ICkKKyAgICAgICAgZmx1c2gtPmZsYWdzIHw9IEhWX0ZMVVNIX05PTl9HTE9CQUxfTUFQUElOR1Nf
T05MWTsKKworICAgIG5yX2JhbmtzID0gY3B1bWFza190b192cHNldCgmZmx1c2gtPmh2X3ZwX3Nl
dCwgbWFzayk7CisgICAgaWYgKCBucl9iYW5rcyA8IDAgKQorICAgICAgICByZXR1cm4gfjBVTEw7
CisKKyAgICBtYXhfZ3ZhcyA9CisgICAgICAgIChQQUdFX1NJWkUgLSBzaXplb2YoKmZsdXNoKSAt
IG5yX2JhbmtzICoKKyAgICAgICAgIHNpemVvZihmbHVzaC0+aHZfdnBfc2V0LmJhbmtfY29udGVu
dHNbMF0pKSAvCisgICAgICAgIHNpemVvZih1aW50NjRfdCk7ICAgICAgIC8qIGd2YSBpcyByZXBy
ZXNlbnRlZCBhcyB1aW50NjRfdCAqLworCisgICAgLyoKKyAgICAgKiBGbHVzaCB0aGUgZW50aXJl
IGFkZHJlc3Mgc3BhY2UgaWYgdmEgaXMgTlVMTCBvciBpZiB0aGVyZSBpcyBub3QKKyAgICAgKiBl
bm91Z2ggc3BhY2UgZm9yIGd2YV9saXN0LgorICAgICAqLworICAgIGlmICggIXZhIHx8IChQQUdF
X1NJWkUgPDwgb3JkZXIpIC8gSFZfVExCX0ZMVVNIX1VOSVQgPiBtYXhfZ3ZhcyApCisgICAgICAg
IHJldHVybiBodl9kb19yZXBfaHlwZXJjYWxsKEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1Nf
U1BBQ0VfRVgsIDAsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG5yX2Jhbmtz
LCB2aXJ0X3RvX21hZGRyKGZsdXNoKSwgMCk7CisKKyAgICAvKgorICAgICAqIFRoZSBjYWxjdWxh
dGlvbiBvZiBndmFfbGlzdCBhZGRyZXNzIHJlcXVpcmVzIHRoZSBzdHJ1Y3R1cmUgdG8KKyAgICAg
KiBiZSA2NCBiaXRzIGFsaWduZWQuCisgICAgICovCisgICAgQlVJTERfQlVHX09OKHNpemVvZigq
Zmx1c2gpICUgc2l6ZW9mKHVpbnQ2NF90KSk7CisgICAgZ3ZhX2xpc3QgPSAodWludDY0X3QgKilm
bHVzaCArIHNpemVvZigqZmx1c2gpIC8gc2l6ZW9mKHVpbnQ2NF90KSArIG5yX2JhbmtzOworCisg
ICAgcmV0dXJuIGh2X2RvX3JlcF9oeXBlcmNhbGwoSFZDQUxMX0ZMVVNIX1ZJUlRVQUxfQUREUkVT
U19MSVNUX0VYLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZpbGxfZ3ZhX2xpc3Qo
Z3ZhX2xpc3QsIHZhLCBvcmRlciksCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnJf
YmFua3MsIHZpcnRfdG9fbWFkZHIoZmx1c2gpLCAwKTsKK30KKworLyogTWF4aW11bSBudW1iZXIg
b2YgZ3ZhcyBmb3IgaHZfdGxiX2ZsdXNoICovCisjZGVmaW5lIE1BWF9HVkFTICgoUEFHRV9TSVpF
IC0gc2l6ZW9mKHN0cnVjdCBodl90bGJfZmx1c2gpKSAvIHNpemVvZih1aW50NjRfdCkpCisKIGlu
dCBoeXBlcnZfZmx1c2hfdGxiKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEs
CiAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCiB7Ci0gICAgcmV0dXJu
IC1FT1BOT1RTVVBQOworICAgIHVuc2lnbmVkIGxvbmcgaXJxX2ZsYWdzOworICAgIHN0cnVjdCBo
dl90bGJfZmx1c2ggKmZsdXNoID0gdGhpc19jcHUoaHZfaW5wdXRfcGFnZSk7CisgICAgdW5zaWdu
ZWQgaW50IG9yZGVyID0gZmxhZ3MgJiBGTFVTSF9PUkRFUl9NQVNLOworICAgIHVpbnQ2NF90IHJl
dDsKKworICAgIGlmICggIWZsdXNoIHx8IGNwdW1hc2tfZW1wdHkobWFzaykgKQorICAgIHsKKyAg
ICAgICAgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7CisgICAgICAgIHJldHVybiAtRUlOVkFMOworICAg
IH0KKworICAgIGxvY2FsX2lycV9zYXZlKGlycV9mbGFncyk7CisKKyAgICBmbHVzaC0+YWRkcmVz
c19zcGFjZSA9IDA7CisgICAgZmx1c2gtPmZsYWdzID0gSFZfRkxVU0hfQUxMX1ZJUlRVQUxfQURE
UkVTU19TUEFDRVM7CisgICAgZmx1c2gtPnByb2Nlc3Nvcl9tYXNrID0gMDsKKyAgICBpZiAoICEo
ZmxhZ3MgJiBGTFVTSF9UTEJfR0xPQkFMKSApCisgICAgICAgIGZsdXNoLT5mbGFncyB8PSBIVl9G
TFVTSF9OT05fR0xPQkFMX01BUFBJTkdTX09OTFk7CisKKyAgICBpZiAoIGNwdW1hc2tfZXF1YWwo
bWFzaywgJmNwdV9vbmxpbmVfbWFwKSApCisgICAgICAgIGZsdXNoLT5mbGFncyB8PSBIVl9GTFVT
SF9BTExfUFJPQ0VTU09SUzsKKyAgICBlbHNlCisgICAgeworICAgICAgICB1bnNpZ25lZCBpbnQg
Y3B1OworCisgICAgICAgIC8qCisgICAgICAgICAqIE5vcm1hbGx5IFZQIGluZGljZXMgYXJlIGlu
IGFzY2VuZGluZyBvcmRlciBhbmQgbWF0Y2ggWGVuJ3MKKyAgICAgICAgICogaWRlYSBvZiBDUFUg
aWRzLiBDaGVjayB0aGUgbGFzdCBpbmRleCB0byBzZWUgaWYgVlAgaW5kZXggaXMKKyAgICAgICAg
ICogPj0gNjQuIElmIHNvLCB3ZSBjYW4gc2tpcCBzZXR0aW5nIHVwIHBhcmFtZXRlcnMgZm9yCisg
ICAgICAgICAqIG5vbi1hcHBsaWNhYmxlIGh5cGVyY2FsbHMgd2l0aG91dCBsb29raW5nIGZ1cnRo
ZXIuCisgICAgICAgICAqLworICAgICAgICBpZiAoIGh2X3ZwX2luZGV4KGNwdW1hc2tfbGFzdCht
YXNrKSkgPj0gNjQgKQorICAgICAgICAgICAgZ290byBkb19leF9oeXBlcmNhbGw7CisKKyAgICAg
ICAgZm9yX2VhY2hfY3B1ICggY3B1LCBtYXNrICkKKyAgICAgICAgeworICAgICAgICAgICAgdW5z
aWduZWQgaW50IHZwaWQgPSBodl92cF9pbmRleChjcHUpOworCisgICAgICAgICAgICBpZiAoIHZw
aWQgPj0gbXNfaHlwZXJ2Lm1heF92cF9pbmRleCApCisgICAgICAgICAgICB7CisgICAgICAgICAg
ICAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoaXJxX2ZsYWdzKTsKKyAgICAgICAgICAgICAgICByZXR1
cm4gLUVOWElPOworICAgICAgICAgICAgfQorCisgICAgICAgICAgICBpZiAoIHZwaWQgPj0gNjQg
KQorICAgICAgICAgICAgICAgIGdvdG8gZG9fZXhfaHlwZXJjYWxsOworCisgICAgICAgICAgICBf
X3NldF9iaXQodnBpZCwgJmZsdXNoLT5wcm9jZXNzb3JfbWFzayk7CisgICAgICAgIH0KKyAgICB9
CisKKyAgICAvKgorICAgICAqIEZsdXNoIHRoZSBlbnRpcmUgYWRkcmVzcyBzcGFjZSBpZiB2YSBp
cyBOVUxMIG9yIGlmIHRoZXJlIGlzIG5vdAorICAgICAqIGVub3VnaCBzcGFjZSBmb3IgZ3ZhX2xp
c3QuCisgICAgICovCisgICAgaWYgKCAhdmEgfHwgKFBBR0VfU0laRSA8PCBvcmRlcikgLyBIVl9U
TEJfRkxVU0hfVU5JVCA+IE1BWF9HVkFTICkKKyAgICAgICAgcmV0ID0gaHZfZG9faHlwZXJjYWxs
KEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfU1BBQ0UsCisgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB2aXJ0X3RvX21hZGRyKGZsdXNoKSwgMCk7CisgICAgZWxzZQorICAgICAgICBy
ZXQgPSBodl9kb19yZXBfaHlwZXJjYWxsKEhWQ0FMTF9GTFVTSF9WSVJUVUFMX0FERFJFU1NfTElT
VCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaWxsX2d2YV9saXN0KGZsdXNo
LT5ndmFfbGlzdCwgdmEsIG9yZGVyKSwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAwLCB2aXJ0X3RvX21hZGRyKGZsdXNoKSwgMCk7CisgICAgZ290byBkb25lOworCisgZG9fZXhf
aHlwZXJjYWxsOgorICAgIHJldCA9IGZsdXNoX3RsYl9leChtYXNrLCB2YSwgZmxhZ3MpOworCisg
ZG9uZToKKyAgICBsb2NhbF9pcnFfcmVzdG9yZShpcnFfZmxhZ3MpOworCisgICAgcmV0dXJuIHJl
dCAmIEhWX0hZUEVSQ0FMTF9SRVNVTFRfTUFTSyA/IC1FTlhJTyA6IDA7CiB9CiAKKyN1bmRlZiBN
QVhfR1ZBUworCiAvKgogICogTG9jYWwgdmFyaWFibGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi91dGlsLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3Qv
aHlwZXJ2L3V0aWwuYwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4wYWJi
MzdiMDVmCi0tLSAvZGV2L251bGwKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi91dGls
LmMKQEAgLTAsMCArMSw3NCBAQAorLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgorICogYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L3V0aWwuYworICoKKyAqIEh5cGVyLVYgdXRpbGl0eSBmdW5jdGlvbnMKKyAq
CisgKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUg
aXQgYW5kL29yIG1vZGlmeQorICogaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJh
bCBQdWJsaWMgTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkKKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZv
dW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCisgKiAoYXQgeW91
ciBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAorICogYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKKyAq
IE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNl
ZSB0aGUKKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisg
KgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UKKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8
aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKgorICogQ29weXJpZ2h0IChjKSAyMDIw
IE1pY3Jvc29mdC4KKyAqLworCisjaW5jbHVkZSA8eGVuL2NwdS5oPgorI2luY2x1ZGUgPHhlbi9j
cHVtYXNrLmg+CisjaW5jbHVkZSA8eGVuL2Vycm5vLmg+CisKKyNpbmNsdWRlIDxhc20vZ3Vlc3Qv
aHlwZXJ2Lmg+CisjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydi10bGZzLmg+CisKKyNpbmNsdWRl
ICJwcml2YXRlLmgiCisKK2ludCBjcHVtYXNrX3RvX3Zwc2V0KHN0cnVjdCBodl92cHNldCAqdnBz
ZXQsCisgICAgICAgICAgICAgICAgICAgICBjb25zdCBjcHVtYXNrX3QgKm1hc2spCit7CisgICAg
aW50IG5yID0gMTsKKyAgICB1bnNpZ25lZCBpbnQgY3B1LCB2Y3B1X2JhbmssIHZjcHVfb2Zmc2V0
OworICAgIHVuc2lnbmVkIGludCBtYXhfYmFua3MgPSBtc19oeXBlcnYubWF4X3ZwX2luZGV4IC8g
NjQ7CisKKyAgICAvKiBVcCB0byA2NCBiYW5rcyBjYW4gYmUgcmVwcmVzZW50ZWQgYnkgdmFsaWRf
YmFua19tYXNrICovCisgICAgaWYgKCBtYXhfYmFua3MgPiA2NCApCisgICAgICAgIHJldHVybiAt
RTJCSUc7CisKKyAgICAvKiBDbGVhciBhbGwgYmFua3MgdG8gYXZvaWQgZmx1c2hpbmcgdW53YW50
ZWQgQ1BVcyAqLworICAgIGZvciAoIHZjcHVfYmFuayA9IDA7IHZjcHVfYmFuayA8IG1heF9iYW5r
czsgdmNwdV9iYW5rKysgKQorICAgICAgICB2cHNldC0+YmFua19jb250ZW50c1t2Y3B1X2Jhbmtd
ID0gMDsKKworICAgIHZwc2V0LT52YWxpZF9iYW5rX21hc2sgPSAwOworICAgIHZwc2V0LT5mb3Jt
YXQgPSBIVl9HRU5FUklDX1NFVF9TUEFSU0VfNEs7CisKKyAgICBmb3JfZWFjaF9jcHUgKCBjcHUs
IG1hc2sgKQorICAgIHsKKyAgICAgICAgdW5zaWduZWQgaW50IHZjcHUgPSBodl92cF9pbmRleChj
cHUpOworCisgICAgICAgIHZjcHVfYmFuayA9IHZjcHUgLyA2NDsKKyAgICAgICAgdmNwdV9vZmZz
ZXQgPSB2Y3B1ICUgNjQ7CisKKyAgICAgICAgX19zZXRfYml0KHZjcHVfb2Zmc2V0LCAmdnBzZXQt
PmJhbmtfY29udGVudHNbdmNwdV9iYW5rXSk7CisgICAgICAgIF9fc2V0X2JpdCh2Y3B1X2Jhbmss
ICZ2cHNldC0+dmFsaWRfYmFua19tYXNrKTsKKworICAgICAgICBpZiAoIHZjcHVfYmFuayA+PSBu
ciApCisgICAgICAgICAgICBuciA9IHZjcHVfYmFuayArIDE7CisgICAgfQorCisgICAgcmV0dXJu
IG5yOworfQorCisvKgorICogTG9jYWwgdmFyaWFibGVzOgorICogbW9kZTogQworICogYy1maWxl
LXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZzZXQ6IDQKKyAqIHRhYi13aWR0aDogNAorICog
aW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6CisgKi8KLS0gCjIuMjAuMQoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
