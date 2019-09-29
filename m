Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D260EC18F9
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 20:29:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEdu6-0006O1-6q; Sun, 29 Sep 2019 18:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=heD2=XY=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iEdu4-0006Nw-OG
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 18:26:40 +0000
X-Inumbo-ID: ac66c8b0-e2e6-11e9-96bc-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by localhost (Halon) with ESMTPS
 id ac66c8b0-e2e6-11e9-96bc-12813bfff9fa;
 Sun, 29 Sep 2019 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Cc:To:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mhb3JtONLhkh8g+mStCOxeY5PpLYxcVZtYx5jNc5DVQ=; b=kWTLMrBUnCLnQI5ncfqDlZ8xf1
 eqmrbbremgMVG8GAEmCFThVnMy8HSmWG/55XrC9+0qlXcyTjQUwBhAG7FGCn7uSmJvrX6Hmryy7Zy
 qPldITaMalb5dHiboIv2Li7RlAOdOtOV1LQqgbb9Ldic84DTC5h9aJYNlGWX7/Ry3ZTU=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:57650
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iEduZ-0003TT-3m; Sun, 29 Sep 2019 20:27:11 +0200
From: Sander Eikelenboom <linux@eikelenboom.it>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <4010b453-54cc-152d-27c7-a7d5cb4acb11@eikelenboom.it>
Date: Sun, 29 Sep 2019 20:27:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] Xen-unstable: regression when trying to shutdown HVM
 guest with pci passthrough
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

SGkgQW50aG9ueSwKCldoaWxlIHRlc3RpbmcgSSBlbmNvdW50ZXJlZCBhIHByb2JsZW0gd2l0aCBt
eSBIVk0gZ3Vlc3RzIHdoaWNoIHVzZSBwY2kgcGFzc3Rocm91Z2guCldoZW4gdHJ5aW5nIHRvIHNo
dXRkb3duIHRoZSBndWVzdCBpdCB3aWxsIHN0YXkgaW4gdGhlICItLS1zLS0iIHJ1bnN0YXRlIGlu
ZGVmaW5pdGVseS4KCk9uIHRoZSBndWVzdCBjb25zb2xlIEkgZ2V0OgogICAgWyAgNTE4LjU4NzY2
OV0geGVuYnVzOiB4ZW5idXNfZGV2X3NodXRkb3duOiBkZXZpY2UvcGNpLzA6IEluaXRpYWxpc2lu
ZyAhPSBDb25uZWN0ZWQsIHNraXBwaW5nCiAgICBbICA1MTguNjc0ODcwXSBBQ1BJOiBQcmVwYXJp
bmcgdG8gZW50ZXIgc3lzdGVtIHNsZWVwIHN0YXRlIFM1CiAgICBbICA1MTguNjgzOTUyXSByZWJv
b3Q6IFBvd2VyIGRvd24KCldoZW4gdHJ5aW5nIHRvIGRlc3Ryb3kgdGhlIHN0dWNrIGd1ZXN0IEkg
Z2V0OgoJbGlieGw6IGVycm9yOiBsaWJ4bF9kb21haW4uYzoxMTY1OmRlc3Ryb3lfZG9taWRfcGNp
X2RvbmU6IERvbWFpbiA5OlBjaSBzaHV0ZG93biBmYWlsZWQKCWxpYnhsOiBlcnJvcjogbGlieGxf
ZG9tYWluLmM6MTA4OTpkb21haW5fZGVzdHJveV9jYWxsYmFjazogRG9tYWluIDk6VW5hYmxlIHRv
IGRlc3Ryb3kgZ3Vlc3QKCWxpYnhsOiBlcnJvcjogbGlieGxfZG9tYWluLmM6MTAxNjpkb21haW5f
ZGVzdHJveV9jYjogRG9tYWluIDk6RGVzdHJ1Y3Rpb24gb2YgZG9tYWluIGZhaWxlZCBkZXN0cm95
IGZhaWxlZCAocmM9LTkpCgpCaXNlY3Rpb24gdHVybmVkIHVwIGNvbW1pdCBmYWU0ODgwYzQ1ZmUw
MTVlNTY3YWZhMjIzZjc4YmYxN2E2ZDk4ZTFiICJsaWJ4bF9wY2k6IFVzZSBldl9xbXAgZm9yIHBj
aV9yZW1vdmUiIGFzIHRoZSBjdWxwcml0LgoKLS0KU2FuZGVyCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
