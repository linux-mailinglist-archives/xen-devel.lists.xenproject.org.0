Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474115CD38
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 22:27:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Lxs-0000N3-RZ; Thu, 13 Feb 2020 21:24:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=91ql=4B=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j2Lxr-0000My-Fh
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 21:24:03 +0000
X-Inumbo-ID: 282f6368-4ea7-11ea-bc8e-bc764e2007e4
Received: from mail-qv1-f41.google.com (unknown [209.85.219.41])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 282f6368-4ea7-11ea-bc8e-bc764e2007e4;
 Thu, 13 Feb 2020 21:24:02 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id g6so3338005qvy.5
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2020 13:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z4TWcPdgQOVBEiEh7xs3icSC/wfjuyqCbLz2fXCqmXQ=;
 b=Ul7HzGvlcFf0N21+6Sn2xKYW8e1ZLNCwzFGT8W5ZpWjd8myuTzs7TINiIN9G8fy0qo
 5wfEC7DQCWIuq3dBBjjhXMMkT3mUrmlv6PE9mrBy1ImO29obMCPm9rrrVoTDvY06+ZbW
 S2GOfo84TCMLa7kZA2HUNECyaQkx6CC0Mu097EVottgbNutlxd7Sebc9ARO6MF57iBvb
 nhBtxYosyBVw1u+tGPCVTNk1a/CrQPbUwVY3OraNwluIEgsemDuEegtPX8WXq86/mv9K
 EMkY5R8CF06J8lZelmaoP2RhQ9isHUWadH+tJRHeFJdRKDFemkWI1i2zZ98vlgV+D3UA
 dPuw==
X-Gm-Message-State: APjAAAUqbqalxfWJEBJryU6qP9mdsN9Xf/zCmAxiLLvqyG6tGBsZ8FVt
 aikU5pK4Lwv33uw9IQyM+DzT8xqvWcNY+A==
X-Google-Smtp-Source: APXvYqygtlaX5uOu5bPTdBcQdaOy3GtD67WbOwM5RZ9NbzpX34sdSVECqrVLjXTc4au4Dki038kRrw==
X-Received: by 2002:a05:6214:50f:: with SMTP id
 v15mr25956582qvw.42.1581629042277; 
 Thu, 13 Feb 2020 13:24:02 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id x28sm1931608qkx.104.2020.02.13.13.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 13:24:01 -0800 (PST)
To: Andrei Cherechesu <andrei.cherechesu@nxp.com>
References: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e5db3141-3557-f074-7fa3-e39ea6d8cf75@xen.org>
Date: Thu, 13 Feb 2020 22:23:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB5807A9BC95A9D956D052DB7DF91A0@VI1PR04MB5807.eurprd04.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] Having a DOM-U guest with 1:1 mapping in the second
 stage MMU.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMy8wMi8yMDIwIDE4OjI3LCBBbmRyZWkgQ2hlcmVjaGVzdSB3cm90ZToKPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+Cj4gU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDEzLCAyMDIwIDAwOjAzCj4gVG86IFN0ZWZh
