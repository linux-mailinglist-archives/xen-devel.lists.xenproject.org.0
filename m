Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD64A1454E9
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 14:16:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFpY-0000M8-7A; Wed, 22 Jan 2020 13:14:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuFpX-0000M3-8J
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:13:59 +0000
X-Inumbo-ID: 07ccbe30-3d19-11ea-9fd7-bc764e2007e4
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07ccbe30-3d19-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 13:13:50 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id q6so7173545wro.9
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jan 2020 05:13:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZtOJLOZV/qxB6ILhNRiP5uJ0nGd92Wb7Z8Lm3D0fr0E=;
 b=jkBJX8VT9DJl/rjP/+DlnmjSpCd4/Kxn+b4cAENb13pzhjYgGx8u/b4O2oMOZDYnkR
 /WHekeUDjmmjcQQhfQi+xKfd+KR6DdlowphRaN5w8cB1B3hTztfDhykVvb+9tSPq4YW4
 VNJgbjfu9QC86nRXWaYwGc6ABI2f5s47QzSuHnsb8f1ym2rWmTrnhRFmz2myhIZbw4PU
 CqjJMluEjYk4rFbDCzL6EWDInhSkA4IlXl4ZIx0s7yDrtDCvJQ8zPfmGbd6tQHhzJIz8
 x/il4zrf2TisOLPAHGUCAK3GwzDorFwrDxer2utAqkDGQLO1pOH1y++L5MM0ZfJtRu/w
 rniw==
X-Gm-Message-State: APjAAAXK7TeEgmJO/JVgyFG4lD48Yxarxpjj+9woHHMtoU4JLwt4n2z/
 dCmN9/rn5w/R4LxZxbEOWHQ=
X-Google-Smtp-Source: APXvYqz758iAShilU5EM9+sCnXc2t0kQblvixFQbFIziQgD+0jLZPHV/pbU9ZivXXyH2SuWg2dqrcQ==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr11735036wrs.217.1579698829886; 
 Wed, 22 Jan 2020 05:13:49 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id w19sm3725099wmc.22.2020.01.22.05.13.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 05:13:49 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200120143142.19820-1-julien@xen.org>
 <a45e0622-3974-7b4b-c093-81362ad1b18f@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b9174b70-64d9-949c-1b94-de13e963a65a@xen.org>
Date: Wed, 22 Jan 2020 13:13:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a45e0622-3974-7b4b-c093-81362ad1b18f@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages
 associated to struct domain
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
Cc: David Woodhouse <dwmw@amazon.co.uk>, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gMjIvMDEvMjAyMCAxMjo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyMC8wMS8yMDIwIDE0OjMxLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEZyb206IEp1bGllbiBH
cmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4+Cj4+IFRoZSBzdHJ1Y3R1cmUgZG9tYWluIG1heSBi
ZSBiaWdnZXIgdGhhbiBhIHBhZ2Ugc2l6ZSB3aGVuIGxvY2sgcHJvZmlsaW5nCj4+IGlzIGVuYWJs
ZWQuIEhvd2V2ZXIsIHRoZSBmdW5jdGlvbiBmcmVlX2RvbWhlYXBfc3RydWN0IHdpbGwgb25seSBm
cmVlIHRoZQo+PiBmaXJzdCBwYWdlLgo+Pgo+PiBUaGlzIGlzIG5vdCBhIHNlY3VyaXR5IGlzc3Vl
IGJlY2F1c2Ugc3RydWN0IGRvbWFpbiBjYW4gb25seSBiZSBiaWdnZXIKPj4gdGhhbiBhIHBhZ2Ug
c2l6ZSBmb3IgbG9jayBwcm9maWxpbmcuIFRoZSBmZWF0dXJlIGNhbiBvbmx5IGJlIHNlbGVjdGVk
Cj4+IGluIERFQlVHIGFuZCBFWFBFUlQgbW9kZS4KPj4KPj4gRml4ZXM6IDg5MTZmY2Y0NTc3ICgi
eDg2L2RvbWFpbjogY29tcGlsZSB3aXRoIGxvY2tfcHJvZmlsZT15IGVuYWJsZWQiKQo+PiBSZXBv
cnRlZC1ieTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KPj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KPj4gLS0tCj4+ICAgeGVuL2Fy
Y2gveDg2L2RvbWFpbi5jIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5j
IGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+IGluZGV4IDI4ZmVmYTFmODEuLmE1MzgwYjliYWIg
MTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvZG9tYWluLmMKPj4gQEAgLTM0NCw3ICszNDQsNyBAQCBzdHJ1Y3QgZG9tYWluICphbGxvY19k
b21haW5fc3RydWN0KHZvaWQpCj4+ICAgCj4+ICAgdm9pZCBmcmVlX2RvbWFpbl9zdHJ1Y3Qoc3Ry
dWN0IGRvbWFpbiAqZCkKPj4gICB7Cj4+IC0gICAgZnJlZV94ZW5oZWFwX3BhZ2UoZCk7Cj4+ICsg
ICAgZnJlZV94ZW5oZWFwX3BhZ2VzKGQsIGdldF9vcmRlcl9mcm9tX2J5dGVzKHNpemVvZigqZCkp
KTsKPiAKPiA6KAo+IAo+IEknbSBlbnRpcmVseSBjZXJ0YWluIEkgcmFpc2VkIHRoaXMgZHVyaW5n
IHRoZSByZXZpZXcgb2YgdGhlIG9yaWdpbmFsIHBhdGNoLgo+IAo+IEknZCBtdWNoIHJhdGhlciBz
ZWUgdGhlIG9yaWdpbmFsIHBhdGNoIHJldmVydGVkLsKgIFRoZSBjdXJyZW50IHNpemUgb2YKPiBz
dHJ1Y3QgZG9tYWluIHdpdGggbG9ja3Byb2ZpbGUgZW5hYmxlZCBpcyAzMjAwIGJ5dGVzLgoKTGV0
IG1lIGhhdmUgYSBsb29rIGZpcnN0IHRvIHNlZSB3aGVuL3doeSBzdHJ1Y3QgZG9tYWluIGlzIGxl
c3MgdGhhbiA0SyAKd2l0aCBsb2NrcHJvZmlsZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
