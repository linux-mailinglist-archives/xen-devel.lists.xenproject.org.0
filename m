Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090601171AF
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:32:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieLue-0003To-6I; Mon, 09 Dec 2019 16:29:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieLuc-0003Tj-Ak
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:29:30 +0000
X-Inumbo-ID: 12767654-1aa1-11ea-881a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12767654-1aa1-11ea-881a-12813bfff9fa;
 Mon, 09 Dec 2019 16:29:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B7C88B19E;
 Mon,  9 Dec 2019 16:29:28 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-5-andrew.cooper3@citrix.com>
 <2c3ea72b-b85a-a65e-9403-3abeae76a41a@suse.com>
Message-ID: <69f66b76-7352-dba2-bd04-2ffe2840a30b@suse.com>
Date: Mon, 9 Dec 2019 17:29:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <2c3ea72b-b85a-a65e-9403-3abeae76a41a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/6] xen/hypercall: Cope with -ERESTART on
 more hypercall paths
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxNzoyNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMTIuMjAxOSAy
MzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gVGhlc2UgaHlwZXJjYWxscyBlYWNoIHVzZSBj
b250aW51ZV9oeXBlcmNhbGxfb25fY3B1KCksIHdob3NlIEFQSSBpcyBhYm91dCB0bwo+PiBzd2l0
Y2ggdG8gdXNlIC1FUkVTVEFSVC4gIFVwZGF0ZSB0aGUgc29vbi10by1iZSBhZmZlY3RlZCBwYXRo
cyB0byBjb3BlLAo+PiBmb2xkaW5nIGV4aXN0aW5nIGNvbnRpbmF0aW9uIGxvZ2ljIHdoZXJlIGFw
cGxpY2FibGUuCj4+Cj4+IEluIGFkZGl0aW9uOgo+PiAgKiBGb3IgcGxhdGZvcm0gb3AgYW5kIHN5
c2N0bCwgaW5zZXJ0IGEgY3B1X3JlbGF4KCkgaW50byB3aGF0IGlzIG90aGVyd2lzZSBhCj4+ICAg
IHRpZ2h0IHNwaW5sb2NrIGxvb3AsIGFuZCBtYWtlIHRoZSBjb250aW51YXRpb24gbG9naWMgY29t
bW9uIGF0IHRoZQo+PiAgICBlcGlsb2d1ZS4KPiAKPiBJcyB0aGlzIHJlYWxseSBuZWVkZWQgd2l0
aCBhIGh5cGVyY2FsbF9wcmVlbXB0X2NoZWNrKCkgaW52b2NhdGlvbgo+IGFscmVhZHkgaW4gdGhl
IGJvZGllcyBvZiB0aGVzZSBsb29wcz8KCkFuZCBpZiBpdCdzIHJlYWxseSB0byBiZSBhZGRlZCwg
c2hvdWxkbid0IGl0IGJlIGF0IHRoZSBib3R0b20Kb2YgdGhlIGxvb3AgYm9kaWVzIHJhdGhlciB0
aGFuIGF0IHRoZSB0b3A/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
