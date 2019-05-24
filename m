Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D201E29C10
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2019 18:21:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hUCtZ-0005dy-1L; Fri, 24 May 2019 16:18:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aM+Y=TY=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hUCtW-0005dt-TL
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 16:18:10 +0000
X-Inumbo-ID: 8457e1d0-7e3f-11e9-b572-9b6237e0319e
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8457e1d0-7e3f-11e9-b572-9b6237e0319e;
 Fri, 24 May 2019 16:18:08 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8A6AB3016C4A; Fri, 24 May 2019 19:18:07 +0300 (EEST)
Received: from [192.168.228.119] (5-12-248-112.residential.rdsnet.ro
 [5.12.248.112])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 6CBD1306E477;
 Fri, 24 May 2019 19:18:07 +0300 (EEST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190524152318.19735-1-jgross@suse.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <24756c8f-4505-7ab2-07b6-dd9e6868ff49@bitdefender.com>
Date: Fri, 24 May 2019 19:18:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190524152318.19735-1-jgross@suse.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH v2] xen/vm_event: fix rc check for
 uninitialized ring
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNS8yNC8xOSA2OjIzIFBNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IHZtX2V2ZW50X2NsYWlt
X3Nsb3QoKSByZXR1cm5zIC1FT1BOT1RTVVBQIGZvciBhbiB1bmluaXRpYWxpemVkIHJpbmcKPiBz
aW5jZSBjb21taXQgMTVlNGRkNWU4NjZiNDNiYmMgKCJjb21tb24vdm1fZXZlbnQ6IEluaXRpYWxp
emUgdm1fZXZlbnQKPiBsaXN0cyBvbiBkb21haW4gY3JlYXRpb24iKSwgYnV0IHRoZSBjYWxsZXJz
IHRlc3QgZm9yIC1FTk9TWVMuCj4gCj4gQ29ycmVjdCB0aGUgY2FsbGVycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gVjI6IGFkZCBi
bGFuayBsaW5lIChKYW4gQmV1bGljaCkKPiAgICAgcmVwbGFjZSB0d28gZnVydGhlciBFTk9TWVMg
cmV0dXJucyB3aXRoIEVPUE5PVFNVUFAgKFJhenZhbiBDb2pvY2FydSkKCkFja2VkLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgoKVGhhbmtzLApSYXp2YW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
