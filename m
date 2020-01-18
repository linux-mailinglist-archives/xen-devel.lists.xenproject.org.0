Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFB4141753
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jan 2020 12:53:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ismbv-0000yh-Sl; Sat, 18 Jan 2020 11:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s8pn=3H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ismbu-0000yc-LI
 for xen-devel@lists.xenproject.org; Sat, 18 Jan 2020 11:49:50 +0000
X-Inumbo-ID: 9ce56adc-39e8-11ea-9fd7-bc764e2007e4
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ce56adc-39e8-11ea-9fd7-bc764e2007e4;
 Sat, 18 Jan 2020 11:49:42 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 20so10139324wmj.4
 for <xen-devel@lists.xenproject.org>; Sat, 18 Jan 2020 03:49:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mOi/Yg6cYgMUCM56WReiQ01/h2YJE0RR8hsw/4YyV9w=;
 b=d+wvr4jSuu2JMfR4Nj5UK6ou2L1mZY/3nIYUvNa6BIX4/l90c8M22EptnZNrHsiPur
 +HRKJ3DK/gTsVSZKN+HVFmMakM+GUyqiYJWixXWE8lfDofyzAX6zdRAlSXAVaq09bn7z
 nvNzB8I+f13sNzjkDFQmR6eHtrhUIhKm5y0GkfghEqOoxNfE21CSkVexcMx5wK4/VHpA
 6Bg+H47AaNLNTcwn4eol7NYs/E7ntDgT0UrdVH0aOroBjht/v4J1NiP6yMIlLk1KHHTE
 nJAbcIyczKWceit6pqUKjgW7F1Xaz0T3nHg4WCz1lDc+Jc6x+VeaJsbAf4tlmttz98Xg
 HTzg==
X-Gm-Message-State: APjAAAXvye4MPFUgWGrljMcbjd+uWQcIsnJxMtIFulCni5iMMgMcVML1
 xJNfLESgDHUPzwswIiBMZIU=
X-Google-Smtp-Source: APXvYqxa4u24dZwQ9pFvod9Wnq1NhoEpFJRwGKZvcM8Ijow3LJgQY+ifr3vxJnwnGZzC8dYcLZmlBg==
X-Received: by 2002:a1c:6406:: with SMTP id y6mr9741706wmb.144.1579348181234; 
 Sat, 18 Jan 2020 03:49:41 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id a184sm4392806wmf.29.2020.01.18.03.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 03:49:40 -0800 (PST)
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 xen-devel@lists.xenproject.org
References: <20191211211302.117395-1-jeff.kubascik@dornerworks.com>
 <20191211211302.117395-3-jeff.kubascik@dornerworks.com>
 <1c90e15b-0f61-7b06-2291-795185ba5b48@xen.org>
 <8544c070-e5b6-50d2-df4b-71563755b57f@dornerworks.com>
From: Julien Grall <julien@xen.org>
Message-ID: <de5f1e38-19b8-a274-371a-4d0cdbfef869@xen.org>
Date: Sat, 18 Jan 2020 11:49:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <8544c070-e5b6-50d2-df4b-71563755b57f@dornerworks.com>
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

