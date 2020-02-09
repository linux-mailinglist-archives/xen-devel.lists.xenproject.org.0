Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEEF156C05
	for <lists+xen-devel@lfdr.de>; Sun,  9 Feb 2020 19:22:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j0rBB-0005VY-28; Sun, 09 Feb 2020 18:19:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=umcO=35=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j0rB9-0005VT-Nj
 for xen-devel@lists.xenproject.org; Sun, 09 Feb 2020 18:19:35 +0000
X-Inumbo-ID: b95295e6-4b68-11ea-b05b-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b95295e6-4b68-11ea-b05b-bc764e2007e4;
 Sun, 09 Feb 2020 18:19:35 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so7997888wmi.5
 for <xen-devel@lists.xenproject.org>; Sun, 09 Feb 2020 10:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WdDVaA6A69qLJVP6r2t469tW9pcQlnUYoON5PVQgNDs=;
 b=Pujskf53DIX72MWnEkNKTszVThvNv+vxFkkzlPZTnt2Psfc4P57zkYRUzwTRowXhK3
 NLvuvMEr2qJ0r5vDWjZBzx5klMYefutNJq2afWSgSPyIUvEAd4p8jQac69A2Tre8aJAq
 m+UnmoLn0aZ82IVU6dKoAamLf7U1b5uEFnFiiQUzB1q78wheJgHZeN5h6AzYuY90kFkv
 1pCtJbgyzffDT+M8fwQOHzqwpb0+V8l+olEijkBhUe/ypbBfi1CBg1eDKpy7zBoe9rrX
 l/SgqeN/H+jzdY5pH2C9wLiynX7kcQ9onWde+m5Fv/acyfkgDXTHUrvsj2TZUkHYd5jd
 rYrA==
X-Gm-Message-State: APjAAAVco9qhcintOpEm07WoWORv/K3hHRcZ8/iOfP673B4/jaKm7Ibp
 ayY8RY7d6V3DuD98tONgjcw=
X-Google-Smtp-Source: APXvYqzxfG3DkRDTK5tZbADQWMrs/MkMZJDSpLo9Ouvir5DIBVc5T6nhS3Op3Ldq9fpVRVuQW+N0aQ==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr10382761wmk.15.1581272374204; 
 Sun, 09 Feb 2020 10:19:34 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-230.amazon.com.
 [54.240.197.230])
 by smtp.gmail.com with ESMTPSA id r6sm13223575wrq.92.2020.02.09.10.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2020 10:19:33 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>, xen-devel@lists.xenproject.org
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
 <20200201003303.2363081-5-dwmw2@infradead.org>
 <4eb039f7-597c-cc07-3fa9-29b60646ae7e@xen.org>
 <d58a4a99c83875b37f07f6e52d25ec943d35a554.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <717d3ef9-c7eb-572d-f891-77fbd6fd1781@xen.org>
Date: Sun, 9 Feb 2020 18:19:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <d58a4a99c83875b37f07f6e52d25ec943d35a554.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 5/8] xen/vmap: allow vmap() to be called
 during early boot
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

