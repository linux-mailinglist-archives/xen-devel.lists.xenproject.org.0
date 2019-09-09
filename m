Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B7AAD85D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 13:59:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7IHS-0003am-Gb; Mon, 09 Sep 2019 11:56:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLmJ=XE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i7IHR-0003ac-9Q
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 11:56:25 +0000
X-Inumbo-ID: d886bda4-d2f8-11e9-ac0a-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d886bda4-d2f8-11e9-ac0a-12813bfff9fa;
 Mon, 09 Sep 2019 11:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568030184;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=uX1TDuVD9W2CqfaCk42F1JO5vg3J9fKIR2zVjXjRsfo=;
 b=VUNptJO0gnJwnGXdQSdbcJVDRzP0kzr2aCrtFrovbrEcWQH3pPtI/k+3
 NhP8nFksyyn4hboev7IBHgTuBvZqXD7l2U4xZgZQXSQamrR8qUreTFheN
 y0/T+O/iCTzSHTPRp9iQAm4Rli9e/0jTb0LnqjbAshlIHXdOHUIlkAWNA s=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BvZ21bpOJTzCDJ+54U21CZmAxn7aUB2MCS4Ss+zJPQoQLgdQofpn8FTQ7VGxggT09ctSMKDyKQ
 nVARW9xkzJ44TavOe2qcHPhOTuZhGknbzf55ISL1fu91u8W/QOb0MW/sO7FcfwTjUPBeF3+Pby
 hVTm5PjqHZE14TkKZmUSsJjHwAx1zs3UPw+igJc70DV6WF4hf6BwQLYO/7ydZelvjhz4glFBlI
 X3yJKZ8q+i/WvBCds+9OOC+8mZCN2PC0NLoE1CQ+dxKtlFNXDdVQTkBMRSw3bewAB/mH4MzlF6
 XvE=
X-SBRS: 2.7
X-MesageID: 5545954
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,484,1559534400"; 
   d="scan'208";a="5545954"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20190722192056.15816-1-andrew.cooper3@citrix.com>
 <0eee7e6e-a3d9-ea86-d93b-7da6fb282ddb@citrix.com>
 <23926.12631.330650.505179@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7af8b4b4-ef06-aab7-5822-957a535d75c7@citrix.com>
Date: Mon, 9 Sep 2019 12:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <23926.12631.330650.505179@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: todo/wishlist
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "Tim \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDkvMjAxOSAxMjowMiwgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJSZTogW1BBVENIXSBkb2NzL3NwaGlueDogdG9kby93aXNobGlzdCIpOgo+PiBJdCBo
YXMgYmVlbiBwb2ludGVkIG91dCB0aGF0IGNhbGxpbmcgdGhpcyB0aGUgd2lzaGxpc3QgaXMgYSBw
b29yIG5hbWUuwqAKPj4gQSBiZXR0ZXIgbmFtZSB3b3VsZCBiZSB0aGUgdGVjaG5pY2FsIGRlYnQg
bGlzdC7CoCBJIHdvbid0IHJlc2VuZCBmb3IganVzdAo+PiB0aGlzLCBidXQgcGxlYXNlIGJlYXIg
aXQgaW4gbWluZCB3aGVuIGNvbnNpZGVyaW5nIHRoZSBzdWdnZXN0aW9uLgo+IEkgYXBwcm92ZSBv
ZiB0aGUgaWRlYSBvZiByZWNvcmRpbmcgdGVjaG5pY2FsIGRlYnQgaW4tdHJlZS4KPgo+IEJ1dCwg
ZG8gd2Ugd2FudCBpdCBhcyBhIGNlbnRyYWxpc2VkIGxpc3QgbGlrZSB0aGlzID8KClNwZWNpZmlj
YWxseSwgeWVzLgoKSXQgYWxsb3dzIGZvciBtdWNoIGVhc2llciBpZGVudGlmaWNhdGlvbiBvZiBy
ZWxhdGVkIGFyZWFzIG9mIHdvcmssIGFuZAppdCBlbmRzIHVwIGFzIGEgbW9zdGx5LXVwLXRvLWRh
dGUgbGlzdCBvZiBzbWFsbC10by1sYXJnZSB0YXNrcywgZS5nLiBmb3IKc3R1ZGVudHMgbG9va2lu
ZyBmb3IgYSBzZW1lc3RlciBwcm9qZWN0LgoKPiBJIHRoaW5rIHdlCj4gY3VycmVudGx5IGhhdmUg
dGVjaG5pY2FsIGRlYnQgbWFya2VkIGFzIGNvbW1lbnRzIG5lYXJieSBpbiB0aGUKPiByZWxldmFu
dCBjb2RlIG9yIGludGVyZmFjZSBkZWZpbml0aW9ucy4gIFRoYXQgaXMgb2Z0ZW4gbW9yZSBuYXR1
cmFsCj4gd2hlbiBkZXZlbG9waW5nLgoKRm9yIHRoZSB+MTAgb3Igc28gcGVvcGxlIHdvcmtpbmcg
ZnVsbC10aW1lIG9uIHRoZSBwcm9qZWN0LCBwZXJoYXBzLsKgClZlcnkgZGVmaW5pdGVseSBub3Qg
Zm9yIHBlb3BsZSBuZXcgdG8gdGhlIHByb2plY3QuCgpOby1vbmUsIG5vdCBldmVuIHRoZSBtYWlu
IGRldmVsb3BlcnMsIGFyZSBnb2luZyB0byBnbyBhbmQgZ3JlcCB0aGUKY29kZWJhc2UgZm9yIGEg
dG9kbyBsaXN0LCBhbmQgdGhpcyBpcyBhIHN1cmUtZmlyZSB3YXkgb2Ygbm90IGltcHJvdmluZwp0
aGUgc3RhdHVzIHF1by4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
