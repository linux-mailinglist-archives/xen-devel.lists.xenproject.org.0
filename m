Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B91E0EE
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 12:56:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL3u1-0005Gx-Ik; Mon, 29 Apr 2019 10:52:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FDFM=S7=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1hL3u0-0005Gs-5f
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 10:52:52 +0000
X-Inumbo-ID: eee2aadb-6a6c-11e9-843c-bc764e045a96
Received: from mail-ot1-x343.google.com (unknown [2607:f8b0:4864:20::343])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eee2aadb-6a6c-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 10:52:50 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id e5so8145680otk.12
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2019 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KodRQaPtjNh3DiBATuPidHkqEjF8ZXa19VmvL6wRym0=;
 b=cn1dn3BFedhg9n9817H0NHvbtDTaJS5/bxxyHKatcOYQ+Y4MdFMG2BFe1phsKoTJ9n
 skE32oI6DpVHqKskIoz1W8XSBXHRfe2QSqb2rxdaOGouwPOPTy823KGW/eqIhaQaRbhA
 wpf6B4uzFUhu/AUjaF7v4WqSyCH4DXiBAC4l0Kq2W0Hox/GiMZpAzSc1FdkGkCjkJDgg
 tk9A5ZNzSeSqgiT8JE3OwDiaQ2MsjE+64ahnaqHzjY8FLH2ler9/96lMIcbalgkgDO5Z
 bmQEt3O/dtnqI8a/tYk7h0CA669S+2c5WZJHe2lXmrmYPovbjHSItv7sDyLcYjsJuVb6
 wQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KodRQaPtjNh3DiBATuPidHkqEjF8ZXa19VmvL6wRym0=;
 b=eg4UW9cDiZ+stwpkHTQPoIahmmFHaTut2QimxJdMerI1ufrbzP62zFYa8rAAX2976w
 XICjUUFygrFTilFDf3hFW/DsjVCwIp5n0l5sRzCg5VLoNgb1e6+IfKi00jMkJcLma3mR
 AuGqzoPETXkYB5AGgOkw6LuuLC9pvn0feAJRNBRHoZqg22v4Q6s+4jpv9E5lW/3nAwSS
 A2YxdwvHQyOZgQI09P7F4iH5rojyU+phci3KyJzuiR4qXHcz77QzRm2ky8Fi6SJiCKqy
 vipGfLLLPBpAfs/HZpzBHc7FFopNmH8jYewO8LHzz1YGTlX29baqIRQHv6LMgiPBzzUA
 hhRA==
X-Gm-Message-State: APjAAAXLr7gRIbOINT3hsFlNhk9UQHBgrUu66SCDLnx4zILKjBEiJ9VS
 7MhxDe40feRtRlzX03q7DaJLkTbPKf22B0Arlxk=
X-Google-Smtp-Source: APXvYqyUBtdgTdoa60QtUpjsU5lItbhhzy+JUWseVmIRjwWlEw3qz4NQ6h7248FUb7W61S35gYWdL1fiDQyj2ep7WYA=
X-Received: by 2002:a9d:6c07:: with SMTP id f7mr17342481otq.339.1556535170315; 
 Mon, 29 Apr 2019 03:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
 <20190415094139.25256f06@donnerap.cambridge.arm.com>
 <9055daf1-7ab7-f24f-01e8-09e33d503d02@arm.com>
 <CABHD4K-cbhcYm5xHmJZQJHD2xP0v6zUQr4cyGvpJC5TVAcki=w@mail.gmail.com>
 <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
In-Reply-To: <45f4b57a-eb74-ca4d-c9e3-6e9e1a1bca20@arm.com>
From: Amit Tomer <amittomer25@gmail.com>
Date: Mon, 29 Apr 2019 16:22:38 +0530
Message-ID: <CABHD4K_XCtRbVX17L3v2JbV5NcGwLZd7Medc-qdg=23Z=rtLdw@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCj4KPiBUaGUgcHJvcGVyIHdheSBpcyB0byBkZXRlY3QgUFBJIGJlZm9yZSBoYW5kIGFu
ZCBjb21wbGV0ZWx5IHNraXAgdGhlIG5vZGUgaWYgYW55LgoKSSB0cmllZCB0aGUgZm9sbG93aW5n
IGNoYW5nZToKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKaW5kZXggZDk4MzY3Ny4uYTllY2ZlZCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCisrKyBiL3hlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYwpAQCAtMTM1Myw3ICsxMzUzLDcgQEAgc3RhdGljIGludCBfX2luaXQgaGFuZGxlX25v
ZGUoc3RydWN0IGRvbWFpbiAqZCwKc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKICAgICAgICAg
eyAvKiBzZW50aW5lbCAqLyB9LAogICAgIH07CiAgICAgc3RydWN0IGR0X2RldmljZV9ub2RlICpj
aGlsZDsKLSAgICBpbnQgcmVzOworICAgIGludCByZXMsIGlycV9pZDsKICAgICBjb25zdCBjaGFy
ICpuYW1lOwogICAgIGNvbnN0IGNoYXIgKnBhdGg7CgpAQCAtMTM5OSw2ICsxMzk5LDE2IEBAIHN0
YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsCnN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sCiAgICAgICAgIHJldHVybiAwOwogICAgIH0KCisgICAgLypTa2lwIHRo
ZSBub2RlLCB1c2luZyBQUEkgc291cmNlICovCisgICAgaXJxX2lkID0gcGxhdGZvcm1fZ2V0X2ly
cShub2RlLCAwKTsKKworICAgIGlmICggaXJxX2lkID4gMTYgJiYgaXJxX2lkIDwgMzIgKQorICAg
IHsKKyAgICAgICAgZHRfZHByaW50aygiIFNraXAgbm9kZSB3aXRoIChQUEkgc291cmNlKVxuIik7
CisgICAgICAgIHJldHVybiAwOworICAgIH0KKworCgpBZnRlciBib290aW5nIGRvbTAsIGRvbid0
IHNlZSBQTVUgbm9kZSBpcyBnZXR0aW5nIGdlbmVyYXRlZChpdHMKc2tpcHBlZCBjb21wbGV0ZWx5
IG5vdykuCgpUaGFua3MsCi1BbWl0LgoKCgo+IEp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
