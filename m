Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42076978
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:52:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0bM-000889-VO; Fri, 26 Jul 2019 13:49:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yHJP=VX=gmail.com=viktor.mitin.19@srs-us1.protection.inumbo.net>)
 id 1hr0bL-000883-70
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:49:39 +0000
X-Inumbo-ID: 35697458-afac-11e9-8980-bc764e045a96
Received: from mail-io1-xd2b.google.com (unknown [2607:f8b0:4864:20::d2b])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 35697458-afac-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:49:37 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i10so104832613iol.13
 for <xen-devel@lists.xenproject.org>; Fri, 26 Jul 2019 06:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1eUDigaDLD9AJmz8uECrr+RIIeZq95zTz+mgLVAXf0M=;
 b=fyObXeAP+Y1IOSuhF9FCl1xZvpCzVnX7F8juocmTJkSDT/sQ6P1drHDwM4/gQ/9AT8
 LcUBIi+zAkvBwtaSKD0lNnpKjjRVRuBwZ+0+tihlj5DL0UsFcQ76PtmXJ9yYAnZZSBeO
 BzeX/gcrv7QFUrcFZy3ohvMB8X7SUkLV8fzP7UO2k6G6T43kLBzXVbJeF+ILVexDW1u4
 cvfcgsMzq5IoKih/x88HlAfYx8aHgqvehUW7Q1BH35ziQCCh8doR6j65eSc8eFicNTdY
 2tAtrMUXitXUI0guTz8Bd9wENh9PNbnw/2wwuh0s493p9csIR/kgb7rtxKS1ANWxjJQ+
 +EbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1eUDigaDLD9AJmz8uECrr+RIIeZq95zTz+mgLVAXf0M=;
 b=mF0Jt15vW21pUhfddnA7WbxFf2SAGJtvfI21f6E7lv8jKDgwvjoGCAbxYojTS6qQSh
 iCQrONYsXkGVH2yirABuMCkMsoc3VQWjmBodSC8bXTNW2IeXBPXnm4os9hQkkvdM6aDl
 7oDg7h4Y5KsllMO85loq1tiR753nmKQPHUx2ZPz/h9V0kC8nL+TD8Udrus+6EA9IYwNJ
 U+c1gp+tChWmYvpFGTM2+VGdbKD5rhWu1/9okydh9FI/8UNeD37pfJaTq2UOIQvXsTQh
 8D8BFcTV6soTKM4r3W380N+fXxRkfujfOixwKMygV/oRZIGWkVfNqInJidA6JBKJLTLR
 m3cg==
X-Gm-Message-State: APjAAAUEKEqDI+ig1JOaRp+lzLtiDl1s/fZCbk2Tpue5SdJ5wbsr0b7g
 HiyElvGQDmCfUfND9cQ73+F2Az/AIsmk1v2Mgdg=
X-Google-Smtp-Source: APXvYqxJqMvizSEoCMN2ox+erDeR4MfVQcR/F6WVEPRE+pJF923AUlJm8acy4rSQlGWB8DwpMl0RKKaBMqroBcgeVkI=
X-Received: by 2002:a02:c6a9:: with SMTP id o9mr41551656jan.90.1564148977433; 
 Fri, 26 Jul 2019 06:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAOcoXZavLnHhNc7mmHnO5Gi_vq-0j1FCgvpXh0NimAewXX8e1g@mail.gmail.com>
 <5B61E054-048E-46BF-9952-382FA65893EE@gmail.com>
 <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
In-Reply-To: <ab635236-6dac-0f8f-8bab-46ccbc9d47e2@arm.com>
From: Viktor Mitin <viktor.mitin.19@gmail.com>
Date: Fri, 26 Jul 2019 16:49:26 +0300
Message-ID: <CAOcoXZbns31zgCA6WY4Q=PcekcWDgHCj5qs-X+fgPnEzUnnaGQ@mail.gmail.com>
To: Julien Grall <julien.grall@arm.com>
Subject: Re: [Xen-devel] Xen Coding style and clang-format
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
Cc: Lars Kurth <lars.kurth.xen@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVsaWVuLAoKPiBJIGhhdmUgYWxyZWFkeSBkb25lIHNvbWUgdGVzdGluZ3MgYSBjb3VwbGUg
b2Ygd2Vla3MgYWdvIHdpdGggdGhlIHBhdGNoIFsxXS4gSQo+IGhhdmUgc2VudCBzb21lIGNvbW1l
bnRzIHJlZ2FyZGluZyB0aGUgY2hhbmdlIG1hZGUgYnkgdGhlIHRvb2xzIHRoYXQgcmVxdWlyZSBz
b21lCj4gYXR0ZW50aW9uLiBJdCB3b3VsZCBiZSBnb29kIGlmIHNvbWVvbmUgZ28gdGhyb3VnaCB0
aGVtIGFuZCB0cnkgdG8gYWRkcmVzcyBvbmUgYnkKPiBvbmUuIEZvciBjb252ZW5pZW5jZSBJIGhh
dmUgcmVwbGljYXRlZCBteSBlLW1haWwgcHVibGljbHkgYmVsb3cuCgo+IEkgd291bGQgbGlrZSB0
byBhbHNvIGRyYXcgdGhlIGF0dGVudGlvbiB0byB0aGUgdGhyZWFkIGZyb20gVGFtYXMgYWJvdXQg
LmFzdHlsZXJjCj4gKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94
ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMTE0NS5odG1sKS4KPgoKV2lsbCBnbyBvdmVyIHRoZSB0aHJl
YWQgZnJvbSBUYW1hcyBhYm91dCAuYXN0eWxlcmMgZmlyc3QgYW5kIHdpbGwgZ28Kb3ZlciB0aGUg
Y2FzZXMgeW91IG1lbnRpb25lZCBhZnRlciBpdC4gU2VlIG15IG5leHQgZW1haWxzIGFib3V0IGl0
LgoKVGhhbmtzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
