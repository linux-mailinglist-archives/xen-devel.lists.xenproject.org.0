Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1596861
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2019 20:13:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i08ae-0006F8-PO; Tue, 20 Aug 2019 18:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3t4G=WQ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1i08ad-0006EN-1v
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2019 18:10:39 +0000
X-Inumbo-ID: c1aca482-c375-11e9-92eb-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1aca482-c375-11e9-92eb-bc764e2007e4;
 Tue, 20 Aug 2019 18:10:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x4so6008554ljj.6
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2019 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sV0qWOJ/GW8oUNxPGEM0VlC++QHpUA9IjU7eh2HiTNI=;
 b=sDWuV3CLcTj+dEOKd4Sk+aTpOrNigFGNDIQF/vFn6cZ7LGNciue8yu2CZ4mu5w7N9S
 rx26bnfN3eGk2BkrP1gnFdo/9r5har2oFwZ29gMQpkTY9N+TZjEGH3CKxeEHk81TI305
 KCAWf9F2LteMxTVykF9fxo80TRi6bGPbKmSOXAckp3ahB1JE4jOlkx7p0MzSguWfy8O6
 6xDuu2NI7esH9NTrsaJQopKVf6F4RR+91+UDmKdpy0vQMdVwypb62wbTzdr3NeOAt8QX
 OhKEsgN21ZEebh4kMaIEaK6B3j3psle9NdoA/LYjEd42pDsdV8AtNMAAutQFk8ocH0dW
 uscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sV0qWOJ/GW8oUNxPGEM0VlC++QHpUA9IjU7eh2HiTNI=;
 b=goLoF1ZEGvzFWvG1XefFJX+RMOcfjnAaZgDUU1uFV5CUWBMvo69qdp4ZveDZ+Gz6Vg
 8PiJ622CdTqZCN2B8WXIwYEdWYEZ4D1tHYBYQ/EhnUgBHFJok/l717rZJxFYAaOa7Avs
 4uRWdXIAUwxXvVfbS4Ys6aAY8MRRSgj7lMnk2zXN/u1UCaRK82PWece6XgKz7lISWt9h
 E4unngcvaYMQZCNzuo/UEs+3dk3VlQsrZtkAXdmnfZO0pp5im2f3JvkVbzyGWb6QOBrc
 2HLnDNO8uEl92HB5YUDiXyRUx8R4KbIGCNfwx5CG+I/NBsdgmxPplv2eUisPaYnQ/ke7
 o+cQ==
X-Gm-Message-State: APjAAAWcjasgWaiKJbS7LHPxaW1YpxK+DtJ6mADx/BtDSrMEGVCsaM4D
 1rwpB0ZKogIW02cxoKdKdxQ4eIK9
X-Google-Smtp-Source: APXvYqzIEMJh06GJk1sgEmwG3QUtQ/zCkKBXI2zw37mrTWmpDQQkoht079jCv2Pi32tw5D/EXssDew==
X-Received: by 2002:a2e:89c8:: with SMTP id c8mr17272564ljk.138.1566324613373; 
 Tue, 20 Aug 2019 11:10:13 -0700 (PDT)
Received: from otyshchenko.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id f6sm2900642lja.16.2019.08.20.11.10.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 20 Aug 2019 11:10:12 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 20 Aug 2019 21:09:45 +0300
Message-Id: <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
Subject: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
PgoKQWNjb3JkaW5nIHRvIHRoZSBnZW5lcmljIElPTU1VIERUIGJpbmRpbmdzIFsxXSB0aGUgY29u
dGV4dCBvZgpyZXF1aXJlZCBwcm9wZXJ0aWVzIGZvciBJT01NVSBkZXZpY2UvbWFzdGVyIG5vZGUg
KCNpb21tdS1jZWxscywgaW9tbXVzKQpkZXBlbmRzIG9uIG1hbnkgZmFjdG9ycyBhbmQgaXMgcmVh
bGx5IGRyaXZlciBkZXBlbmRlZCB0aGluZy4KCldlIG5lZWQgc29tZSB3YXkgdG8gcHJvdmlkZSB0
aGUgZHJpdmVyIHdpdGggRFQgSU9NTVUgc3BlY2lmaWVyIHdoaWNoCmRlc2NyaWJlcyB0aGUgSU9N
TVUgbWFzdGVyIGludGVyZmFjZXMgb2YgdGhhdCBkZXZpY2UgKGRldmljZSBJRHMsIGV0YykKdG8g
bGV0IGl0IGRlY2lkZSBob3cgdG8gaW50ZXJwcmV0IHRoZW0uIEZvciB0aGF0IHJlYXNvbiB3ZSBj
YW4gYm9ycm93CkxpbnV4J3MgIm9mX3hsYXRlIiBjYWxsYmFjay4KCkFsbCBJT01NVSBkcml2ZXJz
IHdoaWNoIHN1cHBvcnQgZ2VuZXJpYyBJT01NVSBEVCBiaW5kaW5ncyBzaG91bGQgdXNlCnRoaXMg
Y2FsbGJhY2suCgpTdWJzZXF1ZW50IHBhdGNoZXMgd2lsbCB1c2Ugb2YgdGhhdCBzdXBwb3J0LgoK
WzFdIGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9pb21tdS9pb21tdS50eHQKClNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hl
bmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KQ0M6IEp1bGllbiBHcmFsbCA8anVs
aWVuLmdyYWxsQGFybS5jb20+CkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0t
LQogeGVuL2luY2x1ZGUveGVuL2lvbW11LmggfCAxMCArKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5o
IGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKaW5kZXggNDhmODc0OC4uNzliODZhYyAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgKQEAgLTI0MCw2ICsyNDAsMTYgQEAgc3RydWN0IGlvbW11X29wcyB7CiAgICAgaW50IF9fbXVz
dF9jaGVjayAoKmlvdGxiX2ZsdXNoX2FsbCkoc3RydWN0IGRvbWFpbiAqZCk7CiAgICAgaW50ICgq
Z2V0X3Jlc2VydmVkX2RldmljZV9tZW1vcnkpKGlvbW11X2dyZG1fdCAqLCB2b2lkICopOwogICAg
IHZvaWQgKCpkdW1wX3AybV90YWJsZSkoc3RydWN0IGRvbWFpbiAqZCk7CisKKyNpZmRlZiBDT05G
SUdfSEFTX0RFVklDRV9UUkVFCisgICAgLyoKKyAgICAgKiBBbGwgSU9NTVUgZHJpdmVycyB3aGlj
aCBzdXBwb3J0IGdlbmVyaWMgSU9NTVUgRFQgYmluZGluZ3Mgc2hvdWxkIHVzZQorICAgICAqIHRo
aXMgY2FsbGJhY2suIFRoaXMgaXMgYSB3YXkgZm9yIHRoZSBmcmFtZXdvcmsgdG8gcHJvdmlkZSB0
aGUgZHJpdmVyCisgICAgICogd2l0aCBEVCBJT01NVSBzcGVjaWZpZXIgd2hpY2ggZGVzY3JpYmVz
IHRoZSBJT01NVSBtYXN0ZXIgaW50ZXJmYWNlcyBvZgorICAgICAqIHRoYXQgZGV2aWNlIChkZXZp
Y2UgSURzLCBldGMpLgorICAgICAqLworICAgIGludCAoKm9mX3hsYXRlKShkZXZpY2VfdCAqZGV2
LCBzdHJ1Y3QgZHRfcGhhbmRsZV9hcmdzICphcmdzKTsKKyNlbmRpZgogfTsKIAogI2luY2x1ZGUg
PGFzbS9pb21tdS5oPgotLSAKMi43LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
