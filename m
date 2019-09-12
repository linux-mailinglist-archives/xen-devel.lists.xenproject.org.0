Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEFEB0F9C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 15:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Ony-0003c6-Sk; Thu, 12 Sep 2019 13:06:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Onx-0003c1-H6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 13:06:33 +0000
X-Inumbo-ID: 242b664e-d55e-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 242b664e-d55e-11e9-a337-bc764e2007e4;
 Thu, 12 Sep 2019 13:06:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DACC7B690;
 Thu, 12 Sep 2019 13:06:31 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190912111744.40410-1-paul.durrant@citrix.com>
 <20190912111744.40410-6-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c7e4fd1-79e8-a517-7e2d-7370fc7ef441@suse.com>
Date: Thu, 12 Sep 2019 15:06:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912111744.40410-6-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzoxNywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IHY5Ogo+ICAtIEFkZCBu
ZXcgS2NvbmZpZyBvcHRpb24gdG8gY2F1c2UgJ2lvbW11X2hhcF9wdF9zaGFyZScgdG8gYmUgZGVm
aW5lZCB0bwo+ICAgIHRydWUsIHJhdGhlciB0aGFuIHVzaW5nIENPTkZJR19BUk0sIGFzIHJlcXVl
c3RlZCBieSBKdWxpZW4KPiAgLSBBc3N1bWluZyBKYW4ncyBSLWIgc3RhbmRzIHNpbmNlIHRoaXMg
aXMgYSBtYWlubHkgYSBjb3NtZXRpYyBjaGFuZ2UKPiAgICBkaXJlY3RseSByZXF1ZXN0ZWQgYnkg
YW5vdGhlciBtYWludGFpbmVyCgpZZXMsIHRoYXQncyBwZXJmZWN0bHkgZmluZS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
