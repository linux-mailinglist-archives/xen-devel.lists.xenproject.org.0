Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598491453C8
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:29:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuE9B-0007Df-J2; Wed, 22 Jan 2020 11:26:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cJAe=3L=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iuE99-0007DT-TX
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 11:26:07 +0000
X-Inumbo-ID: f6843978-3d09-11ea-9fd7-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6843978-3d09-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 11:25:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q10so6821031wrm.11
 for <xen-devel@lists.xen.org>; Wed, 22 Jan 2020 03:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gVlPFCUFLBghzzIBDKLVZ7WxCGtzbo2IAIJeuruES5M=;
 b=F+lrMgS5ohvwXF0edY7H2DsAGJ+A3CqWCxv96sWkXQj56iwxV7kGf2ik6ZuEOwh9Zd
 LiLhIfp6300iBOcHWrbfnhnMpquvJ7FEHWSZLMAH7cT9VdWVo0tq1B0c5FGO3g5dpDVC
 Mxj5WBWeT9Xf/ek1zTUwtwILlfzpVBAo19IAdRDs7ME08ikmW8H2XxhJATtUln88qD/C
 7FEBTp7M8wSLLnMIKtCN4737uxDMlOVP3MIn6G2e9wBXxRl7ri9JqU2gSXEp6XxYFZVX
 VOCMPO1pKEhsqu4/CJn4yhfJtVUSgklZ8cHR++LTIi7wkazSS5g7myD77l45eL1APbjw
 anAw==
X-Gm-Message-State: APjAAAUl7jPpdXxLa8X4PIzpBiYxYeAwKRPgP2F++UzRUgDbC/sYMVvS
 7lBXhCgRA1p3ccTmtFrsQC8=
