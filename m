Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38802189BC8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 13:16:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEXYt-0003Rm-Qf; Wed, 18 Mar 2020 12:12:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fuWQ=5D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jEXYr-0003Rb-SK
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 12:12:37 +0000
X-Inumbo-ID: c16516e8-6911-11ea-bec1-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c16516e8-6911-11ea-bec1-bc764e2007e4;
 Wed, 18 Mar 2020 12:12:37 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id i24so26809126eds.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Mar 2020 05:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qLrZtpBZ6H2jeFu3L/cUuSmbPqF0xT/PMWI7plhm1aY=;
 b=W8MzO8DhuU7S1wUWRqPaFmmQsyO4H3O9nrIFkwnYqq4tUgWryu8hseitXmgAyjcao7
 hnZBD+b8greVoevr8a/ZVv9lWD5KrU7EE4iOR0skgvKY4o4RuF7Eob9qtJb4e6rHssj4
 0tyIyYd3ZKIGq+MsPkFS9tQYh2R3zg/N9KyPh8oXDLm2cVVug73TU4AW3n/MOee/yCxG
 F1xiCaVje4BHuKo+B75UosxXNbxvT837C3HPBS1M7sU0QOVG+h4qv0ojB5VGQnArTEN5
 lESsOSE9GRSr8YPkOwQjMpGkSmnUwgtcBpibHe4YF9suFalvJHGduOvX5misK/Q1XNBc
 JKzw==
X-Gm-Message-State: ANhLgQ29gOXXmreIm4s6P9py6+gcocTbifX/JK0O1tCGRWrLpemU+y+W
 sVTlpCDnOEzXemrkaH72ei8=
X-Google-Smtp-Source: ADFU+vts4Vr7KCmYVoXuQGWHI4cVeu6aciO47noUNhMGRm+n5dQMDZ7B/rrtmAJo/rifUJq8QxFNZg==
X-Received: by 2002:a50:8c03:: with SMTP id p3mr3491865edp.129.1584533556433; 
 Wed, 18 Mar 2020 05:12:36 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id om24sm324726ejb.75.2020.03.18.05.12.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 05:12:35 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, David Woodhouse <dwmw2@infradead.org>
References: <916bbc82cafac74f0a203b48eebfbc711bd33a70.camel@infradead.org>
 <c22d4a40717c7d2fad243c244619d2882ad5baf2.camel@infradead.org>
 <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9664816b-7607-c3f4-b70c-455bb946241f@xen.org>
Date: Wed, 18 Mar 2020 12:12:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5fc87ac4-8be9-3881-03af-85faca1e2bf5@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH 1/2] x86/setup: simplify handling of
 initrdidx when no initrd present
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <xadimgnik@gmail.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wMy8yMDIwIDExOjUxLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAxOC4wMy4y
MDIwIDEyOjQ2LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4+IEZyb206IERhdmlkIFdvb2Rob3Vz
ZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4+Cj4+IFJlbW92ZSBhIHRlcm5hcnkgb3BlcmF0b3IgdGhh
dCBtYWRlIG15IGJyYWluIGh1cnQuCj4gCj4gTXkgcG9zaXRpb24gdG93YXJkcyB0aGlzIGhhc24n
dCBjaGFuZ2VkLCBqdXN0IGZ0ci4KPiAKPj4gUmVwbGFjZSBpdCB3aXRoIHNvbWV0aGluZyBzaW1w
bGVyIHRoYXQgbWFrZXMgaXQgc29tZXdoYXQgY2xlYXJlciB0aGF0Cj4+IHRoZSBjaGVjayBmb3Ig
aW5pdHJkaWR4IDwgbWJpLT5tb2RzX2NvdW50IGlzIGJlY2F1c2UgbGFyZ2VyIHZhbHVlcyBhcmUK
Pj4gd2hhdCBmaW5kX2ZpcnN0X2JpdCgpIHdpbGwgcmV0dXJuIHdoZW4gaXQgZG9lc24ndCBmaW5k
IGFueXRoaW5nLgo+Pgo+PiBBbHNvIGRyb3AgdGhlIGV4cGxpY2l0IGNoZWNrIGZvciBtb2R1bGUg
IzAgc2luY2UgdGhhdCB3b3VsZCBiZSB0aGUKPj4gZG9tMCBrZXJuZWwgYW5kIHRoZSBjb3JyZXNw
b25kaW5nIGJpdCBpcyBhbHdheXMgY2xlYXIgaW4gbW9kdWxlX21hcC4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPj4gQWNrZWQtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gCj4gU3RyaWN0bHkgc3BlYWtpbmcgdGhpcyBp
cyBub3QgYSB2YWxpZCB0YWcgaGVyZSwgb25seSBSLWIgd291bGQgYmUuCgpJIGNhbid0IGZpbmQg
YW55IHJ1bGUgaW4gb3VyIGNvZGUgYmFzZSBwcmV2ZW50aW5nIGEgbm9uLW1haW50YWluZXIgdG8g
CmFkZCBpdHMgImFja2VkLWJ5IiB0YWcuCgpCdXQgaWYgeW91IHdhbnQgdG8gcGxheSBhdCB0aGlz
IGdhbWUsIG15IHRhZyBpcyB0ZWNobmljYWxseSB2YWxpZCAKYmVjYXVzZSAiVEhFIFJFU1QiIGVu
Z2xvYmVzIHRoZSBmdWxsIFhlbiBjb2RlYmFzZSAoTm90ZSB0aGUgKiBpbiB0aGUgCk1BSU5UQUlO
RVJTIGZpbGUpLiBXZSBoYXBwZW4gdG8gbm90IGJlIENDZWQgYnkgCnNjcmlwdHMvZ2V0X21haW50
YWluZXJzLnBsIGJlY2F1c2UgKnlvdSogd2VyZSBub3QgaGFwcHkgdG8gYmUgc3BhbW1lZC4uLiAK
U28gd2UgbW9kaWZpZWQgdGhlIHNjcmlwdHMuCgpJbiB0aGlzIHBhcnRpY3VsYXIgY2FzZSwgSSBz
dGFuZCB3aXRoIHRoZSBhY2tlZC1ieSBiZWNhdXNlIEkgYW0gcmVhZHkgdG8gCnRha2UgdGhlIGJs
YW1lIGlmIHNvbWV0aGluZyBnb2VzIHdyb25nIHdpdGggdGhlIHBhdGNoLiBTdWNoIG1lYW5pbmcg
aXMgCmlzIG5vdCBjb252ZXllZCB3aXRoICJyZXZpZXdlZC1ieSIuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
