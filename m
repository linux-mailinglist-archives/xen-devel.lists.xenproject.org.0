Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512413AC1D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:19:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irMyu-0006wB-5A; Tue, 14 Jan 2020 14:15:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VOhe=3D=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1irMys-0006w6-Nr
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:15:42 +0000
X-Inumbo-ID: 53cb6e5e-36d8-11ea-a985-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53cb6e5e-36d8-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 14:15:33 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so12277204wrl.13
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2020 06:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QsQ/kAiIQZRxqCdAyOu3mUG2gRzH3yIJ0mOUT6NAh3M=;
 b=fNzRjBDthPJa35bf+zlUvxp6OA/H68VBkR7aZDXaE95Gjkjx92XEOADvHmtPgqzjBs
 ILkF1RzmdrMYY1PWycCQqQDAI78Qbz2AQL3GB7Cl2sncNmM9UaEqmOudNzpwg0RdEm/n
 kRnjE84xlsQvf98cys4gNe03Z5PVNGrXE4CYX4W+QsyTTVpicuhagenbS9ng2NU4JYa1
 NBs9Cy20TIJ/VNkl5Rab9G3ibmuTmWAxNTRvFWq5QVKNov9fK5OOZrHL5Lm1h9qhb5OA
 Ij2s1mG4e0bHvd4w8w0lOn4AFMzyQLblxy6w7rUmdryQvqcmAQh0qvDHYwWA+D2HLJEa
 5buQ==
X-Gm-Message-State: APjAAAVBQLkkc6ts5UYH0HRyEzezWY4PoQnpwG8xTWqHJgibSrMmnL0m
 t08SPGTLbWLYEijTh5EPv4I=
X-Google-Smtp-Source: APXvYqxBia0K/JBkszdBYSbmcCHarsCv12hJVZ0kYEdBWSeazCP7XV1HTzkG5aIVtYqfUAVXZS2xfQ==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr26637850wrr.82.1579011333046; 
 Tue, 14 Jan 2020 06:15:33 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id x17sm19437442wrt.74.2020.01.14.06.15.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 06:15:32 -0800 (PST)
To: David Woodhouse <dwmw2@infradead.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Xia, Hongyan"
 <hongyax@amazon.com>
References: <dbdedd077330af79c13ba5ed38b0aec0b7128886.camel@infradead.org>
 <4e3b0050ff7a8d1e40015181026562211e75c401.camel@infradead.org>
