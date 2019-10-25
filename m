Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C9DE5658
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 00:01:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO7a1-0007rE-5n; Fri, 25 Oct 2019 21:57:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UNuW=YS=amazon.de=prvs=19410fd9f=nmanthey@srs-us1.protection.inumbo.net>)
 id 1iO7a0-0007r9-6b
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 21:57:08 +0000
X-Inumbo-ID: 61639f64-f772-11e9-94cc-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 61639f64-f772-11e9-94cc-12813bfff9fa;
 Fri, 25 Oct 2019 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1572040625; x=1603576625;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=J8tr4vinK6qlojImgJCjXOyXap8WeOSg1DyD5Dmn3jI=;
 b=jCygryYfXuJRDsk7HWXWjFcMK5jJ+NJ1O9g17+x0GluZ57aYOQFakJ4m
 rARqJtM3w+9S4tzdP+BHt1RrGLDT4umdHaaQSUGiF1opWl1dp39xEtat6
 39rTzvwZlQyVlUxvKw6kiVOyKY2ufHcDVyNMVy/5ZCMzzOv+Pc8a3BZSx c=;
IronPort-SDR: 4uXnSTRTMLC6BdE+ChhmdtN3u1oKBHcbB8EDEc50qz0Uel/KUDzK7CG4AquT8YBtPDDpb9BfW8
 5IOWmXsataCw==
X-IronPort-AV: E=Sophos;i="5.68,230,1569283200"; 
   d="scan'208";a="696210"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 25 Oct 2019 21:57:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id A12F824562E; Fri, 25 Oct 2019 21:57:00 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 25 Oct 2019 21:57:00 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.160.100) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 25 Oct 2019 21:56:55 +0000
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-3-andrew.cooper3@citrix.com>
 <9a76e252-b9a3-4454-6ca8-ab521276fc31@suse.com>
 <782089aa-7994-f471-3c52-2afb30f95812@citrix.com>
 <c12afdd1-c561-bc79-5c36-22ac2e994953@suse.com>
 <6d7c899e-81ab-bc61-a589-043b327b3137@citrix.com>
 <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <5b6b2cd3-b8a5-7697-e6f4-f7c337242276@amazon.de>
Date: Fri, 25 Oct 2019 23:56:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <477a6513-0caf-fc4a-21cf-a3a101b6c5ca@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.100]
X-ClientProxiedBy: EX13D08UWB001.ant.amazon.com (10.43.161.104) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 2/7] xen/nospec: Use always_inline to fix
 code gen for evaluate_nospec
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAvMjUvMTkgMTc6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI1LjEwLjIwMTkgMTc6
MjcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDI1LzEwLzIwMTkgMTM6MzQsIEphbiBCZXVs
aWNoIHdyb3RlOgo+Pj4gT24gMjUuMTAuMjAxOSAxNDoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBUaGUgdHdvIGNob2ljZXMgdG8gdW5ibG9jayA0LjEzIGFyZSB0aGlzIHBhdGNoLCBvciB0
aGUgcHJldmlvdXMgdmVyc2lvbgo+Pj4+IHdoaWNoIG1hZGUgQ09ORklHX0hBUkRFTl9CUkFOQ0gg
ZGVwZW5kIG9uIEJST0tFTiwgd2hpY2ggd2FzIGV2ZW4gbW9yZQo+Pj4+IGRpc2xpa2VkLgo+Pj4g
T3B0aW9uIDMgaXMgdG8gaGF2ZSBqdXN0IHRoZSBjb25maWcgb3B0aW9uLCBmb3IgcGVvcGxlIHRv
IHR1cm4gdGhpcwo+Pj4gb2ZmIGlmIHRoZXkgZmVlbCBsaWtlIGRvaW5nIHNvLgo+PiBZZXMsIGJ1
dCBuby7CoCBBIGZhY2FkZSBvZiBzZWN1cml0eSBpcyB3b3JzZSB0aGFuIG5vIHNlY3VyaXR5LCBh
bmQgSQo+PiBkb24ndCBjb25zaWRlciBkb2luZyB0aGF0IGFuIGFjY2VwdGFibGUgc29sdXRpb24g
aW4gdGhpcyBjYXNlLgo+IEJ1dCBJIHRob3VnaHQgd2UgYWxsIGFncmVlIHRoYXQgdGhpcyBpcyBz
b21ldGhpbmcgdGhhdCdzIHByZXN1bWFibHkKPiBnb2luZyB0byByZW1haW4gaW5jb21wbGV0ZSAo
YXMgaW4gbm90IHByb3ZhYmx5IGNvbXBsZXRlKSBhbHRvZ2V0aGVyCj4gYW55d2F5LiBJdCdzIGp1
c3QgdGhhdCB3aXRob3V0IHRoZSBjaGFuZ2UgaGVyZSBpdCdzIGZhciBtb3JlCj4gaW5jb21wbGV0
ZSB0aGVuIHdpdGggaXQuCj4KPiBJbiBhbnkgZXZlbnQgSSB0aGluayB3ZSBzaG91bGQgKGFsc28p
IGhhdmUgYW4gb3BpbmlvbiBmcm9tIHRoZSBwZW9wbGUKPiB3aG8gaGFkIG9yaWdpbmFsbHkgY29u
dHJpYnV0ZWQgdGhpcyBsb2dpYy4gWW91IGRpZG4ndCBDYyBhbnlvbmUgb2YKPiB0aGVtOyBJJ3Zl
IGFkZGVkIGF0IGxlYXN0IE5vcmJlcnQgbm93LgoKVGhhbmtzIGZvciBhZGRpbmcgbWUuIEkgaGFk
IGEgcXVpY2sgbG9vayBpbnRvIHRoZSBkaXNjdXNzaW9uLiBPbmx5Cm1ha2luZyBhZGRpbmcgbGZl
bmNlIHN0YXRlbWVudHMgYXJvdW5kIGNvbmRpdGlvbmFscyBkZXBlbmRpbmcgb24gY29uZmlnCkJS
T0tFTiBkb2VzIG5vdCBoZWxwLCBhcyBpdCB3b3VsZCBzdGlsbCBuZWVkIHRvIGJlIGFsd2F5c19p
bmxpbmUgdG8gd29yawphcyBleHBlY3RlZCwgY29ycmVjdD8gSGVuY2UsIGluIG15IG9waW5pb24s
IHRoaXMgcGF0Y2ggZG9lcyB0aGUgcmlnaHQKdGhpbmcgdG8gYmVuZWZpdCBmcm9tIHRoZSBsZmVu
Y2VzIHRoYXQgYXJlIHBsYWNlZCBhZnRlciBldmFsdWF0aW9uCmNvbmRpdGlvbmFscy4KCkZyb20g
YSAiaXMgdGhpcyBsZmVuY2UgcmVxdWlyZWQiIHBvaW50IG9mIHZpZXcsIHdlIGhhdmUgYmVlbiBh
YmxlIHRvCnRyaWdnZXIgbG9hZHMgd2hlcmUgdGhlIGxmZW5jZSBoYXMgbm90IGJlZW4gcHJlc2Vu
dCwgYW5kIGNvdWxkIG5vdApyZXByb2R1Y2UgYW55IG1vcmUgb25jZSB3ZSBhZGRlZCB0aGUgbGZl
bmNlIHN0YXRlbWVudHMgb24gYm90aCBicmFuY2hlcwphZnRlciB0aGUgY29uZGl0aW9uYWwganVt
cC4KCkJlc3QsCk5vcmJlcnQKCj4KPiBKYW4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBH
ZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVu
ZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRz
Z2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVz
dC1JRDogREUgMjg5IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
