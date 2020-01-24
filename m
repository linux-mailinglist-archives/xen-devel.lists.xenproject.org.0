Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FD41478B9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2020 07:52:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iusmv-0003Ke-LI; Fri, 24 Jan 2020 06:49:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8Hxa=3N=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iusmu-0003Jp-1Y
 for xen-devel@lists.xenproject.org; Fri, 24 Jan 2020 06:49:52 +0000
X-Inumbo-ID: b3405af8-3e75-11ea-8e9a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b3405af8-3e75-11ea-8e9a-bc764e2007e4;
 Fri, 24 Jan 2020 06:49:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 45D15AD77;
 Fri, 24 Jan 2020 06:49:42 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20200123090323.16272-1-jgross@suse.com>
 <53ba68698c171e99f0ce67af74bb9d7fc6e924d6.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <69e01ec5-14eb-f908-e3ff-e4b7cf6796a1@suse.com>
Date: Fri, 24 Jan 2020 07:49:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <53ba68698c171e99f0ce67af74bb9d7fc6e924d6.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: avoid cpumasks on stack in
 sched/core.c
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDEuMjAgMDE6MDEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFRodSwgMjAyMC0w
MS0yMyBhdCAxMDowMyArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlcmUgYXJlIHN0
aWxsIHNldmVyYWwgaW5zdGFuY2VzIG9mIGNwdW1hc2tfdCBvbiB0aGUgc3RhY2sgaW4KPj4gc2No
ZWR1bGluZyBjb2RlLiBBdm9pZCB0aGVtIGFzIGZhciBhcyBwb3NzaWJsZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+Pgo+IFJldmlld2VkLWJ5
OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgo+IAo+IEp1c3QgY3VyaW91cy4u
Lgo+IAo+PiAtLS0gYS94ZW4vY29tbW9uL3NjaGVkL2NvcmUuYwo+PiArKysgYi94ZW4vY29tbW9u
L3NjaGVkL2NvcmUuYwo+PiBAQCAtMjU4NiwxMSArMjU4MiwxMSBAQCBzdGF0aWMgdm9pZCBzY2hl
ZHVsZSh2b2lkKQo+PiAgIAo+PiAgICAgICBpZiAoIGdyYW4gPiAxICkKPj4gICAgICAgewo+PiAt
ICAgICAgICBjcHVtYXNrX3QgbWFzazsKPj4gKyAgICAgICAgY3B1bWFza190ICptYXNrID0gY3B1
bWFza19zY3JhdGNoX2NwdShjcHUpOwo+PiAgIAo+PiAgICAgICAgICAgcHJldi0+cmVuZGV6dm91
c19pbl9jbnQgPSBncmFuOwo+PiAtICAgICAgICBjcHVtYXNrX2FuZG5vdCgmbWFzaywgc3ItPmNw
dXMsIGNwdW1hc2tfb2YoY3B1KSk7Cj4+IC0gICAgICAgIGNwdW1hc2tfcmFpc2Vfc29mdGlycSgm
bWFzaywgU0NIRURfU0xBVkVfU09GVElSUSk7Cj4+ICsgICAgICAgIGNwdW1hc2tfYW5kbm90KG1h
c2ssIHNyLT5jcHVzLCBjcHVtYXNrX29mKGNwdSkpOwo+PiArICAgICAgICBjcHVtYXNrX3JhaXNl
X3NvZnRpcnEobWFzaywgU0NIRURfU0xBVkVfU09GVElSUSk7Cj4+Cj4gLi4uIHdoeSBhcmUgd2Ug
a2VlcGluZyB0aGUgdGVtcG9yYXJ5IHZhcmlhYmxlIChtYXNrKSA/CgpwZXJfY3B1IGFjY2Vzc2Vz
IGFyZSBtb3JlIGV4cGVuc2l2ZSB0aGFuIHRob3NlIHRvIGxvY2FsIHZhcmlhYmxlcy4KbWFzayBp
cyB1c2VkIHR3aWNlLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
