Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430F211376E
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 23:11:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iccn7-0003Qp-Ht; Wed, 04 Dec 2019 22:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=501J=Z2=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iccn5-0003Qk-3y
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 22:06:36 +0000
X-Inumbo-ID: 5441fa26-16e2-11ea-820e-12813bfff9fa
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5441fa26-16e2-11ea-820e-12813bfff9fa;
 Wed, 04 Dec 2019 22:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R0OoKFZsUj9D/Vv4L3bjqa8XG7DMVeVdPIvO/xy+e+M=; b=fyne66Mp5CDyqRrzYeeqByO8FI
 ZS0XDoNdgaS3WaYQwgdTelbTvkSpACtOOMCbGuIpAuD3Y7KcLSS/O988eVuB0cQNsaIGeUQR+IpcH
 Q6xSuqK3TqQq0BhdXfpmzZihgke6kUP1rU/6XDWhpMPZFEYT4aVvsKMPQpGsggAI+MTE=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:32814
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1icco2-000147-Vj; Wed, 04 Dec 2019 23:07:35 +0100
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <1575495080-27656-1-git-send-email-igor.druzhinin@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <14f39b36-49c6-6540-9499-22df1b67dbe6@eikelenboom.it>
Date: Wed, 4 Dec 2019 23:06:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1575495080-27656-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] passthrough: add missed pcidevs_unlock
 following c/s cd7dedad820
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
Cc: jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTIvMjAxOSAyMjozMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhlIGxvY2tpbmcg
cmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5nZWQgYW5kIGEgcHJlbWF0dXJlIGJyZWFrIGluCj4g
dGhpcyBzZWN0aW9uIG5vdyBjYXVzZXMgdGhlIGZvbGxvd2luZyBhc3NlcnRpb246Cj4gCj4gQXNz
ZXJ0aW9uICchcHJlZW1wdF9jb3VudCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2Cj4gCj4gUmVw
b3J0ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+Cj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4g
LS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gaW5kZXggY2VkMGMy
OC4uMjU5M2ZlNCAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTE3MDUsNiArMTcwNSw3
IEBAIGludCBpb21tdV9kb19wY2lfZG9tY3RsKAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNl
ZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7Cj4gICAgICAgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgIHBjaWRl
dnNfdW5sb2NrKCk7Cj4gICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgIH0KPiAgICAgICAg
ICBlbHNlIGlmICggIXJldCApCj4gCgpKdXN0IHRlc3RlZCBhbmQgaXQgd29ya3MgZm9yIG1lLCB0
aGFua3MgSWdvciEKCi0tClNhbmRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
