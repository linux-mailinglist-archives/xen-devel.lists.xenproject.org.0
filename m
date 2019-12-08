Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA644116194
	for <lists+xen-devel@lfdr.de>; Sun,  8 Dec 2019 14:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idw8J-0005A6-0Z; Sun, 08 Dec 2019 12:57:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+SuD=Z6=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1idw8H-0005A1-V6
 for xen-devel@lists.xenproject.org; Sun, 08 Dec 2019 12:57:53 +0000
X-Inumbo-ID: 5871e554-19ba-11ea-b6f1-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5871e554-19ba-11ea-b6f1-bc764e2007e4;
 Sun, 08 Dec 2019 12:57:53 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z7so12852427wrl.13
 for <xen-devel@lists.xenproject.org>; Sun, 08 Dec 2019 04:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TqOVzrIy7tnshYeySpnoN1+q5DJvxgrpn6Bihyc/4F0=;
 b=L3BwGILG/IAFjD7B1+hPpOTZFfa1gIBaq7W8YHBIJxCyVQ7UFanceTBR0JVDfC3AzD
 hxcgFm8dN6jfUyC/bc2IWpdmI0OlzQ6bypeK0cEVvEhweh9/UzSWTplaHEqVlRqKnHVe
 aY3wmCm6FjTwfirojyb32T/6pY7yC/c76rhhKgyHxILj1DDDErG9cNaIqOec4f7NJRyI
 wga0kYxp15FSojSYlZHMnQPwBoLtJrvcIpA7/Se3BOlYP1BMaeCy2ul50buELCIGUHEW
 B6DqGftNvH6HR+yC2SY3AGQzK0hE1zNFwFRBG7+NNE83PZn6oIrPsSkyYIq9WyhRkFv8
 Vecg==
X-Gm-Message-State: APjAAAVejWIq/NZ68j213Y9CtGHN8MffmTUsQGxWAvPes6OXnZhqUCC9
 8IT4zVPfkcVEAoVTjDlOZh8=
X-Google-Smtp-Source: APXvYqx3ni+xMl44YdAR2jyPU0oJX03VD268mGqtJk0s2seaYdAftM3r3abU/PjLgCXgSGA17whPZQ==
X-Received: by 2002:a5d:4d4a:: with SMTP id a10mr26060748wru.220.1575809872276; 
 Sun, 08 Dec 2019 04:57:52 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-225.amazon.com.
 [54.240.197.225])
 by smtp.gmail.com with ESMTPSA id c72sm10286413wmd.11.2019.12.08.04.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Dec 2019 04:57:51 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cbab999a-fd87-2c2c-d14f-421ec4db6ef0@xen.org>
