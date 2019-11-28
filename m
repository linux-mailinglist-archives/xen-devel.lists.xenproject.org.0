Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3A610C63F
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 10:55:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGU7-0003oX-Ga; Thu, 28 Nov 2019 09:53:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yOAp=ZU=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iaGU6-0003oS-FO
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 09:53:14 +0000
X-Inumbo-ID: e45e3c96-11c4-11ea-a3cd-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e45e3c96-11c4-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 09:53:13 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id n5so10961651wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2019 01:53:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6aLzUV0qayS7qjYaBnPDOvkHXkMPEmGUKZ8HZr0z98I=;
 b=UzNwpKN16E65i59CFxt77Gv7PRrvVHqEsmjiF3eIUDN4Ln0zce49+tUMkf9/2/snsn
 rb5FPDejwJlhNcS3BMkpLmNVhxsznHjO8AHkatPMrgQtpl30RUv1TE1GuecHp76ACsPZ
 a84twumfw3aA+m8BEUGXcILZiY/F2EMm6JboZFUX24eOrrb5PpTTzYx3iJKJUNS6HKDA
 BxXcRJMYQjvpUUi9YyG0fb44U8mdZ8kSeh4Wh0CJIhJVXgq0/tz3YExDnWnJY6VOTstg
 E9TxsdblM+4v9hYJoo6Q7oPjqrCjXs4iGvPnhRkx1becw16bFZ6ONiICWO+3ryNzd3tG
 ArYA==
X-Gm-Message-State: APjAAAVMdUfI6pCJWtAhRk2nv8Ar9mldJ9qy22niuM6hZcvcHfY2wJT9
 bvL4yrUWEBNkDXICrYpS6ok=
X-Google-Smtp-Source: APXvYqxqyjaAc/5omJy/sTmrEms/FREYZqFPCfGU4z7BIgzQj29LS5ny80Ylz4eZECfFLJ+GAFFcrw==
X-Received: by 2002:a1c:9c82:: with SMTP id f124mr9175937wme.25.1574934792723; 
 Thu, 28 Nov 2019 01:53:12 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id p9sm22485507wrs.55.2019.11.28.01.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2019 01:53:11 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@gmail.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
 <20191115201037.44982-3-stewart.hildebrand@dornerworks.com>
 <alpine.DEB.2.21.1911261418240.8205@sstabellini-ThinkPad-T480s>
 <CAF3u54B5GHVFkmghDPYhO+W4Z3L6bMqg2MnPvvpr7J+FDNq5Xg@mail.gmail.com>
 <alpine.DEB.2.21.1911271039110.27669@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <3ec78c10-bea6-ce22-e77e-2b24b036d8d9@xen.org>
