Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF661248DD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:01:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZpj-0007v3-Qf; Wed, 18 Dec 2019 13:57:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihZpi-0007uy-8b
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:57:46 +0000
X-Inumbo-ID: 5921b9d4-219e-11ea-a1e1-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5921b9d4-219e-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 13:57:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q6so2375384wro.9
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KQ3ap0wFOA+D+4f1X+4ph90YEw/0Qu1hx5zYP4YBycI=;
 b=K8VlQn81IV5k7RKPjk61+GQtbM2uWqa3aBC2CzhOLxxpylPq3PZyTm2Ho1LUrAfAQc
 BufWbe3kLnY1tSmRHbvMKA3bCb1VF25vy52DnBXkX5W7uQ+nZla0tn8VNTBMnubz2pY+
 C6cDszMfgkddOOxpuNF4qHZyNPoj164pFODOeXPZxN64E108dafp4Az1Uxj2LOThII4Y
 MesiTslztP0RmuZOLBeSHN54KJ2nK/IAibA1v6S/6FeCm1UGua2mfUDaZ1TWwKtrNUEy
 NA+zXpUHuuKS5zYweyzFYR0d/akTqWaO8icnR0G1A5au5yow+G+5SE3hfRUs0zPzP2qQ
 Jc1w==
X-Gm-Message-State: APjAAAXIATiaGVS+l8JzWUMPaHeNtWxN+dRhttMqms0L5e2djuURM9M3
 x54ohX4gZzweQSnhVtb/Xt4=
X-Google-Smtp-Source: APXvYqxqnsq4G9XjALuwZf/36uFT73cDRlUsJ5GzI2OhWqlCH0XckOYrftfsn5aRd1d5TLx9ytMMnQ==
X-Received: by 2002:a5d:49c3:: with SMTP id t3mr3045890wrs.113.1576677456870; 
 Wed, 18 Dec 2019 05:57:36 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id v83sm2597287wmg.16.2019.12.18.05.57.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 05:57:36 -0800 (PST)
To: Varad Gautam <vrd@amazon.de>, xen-devel@lists.xenproject.org
References: <1562165173-31383-1-git-send-email-vrd@amazon.de>
 <1576666417-20989-1-git-send-email-vrd@amazon.de>
