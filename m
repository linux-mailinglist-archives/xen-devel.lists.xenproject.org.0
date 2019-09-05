Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C5BA9ABB
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 08:35:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5lIi-0005Bk-GD; Thu, 05 Sep 2019 06:31:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5lIg-0005Bf-Kl
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 06:31:22 +0000
X-Inumbo-ID: c45b9963-cfa6-11e9-abc0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c45b9963-cfa6-11e9-abc0-12813bfff9fa;
 Thu, 05 Sep 2019 06:31:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F31ECABCB;
 Thu,  5 Sep 2019 06:31:17 +0000 (UTC)
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <88c2b2a3-e4fc-144a-1ba8-4983dd99a957@suse.com>
 <7a7e01e1-f4b4-c689-d9a3-977f3dcb0c3c@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <141b84b6-f642-b285-1661-372794969819@suse.com>
Date: Thu, 5 Sep 2019 08:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a7e01e1-f4b4-c689-d9a3-977f3dcb0c3c@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 8/8] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDkuMjAxOSAwMToxNiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvMy8xOSA1
OjQyIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4KPj4gRm9yIFRTQyBJIHNlZSBsaXR0bGUgcG9p
bnQgaW4gbWFraW5nIHRoZSBpbnRlcmNlcHRzIGR5bmFtaWMsIGhlbmNlIHRoZXkKPj4gZ2V0IGVz
dGFibGlzaGVkIHJpZ2h0IHdoZW4gYSBWTUNCL1ZNQ1MgZ2V0cyBjcmVhdGVkLgo+IAo+IFdoeSBp
cyB0aGlzIG5vdCB0cmVhdGVkIGluIHRoZSBzYW1lIG1hbm5lciBhcyByZHRzYyBpbnRlcmNlcHRz
PwoKT2gsIGluZGVlZCAtIEknbGwgY2hhbmdlIHRoaXMuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
