Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E0E86BFD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 22:59:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvpSA-0001Vt-WF; Thu, 08 Aug 2019 20:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oW8A=WE=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1hvpS9-0001Vo-EK
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 20:56:05 +0000
X-Inumbo-ID: ecb6265e-ba1e-11e9-9e13-0fcd4162b288
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecb6265e-ba1e-11e9-9e13-0fcd4162b288;
 Thu, 08 Aug 2019 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AkRGR9LC3X7GL5Kh3vpp99wfNsXO9sasqk9eDLUJyvI=; b=k7rJxfc3SBXWj44IgSJtE6zxpM
 b6NnREtMnEM7hhPeuhet7s1bxDQCnPO/TI3CjQq2xkYuImAslo62ztT8GuN3RoHmebF7N2i4iRH37
 GWdrMpS/+rLX6z+h6te/TfapAm7mOIIW0Z75XdIPAtxdwI99yz2iOErT6U38EKZRDc50=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:43236
 helo=[172.16.1.212]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1hvpS7-0002Me-3b; Thu, 08 Aug 2019 22:56:03 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <b2d51bfa-17e0-c843-de2f-9fcba9ebc9f6@eikelenboom.it>
Date: Thu, 8 Aug 2019 22:59:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen-unstable staging build broken by pvshim patches.
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKSXQgc2VlbXMgdGhlIHB2c2hpbSBwYXRjaGVzIGluIHhlbi11bnN0YWJsZSBz
dGFnaW5nIGJyZWFrIHRoZSBidWlsZCBvbiBteSBtYWNoaW5lLgpJIGNsb25lZCBhIGZyZXNoIHRy
ZWUgdG8gYmUgc3VyZSwgaGF2ZW4ndCBjaGVja2VkIHdoaWNoIG9mIHRoZSB0d28gY29tbWl0cyBj
YXVzZXMgaXQ6CjA2MGY0ZWVlMGZiNDA4YjMxNjU0ODc3NWFiOTIxZTE2YjdhY2QwZTAgb3IgMzJi
MWQ2Mjg4N2QwMWY4NWYwYzFkMmUwMTAzZjY5Zjc0ZTFmNmZhMwoKLS0KU2FuZGVyCgoKClsgLWQg
Ly91c3IvbG9jYWwvbGliL3hlbi9ib290IF0gfHwgL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90
b29scy9maXJtd2FyZS8uLi8uLi90b29scy9jcm9zcy1pbnN0YWxsIC1kIC1tMDc1NSAtcCAvL3Vz
ci9sb2NhbC9saWIveGVuL2Jvb3QKWyAtZCAvL3Vzci9sb2NhbC9saWIvZGVidWcvdXNyL2xvY2Fs
L2xpYi94ZW4vYm9vdCBdIHx8IC91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdh
cmUvLi4vLi4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtZCAtbTA3NTUgLXAgLy91c3IvbG9jYWwvbGli
L2RlYnVnL3Vzci9sb2NhbC9saWIveGVuL2Jvb3QKWyAhIC1lIGh2bWxvYWRlci9odm1sb2FkZXIg
XSB8fCAvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xz
L2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1wIGh2bWxvYWRlci9odm1sb2FkZXIgLy91c3IvbG9jYWwv
bGliL3hlbi9ib290Ci91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvZmlybXdhcmUvLi4v
Li4vdG9vbHMvY3Jvc3MtaW5zdGFsbCAtbTA2NDQgLXAgc2VhYmlvcy1kaXIvb3V0L2Jpb3MuYmlu
IC8vdXNyL2xvY2FsL2xpYi94ZW4vYm9vdC9zZWFiaW9zLmJpbgovdXNyL3NyYy9uZXcveGVuLXVu
c3RhYmxlL3Rvb2xzL2Zpcm13YXJlLy4uLy4uL3Rvb2xzL2Nyb3NzLWluc3RhbGwgLW0wNjQ0IC1w
IHhlbi1kaXIveGVuLXNoaW0gLy91c3IvbG9jYWwvbGliL3hlbi9ib290L3hlbi1zaGltCmluc3Rh
bGw6IGNhbm5vdCBzdGF0ICd4ZW4tZGlyL3hlbi1zaGltJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVj
dG9yeQptYWtlWzRdOiAqKiogW01ha2VmaWxlOjUyOiBpbnN0YWxsXSBFcnJvciAxCm1ha2VbNF06
IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzL2Zpcm13
YXJlJwptYWtlWzNdOiAqKiogWy91c3Ivc3JjL25ldy94ZW4tdW5zdGFibGUvdG9vbHMvLi4vdG9v
bHMvUnVsZXMubWs6MjM3OiBzdWJkaXItaW5zdGFsbC1maXJtd2FyZV0gRXJyb3IgMgptYWtlWzNd
OiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMvbmV3L3hlbi11bnN0YWJsZS90b29scycKbWFr
ZVsyXTogKioqIFsvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzLy4uL3Rvb2xzL1J1bGVz
Lm1rOjIzMjogc3ViZGlycy1pbnN0YWxsXSBFcnJvciAyCm1ha2VbMl06IExlYXZpbmcgZGlyZWN0
b3J5ICcvdXNyL3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwptYWtlWzFdOiAqKiogW01ha2Vm
aWxlOjczOiBpbnN0YWxsXSBFcnJvciAyCm1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNy
L3NyYy9uZXcveGVuLXVuc3RhYmxlL3Rvb2xzJwptYWtlOiAqKiogW01ha2VmaWxlOjEzMTogaW5z
dGFsbC10b29sc10gRXJyb3IgMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
