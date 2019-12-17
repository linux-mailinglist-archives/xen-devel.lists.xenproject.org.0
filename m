Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 863BA123A29
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 23:44:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihLX6-00012i-Cn; Tue, 17 Dec 2019 22:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tzig=2H=amazon.com=prvs=24792fcd9=elnikety@srs-us1.protection.inumbo.net>)
 id 1ihLX4-00012d-VU
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 22:41:35 +0000
X-Inumbo-ID: 60ca2ef8-211e-11ea-88e7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60ca2ef8-211e-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 22:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576622494; x=1608158494;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EZ6ruQWmVuhRlDyNi9VuuNMZEt2s8Fuy6Ac1LL1mUXE=;
 b=Rj21FsVoFPr/BSO9xayI5cb9FCm0uz3JWey8OAxyT/ELqUgejjUMS4j2
 54OzAQd0uZ/W+bQZ40kWfeX5XsfYiuwgviYS84VPoX0LImsdcK8zvCUcM
 +CuuumA7iien4L+SYU4i/Wt4wDVAp7Zah40V+5fGB1TlwSxBHJtZpQDnz A=;
IronPort-SDR: 0S3P/JL/oPQn+wIbhM9zU5lKAayES6/KOBcLBBgbDjwgyeeeFt6W16Cr6lh+8/enXqtknQja+r
 h5YOcOah/TbA==
X-IronPort-AV: E=Sophos;i="5.69,327,1571702400"; 
   d="scan'208";a="9011932"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 17 Dec 2019 22:41:32 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-8cc5d68b.us-west-2.amazon.com (Postfix) with ESMTPS
 id C2082A2396; Tue, 17 Dec 2019 22:41:31 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 17 Dec 2019 22:41:31 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.109) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 17 Dec 2019 22:41:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20191209084119.87563-1-elnikety@amazon.com>
 <180013ce-7b18-335a-f04b-1db0d4f2adf4@citrix.com>
 <eca670cd-7f8c-a662-320a-43981ba60c9a@amazon.com>
 <5bdb27b7-f827-23bd-a1dd-a0cec039ce54@suse.com>
 <e25e1ae4-d5b1-7ce8-348f-f2d1809d0635@amazon.com>
 <eb8beed3-3b9e-25f9-94bf-c6fe56a397f5@suse.com>
 <ff5b0699-5010-fabc-f7fd-2d40f8c56644@amazon.com>
 <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <56d6a14e-e7fa-2f74-c2cc-7aa33a261dd9@amazon.com>
Date: Tue, 17 Dec 2019 23:41:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2d23e5e7-fe5d-3446-57e5-6559cd8e7258@citrix.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.109]
X-ClientProxiedBy: EX13D16UWB001.ant.amazon.com (10.43.161.17) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] x86/microcode: Support builtin CPU microcode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTQ6NTcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMTIvMTIvMjAxOSAy
MjoxMywgRXNsYW0gRWxuaWtldHkgd3JvdGU6Cj4+Pj4gU2Vjb25kLCB0aGVyZSBpcyBvZnRlbiBu
ZWVkIHRvIGNvdXBsZSBhIFhlbiBidWlsZCB3aXRoIGEgbWluaW11bQo+Pj4+IG1pY3JvY29kZSBw
YXRjaCBsZXZlbC4gSGF2aW5nIHRoZSBtaWNyb2NvZGUgYnVpbHQgd2l0aGluIHRoZSBYZW4gaW1h
Z2UKPj4+PiBpdHNlbGYgaXMgYSBzdHJlYW1saW5lZCwgbmF0dXJhbCB3YXkgb2YgYWNoaWV2aW5n
IHRoYXQuCj4+Pgo+Pj4gT2theSwgSSBjYW4gYWNjZXB0IHRoaXMgYXMgYSByZWFzb24sIHRvIHNv
bWUgZGVncmVlIGF0IGxlYXN0LiBZZXQKPj4+IGFzIHNhaWQgZWxzZXdoZXJlLCBJIGRvbid0IHRo
aW5rIHlvdSB3YW50IHRoZW4gdG8gb3ZlcnJpZGUgYQo+Pj4gcG9zc2libGUgImV4dGVybmFsIiB1
Y29kZSBtb2R1bGUgd2l0aCB0aGUgYnVpbHRpbiBibG9icy4gSW5zdGVhZAo+Pj4gdGhlIG5ld2Vz
dCBvZiBldmVyeXRoaW5nIHRoYXQncyBhdmFpbGFibGUgc2hvdWxkIHRoZW4gYmUgbG9hZGVkLgo+
Pgo+PiBFeHRlbmRpbmcgWGVuIHRvIHdvcmsgYXJvdW5kIHRvb2xzIHNob3J0Y29taW5ncyBpcyBh
YnNvbHV0ZWx5IG5vdCB3aGF0Cj4+IEkgaGF2ZSBpbiBtaW5kLiBJIHNob3VsZCBoYXZlIHN0YXJ0
ZWQgd2l0aCB0aGUgc2Vjb25kIHJlYXNvbi4gUmVhZAo+PiB0aGlzIGFzOiBYZW4gcmVsaWVzIG9u
IGEgbWluaW11bSBtaWNyb2NvZGUgZmVhdHVyZSBzZXQsIGFuZCBpdCBtYWtlcwo+PiBzZW5zZSB0
byBjb3VwbGUgYm90aCBpbiBvbmUgYmluYXJ5LiBUaGlzIGNvdXBsaW5nIGp1c3QgaGFwcGVucyB0
bwo+PiBwcm92aWRlIGFuIGFkZGVkIGJlbmVmaXQgaW4gdGhlIGZhY2Ugb2YgdG9vbHMgc2hvcnRj
b21pbmcuCj4gCj4gRG8gd2UgaGF2ZSBhbnl0aGluZyB3aGljaCBzdHJpY3RseSByZWxpZXMgb24g
YSBtaW5pbXVtIHZlcnNpb24/CgpJIGhhZCBpbiBtaW5kIG1pY3JvY29kZSBzcGVjdWxhdGlvbiBt
aXRpZ2F0aW9uIGZlYXR1cmVzIHdoZW4gcmVhc29uaW5nIAp3aXRoIHRoZSBtaW5pbXVtIHBhdGNo
IGxldmVsIGFyZ3VtZW50LgoKLS0gRXNsYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
