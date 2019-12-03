Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A2211064D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 22:07:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icFKp-0000Bm-R5; Tue, 03 Dec 2019 21:03:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8hwN=ZZ=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1icFKo-0000Bb-2x
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 21:03:50 +0000
X-Inumbo-ID: 672da144-1610-11ea-9db0-bc764e2007e4
Received: from mail-il1-x143.google.com (unknown [2607:f8b0:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 672da144-1610-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 21:03:49 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id t9so4539477iln.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sFn+q5M4OQGy2hAfzIasEpnp/G/IQ19ZE4PBt4z+hKs=;
 b=bjMRZrmxdnENLVxHQwgxiuGhs/pIOOCI7RPVi2IMk3lwgTI7aNB9AryFTQFJ6N34Zz
 znaAPt4pAIhJrr9eVmUHVToYCNxheTmgPByX99LYCSyVMAjJEY/6aWBIurQG20+1KE2p
 B7Xx7tBoXqf5elHivpFxXrpx4F+ZdXzRwgJntZCgFBhUIp+3zU9jA7Kkfwf5ndxxUYIF
 vegXLjcgvhs/y083uQx2obugP2D9bv+dEvcAIvjPPJkew84MoNsU4x0d1yfbOK0T00eX
 t7g3EDZUcj29+n0c7bK3y+ZSqCCnnlF8cPzoVC2tHqeAUYF8OaAC3w0H9ET1FuwRzPg/
 /qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sFn+q5M4OQGy2hAfzIasEpnp/G/IQ19ZE4PBt4z+hKs=;
 b=OLLGUpGXrYw2a4GAZAmqJdiTtrGeeuqrjyC1SksVEBTJAzJ4obOpOOfzpwI2cKsg25
 A7V5KgNtUaGkY9EwVaogNyjHQpzwffvMdk9z8LnSGujUJsGGxBvtFahHMc3foYiNYU8v
 3kKHAJVYDs1JXrA/4y+cBNvnV2rJ4AQdFxox+33mvAdwQSLMXrjPJrF4N078AguysqR7
 qPwAl9qgb+uA2UrMfaf/0jENSkV97UJMrKEUq3/GONclLeEHp66tfxlBAVrlxctpMbK3
 bzCb0sAGuBL7vbWOztKj/mDG1t5zqH6hJ46B/8msNB9w8s5BZmB76QwRpheaZyBlCb/n
 FR0w==
X-Gm-Message-State: APjAAAXPhrlnghR35tnu0ZijABARxBx6QD4eEEM2k+Pt5PAddKbUiNoU
 yfg/KHCQh3pUwTdQ+AVwtUNWUA==
X-Google-Smtp-Source: APXvYqynb9y1GtIc2v9Jt2I8gQfLy2oB0u+TVZ+0gIHqiiCdzgQ3Kw9UoB/KAiRWf5JLsPyTkN/pBA==
X-Received: by 2002:a92:d282:: with SMTP id p2mr134806ilp.73.1575407028959;
 Tue, 03 Dec 2019 13:03:48 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id a81sm1136094ill.31.2019.12.03.13.03.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2019 13:03:48 -0800 (PST)
To: SeongJae Park <sjpark@amazon.com>, konrad.wilk@oracle.com,
 roger.pau@citrix.com
References: <20191126153605.27564-1-sjpark@amazon.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <43f9881b-4a88-47e9-c321-19033a2bc872@kernel.dk>
Date: Tue, 3 Dec 2019 14:03:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191126153605.27564-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/blkback: Avoid unmapping unmapped grant
 pages
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
Cc: linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMjYvMTkgODozNiBBTSwgU2VvbmdKYWUgUGFyayB3cm90ZToKPiBGcm9tOiBTZW9uZ0ph
ZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+IAo+IEZvciBlYWNoIEkvTyByZXF1ZXN0LCBibGti
YWNrIGZpcnN0IG1hcHMgdGhlIGZvcmVpZ24gcGFnZXMgZm9yIHRoZQo+IHJlcXVlc3QgdG8gaXRz
IGxvY2FsIHBhZ2VzLiAgSWYgYW4gYWxsb2NhdGlvbiBvZiBhIGxvY2FsIHBhZ2UgZm9yIHRoZQo+
IG1hcHBpbmcgZmFpbHMsIGl0IHNob3VsZCB1bm1hcCBldmVyeSBtYXBwaW5nIGFscmVhZHkgbWFk
ZSBmb3IgdGhlCj4gcmVxdWVzdC4KPiAKPiBIb3dldmVyLCBibGtiYWNrJ3MgaGFuZGxpbmcgbWVj
aGFuaXNtIGZvciB0aGUgYWxsb2NhdGlvbiBmYWlsdXJlIGRvZXMKPiBub3QgbWFyayB0aGUgcmVt
YWluaW5nIGZvcmVpZ24gcGFnZXMgYXMgdW5tYXBwZWQuICBUaGVyZWZvcmUsIHRoZSB1bm1hcAo+
IGZ1bmN0aW9uIG1lcmVseSB0cmllcyB0byB1bm1hcCBldmVyeSB2YWxpZCBncmFudCBwYWdlIGZv
ciB0aGUgcmVxdWVzdCwKPiBpbmNsdWRpbmcgdGhlIHBhZ2VzIG5vdCBtYXBwZWQgZHVlIHRvIHRo
ZSBhbGxvY2F0aW9uIGZhaWx1cmUuICBPbiBhCj4gc3lzdGVtIHRoYXQgZmFpbHMgdGhlIGFsbG9j
YXRpb24gZnJlcXVlbnRseSwgdGhpcyBwcm9ibGVtIGxlYWRzIHRvCj4gZm9sbG93aW5nIGtlcm5l
bCBjcmFzaC4KPiAKPiAgICBbICAzNzIuMDEyNTM4XSBCVUc6IHVuYWJsZSB0byBoYW5kbGUga2Vy
bmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCAwMDAwMDAwMDAwMDAwMDAxCj4gICAgWyAg
MzcyLjAxMjU0Nl0gSVA6IFs8ZmZmZmZmZmY4MTQwNzFhYz5dIGdudHRhYl91bm1hcF9yZWZzLnBh
cnQuNysweDFjLzB4NDAKPiAgICBbICAzNzIuMDEyNTU3XSBQR0QgMTZmM2U5MDY3IFBVRCAxNjQy
NmUwNjcgUE1EIDAKPiAgICBbICAzNzIuMDEyNTYyXSBPb3BzOiAwMDAyIFsjMV0gU01QCj4gICAg
WyAgMzcyLjAxMjU2Nl0gTW9kdWxlcyBsaW5rZWQgaW46IGFjdF9wb2xpY2Ugc2NoX2luZ3Jlc3Mg
Y2xzX3UzMgo+ICAgIC4uLgo+ICAgIFsgIDM3Mi4wMTI3NDZdIENhbGwgVHJhY2U6Cj4gICAgWyAg
MzcyLjAxMjc1Ml0gIFs8ZmZmZmZmZmY4MTQwNzIwND5dIGdudHRhYl91bm1hcF9yZWZzKzB4MzQv
MHg0MAo+ICAgIFsgIDM3Mi4wMTI3NTldICBbPGZmZmZmZmZmYTAzMzVhZTM+XSB4ZW5fYmxrYmtf
dW5tYXArMHg4My8weDE1MCBbeGVuX2Jsa2JhY2tdCj4gICAgLi4uCj4gICAgWyAgMzcyLjAxMjgw
Ml0gIFs8ZmZmZmZmZmZhMDMzNmM1MD5dIGRpc3BhdGNoX3J3X2Jsb2NrX2lvKzB4OTcwLzB4OTgw
IFt4ZW5fYmxrYmFja10KPiAgICAuLi4KPiAgICBEZWNvbXByZXNzaW5nIExpbnV4Li4uIFBhcnNp
bmcgRUxGLi4uIGRvbmUuCj4gICAgQm9vdGluZyB0aGUga2VybmVsLgo+ICAgIFsgICAgMC4wMDAw
MDBdIEluaXRpYWxpemluZyBjZ3JvdXAgc3Vic3lzIGNwdXNldAo+IAo+IFRoaXMgY29tbWl0IGZp
eGVzIHRoaXMgcHJvYmxlbSBieSBtYXJraW5nIHRoZSBncmFudCBwYWdlcyBvZiB0aGUgZ2l2ZW4K
PiByZXF1ZXN0IHRoYXQgZGlkbid0IG1hcHBlZCBkdWUgdG8gdGhlIGFsbG9jYXRpb24gZmFpbHVy
ZSBhcyBpbnZhbGlkLgo+IAo+IEZpeGVzOiBjNmNjMTQyZGFjNTIgKCJ4ZW4tYmxrYmFjazogdXNl
IGJhbGxvb24gcGFnZXMgZm9yIGFsbCBtYXBwaW5ncyIpCgpRdWV1ZWQgdXAgd2l0aCBSb2dlcidz
IHJldmlld2VkLWJ5LgoKLS0gCkplbnMgQXhib2UKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
