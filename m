Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E434433BA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 09:33:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbKBB-00052J-8V; Thu, 13 Jun 2019 07:29:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LEkp=UM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbKB9-00052E-GO
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 07:29:47 +0000
X-Inumbo-ID: 04578586-8dad-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 04578586-8dad-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 07:29:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9CDF3AC5C;
 Thu, 13 Jun 2019 07:29:44 +0000 (UTC)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-14-jgross@suse.com>
 <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bdc2b540-3218-ffb2-04ce-ea1acdab25c2@suse.com>
Date: Thu, 13 Jun 2019 09:29:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMTMuMDYuMTkgMDk6MTgsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6Cj4gSGVs
bG8gSnVlcmdlbiwKPiAKPiBQbGVhc2Ugbm90ZSB0aGF0IHRoaXMgcGF0Y2ggd2lsbCBjbGFzaCB3
aXRoIFsxXS4KPiAKPiBPbiAyOC4wNS4xOSAxMzozMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4g
dmNwdS0+bGFzdF9ydW5fdGltZSBpcyBwcmltYXJpbHkgdXNlZCBieSBzY2hlZF9jcmVkaXQsIHNv
IG1vdmUgaXQgdG8KPj4gc3RydWN0IHNjaGVkX3VuaXQsIHRvby4KPiAKPiBgbGFzdF9ydW5fdGlt
ZWAgaXMgbW92ZWQgdG8gY3JlZGl0IHByaXZhdGVzIGFzIGZvciBjdXJyZW50IHN0YWdpbmcuCgpU
aGFua3MgZm9yIHRoZSBoZWFkcyB1cCwgYnV0IEkndmUgcmViYXNlZCBhbHJlYWR5LiA6LSkKCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
