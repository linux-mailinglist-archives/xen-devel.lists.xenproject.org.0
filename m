Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CFD396B5
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 22:20:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZLIH-0007iO-Hl; Fri, 07 Jun 2019 20:16:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ezar=UG=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hZLIF-0007iJ-MA
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 20:16:55 +0000
X-Inumbo-ID: 30ae76b4-8961-11e9-8980-bc764e045a96
Received: from mail-pg1-x543.google.com (unknown [2607:f8b0:4864:20::543])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 30ae76b4-8961-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 20:16:53 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s27so1726155pgl.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2019 13:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ojd2/zcOkZigKxNfDxnvmo6BY1ZK5fUIs7jogtgkqYw=;
 b=ppZzpvqXzQgw2IGAj7T8VXU59HJmLm8melDw0zOOty0iSsfoBp1jHawzg/X6ieV1B3
 hN4A0I/5vi/L0M24DuPv/Dszn64B/uxtXsDuLd7OriaAhXzAzSxmQEX+qeTbrf5E0dXg
 FUrtnxFDT1FrCFkENlzYcfYw0YxmkmQqEs26kT/ThFQvWvcgS7rQkkWT4B2m9spqxPR2
 AmzQR9RbOd50nGE/k3FAiY6JBIkVX6Lb5GZ0djexQl6Ynz5UTP9ClVCJuV/iiNR4+gq4
 j2fQMxzIZAZbovkzvue1xRFJXLIPOaxipWLaEtls4k8r8EIP/CTAsiOGL8IEYeui/ZMK
 jg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ojd2/zcOkZigKxNfDxnvmo6BY1ZK5fUIs7jogtgkqYw=;
 b=VYG88C/CeWGORxzcR/UTQsbIG/DV8p2KPU8BMbiNRrLJzDn1d9qkjnVrs6HR2AWM0T
 zqom4nve/D+EkENmtMt55c7ZIOFbfNHf7wKTqxzvppZosnz0d/bEp2lri4WVFkYCgTbE
 76z4u38ClX8W2lnvRxP/fdv6dXyFgIMNrDwpIGXx0gBaq94d5oPf6QwOmBooXptkzrlA
 vCnV491iRwhQblUsERaq4G7ZYn7vZ+pNlepIKvT0Bo12yKK70wjFoKZ+t9JdEbqlvbKZ
 CvSLxdY6rSzLy8tcUshA/Bq7fVtGxBmUX5e/CiJ0zfq3yTpeUjMy4dDVHAxke2k2y74u
 iUIQ==
X-Gm-Message-State: APjAAAWMZhPskjAfH0hrwGfCS+fivu93fQDeXsTk5ndSrozidzQmZa78
 4TE0hRfQXgiGHNHy5EUvXXIVmrVL
X-Google-Smtp-Source: APXvYqwM4xDQ7xSPoWGk7JCfi5B3Mvcrr9MNarKwJKioiSPYDxqzadCTzw15y3gu2NdhkTRZhjF/qw==
X-Received: by 2002:aa7:82cd:: with SMTP id f13mr62627320pfn.203.1559938612455; 
 Fri, 07 Jun 2019 13:16:52 -0700 (PDT)
Received: from localhost.localdomain ([223.233.80.237])
 by smtp.gmail.com with ESMTPSA id a12sm4407502pgq.0.2019.06.07.13.16.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 07 Jun 2019 13:16:51 -0700 (PDT)
From: Amit Singh Tomar <amittomer25@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Sat,  8 Jun 2019 01:46:34 +0530
Message-Id: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: andre.przywara@arm.com, julien.grall@arm.com, sstabellini@kernel.org,
 peng.fan@nxp.com, Amit Singh Tomar <amittomer25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgdHJpZXMgdG8gZW5hYmxlIFhFTiBib290aW5nIG9uIGkuTVggOE1RdWFkIEFw