CgpPbiAxNy8wMS8yMDIwIDIxOjI5LCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+IE9uIDEyLzE4LzIw
MTkgOToyNCBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSBKZWZmLAo+Pgo+PiBPbiAxMS8x
Mi8yMDE5IDIxOjEzLCBKZWZmIEt1YmFzY2lrIHdyb3RlOgo+Pj4gUGVyIHRoZSBBUk12OCBSZWZl
cmVuY2UgTWFudWFsIChBUk0gRERJIDA0ODdFLmEpLCBzZWN0aW9uIEQxMS4yLjQKPj4+IHNwZWNp
ZmllcyB0aGF0IHRoZSB2YWx1ZXMgaW4gdGhlIFRpbWVyVmFsdWUgdmlldyBvZiB0aGUgdGltZXJz
IGFyZQo+Pj4gc2lnbmVkIGluIHN0YW5kYXJkIHR3bydzIGNvbXBsZW1lbnQgZm9ybS4gV2hlbiB3
cml0aW5nIHRvIHRoZSBUaW1lclZhbHVlCj4+Cj4+IERvIHlvdSBtZWFuIENvbXBhcmVWYWx1ZSBy
ZWdpc3RlciBpbnN0ZWFkIG9mIFRpbWVyVmFsdWUgcmVnaXN0ZXI/Cj4gCj4gSSdtIGZhaXJseSBj
ZXJ0YWluIFRpbWVyVmFsdWUgcmVnaXN0ZXIgaXMgY29ycmVjdC4gV2hlbiB0aGUgZ3Vlc3Qgd3Jp
dGVzIHRvIHRoZQo+IFRpbWVyVmFsdWUgcmVnaXN0ZXIsIHRoZSBlcXVhdGlvbiBiZWxvdyBpcyB1
c2VkIHRvIGNvbnZlcnQgaXQgdG8gYSBDb21wYXJlVmFsdWUKPiBlcXVpdmFsZW50LgoKSSBmaW5k
IHRoZSBzZW50ZW5jZSBxdWl0ZSBjb25mdXNpbmcgdG8gcmVhZC4gSXQgaXMgbm90IHRoZSB3cml0
ZSB0aGF0IApuZWVkcyB0byBiZSBzaWduZWQgZXh0ZW5kLCBidXQgdGhlIHZhbHVlIHVzZWQgdG8g
Y29tcHV0ZSBDb21wYXJlVmFsdWUuIApTbyBob3cgYWJvdXQgdGhlIGZvbGxvd2luZyBjb21taXQg
bWVzc2FnZToKCiIKeGVuL2FybTogU2lnbiBleHRlbmQgVGltZXJWYWx1ZSB3aGVuIGNvbXB1dGlu
ZyB0aGUgQ29tcGFyZVZhbHVlCgpYZW4gd2lsbCBvbmx5IHN0b3JlIHRoZSBDb21wYXJlVmFsdWUg
YXMgaXQgY2FuIGJlIGRlcml2ZWQgZnJvbSB0aGUgClRpbWVyVmFsdWUgKEFSTSBEREkgMDQ4N0Uu
YSBzZWN0aW9uIEQxMS4yLjQpOgoKICBDb21wYXJlVmFsdWUgPSAoQ291bnRlcls2MzowXSArIFNp
Z25FeHRlbmQoVGltZXJWYWx1ZSkpWzYzOjBdCgpXaGlsZSB0aGUgVGltZXJWYWx1ZSBpcyBhIDMy
LWJpdCBzaWduZWQgdmFsdWUsIG91ciBpbXBsZW1lbnRhdGlvbiAKYXNzdW1lZCBpdCBpcyBhIDMy
LWJpdCB1bnNpZ25lZCB2YWx1ZS4KIgoKPiAKPj4+IHJlZ2lzdGVyLCBpdCBzaG91bGQgYmUgc2ln
bmVkIGV4dGVuZGVkIGFzIGRlc2NyaWJlZCBieSB0aGUgZXF1YXRpb24KPj4+Cj4+PiAgICAgIENv
bXBhcmVWYWx1ZSA9IChDb3VudGVyWzYzOjBdICsgU2lnbkV4dGVuZChUaW1lclZhbHVlKSlbNjM6
MF0KPj4gVGhpcyBleHBsYWlucyB0aGUgc2lnbmVkIHBhcnQsIGJ1dCBpdCBkb2VzIG5vdCBleHBs
YWluIHdoeSB0aGUgMzItYml0Cj4+IGNhc2UuIFNvIEkgd291bGQgbWVudGlvbiB0aGF0IFRpbWVy
VmFsdWUgaXMgYSAzMi1iaXQgc2lnbmVkIGludGVnZXIuCj4+Cj4+IE1heWJlIHNheWluZyAiYXJl
IDMyLWJpdCBzaWduZWQgaW4gc3RhbmRhcmQgLi4uIgo+IAo+IEkgcHVsbGVkIHRoaXMgZXF1YXRp
b24gZGlyZWN0bHkgZnJvbSB0aGUgQVJNdjggUmVmZXJlbmNlIE1hbnVhbCAtIHRoZSBtYW51YWwK
PiBnb2VzIGludG8gZGV0YWlsIGFib3V0IHRoZSBzaWduIGV4dGVuc2lvbi4gVGhpcyBpcyByZWZl
cmVuY2VkIGVhcmxpZXIgaW4gdGhlCj4gY29tbWl0IG1lc3NhZ2UuCgpXaGlsZSBJIGFncmVlIHRo
ZSBjb21taXQgbWVzc2FnZSBleHBsYWluIGluIGRldGFpbHMgdGhlIHNpZ24gZXh0ZW5zaW9uLCAK
dGhlcmUgaXMgbm90aGluZyBpbiB5b3VyIGNvbW1pdCBtZXNzYWdlIGFib3V0IHRoZSBzaXplIG9m
IFRpbWVyVmFsdWUgCihpLmUgMzItYml0KS4gSWYgeW91IHNheSBpdCBpcyBhIDMyLWJpdCBzaWdu
ZWQgdmFsdWUsIHRoZW4gaXQgaXMgbXVjaCAKY2xlYXJlciB0byB1bmRlcnN0YW5kIHRoZSBjYXN0
IHlvdSBhZGRlZCBiZWxvdy4KCkJ1dCBwbGVhc2Ugc2VlIGFib3ZlIGZvciBhIHN1Z2dlc3RlZCBj
b21taXQgbWVzc2FnZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
