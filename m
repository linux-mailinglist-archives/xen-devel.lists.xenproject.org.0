Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE1E4F4D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:38:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0gX-0002MW-AS; Fri, 25 Oct 2019 14:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iO0gW-0002MR-3i
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:35:24 +0000
X-Inumbo-ID: ad433c52-f734-11e9-bbab-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad433c52-f734-11e9-bbab-bc764e2007e4;
 Fri, 25 Oct 2019 14:35:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6C2B8B367;
 Fri, 25 Oct 2019 14:35:22 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-11-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6fc04af2-95f9-988e-02e3-592d473df6b4@suse.com>
Date: Fri, 25 Oct 2019 16:35:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-11-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 10/10] ioreq: provide support for
 long-running operations...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC4uLmFuZCBzd2l0
Y2ggdlBDSSB0byB1c2UgdGhpcyBpbmZyYXN0cnVjdHVyZSBmb3IgbG9uZyBydW5uaW5nCj4gcGh5
c21hcCBtb2RpZmljYXRpb24gb3BlcmF0aW9ucy4KPiAKPiBUaGlzIGFsbG93cyB0byBnZXQgcmlk
IG9mIHRoZSB2UENJIHNwZWNpZmljIG1vZGlmaWNhdGlvbnMgZG9uZSB0bwo+IGhhbmRsZV9odm1f
aW9fY29tcGxldGlvbiBhbmQgYWxsb3dzIGdlbmVyYWxpemluZyB0aGUgc3VwcG9ydCBmb3IKPiBs
b25nLXJ1bm5pbmcgb3BlcmF0aW9ucyB0byBvdGhlciBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzLiBT
dWNoIHN1cHBvcnQKPiBpcyBpbXBsZW1lbnRlZCBhcyBhIHNwZWNpZmljIGhhbmRsZXIgdGhhdCBj
YW4gYmUgcmVnaXN0ZXJzIGJ5IGludGVybmFsCj4gaW9yZXEgc2VydmVycyBhbmQgdGhhdCB3aWxs
IGJlIGNhbGxlZCB0byBjaGVjayBmb3IgcGVuZGluZyB3b3JrLgo+IFJldHVybmluZyB0cnVlIGZy
b20gdGhpcyBoYW5kbGVyIHdpbGwgcHJldmVudCB0aGUgdmNwdSBmcm9tIHJ1bm5pbmcKPiB1bnRp
bCB0aGUgaGFuZGxlciByZXR1cm5zIGZhbHNlLgoKSXMgdGhlIG1lbnRpb25pbmcgb2YgYSBzcGVj
aWFsIGhhbmRsZXIgc3RhbGUgZnJvbSBwZXJoYXBzIGEKZGlmZmVyZW50IGVhcmxpZXIgaW1wbGVt
ZW50YXRpb24/IFVubGVzcyBJJ20gb3Zlcmxvb2tpbmcgLwptaXN1bmRlcnN0YW5kaW5nIHNvbWV0
aGluZyBoZXJlLCB3aXRoIHRoaXMgYWRqdXN0ZWQgLi4uCgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