cGxpY2F0aW9ucyBQcm9jZXNzb3JzWzFdLgoKUGF0Y2gtc2V0IGluY2x1ZGVzIGRyaXZlciBmb3Ig
VUFSVCBjb250cm9sbGVyIGZvdW5kIG9uIGkuTVg4TVEgU29DIGFuZCBkZWJ1ZyBjb2RlCmZvciBl
YXJseXByaW50ayBzdXBwb3J0LgoKTWFpbmxpbmUgZHRzIGJpbmRpbmcgdGhhdCBhcmUgdXNlZCBm
b3IgcGxhdGZvcm0gZGlzY292ZXIgaGFzIEdQQyBhcyByb290IGludGVycnVwdCBwYXJlbnQgCmlz
IG5vdCB5ZXQgc3VwcG9ydGVkIGluIFhFTiwgdGhlcmVmb3JlIGZvbGxvd2luZyBjaGFuZ2VzIGlz
IG5lZWRlZCB0byBib290IFhFTiBvbiB0aGlzIHBsYXRmb3JtLgoKZGlmZiAtLWdpdCBhL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0
cy9mcmVlc2NhbGUvaW14OG1xLmR0c2kKaW5kZXggNmQ2MzViYS4uN2VhYzE3ODYgMTAwNjQ0Ci0t
LSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCisrKyBiL2FyY2gv
YXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2lteDhtcS5kdHNpCkBAIC0xMyw3ICsxMyw3IEBACiAj
aW5jbHVkZSAiaW14OG1xLXBpbmZ1bmMuaCIKIAogLyB7Ci0gICAgICAgaW50ZXJydXB0LXBhcmVu
dCA9IDwmZ3BjPjsKKyAgICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZnaWM+OwogCiAgICAgICAg
I2FkZHJlc3MtY2VsbHMgPSA8Mj47CiAgICAgICAgI3NpemUtY2VsbHMgPSA8Mj47CgpJdCBoYXMg
YmVlbiB0ZXN0ZWQgb24gbml0cm9nZW44bSBib2FyZFsyXSBieSBib290aW5nIGRvbTAgd2l0aCBS
QU1GUy4KClsxXTpodHRwczovL3d3dy5ueHAuY29tL3N1cHBvcnQvZGV2ZWxvcGVyLXJlc291cmNl
cy9ldmFsdWF0aW9uLWFuZC1kZXZlbG9wbWVudC1ib2FyZHMvaS5teC1ldmFsdWF0aW9uLWFuZC1k
ZXZlbG9wbWVudC1ib2FyZHMvZXZhbHVhdGlvbi1raXQtZm9yLXRoZS1pLm14LThtLWFwcGxpY2F0
aW9ucy1wcm9jZXNzb3I6TUNJTVg4TS1FVksKWzJdOmh0dHBzOi8vYm91bmRhcnlkZXZpY2VzLmNv
bS9wcm9kdWN0L25pdHJvZ2VuOG0vCgpBbWl0IFNpbmdoIFRvbWFyICgyKToKICB4ZW4vYXJtOiBB
ZGQgaS5NWDhNUSBTb0NzIGVhcmx5cHJpbnRrIHN1cHBvcnQKICB4ZW4vYXJtOiBBZGQgVUFSVCBk
cml2ZXIgZm9yIGkuTVg4TVEgU29DCgogeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteDhtcS5p
bmMgfCAgNTQgKysrKysrKwogeGVuL2RyaXZlcnMvY2hhci9LY29uZmlnICAgICAgICAgICAgfCAg
IDggKwogeGVuL2RyaXZlcnMvY2hhci9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwogeGVuL2Ry
aXZlcnMvY2hhci9pbXg4bXEtdWFydC5jICAgICAgfCAzMDYgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM2OSBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL2FybTY0L2RlYnVnLWlteDhtcS5pbmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vZHJpdmVycy9jaGFyL2lteDhtcS11YXJ0LmMKCi0tIAoyLjcuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
