Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B555118428
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:53:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iecAI-0004GU-Tc; Tue, 10 Dec 2019 09:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iecAI-0004GH-30
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:50:46 +0000
X-Inumbo-ID: 88eb58f4-1b32-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88eb58f4-1b32-11ea-88e7-bc764e2007e4;
 Tue, 10 Dec 2019 09:50:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 82FA2AE2D;
 Tue, 10 Dec 2019 09:50:44 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191209180638.47305-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d6996147-f3f3-4d3e-f451-9e8678f89a2b@suse.com>
Date: Tue, 10 Dec 2019 10:51:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209180638.47305-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: store cr4 during suspend/resume
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxOTowNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnRseSBj
cjQgaXMgbm90IGNhY2hlZCBiZWZvcmUgc3VzcGVuc2lvbiwgYW5kIG1tdV9jcjRfZmVhdHVyZXMg
aXMKPiB1c2VkIGluIG9yZGVyIHRvIHJlc3RvcmUgdGhlIGV4cGVjdGVkIGNyNCB2YWx1ZS4gVGhp
cyBpcyBjb3JyZWN0IHNvCj4gZmFyIGJlY2F1c2UgdGhlIHRhc2tsZXQgdGhhdCBleGVjdXRlcyB0
aGUgc3VzcGVuZC9yZXN1bWUgY29kZSBpcwo+IHJ1bm5pbmcgaW4gdGhlIGlkbGUgdkNQVSBjb250
ZXh0Lgo+IAo+IEluIG9yZGVyIHRvIG1ha2UgdGhlIGNvZGUgbGVzcyBmcmFnaWxlLCBleHBsaWNp
dGx5IHNhdmUgdGhlIGN1cnJlbnQKPiBjcjQgdmFsdWUgYmVmb3JlIHN1c3BlbnNpb24sIHNvIHRo
YXQgaXQgY2FuIGJlIHJlc3RvcmVkIGFmdGVyd2FyZHMuCj4gVGhpcyBlbnN1cmVzIHRoYXQgdGhl
IGNyNCB2YWx1ZSBjYWNoZWQgaW4gdGhlIGNwdV9pbmZvIGRvZXNuJ3QgZ2V0IG91dAo+IG9mIHN5
bmMgYWZ0ZXIgcmVzdW1lIGZyb20gc3VzcGVuc2lvbi4KPiAKPiBTdWdnZXN0ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