Date: Thu, 28 Nov 2019 09:53:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911271039110.27669@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [XEN PATCH v3 07/11] xen: arm: vgic: allow delivery
 of PPIs to guests
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOC8xMS8yMDE5IDAxOjA3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24gV2Vk
LCAyNyBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiBUdWUsIDI2IE5vdiAyMDE5
LCAyMzoxOCBTdGVmYW5vIFN0YWJlbGxpbmksIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPiB3cm90
ZToKPj4gICAgICAgIE9uIEZyaSwgMTUgTm92IDIwMTksIFN0ZXdhcnQgSGlsZGVicmFuZCB3cm90
ZToKPj4gICAgICAgID4gQWxsb3cgdmdpY19nZXRfaHdfaXJxX2Rlc2MgdG8gYmUgY2FsbGVkIHdp
dGggYSB2Y3B1IGFyZ3VtZW50Lgo+PiAgICAgICAgPgo+PiAgICAgICAgPiBVc2UgdmNwdSBhcmd1
bWVudCBpbiB2Z2ljX2Nvbm5lY3RfaHdfaXJxLgo+PiAgICAgICAgPgo+PiAgICAgICAgPiB2Z2lj
X2Nvbm5lY3RfaHdfaXJxIGlzIGNhbGxlZCBmb3IgUFBJcyBhbmQgU1BJcywgbm90IFNHSXMuIEVu
Zm9yY2Ugd2l0aAo+PiAgICAgICAgPiBBU1NFUlRzLgo+PiAgICAgICAgPgo+PiAgICAgICAgPiBT
aWduZWQtb2ZmLWJ5OiBTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0ZXdhcnQuaGlsZGVicmFuZEBkb3Ju
ZXJ3b3Jrcy5jb20+Cj4+ICAgICAgICA+Cj4+ICAgICAgICA+IC0tLQo+PiAgICAgICAgPiB2Mzog
bmV3IHBhdGNoCj4+ICAgICAgICA+Cj4+ICAgICAgICA+IC0tLQo+PiAgICAgICAgPiBOb3RlOiBJ
IGhhdmUgb25seSBtb2RpZmllZCB0aGUgb2xkIHZnaWMgdG8gYWxsb3cgZGVsaXZlcnkgb2YgUFBJ
cy4KPj4gICAgICAgID4gLS0tCj4+ICAgICAgICA+wqAgeGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMg
fCAyNCArKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4gICAgICAgID7CoCB4ZW4vYXJjaC9hcm0v
dmdpYy5jwqAgwqAgwqB8wqAgNiArKystLS0KPj4gICAgICAgID7CoCAyIGZpbGVzIGNoYW5nZWQs
IDE5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+PiAgICAgICAgPgo+PiAgICAgICAg
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2dpYy12Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2lj
LXZnaWMuYwo+PiAgICAgICAgPiBpbmRleCA5OGMwMjFmMWE4Li4yYzY2YThmYTkyIDEwMDY0NAo+
PiAgICAgICAgPiAtLS0gYS94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+PiAgICAgICAgPiArKysg
Yi94ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYwo+PiAgICAgICAgPiBAQCAtNDE4LDcgKzQxOCw3IEBA
IHN0cnVjdCBpcnFfZGVzYyAqdmdpY19nZXRfaHdfaXJxX2Rlc2Moc3RydWN0IGRvbWFpbiAqZCwg
c3RydWN0IHZjcHUgKnYsCj4+ICAgICAgICA+wqAgewo+PiAgICAgICAgPsKgIMKgIMKgIHN0cnVj
dCBwZW5kaW5nX2lycSAqcDsKPj4gICAgICAgID4KPj4gICAgICAgID4gLcKgIMKgIEFTU0VSVCgh
diAmJiB2aXJxID49IDMyKTsKPj4gICAgICAgID4gK8KgIMKgIEFTU0VSVCgoIXYgJiYgKHZpcnEg
Pj0gMzIpKSB8fCAoIWQgJiYgdiAmJiAodmlycSA+PSAxNikgJiYgKHZpcnEgPCAzMikpKTsKPj4K
Pj4gICAgICAgIEkgZG9uJ3QgdGhpbmsgIWQgaXMgbmVjZXNzYXJ5IGZvciB0aGlzIHRvIHdvcmsg
YXMgaW50ZW5kZWQgc28gSSB3b3VsZAo+PiAgICAgICAgbGltaXQgdGhlIEFTU0VSVCB0bwo+Pgo+
PiAgICAgICAgwqAgQVNTRVJUKCghdiAmJiAodmlycSA+PSAzMikpIHx8ICh2ICYmICh2aXJxID49
IDE2KSAmJiAodmlycSA8IDMyKSkpOwo+Pgo+PiAgICAgICAgdGhlIGNhbGxlciBjYW4gYWx3YXlz
IHBhc3Mgdi0+ZG9tYWluCj4+Cj4+IEJ1dCB0aGVuIHlvdSBoYXZlIHRoZSByaXNrIHRvIHJ1biBp
bnRvIGQgIT0gdi0+ZG9tYWluLiBTbyBhdCBsZWFzdCB3aXRoIHRoZSBBU1NFUlQgeW91IGRvY3Vt
ZW50IHRoZSBleHBlY3RhdGlvbi4KPiAKPiBZZXMsIHRoYXQgd2FzIG5vdCBteSBpbnRlbnRpb24u
Cj4gCj4gSXQgbWFrZXMgc2Vuc2UgaW4gY2VydGFpbiBzY2VuYXJpb3MgZm9yIHYgdG8gYmUgTlVM
TC4gV2hhdCBJIHdhcyB0cnlpbmcKPiB0byBzYXkgaXMgdGhhdCB3aGVuIHYgaXMgbm90LU5VTEws
IHRoZW4gYWxzbyBkIHNob3VsZCBiZSBub3QtTlVMTCBmb3IKPiBjb25zaXN0ZW5jeS4gSSBkb24n
dCB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBwYXNzIHYgY29ycmVzcG9uZGluZyB0bwo+IHZjcHUx
IG9mIGRvbWFpbjIgYW5kIGQgPT0gTlVMTCwgcmlnaHQ/CgpXaGlsZSBJIHVzdWFsbHkgbGlrZSBj
b25zaXN0ZW5jeSwgJ2QnIGlzIG9ubHkgdXNlZCB0byBmaW5kICd2JyBpZiBpdCBpcyAKTlVMTC4g
U28gSSByZWFsbHkgc2VlIGxpbWl0ZWQgcmVhc29uIHRvIGltcG9zZSB0aGUgY2FsbGVyIHRvIHNl
dCAnZCcgaW4gCnRoaXMgY2FzZS4KCj4gCj4gSSBkb24ndCBrbm93IGlmIHlvdSB3YW50IHRvIGFk
ZCBhIChkID09IHYtPmRvbWFpbikgY2hlY2sgdG8gdGhlIEFTU0VSVAo+IGFzIGl0IGlzIHByZXR0
eSBidXN5IGFscmVhZHkuIEkgYW0gT0sgZWl0aGVyIHdheS4KPiAKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
