Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD52BB390D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:07:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9onS-0005On-Dw; Mon, 16 Sep 2019 11:03:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GGTU=XL=amazon.de=prvs=1553567f6=wipawel@srs-us1.protection.inumbo.net>)
 id 1i9onQ-0005Od-UN
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:03:52 +0000
X-Inumbo-ID: a9d9737e-d871-11e9-b299-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9d9737e-d871-11e9-b299-bc764e2007e4;
 Mon, 16 Sep 2019 11:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568631831; x=1600167831;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=vo2Vq9VK9Dl+nu8WYi4IyFm4VzpFJv9g17nh4VfXXYo=;
 b=LIa/WzGbHd9FalYkmcRo+jYnRa2hCDgb22VFXyYxUDsTE+vfJfVQuLDq
 EpRn/CKKTNuf6jzA81ve9t0OHHqXhCw4qTI4mF1ldZrZTQAMq/YHHlJVS
 RWHj7oOlkrrUiTYOVRl+McWohvcg/bbvyAUj570JfOry5xBS8lqV8U5oa c=;
X-IronPort-AV: E=Sophos;i="5.64,512,1559520000"; d="scan'208";a="832619199"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Sep 2019 11:03:35 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 22C93A2486; Mon, 16 Sep 2019 11:03:31 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:30 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Sep 2019 11:03:29 +0000
Received: from dev-dsk-wipawel-1a-0c4e6d58.eu-west-1.amazon.com (10.4.134.33)
 by mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Mon, 16 Sep 2019 11:03:27 +0000
From: Pawel Wieczorkiewicz <wipawel@amazon.de>
To: <xen-devel@lists.xen.org>, <xen-devel@lists.xenproject.org>
Date: Mon, 16 Sep 2019 10:59:33 +0000
Message-ID: <20190916105945.93632-1-wipawel@amazon.de>
X-Mailer: git-send-email 2.16.5
MIME-Version: 1.0
Precedence: Bulk
Subject: [Xen-devel] [PATCH v3 00/12] livepatch: new features and fixes
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, wipawel@amazon.com,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, mpohlack@amazon.com,
 Tim Deegan <tim@xen.org>, Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBuZXcgZmVhdHVyZXMgdG8gdGhlIGxpdmVwYXRjaCBmdW5j
