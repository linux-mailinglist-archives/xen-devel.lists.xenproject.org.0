Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7C0416C2
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 23:18:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hao6S-0003XJ-68; Tue, 11 Jun 2019 21:14:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=r+TN=UK=gmail.com=niko.tsirakis@srs-us1.protection.inumbo.net>)
 id 1hao6Q-0003Wc-Gb
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 21:14:46 +0000
X-Inumbo-ID: ef879ab1-8c8d-11e9-8980-bc764e045a96
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef879ab1-8c8d-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 21:14:45 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p15so8941521qtl.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=bSxMQeoBCOzKfYSpv+gnDmnsvRm8sBZinCauBKMr1/Y=;
 b=EENHGxscZHQrfjSiPRgvpABR+PbMI5Da3HCxzTEHHvM6jZbYCR7TcZiT01hhKGEirI
 n5xm+2e56s7NqhSVVS3p5f01/MLrQGZonboTiC1iKQhat10zQyekPQvW6ES72wxpwQgH
 ut1ckxK3dJk5WnrM4CcQr2LXlt3TOb7M7m20CieTkPa644gk2Z0Aa2zasvvEMscpTMqT
 dHThNWmhNcZX1EaqeMJu/cZy3/pZur+lC8LlfgDHlOD2lzUktCCKMPGLjCB6kbAui3rR
 GNyyvzk1l40xBtlhdOEya7QQ0WbA17YH5jDpZFScUXdV55vU+26AdkhHVnuNu3QFhZW6
 qgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=bSxMQeoBCOzKfYSpv+gnDmnsvRm8sBZinCauBKMr1/Y=;
 b=KuCBIQwIhs5OSRmN7r2VWLWIm2+Bx2GgQzlJKT8PS3g5fJ7JFAU3aQj+98XO86pJJ+
 6y2arQBKF6nujs22M+vgggwHKPlVvsvNrXOLBaCajXUgfWNU4ZuQeCoXTKDUkJjNNOIl
 DPrEQyf8jvAF0nlXfnkWaj9TbDkzr0sv2isyQ+OMpSTqKG6TJJK8Sn8cA71TZaYjH9Gi
 Gtb1o7IgRNHBLJRGPBrIEO5teCgxnJZCXlMDug7DMWOBinC2/FuCGvYsCcvZ4VbNRlla
 nk4tmqKZntvJhPwj5dQ8rUFKfxi9hp+krTpMruxbhXcGTfI6c2lyFJffFNwGkZaNtwNa
 J2FQ==
X-Gm-Message-State: APjAAAWo2j8B1s8ud4N0tsX7o85YOMR4DkSLHb8+W/WuEC3JfIzCV9N2
 rOW2RSMRaHChrUNXhqIG+RFWiyL7UjY=
X-Google-Smtp-Source: APXvYqxfyabkq4sck5usPj/YZ/r2yJf56HhbR82VdimvJAdI+VM4JgvUI1EAfJT8rJ/Kk6g7L+5Gpg==
X-Received: by 2002:ac8:3271:: with SMTP id y46mr28324467qta.185.1560287684480; 
 Tue, 11 Jun 2019 14:14:44 -0700 (PDT)
Received: from niko-Latitude-E7470.fios-router.home
 (pool-108-54-183-56.nycmny.fios.verizon.net. [108.54.183.56])
 by smtp.gmail.com with ESMTPSA id 34sm10070811qtq.59.2019.06.11.14.14.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 14:14:44 -0700 (PDT)
From: Nicholas Tsirakis <niko.tsirakis@gmail.com>
X-Google-Original-From: Nicholas Tsirakis <tsirakisn@ainfosec.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Jun 2019 17:14:27 -0400
Message-Id: <cf4923152106ddbc0dbc76d432735b0fcf221899.1560286430.git.tsirakisn@ainfosec.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
In-Reply-To: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560286430.git.tsirakisn@ainfosec.com>
Subject: [Xen-devel] [PATCH v2 2/2] argo: correctly report pending message
 length
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
Cc: Nicholas Tsirakis <tsirakisn@ainfosec.com>,
 Christopher Clark <christopher.w.clark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBhIG1lc3NhZ2UgaXMgcmVxdWV1ZSdkIGluIFhlbidzIGludGVybmFsIHF1ZXVlLCB0aGUg
