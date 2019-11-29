Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4439E10D71F
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:38:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahMv-0002sb-ES; Fri, 29 Nov 2019 14:35:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iahMu-0002sP-7E
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:35:36 +0000
X-Inumbo-ID: 7f8d4a36-12b5-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f8d4a36-12b5-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 14:35:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6113EB2B9;
 Fri, 29 Nov 2019 14:35:32 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-9-liuwe@microsoft.com>
 <47a58e93b7dd42878d41c03da66d9a1e@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a438ee3-1470-7d0a-cf46-8cbca0a6d825@suse.com>
Date: Fri, 29 Nov 2019 15:35:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <47a58e93b7dd42878d41c03da66d9a1e@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 8/8] x86: introduce CONFIG_HYPERV and
 detection code
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "Durrant, Paul" <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMjAxOSAxMjoxMSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxp
c3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgV2VpCj4+IExpdQo+PiBTZW50OiAyMSBO
b3ZlbWJlciAyMDE5IDE5OjUxCj4+IFRvOiBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnPgo+PiBDYzogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT47IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVyCj4+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBK
YW4KPj4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHY0IDgvOF0g
eDg2OiBpbnRyb2R1Y2UgQ09ORklHX0hZUEVSViBhbmQKPj4gZGV0ZWN0aW9uIGNvZGUKPj4KPj4g
V2UgdXNlIHRoZSBzYW1lIGNvZGUgc3RydWN0dXJlIGFzIHdlIGRpZCBmb3IgWGVuLgo+Pgo+PiBB
cyBzdGFydGVycywgZGV0ZWN0IEh5cGVyLVYgaW4gcHJvYmUgcm91dGluZS4gTW9yZSBjb21wbGV4
Cj4+IGZ1bmN0aW9uYWxpdGllcyB3aWxsIGJlIGFkZGVkIGxhdGVyLgo+Pgo+PiBUYWtlIHRoZSBj
aGFuY2UgdG8gZml4IFhFTl9HVUVTVCBpbiBLY29uZmlnLgo+IAo+IFdvdWxkIHRoaXMgZml4IGJl
IGJldHRlciBpbiB5b3VyIGVhcmxpZXIgcmVuYW1pbmcgcGF0Y2g/Cj4gCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gCj4gRWl0aGVyIHdheS4uLgo+
IAo+IFJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgooZWl0aGVyIHdheSwgYXMgUGF1
bCBzYXlzKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
