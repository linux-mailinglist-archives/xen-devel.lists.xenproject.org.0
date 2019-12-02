Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 923EF10E6E6
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 09:25:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibgyQ-0005Ga-7z; Mon, 02 Dec 2019 08:22:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xhDU=ZY=strugglers.net=andy@srs-us1.protection.inumbo.net>)
 id 1ibgyO-0005Fa-Ny
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 08:22:24 +0000
X-Inumbo-ID: dddd60e8-14dc-11ea-a55d-bc764e2007e4
Received: from mail.bitfolk.com (unknown [2001:ba8:1f1:f019::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dddd60e8-14dc-11ea-a55d-bc764e2007e4;
 Mon, 02 Dec 2019 08:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitfolk.com;
 s=alpha; 
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date;
 bh=w6y4rhg/eDRhPlOcs86Elfd9fq9p9HZJSmJHgScOMAM=; 
 b=Clrm3U1yQKSuigQf8Yyg5SrBLpBxp2SMor7jJa/06BgAWfPYsorBDZGTVEPBNQ++iqJPBxQAZUtyE2J8CoQKIIR1Y2wBXk+yrfNyDzgJcXS46BJwnRRsUvPwI75G7vfNYOiw9Gfk26wMtnExcr+9E1ClUPXo82ew/onNCbHRK2r3vMxhhbBYCSzSBK1+3Qd6Rlqz99bZgtu7txgyJMCyKTPJmiI2y0WsRwV4duSVC/KtyfCWLUbxmwsFuneAq8/4yYE4WFtKcxXE+mP78rW8Ni7973+WUP85yjF6jl2PahxF6HaMlThs85s1J6ks+3MpUnc4OZOK2RKSv60xETiUlw==;
Received: from andy by mail.bitfolk.com with local (Exim 4.84_2)
 (envelope-from <andy@strugglers.net>) id 1ibgyN-0000ok-1j
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 08:22:23 +0000
Date: Mon, 2 Dec 2019 08:22:22 +0000
From: Andy Smith <andy@strugglers.net>
To: xen-devel@lists.xenproject.org
Message-ID: <20191202082222.GW32576@bitfolk.com>
MIME-Version: 1.0
Content-Disposition: inline
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false
Subject: [Xen-devel] livepatch-build: What does getting no output from
 "readelf -wi xen-syms" usually mean?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJJ3ZlIGJlZW4gbG9va2luZyBpbnRvIGxpdmUgcGF0Y2hpbmcgZm9yIHRoZSBmaXJzdCB0
aW1lLgoKU3RhcnRpbmcgd2l0aCBhIDQuMTIuMSBidWlsZDoKCiQgY2Qgfi9kZXYKJCBscyAtbAp0
b3RhbCA4CmRyd3hyLXhyLXggMyBhbmR5IGFuZHkgNDA5NiBPY3QgMjUgMTY6MTEgeGVuCmRyd3hy
LXhyLXggNiBhbmR5IGFuZHkgNDA5NiBEZWMgIDIgMDE6MTYgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xz
CgoodGhlcmUgaXMgYWxyZWFkeSBhIDQuMTIuMSBoeXBlcnZpc29yIGJ1aWx0IGluIC94ZW4gYW5k
IGlzIHdoYXQncwpydW5uaW5nIG9uIHRoaXMgaG9zdCB3aXRoIGJ1aWxkX2lkCmIxOGFmNzc0YjU2
YjBjOThjZmE2OTQwYTcyNWJhMmJhMjYwNjY5MjkpCgokIGNwIC1hIHhlbiB4ZW4tbHB0ZXN0CiQg
Y2QgbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzCiQgLi9saXZlcGF0Y2gtYnVpbGQgLWogMSAtcyAvaG9t
ZS9hbmR5L2Rldi94ZW4tbHB0ZXN0L3hlbi00LjEyLjEgLWMgL2hvbWUvYW5keS9kZXYveGVuLWxw
dGVzdC94ZW4tNC4xMi4xL3hlbi8uY29uZmlnIC1wIC4vbHB0ZXN0LnBhdGNoIC1vIGxwdGVzdCAt
ZCAtLWRlcGVuZHMgYjE4YWY3NzRiNTZiMGM5OGNmYTY5NDBhNzI1YmEyYmEyNjA2NjkyOQpCdWls
ZGluZyBMaXZlUGF0Y2ggcGF0Y2g6IGxwdGVzdAoKWGVuIGRpcmVjdG9yeTogL2hvbWUvYW5keS9k
ZXYveGVuLWxwdGVzdC94ZW4tNC4xMi4xClBhdGNoIGZpbGU6IC9ob21lL2FuZHkvZGV2L2xpdmVw
YXRjaC1idWlsZC10b29scy9scHRlc3QucGF0Y2gKLmNvbmZpZyBmaWxlOiAvaG9tZS9hbmR5L2Rl
di94ZW4tbHB0ZXN0L3hlbi00LjEyLjEveGVuLy5jb25maWcKT3V0cHV0IGRpcmVjdG9yeTogL2hv
bWUvYW5keS9kZXYvbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzL3hzYTMxMAo9PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KClBlcmZvcm0gZnVsbCBpbml0aWFsIGJ1
aWxkIHdpdGggMSBDUFUocykuLi4KUmVhZGluZyBzcGVjaWFsIHNlY3Rpb24gZGF0YQpFUlJPUjog
Y2FuJ3QgZmluZCBzcGVjaWFsIHN0cnVjdCBzaXplLgoKU28gaXQgc2VlbXMgaXQgY29tcGxldGVk
IHRoZSBpbml0aWFsIGJ1aWxkIHdpdGhvdXQgZXJyb3IgYnV0IGxvb2tpbmcKYXQgdGhlIGxpdmVw
YXRjaC1idWlsZCBzY3JpcHQgaXQgcnVucyByZWFkZWxmIGxpa2UgdGhpczoKCiQgcmVhZGVsZiAt
d2kgbHB0ZXN0L3hlbi1zeW1zCiQKCkZvciBtZSB0aGlzIHByb2R1Y2VzIG5vIG91dHB1dC4gSSd2
ZSBwcm9iYWJseSBkb25lIHNvbWV0aGluZyBzaW1wbGUKd3JvbmcuIERvZXMgdGhhdCBpbmRpY2F0
ZSBzb21lIHNpbXBsZSBtaXN0YWtlIGluIG15IHByb2Nlc3M/CgpUaGUgcGF0Y2ggd2FzIGp1c3Qg
YSB0cml2aWFsIGFkZGl0aW9uIG9mIHNvbWUgbG9nZ2luZyBhcyBhIHRlc3QsIGJ1dApJIGRvbid0
IHRoaW5rIGl0IGdvdCBhcyBmYXIgYXMgYXBwbHlpbmcgdGhhdC4KCiQgcmVhZGVsZiAtLXZlcnNp
b24KR05VIHJlYWRlbGYgKEdOVSBCaW51dGlscyBmb3IgRGViaWFuKSAyLjMxLjEKQ29weXJpZ2h0
IChDKSAyMDE4IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgpUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IG1heSByZWRpc3RyaWJ1dGUgaXQgdW5kZXIgdGhlIHRlcm1zIG9m
CnRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDMgb3IgKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KVGhpcyBwcm9ncmFtIGhhcyBhYnNvbHV0ZWx5IG5vIHdh
cnJhbnR5LgokIGdjYyAtLXZlcnNpb24KZ2NjIChEZWJpYW4gOC4zLjAtNikgOC4zLjAKQ29weXJp
Z2h0IChDKSAyMDE4IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgpUaGlzIGlzIGZyZWUg
c29mdHdhcmU7IHNlZSB0aGUgc291cmNlIGZvciBjb3B5aW5nIGNvbmRpdGlvbnMuICBUaGVyZSBp
cyBOTwp3YXJyYW50eTsgbm90IGV2ZW4gZm9yIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZP
UiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
