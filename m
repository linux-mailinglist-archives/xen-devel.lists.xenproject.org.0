Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F28C1800F3
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 16:02:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBgLG-0004mA-Mp; Tue, 10 Mar 2020 14:58:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBgLF-0004m4-G1
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 14:58:45 +0000
X-Inumbo-ID: a2def50a-62df-11ea-adc2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2def50a-62df-11ea-adc2-12813bfff9fa;
 Tue, 10 Mar 2020 14:58:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E75B5B1BB;
 Tue, 10 Mar 2020 14:58:42 +0000 (UTC)
To: paul@xen.org
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-4-paul@xen.org>
 <ae9cc4a6-0378-571c-9d46-0561e536884f@suse.com>
 <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bbb910df-2f61-2a67-b360-82b5988810d7@suse.com>
Date: Tue, 10 Mar 2020 15:58:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <001301d5f6e0$61aa5e00$24ff1a00$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 3/6] x86 / pv: do not treat PGC_extra
 pages as RAM
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAxNDozMiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTM6MDQKPj4gVG86IHBhdWxAeGVuLm9yZwo+PiBDYzogeGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+OyBBbmRyZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY1IDMvNl0geDg2IC8gcHY6IGRvIG5vdCB0cmVhdCBQ
R0NfZXh0cmEgcGFnZXMgYXMgUkFNCj4+Cj4+IE9uIDA5LjAzLjIwMjAgMTE6MjMsIHBhdWxAeGVu
Lm9yZyB3cm90ZToKPj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4K
Pj4+Cj4+PiBUaGlzIHBhdGNoIG1vZGlmaWVzIHNldmVyYWwgcGxhY2VzIHdhbGtpbmcgdGhlIGRv
bWFpbidzIHBhZ2VfbGlzdCB0byBtYWtlCj4+PiB0aGVtIGlnbm9yZSBQR0NfZXh0cmEgcGFnZXM6
Cj4+Pgo+Pj4gLSBkdW1wX3BhZ2VmcmFtZV9pbmZvKCkgc2hvdWxkIGlnbm9yZSBQR0NfZXh0cmEg
cGFnZXMgaW4gaXRzIGR1bXAgYXMgaXQKPj4+ICAgZGV0ZXJtaW5lcyB3aGV0aGVyIHRvIGR1bXAg
dXNpbmcgZG9tYWluX3RvdF9wYWdlcygpIHdoaWNoIGFsc28gaWdub3Jlcwo+Pj4gICBQR0NfZXh0
cmEgcGFnZXMuCj4+Cj4+IFRoaXMgYXJndW1lbnQgbG9va3Mgd3JvbmcgdG8gbWU6IExldCdzIHRh
a2UgYW4gZXhhbXBsZSAtIGEgZG9tYWluCj4+IGFsbW9zdCBmdWxseSBjbGVhbmVkIHVwLCB3aXRo
IDggIm5vcm1hbCIgYW5kIDMgImV4dHJhIiBwYWdlcyBsZWZ0Lgo+PiBkb21haW5fdG90X3BhZ2Vz
KCkgcmV0dXJucyA4IGluIHRoaXMgY2FzZSwgaS5lLiAibm9ybWFsIiBwYWdlCj4+IGR1bXBpbmcg
ZG9lc24ndCBnZXQgc2tpcHBlZC4gSG93ZXZlciwgdGhlcmUgbm93IHdvbid0IGJlIGFueSB0cmFj
ZQo+PiBvZiB0aGUgImV4dHJhIiBwYWdlcywgYmVjYXVzZSB0aGV5J3JlIGFsc28gbm90IG9uIHhl
bnBhZ2VfbGlzdCwKPj4gd2hpY2ggZ2V0cyBhbGwgaXRzIHBhZ2VzIGR1bXBlZCBpbiBhbGwgY2Fz
ZXMuIENvcnJlY3QgcmVzdG9yYXRpb24KPj4gb2Ygb3JpZ2luYWwgYmVoYXZpb3Igd291bGQgYmUg
dG8gZHVtcCAibm9ybWFsIiBwYWdlcyB3aGVuIHRoZXJlCj4+IGFyZSBsZXNzIHRoYW4gMTAsIGFu
ZCB0byBkdW1wIGFsbCAiZXh0cmEiIHBhZ2VzLiAoU2FtZSBvZiBjb3Vyc2UKPj4gZ29lcyBmb3Ig
bGl2ZSBkb21haW5zLCB3aGVyZSAibm9ybWFsIiBwYWdlIGR1bXBpbmcgd291bGQgYmUKPj4gc2tp
cHBlZCBpbiB0aGUgY29tbW9uIGNhc2UsIGJ1dCB4ZW5oZWFwIHBhZ2VzIHdvdWxkIGJlIGR1bXBl
ZCwgYW5kCj4+IGhlbmNlIHNvIHNob3VsZCBiZSAiZXh0cmEiIG9uZXMuKSBBcyBpbmRpY2F0ZWQg
YmVmb3JlLCB0aGUgcmVtb3ZhbAo+PiBvZiB0aGUgQVBJQyBhc3Npc3QgcGFnZSBmcm9tIHhlbnBh
Z2VfbGlzdCB3YXMgYWxyZWFkeSBzbGlnaHRseQo+PiByZWdyZXNzaW5nIGluIHRoaXMgcmVnYXJk
IChhcyB3ZWxsIGFzIGluIGF0IGxlYXN0IG9uZSBvdGhlciB3YXksCj4+IEknbSBhZnJhaWQpLCBh
bmQgeW91J3JlIG5vdyBkZWxpYmVyYXRlbHkgbWFraW5nIHRoZSByZWdyZXNzaW9uCj4+IGV2ZW4g
YmlnZ2VyLgo+IAo+IEkgdGhvdWdodCB0aGUgaWRlYSBoZXJlIHdhcyB0aGF0IHRoZSBkb21oZWFw
IGR1bXAgbG9vcCBzaG91bGQgYmUKPiBkdW1waW5nICdub3JtYWwnIHBhZ2VzIHNvIGl0IHNlZW1z
IHJlYXNvbmFibGUgdG8gbWUgdGhhdCB0aGUgbnVtYmVyCj4gb2YgcGFnZXMgZHVtcGVkIHRvIG1h
dGNoIHRoZSB2YWx1ZSByZXR1cm5lZCBieSBkb21haW5fdG90X3BhZ2VzKCkuCgpJIG5ldmVyIHRo
b3VnaHQgb2Ygc3VjaCBhIGNvbm5lY3Rpb24uIFRvIG1lIHRoZSBpbnZvY2F0aW9uIG9mCmRvbWFp
bl90b3RfcGFnZXMoKSB0aGVyZSBpcyB0aGVyZSBvbmx5IHRvIGF2b2lkIG92ZXJseSBtdWNoIG91
dHB1dC4KCj4gV291bGQgeW91IHBlcmhhcHMgYmUgaGFwcGllciBpZiB3ZSBwdXQgJ2V4dHJhJyBw
YWdlcyBvbiBzZXBhcmF0ZQo+IHBhZ2UgbGlzdCwgd2hpY2ggY2FuIGJlIHVuY29uZGl0aW9uYWxs
eSBkdW1wZWQgc28gYXMgSSB0cmFuc2l0aW9uCj4geGVuaGVhcCBwYWdlcyB0byAnZXh0cmEnIHBh
Z2VzIHRoZXkgZG9uJ3QgZ2V0IG1pc3NlZD8gSXQgd291bGQKPiBhbHNvIGdldCByaWQgb2Ygc29t
ZSBvZiB0aGUgb3RoZXIgY2hlY2tzIGZvciBQR0NfZXh0cmEgdGhhdCBJCj4gaGF2ZSB0byBpbnRy
b2R1Y2UgYmVjYXVzZSB0aGV5IGN1cnJlbnRseSBlbmQgdXAgb24gdGhlIGRvbWFpbidzCj4gcGFn
ZSBsaXN0LgoKSG1tLCB3YXNuJ3QgaXQgYW4gaW50ZW5kZWQgc2lkZSBlZmZlY3QgdG8gaGF2ZSBh
bGwgcGFnZXMgb24gb25lCmxpc3Qgbm93PyBJbnRyb2R1Y2luZyBhIDNyZCBsaXN0IChldmVuIGlm
IGp1c3QgdGVtcG9yYXJpbHksIHVudGlsCnhlbnBhZ2VfbGlzdCBjYW4gYmUgZHJvcHBlZCkgd2ls
bCBiZSBzb21ld2hhdCB1Z2x5IGJlY2F1c2Ugb2YgaG93CmFyY2hfZnJlZV9oZWFwX3BhZ2UoKSB3
b3Jrcy4gSW4gcmVwbHkgdG8gcGF0Y2ggNiBJIGRpZCBzdWdnZXN0IHRvCmhhdmUgYSBzZXBhcmF0
ZSBsaXN0LCBidXQgd2l0aG91dCB0YWtpbmcgdGhlc2UgcGFnZXMgb2ZmCmQtPnBhZ2VfbGlzdCwg
c3VjaCB0aGF0IGhlcmUgeW91IHdvdWxkIHNraXAgdGhlbSBpbiB0aGUgbWFpbgpkb21haW4gcGFn
ZSBkdW1waW5nIGxvb3AsIGJ1dCB5b3Ugd291bGQgdGhlbiB0cmF2ZXJzZSB0aGF0IHNlY29uZAps
aXN0IGFuZCBkdW1wIGFsbCBvZiBpdHMgZWxlbWVudHMsIGp1c3QgbGlrZSB4ZW5wYWdlX2xpc3Qg
Z2V0cwpoYW5kbGVkIHRoZXJlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
