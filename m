Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E02C0005
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkdK-0001XH-Ne; Fri, 27 Sep 2019 07:25:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkdI-0001X8-UB
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:25:40 +0000
X-Inumbo-ID: c4652858-e0f7-11e9-966f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c4652858-e0f7-11e9-966f-12813bfff9fa;
 Fri, 27 Sep 2019 07:23:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0940DADD5;
 Fri, 27 Sep 2019 07:23:53 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190925070503.13850-1-jgross@suse.com>
 <20190925070503.13850-2-jgross@suse.com>
 <26e09877d338d3801dbb38b881e8890cca2255ab.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2c63edeb-b8b8-dc4e-4c25-7678bc7776a0@suse.com>
Date: Fri, 27 Sep 2019 09:23:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <26e09877d338d3801dbb38b881e8890cca2255ab.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 a653sched_free_vdata()
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTI6NTksIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0w
OS0yNSBhdCAwOTowNSArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIGFyaW5jNjUz
IHNjaGVkdWxlcidzIGZyZWVfdmRhdGEoKSBmdW5jdGlvbiBpcyBtaXNzaW5nIHByb3Blcgo+PiBs
b2NraW5nOiBhcyBpdCBpcyBtb2RpZnlpbmcgdGhlIHNjaGVkdWxlcidzIHByaXZhdGUgdmNwdSBs
aXN0IGl0Cj4+IG5lZWRzCj4+IHRvIHRha2UgdGhlIHNjaGVkdWxlciBsb2NrIGR1cmluZyB0aGF0
IG9wZXJhdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgo+Pgo+IFJldmlld2VkLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2Uu
Y29tPgoKQXMgdGhpcyBwYXRjaCBpcyBhIHByZXJlcXVpc2l0ZSBmb3IgbXkgY29yZSBzY2hlZHVs
aW5nIHNlcmllcyBJJ2QgcmVhbGx5CmFwcHJlY2lhdGUgaWYgaXQgY291bGQgYmUgY29tbWl0dGVk
IHJhdGhlciBzb29uZXIgdGhhbiBsYXRlci4KCkpvc2gsIFJvYmVydCwgY291bGQgeW91IHBsZWFz
ZSBjb21tZW50PwoKT3IgaXMgRGFyaW8ncyBSLWIgKGFuZCBKYW4ncyBhcyB3ZWxsKSBlbm91Z2gg
aW4gdGhpcyByYXRoZXIgc2ltcGxlIGFuZApvYnZpb3VzIGNhc2U/CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
