Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B91A18C9E4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 10:15:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFDhV-0005fJ-5m; Fri, 20 Mar 2020 09:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=AByC=5F=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jFDhU-0005fE-1h
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 09:12:20 +0000
X-Inumbo-ID: e640de0a-6a8a-11ea-b34e-bc764e2007e4
Received: from mail-ed1-f65.google.com (unknown [209.85.208.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e640de0a-6a8a-11ea-b34e-bc764e2007e4;
 Fri, 20 Mar 2020 09:12:19 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z65so6336637ede.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Mar 2020 02:12:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dKMgbqiA1urNYo/BSfEHVrKfpKiI28zEsVHWixBZTec=;
 b=qbkUp42vGxMX66uiGluYolQyds6UG3C73hi46sArc37YBTFQS5lBUxp1Lk29FpiOgZ
 k4v3GsqE2rQ4N9NlIG6ezt5XbQEO6uirFFyd5CS7KEDjLsTCeBY6YFlhIE6M7zde4FPj
 gu7iH+LjJgpBLjO82PYTnTF9lBCJlaJ+pIAyTvr4fKqx8d1fE3+DZOCd2COU/U3B1wjY
 oaSuiiKTOKRGSpZdOZSdhCmGhrx+HgJIR/VvU6lf67VBP8UfwOthHq2UoMxxGJBeob0q
 sf+1YJ5VYbcf96CzoB+3WZh+LR0Py3gupBrY0bO9QcZ2cChLoHpIme5y6AEJiViknpD4
 COxg==
X-Gm-Message-State: ANhLgQ0tkxqexCPjwtHl5IhgrgXqKPRvVhrZTuQ7IIDCf0WCd4LUWVyX
 6mY0PIwY1HZ+ESwewcKBNdA=
X-Google-Smtp-Source: ADFU+vtqjBqJJVsZEp+9BKHw2RUpgaiRhBtsQo4TV/9x2ppUWLzDgdfbam0++gFF2MudyBPUzBbm2Q==
X-Received: by 2002:a50:aa9c:: with SMTP id q28mr6727435edc.10.1584695538605; 
 Fri, 20 Mar 2020 02:12:18 -0700 (PDT)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id q23sm306907eja.74.2020.03.20.02.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 02:12:17 -0700 (PDT)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
From: Julien Grall <julien@xen.org>
Message-ID: <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
Date: Fri, 20 Mar 2020 09:12:16 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320090155.GS24458@Air-de-Roger.citrite.net>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUm9nZXIsCgpPbiAyMC8wMy8yMDIwIDA5OjAxLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA4OjIxOjE5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSwK
Pj4+Cj4+PiBPbiAxOS8wMy8yMDIwIDE4OjQzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+
IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1v
bm7DqSB3cm90ZToKPj4+Pj4+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA0OjIxOjIzUE0gKzAw
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+ICDCoCA+PiBXaHkgY2FuJ3QgeW91IGtlZXAg
Zmx1c2hfdGxiX21hc2soKSBoZXJlPwo+Pj4+Pj4KPj4+Pj4+IEJlY2F1c2UgZmlsdGVyZWRfZmx1
c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFwLCBhbmQKPj4+Pj4+IGNoYW5n
ZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlLgo+
Pj4+Pgo+Pj4+PiBJIGFtIGFmcmFpZCB0aGlzIGRvZXMgbm90IHlldCBleHBsYWluIG1lIHdoeSBm
bHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBiZQo+Pj4+PiB1cGRhdGVkIHNvIGl0IGZsdXNoIHRo
ZSBBU0lEIG9uIEFNRCBoYXJkd2FyZS4KPj4+Pgo+Pj4+IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlv
dXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24KPj4+PiBldmVyeSBUTEIg
Zmx1c2guCj4+Pj4KPj4+PiBmbHVzaF90bGJfbWFzayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2
IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdzIG5vCj4+Pj4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMu
IFRoaXMgcHJldmVudHMgdXNpbmcgYXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4+Pj4gd2hlbiBy
dW5uaW5nIG5lc3RlZCwgc2luY2UgdGhvc2UgYXNzaXN0ZWQgZmx1c2hlcyBwZXJmb3JtZWQgYnkg
TDAKPj4+PiBkb24ndCBmbHVzaCB0aGUgTDIgZ3Vlc3RzIFRMQnMuCj4+Pj4KPj4+PiBJIGNvdWxk
IGtlZXAgY3VycmVudCBiZWhhdmlvciBhbmQgbGVhdmUgZmx1c2hfdGxiX21hc2sgYWxzbyBmbHVz
aGluZyB0aGUKPj4+PiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhlIGZ1bmN0aW9u
IGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBpbgo+Pj4+IGl0J3MgbmFtZSB0aGF0IHN1Z2dlc3RzIGl0
IGFsc28gZmx1c2hlcyB0aGUgaW4tZ3Vlc3QgVExCcyBmb3IgSFZNLgo+Pj4KPj4+IEkgYWdyZWUg
dGhlIG5hbWUgaXMgY29uZnVzaW5nLCBJIGhhZCB0byBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlv
biB0byB1bmRlcnN0YW5kIHdoYXQgaXQgZG9lcy4KPj4+Cj4+PiBIb3cgYWJvdXQgcmVuYW1pbmcg
KG9yIGludHJvZHVjaW5nKSB0aGUgZnVuY3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFz
aygpIG9yIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSkgPwo+Pgo+PiBBbmQgdGhpcyB3
b3VsZCB0aGVuIGZsdXNoIF9vbmx5XyBndWVzdCBUTEJzPwo+IAo+IE5vLCBJIHRoaW5rIGZyb20g
SnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkpCj4gZmx1c2hf
dGxiX2FsbF9ndWVzdHNfbWFzayB3b3VsZCBkbyB3aGF0IGZsdXNoX3RsYl9tYXNrIGN1cnJlbnRs
eSBkb2VzCj4gcHJldmlvdXMgdG8gdGhpcyBwYXRjaCAoZmx1c2ggWGVuJ3MgVExCcyArIEhWTSBB
U0lEcykuCgpJdCBsb29rcyBsaWtlIHRoZXJlIG1pZ2h0IGJlIGNvbmZ1c2lvbiBvbiB3aGF0ICJn
dWVzdCBUTEJzIiBtZWFucy4gSW4gbXkgCnZpZXcgdGhpcyBtZWFucyBhbnkgVExCcyBhc3NvY2lh
dGVkIGRpcmVjdGx5IG9yIGluZGlyZWN0bHkgd2l0aCB0aGUgCmd1ZXN0LiBPbiBBcm0sIHRoaXMg
d291bGQgYmUgbnVrZToKICAgIC0gZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGd1ZXN0IHBoeXNp
Y2FsIGFkZHJlc3MgVExCIGVudHJ5CiAgICAtIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgLT4gaG9z
dCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQogICAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3Mg
LT4gaG9zdCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQoKSSB3b3VsZCBhc3N1bWUgeW91IHdh
bnQgc29tZXRoaW5nIHNpbWlsYXIgb24geDg2LCByaWdodD8KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
