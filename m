Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C8D168C0B
	for <lists+xen-devel@lfdr.de>; Sat, 22 Feb 2020 03:34:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5KYO-0004Qc-LI; Sat, 22 Feb 2020 02:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bAu4=4K=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1j5KYM-0004I7-Pu
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2020 02:30:02 +0000
X-Inumbo-ID: 39eb42d2-551b-11ea-ade5-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39eb42d2-551b-11ea-ade5-bc764e2007e4;
 Sat, 22 Feb 2020 02:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582338602;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=yuXxG4lbB1+ldPyLAPx4IhDJ3mhK5aMXCNY3pCXbUdo=;
 b=XvkkC0XsQMB5uwbUWym2xpU1bZWtAeO32h0Rgx1QPuF9OJHe/wR65z7N
 n6MQeMO+7FR7JKnR3WVV+WD9DumlihkOxis0cOg6IGjtp0iYj/x12fzfS
 1UYQeOX1+IVuK7Deq6e5J4ulge8LyFRc6yBFrdvLi9m6nLuI5h7EpYZvh s=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KqSoabgwzQE5i2dbZQ8AwsqCSI1exP7trEWoCbhzxUauyaRhIURJ/RqT9soZ/rmc06wGH00ZFF
 QjaGzbPjgRUTCtTViQtlSN5exvWkSGLkWjaOdtsIiCVXIC+CylOQkC9sFhRaClQCKAr7kKbsb3
 EjXbBlf6TnMG+I6FwOo2zlBeHwtKxk8tsmUPl//ybwNJefMx+rTSzhnph9KQLwgFYe0DqhDm1w
 ZK/VODNSCPFfTG1Dtj/F6hvt4GtdGvIobKiy25XekVX6DwaM/hxstmsq4IWSse4nbXqp3+jbyk
 JIY=
X-SBRS: 2.7
X-MesageID: 12829705
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,470,1574139600"; d="scan'208";a="12829705"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20200218122114.17596-1-jgross@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <709bf8df-1635-cb71-11ea-f8d1b629a071@citrix.com>
Date: Sat, 22 Feb 2020 02:29:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218122114.17596-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/4] xen/rcu: let rcu work better with
 core scheduling
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDIvMjAyMCAxMjoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUb2RheSB0aGUgUkNV
IGhhbmRsaW5nIGluIFhlbiBpcyBhZmZlY3Rpbmcgc2NoZWR1bGluZyBpbiBzZXZlcmFsIHdheXMu
Cj4gSXQgaXMgcmFpc2luZyBzY2hlZCBzb2Z0aXJxcyB3aXRob3V0IGFueSByZWFsIG5lZWQgYW5k
IGl0IHJlcXVpcmVzCj4gdGFza2xldHMgZm9yIHJjdV9iYXJyaWVyKCksIHdoaWNoIGludGVyYWN0
cyBiYWRseSB3aXRoIGNvcmUgc2NoZWR1bGluZy4KPiAKPiBUaGlzIHNtYWxsIHNlcmllcyByZXBh
aXJzIHRob3NlIGlzc3Vlcy4KPiAKPiBBZGRpdGlvbmFsbHkgc29tZSBBU1NFUlQoKXMgYXJlIGFk
ZGVkIGZvciB2ZXJpZmljYXRpb24gb2Ygc2FuZSByY3UKPiBoYW5kbGluZy4gSW4gb3JkZXIgdG8g
YXZvaWQgdGhvc2UgdHJpZ2dlcmluZyByaWdodCBhd2F5IHRoZSBvYnZpb3VzCj4gdmlvbGF0aW9u
cyBhcmUgZml4ZWQuCgpJJ3ZlIGRvbmUgbW9yZSB0ZXN0aW5nIG9mIHRoaXMgd2l0aCBbMV0gYW5k
LCB1bmZvcnR1bmF0ZWx5LCBpdCBxdWl0ZSBlYXNpbHkKZGVhZGxvY2tzIHdoaWxlIHdpdGhvdXQg
dGhpcyBzZXJpZXMgaXQgZG9lc24ndC4KClN0ZXBzIHRvIHJlcHJvOgotIGFwcGx5IFsxXQotIHRh
a2UgYSBob3N0IHdpdGggY29uc2lkZXJhYmxlIENQVSBjb3VudCAofjY0KQotIHJ1biBhIGxvb3A6
IHhlbi1ocHRvb2wgc210LWRpc2FibGU7IHhlbi1ocHRvb2wgc210LWVuYWJsZQoKWzFdIGh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9t
c2cwMTM4My5odG1sCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
