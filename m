Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26696A2D40
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 05:23:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3XRA-00060r-96; Fri, 30 Aug 2019 03:18:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=D47i=W2=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1i3XR8-00060m-RG
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 03:18:54 +0000
X-Inumbo-ID: e448ee54-cad4-11e9-ae78-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e448ee54-cad4-11e9-ae78-12813bfff9fa;
 Fri, 30 Aug 2019 03:18:52 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 20:18:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,445,1559545200"; d="scan'208";a="181070269"
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.26])
 by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2019 20:18:50 -0700
Date: Fri, 30 Aug 2019 11:22:55 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190830032253.GA31905@gao-cwp>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-11-git-send-email-chao.gao@intel.com>
 <20190822135923.fmontcb7dofrok4c@Air-de-Roger>
 <ea7b2234-ec3f-1199-3077-a1a610883049@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea7b2234-ec3f-1199-3077-a1a610883049@suse.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [Xen-devel] [PATCH v9 10/15] microcode: split out
 apply_microcode() from cpu_request_microcode()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTI6MDY6MjhQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj5PbiAyMi4wOC4yMDE5IDE1OjU5LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPj4gU2Vl
aW5nIGhvdyB0aGlzIHdvcmtzIEknbSBub3Qgc3VyZSB3aGF0J3MgdGhlIGJlc3Qgb3B0aW9uIGhl
cmUuIEFzCj4+IHVwZGF0aW5nIHdpbGwgYmUgYXR0ZW1wdGVkIG9uIG90aGVyIENQVXMsIEknbSBu
b3Qgc3VyZSBpZiBpdCdzIE9LIHRvCj4+IHJldHVybiBhbiBlcnJvciBpZiB0aGUgdXBkYXRlIHN1
Y2NlZWQgb24gc29tZSBDUFVzIGJ1dCBmYWlsZWQgb24KPj4gb3RoZXJzLgo+Cj5UaGUgb3ZlcmFs
bCByZXN1bHQgb2YgYSBwYXJ0aWFsbHkgc3VjY2Vzc2Z1bCB1cGRhdGUgc2hvdWxkIGJlIGFuCj5l
cnJvciAtIG1pc21hdGNoZWQgdWNvZGUgbWF5LCBhZnRlciBhbGwsIGJlIG1vcmUgb2YgYSBwcm9i
bGVtCj50aGFuIG91dGRhdGVkIHVjb2RlLgoKV2lsbCBvbmx5IHRha2UgY2FyZSAtRUlPIGNhc2Uu
IElmIHN5c3RlbXMgaGF2ZSBkaWZmZXJpbmcgdWNvZGVzIG9uCmNvcmVzLCBwYXJ0aWFsbHkgdXBk
YXRlIGlzIGV4cGVjdGVkIHdoZW4gd2UgdHJ5IHRvIGNvcnJlY3QgdGhlIHN5c3RlbQp3aXRoIGFu
IHVjb2RlIGVxdWFsIHRvIHRoZSBuZXdlc3QgdWNvZGUgcmV2IGFscmVhZHkgb24gY29yZXMuCgpU
aGFua3MKQ2hhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