cXVldWUKZW50cnkgY29udGFpbnMgdGhlIGxlbmd0aCBvZiB0aGUgbWVzc2FnZSBzbyB0aGF0IFhl
biBrbm93cyB0bwpzZW5kIGEgVklSUSB0byB0aGUgcmVzcGVjdGl2ZSBkb21haW4gd2hlbiBlbm91
Z2ggc3BhY2UgZnJlZXMgdXAKaW4gdGhlIHJpbmcuIER1ZSB0byBhIHNtYWxsIGJ1ZywgaG93ZXZl
ciwgWGVuIGRvZXNuJ3QgcG9wdWxhdGUKdGhlIGxlbmd0aCBvZiB0aGUgbXNnIGlmIGEgZ2l2ZW4g
d3JpdGUgZmFpbHMsIHNvIHRoaXMgbGVuZ3RoIGlzCmFsd2F5cyByZXBvcnRlZCBhcyB6ZXJvLiBU
aGlzIGNhdXNlcyBYZW4gdG8gc3B1cnJpb3VzbHkgd2FrZSB1cAphIGRvbWFpbiBldmVuIHdoZW4g
dGhlIHJpbmcgZG9lc24ndCBoYXZlIGVub3VnaCBzcGFjZS4KClRoaXMgcGF0Y2ggbWFrZXMgc3Vy
ZSB0aGF0IHRoZSBtc2cgbGVuIGlzIHByb3Blcmx5IHJlcG9ydGVkIGJ5CnBvcHVsYXRpbmcgaXQg
aW4gdGhlIGV2ZW50IG9mIGEgd3JpdGUgZmFpbHVyZS4KClNpZ25lZC1vZmYtYnk6IE5pY2hvbGFz
IFRzaXJha2lzIDx0c2lyYWtpc25AYWluZm9zZWMuY29tPgotLS0KIHhlbi9jb21tb24vYXJnby5j
IHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIv
eGVuL2NvbW1vbi9hcmdvLmMKaW5kZXggMmY4NzRhNTcwZC4uMzFiYWY0YmVlZCAxMDA2NDQKLS0t
IGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIveGVuL2NvbW1vbi9hcmdvLmMKQEAgLTc2NiwyNiAr
NzY2LDIwIEBAIHN0YXRpYyBpbnQKIHJpbmdidWZfaW5zZXJ0KGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBhcmdvX3JpbmdfaW5mbyAqcmluZ19pbmZvLAogICAgICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGFyZ29fcmluZ19pZCAqc3JjX2lkLCB4ZW5fYXJnb19pb3ZfdCAqaW92cywKICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCBuaW92LCB1aW50MzJfdCBtZXNzYWdlX3R5cGUsCi0g
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nICpvdXRfbGVuKQorICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IGxlbikKIHsKICAgICB4ZW5fYXJnb19yaW5nX3QgcmluZzsKICAgICBzdHJ1Y3Qg
eGVuX2FyZ29fcmluZ19tZXNzYWdlX2hlYWRlciBtaCA9IHsgfTsKICAgICBpbnQgc3AsIHJldDsK
LSAgICB1bnNpZ25lZCBpbnQgbGVuID0gMDsKICAgICB4ZW5fYXJnb19pb3ZfdCAqcGlvdjsKICAg
ICBYRU5fR1VFU1RfSEFORExFKHVpbnQ4KSBOVUxMX2huZCA9IHsgfTsKIAogICAgIEFTU0VSVChM
T0NLSU5HX0wzKGQsIHJpbmdfaW5mbykpOwogCiAgICAgLyoKLSAgICAgKiBPYnRhaW4gdGhlIHRv
dGFsIHNpemUgb2YgZGF0YSB0byB0cmFuc21pdCAtLSBzZXRzIHRoZSAnbGVuJyB2YXJpYWJsZQot
ICAgICAqIC0tIGFuZCBzYW5pdHkgY2hlY2sgdGhhdCB0aGUgaW92cyBjb25mb3JtIHRvIHNpemUg
YW5kIG51bWJlciBsaW1pdHMuCiAgICAgICogRW5mb3JjZWQgYmVsb3c6IG5vIG1vcmUgdGhhbiAn
bGVuJyBieXRlcyBvZiBndWVzdCBkYXRhCiAgICAgICogKHBsdXMgdGhlIG1lc3NhZ2UgaGVhZGVy
KSB3aWxsIGJlIHNlbnQgaW4gdGhpcyBvcGVyYXRpb24uCiAgICAgICovCi0gICAgcmV0ID0gaW92
X2NvdW50KGlvdnMsIG5pb3YsICZsZW4pOwotICAgIGlmICggcmV0ICkKLSAgICAgICAgcmV0dXJu
IHJldDsKIAogICAgIC8qCiAgICAgICogVXBwZXIgYm91bmQgY2hlY2sgdGhlIG1lc3NhZ2UgbGVu
IGFnYWluc3QgdGhlIHJpbmcgc2l6ZS4KQEAgLTk4Myw4ICs5NzcsNiBAQCByaW5nYnVmX2luc2Vy
dChjb25zdCBzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5m
bywKICAgICAgKiB2ZXJzdXMgcGVyZm9ybWFuY2UgY29zdCBjb3VsZCBiZSBhZGRlZCB0byBkZWNp
ZGUgdGhhdCBoZXJlLgogICAgICAqLwogCi0gICAgKm91dF9sZW4gPSBsZW47Ci0KICAgICByZXR1
cm4gcmV0OwogfQogCkBAIC0xOTc2LDcgKzE5NjgsNyBAQCBzZW5kdihzdHJ1Y3QgZG9tYWluICpz
cmNfZCwgeGVuX2FyZ29fYWRkcl90ICpzcmNfYWRkciwKICAgICBzdHJ1Y3QgYXJnb19yaW5nX2lk
IHNyY19pZDsKICAgICBzdHJ1Y3QgYXJnb19yaW5nX2luZm8gKnJpbmdfaW5mbzsKICAgICBpbnQg
cmV0ID0gMDsKLSAgICB1bnNpZ25lZCBsb25nIGxlbiA9IDA7CisgICAgdW5zaWduZWQgaW50IGxl
biA9IDA7CiAKICAgICBhcmdvX2RwcmludGsoInNlbmR2OiAoJXU6JXgpLT4oJXU6JXgpIG5pb3Y6
JXUgdHlwZToleFxuIiwKICAgICAgICAgICAgICAgICAgc3JjX2FkZHItPmRvbWFpbl9pZCwgc3Jj
X2FkZHItPmFwb3J0LCBkc3RfYWRkci0+ZG9tYWluX2lkLApAQCAtMjA0NCw4ICsyMDM2LDE2IEBA
IHNlbmR2KHN0cnVjdCBkb21haW4gKnNyY19kLCB4ZW5fYXJnb19hZGRyX3QgKnNyY19hZGRyLAog
ICAgIHsKICAgICAgICAgc3Bpbl9sb2NrKCZyaW5nX2luZm8tPkwzX2xvY2spOwogCisgICAgICAg
IC8qCisgICAgICAgICAqIE9idGFpbiB0aGUgdG90YWwgc2l6ZSBvZiBkYXRhIHRvIHRyYW5zbWl0
IC0tIHNldHMgdGhlICdsZW4nIHZhcmlhYmxlCisgICAgICAgICAqIC0tIGFuZCBzYW5pdHkgY2hl
Y2sgdGhhdCB0aGUgaW92cyBjb25mb3JtIHRvIHNpemUgYW5kIG51bWJlciBsaW1pdHMuCisgICAg
ICAgICAqLworICAgICAgICByZXQgPSBpb3ZfY291bnQoaW92cywgbmlvdiwgJmxlbik7CisgICAg
ICAgIGlmICggcmV0ICkKKyAgICAgICAgICAgIHJldHVybiByZXQ7CisKICAgICAgICAgcmV0ID0g
cmluZ2J1Zl9pbnNlcnQoZHN0X2QsIHJpbmdfaW5mbywgJnNyY19pZCwgaW92cywgbmlvdiwKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVzc2FnZV90eXBlLCAmbGVuKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbWVzc2FnZV90eXBlLCBsZW4pOwogICAgICAgICBpZiAoIHJl
dCA9PSAtRUFHQUlOICkKICAgICAgICAgewogICAgICAgICAgICAgaW50IHJjOwotLSAKMi4xNy4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
