Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F97914CCD8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 15:58:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwokZ-0000LQ-PC; Wed, 29 Jan 2020 14:55:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=359B=3S=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iwokY-0000Kt-Fo
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:55:26 +0000
X-Inumbo-ID: 6164dd7c-42a7-11ea-b211-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6164dd7c-42a7-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 14:55:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id t23so12055630lfk.6
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 06:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZW9+Wg3q/4l9pYMVcV8YdGyoyYfomvr0275Ia3YZK6E=;
 b=VWqkjMAqKqsPzyQZmtXOTKbHWqAfFlPjz3aEQ0PmSczqCrwVYLSpCXm3OTe7KvLrAG
 qSEYpqoMpvkPxUlkgQQFXgbU+HVtOcm53pq37UhmRKSzWsAC2Uy2GGja2oGz4t0zSq2R
 fUCShSiRkGcinaeOfcahl4UZRjGk3YyDigVudV3d3CrltoxmvS18oPopZAtPR9IufI4k
 eHqlzzL+2at8UVRf68VwHKmKvgW2+8yCWFp0kSkqCGtKUfZt//O9svvmM/3dRn5hOx1Q
 kyUuxmniWdqCVOgURTeo9K1wa04EdDOw7eVlGqpB9n+RFzToVyOE032spzL4ZJLVhlxc
 lqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZW9+Wg3q/4l9pYMVcV8YdGyoyYfomvr0275Ia3YZK6E=;
 b=azri75AUQO6EVk/2EK1oAS6RHRnVg3KQ/t+a+vlIah4F54aLZ40KTLo0M3yWCaFzzI
 aZBkJGLPvJx7rU7Ma9dfTTPR98B8BNKc8meL6JZeP2uXd28+Z9W2J63K3UdtlQ3ucGs9
 wkBGkem66KTxMcDOELyyY9TPJHebRliUH/iJ7/NPAK9ts24XchEF7EeB72/5oDkTTU1z
 HzEsuTD/PiGm0sj5ws1qsLs+UqrXE0Vj4gR0WwPMgHFSyI7jY23Pw+e7ZFts87TybZ2w
 S3d6LaQ2M/XlxM0Vsi3aHYsXk62kwUqHvn5w0PhXx5ScmsS20yfonjJuy+/nPUIIrLUW
 gN/w==
X-Gm-Message-State: APjAAAW+sYRfUI5JNXABHQw1hlBq/P/pgm1E2o5V7kuWkn5Ly9USxVSU
 waIUxKaoU02CiKjiDhTXDmcImWgMYJw=
X-Google-Smtp-Source: APXvYqzSmmZbz/o2JGngqjGECL0eKGvEb/MeDavdj+NRTZ6D4QpyzxFTBV2dU0FxZRcLVgWxs2AJdQ==
X-Received: by 2002:a19:c210:: with SMTP id l16mr5846701lfc.35.1580309724283; 
 Wed, 29 Jan 2020 06:55:24 -0800 (PST)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id k24sm1358605ljj.27.2020.01.29.06.55.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 Jan 2020 06:55:23 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 29 Jan 2020 16:55:14 +0200
