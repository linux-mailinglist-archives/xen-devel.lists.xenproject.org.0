Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEEF150865
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 15:30:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iycih-0004Hr-CX; Mon, 03 Feb 2020 14:28:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIUd=3X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iycif-0004Hm-FS
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 14:28:57 +0000
X-Inumbo-ID: 827eff18-4691-11ea-8e66-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 827eff18-4691-11ea-8e66-12813bfff9fa;
 Mon, 03 Feb 2020 14:28:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so18437545wrw.8
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2020 06:28:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VFGqMBhyVe86oD/YXG545b+IvybpBneXrfGuGca5exU=;
 b=cR57HRpSk8dcQGjds5ufd3F5t9TlSXl2lfgjMMeIqKSEG1lI7VHOSW30t7NGau93WC
 NCjr0PogKOhzCF9MGWPnANUaIMpP6VBLGszifx4NEKlOZQmEvpp08S5BFX+TefpJepIa
 GuwLaTBAThFUn4Aaoqju6/dIS69m3X9kJj/P7eMzPLVJqTdst+LFcrm2yiGPWrbGcHcA
 YWCJfQw75Uf2XLvHaWvb4wwCmd2+IzXW1hb7NnvXtqMrsH1ohAZ69IF3FGw1kZG2gdS3
 utdGYM7wr6IENzDni81On2uvskHE5q1xbuh1Xhr4gOKT9f0746Oiw4i0MFLTlKr6lvtH
 FgVg==
X-Gm-Message-State: APjAAAWGgPKai1Tyz3f2oNFJ7SvYbZtofSTq+mVOa/WWefvf468g431E
 hRdhf0vko94L0Fwh6rH58mk=
X-Google-Smtp-Source: APXvYqzTSe6NPhvjlFIjjzq3oQcooqw3qkw05gbxWOFcDLCSS1L+lFMihW9GJtQ9NeoMxpmvWcal/g==
X-Received: by 2002:adf:e68d:: with SMTP id r13mr15680868wrm.349.1580740135863; 
 Mon, 03 Feb 2020 06:28:55 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id k13sm24946759wrx.59.2020.02.03.06.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Feb 2020 06:28:55 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-8-dwmw2@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <8032df0f-062d-dfdd-04c9-7cf6d2f53448@xen.org>
Date: Mon, 3 Feb 2020 14:28:54 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-8-dwmw2@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 8/8] x86/setup: lift dom0 creation out into
 create_dom0() function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwMS8wMi8yMDIwIDAwOjMzLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4gICAgICAgaWYg
KCB4ZW5fY3B1aWRsZSApCj4gICAgICAgICAgIHhlbl9wcm9jZXNzb3JfcG1iaXRzIHw9IFhFTl9Q
Uk9DRVNTT1JfUE1fQ1g7Cj4gICAKPiArICAgIHByaW50aygiJXNOWCAoRXhlY3V0ZSBEaXNhYmxl
KSBwcm90ZWN0aW9uICVzYWN0aXZlXG4iLAo+ICsgICAgICAgICAgIGNwdV9oYXNfbnggPyBYRU5M
T0dfSU5GTyA6IFhFTkxPR19XQVJOSU5HICJXYXJuaW5nOiAiLAo+ICsgICAgICAgICAgIGNwdV9o
YXNfbnggPyAiIiA6ICJub3QgIik7Cj4gKwoKVGhlIHBsYWNlbWVudCBvZiBwcmludGsgc2hvdWxk
bid0IG1hdHRlciBidXQgdGhlIGNoYW5nZSBmZWVscyBhIGJpdCAKb3V0LW9mLWNvbnRleHQuIFdv
dWxkIHlvdSBtaW5kIHRvIGV4cGxhaW4gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPwoKPiAgICAg
ICBpbml0cmRpZHggPSBmaW5kX2ZpcnN0X2JpdChtb2R1bGVfbWFwLCBtYmktPm1vZHNfY291bnQp
Owo+ICAgICAgIGlmICggaW5pdHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50ICkKPiAgICAgICAgICAg
aW5pdHJkID0gbW9kICsgaW5pdHJkaWR4Owo+IEBAIC0xODAxLDM0ICsxODM2LDE0IEBAIHZvaWQg
X19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCj4gICAgICAg
ICAgICAgICAgICAiTXVsdGlwbGUgaW5pdHJkIGNhbmRpZGF0ZXMsIHBpY2tpbmcgbW9kdWxlICMl
dVxuIiwKPiAgICAgICAgICAgICAgICAgIGluaXRyZGlkeCk7Cj4gICAKPiAtICAgIC8qCj4gLSAg
ICAgKiBUZW1wb3JhcmlseSBjbGVhciBTTUFQIGluIENSNCB0byBhbGxvdyB1c2VyLWFjY2Vzc2Vz
IGluIGNvbnN0cnVjdF9kb20wKCkuCj4gLSAgICAgKiBUaGlzIHNhdmVzIGEgbGFyZ2UgbnVtYmVy
IG9mIGNvcm5lciBjYXNlcyBpbnRlcmFjdGlvbnMgd2l0aAo+IC0gICAgICogY29weV9mcm9tX3Vz
ZXIoKS4KPiAtICAgICAqLwo+IC0gICAgaWYgKCBjcHVfaGFzX3NtYXAgKQo+IC0gICAgewo+IC0g
ICAgICAgIGNyNF9wdjMyX21hc2sgJj0gflg4Nl9DUjRfU01BUDsKPiAtICAgICAgICB3cml0ZV9j
cjQocmVhZF9jcjQoKSAmIH5YODZfQ1I0X1NNQVApOwo+IC0gICAgfQo+IC0KPiAtICAgIHByaW50
aygiJXNOWCAoRXhlY3V0ZSBEaXNhYmxlKSBwcm90ZWN0aW9uICVzYWN0aXZlXG4iLAo+IC0gICAg
ICAgICAgIGNwdV9oYXNfbnggPyBYRU5MT0dfSU5GTyA6IFhFTkxPR19XQVJOSU5HICJXYXJuaW5n
OiAiLAo+IC0gICAgICAgICAgIGNwdV9oYXNfbnggPyAiIiA6ICJub3QgIik7Cj4gLQoKWy4uLl0K
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
