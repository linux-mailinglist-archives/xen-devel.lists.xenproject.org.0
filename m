Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 861BA12CA68
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:36:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ildOG-0008PV-Tw; Sun, 29 Dec 2019 18:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F+c7=2T=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ildOF-0008PB-4b
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:34:11 +0000
X-Inumbo-ID: c6344626-2a69-11ea-a1e1-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6344626-2a69-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:33:57 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so12404050wmb.0
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K1Ry921yr+IZa8O5IZElaz4gVH0PBJzo0v4gt3MXWag=;
 b=SxBaX5Oi99rlPTZQFBkh90vrNnjhJTR1dJ5bXy0x5rQE8VN5dpKYsmbNu2bwN4uPQ5
 NeUr66ukvC6JCbZb74xxlVMGC1jT+NAl2jKEIreDKrqL/HEp6Za1EebszwcYDv4E7CLn
 g2RksYY45PIUSZiRw23Su05N/zc6Kj7KEEUTk6yuwKD/0d0s96Kq7Beb+Tyu1cnKUSdk
 SeQpMJg/RJoiByKIO493sfWLb5GWGcqJFka8s88wVUcT4EuUSGkeNUDtlIUnHz9zUqF6
 9908bmFIqcOxGTWkvEIqPU9DlFPEeCpLv8NUGSN1b3u/xbv9uwJuPrx5TLRxl1KmwQZw
 p50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=K1Ry921yr+IZa8O5IZElaz4gVH0PBJzo0v4gt3MXWag=;
 b=JS7L2V/fH36MNY8xpsc08PIa/VKdw19F9cvlaH4qVKi5UBLEmcrWyZxPH+eDC+dgUv
 V8LlrthnIfVWUOGKxZbNpKRZoOrMHE7j5vQ4xeSkjQh05c4mO2jhEFwF5ORTiG27Hqxc
 R59gXlhLBVnDLi1qxvR2x+/j85UgM2ruvd4SZVWurNb4DvV4zDBx8vWb1rtiDtjfqDrQ
 Vh62x6qEYbxrNcuTVNyLwi4Zs/OMGcgrQrr03B7Ts4tLlD6R9qZTCU5zwRQqW78jQ2tQ
 aVfqzFRGOKXcWrvySA89MzaDqTueiEzzVte/6NgvlTVTsu2z1lIqgyucf+5nNOb139Iy
 u/aQ==
X-Gm-Message-State: APjAAAXTK9DC+XsdvRnb6rPVvJqOeBjZSePTMDh05lz5UEbpvxCHS0F2
 ATadLDpVsyOyyFy9Yk4S/47/fFaAcGk=
X-Google-Smtp-Source: APXvYqwp/gfQzxhMttTf34WHAy7Q09gBFru8baiBnlmuTgG6CHkRNLWmp1cEwn/3fJ/AjBwj1mrDhg==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr28829827wmc.119.1577644436910; 
 Sun, 29 Dec 2019 10:33:56 -0800 (PST)
Received: from localhost.localdomain (38.163.200.146.dyn.plus.net.
 [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id f207sm19667903wme.9.2019.12.29.10.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 10:33:56 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Sun, 29 Dec 2019 18:33:36 +0000
Message-Id: <20191229183341.14877-4-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191229183341.14877-1-liuwe@microsoft.com>
References: <20191229183341.14877-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/8] x86: rename guest/hypercall.h to
 guest/xen-hypercall.h
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2Ugd2lsbCBwcm92aWRlIGEgaGVhZGVyIGZpbGUgZm9yIEh5cGVyLVYgaHlwZXJjYWxscy4KCk5v
IGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9z
b2Z0LmNvbT4KLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC97aHlwZXJj
YWxsLmggPT4geGVuLWh5cGVyY2FsbC5ofSB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogcmVuYW1lIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vl
c3Qve2h5cGVyY2FsbC5oID0+IHhlbi1oeXBlcmNhbGwuaH0gKDk5JSkKCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmgK
aW5kZXggOTQ0NDg2MDZkNC4uN2YwOWM2NDNkNCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9ndWVzdC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QuaApAQCAtMTksMTEg
KzE5LDExIEBACiAjaWZuZGVmIF9fWDg2X0dVRVNUX0hfXwogI2RlZmluZSBfX1g4Nl9HVUVTVF9I
X18KIAotI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcmNhbGwuaD4KICNpbmNsdWRlIDxhc20vZ3Vl
c3QvaHlwZXJ2Lmg+CiAjaW5jbHVkZSA8YXNtL2d1ZXN0L2h5cGVydmlzb3IuaD4KICNpbmNsdWRl
IDxhc20vZ3Vlc3QvcHZoLWJvb3QuaD4KICNpbmNsdWRlIDxhc20vZ3Vlc3QveGVuLmg+CisjaW5j
bHVkZSA8YXNtL2d1ZXN0L3hlbi1oeXBlcmNhbGwuaD4KICNpbmNsdWRlIDxhc20vcHYvc2hpbS5o
PgogCiAjZW5kaWYgLyogX19YODZfR1VFU1RfSF9fICovCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9hc20teDg2L2d1ZXN0L2h5cGVyY2FsbC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC94
ZW4taHlwZXJjYWxsLmgKc2ltaWxhcml0eSBpbmRleCA5OSUKcmVuYW1lIGZyb20geGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaApyZW5hbWUgdG8geGVuL2luY2x1ZGUvYXNtLXg4
Ni9ndWVzdC94ZW4taHlwZXJjYWxsLmgKaW5kZXggZDBkMmY1MDIyZC4uNjgxZDNhZWNkNyAxMDA2
NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcmNhbGwuaAorKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L2d1ZXN0L3hlbi1oeXBlcmNhbGwuaApAQCAtMSw1ICsxLDUgQEAKIC8q
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioKLSAqIGFzbS14ODYvZ3Vlc3QvaHlwZXJjYWxsLmgKKyAqIGFz
bS14ODYvZ3Vlc3QveGVuLWh5cGVyY2FsbC5oCiAgKgogICogVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgogICogbW9kaWZ5IGl0IHVu
ZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCi0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