Message-Id: <1580309714-21912-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [PATCH] iommu/arm: Don't allow the same micro-TLB to be
 shared between domains
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKRm9yIHRoZSBJUE1NVS1WTVNBIHdlIG5lZWQgdG8gcHJldmVudCB0aGUgdXNlIGNhc2VzIHdo
ZXJlIGRldmljZXMKd2hpY2ggdXNlIHRoZSBzYW1lIG1pY3JvLVRMQiBhcmUgYXNzaWduZWQgdG8g
ZGlmZmVyZW50IFhlbiBkb21haW5zCihtaWNyby1UTEIgY2Fubm90IGJlIHNoYXJlZCBiZXR3ZWVu
IG11bHRpcGxlIFhlbiBkb21haW5zLCBzaW5jZSBpdApwb2ludHMgdG8gdGhlIGNvbnRleHQgYmFu
ayB0byB1c2UgZm9yIHRoZSBwYWdlIHdhbGspLgoKQXMgZWFjaCBYZW4gZG9tYWluIHVzZXMgaW5k
aXZpZHVhbCBjb250ZXh0IGJhbmsgcG9pbnRlZCBieSBjb250ZXh0X2lkLAp3ZSBjYW4gcG90ZW50
aWFsbHkgcmVjb2duaXplIHRoYXQgdXNlIGNhc2UgYnkgY29tcGFyaW5nIGN1cnJlbnQgYW5kIG5l
dwpjb250ZXh0X2lkIGZvciB0aGUgYWxyZWFkeSBlbmFibGVkIG1pY3JvLVRMQiBhbmQgcHJldmVu
dCBkaWZmZXJlbnQKY29udGV4dCBiYW5rIGZyb20gYmVpbmcgc2V0LgoKU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKLS0t
CgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KQ0M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ0M6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlt
eXJfYmFiY2h1a0BlcGFtLmNvbT4KQ0M6IFlvc2hpaGlybyBTaGltb2RhIDx5b3NoaWhpcm8uc2hp
bW9kYS51aEByZW5lc2FzLmNvbT4KCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL2lw
bW11LXZtc2EuYyB8IDQ0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYXJtL2lwbW11LXZtc2EuYwppbmRleCA5Y2ZhZTdlLi5jMjFkMmQ3IDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaXBtbXUtdm1zYS5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pcG1tdS12bXNhLmMKQEAgLTI1Nyw2ICsyNTcsNyBAQCBz
dGF0aWMgREVGSU5FX1NQSU5MT0NLKGlwbW11X2RldmljZXNfbG9jayk7CiAjZGVmaW5lIElNVUNU
Ul9UVFNFTF9NTVUobikgICAgKChuKSA8PCA0KQogI2RlZmluZSBJTVVDVFJfVFRTRUxfUE1CICAg
ICAgICg4IDw8IDQpCiAjZGVmaW5lIElNVUNUUl9UVFNFTF9NQVNLICAgICAgKDE1IDw8IDQpCisj
ZGVmaW5lIElNVUNUUl9UVFNFTF9TSElGVCAgICAgNAogI2RlZmluZSBJTVVDVFJfRkxVU0ggICAg
ICAgICAgICgxIDw8IDEpCiAjZGVmaW5lIElNVUNUUl9NTVVFTiAgICAgICAgICAgKDEgPDwgMCkK
IApAQCAtNDM0LDE5ICs0MzUsNDUgQEAgc3RhdGljIHZvaWQgaXBtbXVfdGxiX2ludmFsaWRhdGUo
c3RydWN0IGlwbW11X3Ztc2FfZG9tYWluICpkb21haW4pCiB9CiAKIC8qIEVuYWJsZSBNTVUgdHJh
bnNsYXRpb24gZm9yIHRoZSBtaWNyby1UTEIuICovCi1zdGF0aWMgdm9pZCBpcG1tdV91dGxiX2Vu
YWJsZShzdHJ1Y3QgaXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbiwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGludCB1dGxiKQorc3RhdGljIGludCBpcG1tdV91dGxiX2Vu
YWJsZShzdHJ1Y3QgaXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IHV0bGIpCiB7CiAgICAgc3RydWN0IGlwbW11X3Ztc2Ff
ZGV2aWNlICptbXUgPSBkb21haW4tPm1tdTsKKyAgICB1aW50MzJfdCBkYXRhOworCisgICAgLyoK
KyAgICAgKiBXZSBuZWVkIHRvIHByZXZlbnQgdGhlIHVzZSBjYXNlcyB3aGVyZSBkZXZpY2VzIHdo
aWNoIHVzZSB0aGUgc2FtZQorICAgICAqIG1pY3JvLVRMQiBhcmUgYXNzaWduZWQgdG8gZGlmZmVy
ZW50IFhlbiBkb21haW5zIChtaWNyby1UTEIgY2Fubm90IGJlCisgICAgICogc2hhcmVkIGJldHdl
ZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMsIHNpbmNlIGl0IHBvaW50cyB0byB0aGUgY29udGV4dCBi
YW5rCisgICAgICogdG8gdXNlIGZvciB0aGUgcGFnZSB3YWxrKS4KKyAgICAgKiBBcyBlYWNoIFhl
biBkb21haW4gdXNlcyBpbmRpdmlkdWFsIGNvbnRleHQgYmFuayBwb2ludGVkIGJ5IGNvbnRleHRf
aWQsCisgICAgICogd2UgY2FuIHBvdGVudGlhbGx5IHJlY29nbml6ZSB0aGF0IHVzZSBjYXNlIGJ5
IGNvbXBhcmluZyBjdXJyZW50IGFuZCBuZXcKKyAgICAgKiBjb250ZXh0X2lkIGZvciBhbHJlYWR5
IGVuYWJsZWQgbWljcm8tVExCIGFuZCBwcmV2ZW50IGRpZmZlcmVudCBjb250ZXh0CisgICAgICog
YmFuayBmcm9tIGJlaW5nIHNldC4KKyAgICAgKi8KKyAgICBkYXRhID0gaXBtbXVfcmVhZChtbXUs
IElNVUNUUih1dGxiKSk7CisgICAgaWYgKCBkYXRhICYgSU1VQ1RSX01NVUVOICkKKyAgICB7Cisg
ICAgICAgIHVuc2lnbmVkIGludCBjb250ZXh0X2lkOworCisgICAgICAgIGNvbnRleHRfaWQgPSAo
ZGF0YSAmIElNVUNUUl9UVFNFTF9NQVNLKSA+PiBJTVVDVFJfVFRTRUxfU0hJRlQ7CisgICAgICAg
IGlmICggZG9tYWluLT5jb250ZXh0X2lkICE9IGNvbnRleHRfaWQgKQorICAgICAgICB7CisgICAg
ICAgICAgICBkZXZfZXJyKG1tdS0+ZGV2LCAiTWljcm8tVExCICV1IGFscmVhZHkgYXNzaWduZWQg
dG8gSVBNTVUgY29udGV4dCAldVxuIiwKKyAgICAgICAgICAgICAgICAgICAgdXRsYiwgY29udGV4
dF9pZCk7CisgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKKyAgICAgICAgfQorICAgIH0KIAog
ICAgIC8qCiAgICAgICogVE9ETzogUmVmZXJlbmNlLWNvdW50IHRoZSBtaWNyby1UTEIgYXMgc2V2
ZXJhbCBidXMgbWFzdGVycyBjYW4gYmUKLSAgICAgKiBjb25uZWN0ZWQgdG8gdGhlIHNhbWUgbWlj
cm8tVExCLiBQcmV2ZW50IHRoZSB1c2UgY2FzZXMgd2hlcmUKLSAgICAgKiB0aGUgc2FtZSBtaWNy
by1UTEIgY291bGQgYmUgc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgWGVuIGRvbWFpbnMuCisgICAg
ICogY29ubmVjdGVkIHRvIHRoZSBzYW1lIG1pY3JvLVRMQi4KICAgICAgKi8KICAgICBpcG1tdV93
cml0ZShtbXUsIElNVUFTSUQodXRsYiksIDApOwotICAgIGlwbW11X3dyaXRlKG1tdSwgSU1VQ1RS
KHV0bGIpLCBpcG1tdV9yZWFkKG1tdSwgSU1VQ1RSKHV0bGIpKSB8CisgICAgaXBtbXVfd3JpdGUo
bW11LCBJTVVDVFIodXRsYiksIGRhdGEgfAogICAgICAgICAgICAgICAgIElNVUNUUl9UVFNFTF9N
TVUoZG9tYWluLT5jb250ZXh0X2lkKSB8IElNVUNUUl9NTVVFTik7CisKKyAgICByZXR1cm4gMDsK
IH0KIAogLyogRGlzYWJsZSBNTVUgdHJhbnNsYXRpb24gZm9yIHRoZSBtaWNyby1UTEIuICovCkBA
IC02NzEsNyArNjk4LDEyIEBAIHN0YXRpYyBpbnQgaXBtbXVfYXR0YWNoX2RldmljZShzdHJ1Y3Qg
aXBtbXVfdm1zYV9kb21haW4gKmRvbWFpbiwKICAgICAgICAgZGV2X2luZm8oZGV2LCAiUmV1c2lu
ZyBJUE1NVSBjb250ZXh0ICV1XG4iLCBkb21haW4tPmNvbnRleHRfaWQpOwogCiAgICAgZm9yICgg
aSA9IDA7IGkgPCBmd3NwZWMtPm51bV9pZHM7ICsraSApCi0gICAgICAgIGlwbW11X3V0bGJfZW5h
YmxlKGRvbWFpbiwgZndzcGVjLT5pZHNbaV0pOworICAgIHsKKyAgICAgICAgaW50IHJldCA9IGlw
bW11X3V0bGJfZW5hYmxlKGRvbWFpbiwgZndzcGVjLT5pZHNbaV0pOworCisgICAgICAgIGlmICgg
cmV0ICkKKyAgICAgICAgICAgIHJldHVybiByZXQ7CisgICAgfQogCiAgICAgcmV0dXJuIDA7CiB9
Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
