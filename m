Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD417C03C
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:30:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADwO-0001sc-HG; Fri, 06 Mar 2020 14:27:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5BnZ=4X=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jADwN-0001sX-8h
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:27:03 +0000
X-Inumbo-ID: 8bc13648-5fb6-11ea-8eb5-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8bc13648-5fb6-11ea-8eb5-bc764e2007e4;
 Fri, 06 Mar 2020 14:27:02 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id a13so2739409edh.3
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2020 06:27:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cg2tsH7HGvulrTZ8vkvSsyyc5g+u8BRvgkrYIjNl47E=;
 b=uZrxb/2NrayK6ENt/jXeguasggmwiJzjVYf4j4n9aBH9s+70xUO9Wi5JlFhNlY9V3q
 TD0TZ5OpPRsz3XDGxNLQ13EfxcfTmeS0hpSkWBLwF0Ehh7LAkTZs9fatGswSACMqoiSS
 aGQIgFiCR1dcLQcHspvKYrHNpe0xQBZoOrwdh318oFlGz2DsYM2R8odn/EFJojs+i77i
 IK3E6Q/DpRGcAs+b4iOrakD2H3klFP06FZkveuD+KXZ/CTDIfABqmRjcNTLohq+fyxcF
 xxM0zZwNA7Ysl8Bxt8A6oLvQjcNo7mZAJkXVnpLYDNiA/4fJ1gL6G+nZuz4SmZAjxuDF
 AOpw==
X-Gm-Message-State: ANhLgQ3iLVxch0SlA4hWlJ8ZrCzjX8U8cLta68WeWrvFosM1rUXv+Y9+
 kZLDZ7Fj25JP3PXuViUy2ZM=
X-Google-Smtp-Source: ADFU+vuGO0DUHtV7uxZgFW+sE0CEM4XvNvMHMjiNlCnHteigZuiY30KFE+q7OYGbH12ju5wG6M31Iw==
X-Received: by 2002:a17:906:6a97:: with SMTP id
 p23mr3232857ejr.110.1583504821675; 
 Fri, 06 Mar 2020 06:27:01 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-236.amazon.com.
 [54.240.197.236])
 by smtp.gmail.com with ESMTPSA id s19sm992119edi.93.2020.03.06.06.27.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2020 06:27:01 -0800 (PST)
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <xadimgnik@gmail.com>
References: <20200305124504.3564-1-pdurrant@amzn.com>
 <20200305124504.3564-6-pdurrant@amzn.com>
 <e2a3290b-cc0d-20c8-d11a-2ee3629ab339@suse.com>
 <001201d5f3b3$ba28a8a0$2e79f9e0$@xen.org>
 <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c192ccd1-daed-2e8c-36f1-adac6cd71822@xen.org>
Date: Fri, 6 Mar 2020 14:26:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3634fc48-5eff-c5d5-f634-e312ad33ab49@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 5/6] mm: add 'is_special_page' macro...
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Tamas K Lengyel' <tamas@tklengyel.com>, xen-devel@lists.xenproject.org,
 pdurrant@amzn.com, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDYvMDMvMjAyMCAxMzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDYu
MDMuMjAyMCAxMzozNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0KPj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVu
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaAo+Pj4gU2VudDogMDYgTWFyY2gg
MjAyMCAxMjoyMAo+Pj4gVG86IHBkdXJyYW50QGFtem4uY29tCj4+PiBDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz47IFdlaSBMaXUgPHdsQHhlbi5vcmc+Owo+Pj4gS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxr
b25yYWQud2lsa0BvcmFjbGUuY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT47IFBhdWwKPj4+IER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBJYW4gSmFj
a3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAKPj4+IDxnZW9y
Z2UuZHVubGFwQGNpdHJpeC5jb20+OyBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz47IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IHhlbi0KPj4+IGRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+IFN1
YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjMgNS82XSBtbTogYWRkICdpc19zcGVjaWFs
X3BhZ2UnIG1hY3JvLi4uCj4+Pgo+Pj4gT24gMDUuMDMuMjAyMCAxMzo0NSwgcGR1cnJhbnRAYW16
bi5jb20gd3JvdGU6Cj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+
Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPj4+PiBAQCAtMjA4Nywx
OSArMjA4NywyMiBAQCBzdGF0aWMgaW50IHNoX3JlbW92ZV9hbGxfbWFwcGluZ3Moc3RydWN0IGRv
bWFpbiAqZCwgbWZuX3QgZ21mbiwgZ2ZuX3QgZ2ZuKQo+Pj4+ICAgICAgICAgICAgKiBUaGUgcWVt
dSBoZWxwZXIgcHJvY2VzcyBoYXMgYW4gdW50eXBlZCBtYXBwaW5nIG9mIHRoaXMgZG9tJ3MgUkFN
Cj4+Pj4gICAgICAgICAgICAqIGFuZCB0aGUgSFZNIHJlc3RvcmUgcHJvZ3JhbSB0YWtlcyBhbm90
aGVyLgo+Pj4+ICAgICAgICAgICAgKiBBbHNvIGFsbG93IG9uZSB0eXBlZCByZWZjb3VudCBmb3IK
Pj4+PiAtICAgICAgICAgKiAtIFhlbiBoZWFwIHBhZ2VzLCB0byBtYXRjaCBzaGFyZV94ZW5fcGFn
ZV93aXRoX2d1ZXN0KCksCj4+Pj4gLSAgICAgICAgICogLSBpb3JlcSBzZXJ2ZXIgcGFnZXMsIHRv
IG1hdGNoIHByZXBhcmVfcmluZ19mb3JfaGVscGVyKCkuCj4+Pj4gKyAgICAgICAgICogLSBzcGVj
aWFsIHBhZ2VzLCB3aGljaCBhcmUgZXhwbGljaXRseSByZWZlcmVuY2VkIGFuZCBtYXBwZWQgYnkK
Pj4+PiArICAgICAgICAgKiAgIFhlbi4KPj4+PiArICAgICAgICAgKiAtIGlvcmVxIHNlcnZlciBw
YWdlcywgd2hpY2ggbWF5IGJlIHNwZWNpYWwgcGFnZXMgb3Igbm9ybWFsCj4+Pj4gKyAgICAgICAg
ICogICBndWVzdCBwYWdlcyB3aXRoIGFuIGV4dHJhIHJlZmVyZW5jZSB0YWtlbiBieQo+Pj4+ICsg
ICAgICAgICAqICAgcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoKS4KPj4+PiAgICAgICAgICAgICov
Cj4+Pj4gICAgICAgICAgIGlmICggIShzaGFkb3dfbW9kZV9leHRlcm5hbChkKQo+Pj4+ICAgICAg
ICAgICAgICAgICAgJiYgKHBhZ2UtPmNvdW50X2luZm8gJiBQR0NfY291bnRfbWFzaykgPD0gMwo+
Pj4+ICAgICAgICAgICAgICAgICAgJiYgKChwYWdlLT51LmludXNlLnR5cGVfaW5mbyAmIFBHVF9j
b3VudF9tYXNrKQo+Pj4+IC0gICAgICAgICAgICAgICAgICAgPT0gKGlzX3hlbl9oZWFwX3BhZ2Uo
cGFnZSkgfHwKPj4+PiArICAgICAgICAgICAgICAgICAgID09IChpc19zcGVjaWFsX3BhZ2UocGFn
ZSkgfHwKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgKGlzX2h2bV9kb21haW4oZCkgJiYg
aXNfaW9yZXFfc2VydmVyX3BhZ2UoZCwgcGFnZSkpKSkpICkKPj4+Cj4+PiBTaG91bGRuJ3QgeW91
IGRlbGV0ZSBtb3N0IG9mIHRoaXMgbGluZSwgYWZ0ZXIgdGhlIHByZXZpb3VzIHBhdGNoCj4+PiBj
b252ZXJ0ZWQgdGhlIGlvcmVxIHNlcnZlciBwYWdlcyB0byBQR0NfZXh0cmEgb25lcz8KPj4KPj4g
SSB0aG91Z2h0IHRoYXQgdG9vIG9yaWdpbmFsbHkgYnV0IHRoZW4gSSByZWFsaXNlIHdlIHN0aWxs
IGhhdmUgdG8KPj4gY2F0ZXIgZm9yIHRoZSAnbGVnYWN5JyBlbXVsYXRvcnMgdGhhdCBzdGlsbCBy
ZXF1aXJlIElPUkVRIHNlcnZlcgo+PiBwYWdlcyB0byBiZSBtYXBwZWQgdGhyb3VnaCB0aGUgcDJt
LCBpbiB3aGljaCBjYXNlIHRoZXkgd2lsbCBub3QKPj4gYmUgUEdDX2V4dHJhIHBhZ2VzLgo+IAo+
IE9oLCBpbmRlZWQuIChJIGRvbid0IHN1cHBvc2Ugd2UgY2FuIGV2ZXIgZG8gYXdheSB3aXRoIHRo
aXMgbGVnYWN5Cj4gbWVjaGFuaXNtPykKPiAKPj4+IEFsc28gSSBub3RpY2UgdGhpcyBjb25zdHJ1
Y3QgaXMgdXNlZCBieSB4ODYgY29kZSBvbmx5IC0gaXMgdGhlcmUKPj4+IGEgcGFydGljdWxhciBy
ZWFzb24gaXQgZG9lc24ndCBnZXQgcGxhY2VkIGluIGFuIHg4NiBoZWFkZXIgKGF0Cj4+PiBsZWFz
dCBmb3IgdGhlIHRpbWUgYmVpbmcpPwo+Pgo+PiBQR0NfZXh0cmEgcGFnZXMgYXJlIGNvbW1vbiBz
byBtYXliZSBpdCBpcyBiZXR0ZXIgb2ZmIGRlZmluZWQgaGVyZQo+PiBzbyBpdCBpcyBhdmFpbGFi
bGUgdG8gQVJNIGNvZGU/Cj4gCj4gVG8gYmUgaG9uZXN0LCBteSBxdWVzdGlvbiB3YXMgbWFpbmx5
IGJhc2VkIG9uIG1lIGJlaW5nIHB1enpsZWQgdGhhdAo+IEFybSAob3IgY29tbW9uKSBjb2RlIGRv
ZXNuJ3QgbmVlZCBhbnkgc3VjaCBhZGp1c3RtZW50LiBBcyBhIHJlc3VsdAo+IEknbSB3b25kZXJp
bmcgd2hldGhlciB0aGF0J3MganVzdCAibHVjayIgKGluIHdoaWNoIGNhc2UgSSdkIGFncmVlCj4g
dGhlIHBsYWNlbWVudCBjb3VsZCByZW1haW4gYXMgaXMpLCBvciB3aGV0aGVyIHRoZXJlJ3MgYSBk
ZWVwZXIKPiByZWFzb24gYmVoaW5kIHRoYXQsIGxhcmdlbHkgZ3VhcmFudGVlaW5nIEFybSB3b3Vs
ZCBhbHNvIG5ldmVyIG5lZWQKPiBpdC4KCmlzX3NwZWNpYWxfcGFnZSgpIGlzIHVzZWQgaW4gZmVh
dHVyZXMgdGhhdCBhcmUgbm90IHN1cHBvcnRlZCBvbiBBcm0geWV0IAooZS5nIG1pZ3JhdGlvbiku
IFNvIHdlIHdpbGwgbmVlZCBpdCBpbiB0aGUgZnV0dXJlIGFuZCB0aGVyZWZvcmUgdGhlIApoZWxw
ZXIgc2hvdWxkIGJlIGRlZmluZWQgaW4gY29tbW9uIGhlYWRlci4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
