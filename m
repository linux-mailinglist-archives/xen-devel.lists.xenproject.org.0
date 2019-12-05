Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A0113DF7
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnOg-0008CI-7z; Thu, 05 Dec 2019 09:26:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnOf-0008CD-9I
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:26:05 +0000
X-Inumbo-ID: 4135915e-1741-11ea-8219-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4135915e-1741-11ea-8219-12813bfff9fa;
 Thu, 05 Dec 2019 09:26:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6865AC4D;
 Thu,  5 Dec 2019 09:26:01 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191204162025.37510-1-roger.pau@citrix.com>
 <20191204162025.37510-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <37cbbd56-ce4a-97ea-9b07-03f3ed4be50f@suse.com>
Date: Thu, 5 Dec 2019 10:26:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204162025.37510-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/4] x86/ioapic: only use dest32 with
 x2apic and interrupt remapping enabled
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

T24gMDQuMTIuMjAxOSAxNzoyMCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBJTy1BUElD
IGNvZGUgYXNzdW1lcyB0aGF0IHgyYXBpYyBiZWluZyBlbmFibGVkIGFsc28gaW1wbGllcwo+IGlu
dGVycnVwdCByZW1hcHBpbmcgYmVpbmcgZW5hYmxlZCwgYW5kIGhlbmNlIHdpbGwgdXNlIHRoZSAz
MmJpdAo+IGRlc3RpbmF0aW9uIGZpZWxkIGluIHRoZSBJTy1BUElDIGVudHJ5Lgo+IAo+IFRoaXMg
aXMgc2FmZSBub3csIGJ1dCB0aGVyZSdzIG5vIHJlYXNvbiB0byBub3QgZW5hYmxlIHgyQVBJQyBl
dmVuCj4gd2l0aG91dCBpbnRlcnJ1cHQgcmVtYXBwaW5nLCBhbmQgaGVuY2UgdGhlIElPLUFQSUMg
Y29kZSBuZWVkcyB0byB1c2UKPiB0aGUgMzIgYml0IGRlc3RpbmF0aW9uIGZpZWxkIG9ubHkgd2hl
biBib3RoIGludGVycnVwdCByZW1hcHBpbmcgYW5kCj4geDJBUElDIGFyZSBlbmFibGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoK
UmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