X-Google-Smtp-Source: APXvYqxP0CwVrzP3ZI5BQAg6ta8Ukch0axtbQcOaGQ4lewLwBNx7Vu2SlEVsz6UQleUybeb94bwlew==
X-Received: by 2002:adf:9104:: with SMTP id j4mr10583163wrj.221.1579692358344; 
 Wed, 22 Jan 2020 03:25:58 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-233.amazon.com.
 [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id i5sm3601222wml.31.2020.01.22.03.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jan 2020 03:25:57 -0800 (PST)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20200117164432.32245-1-sergey.dyasli@citrix.com>
 <20200117164432.32245-2-sergey.dyasli@citrix.com>
 <7049fbf6-9bac-d9bf-4505-a80a8171dd40@suse.com>
 <6223c8e8-ff2a-e4fe-fea4-8661c4c44524@citrix.com>
 <e1e6c1c9-0f11-4346-965c-f1336e0adb05@xen.org>
 <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2fc63e2d-13da-d468-2c97-a0ee9029d09c@xen.org>
Date: Wed, 22 Jan 2020 11:25:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <67b7b3ab-6714-4acc-ff2b-34c355c41488@citrix.com>
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

CgpPbiAyMi8wMS8yMDIwIDExOjE5LCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+IE9uIDIyLzAxLzIw
MjAgMTA6MTQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4KPj4KPj4gT24gMjIvMDEvMjAyMCAxMDow
MSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4+IE9uIDIwLzAxLzIwMjAgMTA6MDEsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4+IE9uIDE3LjAxLjIwMjAgMTc6NDQsIFNlcmdleSBEeWFzbGkgd3JvdGU6
Cj4+Pj4+IHYyIC0tPiB2MzoKPj4+Pj4gLSBSZW1vdmUgaHZtbG9hZGVyIGZpbHRlcmluZwo+Pj4+
Cj4+Pj4gV2h5PyBTZWVpbmcgdGhlIHByaW9yIGRpc2N1c3Npb24sIGhvdyBhYm91dCBhZGRpbmcg
WEVOVkVSX2RlbmllZCB0bwo+Pj4+IHJldHVybiB0aGUgImRlbmllZCIgc3RyaW5nLCBhbGxvd2lu
ZyBjb21wb25lbnRzIHdoaWNoIHdhbnQgdG8gZmlsdGVyCj4+Pj4gdG8ga25vdyBleGFjdGx5IHdo
YXQgdG8gbG9vayBmb3I/IEFuZCB0aGVuIHJlLWFkZCB0aGUgZmlsdGVyaW5nIHlvdQo+Pj4+IGhh
ZD8gKFRoZSBoZWxwIHRleHQgb2YgdGhlIGNvbmZpZyBvcHRpb24gc2hvdWxkIHRoZW4gcGVyaGFw
cyBiZQo+Pj4+IGV4dGVuZGVkIHRvIG1ha2UgdmVyeSBjbGVhciB0aGF0IHRoZSBjaG9zZW4gc3Ry
aW5nIHNob3VsZCBub3QgbWF0Y2gKPj4+PiBhbnl0aGluZyB0aGF0IGNvdWxkIHBvdGVudGlhbGx5
IGJlIHJldHVybmVkIGJ5IGFueSBvZiB0aGUgWEVOVkVSXwo+Pj4+IHN1Yi1vcHMuKQo+Pj4KPj4+
IEkgaGFkIHRoZSBmb2xsb3dpbmcgcmVhc29uaW5nOgo+Pj4KPj4+IDEuIE1vc3QgcmVhbC13b3Js
ZCB1c2VycyB3b3VsZCBzZXQgQ09ORklHX1hTTV9ERU5JRURfU1RSSU5HPSIiIGFueXdheS4KPj4+
Cj4+PiAyLiBGaWx0ZXJpbmcgaW4gRE1JIHRhYmxlcyBpcyBub3QgYSBjb21wbGV0ZSBzb2x1dGlv
biwgc2luY2UgZGVuaWVkCj4+PiBzdHJpbmcgbGVha3MgZWxzZXdoZXJlIHRocm91Z2ggdGhlIGh5
cGVyY2FsbCAoUFYgZ3Vlc3RzLCBzeXNmcywgZHJpdmVyCj4+PiBsb2dzKSBhcyBBbmRyZXcgaGFz
IHBvaW50ZWQgb3V0IGluIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uLgo+Pj4KPj4+IE9uIHRoZSBv
dGhlciBoYW5kLCBTTUJpb3MgZmlsdGVyaW5nIHNsaWdodGx5IGltcHJvdmVzIHRoZSBzaXR1YXRp
b24gZm9yCj4+PiBIVk0gZG9tYWlucywgc28gSSBjYW4gcmV0dXJuIGl0IGlmIG1haW50YWluZXJz
IGZpbmQgaXQgd29ydGh5Lgo+Pgo+PiBXaGlsZSBJIGFtIG5vdCBhIG1haW50YWluZXIgb2YgdGhp
cyBjb2RlLCBteSBjb25jZXJuIGlzIHlvdSBpbXBvc2UgdGhlIGNvbnZlcnNpb24gZnJvbSAiZGVu
aWVkIiB0byAiIiB0byBhbGwgdGhlIHVzZXJzIChpbmNsdWRlIHRob3NlIHdobyB3YW50cyB0byBr
ZWVwICJkZW5pZWQiKS4KPiAKPiBUaGlzIGlzIG5vdCB3aGF0J3MgaGFwcGVuaW5nIGhlcmU6IHRo
ZSBkZWZhdWx0IGlzIHN0aWxsICI8ZGVuaWVkPiIgKGFzCj4gcGVyIHBhdGNoIDEpOyBidXQgcGF0
Y2ggMiBtYWtlcyBYRU5WRVJfZXh0cmF2ZXJzaW9uLCBYRU5WRVJfY29tcGlsZV9pbmZvCj4gYW5k
IFhFTlZFUl9jaGFuZ2VzZXQgdG8gcmV0dXJuICI8ZGVuaWVkPiIgaW5zdGVhZCBvZiB0aGUgcmVh
bCB2YWx1ZXMKPiB3aGljaCBjYXVzZXMgdGhlIFVJIC8gbG9ncyBpc3N1ZXMuCgpJIHdhcyByZWZl
cnJpbmcgdGhlIFNNQmlvcyBmaWx0ZXJpbmcuLi4gSSBkb24ndCB0aGluayBkb2luZyBhIGJsYW5r
IApmaWx0ZXJpbmcgaXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGluIHRoZSBodm1sb2FkZXIgZm9y
IHRoZSByZWFzb24gCmV4cGxhaW5lZCBhYm92ZS4KClJlZ2FyZGluZyBDT05GSUdfWFNNX0RFTklF
RF9TVFJJTkcsIEkgdGhpbmsgdGhpcyBpcyBhIGdvb2Qgc3RlcCBhcyBpdCAKYWxsb3dzIHRoZSB2
ZW5kb3IgdG8gY29uZmlndXJlIGl0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