Date: Sun, 8 Dec 2019 12:57:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191205223008.8623-5-andrew.cooper3@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMDUvMTIvMjAxOSAyMjozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBU
aGVzZSBoeXBlcmNhbGxzIGVhY2ggdXNlIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoKSwgd2hv
c2UgQVBJIGlzIGFib3V0IHRvCj4gc3dpdGNoIHRvIHVzZSAtRVJFU1RBUlQuICBVcGRhdGUgdGhl
IHNvb24tdG8tYmUgYWZmZWN0ZWQgcGF0aHMgdG8gY29wZSwKPiBmb2xkaW5nIGV4aXN0aW5nIGNv
bnRpbmF0aW9uIGxvZ2ljIHdoZXJlIGFwcGxpY2FibGUuCj4gCj4gSW4gYWRkaXRpb246Cj4gICAq
IEZvciBwbGF0Zm9ybSBvcCBhbmQgc3lzY3RsLCBpbnNlcnQgYSBjcHVfcmVsYXgoKSBpbnRvIHdo
YXQgaXMgb3RoZXJ3aXNlIGEKPiAgICAgdGlnaHQgc3BpbmxvY2sgbG9vcCwgYW5kIG1ha2UgdGhl
IGNvbnRpbnVhdGlvbiBsb2dpYyBjb21tb24gYXQgdGhlCj4gICAgIGVwaWxvZ3VlLgo+ICAgKiBD
b250cmFyeSB0byB0aGUgY29tbWVudCBpbiB0aGUgY29kZSwga2V4ZWNfZXhlYygpIGRvZXMgcmV0
dXJuIGluIHRoZQo+ICAgICBLRVhFQ19SRUJPT1QgY2FzZSwgbmVlZHMgdG8gcGFzcyByZXQgYmFj
ayB0byB0aGUgY2FsbGVyLgoKSXQgaXMgbm90IGVudGlyZWx5IHRyaXZpYWwgdG8gbWUgdGhhdCBL
RVhFQ19SRUJPT1QgcmVmZXJzIHRvIApLRVhFQ19ERUZBVUxUX1RZUEUuIFRoZSBtb3JlIHRoYXQg
aWYgeW91IGxvb2sgYXQgdGhlIGtleGVjX3JlYm9vdCgpIApoZWxwZXIsIGl0IHdpbGwgbm90IHJl
dHVybiAoc2VlIEJVRygpKS4gV2hhdCBtYXkgcmV0dXJuIGlzIApjb250aW51ZV9oeXBlcmNhbGxf
b25fY3B1KCkuCgpTbyB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHVzZSBLRVhFQ19ERUZBVUxUX1RZ
UEU/CgpbLi4uXQoKPiBAQCAtODE2LDYgKzgxOSwxMyBAQCByZXRfdCBkb19wbGF0Zm9ybV9vcChY
RU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9wbGF0Zm9ybV9vcF90KSB1X3hlbnBmX29wKQo+ICAg
IG91dDoKPiAgICAgICBzcGluX3VubG9jaygmeGVucGZfbG9jayk7Cj4gICAKPiArICAgIGlmICgg
cmV0ID09IC1FUkVTVEFSVCApCj4gKyAgICB7Cj4gKyAgICBjcmVhdGVfY29udGludWF0aW9uOgoK
U2hhbGwgd2UgaW5kZW50IGNyZWF0ZV9jb250aW51YXRpb24gdGhlIHNhbWUgd2F5IGFzIG91dD8K
ClsuLi5dCgo+IEBAIC0xMjYzLDEzICsxMjYzLDI1IEBAIHN0YXRpYyBpbnQgZG9fa2V4ZWNfb3Bf
aW50ZXJuYWwodW5zaWduZWQgbG9uZyBvcCwKPiAgIAo+ICAgbG9uZyBkb19rZXhlY19vcCh1bnNp
Z25lZCBsb25nIG9wLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIHVhcmcpCj4gICB7Cj4g
LSAgICByZXR1cm4gZG9fa2V4ZWNfb3BfaW50ZXJuYWwob3AsIHVhcmcsIDApOwo+ICsgICAgaW50
IHJldCA9IGRvX2tleGVjX29wX2ludGVybmFsKG9wLCB1YXJnLCAwKTsKU2hvdWxkbid0IGl0IGJl
IGxvbmcgKG9yIHVuc2lnbmVkIGxvbmcpIGhlcmU/IE90aGVyd2lzZSwgdGhlIHJldHVybiBvZiAK
aHlwZXJjYWxsX2NyZWF0ZV9jb250aW51YXRpb24oKSBtYXkgYmUgdHJ1bmNhdGVkLgoKCj4gKwo+
ICsgICAgaWYgKCByZXQgPT0gLUVSRVNUQVJUICkKPiArICAgICAgICByZXQgPSBoeXBlcmNhbGxf
Y3JlYXRlX2NvbnRpbnVhdGlvbihfX0hZUEVSVklTT1Jfa2V4ZWNfb3AsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImxoIiwgb3AsIHVhcmcpOwo+ICsKPiAr
ICAgIHJldHVybiByZXQ7Cj4gICB9CgpbLi4uXQoKPiBAQCAtNTE2LDYgKzUxOSwxMiBAQCBsb25n
IGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwp
Cj4gICAgICAgICAgICBfX2NvcHlfdG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAxKSApCj4gICAgICAg
ICAgIHJldCA9IC1FRkFVTFQ7Cj4gICAKPiArICAgIGlmICggcmV0ID09IC1FUkVTVEFSVCApCj4g
KyAgICB7Cj4gKyAgICBjcmVhdGVfY29udGludWF0aW9uOgoKClNpbWlsYXIgcXVlc3Rpb24gYXMg
dGhlIHByZXZpb3VzIGxhYmVsIGNyZWF0ZV9jb250aW51YXRpb24uCgo+ICsgICAgICAgIHJldCA9
IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKF9fSFlQRVJWSVNPUl9zeXNjdGwsICJoIiwg
dV9zeXNjdGwpOwo+ICsgICAgfQo+ICsKPiAgICAgICByZXR1cm4gcmV0Owo+ICAgfQo+ICAgCj4g
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
