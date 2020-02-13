Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 537DE15BCF5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:39:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Bqx-0001Dw-19; Thu, 13 Feb 2020 10:36:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2Bqv-0001Dr-C8
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:36:13 +0000
X-Inumbo-ID: a6edcce0-4e4c-11ea-b880-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6edcce0-4e4c-11ea-b880-12813bfff9fa;
 Thu, 13 Feb 2020 10:36:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m10so6786518wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 02:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6CkBFQ5NtTfm5hAFI42kZWS+Fc64YQwA9BcZSBpW+EM=;
 b=X4ASga1oWYFsTwrSzgmNUpQnzeA/v2IIjllt01aK1u6MN21GcH7QwNFAOVLddpwc0L
 l85CGaXhOqxslV2INPkHGkXXQCtC/N0goIrR8QQViY6xGwLzjCEn8wwa+hWtGQAzWCKk
 R3kEh5nQncGGolNOfdmmdblFDM5EldYvFZXA/H3mwfPPqdV8JLR2kT+t2D7lKatU35sx
 qBx+ATW77uqeKzhMpIpmO8IH1JhEcjADWkzXDLERFAo9m1Fu5JLwZ8cfwQAQlHoLFy0S
 665pNbMdOLyqnzAMjjH8Mz0tEmxe5GBSu6VCJTe7Hw0TgjQSKGoqMM0y6H+mE7bEmO+4
 ko7g==
X-Gm-Message-State: APjAAAWGqB2S/4wIK1MVZUZWimZITsWZotE4Y6G5LWsvTeNSvK6DWJtq
 TKvsrJcvgXElabWvfrQOeSI=
X-Google-Smtp-Source: APXvYqw+NpYtmonxWQncF8JO1dXfFH8ChNZGIhFA1CRGdYqgDerBpkaS7ageCoeJcYAWL1R6dACi9g==
X-Received: by 2002:a1c:9a56:: with SMTP id c83mr5178866wme.79.1581590170939; 
 Thu, 13 Feb 2020 02:36:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id k13sm2268720wrx.59.2020.02.13.02.36.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 02:36:09 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-4-dwmw2@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <c742911e-c2a1-3ade-b675-c16000e728e5@xen.org>
Date: Thu, 13 Feb 2020 11:36:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200201003303.2363081-4-dwmw2@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/8] xen/vmap: allow vm_init_type to be
 called during early_boot
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
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAwMS8wMi8yMDIwIDAxOjMyLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiAKPiBXZSB3YW50IHRvIG1vdmUg
dm1faW5pdCwgd2hpY2ggY2FsbHMgdm1faW5pdF90eXBlIHVuZGVyIHRoZSBob29kLCB0bwo+IGVh
cmx5IGJvb3Qgc3RhZ2UuIEFkZCBhIHBhdGggdG8gZ2V0IHBhZ2UgZnJvbSBib290IGFsbG9jYXRv
ciBpbnN0ZWFkLgo+IAo+IEFkZCBhbiBlbWFjcyBibG9jayB0byB0aGF0IGZpbGUgd2hpbGUgSSB3
YXMgdGhlcmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiAtLS0KPiAgIHhlbi9jb21tb24vdm1hcC5jIHwgMjIgKysrKysrKysrKysrKysrKysrKy0t
LQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vdm1hcC5jIGIveGVuL2NvbW1vbi92bWFwLmMKPiBp
bmRleCBmYWViYzFkZGYxLi4zNzkyMmY3MzViIDEwMDY0NAo+IC0tLSBhL3hlbi9jb21tb24vdm1h
cC5jCj4gKysrIGIveGVuL2NvbW1vbi92bWFwLmMKPiBAQCAtMzQsOSArMzQsMTUgQEAgdm9pZCBf
X2luaXQgdm1faW5pdF90eXBlKGVudW0gdm1hcF9yZWdpb24gdHlwZSwgdm9pZCAqc3RhcnQsIHZv
aWQgKmVuZCkKPiAgIAo+ICAgICAgIGZvciAoIGkgPSAwLCB2YSA9ICh1bnNpZ25lZCBsb25nKXZt
X2JpdG1hcCh0eXBlKTsgaSA8IG5yOyArK2ksIHZhICs9IFBBR0VfU0laRSApCj4gICAgICAgewo+
IC0gICAgICAgIHN0cnVjdCBwYWdlX2luZm8gKnBnID0gYWxsb2NfZG9taGVhcF9wYWdlKE5VTEws
IDApOwo+IC0KPiAtICAgICAgICBtYXBfcGFnZXNfdG9feGVuKHZhLCBwYWdlX3RvX21mbihwZyks
IDEsIFBBR0VfSFlQRVJWSVNPUik7Cj4gKyAgICAgICAgbWZuX3QgbWZuOwo+ICsgICAgICAgIGlu
dCByYzsKPiArCj4gKyAgICAgICAgaWYgKCBzeXN0ZW1fc3RhdGUgPT0gU1lTX1NUQVRFX2Vhcmx5
X2Jvb3QgKQo+ICsgICAgICAgICAgICBtZm4gPSBhbGxvY19ib290X3BhZ2VzKDEsIDEpOwo+ICsg
ICAgICAgIGVsc2UKPiArICAgICAgICAgICAgbWZuID0gcGFnZV90b19tZm4oYWxsb2NfZG9taGVh
cF9wYWdlKE5VTEwsIDApKTsKCkl0IGxvb2tzIGxpa2UgdGhlIGZ1bmN0aW9uIHdhcyBkb2luZyBh
IHByZXR0eSBiYWQgam9iIGF0IGNoZWNraW5nIHRoZSAKcmV0dXJuIHZhbHVlcyA6KC4KCkFzIHlv
dSBhZGQgYSBjaGVjayBmb3IgbWFwX3BhZ2VzX3RvX3hlbigpLCB3b3VsZCB5b3UgbWluZCB0byBh
ZGQgYW5vdGhlciAKb25lIGZvciBhbGxvY19kb21oZWFwX3BhZ2UoKT8KCk90aGVyIHRoYW4gdGhh
dCwgdGhlIGNvZGUgbG9va3MgZ29vZCB0byBtZS4KCj4gKyAgICAgICAgcmMgPSBtYXBfcGFnZXNf
dG9feGVuKHZhLCBtZm4sIDEsIFBBR0VfSFlQRVJWSVNPUik7Cj4gKyAgICAgICAgQlVHX09OKHJj
KTsKPiAgICAgICAgICAgY2xlYXJfcGFnZSgodm9pZCAqKXZhKTsKPiAgICAgICB9Cj4gICAgICAg
Yml0bWFwX2ZpbGwodm1fYml0bWFwKHR5cGUpLCB2bV9sb3dbdHlwZV0pOwo+IEBAIC0zMzAsMyAr
MzM2LDEzIEBAIHZvaWQgdmZyZWUodm9pZCAqdmEpCj4gICAgICAgICAgIGZyZWVfZG9taGVhcF9w
YWdlKHBnKTsKPiAgIH0KPiAgICNlbmRpZgo+ICsKPiArLyoKPiArICogTG9jYWwgdmFyaWFibGVz
Ogo+ICsgKiBtb2RlOiBDCj4gKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKPiArICogYy1iYXNpYy1v
ZmZzZXQ6IDQKPiArICogdGFiLXdpZHRoOiA0Cj4gKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAo+
ICsgKiBFbmQ6Cj4gKyAqLwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
