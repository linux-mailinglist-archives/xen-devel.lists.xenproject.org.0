Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F265983521
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 17:23:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv1GE-0006vK-2b; Tue, 06 Aug 2019 15:20:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hv1GC-0006vE-R2
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 15:20:24 +0000
X-Inumbo-ID: b54fda45-b85d-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b54fda45-b85d-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 15:20:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1020DAFA4;
 Tue,  6 Aug 2019 15:20:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190805124301.12887-1-andrew.cooper3@citrix.com>
 <20190805124301.12887-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <873a4d08-82c7-0342-7576-ba5cb2b8ae45@suse.com>
Date: Tue, 6 Aug 2019 17:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190805124301.12887-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/4] x86/boot: Minor improvements to
 efi_arch_post_exit_boot()
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNDo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBTcGxpdCB1cCB0aGUg
bG9uZyBhc20gYmxvY2sgYnkgY29tbWVudGluZyB0aGUgbG9naWNhbCBzdWJzZWN0aW9ucy4KPiAK
PiBUaGUgbW92YWJzIGZvciBvYnRhaW5pbmcgX19zdGFydF94ZW4gY2FuIGJlIGEgcmlwLXJlbGF0
aXZlIGxlYSBpbnN0ZWFkLiAgVGhpcwo+IGhhcyB0aGUgYWRkZWQgYWR2YW50YWdlIHRoYXQgb2Jq
ZHVtcCBjYW4gbm93IGNyb3NzIHJlZmVyZW5jZSBpdCBkdXJpbmcKPiBkaXNhc3NlbWJseS4KCkkn
bSBzdXJwcmlzZWQgdGhpcyB3b3JrcywgYnV0IEkgdGFrZSBpdCB0aGF0IHlvdSd2ZSB0ZXN0ZWQg
aXQ6IEF0CnRoZSB0aW1lIHRoZSBhc20oKSBleGVjdXRlcywgSSB0aG91Z2h0IHdlJ3JlIHN0aWxs
IGluICh3aGF0IEVGSQpjYWxscykgcGh5c2ljYWwgbW9kZSwgaS5lLiAlcmlwIGhvbGRpbmcgYSB2
YWx1ZSBsZXNzIHRoYW4gNEdiLgpBY2Nlc3NpbmcgbWVtb3J5IHVzaW5nICVyaXAtcmVsYXRpdmUg
YWRkcmVzc2luZyBpcyBmaW5lLCBzaW5jZQp0aGUgWGVuIGltYWdlIGlzIG1hcHBlZCBpbiBib3Ro
IHBsYWNlcywgYnV0IG9idGFpbmluZyB0aGUgbmV3CmxpbmVhciBhZGRyZXNzIGZvciAlcmlwIHRo
aXMgd2F5IHZpYSBsZWEgc2hvdWxkIG5vdCBiZSwgYXMgdGhpcwp3b3VsZG4ndCBtb3ZlIHVzIHRv
IHRoZSBYRU5fVklSVF97U1RBUlQsRU5EfSByYW5nZS4gSSdtIGN1cmlvdXMKdG8gbGVhcm4gd2hp
Y2ggcGFydCBvZiBteSB1bmRlcnN0YW5kaW5nIGlzIHdyb25nIGhlcmUuCgo+IFRoZSBzdGFjayBo
YW5kaW5nIGlzIGNvbmZ1c2luZyB0byBmb2xsb3cuICAlcnNwIGlzIHNldCB1cCBieSByZWFkaW5n
Cj4gc3RhY2tfc3RhcnQgd2hpY2ggaXMgYSBwb2ludGVyIHRvIGNwdTBfc3RhY2ssIHRoZW4gY29u
c3RydWN0aW5nIGFuIGxyZXQgZnJhbWUKPiB1bmRlciAlcnNwICh0byBhdm9pZCBjbG9iYmVyaW5n
IHdoYXRldmVyIGlzIGFkamFjZW50IHRvIGNwdTBfc3RhY2spLCBhbmQgdXNlcwo+IHRoZSBQYXNj
YWwgZm9ybSBvZiBscmV0IHRvIG1vdmUgJXJzcCB0byB0aGUgYmFzZSBvZiBjcHUwX3N0YWNrLgo+
IAo+IFJlbW92ZSBzdGFja19zdGFydCBmcm9tIHRoZSBtaXggYW5kIHVzZSBhIHNpbmdsZSBsZWEg
dG8gbG9hZCBjcHUwX3N0YWNrIGJhc2UKPiBkaXJlY3RseSwKCkkgZGlzYWdyZWUgd2l0aCB0aGlz
IGNoYW5nZSwgYXQgbGVhc3QgYXMgbG9uZyBhcwp4ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBh
bHNvIHJlYWRzIGZyb20gc3RhY2tfc3RhcnQsIHJhdGhlciB0aGFuCmFjY2Vzc2luZyBjcHUwX3N0
YWNrIGRpcmVjdGx5LiBUaGUgY29kZSBoZXJlIGlzIGludGVuZGVkIHRvIG1pcnJvcgp3aGF0J3Mg
YmVpbmcgZG9uZSBvbiB0aGUgbm9uLUVGSSBwYXRoLiBBbmQgaXQgd2FzIGFsd2F5cyBteQp1bmRl
cnN0YW5kaW5nIHRoYXQgaXQncyBkb25lIHRoaXMgd2F5IHN1Y2ggdGhhdCBvbmUgd291bGQgbmVl
ZCB0byBnbwpodW50IGZvciB1c2VzIGlmIG9uZSB3YW50ZWQgdG8gY2hhbmdlIHdoYXQgKHJpZ2h0
IG5vdykgc3RhY2tfc3RhcnQKcG9pbnRzIGF0IGR1cmluZyBwcmUtU01QIGJvb3QuIE90aGVyd2lz
ZSBzdGFja19zdGFydCB3b3VsZG4ndCBuZWVkCmFuIGluaXRpYWxpemVyIGFueW1vcmUsIGFuZCBo
ZW5jZSBjb3VsZCBtb3ZlIHRvIC5ic3MuCgo+IGFuZCB1c2UgdGhlIG1vcmUgY29tbW9uIHB1c2gv
cHVzaC9scmV0cSBzZXF1ZW5jZSBmb3IgcmVsb2FkaW5nICVjcy4KCkkgZG9uJ3Qgc2VlIHdoYXQn
cyB3cm9uZyB3aXRoIHdoYXQgeW91IGNhbGwgIlBhc2NhbCBmb3JtIiBvZiBscmV0CihDJ3MgX19z
dGRjYWxsIHVzZXMgdGhpcyBhcyB3ZWxsLCBmb3IgZXhhbXBsZSkuIEkgZG9uJ3QgaGVhdmlseQpt
aW5kIHRoaXMgdHJhbnNmb3JtYXRpb24sIGJ1dCAoSSdtIHNvcnJ5IHRvIHNheSB0aGF0KSBpdCBs
b29rcyB0bwptZSBhcyBpZiB0aGlzIHdhcyBhIGNoYW5nZSBmb3IgdGhlIHNha2Ugb2YgY2hhbmdp
bmcgdGhlIGNvZGUsIG5vdApmb3IgbWFraW5nIGl0IGFueSAiYmV0dGVyIiAoZm9yIHdoYXRldmVy
IGRlZmluaXRpb24gb2YgImJldHRlciIpLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
