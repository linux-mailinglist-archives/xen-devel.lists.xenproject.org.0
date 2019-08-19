Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3F92121
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 12:15:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzeeT-0003Ob-Ur; Mon, 19 Aug 2019 10:12:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ecZk=WP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hzeeS-0003OV-9D
 for xen-devel@lists.xen.org; Mon, 19 Aug 2019 10:12:36 +0000
X-Inumbo-ID: daf2b344-c269-11e9-8beb-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daf2b344-c269-11e9-8beb-12813bfff9fa;
 Mon, 19 Aug 2019 10:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1566209552;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=wULVYSVxcJAvBHms5XGsXwPQBrbinx6GacQBVLcMto0=;
 b=foQJFMnuWmqHJv100OrXUC+U6VUggzYAvtd6luen49vkqGCsc9vNIFmK
 74KBmU+nnzdpxZZbJEI9EI24j23dk4YNDKCPPljs5r5V/vc22qAJfkI5Q
 qe+fkFZya+epCOHWMKM14TXQ581ArXPBcOWns5euca8QmQcgakooj/pSi g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 195A86G96axNKzSjivHWTjedaFC1ye4j51aa8PK+i/oD//XjRS92lbDbslbv0dOp4uOkjMwFlz
 lsyNQbqznhKGb2JDS5K7psyQKsl6RdTq7v9xWdq6QezJrnHiSvLUqzOyXXnbA5pwN774Aioo2E
 uJRWkN8qn6j6qOpMlLdXEUj7EoRK5oQTc4dp2wtV2ITnjWrKp9XX+YO9aPfcd2bqSNzm23NLhw
 HHublebVmyoIPVOVeIL7R+CpxpXj7EmgxoV6P3Ro/XijjN1ig0OnHLE0QOFUlUUc26+3Gi3oRJ
 U2s=
X-SBRS: 2.7
X-MesageID: 4414306
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,403,1559534400"; 
   d="scan'208";a="4414306"
To: Julien Grall <julien.grall@arm.com>, Xen-devel <xen-devel@lists.xen.org>
References: <1545399965-5174-1-git-send-email-andrew.cooper3@citrix.com>
 <ee8053c9-467f-f1a8-5d83-5c69a766d17d@arm.com>
 <09c39607-ed40-ab4f-7e0c-12f9207636b6@citrix.com>
 <670f2bd7-4c00-c7e8-66ae-464213037fd4@citrix.com>
 <850a76e0-fe32-4fcd-5db6-54d5ac858d5b@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <be78f14c-9a33-2b90-66f6-b9d7d3628f83@citrix.com>
Date: Mon, 19 Aug 2019 11:12:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <850a76e0-fe32-4fcd-5db6-54d5ac858d5b@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/pv: Clean up cr3 handling in
 arch_set_info_guest()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDgvMjAxOSAxMTowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJldywKPgo+
IE9uIDgvMTMvMTkgNzowNCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjQvMDEvMjAx
OSAyMjoxMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDI0LzAxLzIwMTkgMjE6NDIsIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSBBbmRyZXcsCj4+Pj4KPj4+PiBPbiAxMi8yMS8xOCAx
OjQ2IFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiBBbGwgb2YgdGhpcyBjb2RlIGxpdmVz
IGluc2lkZSBDT05GSUdfUFYgd2hpY2ggbWVhbnMgZ2ZuID09IG1mbiwKPj4+Pj4gYW5kIHRoZQo+
Pj4+PiBmaWxsX3JvX21wdCgpIGNhbGxzIGNsZWFybHkgc2hvdyB0aGF0IHRoZSB2YWx1ZSBpcyB1
c2VkIHVudHJhbnNsYXRlZC4KPj4+Pj4KPj4+Pj4gQ2hhbmdlIGNyM19nZm4gdG8gYSBzdWl0YWJs
eSB0eXBlZCBjcjNfbWZuLCBhbmQgcmVwbGFjZQo+Pj4+PiBnZXRfcGFnZV9mcm9tX2dmbigpCj4+
Pj4+IHdpdGggYSBzdHJhaWdodCBtZm5fdG9fcGFnZS9nZXRfcGFnZSBzZXF1ZW5jZSwgdG8gYXZv
aWQgdGhlCj4+Pj4+IGltcGxpY2F0aW9uIHRoYXQKPj4+Pj4gdHJhbnNsYXRpb24gaXMgZ29pbmcg
b24uCj4+Pj4+Cj4+Pj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+Pj4+Pgo+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+Pj4+PiAt
LS0KPj4+Pj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4+Pj4gQ0M6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4+Pj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Pj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4KPj4+Pj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4+Pj4+Cj4+Pj4+IEp1bGllbjogVGhpcyBzaG91bGQgc2ltcGxpZnkgeW91ciAieGVu
OiBTd2l0Y2ggcGFyYW1ldGVyIGluCj4+Pj4+IGdldF9wYWdlX2Zyb21fZ2ZuCj4+Pj4+IHRvIHVz
ZSB0eXBlc2FmZSBnZm4iIHBhdGNoLsKgIEluIHBhcnRpY3VsYXIsIEkgZGlkIGEgZG91YmxldGFr
ZSBhdAo+Pj4+PiBmaWxsX3JvX21wdChfbWZuKGdmbl94KGNyM19nZm4pKSk7IHdoZW4gcmV2aWV3
aW5nIGl0Lgo+Pj4+IEkgd2FzIGxvb2tpbmcgYXQgdXBkYXRpbmcgbXkgcGF0Y2ggYW5kIHJlbWVt
YmVyZWQgeW91IHN1Z2dlc3RlZCB0bwo+Pj4+IHJlYmFzZSBvbiB0b3Agb2YgdGhpcy4gRG8geW91
IGhhdmUgYW55IHBsYW4gdG8gcmVzZW5kIHRoZSBwYXRjaD8KPj4+IEknbGwgc2VlIGlmIEkgY2Fu
IGZpbmQgc29tZSB0aW1lIHRvbW9ycm93Lgo+Pgo+PiBTbyBtYXliZSBJIHdhcyBhIGxpdHRsZSBv
ZmYgOynCoCBCZXR0ZXIgbGF0ZSB0aGFuIG5ldmVyIEkgc3VwcG9zZS4KPgo+IEkgbmVhcmx5IGZv
cmdvdCB0aGF0IHdvcmsgOikuIENhbiB5b3UgQ0MgbWUgb24gdGhlIHBhdGNoIHdoZW4geW91IHNl
bmQKPiBpdD8gSSB3aWxsIHJlYmFzZSBteSB3b3JrIG9uIHRvcCBvZiBpdC4KCkkgY29tbWl0dGVk
IGl0IHdoZW4gSSBzZW50IHRoaXMgZW1haWwuwqAgUmViYXNlIG9uIHN0YWdpbmcgYW5kIHlvdSdy
ZSBnb29kLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