SGksCgpBbnN3cmluZyBiYWNrIHRvIHRoaXMgdGhyZWFkIGFzIHdlbGwsIHNvIGl0IGlzIGVhc2ll
ciB0byB0cmFjay4KCk9uIDAzLzAyLzIwMjAgMTY6MzcsIERhdmlkIFdvb2Rob3VzZSB3cm90ZToK
PiBPbiBNb24sIDIwMjAtMDItMDMgYXQgMTQ6MDAgKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
Pj4gSGkgRGF2aWQsCj4+Cj4+IE9uIDAxLzAyLzIwMjAgMDA6MzMsIERhdmlkIFdvb2Rob3VzZSB3
cm90ZToKPj4+IEZyb206IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4+Cj4+
IEkgYW0gYSBiaXQgY29uY2VybmVkIHdpdGggdGhpcyBjaGFuZ2UsIHBhcnRpY3VsYXJseSB0aGUg
Y29uc2VxdWVuY2UgdGhpcwo+PiBoYXZlIGZvciB0aGUgcGFnZS10YWJsZXMuIFRoZXJlIGlzIGFu
IGFzc3VtcHRpb24gdGhhdCBpbnRlcm1lZGlhdGUKPj4gcGFnZS10YWJsZXMgYWxsb2NhdGVkIHZp
YSB0aGUgYm9vdCBhbGxvY2F0b3Igd2lsbCBuZXZlciBiZSBmcmVlZC4KPj4KPj4gT24geDg2LCBh
IGNhbGwgdG8gdnVubWFwKCkgd2lsbCBub3QgZnJlZSBwYWdlLXRhYmxlcywgYnV0IGEgc3Vic2Vx
dWVudAo+PiBjYWxsIHRvIHZtYXAoKSBtYXkgZnJlZSBpdCBkZXBlbmRpbmcgb24gdGhlIG1hcHBp
bmcgc2l6ZS4gU28gd2Ugd291bGQKPj4gY2FsbCBmcmVlX2RvbWhlYXBfcGFnZXMoKSByYXRoZXIg
dGhhbiBpbml0X2hlYXBfcGFnZXMoKS4KPj4KPj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0
IGlzIHRoZSBmdWxsIGNvbnNlcXVlbmNlLCBidXQgSSB0aGluayB0aGlzIGlzCj4+IGEgY2FsbCBm
b3IgaW52ZXN0aWdhdGlvbiBhbmQgd3JpdGUgaXQgZG93biBhIHN1bW1hcnkgaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLgo+IAo+IFRoaXMgaXNuJ3QganVzdCBhYm91dCBwYWdlIHRhYmxlcywgcmlnaHQ/
IEl0J3MgYWJvdXQgKmFueSogYWxsb2NhdGlvbgo+IGdpdmVuIG91dCBieSB0aGUgYm9vdCBhbGxv
Y2F0b3IsIGJlaW5nIGZyZWVkIHdpdGggZnJlZV9oZWFwX3BhZ2VzKCkgPwoKVGhhdCdzIGNvcnJl
Y3QuCgo+IAo+IEdpdmVuIHRoZSBhbW91bnQgb2YgY29kZSB0aGF0IGhhcyBjb25kaXRpb25hbHMg
aW4gYm90aCBhbGxvYyBhbmQgZnJlZQo+IHBhdGhzIGFsb25nIHRoZSBsaW5lcyBvZuKApgo+IAo+
ICAgIGlmIChzeXN0ZW1fc3RhdGUgPiBTWVNfU1RBVEVfYm9vdCkKPiAgICAgICAgdXNlIHhlbmhl
YXAKPiAgICBlbHNlCj4gICAgICAgIHVzZSBib290IGFsbG9jYXRvcgo+IAo+IOKApiBJJ20gbm90
IHN1cmUgSSdkIHJlYWxseSB0cnVzdCB0aGUgYXNzdW1wdGlvbiB0aGF0IHN1Y2ggYSB0aGluZyBu
ZXZlcgo+IGhhcHBlbnM7IHRoYXQgbm8gcGFnZXMgYXJlIGV2ZXIgYWxsb2NhdGVkIGZyb20gdGhl
IGJvb3QgYWxsb2NhdG9yIGFuZAo+IHRoZW4gZnJlZWQgaW50byB0aGUgaGVhcC4KCkkgYmVsaWV2
ZSB0aGlzIGFzc3VtcHRpb24gaG9sZHMgb24gQXJtIGJlY2F1c2UgcGFnZS10YWJsZXMgYXJlIG5l
dmVyIApmcmVlZCBzbyBmYXIuIFRoZSBvbmx5IG90aGVyIGNhc2UgaXMgaW4gdGhlIEFDUEkgY29k
ZSAKKGFjcGlfb3NfZnJlZV9tZW1vcnkoKSkgYnV0IEkgdGhpbmsgaXQgd291bGQgcmVzdWx0IHRv
IGEgbGVhayBpbnN0ZWFkIAooc2VlIGlzX3htYWxsb2NfbWVtb3J5KCkpLgoKSSBoYWRuJ3QgcmVh
bGl6ZWQgdGhhdCB0aGlzIGFzc3VtcHRpb24gd2FzIG5vdCBob2xkaW5nIG9uIHg4NiA6KC4gCkFj
dHVhbGx5LCBmcm9tIHRoZSBkaXNjdXNzaW9uIG9uIHRoZSBNRk4gMCB0aHJlYWQsIGl0IGxvb2tz
IGxpa2UgeDg2IGlzIAphYnVzaW5nIHF1aXRlIGEgZmV3IGludGVyZmFjZSBpbiBwYWdlIGFsbG9j
LgoKU28gaWYgdGhpcyBpcyBub3RoaW5nIG5ldywgdGhpcyBwcm9iYWJseSB5ZXQgYW5vdGhlciBn
b29kIGZ1dHVyZSAKY2xlYW4tdXAvaGFyZGVuaW5nIGFzIGxvbmcgYXMgdGhlIGFzc3VtcHRpb24g
aG9sZCBvdXRzaWRlIG9mIHg4Ni4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
