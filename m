Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42391BEFCD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:39:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDR8q-0000dq-9C; Thu, 26 Sep 2019 10:36:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ph5t=XV=amazon.com=prvs=165c3e20f=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDR8o-0000dg-PM
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:36:54 +0000
X-Inumbo-ID: 8e2d3202-e049-11e9-964e-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id 8e2d3202-e049-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569494214; x=1601030214;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=edXyeiu+h0kVZmB80Hzl0MBYmTQV35uSrh5MmNFJVSQ=;
 b=G8fuPTrhoiS8p8S2Wf8KHFJjS1d0mAf+ki8G5OOzs5fvgSqW5xzKugZQ
 L8rAeoE7stqHzm0NqUiDYPFb85UI1mnCzzSodhzlD+qlgDtge6yGQR4U5
 9tQ5Ly34Lbd8/PpT3yQWFalNUOLKnoX1Bc7y8m6IeomDLszNpOEGVtRxY c=;
X-IronPort-AV: E=Sophos;i="5.64,551,1559520000"; d="scan'208";a="836999052"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-69849ee2.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Sep 2019 10:34:05 +0000
Received: from EX13MTAUWA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-69849ee2.us-west-2.amazon.com (Postfix) with ESMTPS
 id 77402A299A; Thu, 26 Sep 2019 10:33:51 +0000 (UTC)
Received: from EX13D29UWA001.ant.amazon.com (10.43.160.187) by
 EX13MTAUWA001.ant.amazon.com (10.43.160.58) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:33:51 +0000
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D29UWA001.ant.amazon.com (10.43.160.187) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 26 Sep 2019 10:33:50 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.58) by
 mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Thu, 26 Sep 2019 10:33:49 +0000
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <913e6e6b-189c-d318-7b73-4258d53c80f1@arm.com>
From: <hongyax@amazon.com>
Message-ID: <2e462fff-ddd6-cc72-b8a8-b825d707e96b@amazon.com>
Date: Thu, 26 Sep 2019 11:33:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <913e6e6b-189c-d318-7b73-4258d53c80f1@arm.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 00/84] Remove direct map from Xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxMToyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IFRoYW5r
IHlvdSBmb3IgcG9zdGluZyB0aGUgc2VyaWVzLgo+IAo+IE9uIDkvMjYvMTkgMTA6NDUgQU0sIGhv
bmd5YXhAYW1hem9uLmNvbSB3cm90ZToKPj4gRnJvbTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1h
em9uLmNvbT4KPj4KPj4gUHJldmlvdXNseSwgV2VpIExpdSBoYXMgY3JlYXRlZCB0aGUgcGF0Y2gg
c2VyaWVzIHRvIHN3aXRjaCB0bwo+PiBhbGxvYy9tYXAvdW5tYXAvZnJlZSBBUElzIGZvciBYZW4g
cGFnZSB0YWJsZXMgc28gdGhhdCBYZW4gcGFnZSB0YWJsZXMKPj4gYXJlIG1hcHBlZCB3aXRoIG1h
cF9kb21haW5fcGFnZSgpLiBUaGlzIGlzIHRoZSBmaXJzdCBzdGVwIHRvd2FyZHMKPj4gcmVtb3Zp
bmcgdGhlIGRpcmVjdCBtYXAuIEkgaW1wbGVtZW50ZWQgcGF0Y2hlcyBvbiB0b3Agb2YgV2VpJ3Mg
dG8gcmVtb3ZlCj4+IHRoZSBkaXJlY3QgbWFwIGNvbXBsZXRlbHkuCj4+Cj4+IEluIGFkZGl0aW9u
IHRvIFdlaSdzLCBteSBwYXRjaGVzOgo+PiAtIChXZWkpIGltcGxlbWVudCBhIHByb3BlciBQTUFQ
IGluZnJhc3RydWN0dXJlIGZvciBib290c3RyYXBwaW5nCj4+IC0gcmVtb3ZlIGRpcmVjdCBtYXAg
Y29kZSBpbiBtYXBfZG9tYWluX3BhZ2UoKSBhbmQgdXNlIG1hcGNhY2hlLCB1c2UgUE1BUAo+PiDC
oCB3aGVuIG1hcGNhY2hlIG5vdCByZWFkeQo+PiAtIG1hcC91bm1hcCB4ZW5oZWFwIGFsbG9jYXRp
b25zIHRvIHRoZSBkaXJlY3QgbWFwIHJlZ2lvbiBzbyB0aGF0IHZhPC0+cGEKPj4gwqAgbWFjcm9z
IHN0aWxsIHdvcmsKPj4gLSBpbnN0YWxsIGR1bW15IG1hcHBpbmdzIChubyBwZXJtaXNzaW9ucywg
SU5WQUxJRF9NRk4pIGluc3RlYWQgb2YgYWN0dWFsCj4+IMKgIDE6MSBtYXBwaW5ncyBkdXJpbmcg
Ym9vdCwgc28gdGhlIGRpcmVjdCBtYXAgbm8gbG9uZ2VyIGV4aXN0cwo+PiAtIGZpeCBtYW55IHBs
YWNlcyB3aGVyZSBjb2RlIGluY29ycmVjdGx5IGFzc3VtZXMgYSBkaXJlY3QgbWFwCj4gCj4gSSBh
bSBhIGJpdCBjb25mdXNlZC4gQXJlIHlvdXIgcGF0Y2hlcyBmaXhpbmcgYnVnIGZyb20gV2VpJ3Mg
c2VyaWVzPwo+IAoKVGhlIGdvYWwgaXMgdG8gcmVtb3ZlIHRoZSBkaXJlY3QgbWFwIGNvbXBsZXRl
bHkgZnJvbSBYZW4uIFdlaSdzIHNlcmllcyBoYXMgZG9uZSAKdGhlIGZpcnN0IHN0ZXAgYnV0IHdh
cyBub3QgY29tcGxldGUuIE15IGFkZGl0aW9uYWwgcGF0Y2hlcyBmaW5pc2hlZCB0aGUgCnJlbWFp
bmluZyBzdGVwcyBhbmQgcmVtb3ZlZCB0aGUgZGlyZWN0IG1hcC4KCj4+Cj4+IEkgaGF2ZSBtb2Rl
cmF0ZWx5IHRlc3RlZCB0aGUgcGF0Y2hlcy4gSSBhbSBhYmxlIHRvIGJvb3QgaW50byBkb20wLAo+
PiBjcmVhdGUvZGVzdHJveSBQVi9IVk0gZ3Vlc3RzIGFuZCBydW4gWFRGIHRlc3RzLiBQZXJzb25h
bGx5LCBJIGZpbmQgaXQKPj4gZGlmZmljdWx0IHRvIGRpc2NvdmVyIGFsbCBwbGFjZXMgd2hlcmUg
aXQgaW5jb3JyZWN0bHkgYXNzdW1lcyBhIGRpcmVjdAo+PiBtYXAsIHNvIHJldmlld3MgYW5kIGZ1
cnRoZXIgdGVzdGluZyBhcmUgbW9yZSB0aGFuIHdlbGNvbWUuCj4gCj4gRG8geW91IGhhdmUgYSBi
cmFuY2ggd2l0aCB0aGlzIHNlcmllcyBhcHBsaWVkPwo+IAoKSSBhbSBzZXR0aW5nIHRoaXMgdXAu
IFdpbGwgc2VuZCBvdXQgdGhlIGxpbmsgdG8gdGhlIGJyYW5jaCBzb29uLgoKPiBDaGVlcnMsCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
