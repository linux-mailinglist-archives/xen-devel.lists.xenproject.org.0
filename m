Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C7EBCB7D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 17:34:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCmmg-0007zM-SC; Tue, 24 Sep 2019 15:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y7zL=XT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iCmme-0007yg-W4
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 15:31:21 +0000
X-Inumbo-ID: 4d537486-dee0-11e9-8628-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by localhost (Halon) with ESMTPS
 id 4d537486-dee0-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 15:30:56 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r134so1740772lff.12
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2019 08:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=V6XOG/FGgPceH4HTM4sWnOAAklkg5JIV8JYjvkApJ8c=;
 b=FANQB+i9aEOe+stHUUD7tyJp9ibY8fuBk3gZ4WEp+5DUihyMVQLnPS6B3qrNz4wHRY
 vqj4cX13kP6WV8pKVfnY6cXXvZKTNMZn2BoiZ7qy0YUdEQUqO2fZV0IOZ9Ng+ceMj7m5
 MH4bX4Tiyv0uzuW+zA9FNri+WJPqmvz7pPoWybh6g+3/G/3+BjFlFXYKXlKieZQBaXP5
 ExNDCcAxKYKYpfWg98v+Bn15RcGx1aL4P1iyj767z1oVBZCYn+AsvHRDxFtXSXQEJ2fd
 ZyuX4XNSVxsBTzmhReG4YMz0HiZZ8l5qoHsUYxZqxsiJMvgbppkrbma94ep+qITCizY9
 f5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=V6XOG/FGgPceH4HTM4sWnOAAklkg5JIV8JYjvkApJ8c=;
 b=hH041laIlI+bIotwOeU2xicksCOYyikP6EyKGMeQr5na9b9MkuwBhnN7YxEk2FlLAs
 RtL4uxqIy8yWs8+tJBEABmhSwJE3mRcZkKj/hPsdRPdgG5ytwNzhBg7HDAwEd9Ay07Yk
 Z1YqvtFcdGR9F4yECDf1Qbx4vXPmgwaZLhU5nR+tIC3OVfilniaHVAnLZ3IaWJU9CtaY
 FPozAX0Pf1645NBSy73nK5PWa/a52fhLUHZRpkMvWuK9HC6cYWYH9L4mwITChhlVo5NT
 2BFhvYwKB3Kb5B4g4MiEyBzk+4QrW+Zdz+G8vBDpYl/gfi1LQ4J4z8q58YpDDFCHWcJd
 fjcA==
X-Gm-Message-State: APjAAAUTQ5XJFUDlNEqRvTiBB6W9O1WIJL8hvvkfLsiZe9Qz8f64bTnn
 ucTJFuBSYF5KTaeZaAvzZHBvIr1NGXc=
X-Google-Smtp-Source: APXvYqxPzMIKt3hU1+5rdmyp+simhX5pnXT+OfmtN+dGWFSSGs2JxlUOG0k+EiVGc5ISwVc9ozOefQ==
X-Received: by 2002:ac2:44b9:: with SMTP id c25mr2460096lfm.112.1569339055698; 
 Tue, 24 Sep 2019 08:30:55 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-74.141.223.85.sovam.net.ua.
 [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id z128sm525818lfa.1.2019.09.24.08.30.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 24 Sep 2019 08:30:55 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Sep 2019 18:30:25 +0300
Message-Id: <1569339027-19484-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
References: <1569339027-19484-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V5 6/8] iommu: Order the headers alphabetically
 in device_tree.c
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, volodymyr_babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQ2xlYW4gdXAgdGhlIGNvZGUgYSBiaXQgYnkgcHV0dGluZyB0aGUgaGVhZGVycyBpbiBhbHBo
YWJldGljYWwgb3JkZXIuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xl
a3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
ZGV2aWNlX3RyZWUuYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Rl
dmljZV90cmVlLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCmluZGV4
IDEyZjJjNGMuLjNmMzI4ZjQgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2Rl
dmljZV90cmVlLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYwpA
QCAtMTUsMTEgKzE1LDExIEBACiAgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9y
ZSBkZXRhaWxzLgogICovCiAKLSNpbmNsdWRlIDx4ZW4vbGliLmg+Ci0jaW5jbHVkZSA8eGVuL3Nj
aGVkLmg+CisjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+CiAjaW5jbHVkZSA8eGVuL2d1ZXN0
X2FjY2Vzcy5oPgogI2luY2x1ZGUgPHhlbi9pb21tdS5oPgotI2luY2x1ZGUgPHhlbi9kZXZpY2Vf
dHJlZS5oPgorI2luY2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KICNp
bmNsdWRlIDx4c20veHNtLmg+CiAKIHN0YXRpYyBzcGlubG9ja190IGR0ZGV2c19sb2NrID0gU1BJ
Tl9MT0NLX1VOTE9DS0VEOwotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