From: Julien Grall <julien@xen.org>
Message-ID: <1743ee7c-e238-8b77-d40f-bd0e3d6bb0ed@xen.org>
Date: Tue, 14 Jan 2020 14:15:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <4e3b0050ff7a8d1e40015181026562211e75c401.camel@infradead.org>
Content-Language: en-GB
Subject: Re: [Xen-devel] [RFC PATCH 0/3] Live update boot memory management
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGF2aWQsCgpPbiAxMy8wMS8yMDIwIDExOjU0LCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6Cj4g
T24gV2VkLCAyMDIwLTAxLTA4IGF0IDE3OjI0ICswMDAwLCBEYXZpZCBXb29kaG91c2Ugd3JvdGU6
Cj4+IFdoZW4gZG9pbmcgYSBsaXZlIHVwZGF0ZSwgWGVuIG5lZWRzIHRvIGJlIHZlcnkgY2FyZWZ1
bCBub3QgdG8gc2NyaWJibGUKPj4gb24gcGFnZXMgd2hpY2ggY29udGFpbiBndWVzdCBtZW1vcnkg
b3Igc3RhdGUgaW5mb3JtYXRpb24gZm9yIHRoZQo+PiBkb21haW5zIHdoaWNoIGFyZSBiZWluZyBw
cmVzZXJ2ZWQuCj4+Cj4+IFRoZSBpbmZvcm1hdGlvbiBhYm91dCB3aGljaCBwYWdlcyBhcmUgaW4g
dXNlIGlzIGNvbnRhaW5lZCBpbiB0aGUgbGl2ZQo+PiB1cGRhdGUgc3RhdGUgcGFzc2VkIGZyb20g
dGhlIHByZXZpb3VzIFhlbiDigJQgd2hpY2ggaXMgbW9zdGx5IGp1c3QgYQo+PiBndWVzdC10cmFu
c3BhcmVudCBsaXZlIG1pZ3JhdGlvbiBkYXRhIHN0cmVhbSwgZXhjZXB0IHRoYXQgaXQgcG9pbnRz
IHRvCj4+IHRoZSBwYWdlIHRhYmxlcyBpbiBwbGFjZSBpbiBtZW1vcnkgd2hpbGUgdHJhZGl0aW9u
YWwgbGl2ZSBtaWdyYXRpb24KPj4gb2J2aW91c2x5IGNvcGllcyB0aGUgcGFnZXMgc2VwYXJhdGVs
eS4KPj4KPj4gT3VyIGluaXRpYWwgaW1wbGVtZW50YXRpb24gYWN0dWFsbHkgcHJlcGVuZGVkIGEg
bGlzdCBvZiAnaW4tdXNlJyByYW5nZXMKPj4gdG8gdGhlIGxpdmUgdXBkYXRlIHN0YXRlLCBhbmQg
bWFkZSB0aGUgYm9vdCBhbGxvY2F0b3IgdHJlYXQgdGhlbSB0aGUKPj4gc2FtZSBhcyAnYmFkIHBh
Z2VzJy4gVGhhdCB3b3JrZWQgd2VsbCBlbm91Z2ggZm9yIGluaXRpYWwgZGV2ZWxvcG1lbnQKPj4g
YnV0IHdvdWxkbid0IHNjYWxlIHRvIGEgbGl2ZSBwcm9kdWN0aW9uIHN5c3RlbSwgbWFpbmx5IGJl
Y2F1c2UgdGhlIGJvb3QKPj4gYWxsb2NhdG9yIGhhcyBhIGxpbWl0IG9mIDUxMiBtZW1vcnkgcmFu
Z2VzIHRoYXQgaXQgY2FuIGtlZXAgdHJhY2sgb2YsCj4+IGFuZCBhIHJlYWwgc3lzdGVtIHdvdWxk
IGVuZCB1cCBtb3JlIGZyYWdtZW50ZWQgdGhhbiB0aGF0Lgo+Pgo+PiBNeSBvdGhlciBjb25jZXJu
IHdpdGggdGhhdCBhcHByb2FjaCBpcyB0aGF0IGl0IHJlcXVpcmVkIHR3byBwYXNzZXMgb3Zlcgo+
PiB0aGUgZG9tYWluLW93bmVkIHBhZ2VzLiBXZSBoYXZlIHRvIGRvIGEgbGF0ZXIgcGFzcyAqYW55
d2F5KiwgYXMgd2Ugc2V0Cj4+IHVwIG93bmVyc2hpcCBpbiB0aGUgZnJhbWV0YWJsZSBmb3IgZWFj
aCBwYWdlIOKAlCBhbmQgdGhhdCBoYXMgdG8gaGFwcGVuCj4+IGFmdGVyIHdlJ3ZlIG1hbmFnZWQg
dG8gYWxsb2NhdGUgYSAnc3RydWN0IGRvbWFpbicgZm9yIGVhY2ggcGFnZV9pbmZvIHRvCj4+IHBv
aW50IHRvLiBJZiB3ZSB3YW50IHRvIGtlZXAgdGhlIHBhdXNlIHRpbWUgZHVlIHRvIGEgbGl2ZSB1
cGRhdGUgZG93bgo+PiB0byBhIGJhcmUgbWluaW11bSwgZG9pbmcgdHdvIHBhc3NlcyBvdmVyIHRo
ZSBmdWxsIHNldCBvZiBkb21haW4gcGFnZXMKPj4gaXNuJ3QgbXkgZmF2b3VyaXRlIHN0cmF0ZWd5
LgoKV2UgYWN0dWFsbHkgbmVlZCBvbmUgbW9yZSBwYXNzIGZvciBQViBkb21haW4gKGF0IGxlYXN0
KS4gVGhlIHBhc3MgaXMgCnVzZWQgdG8gYWxsb2NhdGUgdGhlIHBhZ2UgdHlwZSAoZS5nIEw0LCBM
MSwuLi4pLiBUaGlzIGNhbid0IGJlIGRvbmUgCmJlZm9yZSBiZWNhdXNlIHdlIG5lZWQgdGhlIHBh
Z2VzIHRvIGJlbG9uZ3MgdG8gdGhlIGd1ZXN0IGJlZm9yZSBnb2luZyAKdGhyb3VnaCBpdHMgcGFn
ZS10YWJsZXMuCgo+Pgo+PiBTbyB3ZSd2ZSBzZXR0bGVkIG9uIGEgc2ltcGxlciBhcHByb2FjaCAC
4oCUIHJlc2VydmUgYSBjb250aWd1b3VzIHJlZ2lvbgo+PiBvZiBwaHlzaWNhbCBtZW1vcnkgd2hp
Y2ggKndvbid0KiBiZSB1c2VkIGZvciBkb21haW4gcGFnZXMuIExldCB0aGUgYm9vdAo+PiBhbGxv
Y2F0b3Igc2VlICpvbmx5KiB0aGF0IHJlZ2lvbiBvZiBtZW1vcnksIGFuZCBwbHVnIHRoZSByZXN0
IG9mIHRoZQo+PiBtZW1vcnkgaW4gbGF0ZXIgb25seSBhZnRlciBkb2luZyBhIGZ1bGwgcGFzcyBv
ZiB0aGUgbGl2ZSB1cGRhdGUgc3RhdGUuCgpJdCBpcyBhIGJpdCB1bmNsZWFyIHdoYXQgdGhlIHJl
Z2lvbiB3aWxsIGJlIHVzZWQgZm9yLiBJZiB5b3UgcGxhbiB0byBwdXQgCnRoZSBzdGF0ZSBvZiB0
aGUgVk1zIGluIGl0LCB0aGVuIHlvdSBjYW4ndCBwb3NzaWJseSB1c2UgaXQgZm9yIGJvb3QgCmFs
bG9jYXRpb24gKGUuZyBmcmFtZXRhYmxlKSBvdGhlcndpc2UgdGhpcyBtYXkgYmUgb3ZlcndyaXR0
ZW4gd2hlbiBkb2luZyAKdGhlIGxpdmUgdXBkYXRlLgpUaGUgcHJvYmxlbSB3b3VsZCBhcmlzZSBp
biB0aGUgZmlyc3QgWGVuIGJ1dCBhbHNvIGluIHRoZSBzZWNvbmQgWGVuIGlmIAp5b3UgcGxhbiB0
byBsaXZlIHVwZGF0ZSBhbm90aGVyIHRpbWUuCgpEaWQgSSBtaXNzIGFueXRoaW5nPwoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
