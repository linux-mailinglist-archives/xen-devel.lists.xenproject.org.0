Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBADAEE68
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 17:20:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7huT-0002MN-Gu; Tue, 10 Sep 2019 15:18:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7huS-0002MH-8c
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 15:18:24 +0000
X-Inumbo-ID: 3a3b0790-d3de-11e9-ac1f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a3b0790-d3de-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 15:18:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB4DEBA94;
 Tue, 10 Sep 2019 15:18:21 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-29-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d09034f5-d2f2-c42c-d3d8-d0a4d8380312@suse.com>
Date: Tue, 10 Sep 2019 17:18:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-29-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 28/48] xen/sched: move struct task_slice
 into struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBvcmRlciB0byBw
cmVwYXJlIGZvciBtdWx0aXBsZSB2Y3B1cyBwZXIgc2NoZWR1bGUgdW5pdCBtb3ZlIHN0cnVjdAo+
IHRhc2tfc2xpY2UgaW4gc2NoZWR1bGUoKSBmcm9tIHRoZSBsb2NhbCBzdGFjayBpbnRvIHN0cnVj
dCBzY2hlZF91bml0Cj4gb2YgdGhlIGN1cnJlbnRseSBydW5uaW5nIHVuaXQuCgpUaGUgY2hhbmdl
IGxvb2tzIG1lY2hhbmljYWwgZW5vdWdoIHRvIGJlIHByb2JhYmx5IGZpbmUsIGJ1dCB3aGF0J3MK
dGhlIGNvbm5lY3Rpb24gYmV0d2VlbiB0aGUgaXRlbSBjdXJyZW50bHkgYmVpbmcgb24gc2NoZWR1
bGUoKSdzIHN0YWNrCmFuZCB0aGVyZSBiZWluZyBtdWx0aXBsZSB2Q1BVLXM/IElzIHRoaXMgYmVj
YXVzZSBpdCdsbCBiZSBlc3RhYmxpc2hlZApqdXN0IG9uY2UsIGJ1dCB1c2VkIG11bHRpcGxlIHRp
bWVzIChieSBkaWZmZXJlbnQgcGFydGllcyk/IEluIHdoaWNoCmNhc2UsIHNpbmNlIHRoZSAic2xh
dmVzIiB3aWxsIGhhdmUgdG8gd2FpdCBmb3IgdGhlICJtYXN0ZXIiIHRvIG1ha2UKdGhlIHNjaGVk
dWxpbmcgZGVjaXNpb24sIHRoZXJlJ2xsIG5lZWQgdG8gYmUgY29tbXVuaWNhdGlvbiBhbnl3YXkK
YmV0d2VlbiBhbGwgaW52b2x2ZWQgcGFydGllcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
