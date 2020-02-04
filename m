Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AFE151D76
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 16:41:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz0Gz-0001if-8e; Tue, 04 Feb 2020 15:37:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VjgO=3Y=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iz0Gx-0001he-Aw
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 15:37:55 +0000
X-Inumbo-ID: 3ae0e224-4764-11ea-b211-bc764e2007e4
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ae0e224-4764-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 15:37:20 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w15so23670428wru.4
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2020 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W+fIUGL54VDjFvlN5NvdUJjiDGrz9F9XnuiMBBpSm/k=;
 b=RZ3zEa41XOa7IKXYLw5JVHKyBQZfnhdWOu8y/1x9l1Ho0Uxw0AjkTIJqlvDyVcAUXX
 efkmhKzI3+nSyn6rHv4oRFQgzbKLrO2ATvi4TPHdCpLKakXq6+0dXV2JW7ZCpIA+91/3
 9Z/aAUlCUeJqC2C+OCBDSO4CdxwH4wb/b5wYlURFOKOQsw3sO3hj/mx55CPLPIqGaXlr
 Q3ZFCBdj8PTDu1Ih0MC8+Y2NHEz8KBGc1nt/Ddl23IPkJDBtSVyGwVG6dsEQurCGc46h
 VjRUBQLri0UF+FumrRzA6PF/5AMqkDhjq3+QmlPTUwYZzpdo2AyP/9SjksKLE7OfDers
 dUiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W+fIUGL54VDjFvlN5NvdUJjiDGrz9F9XnuiMBBpSm/k=;
 b=J8lZTq7KJ/E/04F8Xs+Mv8cxzdjR93YqbDnfJOnluV7k8r0yxVUAcREkJeQkjI9Ppl
 iH0E+xgdj12tvWj1PwDH8rZ/rm3FuBDFqjF7umxyvHeLTMGOgeoKztmBG5TTPSksBKgX
 nG+NYcHmb8eo/joe0KPB0cR9Ldi7yF7m9H0XPTxDzo/uCu5bucQSnfyX1fNd+quyzFMT
 jj/R2+BS6PUJw4F0a2GldUbnneywczneJegQePwjW8OHwkiZyw+GoYJOcsNaoyh4zXWO
 4ltokDlDijMJSYHQKa0HCLDLtbAPmBWuAuPDP3UTotVGzBs3bsEchR2RC2yG6StMdEZY
 J50A==
X-Gm-Message-State: APjAAAWFnq1A+feVtuhJkB80zriWH/GKKdbwDvFUzoj1WoVEsykHS4ef
 6zlZ1LSlna3J6OLRZRKsDEorb+x2wXM=
X-Google-Smtp-Source: APXvYqzuj6E+k6UwyKZ7Qo/sUUTOB+Zv00lWZCDCoZsPpt527rOtRj1rcPFhRCGqy7RIrfRxiYONvA==
X-Received: by 2002:adf:e8c9:: with SMTP id k9mr23014221wrn.168.1580830639405; 
 Tue, 04 Feb 2020 07:37:19 -0800 (PST)
Received: from localhost.localdomain (41.142.6.51.dyn.plus.net. [51.6.142.41])
 by smtp.gmail.com with ESMTPSA id
 p26sm4067143wmc.24.2020.02.04.07.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2020 07:37:18 -0800 (PST)
From: Wei Liu <wl@xen.org>
X-Google-Original-From: Wei Liu <liuwe@microsoft.com>
To: Xen Development List <xen-devel@lists.xenproject.org>
Date: Tue,  4 Feb 2020 15:37:03 +0000
Message-Id: <20200204153704.15934-10-liuwe@microsoft.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200204153704.15934-1-liuwe@microsoft.com>
References: <20200204153704.15934-1-liuwe@microsoft.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 09/10] x86/hyperv: retrieve vp_index from
 Hyper-V
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
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyB3aWxsIGJlIHVzZWZ1bCB3aGVuIGludm9raW5nIGh5cGVyY2FsbCB0aGF0IHRhcmdldHMg
c3BlY2lmaWMKdmNwdShzKS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCnY1OgoxLiBBZGQgSmFuJ3MgQWNr
LgoKdjQ6CjEuIFVzZSBwcml2YXRlLmgKMi4gQWRkIFBhdWwncyByZXZpZXcgdGFnCgp2MjoKMS4g
Rm9sZCBpbnRvIHNldHVwX3BjcHVfYXJnIGZ1bmN0aW9uCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0
L2h5cGVydi9oeXBlcnYuYyAgfCA2ICsrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9w
cml2YXRlLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvaHlwZXJ2LmMKaW5kZXggNmI1ODA2NWM3OC4uZTMxYzRiMzBiOCAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYworKysgYi94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCkBAIC0zMSw2ICszMSw3IEBACiAKIHN0cnVjdCBtc19o
eXBlcnZfaW5mbyBfX3JlYWRfbW9zdGx5IG1zX2h5cGVydjsKIERFRklORV9QRVJfQ1BVX1JFQURf
TU9TVExZKHZvaWQgKiwgaHZfaW5wdXRfcGFnZSk7CitERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RM
WSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKIAogc3RhdGljIHVpbnQ2NF90IGdlbmVyYXRl
X2d1ZXN0X2lkKHZvaWQpCiB7CkBAIC0xMzUsNiArMTM2LDggQEAgc3RhdGljIHZvaWQgX19pbml0
IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCiAKIHN0YXRpYyBpbnQgc2V0dXBfaHlwZXJjYWxs
X3BjcHVfYXJnKHZvaWQpCiB7CisgICAgdWludDY0X3QgdnBfaW5kZXhfbXNyOworCiAgICAgaWYg
KCB0aGlzX2NwdShodl9pbnB1dF9wYWdlKSApCiAgICAgICAgIHJldHVybiAwOwogCkBAIC0xNDYs
NiArMTQ5LDkgQEAgc3RhdGljIGludCBzZXR1cF9oeXBlcmNhbGxfcGNwdV9hcmcodm9pZCkKICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CiAgICAgfQogCisgICAgcmRtc3JsKEhWX1g2NF9NU1JfVlBf
SU5ERVgsIHZwX2luZGV4X21zcik7CisgICAgdGhpc19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5k
ZXhfbXNyOworCiAgICAgcmV0dXJuIDA7CiB9CiAKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvcHJpdmF0ZS5oIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRl
LmgKaW5kZXggMDkzOTg1YTk0Yi4uZDE3NjVkNGYyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2d1ZXN0L2h5cGVydi9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9w
cml2YXRlLmgKQEAgLTI1LDUgKzI1LDYgQEAKICNpbmNsdWRlIDx4ZW4vcGVyY3B1Lmg+CiAKIERF
Q0xBUkVfUEVSX0NQVSh2b2lkICosIGh2X2lucHV0X3BhZ2UpOworREVDTEFSRV9QRVJfQ1BVKHVu
c2lnbmVkIGludCwgaHZfdnBfaW5kZXgpOwogCiAjZW5kaWYgLyogX19YRU5fSFlQRVJWX1BSSVZJ
QVRFX0hfXyAgKi8KLS0gCjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
