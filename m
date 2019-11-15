Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4DDFDC73
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 12:43:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVZx9-0001ea-G6; Fri, 15 Nov 2019 11:39:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Up3T=ZH=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iVZx7-0001eV-PU
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 11:39:50 +0000
X-Inumbo-ID: 9fe2c5be-079c-11ea-984a-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9fe2c5be-079c-11ea-984a-bc764e2007e4;
 Fri, 15 Nov 2019 11:39:47 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 0A7D9240100
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 12:39:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573817986; bh=GmyGnkCYdY60FcAS0glmGaJCJVPGellsUZLaxddlBHg=;
 h=Subject:To:Cc:From:Date:From;
 b=oc1fBS4jTNFSnmNzEPRwpV/FC9vJ0JyLMz2Yafcjq+AZVXY5pkC5TmO31NHAW+dv5
 mq0dSg0T0rmbBICdRF8F2BJIOKN1zE9V0UzhQwLfxlM1kaPeLourk3Y/UVqTLj6wrr
 qUM35z4Bh0neeC7O4kdF+QgB+SAiCSheccH4dD2c1+PPRsW4tRt3G6qnPhdBCrowlV
 YHEM8q+pHrhxes6ZILKxsGKW6WmPwtnQMoL0tTxX+YBmAD9k2+lQlgFwxi1DiHT1zP
 W1hE3eQWh9N9G279pfEefgSnBIiG0/eoizmbZOFzIU7d3CMPudntRKcsTvpC34owM1
 tudifOHBOnrLw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47DxGR5bdQz9rxN;
 Fri, 15 Nov 2019 12:39:43 +0100 (CET)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, 
 Steven Haigh <netwiz@crc.id.au>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <50a66402-4354-cbfc-b3b9-058b4cd37498@posteo.de>
 <e428217a-06b2-637d-85ff-357b1227bf1d@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <0c400301-63e6-999e-2bc5-9eccb5d19b6d@posteo.de>
Date: Fri, 15 Nov 2019 12:39:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e428217a-06b2-637d-85ff-357b1227bf1d@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMjoyOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAx
MToxNyBBTSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+PiBJIGRvIG5vdCB1bmRlcnN0YW5kIGEg
Y2VudHJhbCBwb2ludDogTm8gbWF0dGVyIHdoeSBhbmQvb3IgaG93IGEgZmFrZQo+PiB0b3BvbG9n
eSBpcyBwcmVzZW50ZWQgYnkgWGVuLCB3aHkgZGlkIHRoZSBvbGRlciBnZW5lcmF0aW9uIFJ5emVu
IDJ4eHgKPj4gd29yayBhbmQgUnl6ZW4gM3h4eCBkb2Vzbid0PyBXaGF0IGlzIHRoZSBjaGFuZ2Ug
aW4gQU1EKCEpIG5vdCBYZW4gdGhhdAo+PiBjYXVzZXMgdGhlIG9uZSB0byB3b3JrIGFuZCB0aGUg
b3RoZXIgdG8gZmFpbD8KPiBUaGUgQ1BVIGZlYXR1cmVzIHRoYXQgdGhlIGd1ZXN0IHNlZXMgYXJl
IGEgbWl4IG9mIHRoZSByZWFsIHVuZGVybHlpbmcKPiBmZWF0dXJlcyBhbmQgY2hhbmdlcyBtYWRl
IGJ5IFhlbi7CoCBYZW4gYW5kL29yIHRoZSBoYXJkd2FyZSB3aWxsIGJlaGF2ZQoKV2h5IG5vdCBh
bmFseXplIHRoZSBiaXRzIGluIGRldGFpbD8gSSBhbHJlYWR5IHBvc3RlZCB0aGUgY29tcGxldGUg
Q1BVSUQgCmZvciAzNzAwWCAKKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0wOS9tc2cwMjE4OS5odG1sKS4KCkBTdGV2ZW46CiA+IElmIHRo
aXMgaXMgaGVscGZ1bCwgSSBjYW4gcHJvYmFibHkgcHJvdmlkZSB0aGUgc2FtZSBmcm9tOgogPiAg
ICAqIFJ5emVuIDI3MDB4CiA+ICAgICogUnl6ZW4gMzkwMHgKQ2FuIHlvdSBwb3N0IGZvciAyNzAw
WD8KClRoZW4gc29tZW9uZSB3aXRoIGRldGFpbGVkIGtub3dsZWRnZSBjb3VsZCBjb21wYXJlIHRo
ZSB0d28/CgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
