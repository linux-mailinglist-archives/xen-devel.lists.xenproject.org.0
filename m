Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3EDFDE3E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 13:47:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVaxn-0001IR-IZ; Fri, 15 Nov 2019 12:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Up3T=ZH=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iVaxm-0001IK-3X
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 12:44:34 +0000
X-Inumbo-ID: aae7e314-07a5-11ea-9631-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aae7e314-07a5-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 12:44:31 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 148732400FB
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2019 13:44:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1573821870; bh=+JGhdewNKsj0iTAIrekRoAZEdMTrWoqp9B8JYy33cD8=;
 h=From:Subject:To:Cc:Date:From;
 b=nbadcQfIQrcqOYZ3IdDKqB3JjeHL1ZLEd6p+2eo8Nn2abvnkpKzIosdi4wNWrucnw
 aoruf0/RI0UmDLMZQ3TCgdpsiv4l3OThgXpQWu7zweeGMbeji2eLYn88A6qzxZCbxi
 h+baGnHk/PX6plKxR2Usdx/mYAMr0KVUxnFzwa5n/Xx3IGG1yHcpZDAYPuvGb6j34Y
 O2dKrz5+nGHWsRdYZT+ZQuMdqoBb5wB6xzKiq+mCqz/npyyAv23A1XAhr0zT/CeIO8
 c71lRbhIZZZWGqdrP+zy/5RGE89/ncFXVFIKM69n1L2QKzSV9xxdlgGQzJlzYHdIQM
 1aMsvxxs78gGQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47Dyj76ZQsz9rxG;
 Fri, 15 Nov 2019 13:44:27 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org, 
 Steven Haigh <netwiz@crc.id.au>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <50a66402-4354-cbfc-b3b9-058b4cd37498@posteo.de>
 <e428217a-06b2-637d-85ff-357b1227bf1d@citrix.com>
 <0c400301-63e6-999e-2bc5-9eccb5d19b6d@posteo.de>
 <9748c5a7-a4d7-33a5-574e-8659c42d0d9e@citrix.com>
Message-ID: <ff9feec9-d79b-1105-789f-ae5b50f6c5a9@posteo.de>
Date: Fri, 15 Nov 2019 13:44:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <9748c5a7-a4d7-33a5-574e-8659c42d0d9e@citrix.com>
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

T24gMTUuMTEuMjAxOSAxMzoxMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSAx
MTozOSBBTSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+PiBPbiAxNS4xMS4yMDE5IDEyOjI5LCBH
ZW9yZ2UgRHVubGFwIHdyb3RlOgo+Pj4gT24gMTEvMTUvMTkgMTE6MTcgQU0sIEFuZHJlYXMgS2lu
emxlciB3cm90ZToKPj4+PiBJIGRvIG5vdCB1bmRlcnN0YW5kIGEgY2VudHJhbCBwb2ludDogTm8g
bWF0dGVyIHdoeSBhbmQvb3IgaG93IGEgZmFrZQo+Pj4+IHRvcG9sb2d5IGlzIHByZXNlbnRlZCBi
eSBYZW4sIHdoeSBkaWQgdGhlIG9sZGVyIGdlbmVyYXRpb24gUnl6ZW4gMnh4eAo+Pj4+IHdvcmsg
YW5kIFJ5emVuIDN4eHggZG9lc24ndD8gV2hhdCBpcyB0aGUgY2hhbmdlIGluIEFNRCghKSBub3Qg
WGVuIHRoYXQKPj4+PiBjYXVzZXMgdGhlIG9uZSB0byB3b3JrIGFuZCB0aGUgb3RoZXIgdG8gZmFp
bD8KPj4+IFRoZSBDUFUgZmVhdHVyZXMgdGhhdCB0aGUgZ3Vlc3Qgc2VlcyBhcmUgYSBtaXggb2Yg
dGhlIHJlYWwgdW5kZXJseWluZwo+Pj4gZmVhdHVyZXMgYW5kIGNoYW5nZXMgbWFkZSBieSBYZW4u
wqAgWGVuIGFuZC9vciB0aGUgaGFyZHdhcmUgd2lsbCBiZWhhdmUKPj4gV2h5IG5vdCBhbmFseXpl
IHRoZSBiaXRzIGluIGRldGFpbD8gSSBhbHJlYWR5IHBvc3RlZCB0aGUgY29tcGxldGUgQ1BVSUQK
Pj4gZm9yIDM3MDBYCj4+IChodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMDkvbXNnMDIxODkuaHRtbCkuCj4+IFRoZW4gc29tZW9uZSB3aXRo
IGRldGFpbGVkIGtub3dsZWRnZSBjb3VsZCBjb21wYXJlIHRoZSB0d28/Cj4gV2hhdCB3b3VsZCBi
ZSB0aGUgcHVycG9zZT8KPiBUaGUgY29kZSBpcyBnb2luZyB0byBsb29rIGxpa2UgdGhpcyAtLQo+
IGFuIGltcGVuZXRyYWJsZSBtYXplIG9mICJzd2l0Y2giIGFuZCAiaWYiIHN0YXRlbWVudHMgYmFz
ZWQgb24KPiBpbmRpdmlkdWFsIGJpdHMgb3IgZmVhdHVyZXMgb3IgbW9kZWxzLiAgKlNvbWV3aGVy
ZSogaW4gV2luZG93J3MKPiB2ZXJzaW9ub2YgdGhhdCBjb2RlLCB0aGVyZSdzIGEgcGF0aCB3aGlj
aCBpcyB0cmlnZ2VyZWQgYnkKCkFzIG9mIHRoaXMgbW9tZW50IGFsbCBvZiB0aGlzIGlzIGp1c3Qg
YW4gYXNzdW1wdGlvbiAtIHlvdSBtaWdodCB2ZXJ5IAp3ZWxsIGJlIHJpZ2h0LCBidXQgaXQgY291
bGQgYWxzbyBiZSBzb21ldGhpbmcgdG90YWxseSBkaWZmZXJlbnQuIFdoYXQgaWYgCnRoZSBDUFVJ
RCBpcyBuZWFybHkgaWRlbnRpY2FsPyBUaGlzIHdvdWxkIGxlYWQgdG8gdGhlIGNvbmNsdXNpb24g
dGhhdCAKdGhlIHByb2JsZW0gaGFzIGNvbXBsZXRlbHkgZGlmZmVyZW50IHJvb3QgY2F1c2VzLgoK
UmVnYXJkcyBBbmRyZWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
