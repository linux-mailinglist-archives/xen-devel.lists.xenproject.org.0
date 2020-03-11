Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EB81816F8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 12:39:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBzgZ-0001DR-Iv; Wed, 11 Mar 2020 11:38:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TdBs=44=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBzgX-0001DD-K2
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 11:38:01 +0000
X-Inumbo-ID: c3020310-638c-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3020310-638c-11ea-b34e-bc764e2007e4;
 Wed, 11 Mar 2020 11:38:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 593BBABF4;
 Wed, 11 Mar 2020 11:38:00 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-4-jgross@suse.com>
 <3e1435c3-8320-184b-d097-2a6db011e084@suse.com>
 <dc9222df-3525-f225-ad76-9489c0886fe1@suse.com>
 <8ea39077-c616-c0b4-52b6-3c511ca4f064@suse.com>
 <2b7b572e-1349-4661-b64e-38ae5ae9723f@suse.com>
 <55ec66ca-f3ba-a209-695d-4867d0c20429@suse.com>
 <b2c0acaa-ca9c-a0f1-7700-66fd25531d4f@suse.com>
 <d0c30b74-4d7a-452d-84ce-2aa9c3be7ab5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3b5263d4-0e2a-44dd-f981-4912b6a20d96@suse.com>
Date: Wed, 11 Mar 2020 12:37:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d0c30b74-4d7a-452d-84ce-2aa9c3be7ab5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/6] xen: add
 process_pending_softirqs_norcu() for keyhandlers
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDMuMjAgMTI6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDExLjAzLjIwMjAgMTA6
NDcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDExLjAzLjIwIDEwOjM2LCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDExLjAzLjIwMjAgMTA6MjcsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+
Pj4gT24gMTEuMDMuMjAgMTA6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxMS4wMy4y
MDIwIDA3OjA3LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+Pj4gT24gMTAuMDMuMjAgMTg6MDIs
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEwLjAzLjIwMjAgMDg6MjgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+Pj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9w
Y2lfYW1kX2lvbW11LmMKPj4+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYwo+Pj4+Pj4+PiBAQCAtNTg3LDcgKzU4Nyw3IEBAIHN0YXRpYyB2b2lk
IGFtZF9kdW1wX3AybV90YWJsZV9sZXZlbChzdHJ1Y3QgcGFnZV9pbmZvKiBwZywgaW50IGxldmVs
LAo+Pj4+Pj4+PiAgICAgICAgICAgICAgc3RydWN0IGFtZF9pb21tdV9wdGUgKnBkZSA9ICZ0YWJs
ZV92YWRkcltpbmRleF07Cj4+Pj4+Pj4+ICAgICAgCj4+Pj4+Pj4+ICAgICAgICAgICAgICBpZiAo
ICEoaW5kZXggJSAyKSApCj4+Pj4+Pj4+IC0gICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29m
dGlycXMoKTsKPj4+Pj4+Pj4gKyAgICAgICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxc19u
b3JjdSgpOwo+Pj4+Pj4+Cj4+Pj4+Pj4gQXQgdGhlIGV4YW1wbGUgb2YgdGhpcyAtIHRoZSBwcm9w
ZXJ0eSBvZiBob2xkaW5nIGFuIFJDVSBsb2NrIGlzCj4+Pj4+Pj4gZW50aXJlbHkgaW52aXNpYmxl
IGhlcmUsIGFzIGl0J3MgdGhlIGdlbmVyaWMKPj4+Pj4+PiBpb21tdV9kdW1wX3AybV90YWJsZSgp
IHdoaWNoIGFjcXVpcmVzIGl0LiBUaGlzIHN1Z2dlc3QgdG8gbWUgdGhhdAo+Pj4+Pj4+IGdvaW5n
IGZvcndhcmQgYnJlYWtpbmcgdGhpcyBpcyBnb2luZyB0byBiZSB2ZXJ5IGxpa2VseS4gQ291bGRu
J3QKPj4+Pj4+PiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKSBleGNsdWRlIFJDVSBoYW5kbGlu
ZyB3aGVuIGZpbmRpbmcKPj4+Pj4+PiBwcmVlbXB0X2NvdW50KCkgdG8gcmV0dXJuIG5vbi16ZXJv
Pwo+Pj4+Pj4KPj4+Pj4+IFRoaXMgY2FuIGJlIGRvbmUsIGJ1dCB0aGVuIHRoZSBub24tZGVidWcg
YnVpbGQgd291bGQgcmVxdWlyZSB0byBoYXZlCj4+Pj4+PiBub24tZW1wdHkgcmN1IGxvY2sgZnVu
Y3Rpb25zLgo+Pj4+Pgo+Pj4+PiBJIGd1ZXNzIEkgZG9uJ3QgdW5kZXJzdGFuZCAtIEkgc2VlIG9u
bHkgb25lIHZlcnNpb24gb2YgdGhlbToKPj4+Pj4KPj4+Pj4gI2RlZmluZSByY3VfcmVhZF9sb2Nr
KHgpICAgICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2Rpc2FibGUoKTsgfSkKPj4+Pj4gI2Rl
ZmluZSByY3VfcmVhZF91bmxvY2soeCkgICAgICh7ICgodm9pZCkoeCkpOyBwcmVlbXB0X2VuYWJs
ZSgpOyB9KQo+Pj4+Pgo+Pj4+PiBTYW1lIGZvciB0aGUgcHJlZW1wdCBjb3VudCBhZGp1c3RtZW50
IG9wZXJhdGlvbnMuCj4+Pj4KPj4+PiBTZWUgcGF0Y2ggNS4KPj4+Cj4+PiBXaGljaCBJIGhhdmVu
J3QgbG9va2VkIGF0IHlldCwgYW5kIHdoaWNoIEkgYWxzbyBzaG91bGRuJ3QgbmVlZCB0bwo+Pj4g
bG9vayBhdCB0byB1bmRlcnN0YW5kIHRoZSBwYXRjaCBoZXJlLiBJZiB0aGlzIGlzIGEgcHJlcGFy
YXRvcnkKPj4+IGNoYW5nZSByYXRoZXIgdGhhbiBzb21lIGZvcm0gb2YgZml4IG9yIGltcHJvdmVt
ZW50LCB0aGVuIHRoZQo+Pj4gZGVzY3JpcHRpb24gc2hvdWxkIHNheSBzby4KPj4KPj4gVGhpcyB3
YXMganVzdCBtZWFudCBhcyBhbiBhbnN3ZXIgdG8geW91ciBxdWVzdGlvbiByZWdhcmRpbmcgY29u
c2lkZXJpbmcKPj4gcHJlZW1wdF9jb3VudCgpLiBKdXN0IGNoYW5naW5nIHRoaXMgcGF0Y2ggaGVy
ZSBhbmQgdGhlbiB1bmRvaW5nIHRoZQo+PiBjaGFuZ2UgYWdhaW4gaW4gcGF0Y2ggNSBpcyBubyBv
cHRpb24gSU1PLCBzbyBJIGdhdmUgYSBoaW50IHdoeSB1c2luZwo+PiBwcmVlbXB0X2NvdW50KCkg
bWlnaHQgYmUgYSBiYWQgaWRlYS4KPiAKPiBJJ3ZlIGJyaWVmbHkgbG9va2VkIGF0IHBhdGNoIDUs
IGFuZCBJIGRvbid0IHNlZSB3aHkgdGhlIGNvdW50ZXIgeW91Cj4gaW50cm9kdWNlIHRoZXJlIGNv
dWxkbid0IGFsc28gYmUgbWFpbnRhaW5lZCBpbiBub24tZGVidWcgYnVpbGRzLgoKT2theS4gSSds
bCBtb2RpZnkgcGF0Y2hlcyAzIGFuZCA1IGFjY29yZGluZ2x5LgoKCkp1ZXJnZW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
