Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8757213D718
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 10:42:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is1bc-0007F9-B9; Thu, 16 Jan 2020 09:38:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is1bZ-0007Er-Ss
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 09:38:21 +0000
X-Inumbo-ID: e7aeaee4-3843-11ea-ac27-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7aeaee4-3843-11ea-ac27-bc764e2007e4;
 Thu, 16 Jan 2020 09:38:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F0EDB1B3;
 Thu, 16 Jan 2020 09:38:08 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
 <20200115134408.GN11756@Air-de-Roger>
 <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
 <20200116093354.GP11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b7a410db-5305-dc52-775b-88f07740bf5a@suse.com>
Date: Thu, 16 Jan 2020 10:38:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200116093354.GP11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIEph
biAxNSwgMjAyMCBhdCAwNToyMToxNlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MTUuMDEuMjAyMCAxNDo0NCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPj4+IE9uIFdlZCwgSmFu
IDE1LCAyMDIwIGF0IDAxOjQ5OjIyUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IFdo
YXQgSSdtIHRoZW4gd29ycmllZCBhYm91dCBpcyB0b28KPj4+PiBsaXR0bGUgcHJvZ3Jlc3Mgb2Jz
ZXJ2YWJsZSBieSBndWVzdHMuIFRoZSBQViB0aW1lIHByb3RvY29sCj4+Pj4gb3VnaHQgdG8gYmUg
ZmluZSBpbiB0aGlzIHJlZ2FyZCAoYW5kIGNvbnN1bWVycyBvZiByYXcgVFNDIHZhbHVlcwo+Pj4+
IGFyZSBvbiB0aGVpciBvd24gYW55d2F5KSwgYnV0IHdvdWxkbid0IHlvdSBuZWVkIHRvIHVwZGF0
ZSBUU0MKPj4+PiBvZmZzZXRzIG9mIEhWTSBndWVzdHMgaW4gb3JkZXIgdG8gY29tcGVuc2F0ZSBm
b3IgdGhlIGVsYXBzZWQKPj4+PiB0aW1lPwo+Pj4KPj4+IFRoYXQgd2lsbCBiZSBkb25lIHdoZW4g
dGhlIEhWTSB2Q1BVIGdldHMgc2NoZWR1bGVkIGluIGFzIHBhcnQgb2YgdGhlCj4+PiB1cGRhdGVf
dmNwdV9zeXN0ZW1fdGltZSBjYWxsIEFGQUlDVC4gY3N0YXRlX3Jlc3RvcmVfdHNjIHdpbGwgYWx3
YXlzIGJlCj4+PiBjYWxsZWQgd2l0aCB0aGUgaWRsZSB2Q1BVIGNvbnRleHQsIGFuZCBoZW5jZSB0
aGVyZSdzIGFsd2F5cyBnb2luZyB0bwo+Pj4gYmUgYSB2Q1BVIHN3aXRjaCBiZWZvcmUgc2NoZWR1
bGluZyBhbnl0aGluZyBlbHNlLgo+Pgo+PiBXaGljaCBzdGVwIHdvdWxkIHRoaXMgYmU/IEFsbCBJ
IHNlZSBpcyBhIGNhbGwgdG8gaHZtX3NjYWxlX3RzYygpLgo+PiBJbiB0aW1lLmMgb25seSB0c2Nf
c2V0X2luZm8oKSBjYWxscyBodm1fc2V0X3RzY19vZmZzZXQoKS4KPiAKPiBNeSBiYWQsIEkndmUg
bWlzdGFrZW4gdGhlIHNjYWxpbmcgd2l0aCB0aGUgb2Zmc2V0Lgo+IAo+IEFjY291bnRpbmcgZm9y
IHRoZSBvZmZzZXQgaW4gdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUgc2VlbXMgcXVpdGUKPiBtb3Jl
IGNvbXBsaWNhdGVkIHRoYXQganVzdCB1cGRhdGluZyB0aGUgVFNDIGhlcmUsIHNvOgo+IAo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkFuZCB0
aGVuIChwcmVmZXJhYmx5IHdpdGggImRlZXAiIGRyb3BwZWQgZnJvbSB0aGUgZGVzY3JpcHRpb24s
CmlmIHlvdSwgSWdvciwgYWdyZWUsIGFuZCB3aGljaCBjYW4gYmUgZG9uZSB3aGlsZSBjb21taXR0
aW5nKQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
