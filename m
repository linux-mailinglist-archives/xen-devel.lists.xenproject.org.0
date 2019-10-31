Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA233EAB49
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 09:05:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQ5Om-0002zk-Px; Thu, 31 Oct 2019 08:01:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I6hz=YY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iQ5Ol-0002zf-1J
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 08:01:39 +0000
X-Inumbo-ID: a9e3ebc2-fbb4-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9e3ebc2-fbb4-11e9-bbab-bc764e2007e4;
 Thu, 31 Oct 2019 08:01:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2827ABBD;
 Thu, 31 Oct 2019 08:01:36 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
Date: Thu, 31 Oct 2019 09:01:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMTAuMjAxOSAxOTowMSwgSm9lIEppbiB3cm90ZToKPiBPbiAxMC8zMC8xOSAxMDoyMyBB
TSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4gT24gV2VkLCBPY3QgMzAsIDIwMTkgYXQgMDk6
Mzg6MTZBTSAtMDcwMCwgSm9lIEppbiB3cm90ZToKPj4+IE9uIDEwLzMwLzE5IDE6MjQgQU0sIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4gQ2FuIHlvdSB0cnkgdG8gYWRkIHRoZSBmb2xsb3dp
bmcgZGVidWcgcGF0Y2ggb24gdG9wIG9mIHRoZSBleGlzdGluZwo+Pj4+IG9uZSBhbmQgcmVwb3J0
IHRoZSBvdXRwdXQgdGhhdCB5b3UgZ2V0IG9uIHRoZSBYZW4gY29uc29sZT8KPj4+Cj4+PiBBcHBs
aWVkIGRlYnVnIHBhdGNoIGFuZCBydW4gdGhlIHRlc3QgYWdhaW4sIG5vdCBvZiBhbnkgbG9nIHBy
aW50ZWQsCj4+PiBhdHRhY2hlZCBYZW4gbG9nIG9uIHNlcmlhbCBjb25zb2xlLCBzZWVtcyBwaV91
cGRhdGVfaXJ0ZSgpIG5vdCBiZWVuCj4+PiBjYWxsZWQgZm9yIGlvbW11X2ludHBvc3Qgd2FzIGZh
bHNlLgo+Pgo+PiBJIGhhdmUgdG8gYWRtaXQgSSdtIGxvc3QgYXQgdGhpcyBwb2ludC4gRG9lcyBp
dCBtZWFuIHRoZSBvcmlnaW5hbAo+PiBpc3N1ZSBoYWQgbm90aGluZyB0byBkbyB3aXRoIHBvc3Rl
ZCBpbnRlcnJ1cHRzPwo+IAo+IExvb2tzIHdoZW4gaW5qZWN0IGlycSBieSB2bGFwaWNfc2V0X2ly
cSgpLCBpdCBjaGVja2VkIGJ5Cj4gaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIgcmF0aGVy
IHRoYW4gaW9tbXVfaW50cG9zdDoKPiAKPiAgMTc2ICAgICBpZiAoIGh2bV9mdW5jcy5kZWxpdmVy
X3Bvc3RlZF9pbnRyICkKPiAgMTc3ICAgICAgICAgaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2lu
dHIodGFyZ2V0LCB2ZWMpOwo+IAo+IEFuZCBkZWxpdmVyX3Bvc3RlZF9pbnRyKCkgd291bGQgYmUg
dGhlcmUsIHdoZW4gdm14IGVuYWJsZWQ6Cj4gCj4gKFhFTikgSFZNOiBWTVggZW5hYmxlZAo+IChY
RU4pIEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRldGVjdGVkCj4gKFhFTikg
SFZNOiBIQVAgcGFnZSBzaXplczogNGtCLCAyTUIsIDFHQgoKSSBjYW4ndCBzZWUgdGhlIGNvbm5l
Y3Rpb24uIHN0YXJ0X3ZteCgpIGhhcwoKICAgIGlmICggY3B1X2hhc192bXhfcG9zdGVkX2ludHJf
cHJvY2Vzc2luZyApCiAgICB7CiAgICAgICAgYWxsb2NfZGlyZWN0X2FwaWNfdmVjdG9yKCZwb3N0
ZWRfaW50cl92ZWN0b3IsIHBpX25vdGlmaWNhdGlvbl9pbnRlcnJ1cHQpOwogICAgICAgIGlmICgg
aW9tbXVfaW50cG9zdCApCiAgICAgICAgICAgIGFsbG9jX2RpcmVjdF9hcGljX3ZlY3RvcigmcGlf
d2FrZXVwX3ZlY3RvciwgcGlfd2FrZXVwX2ludGVycnVwdCk7CgogICAgICAgIHZteF9mdW5jdGlv
bl90YWJsZS5kZWxpdmVyX3Bvc3RlZF9pbnRyID0gdm14X2RlbGl2ZXJfcG9zdGVkX2ludHI7CiAg
ICAgICAgdm14X2Z1bmN0aW9uX3RhYmxlLnN5bmNfcGlyX3RvX2lyciAgICAgPSB2bXhfc3luY19w
aXJfdG9faXJyOwogICAgICAgIHZteF9mdW5jdGlvbl90YWJsZS50ZXN0X3BpciAgICAgICAgICAg
ID0gdm14X3Rlc3RfcGlyOwogICAgfQoKaS5lLiB0aGUgaG9vayBpcyBwcmVzZW50IG9ubHkgd2hl
biBwb3N0ZWQgaW50ZXJydXB0cyBhcmUKYXZhaWxhYmxlIGluIGdlbmVyYWwuIEkuZS4gYWxzbyB3
aXRoIGp1c3QgQ1BVLXNpZGUgcG9zdGVkCmludGVycnVwdHMsIHllcywgd2hpY2ggZ2V0cyBjb25m
aXJtZWQgYnkgeW91ciAiYXBpY3Y9MCIKdGVzdC4gWWV0IHdpdGgganVzdCBDUFUtc2lkZSBwb3N0
ZWQgaW50ZXJydXB0cyBJJ20Kc3RydWdnbGluZyBhZ2FpbiB0byB1bmRlcnN0YW5kIHlvdXIgb3Jp
Z2luYWwgcHJvYmxlbQpkZXNjcmlwdGlvbiwgYW5kIHRoZSBuZWVkIHRvIGZpZGRsZSB3aXRoIElP
TU1VIHNpZGUgY29kZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
