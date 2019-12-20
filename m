Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58448127A33
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 12:46:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiGfk-0004XZ-AK; Fri, 20 Dec 2019 11:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiGfi-0004XU-Vi
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 11:42:19 +0000
X-Inumbo-ID: c618d722-231d-11ea-9339-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c618d722-231d-11ea-9339-12813bfff9fa;
 Fri, 20 Dec 2019 11:42:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C3F17ACA3;
 Fri, 20 Dec 2019 11:42:16 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>, axboe@kernel.dk,
 konrad.wilk@oracle.com, roger.pau@citrix.com
References: <20191218183718.31719-1-sjpark@amazon.com>
 <20191218183718.31719-3-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <08256095-3b19-8041-9ceb-e9caa77ed4c5@suse.com>
Date: Fri, 20 Dec 2019 12:42:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191218183718.31719-3-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 2/5] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: linux-block@vger.kernel.org, pdurrant@amazon.com,
 SeongJae Park <sjpark@amazon.de>, linux-kernel@vger.kernel.org,
 sj38.park@gmail.com, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTk6MzcsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gRnJvbTogU2VvbmdKYWUg
UGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPiAKPiBBIGRyaXZlcidzICdyZWNsYWltX21lbW9yeScg
Y2FsbGJhY2sgY2FuIHJhY2Ugd2l0aCAncHJvYmUnIG9yICdyZW1vdmUnCj4gYmVjYXVzZSBpdCB3
aWxsIGJlIGNhbGxlZCB3aGVuZXZlciBtZW1vcnkgcHJlc3N1cmUgaXMgZGV0ZWN0ZWQuICBUbwo+
IGF2b2lkIHN1Y2ggcmFjZSwgdGhpcyBjb21taXQgZW1iZWRzIGEgc3BpbmxvY2sgaW4gZWFjaCAn
eGVuYnVzX2RldmljZScKPiBhbmQgbWFrZSAneGVuYnVzJyB0byBob2xkIHRoZSBsb2NrIHdoaWxl
IHRoZSBjb3JyZXNwb25kZWQgY2FsbGJhY2tzIGFyZQo+IHJ1bm5pbmcuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KClJldmlld2VkLWJ5OiBKdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