bm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEFuZHJlaSBDaGVyZWNoZXN1
IDxhbmRyZWkuY2hlcmVjaGVzdUBueHAuY29tPgo+IENjOiBKb3JnZSBQZXJlaXJhIDxqb3JnZS5w
ZXJlaXJhQG54cC5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0
OiBSZTogW1hlbi1kZXZlbF0gSGF2aW5nIGEgRE9NLVUgZ3Vlc3Qgd2l0aCAxOjEgbWFwcGluZyBp
biB0aGUgc2Vjb25kIHN0YWdlIE1NVS4KPiAKPiBIZWxsbywKPiAKPiBJIHVzZWQgdGhlIFhlbiBm
cm9tIFN0ZWZhbm8ncyB0cmVlIGFuZCBtYWRlIHRoZSB1cGRhdGVzIHRvIHRoZSBwYXJ0aWFsCj4g
ZHRiIHRoYXQgaGUgc3BlY2lmaWVkLgo+IAo+PiBUaGlzIGlzIG1vc3RseSBsaWtlbHkgYmVjYXVz
ZSBMaW51eCBpcyB0cnlpbmcgdG8gYWNjZXNzIGEgcmVnaW9uCj4+IHRoYXQgaXMgbm90IG1hcHBl
ZCBpbiBzdGFnZS0yLiBZb3UgY2FuIHJlYnVpbGQgWGVuIHdpdGggZGVidWcgZW5hYmxlZAo+PiBh
bmQgeW91IHNob3VsZCBzZWUgYSBtZXNzYWdlICJ0cmFwcy5jOi4uLiIgdGVsbGluZyB0aGUgZXhh
Y3QgcGh5c2ljYWwKPj4gYWRkcmVzcyBhY2Nlc3NlZC4KPj4KPj4gSW4gZ2VuZXJhbCBJIHdvdWxk
IHJlY29tbWVuZCB0byBidWlsZCBYZW4gd2l0aCBkZWJ1ZyBlbmFibGVkIGR1cmluZyBkZXZlbG9w
bWVudCBhcyB0aGUgaHlwZXJ2aXNvciB3aWxsIGdpdmUgeW91IG1vcmUgaW5mb3JtYXRpb24gb2Yg
d2hhdCdzIGdvaW5nIG9uLgo+Pgo+PiBDaGVlcnMsCj4+Cj4+IC0tCj4+IEp1bGllbiBHcmFsbAo+
IAo+IEkgZW5hYmxlZCBkZWJ1ZyBjb25maWcgYW5kIGdhdmUgaXQgYW5vdGhlciB0cnkuIEJ1dCBJ
J20gc3RpbGwKPiBnZXR0aW5nIHRoZSBzYW1lIHVuaGFuZGxlZCBmYXVsdCBlcnJvciwgdGhhdCBz
ZWVtcyB0byBtYXRjaCB3aGF0Cj4gSnVsaWVuIGRlc2NyaWJlZCBhYm92ZS4KPiAKPiBJdCBpcyBp
bmRlZWQgYSBzdGFnZS0yIGFib3J0IGNhdXNlZCBieSB0aGUgZ3Vlc3QuCj4gCj4gSSBhdHRhY2hl
ZCB0aGUgRG9tVTEgY3Jhc2ggbG9nIGF0IFswXS4KPiAKPiBbMF0gaHR0cHM6Ly9wYXN0ZWJpbi5j
b20vQlNIVkZRaUsKCiBGcm9tIHRoZSBsb2c6CgooWEVOKSB0cmFwcy5jOjE5NzM6ZDF2MCBIU1I9
MHg5MzlmMDA0NiBwYz0weGZmZmZmZjgwMDgzYWM4NjQgCmd2YT0weGZmZmZmZjgwMDgwMGQwNDgg
Z3BhPTB4MDAwMDAwNDAyZjAwNDgKClNvIHRoZSBndWVzdCBpcyB0cnlpbmcgdG8gYWNjZXNzIHRo
ZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzIAoweDAwMDAwMDQwMmYwMDQ4LiBMb29raW5nIGF0IHRo
ZSBwYXJ0aWFsIGRldmljZSB0cmVlIHlvdSBwcm92aWRlZCwgeW91IAphcmUgcmVxdWVzdGluZyBY
ZW4gdG8gbWFwIHRoZSByYW5nZSAweDQwMDJmMDAwIC0gMHg0MDAzMDAwMC4KClRoZSBhZGRyZXNz
IGRvZXMgbm90IGJlbG9uZyB0byB0aGUgcmFuZ2UuIENvdWxkIHlvdSBjaGVjayB3aGV0aGVyIHlv
dSAKZGlkIHBhc3N0aHJvdWdoIHRoZSBjb3JyZWN0IHJhbmdlPyAoSXQgc2VlbXMgbGlrZSBhIHpl
cm8gaXMgbWlzc2luZykuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