From: Julien Grall <julien@xen.org>
Message-ID: <b89a250a-2b6b-0cc4-655c-2c27c0b8ab76@xen.org>
Date: Wed, 18 Dec 2019 13:57:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <1576666417-20989-1-git-send-email-vrd@amazon.de>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmFyYWQsCgpQbGVhc2Ugc2VuZCBuZXcgdmVyc2lvbiBvZiBhIHBhdGNoIGluIGEgbmV3IHRo
cmVhZCByYXRoZXIgdGhhbiBpbi1yZXBseSAKdG8gdGhlIGZpcnN0IHZlcnNpb24uCgpPbiAxOC8x
Mi8yMDE5IDEwOjUzLCBWYXJhZCBHYXV0YW0gd3JvdGU6Cj4gWEVOX0RPTUNUTF9kZXN0cm95ZG9t
YWluIGNyZWF0ZXMgYSBjb250aW51YXRpb24gaWYgZG9tYWluX2tpbGwgLUVSRVNUQVJUUy4KPiBJ
biB0aGF0IHNjZW5hcmlvLCBpdCBpcyBwb3NzaWJsZSB0byByZWNlaXZlIG11bHRpcGxlIF9waXJx
X2d1ZXN0X3VuYmluZAo+IGNhbGxzIGZvciB0aGUgc2FtZSBwaXJxIGZyb20gZG9tYWluX2tpbGws
IGlmIHRoZSBwaXJxIGhhcyBub3QgeWV0IGJlZW4KPiByZW1vdmVkIGZyb20gdGhlIGRvbWFpbidz
IHBpcnFfdHJlZSwgYXM6Cj4gICAgZG9tYWluX2tpbGwoKQo+ICAgICAgLT4gZG9tYWluX3JlbGlu
cXVpc2hfcmVzb3VyY2VzKCkKPiAgICAgICAgLT4gcGNpX3JlbGVhc2VfZGV2aWNlcygpCj4gICAg
ICAgICAgLT4gcGNpX2NsZWFuX2RwY2lfaXJxKCkKPiAgICAgICAgICAgIC0+IHBpcnFfZ3Vlc3Rf
dW5iaW5kKCkKPiAgICAgICAgICAgICAgLT4gX19waXJxX2d1ZXN0X3VuYmluZCgpCj4gCj4gRm9y
IGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB3b3VsZCB6YXAg
dGhlIGN1cnJlbnQKPiBkb21haW4gZnJvbSB0aGUgcGlycSdzIGd1ZXN0c1tdIGxpc3QsIGJ1dCB0
aGUgYWN0aW9uIGhhbmRsZXIgaXMgbmV2ZXIgZnJlZWQKPiBhcyB0aGVyZSBhcmUgb3RoZXIgZ3Vl
c3RzIHVzaW5nIHRoaXMgcGlycS4gQXMgYSByZXN1bHQsIG9uIHRoZSBzZWNvbmQgY2FsbCwKPiBf
X3BpcnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBkb21haW4gd2hpY2gg
aGFzIGJlZW4gcmVtb3ZlZAo+IGZyb20gdGhlIGd1ZXN0c1tdIGxpc3QsIGFuZCBoaXRzIGEgQlVH
X09OLgo+IAo+IE1ha2UgX19waXJxX2d1ZXN0X3VuYmluZCBzYWZlIHRvIGJlIGNhbGxlZCBtdWx0
aXBsZSB0aW1lcyBieSBsZXR0aW5nIHhlbgo+IGNvbnRpbnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFz
IGFscmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBndWVzdC4gVGhlCj4gUElSUSB3aWxsIGJl
IGNsZWFuZWQgdXAgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlIGR1cmluZyB0aGUgZGVzdHJ1
Y3Rpb24KPiBpbiBjb21wbGV0ZV9kb21haW5fZGVzdHJveSBhbnl3YXlzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFZhcmFkIEdhdXRhbSA8dnJkQGFtYXpvbi5kZT4KPiBDQzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KPiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAK
PiB2MjogU3BsaXQgdGhlIGNoZWNrIG9uIGFjdGlvbi0+bnJfZ3Vlc3RzID4gMCBhbmQgbWFrZSBp
dCBhbiBBU1NFUlQsIHJld29yZC4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9pcnEuYyB8IDExICsr
KysrKysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaXJxLmMgYi94ZW4vYXJjaC94ODYv
aXJxLmMKPiBpbmRleCA1ZDBkOTRjLi4zZWI3YjIyIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9pcnEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9pcnEuYwo+IEBAIC0xODYzLDcgKzE4NjMsMTYg
QEAgc3RhdGljIGlycV9ndWVzdF9hY3Rpb25fdCAqX19waXJxX2d1ZXN0X3VuYmluZCgKPiAgIAo+
ICAgICAgIGZvciAoIGkgPSAwOyAoaSA8IGFjdGlvbi0+bnJfZ3Vlc3RzKSAmJiAoYWN0aW9uLT5n
dWVzdFtpXSAhPSBkKTsgaSsrICkKPiAgICAgICAgICAgY29udGludWU7Cj4gLSAgICBCVUdfT04o
aSA9PSBhY3Rpb24tPm5yX2d1ZXN0cyk7Cj4gKyAgICBpZiAoIGkgPT0gYWN0aW9uLT5ucl9ndWVz
dHMgKSB7CgpUaGUgeyBzaG91bGQgYmUgYSBuZXcgbGluZS4KCj4gKyAgICAgICAgQVNTRVJUKGFj
dGlvbi0+bnJfZ3Vlc3RzID4gMCkgOwoKVGhlIHNwYWNlIGJlZm9yZSA7IGlzIG5vdCBuZWNlc3Nh
cnkuCgo+ICsgICAgICAgIC8qIEluIGNhc2UgdGhlIHBpcnEgd2FzIHNoYXJlZCwgdW5ib3VuZCBm
b3IgdGhpcyBkb21haW4gaW4gYW4gZWFybGllciBjYWxsLCBidXQgc3RpbGwKPiArICAgICAgICAg
KiBleGlzdGVkIG9uIHRoZSBkb21haW4ncyBwaXJxX3RyZWUsIHdlIHN0aWxsIHJlYWNoIGhlcmUg
aWYgdGhlcmUgYXJlIGFueSBsYXRlcgo+ICsgICAgICAgICAqIHVuYmluZCBjYWxscyBvbiB0aGUg
c2FtZSBwaXJxLiBSZXR1cm4gaWYgc3VjaCBhbiB1bmJpbmQgaGFwcGVucy4gKi8KClRoZSBjb2Rp
bmcgc3R5bGUgZm9yIGNvbW1lbnQgaXM6CgovKgogICogRm9vCiAgKiBCYXIKICAqLwoKPiArICAg
ICAgICBpZiAoIGFjdGlvbi0+c2hhcmVhYmxlICkKPiArICAgICAgICAgICAgcmV0dXJuIE5VTEw7
Cj4gKyAgICAgICAgQlVHKCk7CgpHaXZlbiB0aGF0IHRoZSBwcmV2aW91cyBCVUdfT04oKSB3YXMg
aGl0LCB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIHRyeSB0byAKYXZvaWQgYSBuZXcgQlVHKCkuCgpT
byB3aHkgbm90IGp1c3QgcmV0dXJuaW5nIE5VTEwgYXMgeW91IGRvIGZvciBhY3Rpb24tPnNoYXJl
YWJsZT8KCj4gKyAgICB9Cj4gKwo+ICAgICAgIG1lbW1vdmUoJmFjdGlvbi0+Z3Vlc3RbaV0sICZh
Y3Rpb24tPmd1ZXN0W2krMV0sCj4gICAgICAgICAgICAgICAoYWN0aW9uLT5ucl9ndWVzdHMtaS0x
KSAqIHNpemVvZihhY3Rpb24tPmd1ZXN0WzBdKSk7Cj4gICAgICAgYWN0aW9uLT5ucl9ndWVzdHMt
LTsKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
