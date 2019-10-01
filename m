Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC5C31D0
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 12:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFFje-0006iT-HV; Tue, 01 Oct 2019 10:50:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=itvi=X2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFFjc-0006iO-Oh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 10:50:24 +0000
X-Inumbo-ID: 44b72008-e439-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 44b72008-e439-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 10:50:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BE22B022;
 Tue,  1 Oct 2019 10:50:22 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <20191001082818.34233-1-paul.durrant@citrix.com>
 <ead7c0a0-9ee2-c50b-7565-ada456cab052@suse.com>
 <540a69d5e3c246a08b9d87d0d032761a@AMSPEX02CL03.citrite.net>
 <b944e15f-5adc-4597-9bb0-a010445a6af5@suse.com>
 <dd43ad524f7c457eae6dbf74ec3a6547@AMSPEX02CL03.citrite.net>
 <352b04a5-52b4-4ab1-fa3c-41f93f566c47@suse.com>
 <728628bd673a405fbf9a37efeef01a2a@AMSPEX02CL03.citrite.net>
 <0e45cdd1-7f52-0e31-e732-9351d498f13a@citrix.com>
 <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f0153ab0-84b7-65e6-ad1d-4de06052034a@suse.com>
Date: Tue, 1 Oct 2019 12:50:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c2dff4f9265543629288d6cd64a6ddce@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxMjo0MCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+IFNlbnQ6IDAxIE9jdG9iZXIgMjAx
OSAxMTozNAo+Pgo+PiBPbmUgdGhpbmcgd2UgY291bGQgaW1hZ2luZSBpcyB0aGF0IHdoZW4gc3Bl
Y2lmaWMgZGV2aWNlcyBoYXZlIGFuIGFjdGl2ZQo+PiBlbXVsYXRvciAob3Igd2hhdGV2ZXIpIHBy
b3BhZ2F0aW5nIHRoZSBkaXJ0eSBpbmZvcm1hdGlvbiwgZm9yIHRoYXQgY29kZQo+PiB0byB0ZWxs
IFhlbiwgIkkgYW0gaW1wbGVtZW50aW5nIGRpcnR5IHRyYWNraW5nIGZvciB0aGlzIGRldmljZSIu
ICBUaGVuCj4+IHdoZW4gdGhlIHRvb2xzdGFjayBlbmFibGVzIGxvZ2RpcnR5LCB0aGUgY2hlY2sg
Y2FuIGJlLCAiQXJlIHRoZXJlIGFueQo+PiBkZXZpY2VzICp0aGF0IGRvbid0IGhhdmUgZXh0ZXJu
YWwgZGlydHkgdHJhY2tpbmcgZW5hYmxlZCogYXNzaWduZWQgdG8KPj4gdGhlIGd1ZXN0PyIKPiAK
PiBBbmQgd2hhdCBhYm91dCBleGlzdGluZyBlbXVsYXRvcnMgc2V0dGluZyBwYWdlcyBkaXJ0eSBh
dCB0aGUgbW9tZW50PyBJCj4gZG9uJ3Qgc2VlIHdoeSBYZW4ncyBpbnRlcm5hbCBkaXJ0eSBwYWdl
IGxvZ2dpbmcgaXMgY29uc2lkZXJlZCBkZWZpbml0aXZlCj4gYmVjYXVzZSBBRkFJQ1QgdGhhdCBp
cyByZWFsbHkgbm90IHRoZSBjYXNlIGV2ZW4gbm93LgoKSSBkb24ndCB0aGluayBleHRlcm5hbCBl
bXVsYXRvcnMgYWxyZWFkeSBzZXR0aW5nIHBhZ2VzIGRpcnR5IG1hdHRlciBoZXJlLgpBbGwgdGhl
eSB3YW50L25lZWQgdG8gZG8gaXMgYWR2ZXJ0aXNlIHdoaWNoIGRldmljZShzKSB0aGV5IHRha2Ug
Y2FyZSBvZi4KVGhlc2UgZW11bGF0b3JzIGFjdHVhbGx5IF9oZWxwXyBYZW4gbWFpbnRhaW4gYSBj
b3JyZWN0IHBpY3R1cmUuIFdoYXQgeW91cgpwYXRjaCBpbW8gZG9lcyB0aG91Z2ggaXMgKGZ1cnRo
ZXIpIHdlYWtlbiB0aGUgY3VycmVudCBtb2RlbC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
