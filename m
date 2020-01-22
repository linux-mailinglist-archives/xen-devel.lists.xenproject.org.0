Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 972AD145431
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 13:09:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuElq-0002Q3-GY; Wed, 22 Jan 2020 12:06:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuElo-0002Pw-9m
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 12:06:04 +0000
X-Inumbo-ID: 8e800b1c-3d0f-11ea-bc2a-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e800b1c-3d0f-11ea-bc2a-12813bfff9fa;
 Wed, 22 Jan 2020 12:06:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s144so1455654wme.1
 for <xen-devel@lists.xen.org>; Wed, 22 Jan 2020 04:06:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ipfCrtFayIAn4r9aXqSaL7I4RcQ2iTR8Zj97MKsGE24=;
 b=Qqd/dVchokRF2l6AN0eQzvfhQMKKfKu7N9VvdFHvamglnxwoKmPtwLo4S+Gw2UP7EC
 i/4gk2ULrJVN5kLMYwvoEZsefMZBP7kjJuYAj88jdvPwAFybouljB7Ug0Rkr9QMU3zK+
 UM3ljKkwRtxJFQGL6YxmDBxE3Ubpj3SgxBu+0HSIG9iFTMIBKcHHgIi0E7aD2Ldl49zC
 4lJWVlJKpw3/lWdpXyRGETbBzLNGCiJoHNMduFi6LtpfGhnkzVV5ncicGkbOO4uI3/Vh
 22TbyCVtxJmDH7C0vbrE9RMZl9U2jcuZCYQopCgbz8XCVaN5PGtwxXbisGKiYzS/CRps
 9Jpw==
X-Gm-Message-State: APjAAAWeYc/ISRsoud04Ov8Vn3Ke3atlU6afxWhd7qYTL4uX0lBcBRTS
 kGVeIeXPfX5CQQHydl24MjM=
X-Google-Smtp-Source: APXvYqyz95s4nwGJFvzi8uSBUYBA0/hSTCKcIOwuc23kzmG/Vuj2Pge1zaoG/8+hosceXogozpopkQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
 e9mr2700292wma.6.1579694760862; 
 Wed, 22 Jan 2020 04:06:00 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id k11sm3694714wmc.20.2020.01.22.04.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 04:06:00 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c831c7da-2414-5135-d989-1b5c55cd996d@xen.org>
Date: Wed, 22 Jan 2020 12:05:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <18e39089-80e7-07be-d2fe-409fa1dfc083@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 2/2] xsm: hide detailed Xen version from
 unprivileged guests
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>,
 xen-devel@lists.xen.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgR2VvcmdlLAoKT24gMjIvMDEvMjAyMCAxMDo1NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBP
