Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89777B6013
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 11:25:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAWA3-0006am-7v; Wed, 18 Sep 2019 09:22:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rYmb=XN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAWA2-0006ad-7g
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 09:22:06 +0000
X-Inumbo-ID: c783fcac-d9f5-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c783fcac-d9f5-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 09:22:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 77E10AF41;
 Wed, 18 Sep 2019 09:22:04 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <17dad502-8e1f-83b9-7071-c8e342bc6104@suse.com>
 <8e10c3b4-775e-9c29-e9a5-64c7a8a99d5e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5c5fcb8b-eba2-bd93-d2dc-f06eed7a64af@suse.com>
Date: Wed, 18 Sep 2019 11:22:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8e10c3b4-775e-9c29-e9a5-64c7a8a99d5e@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/9] x86/mm: honor opt_pcid also for
 32-bit PV domains
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDkuMjAxOSAyMTowMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxNy8wOS8yMDE5
IDA3OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSSBjYW4ndCBzZWUgYW55IHRlY2huaWNhbCBv
ciBwZXJmb3JtYW5jZSByZWFzb24gd2h5IHdlIHNob3VsZCB0cmVhdAo+PiAzMi1iaXQgUFYgZGlm
ZmVyZW50IGZyb20gNjQtYml0IFBWIGluIHRoaXMgcmVnYXJkLgo+IAo+IFdlbGwsIG90aGVyIHRo
YW4gdGhlIGZhY3QgdGhpcyBzZXR0aW5nIGlzIG9ubHkgcmVhZCBmb3IgYSA2NGJpdCBndWVzdC4u
LgoKSG93IGNvbWU/IG1ha2VfY3IzKCkgdXNlcyBpdCB1bmlmb3JtbHksIGFzIGRvZXMgcHZfbWFr
ZV9jcjQoKS4KdG9nZ2xlX2d1ZXN0X21vZGUoKSBpcyB0aGUgb25lIGNhc2Ugd2hlcmUgaXQncyBz
dHJpY3RseSA2NC1iaXQKZ3Vlc3Qgb25seS4KCj4gVGhlIHJlYXNvbiBpdCBpc24ndCBzZXQgZm9y
IDMyYml0IGd1ZXN0cyBpcyB0aGF0IHRoZXJlIGlzIG5vIHNjZW5hcmlvCj4gd2hlcmUgd2UgdXNl
IGl0LgoKInBjaWQ9MSIgYW5kICJwY2lkPW5veHB0aSIgYm90aCBhcmUgc2NlbmFyaW9zIHdoZXJl
LCB3aXRoIHRoaXMKcGF0Y2ggaW4gcGxhY2UsIHdlIHdvdWxkIHVzZSBpdC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
