Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A55124993
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 15:28:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaFy-0002P3-Rq; Wed, 18 Dec 2019 14:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kHBV=2I=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihaFw-0002OW-Mj
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 14:24:52 +0000
X-Inumbo-ID: 2743bc1a-21a2-11ea-908f-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2743bc1a-21a2-11ea-908f-12813bfff9fa;
 Wed, 18 Dec 2019 14:24:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so2523147wru.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 06:24:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uj20tmvvwUHN7lyZN2q+R9m81tF8/CjpsqIU79Mz2mA=;
 b=Jgyli55gdh0rDPnZ+/HAdrBjD/7Fl1D8IVPj1hcA3D2ASleFfoUrpE1vdzonkRkt1W
 5xyJm3D+m2PiIaS9m29XYRrZi8s3/eFeHC5ktqX/owlHOk7mZp7RcHls6lJ6gDnkFoFS
 xq8zMOhu4GyNg6b8AevIzZ9jTPJ1uBrd8Bp6kT3NVQkOocP+0UEpn3ujk0aabQ2ZT+vz
 PW19nbwUMBmT4HkKJz283sk21idqlO7swc8I/geuijTO7HJk6MqM0NIhaha2rIMc+fac
 MNgPmPYxj367NnRW5BpLN+IOajXekF0lcWK0LaaIf1gEyhcqu/A4kpElTmAmgbYAnmj2
 BfAA==
X-Gm-Message-State: APjAAAUk2Kn2tHwbgEfu2gEnCvwYr21BctjfPNwFbZtRt97WPhrYcVkw
 RFxAWIdDnBOzxfbjuwo4Rks=
X-Google-Smtp-Source: APXvYqydp/O/HEm2CmVa9l60M8dXTt/TkY+DVgfBMYbRbCRsgXWSsPV6E9oxxTw7YnQevVR4N0KFgQ==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr3436827wrr.74.1576679091185; 
 Wed, 18 Dec 2019 06:24:51 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id o129sm2765122wmb.1.2019.12.18.06.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 06:24:50 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
 <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1c90e15b-0f61-7b06-2291-795185ba5b48@xen.org>
Date: Wed, 18 Dec 2019 14:24:49 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xen/arm: sign extend writes to
 TimerValue
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmVmZiwKCk9uIDExLzEyLzIwMTkgMjE6MTMsIEplZmYgS3ViYXNjaWsgd3JvdGU6Cj4gUGVy
IHRoZSBBUk12OCBSZWZlcmVuY2UgTWFudWFsIChBUk0gRERJIDA0ODdFLmEpLCBzZWN0aW9uIEQx
MS4yLjQKPiBzcGVjaWZpZXMgdGhhdCB0aGUgdmFsdWVzIGluIHRoZSBUaW1lclZhbHVlIHZpZXcg
b2YgdGhlIHRpbWVycyBhcmUKPiBzaWduZWQgaW4gc3RhbmRhcmQgdHdvJ3MgY29tcGxlbWVudCBm
b3JtLiBXaGVuIHdyaXRpbmcgdG8gdGhlIFRpbWVyVmFsdWUKCkRvIHlvdSBtZWFuIENvbXBhcmVW
YWx1ZSByZWdpc3RlciBpbnN0ZWFkIG9mIFRpbWVyVmFsdWUgcmVnaXN0ZXI/Cgo+IHJlZ2lzdGVy
LCBpdCBzaG91bGQgYmUgc2lnbmVkIGV4dGVuZGVkIGFzIGRlc2NyaWJlZCBieSB0aGUgZXF1YXRp
b24KPiAKPiAgICAgQ29tcGFyZVZhbHVlID0gKENvdW50ZXJbNjM6MF0gKyBTaWduRXh0ZW5kKFRp
bWVyVmFsdWUpKVs2MzowXQpUaGlzIGV4cGxhaW5zIHRoZSBzaWduZWQgcGFydCwgYnV0IGl0IGRv
ZXMgbm90IGV4cGxhaW4gd2h5IHRoZSAzMi1iaXQgCmNhc2UuIFNvIEkgd291bGQgbWVudGlvbiB0
aGF0IFRpbWVyVmFsdWUgaXMgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIuCgpNYXliZSBzYXlpbmcg
ImFyZSAzMi1iaXQgc2lnbmVkIGluIHN0YW5kYXJkIC4uLiIKCj4gCj4gU2lnbmVkLW9mZi1ieTog
SmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5jb20+Cj4gLS0tCj4gICB4
ZW4vYXJjaC9hcm0vdnRpbWVyLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Z0aW1l
ci5jIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jCj4gaW5kZXggMjFiOThlYzIwYS4uODcyMTgxZDli
NiAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vdnRpbWVyLmMKPiArKysgYi94ZW4vYXJjaC9h
cm0vdnRpbWVyLmMKPiBAQCAtMjExLDcgKzIxMSw3IEBAIHN0YXRpYyBib29sIHZ0aW1lcl9jbnRw
X3R2YWwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVpbnQzMl90ICpyLAo+ICAgICAgIH0K
PiAgICAgICBlbHNlCj4gICAgICAgewo+IC0gICAgICAgIHYtPmFyY2gucGh5c190aW1lci5jdmFs
ID0gY250cGN0ICsgKnI7Cj4gKyAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVyLmN2YWwgPSBjbnRw
Y3QgKyAodWludDY0X3QpKGludDMyX3QpKnI7Cj4gICAgICAgICAgIGlmICggdi0+YXJjaC5waHlz
X3RpbWVyLmN0bCAmIENOVHhfQ1RMX0VOQUJMRSApCj4gICAgICAgICAgIHsKPiAgICAgICAgICAg
ICAgIHYtPmFyY2gucGh5c190aW1lci5jdGwgJj0gfkNOVHhfQ1RMX1BFTkRJTkc7Cj4gCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