dGlvbmFsaXR5IGFzCmJyaWVmbHkgZGlzY3Vzc2VkIGR1cmluZyBYZW4gRGV2ZWxvcGVyIFN1bW1p
dCAyMDE5OiBbYV0gYW5kIFtiXS4KSXQgYWxzbyBwcm92aWRlcyBhIGZldyBmaXhlcyBhbmQgc29t
ZSBzbWFsbCBpbXByb3ZlbWVudHMuCgpNYWluIGNoYW5nZXMgaW4gdjM6Ci0gRml4IGV4cGVjdGF0
aW9uIHRlc3QgdG8gd29yayBvbiBBcm0KLSBBZGQgdGVzdCBmb3IgbWV0YWRhdGEgKEtvbnJhZCkK
LSBNaW5vciBmaXhlcyB0byBkb2N1bWVudGF0aW9uCgpNYWluIGNoYW5nZXMgaW4gdjI6Ci0gYWRk
ZWQgbmV3IGZlYXR1cmVzIHRvIGxpdmVwYXRjaCBkb2N1bWVudGF0aW9uCi0gYWRkZWQgbGl2ZXBh
dGNoIHRlc3RzCi0gZW5hYmxlZCBBcm0gc3VwcG9ydCBmb3IgWzVdCi0gbWFrZSAubW9kaW5mbyBv
cHRpb25hbCBmb3IgWzExXQotIGZpeGVkIHR5cG9zCgpGRUFUVVJFUzoKCjEuIGluZGVwZW5kZW50
IG1vZHVsZXMgKHBhdGNoZXM6IFsxXSwgWzJdKQoKICAqIGxpdmVwYXRjaC1idWlsZC10b29scyBy
ZXBvIGRlcGVuZGVuY3kgW0FdCgogIExpdmVwYXRjaCBlbmZvcmNlcyB0aGUgZm9sbG93aW5nIGJ1
aWxkaWQtYmFzZWQgZGVwZW5kZW5jeSBjaGFpbgogIGJldHdlZW4gaG90cGF0Y2ggbW9kdWxlczoK
ICAgIDEpIGZpcnN0IG1vZHVsZSBkZXBlbmRzIG9uIGdpdmVuIGh5cGVydmlzb3IgYnVpbGRpZAog
ICAgMikgZXZlcnkgY29uc2VjdXRpdmUgbW9kdWxlIGRlcGVuZHMgb24gcHJldmlvdXMgbW9kdWxl
J3MgYnVpbGRpZAogIFRoaXMgd2F5IHByb3BlciBob3RwYXRjaCBzdGFjayBvcmRlciBpcyBtYWlu
dGFpbmVkIGFuZCBlbmZvcmNlZC4KICBXaGlsZSBpdCBpcyBpbXBvcnRhbnQgZm9yIHByb2R1Y3Rp
b24gaG90cGF0Y2hlcyBpdCBsaW1pdHMgYWdpbGl0eSBhbmQKICBibG9ja3MgdXNhZ2Ugb2YgdGVz
dGluZyBvciBkZWJ1ZyBob3RwYXRjaGVzLiBUaGVzZSBraW5kcyBvZiBob3RwYXRjaAogIG1vZHVs
ZXMgYXJlIHR5cGljYWxseSBleHBlY3RlZCB0byBiZSBsb2FkZWQgYXQgYW55IHRpbWUgaXJyZXNw
ZWN0aXZlCiAgb2YgY3VycmVudCBzdGF0ZSBvZiB0aGUgbW9kdWxlcyBzdGFjay4KCiAgW0FdIGxp
dmVwYXRjaC1idWlsZDogRW1iZWQgaHlwZXJ2aXNvciBidWlsZCBpZCBpbnRvIGV2ZXJ5IGhvdHBh
dGNoCgoyLiBwcmUtIGFuZCBwb3N0LSBhcHBseXxyZXZlcnQgYWN0aW9ucyBob29rcyAocGF0Y2hl
czogWzNdLCBbNF0pCgogICogbGl2ZXBhdGNoLWJ1aWxkLXRvb2xzIHJlcG8gZGVwZW5kZW5jeSBb
Ql0KCiAgVGhpcyBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiA0IG5ldyBsaXZlcGF0Y2ggbW9kdWxl
IHZldG9pbmcgaG9va3MsCiAgdGhhdCBjYW4gYmUgb3B0aW9uYWxseSBzdXBwbGllZCBhbG9uZyB3
aXRoIG1vZHVsZXMuCiAgSG9va3MgdGhhdCBjdXJyZW50bHkgZXhpc3RzIGluIHRoZSBsaXZlcGF0
Y2ggbWVjaGFuaXNtIGFyZW4ndCBhZ2lsZQogIGVub3VnaCBhbmQgaGF2ZSB2YXJpb3VzIGxpbWl0
YXRpb25zOgogICogcnVuIG9ubHkgZnJvbSB3aXRoaW4gYSBxdWllc2Npbmcgem9uZQogICogY2Fu
bm90IGNvbmRpdGlvbmFsbHkgcHJldmVudCBhcHBseWluZyBvciByZXZlcnRpbmcKICAqIGRvIG5v
dCBoYXZlIGFjY2VzcyB0byB0aGUgbW9kdWxlIGNvbnRleHQKICBUbyBhZGRyZXNzIHRoZXNlIGxp
bWl0YXRpb25zIHRoZSBmb2xsb3dpbmcgaGFzIGJlZW4gaW1wbGVtZW50ZWQ6CiAgMSkgcHJlLWFw
cGx5IGhvb2sKICAyKSBwb3N0LWFwcGx5IGhvb2sKICAzKSBwcmUtcmV2ZXJ0IGhvb2sKICA0KSBw
b3N0LXJldmVydCBob29rCgogIFtCXSBjcmVhdGUtZGlmZi1vYmplY3Q6IEhhbmRsZSBleHRyYSBw
cmUtfHBvc3QtIGhvb2tzCgozLiBhcHBseXxyZXZlcnQgYWN0aW9ucyByZXBsYWNlbWVudCBob29r
cyAocGF0Y2hlczogWzVdLCBbNl0sIFs3XSkKCiAgKiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgcmVw
byBkZXBlbmRlbmN5OiBbQ10sIFtEXSwgW0VdCgogIFRvIGluY3JlYXNlIGhvdHBhdGNoaW5nIHN5
c3RlbSdzIGFnaWxpdHkgYW5kIHByb3ZpZGUgbW9yZSBmbGV4aWFibGUKICBsb25nLXRlcm0gaG90
cGF0Y2ggc29sdXRpb24sIGFsbG93IHRvIG92ZXJ3cml0ZSB0aGUgZGVmYXVsdCBhcHBseQogIGFu
ZCByZXZlcnQgYWN0aW9uIGZ1bmN0aW9ucyB3aXRoIGhvb2stbGlrZSBzdXBwbGllZCBhbHRlcm5h
dGl2ZXMuCiAgVGhlIGFsdGVybmF0aXZlIGZ1bmN0aW9ucyBhcmUgb3B0aW9uYWwgYW5kIHRoZSBk
ZWZhdWx0IGZ1bmN0aW9ucyBhcmUKICB1c2VkIGJ5IGRlZmF1bHQuCgogIFtDXSBjcmVhdGUtZGlm
Zi1vYmplY3Q6IERvIG5vdCBjcmVhdGUgZW1wdHkgLmxpdmVwYXRjaC5mdW5jcyBzZWN0aW9uCiAg
W0RdIGNyZWF0ZS1kaWZmLW9iamVjdDogSGFuZGxlIG9wdGlvbmFsIGFwcGx5fHJldmVydCBob29r
cwogIFtFXSBjcmVhdGUtZGlmZi1vYmplY3Q6IEFkZCBzdXBwb3J0IGZvciBhcHBsaWVkL3JldmVy
dGVkIG1hcmtlcgoKNC4gaW5saW5lIGFzbSBob3RwYXRjaGluZyBleHBlY3RhdGlvbnMgKHBhdGNo
ZXM6IFs4XSkKCiAgKiBsaXZlcGF0Y2gtYnVpbGQtdG9vbHMgcmVwbyBkZXBlbmRlbmN5OiBbRl0K
CiAgRXhwZWN0YXRpb25zIGFyZSBkZXNpZ25lZCBhcyBvcHRpb25hbCBmZWF0dXJlLCBzaW5jZSB0
aGUgbWFpbiB1c2Ugb2YKICB0aGVtIGlzIHBsYW5uZWQgZm9yIGlubGluZSBhc20gaG90cGF0Y2hp
bmcuCiAgVGhlIHBheWxvYWQgc3RydWN0dXJlIGlzIG1vZGlmaWVkIGFzIGVhY2ggZXhwZWN0YXRp
b24gc3RydWN0dXJlIGlzCiAgcGFydCBvZiB0aGUgbGl2ZXBhdGNoX2Z1bmMgc3RydWN0dXJlIGFu
ZCBoZW5jZSBleHRlbmRzIHRoZSBwYXlsb2FkLgogIFRoZSBwYXlsb2FkIHZlcnNpb24gaXMgYnVt
cGVkIHRvIDMgd2l0aCB0aGlzIGNoYW5nZSB0byBoaWdobGlnaHQgdGhlCiAgQUJJIG1vZGlmaWNh
dGlvbiBhbmQgZW5mb3JjZSBwcm9wZXIgc3VwcG9ydC4KICBUaGUgZXhwZWN0YXRpb24gaXMgbWFu
dWFsbHkgZW5hYmxlZCBkdXJpbmcgaW5saW5lIGFzbSBtb2R1bGUKICBjb25zdHJ1Y3Rpb24uIElm
IGVuYWJsZWQsIGV4cGVjdGF0aW9uIGVuc3VyZXMgdGhhdCB0aGUgZXhwZWN0ZWQKICBjb250ZW50
IG9mIG1lbW9yeSBpcyB0byBiZSBmb3VuZCBhdCBhIGdpdmVuIHBhdGNoaW5nIChvbGRfYWRkcikK
ICBsb2NhdGlvbi4KCiAgW0ZdIGNyZWF0ZS1kaWZmLW9iamVjdDogQWRkIHN1cHBvcnQgZm9yIGV4
cGVjdGF0aW9ucwoKNS4gcnVudGltZSBob3RwYXRjaCBtZXRhZGF0YSBzdXBwb3J0IChwYXRjaGVz
OiBbOV0sIFsxMF0sIFsxMV0pCgogIEhhdmluZyBkZXRhaWxlZCBob3RwYXRjaCBtZXRhZGF0YSBo
ZWxwcyB0byBwcm9wZXJseSBpZGVudGlmeSBtb2R1bGUncwogIG9yaWdpbiBhbmQgdmVyc2lvbi4g
SXQgYWxzbyBhbGxvd3MgdG8ga2VlcCB0cmFjayBvZiB0aGUgaGlzdG9yeSBvZgogIGhvdHBhdGNo
IGxvYWRzIGluIHRoZSBzeXN0ZW0gKGF0IGxlYXN0IHdpdGhpbiBkbWVzZyBidWZmZXIgc2l6ZQog
IGxpbWl0cykuCiAgRXh0ZW5kIHRoZSBsaXZlcGF0Y2ggbGlzdCBvcGVyYXRpb24gdG8gZmV0Y2gg
YWxzbyBwYXlsb2FkcycgbWV0YWRhdGEuCiAgVGhpcyBpcyBhY2hpZXZlZCBieSBleHRlbmRpbmcg
dGhlIHN5c2N0bCBsaXN0IGludGVyZmFjZSB3aXRoIDIgZXh0cmEKICBndWVzdCBoYW5kbGVzOgog
ICogbWV0YWRhdGEgICAgIC0gYW4gYXJyYXkgb2YgYXJiaXRyYXJ5IHNpemUgc3RyaW5ncwogICog
bWV0YWRhdGFfbGVuIC0gYW4gYXJyYXkgb2YgbWV0YWRhdGEgc3RyaW5ncycgbGVuZ3RocyAodWlu
MzJfdCBlYWNoKQogIFRvIHVuaWZ5IGFuZCBzaW1wbGlmeSB0aGUgaW50ZXJmYWNlLCBoYW5kbGUg
dGhlIG1vZHVsZXMnIG5hbWUgc3RyaW5ncwogIG9mIGFyYml0cmFyeSBzaXplIGJ5IGNvcHlpbmcg
dGhlbSBpbiBhZGhlcmluZyBjaHVua3MgdG8gdGhlIHVzZXJsYW5kLgoKNi4gcHl0aG9uIGJpbmRp
bmdzIGZvciBsaXZlcGF0Y2ggb3BlcmF0aW9ucyAocGF0Y2hlczogWzEyXSkKCiAgRXh0ZW5kIHRo
ZSBYQyBweXRob24gYmluZGluZ3MgbGlicmFyeSB0byBzdXBwb3J0IGFsbCBjb21tb24gbGl2ZXBh
dGNoCiAgb3BlcmF0aW9ucyBhbmQgYWN0aW9uczoKICAtIHN0YXR1cyAocHl4Y19saXZlcGF0Y2hf
c3RhdHVzKToKICAtIGFjdGlvbiAocHl4Y19saXZlcGF0Y2hfYWN0aW9uKToKICAtIHVwbG9hZCAo
cHl4Y19saXZlcGF0Y2hfdXBsb2FkKToKICAtIGxpc3QgKHB5eGNfbGl2ZXBhdGNoX2xpc3QpOgoK
W2FdIGh0dHBzOi8vd2lraS54ZW5wcm9qZWN0Lm9yZy93aWtpL0Rlc2lnbl9TZXNzaW9uc18yMDE5
I0xpdmVQYXRjaF9pbXByb3ZlbWVudHNfYW5kX2ZlYXR1cmVzCltiXSBodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcvbXNnMDA4NDYuaHRt
bAoKTWVyZ2VkIGluIHYxOgogIHB5dGhvbjogQWRkIFhDIGJpbmRpbmcgZm9yIFhlbiBidWlsZCBJ
RAogIGxpdmVwYXRjaDogYWx3YXlzIHByaW50IFhFTkxPR19FUlIgaW5mb3JtYXRpb24KClBhd2Vs
IFdpZWN6b3JraWV3aWN6ICgxMik6CiAgWzFdIGxpdmVwYXRjaDogQWx3YXlzIGNoZWNrIGh5cGVy
dmlzb3IgYnVpbGQgSUQgdXBvbiBob3RwYXRjaCB1cGxvYWQKICBbMl0gbGl2ZXBhdGNoOiBBbGxv
dyB0byBvdmVycmlkZSBpbnRlci1tb2R1bGVzIGJ1aWxkaWQgZGVwZW5kZW5jeQogIFszXSBsaXZl
cGF0Y2g6IEV4cG9ydCBwYXlsb2FkIHN0cnVjdHVyZSB2aWEgbGl2ZXBhdGNoX3BheWxvYWQuaAog
IFs0XSBsaXZlcGF0Y2g6IEltcGxlbWVudCBwcmUtfHBvc3QtIGFwcGx5fHJldmVydCBob29rcwog
IFs1XSBsaXZlcGF0Y2g6IEFkZCBzdXBwb3J0IGZvciBhcHBseXxyZXZlcnQgYWN0aW9uIHJlcGxh
Y2VtZW50IGhvb2tzCiAgWzZdIGxpdmVwYXRjaDogRG8gbm90IGVuZm9yY2UgRUxGX0xJVkVQQVRD
SF9GVU5DIHNlY3Rpb24gcHJlc2VuY2UKICBbN10gbGl2ZXBhdGNoOiBBZGQgcGVyLWZ1bmN0aW9u
IGFwcGxpZWQvcmV2ZXJ0ZWQgc3RhdGUgdHJhY2tpbmcgbWFya2VyCiAgWzhdIGxpdmVwYXRjaDog
QWRkIHN1cHBvcnQgZm9yIGlubGluZSBhc20gaG90cGF0Y2hpbmcgZXhwZWN0YXRpb25zCiAgWzld
IGxpdmVwYXRjaDogQWRkIHN1cHBvcnQgZm9yIG1vZHVsZXMgLm1vZGluZm8gc2VjdGlvbiBtZXRh
ZGF0YQogIFsxMF0gbGl2ZXBhdGNoOiBIYW5kbGUgYXJiaXRyYXJ5IHNpemUgbmFtZXMgd2l0aCB0
aGUgbGlzdCBvcGVyYXRpb24KICBbMTFdIGxpdmVwYXRjaDogQWRkIG1ldGFkYXRhIHJ1bnRpbWUg
cmV0cmlldmFsIG1lY2hhbmlzbQogIFsxMl0gbGl2ZXBhdGNoOiBBZGQgcHl0aG9uIGJpbmRpbmdz
IGZvciBsaXZlcGF0Y2ggb3BlcmF0aW9ucwoKIC5naXRpZ25vcmUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDYgKy0KIGRvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jICAg
ICAgICAgICAgICAgICAgICAgfCAyNDAgKysrKysrKystCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hl
bmN0cmwuaCAgICAgICAgICAgICAgICAgIHwgIDY4ICsrLQogdG9vbHMvbGlieGMveGNfbWlzYy5j
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2MiArKysrLS0KIHRvb2xzL21pc2MveGVuLWxp
dmVwYXRjaC5jICAgICAgICAgICAgICAgICAgICAgfCAyNTggKysrKysrKy0tLQogdG9vbHMvcHl0
aG9uL3hlbi9sb3dsZXZlbC94Yy94Yy5jICAgICAgICAgICAgICB8IDI3MyArKysrKysrKysrKwog
eGVuL2FyY2gvYXJtL2FybTMyL2xpdmVwYXRjaC5jICAgICAgICAgICAgICAgICB8ICAxMiArLQog
eGVuL2FyY2gvYXJtL2FybTY0L2xpdmVwYXRjaC5jICAgICAgICAgICAgICAgICB8ICAxMiArLQog
eGVuL2FyY2gvYXJtL2xpdmVwYXRjaC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMCArLQog
eGVuL2FyY2gveDg2L2xpdmVwYXRjaC5jICAgICAgICAgICAgICAgICAgICAgICB8ICAyMiArLQog
eGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDY1MCArKysr
KysrKysrKysrKysrKysrKystLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICAgICAg
ICAgICAgICAgICAgIHwgIDYyICsrLQogeGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oICAgICAg
ICAgICAgICAgICAgICB8ICA0MiArLQogeGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaF9wYXlsb2Fk
LmggICAgICAgICAgICB8ICA4MyArKysrCiB4ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgICAgIHwgMTIxICsrKystCiB4ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2FjdGlv
bl9ob29rcy5jICAgICAgICAgIHwgMTAyICsrKysKIHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5fYWN0
aW9uX2hvb2tzX21hcmtlci5jICAgfCAxMTIgKysrKysKIHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5f
YWN0aW9uX2hvb2tzX25vYXBwbHkuYyAgfCAxMzYgKysrKysrCiB4ZW4vdGVzdC9saXZlcGF0Y2gv
eGVuX2FjdGlvbl9ob29rc19ub2Z1bmMuYyAgIHwgIDg2ICsrKysKIHhlbi90ZXN0L2xpdmVwYXRj
aC94ZW5fYWN0aW9uX2hvb2tzX25vcmV2ZXJ0LmMgfCAxNDMgKysrKysrCiB4ZW4vdGVzdC9saXZl
cGF0Y2gveGVuX2V4cGVjdGF0aW9ucy5jICAgICAgICAgIHwgIDQxICsrCiB4ZW4vdGVzdC9saXZl
cGF0Y2gveGVuX2V4cGVjdGF0aW9uc19mYWlsLmMgICAgIHwgIDQyICsrCiB4ZW4vdGVzdC9saXZl
cGF0Y2gveGVuX3ByZXBvc3RfaG9va3MuYyAgICAgICAgIHwgMTIyICsrKysrCiB4ZW4vdGVzdC9s
aXZlcGF0Y2gveGVuX3ByZXBvc3RfaG9va3NfZmFpbC5jICAgIHwgIDc1ICsrKwogMjQgZmlsZXMg
Y2hhbmdlZCwgMjU5NyBpbnNlcnRpb25zKCspLCAyODMgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgeGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9hY3Rpb25faG9va3MuYwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi90ZXN0L2xpdmVwYXRjaC94ZW5fYWN0aW9uX2hvb2tzX21hcmtlci5jCiBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9hY3Rpb25faG9va3Nfbm9h
cHBseS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9hY3Rpb25f
aG9va3Nfbm9mdW5jLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vdGVzdC9saXZlcGF0Y2gveGVu
X2FjdGlvbl9ob29rc19ub3JldmVydC5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rlc3QvbGl2
ZXBhdGNoL3hlbl9leHBlY3RhdGlvbnMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi90ZXN0L2xp
dmVwYXRjaC94ZW5fZXhwZWN0YXRpb25zX2ZhaWwuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi90
ZXN0L2xpdmVwYXRjaC94ZW5fcHJlcG9zdF9ob29rcy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVu
L3Rlc3QvbGl2ZXBhdGNoL3hlbl9wcmVwb3N0X2hvb2tzX2ZhaWwuYwoKLS0gCjIuMTYuNQoKCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAx
MTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBI
ZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBI
UkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
