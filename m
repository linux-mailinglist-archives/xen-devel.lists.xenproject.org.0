Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B18C1502F1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 10:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyXdM-0006Gi-Rx; Mon, 03 Feb 2020 09:03:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2xfu=3X=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iyXdL-0006Gd-RM
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 09:03:07 +0000
X-Inumbo-ID: fd6ce45c-4663-11ea-8e3b-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd6ce45c-4663-11ea-8e3b-12813bfff9fa;
 Mon, 03 Feb 2020 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oeFY0RwFO6Q/B8nMQmCZwDBwaxuuxCRDO4G5Qc+y/Tw=; b=VEEgPUIieu5wDbyQRnoJezYroj
 baj+MTYSFyTD/SLlNpdzRvQOAYlz9IuP6xbeLGTxqJ2VHMc9QZ8jq8TzNP3o06+Bolz81qI84W/ww
 qdxg4qfO+v0McUCE0DZzowvNMNp7Xg3ZJo59N0hpPQT4n6VBeBec5A/fv6mbLbWEeeho=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:59090
 helo=[10.97.34.6]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iyXCf-0000TF-F2; Mon, 03 Feb 2020 09:35:33 +0100
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
Date: Mon, 3 Feb 2020 09:33:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen-unstable: pci-passthrough regression bisected to:
 x86/smp: use APIC ALLBUT destination shorthand when possible
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

SGkgUm9nZXIsCgpMYXN0IHdlZWsgSSBlbmNvdW50ZXJlZCBhbiBpc3N1ZSB3aXRoIHRoZSBQQ0kt
cGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJvbGxlci4gCkluIHRoZSBndWVzdCBJIGdldDoKICAg
IFsgMTE0My4zMTM3NTZdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IG5vdCByZXNw
b25kaW5nIHRvIHN0b3AgZW5kcG9pbnQgY29tbWFuZC4KICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lf
aGNkIDAwMDA6MDA6MDUuMDogeEhDSSBob3N0IGNvbnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFz
c3VtZSBkZWFkCiAgICBbIDExNDMuMzQ3MzY0XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IEhDIGRp
ZWQ7IGNsZWFuaW5nIHVwCiAgICBbIDExNDMuMzU2NDA3XSB1c2IgMS0yOiBVU0IgZGlzY29ubmVj
dCwgZGV2aWNlIG51bWJlciAyCgpCaXNlY3Rpb24gdHVybmVkIHVwIGFzIHRoZSBjdWxwcml0OiAK
ICAgY29tbWl0IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThlYzgyZmY3YTUKICAgeDg2
L3NtcDogdXNlIEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxl
CgpJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0IGNvbW1pdCBhbmQgbm93IGl0IHdvcmtzIGZp
bmUgYWdhaW4uCgpCb3ggaXMgQU1ELCBndWVzdCBpcyBhIEhWTS4KCi0tClNhbmRlcgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