biAxLzIyLzIwIDEwOjE0IEFNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIyLzAx
LzIwMjAgMTA6MDEsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+PiBPbiAyMC8wMS8yMDIwIDEwOjAx
LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNy4wMS4yMDIwIDE3OjQ0LCBTZXJnZXkgRHlh
c2xpIHdyb3RlOgo+Pj4+PiB2MiAtLT4gdjM6Cj4+Pj4+IC0gUmVtb3ZlIGh2bWxvYWRlciBmaWx0
ZXJpbmcKPj4+Pgo+Pj4+IFdoeT8gU2VlaW5nIHRoZSBwcmlvciBkaXNjdXNzaW9uLCBob3cgYWJv
dXQgYWRkaW5nIFhFTlZFUl9kZW5pZWQgdG8KPj4+PiByZXR1cm4gdGhlICJkZW5pZWQiIHN0cmlu
ZywgYWxsb3dpbmcgY29tcG9uZW50cyB3aGljaCB3YW50IHRvIGZpbHRlcgo+Pj4+IHRvIGtub3cg
ZXhhY3RseSB3aGF0IHRvIGxvb2sgZm9yPyBBbmQgdGhlbiByZS1hZGQgdGhlIGZpbHRlcmluZyB5
b3UKPj4+PiBoYWQ/IChUaGUgaGVscCB0ZXh0IG9mIHRoZSBjb25maWcgb3B0aW9uIHNob3VsZCB0
aGVuIHBlcmhhcHMgYmUKPj4+PiBleHRlbmRlZCB0byBtYWtlIHZlcnkgY2xlYXIgdGhhdCB0aGUg
Y2hvc2VuIHN0cmluZyBzaG91bGQgbm90IG1hdGNoCj4+Pj4gYW55dGhpbmcgdGhhdCBjb3VsZCBw
b3RlbnRpYWxseSBiZSByZXR1cm5lZCBieSBhbnkgb2YgdGhlIFhFTlZFUl8KPj4+PiBzdWItb3Bz
LikKPj4+Cj4+PiBJIGhhZCB0aGUgZm9sbG93aW5nIHJlYXNvbmluZzoKPj4+Cj4+PiAxLiBNb3N0
IHJlYWwtd29ybGQgdXNlcnMgd291bGQgc2V0IENPTkZJR19YU01fREVOSUVEX1NUUklORz0iIiBh
bnl3YXkuCj4+Pgo+Pj4gMi4gRmlsdGVyaW5nIGluIERNSSB0YWJsZXMgaXMgbm90IGEgY29tcGxl
dGUgc29sdXRpb24sIHNpbmNlIGRlbmllZAo+Pj4gc3RyaW5nIGxlYWtzIGVsc2V3aGVyZSB0aHJv
dWdoIHRoZSBoeXBlcmNhbGwgKFBWIGd1ZXN0cywgc3lzZnMsIGRyaXZlcgo+Pj4gbG9ncykgYXMg
QW5kcmV3IGhhcyBwb2ludGVkIG91dCBpbiB0aGUgcHJldmlvdXMgZGlzY3Vzc2lvbi4KPj4+Cj4+
PiBPbiB0aGUgb3RoZXIgaGFuZCwgU01CaW9zIGZpbHRlcmluZyBzbGlnaHRseSBpbXByb3ZlcyB0
aGUgc2l0dWF0aW9uIGZvcgo+Pj4gSFZNIGRvbWFpbnMsIHNvIEkgY2FuIHJldHVybiBpdCBpZiBt
YWludGFpbmVycyBmaW5kIGl0IHdvcnRoeS4KPj4KPj4gV2hpbGUgSSBhbSBub3QgYSBtYWludGFp
bmVyIG9mIHRoaXMgY29kZSwgbXkgY29uY2VybiBpcyB5b3UgaW1wb3NlIHRoZQo+PiBjb252ZXJz
aW9uIGZyb20gImRlbmllZCIgdG8gIiIgdG8gYWxsIHRoZSB1c2VycyAoaW5jbHVkZSB0aG9zZSB3
aG8gd2FudHMKPj4gdG8ga2VlcCAiZGVuaWVkIikuCj4+Cj4+IElmIHlvdSB3ZXJlIGRvaW5nIGFu
eSBmaWx0ZXJpbmcgaW4gaHZtbG9hZGVyLCB0aGVuIGl0IHdvdWxkIGJlIGJlc3QgaWYKPj4gdGhp
cyBpcyBjb25maWd1cmFibGUuIEJ1dCB0aGlzIGlzIGEgYml0IHBvaW50bGVzcyBpZiB5b3UgYWxy
ZWFkeSBhbGxvdwo+PiB0aGUgdXNlciB0byBjb25maWd1cmUgdGhlIHN0cmluZyBhdCB0aGUgaHlw
ZXJ2aXNvciBsZXZlbCA6KS4KPiAKPiBTbyB0aGVyZSBhcmUgdHdvIHRoaW5ncyB3ZSdyZSBjb25j
ZXJuZWQgYWJvdXQ6Cj4gLSBTb21lIHBlb3BsZSBkb24ndCB3YW50IHRvIHNjYXJlIHVzZXJzIHdp
dGggYSAiPGRlbmllZD4iIHN0cmluZwo+IC0gU29tZSBwZW9wbGUgZG9uJ3Qgd2FudCB0byAic2ls
ZW50bHkgZmFpbCIgd2l0aCBhICIiIHN0cmluZwo+IAo+IFRoZSBmYWN0IGlzLCBpbiAqYm90aCBj
YXNlcyosIHRoaXMgaXMgYSBVSSBwcm9ibGVtLiAgRVZFUlkgY2FsbGVyIG9mCj4gdGhpcyBpbnRl
cmZhY2Ugc2hvdWxkIGZpZ3VyZSBvdXQgaW5kZXBlbmRlbnRseSB3aGF0IGEgZ3JhY2VmdWwgd2F5
IG9mCj4gaGFuZGxpbmcgZmFpbHVyZSBpcyBmb3IgdGhlaXIgdGFyZ2V0IFVJLiAgQW55IGNhbGxl
ciB3aG8gZG9lcyBub3QgdGhpbmsKPiBjYXJlZnVsbHkgYWJvdXQgd2hhdCB0byBkbyBpbiB0aGUg
ZmFpbHVyZSBjYXNlIGlzIGJ1Z2d5IC0tIHdoaWNoCj4gaW5jbHVkZXMgZXZlcnkgc2luZ2xlIGNh
bGxlciB0b2RheS4gIFRoZSBDT05GSUdfWFNNX0RFTklFRF9TVFJJTkcgaXMgYQo+IGdyb3NzIGhh
Y2sgZmFsbGJhY2sgZm9yIGJ1Z2d5IFVJcy4KCkkgYWdyZWUgdGhhdCB0aGUgdHdvIGNhc2VzIHlv
dSBleHBsYWluZWQgYXJlIFVJIHByb2JsZW1zLiBIb3dldmVyLCBJIGNhbiAKc2VlIG90aGVyIHVz
ZSBmb3IgdGhlIEtjb25maWcgb3B0aW9uICh3aXRoIHNvbWUgdHdlYWtzKS4KCkF0IEFXUywgY29u
c2lzdGVuY3kgYWNjcm9zcyB0d28gc3RhYmxlIHZlcnNpb25zIGlzIHZlcnkgaW1wb3J0YW50LiBT
byAKbW9zdCBvZiB0aGUgdmVyc2lvbiBzdHJpbmdzIGV4cG9zZWQgdG8gdGhlIGd1ZXN0IGFyZSBm
aXhlZC4gVGhlcmVmb3JlIGEgCmd1ZXN0IGNhbiBiZSBtaWdyYXRlZCBzZWVtbGVzc2x5IGJldHdl
ZW4gdHdvIGRpZmZlcmVudCB2ZXJzaW9ucyB3aXRob3V0IApzZWVuIGFueSBjaGFuZ2UgdGhhdCBt
YXkgYnJlYWsgaXQuCgpZb3UgY291bGQgaW1hZ2luZSB1c2luZyBYU00gdG8ga25vdyB3aGV0aGVy
IHlvdSB3YW50IHRvIGV4cG9zZSB0aGUgZ3Vlc3QgCnRoZSByZWFsIG9yIGZpeGVkIHZlcnNpb24g
c3RyaW5ncy4gUHV0IGl0IHRoYXQgd2F5LCB0aGlzIHNvdW5kcyBsZXNzIGEgCmdyb3NzIGhhY2sg
b3ZlciAiPGRlbmllZD4iLgoKVGhlIHVzZSBjYXNlIGRlc2NyaWJlZCB3b3VsZCByZXF1aXJlIG11
bHRpcGxlIEtjb25maWcgb3B0aW9ucyB0aG91Z2guCgo+IAo+IE5vdywgSSBkb24ndCBsaWtlIHRv
IHRlbGwgb3RoZXIgcGVvcGxlIHRvIGRvIHdvcmssIGFuZCBJIGNlcnRhaW5seSBkb24ndAo+IHBs
YW4gb24gZml4aW5nIGh2bWxvYWRlciBhdCB0aGUgbW9tZW50LCBiZWNhdXNlIGl0J3MgbG93LXBy
aW9yaXR5IGZvcgo+IG1lLiAgQnV0IEkgZG8gdGhpbmsgdGhhdCBoYXZpbmcgaHZtbG9hZGVyIGRl
dGVjdCBmYWlsdXJlIGFuZCBleHBsaWNpdGx5Cj4gbWFrZSBhIHNlbnNpYmxlIGRlY2lzaW9uIGlz
IHRoZSByaWdodCB0aGluZyB0byBkbywgcmVnYXJkbGVzcyBvZiB0aGUKPiBhdmFpbGFiaWxpdHkg
b2YgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HIHRvIHdvcmsgYXJvdW5kIGJ1Z2d5IGNhbGxlcnMu
CgpUaGUgbGVuZ3RoeSBkaXNjdXNzaW9uIGFib3V0IHJldHVybmluZyAiPGRlbmllZD4iIHNob3dz
IHRoYXQgd2UgCihYZW5Qcm9qZWN0IGNvbW11bml0eSkgYXJlIG5vdCBpbiBwb3NpdGlvbiB0byBk
ZWNpZGUgd2hhdCBpcyB0aGUKc2Vuc2libGUgdmFsdWUgaGVyZSAoZXZlbiBmb3IgZmlsdGVyaW5n
KS4KCkJ5IGFsbG93aW5nIGEgdmVuZG9yIHRvIGNvbmZpZ3VyZSB0aGUgc3RyaW5nIGluIHRoZSBo
eXBlcnZpc29yLCB5b3UgCnJlbW92ZSB0aGF0IGRlY2lzaW9uIGZyb20gdXMuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
