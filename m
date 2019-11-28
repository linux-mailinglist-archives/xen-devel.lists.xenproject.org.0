Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1378410CD3C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:51:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMzg-0003x6-0s; Thu, 28 Nov 2019 16:50:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaMze-0003x0-UZ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:50:14 +0000
X-Inumbo-ID: 25f24564-11ff-11ea-a3d6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 25f24564-11ff-11ea-a3d6-12813bfff9fa;
 Thu, 28 Nov 2019 16:50:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9B3FBB282;
 Thu, 28 Nov 2019 16:50:13 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
 <96ac078a19ba46a594238e8684d3e0bc@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <18f6d317-6b09-e96f-2ad5-a7b42870cd55@suse.com>
Date: Thu, 28 Nov 2019 17:50:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <96ac078a19ba46a594238e8684d3e0bc@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 VolodymyrBabchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNzo0MiwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiBGcm9tOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMTkgMTY6
MzcKPj4KPj4gT24gMjguMTEuMjAxOSAxNDo1OCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gKyAg
ICB2YWwgPSBzaW1wbGVfc3RydG91bChhcmcsICZlLCAwKTsKPj4+ICsgICAgaWYgKCAqZSApCj4+
PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4+ICsKPj4+ICsgICAgaWYgKCB2YWwgPD0gSU5U
X01BWCApCj4+PiArICAgICAgICAqdmFscCA9IHZhbDsKPj4+ICsgICAgZWxzZQo+Pj4gKyAgICAg
ICAgcHJpbnRrKCJwYXJhbWV0ZXIgXCIlc1wiIHZhbHVlIFwiJXNcIiBpcyBvdXQgb2YgcmFuZ2U7
IHVzaW5nCj4+IHZhbHVlIFwiJXVcIlxuIiwKPj4+ICsgICAgICAgICAgICAgICBwYXJhbSwgYXJn
LCAqdmFscCk7Cj4+Cj4+IEJldHRlciBzdG9yZSBJTlRfTUFYIGluIHRoaXMgY2FzZSByYXRoZXIg
dGhhbiBsZWF2aW5nIHRoZSB2YWx1ZQo+PiB1bmNoYW5nZWQ/IE9yIG90aGVyd2lzZSAuLi4KPj4K
Pj4+ICsgICAgcmV0dXJuIDA7Cj4+Cj4+IC4uLiBhdCBsZWFzdCBkb24ndCByZXR1cm4gc3VjY2Vz
cz8KPiAKPiBUQkggSSB3YXNuJ3Qgc3VyZSB3aGF0IHRoZSBiZXN0IHRoaW5nIHRvIGRvIHdhcy4g
SW4gdGhlIGVuZCBJIG9wdGVkCj4gZm9yIHRoZSB3YXJuaW5nIGFuZCBhIHN1Y2Nlc3NmdWwgY29t
cGxldGlvbiBhcyBJIHRob3VnaHQgYSBmYWlsdXJlCj4gd291bGQgYmUgbGFyZ2VseSB1bmhlbHBm
dWwuIEkgY2FuIGNoYW5nZSB0aGlzIGludG8gYW4gZXJyb3IgdGhvdWdoLgoKV2VsbCwgaWYgeW91
IHJldHVybiBzdWNjZXNzLCB0aGVuIHRoZSBvcHRpb24gc2hvdWxkIGJlIGhhbmRsZWQgaW4gYXQK
bGVhc3QgYSBiZXN0IGVmZm9ydCBtYW5uZXIsIGkuZS4gYnkgc3RvcmluZyBJTlRfTUFYIGFzIGlu
ZGljYXRlZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
