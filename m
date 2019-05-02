Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CBB11589
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:38:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7Cw-0001Ma-Uo; Thu, 02 May 2019 08:36:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM7Cw-0001MT-1x
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:36:46 +0000
X-Inumbo-ID: 66e31a16-6cb5-11e9-8002-bbd2cd639da4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66e31a16-6cb5-11e9-8002-bbd2cd639da4;
 Thu, 02 May 2019 08:36:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 02:36:37 -0600
Message-Id: <5CCAAC14020000780022B0DC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 02:36:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>,
 "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
In-Reply-To: <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDA4OjIwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gNS8yLzE5IDI6NTIgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgv
dm14LmMKPj4gQEAgLTc3OSwxMiArNzc5LDE3IEBAIHN0YXRpYyB2b2lkIHZteF9sb2FkX2NwdV9z
dGF0ZShzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9od19jcHUgKmRhdGEpCj4+ICAKPj4gIHN0
YXRpYyB2b2lkIHZteF9zYXZlX3ZtY3NfY3R4dChzdHJ1Y3QgdmNwdSAqdiwgc3RydWN0IGh2bV9o
d19jcHUgKmN0eHQpCj4+ICB7Cj4+ICsgICAgaWYgKCB2ID09IGN1cnJlbnQgKQo+PiArICAgICAg
ICB2bXhfc2F2ZV9ndWVzdF9tc3JzKHYpOwo+IAo+IHZteF9zYXZlX2d1ZXN0X21zcnMoKSBpcyBz
aW1wbGUgZW5vdWdoIHRoYXQgdGhlIGlmIGlzIHByb2JhYmx5IG5vdAo+IG5lY2Vzc2FyeSBoZXJl
ICh3ZSBjYW4ganVzdCBjYWxsIHRoZSBmdW5jdGlvbiBkaXJlY3RseSwgcmVnYXJkbGVzcyBvZgo+
IHdoYXQgdiBob2xkcykuCgpBdm9pZGluZyBhbiBNU1IgYWNjZXNzIGlzIHBlcmhhcHMgd29ydGgg
dGhlIGNvbmRpdGlvbmFsLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
