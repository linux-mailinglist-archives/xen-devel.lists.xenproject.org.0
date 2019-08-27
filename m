Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA699EAEA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cOf-0000R1-9N; Tue, 27 Aug 2019 14:24:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cOe-0000Qw-9U
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:24:32 +0000
X-Inumbo-ID: 623f68de-c8d6-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 623f68de-c8d6-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:24:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B6D3AEBB;
 Tue, 27 Aug 2019 14:24:30 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190812151032.9353-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13ea9a6d-733c-42ce-4bd1-e73cc7b2cba1@suse.com>
Date: Tue, 27 Aug 2019 16:24:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812151032.9353-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/boot: Simplify %fs setup in
 trampoline_setup
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

T24gMTIuMDguMjAxOSAxNzoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBtb3Yvc2hyIGlzIGVh
c2llciB0byBmb2xsb3cgdGhhbiBzaGxkLCBhbmQgZG9lc24ndCBoYXZlIGEgbWVyZ2UgZGVwZW5k
ZW5jeSBvbgo+IHRoZSBwcmV2aW91cyB2YWx1ZSBvZiAlZWR4LiAgU2hvcnRlbiB0aGUgcmVzdCBv
ZiB0aGUgY29kZSBieSBzdHJlYW1saW5pbmcgdGhlCj4gY29tbWVudHMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBD
QzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBJ
biBhZGRpdGlvbiB0byBiZWluZyBjbGVhcmVyIHRvIGZvbGxvdywgbW92L3NociBpcyBmYXN0ZXIg
dGhhbiBzaGxkIHRvIGRlY29kZQo+IGFuZCBleGVjdXRlLiAgU2VlIGh0dHBzOi8vZ29kYm9sdC5v
cmcvei9BNWt2dUMgZm9yIHRoZSBsYXRlbmN5L3Rocm91Z2hwdXQvcG9ydAo+IGFuYWx5c2lzLCB0
aGUgSW50ZWwgT3B0aW1pc2F0aW9uIGd1aWRlIHdoaWNoIGNsYXNzaWZlcyB0aGVtIGFzICJTbG93
IEludCIKPiBpbnN0cnVjdGlvbnMsIG9yIHRoZSBBTUQgT3B0aW1pc2F0aW9uIGd1aWRlIHdoaWNo
IHNwZWNpZmljYWxseSBoYXMgYSBzZWN0aW9uCj4gZW50aXRsZWQgIkFsdGVybmF0aXZlcyB0byBT
SExEIEluc3RydWN0aW9uIi4KCkkgZG9uJ3QgcmVhbGx5IG1pbmQgdGhlIGNoYW5nZSwgYnV0IEkg
ZG9uJ3QgdGhpbmsgcGVyZm9ybWFuY2UgaXMgYQpjb25jZXJuIGhlcmUuIEluc3RlYWQgSSB0aGlu
ayB3ZSB3YW50IHRvIHNpemUtb3B0aW1pemUgdGhlIHRyYW1wb2xpbmUKYXMgbXVjaCBhcyBwb3Nz
aWJsZSwgd2hpY2ggaXMgd2h5IChpaXJjKSBJIGhhZCBhc2tlZCBmb3IgdGhlIHVzZSBvZgpTSExE
IGhlcmUuIENvbnNpZGVyaW5nIERhdmlkJ3Mgd29yayB0byBzcGxpdCBib290IGFuZCBwZXJtYW5l
bnQKdHJhbXBvbGluZSBJJ20gZmluZCB3aXRoIHRoZSBtaW5pbWFsIDEgYnl0ZSBpbmNyZWFzZSB0
aG91Z2g6CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
