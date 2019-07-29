Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230717866D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 09:36:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs09w-0000Yp-Ad; Mon, 29 Jul 2019 07:33:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61H9=V2=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hs09v-0000Yg-6n
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 07:33:27 +0000
X-Inumbo-ID: 2693a97f-b1d3-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2693a97f-b1d3-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 07:33:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id p17so57580990ljg.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SJ32Azs/wNvLJk/kDeesrUI/+6gZJYqAF9guXCcXb/0=;
 b=LL/1CbrCnKelZJ0TJh014qAu2pHQVtBDpuSjy8HQ6EqEP6hvDCe1Y7pUZWwvE5i1zk
 vIjVq1Kx7malb1nSY6ZDwjV75i7Jwd/Ste3DfXjbTUWWDro+YbgASEgVpqQzytSJ9qj8
 iB69c9kM2Fk5mRqlTqzCJdtxtlFQWSFWysWfrRB2K3rSDrhTYmcbtMKd3QMLCcHGZphv
 PUMbfHUitbFJg1m6tr2tmc8kfRoWNriB2KBqQTKLp1psRx14pDL8AqJPEyuPGsEIZu42
 9562TGGF09Wv7FNzXYBfEkO37whXg9WU4MMcquWAQc+A0Wz8OEdHiA+rlxDdYK1bPkcD
 B9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SJ32Azs/wNvLJk/kDeesrUI/+6gZJYqAF9guXCcXb/0=;
 b=IaHTuHJp0Oi3y2Arih4y/OYRTMnJghGpkQk404y5O0yKhNrCh9F0WUuvViFyz5EA4N
 Ee9aYmLoa0817WLYEHKC58cqy//CGpLzyqYmPWHqoIRo1Vd0VyQ/4L2t8xtTorAxjEX4
 tdEEXc1HpBfzR+z24zbx1mNu5ZS9ORTj+0LSPjmAAlWEmdFyy1OyfQKIe+xhxuKhakui
 9GOJKwdbYgRE4zD3O4ZNw4+jUNY8NI4ZwOnUNZWC9cRutjwlp1nUji5Ml5xLnIaWrYE5
 30JFZqVB+VAj0Ahtc4foJrsUVs5J2T+Qj/i7rEP+0GChmxdxLziSe3DHdTVK68KyOwsR
 rEPA==
X-Gm-Message-State: APjAAAV6wUwBJP5vQFC2PIsn8l//K0lY7pxP+TU2l/XFzoKG8xJ5jyaN
 xEib0RY2VMQ4KsUwli3bxfWPIaNq
X-Google-Smtp-Source: APXvYqx48RG5HAd6JxPA4eSgRLzF8MK+lPeXcAfWo6QFI+ttPuQooEsuZH8sGr3pTopkl9MHSuHJPQ==
X-Received: by 2002:a2e:8602:: with SMTP id a2mr54209149lji.206.1564385604358; 
 Mon, 29 Jul 2019 00:33:24 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d7sm10523461lfa.86.2019.07.29.00.33.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Jul 2019 00:33:23 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <18337bfe-c11e-899e-0ac9-90bb90491f21@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d2833b7c-798a-c6c6-c970-cf649db33155@gmail.com>
Date: Mon, 29 Jul 2019 10:33:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <18337bfe-c11e-899e-0ac9-90bb90491f21@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMjYuMDcuMTkgMTc6MDIsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBI
aSwKPiAKPiBJdCBsb29rcyBsaWtlIHRoZSB2bWFwIHNvbHV0aW9uIHN1Z2dlc3RlZCBieSBBbmRy
ZXcgJiBJIGlzIGEgZGVhZCBlbmQuIEkgc3RpbGwgdGhpbmsgd2UgbmVlZCB0byBkbyBzb21ldGhp
bmcgaW4gdGhlIHZtYXAgcmVnYXJkbGVzcyB0aGUgYWxpZ25tZW50IGRlY2lzaW9uIHRvIGF2b2lk
IHVud2FudGVkIHN1cnByaXNlZCAoaS5lIHRoZSBQYWdlLXRhYmxlIG5vdCBpbiBzeW5jIHdpdGgg
dGhlIHZtYXAgc3RhdGUpLgo+IAo+IFdlIHBvdGVudGlhbGx5IHdhbnQgdG8gYWRkIHNvbWUgQVNT
RVJUX1VOUkVBQ0hBQkxFKCkgaW4gdGhlIHBhZ2UtdGFibGUgY29kZSBmb3IgdGhlIHNhbml0eSBj
aGVjay4gU28gd2UgZG9uJ3QgY29udGludWUgd2l0aG91dCBmdXJ0aGVyIG9uIGRlYnVnIGJ1aWxk
LiBJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgYm90aC4KPiAKPiBBIGNvdXBsZSBvZiBjb21tZW50cyBm
b3IgdGhlIHBhdGNoLgo+IAo+IFRpdGxlOiBOSVQ6IE1pc3Npbmcgc3BhY2UgYWZ0ZXIgdGhlIGZp
cnN0IDouCj4gCj4gT24gMTgvMDcvMjAxOSAxNDoyMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4g
RnJvbTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KPj4KPj4gQWZ0ZXIg
Y2hhbmdlcyBpbnRyb2R1Y2VkIGJ5IDljYzA2MTggd2UgYXJlIGFibGUgdG8gdm1hcC92dW5tYXAK
PiAKPiA3LWRpZ2l0IGlzIG5vdCBzdWZmaWNpZW50IHRvIGd1YXJhbnRlZSBpdCB3aWxsIGJlIHVu
aXEgaW4gdGhlIGZ1dHVyZS4gWW91IGFsc28gd2FudCB0byBzcGVjaWZ5IHRoZSBjb21taXQgdGl0
bGUuCj4gCj4+IHBhZ2UgYWxpZ25lZCBhZGRyZXNzZXMgb25seS4KPj4gU28gaWYgd2UgYWRkIGEg
cGFnZSBhZGRyZXNzIHJlbWFpbmRlciB0byB0aGUgbWFwcGVkIHZpcnR1YWwgYWRkcmVzcywKPj4g
d2UgaGF2ZSB0byBtYXNrIGl0IG91dCBiZWZvcmUgdW5tYXBwaW5nLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IEFja2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsTEBhcm0uY29tPgo+IAo+IAo+IElmIHlvdSBhcmUg
aGFwcHkgd2l0aCB0aGUgY2hhbmdlcywgSSBjYW4gZG8gdGhlbSBvbiBjb21taXQuCgpJdCdzIGZp
bmUgd2l0aCBtZS4KVGhhbmsgeW91LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
