Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A3C104BB
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 06:25:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLglo-0005WM-UC; Wed, 01 May 2019 04:23:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9NrI=TB=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1hLgln-0005WH-33
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 04:22:59 +0000
X-Inumbo-ID: c9cedbd0-6bc8-11e9-9070-f77e1e4dfa56
Received: from mail-io1-f66.google.com (unknown [209.85.166.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9cedbd0-6bc8-11e9-9070-f77e1e4dfa56;
 Wed, 01 May 2019 04:22:53 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id v9so14066157iol.10
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 21:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pnkx+/EayRNj/o1kXOQxCwA7dIdk8c7+CV+voWvkCiA=;
 b=aVlR4qyw+wvXK6FB8+X7UA4EixF4QMPUnpMlsZLB5PdEH6Ied4YV0K+I5ubFG6QvK6
 s0nm1MIAux8shpzNJlYhy3JJbtkgPB1hBRfgT2L6uUptJofKVWtsbaQDMWkSaETtCEAt
 llDRUhs0bd+3GLR/OO0ASVKkpug3lOkJsieC21fYgqoY9IaTdnbGCtD51MxWVdA6zMx4
 oUD7c6jFBKS6cuxxsHnROF+it4S6dbignN//O15vP6hEjzFM247+hGx/wRhEyJbGHjvb
 II6iddsuVtaLI7VxZXscocizwenHEoTMFeHyqWAvNhlR2JZqscMWibe4HCIsOiNGrYh4
 G+ZA==
X-Gm-Message-State: APjAAAUYuCSwiZ5moij718/FPSLBf8YWkWEG9bDrT5X3PKT4SlYCyosv
 BtaNDnqCvqkvhImvGmXNZYK9f9ol
X-Google-Smtp-Source: APXvYqxoy8HtLNRpUT7CHcbGdbTCdx4qe9j9SRZKGoHq8CKeDPZt97+JfQHq6yRg95NoOBIo50t+Ww==
X-Received: by 2002:a5e:9203:: with SMTP id y3mr43803565iop.22.1556684572863; 
 Tue, 30 Apr 2019 21:22:52 -0700 (PDT)
Received: from localhost.localdomain (c-71-205-12-124.hsd1.co.comcast.net.
 [71.205.12.124])
 by smtp.gmail.com with ESMTPSA id e15sm7703351ios.19.2019.04.30.21.22.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 21:22:51 -0700 (PDT)
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 22:22:49 -0600
Message-Id: <20190501042249.1218-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/vm_event: correctly gather gs_shadow value
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHRoZSBnc19zaGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQ
VSBpcyBiZWluZyBzY2hlZHVsZWQKb3V0IGJ5IFhlbi4gUmVwb3J0aW5nIHRoaXMgKHVzdWFsbHkp
IHN0YWxlIHZhbHVlIHRocm91Z2ggdm1fZXZlbnQgaXMgaW5jb3JyZWN0LApzaW5jZSBpdCBkb2Vz
bid0IHJlcHJlc2VudCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRo
ZSBldmVudAp3YXMgcmVjb3JkZWQuIFRoaXMgcHJldmVudHMgdm1fZXZlbnQgc3Vic2NyaWJlcnMg
ZnJvbSBjb3JyZWN0bHkgZmluZGluZyBrZXJuZWwKc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hl
biBpdCBpcyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBM
ZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgpDYzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2Nh
cnVAYml0ZGVmZW5kZXIuY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUg
PHdlaS5saXUyQGNpdHJpeC5jb20+CkNjOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni92bV9ldmVudC5jIHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L3ZtX2V2ZW50LmMgYi94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwppbmRleCA1MWMzNDkzYjFk
Li40NDY0OTQwZGE3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvdm1fZXZlbnQuYworKysgYi94
ZW4vYXJjaC94ODYvdm1fZXZlbnQuYwpAQCAtMjM5LDcgKzIzOSw3IEBAIHZvaWQgdm1fZXZlbnRf
ZmlsbF9yZWdzKHZtX2V2ZW50X3JlcXVlc3RfdCAqcmVxKQogICAgIHZtX2V2ZW50X3BhY2tfc2Vn
bWVudF9yZWdpc3Rlcih4ODZfc2VnX2RzLCAmcmVxLT5kYXRhLnJlZ3MueDg2KTsKICAgICB2bV9l
dmVudF9wYWNrX3NlZ21lbnRfcmVnaXN0ZXIoeDg2X3NlZ19lcywgJnJlcS0+ZGF0YS5yZWdzLng4
Nik7CiAKLSAgICByZXEtPmRhdGEucmVncy54ODYuc2hhZG93X2dzID0gY3R4dC5zaGFkb3dfZ3M7
CisgICAgcmVxLT5kYXRhLnJlZ3MueDg2LnNoYWRvd19ncyA9IHJkZ3NzaGFkb3coKTsKICAgICBy
ZXEtPmRhdGEucmVncy54ODYuZHI2ID0gY3R4dC5kcjY7CiAjZW5kaWYKIH0KLS0gCjIuMjAuMQoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
