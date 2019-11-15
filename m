Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F13FDF95
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 15:03:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc8z-0001kU-Tu; Fri, 15 Nov 2019 14:00:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qjfG=ZH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iVc8y-0001kN-G2
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 14:00:12 +0000
X-Inumbo-ID: 3d03d2a8-07b0-11ea-9631-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d03d2a8-07b0-11ea-9631-bc764e2007e4;
 Fri, 15 Nov 2019 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573826411;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=m0NZtGZrBOr2goYyY77zqSKC1qHbU0j8rKJHaTNabYY=;
 b=c3RsCjQ+03RDDEsEOkUeNbn6x1awwe//5gcuVhKxCyJZN5sMmarBd3po
 2RSFuYWFTaL+4ASS9UXltFaS8eq9rZ9YcawDc8fESOZiTQYxG4l8+7Krn
 N6ODi8mw3LNnq6suaMAYwycPdEGMhRNKnhEGt6yo6NirWP3RUe9k0Zaj/ 0=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qaMieOEv59iL7YYB+GtzRny0kfh/7edYNcMeWXZwu7pM4aP9jebLj0Bs6pZgx+NfQXTma61xHT
 Ebt1LX41ZVUg7RIbQXwMfP/5xnSpwVzvAgiZDCPdHbpFeGkNJMRmOmWgT/Qbj9sYRYjQbTJp96
 C/A10H6zmvlHldLerKsM8iHNrT+57amedREGGa2VUhLmiafIWXVFg77DOMYzbMZP1vNv0Zd72/
 zqpnGzUVhu9BYuZC/+RPQvS+K/1U/MBNmebTRXnNCr9E3fKyYCwGh9W1qn7honkLLJDpUQIHtV
 6SQ=
X-SBRS: 2.7
X-MesageID: 8496942
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8496942"
To: Andreas Kinzler <hfp@posteo.de>, George Dunlap <george.dunlap@citrix.com>, 
 <xen-devel@lists.xenproject.org>, Steven Haigh <netwiz@crc.id.au>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <50a66402-4354-cbfc-b3b9-058b4cd37498@posteo.de>
 <e428217a-06b2-637d-85ff-357b1227bf1d@citrix.com>
 <0c400301-63e6-999e-2bc5-9eccb5d19b6d@posteo.de>
 <9748c5a7-a4d7-33a5-574e-8659c42d0d9e@citrix.com>
 <ff9feec9-d79b-1105-789f-ae5b50f6c5a9@posteo.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <a2528b40-203b-314c-371c-ad633bead4b3@citrix.com>
