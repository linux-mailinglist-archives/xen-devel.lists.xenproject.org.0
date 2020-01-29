Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4FD14D284
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 22:29:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwurh-0004tU-EA; Wed, 29 Jan 2020 21:27:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tCRk=3S=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iwurg-0004tP-Cp
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 21:27:12 +0000
X-Inumbo-ID: 1c5aaf36-42de-11ea-b211-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c5aaf36-42de-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 21:27:11 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p9so1382535wmc.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 13:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qlAK6HllJT223m2933Q+oTvbox7F2CTZS/J2OKN2qzc=;
 b=BENRhFhomchtaZs2HEs1m5gRme5rh1cyKC+/uqtCwcYLm8WnbiqDbYZMmngLePvztZ
 Zi5NWrhSIuNwjVm+WTfIGgDaC2NykLJ05XGcdzfA11SgDD3L3fIRjDO8kZUqguF2JrT/
 hzfcbmXvrP9VFbG6T9tWGrHUi8HP4BUsIU54KWO44/8nEaXnPLJpfpzA1/kxTag0TAxz
 EA4FPSkjbO8iztztV/0Dx7OWd7EWbl18XEaJCChSiBhXTc1gWDrkxtRDmstgAdZN5hXU
 ujduMFNgFGbjpIX+QeEbCMC+v5ZqBAwMcywINntODnq9XI2ZvQYotyChR0I3bXAZEiwp
 H4lQ==
X-Gm-Message-State: APjAAAUruObT40Drk42jRzEVOo+04FWbyv4navW+43DPAUMWULdjRWPz
 QeJsdICpCV32WbTNFT+0990=
X-Google-Smtp-Source: APXvYqzHalbubpXQcW8gOA3qguyrxKupFz5lPEuk+VnpUS+RIyPKUciFt6bJE3eHCW0ab7N1E5HfVA==
X-Received: by 2002:a1c:1fd0:: with SMTP id f199mr1120497wmf.113.1580333231041; 
 Wed, 29 Jan 2020 13:27:11 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id g2sm4422849wrw.76.2020.01.29.13.27.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2020 13:27:10 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20200121143926.125116-1-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <95cf666a-a3d1-10f3-ab8a-22fd622ce114@xen.org>
Date: Wed, 29 Jan 2020 21:27:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121143926.125116-1-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Implement GICD_IGRPMODR as RAZ/WI
 for VGICv3
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmVmZiwKCk9uIDIxLzAxLzIwMjAgMTQ6MzksIEplZmYgS3ViYXNjaWsgd3JvdGU6Cj4gVGhl
IFZHSUN2MyBtb2R1bGUgZG9lcyBub3QgaW1wbGVtZW50IHNlY3VyaXR5IGV4dGVuc2lvbnMgZm9y
IGd1ZXN0cy4KPiBGdXJ0aGVybW9yZSwgcGVyIHRoZSBBUk0gR2VuZXJpYyBJbnRlcnJ1cHQgQ29u
dHJvbGxlciBBcmNoaXRlY3R1cmUKPiBTcGVjaWZpY2F0aW9uIChBUk0gSUhJIDAwNjlFKSwgc2Vj
dGlvbiA5LjkuMTUsIHRoZSBHSUNEX0lHUlBNT0RSCj4gcmVnaXN0ZXIgc2hvdWxkIGJlIFJBWi9X
SSB0byBub24tc2VjdXJlIGFjY2Vzc2VzIHdoZW4gR0lDRF9DVExSLkRTID0gMC4KPiBUaGlzIGlt
cGxlbWVudHMgdGhlIEdJQ0RfSUdSUE1PRFIgcmVnaXN0ZXIgZm9yIGd1ZXN0IFZNcyBhcyBSQVov
V0ksIHRvCj4gYXZvaWQgYSBkYXRhIGFib3J0IGluIHRoZSBjYXNlIHRoZSBndWVzdCBhdHRlbXB0
cyB0byByZWFkIG9yIHdyaXRlIHRoZQo+IHJlZ2lzdGVyLgoKUGVyIHRoZSBzcGVjLCBhbGwgcmVz
ZXJ2ZWQgcmVnaXN0ZXJzIHNob3VsZCBiZSBSQVovV0kuIFNvIGhvdyBhYm91dCAKaW1wbGVtZW50
aW5nIHRoZSBkZWZhdWx0IGNhc2UgYXMgcmVhZF9hc196ZXJvL3dyaXRlX2lnbm9yZT8KClRoaXMg
d291bGQgYWxzbyBjb3ZlciBzb21lIHByb2JsZW0gdGhhdCBtYXkgYXJpc2Ugd2l0aCBmdXR1cmUg
TGludXguIEkgCmhhdmUgYWN0dWFsbHkgYmVlbiB0b2xkIHRoYXQgTGludXggd2lsbCBhY2Nlc3Mg
cmVnaXN0ZXJzIChJSVJDIEdJQ3Y0IApzcGVjaWZpYykgdGhhdCBtYXkgbm90IGhhdmUgYmVlbiBp
bXBsZW1lbnRlZCBieSBYZW4gYW5kIHNob3VsZCBiZSBSQVovV0kuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
