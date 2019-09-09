Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9DAD306
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 08:19:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Cy5-0006lr-3G; Mon, 09 Sep 2019 06:16:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Cy3-0006lm-FR
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 06:16:03 +0000
X-Inumbo-ID: 4b6a6b8e-d2c9-11e9-ac08-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b6a6b8e-d2c9-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 06:16:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21412AEAE;
 Mon,  9 Sep 2019 06:16:00 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-16-git-send-email-chao.gao@intel.com>
 <3b455c41-b5a3-2533-99a8-2200def4b19f@citrix.com>
 <20190826080759.GB11910@gao-cwp> <20190827045159.GA28509@gao-cwp>
 <d95a5b28-04c6-dcc6-8b16-fc4ade330c15@suse.com>
 <20190830063506.GD31905@gao-cwp> <20190909055210.GA28376@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cc016d67-6f85-44f2-2410-ef1cb739cb5e@suse.com>
Date: Mon, 9 Sep 2019 08:16:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190909055210.GA28376@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 15/15] microcode: block #NMI handling
 when loading an ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDkuMjAxOSAwNzo1MiwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBBdWcgMzAsIDIw
MTkgYXQgMDI6MzU6MDZQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6Cj4+PiBEb2luZyB0aGUgYWN0
dWFsIHVjb2RlIHVwZGF0ZSBpbnNpZGUgYW4gTk1JIGhhbmRsZXIgc2VlbXMgcmF0aGVyIHJpc2t5
Cj4+PiB0byBtZS4gRXZlbiBpZiBBc2hvayBjb25maXJtZWQgaXQgd291bGQgbm90IGJlIGFuIGlz
c3VlIG9uIHBhc3QgYW5kCj4+PiBjdXJyZW50IEludGVsIENQVXMgLSB3aGF0IGFib3V0IGZ1dHVy
ZSBvbmVzLCBvciBvbmVzIGZyb20gb3RoZXIgdmVuZG9ycz8KPj4KPiAKPiBJbnRlbCBTRE0gZG9l
c24ndCBzYXkgdGhhdCBsb2FkaW5nIHVjb2RlIGlzbid0IGFsbG93ZWQgaW5zaWRlIGFuIE5NSQo+
IGhhbmRsZXIuIFNvIGl0IGlzIGFsbG93ZWQgaW1wbGljaXRseS4KCldlbGwsIGlmIHRoZSBTRE0g
d2FzIGNvbXBsZXRlIGFuZCBjb3JyZWN0IGV2ZXJ5d2hlcmUgZWxzZSwgSSdkIGFncmVlCnRvIHN1
Y2ggYW4gaW50ZXJwcmV0YXRpb24gLyBpbXBsaWNhdGlvbi4KCj4gSWYgZnV0dXJlIENQVXMgY2Fu
bm90IGxvYWQgdWNvZGUKPiBpbiBOTUkgaGFuZGxlciwgU0RNIHNob3VsZCBkb2N1bWVudCBpdCBh
bmQgYXQgdGhhdCB0aW1lLCB3ZSBjYW4gbW92ZQo+IHVjb2RlIGxvYWRpbmcgb3V0IG9mIE5NSSBo
YW5kbGVyIGZvciBuZXcgQ1BVUy4gQXMgdG8gQU1ELCBpZiBzb21lb25lCj4gb2JqZWN0cyB0byB0
aGlzIGFwcHJvYWNoLCBsZXQncyB1c2UgdGhpcyBhcHByb2FjaCBmb3IgSW50ZWwgb25seS4KCkdl
dHRpbmcgYSBkZWZpbml0aXZlIHN0YXRlbWVudCBtYXkgdHVybiBvdXQgZGlmZmljdWx0LiBCdXQg
SSBndWVzcyBpZgp5b3Ugc3VwcG9ydCBib3RoIGFwcHJvYWNoZXMgYW55d2F5LCBoYXZpbmcgYSBj
b21tYW5kIGxpbmUgb3B0aW9uIHRvCm92ZXJyaWRlIHRoZSBkZWZhdWx0IGJlaGF2aW9yIHdvdWxk
bid0IGJlIG11Y2ggbW9yZSB0aGFuIGEgMSBsaW5lCmFkZGl0aW9uPwoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