Date: Fri, 15 Nov 2019 14:00:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ff9feec9-d79b-1105-789f-ae5b50f6c5a9@posteo.de>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUvMTEvMjAxOSAxMjo0NCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDE1LjExLjIw
MTkgMTM6MTAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDExLzE1LzE5IDExOjM5IEFNLCBB
bmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+PiBPbiAxNS4xMS4yMDE5IDEyOjI5LCBHZW9yZ2UgRHVu
bGFwIHdyb3RlOgo+Pj4+IE9uIDExLzE1LzE5IDExOjE3IEFNLCBBbmRyZWFzIEtpbnpsZXIgd3Jv
dGU6Cj4+Pj4+IEkgZG8gbm90IHVuZGVyc3RhbmQgYSBjZW50cmFsIHBvaW50OiBObyBtYXR0ZXIg
d2h5IGFuZC9vciBob3cgYSBmYWtlCj4+Pj4+IHRvcG9sb2d5IGlzIHByZXNlbnRlZCBieSBYZW4s
IHdoeSBkaWQgdGhlIG9sZGVyIGdlbmVyYXRpb24gUnl6ZW4gMnh4eAo+Pj4+PiB3b3JrIGFuZCBS
eXplbiAzeHh4IGRvZXNuJ3Q/IFdoYXQgaXMgdGhlIGNoYW5nZSBpbiBBTUQoISkgbm90IFhlbgo+
Pj4+PiB0aGF0Cj4+Pj4+IGNhdXNlcyB0aGUgb25lIHRvIHdvcmsgYW5kIHRoZSBvdGhlciB0byBm
YWlsPwo+Pj4+IFRoZSBDUFUgZmVhdHVyZXMgdGhhdCB0aGUgZ3Vlc3Qgc2VlcyBhcmUgYSBtaXgg
b2YgdGhlIHJlYWwgdW5kZXJseWluZwo+Pj4+IGZlYXR1cmVzIGFuZCBjaGFuZ2VzIG1hZGUgYnkg
WGVuLsKgIFhlbiBhbmQvb3IgdGhlIGhhcmR3YXJlIHdpbGwgYmVoYXZlCj4+PiBXaHkgbm90IGFu
YWx5emUgdGhlIGJpdHMgaW4gZGV0YWlsPyBJIGFscmVhZHkgcG9zdGVkIHRoZSBjb21wbGV0ZSBD
UFVJRAo+Pj4gZm9yIDM3MDBYCj4+PiAoaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA5L21zZzAyMTg5Lmh0bWwpLgo+Pj4KPj4+IFRoZW4g
c29tZW9uZSB3aXRoIGRldGFpbGVkIGtub3dsZWRnZSBjb3VsZCBjb21wYXJlIHRoZSB0d28/Cj4+
IFdoYXQgd291bGQgYmUgdGhlIHB1cnBvc2U/Cj4+IFRoZSBjb2RlIGlzIGdvaW5nIHRvIGxvb2sg
bGlrZSB0aGlzIC0tCj4+IGFuIGltcGVuZXRyYWJsZSBtYXplIG9mICJzd2l0Y2giIGFuZCAiaWYi
IHN0YXRlbWVudHMgYmFzZWQgb24KPj4gaW5kaXZpZHVhbCBiaXRzIG9yIGZlYXR1cmVzIG9yIG1v
ZGVscy7CoCAqU29tZXdoZXJlKiBpbiBXaW5kb3cncwo+PiB2ZXJzaW9ub2YgdGhhdCBjb2RlLCB0
aGVyZSdzIGEgcGF0aCB3aGljaCBpcyB0cmlnZ2VyZWQgYnkKPgo+IEFzIG9mIHRoaXMgbW9tZW50
IGFsbCBvZiB0aGlzIGlzIGp1c3QgYW4gYXNzdW1wdGlvbiAtIHlvdSBtaWdodCB2ZXJ5Cj4gd2Vs
bCBiZSByaWdodCwgYnV0IGl0IGNvdWxkIGFsc28gYmUgc29tZXRoaW5nIHRvdGFsbHkgZGlmZmVy
ZW50LiBXaGF0Cj4gaWYgdGhlIENQVUlEIGlzIG5lYXJseSBpZGVudGljYWw/IFRoaXMgd291bGQg
bGVhZCB0byB0aGUgY29uY2x1c2lvbgo+IHRoYXQgdGhlIHByb2JsZW0gaGFzIGNvbXBsZXRlbHkg
ZGlmZmVyZW50IHJvb3QgY2F1c2VzLgoKVGhlIHByb2JsZW0gaXMgdGhhdCBYZW4ncyAibWVzc2lu
ZyBhcm91bmQgd2l0aCB0b3BvbG9neSIgaXMsIGFuZCBoYXMKYWx3YXlzIGJlZW4sIGluY29ycmVj
dC7CoCBJdCBkb2VzIG5vdCBtYXRjaCB0aGUgcnVsZXMgZ2l2ZW4gaW4gdGhlIFNETS9BUE0uCgpO
b25lIG9mIHRoaXMgY29kZSBpcyBnb2luZyB0byBzdXJ2aXZlIHRoZSByZXdyaXRlIG1ha2luZyB0
aGUgcHJlc2VudGVkCnRvcG9sb2d5IGFjdHVhbGx5IGZvbGxvdyB0aGUgYXJjaGl0ZWN0dXJhbCBy
dWxlcy4KCkhvd2V2ZXIsIGZvciA0LjEzLCB3ZSBhcmUgdHJ5aW5nIHRvIGZpbmQgdGhlIGxlYXN0
IGludmFzaXZlIGhhY2sKcG9zc2libGUgdG8gY2F1c2Ugd2luZG93cyBub3QgdG8gZXhwbG9kZS4K
Cn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
