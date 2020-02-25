Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B716BBD8
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 09:30:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6VY8-0006Re-PJ; Tue, 25 Feb 2020 08:26:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoxS=4N=amazon.co.uk=prvs=317b3ba57=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j6VY7-0006RZ-1G
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 08:26:39 +0000
X-Inumbo-ID: 899a31dc-57a8-11ea-92aa-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 899a31dc-57a8-11ea-92aa-12813bfff9fa;
 Tue, 25 Feb 2020 08:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582619197; x=1614155197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NAl0ecq/tA8qtIXa3ttZJujROtZx4FDnkUe/cDc9u5w=;
 b=FLaRWQwonZGE5n1Hpq90TbIne/0Na9/5lu0lbWA94we0jKykxHdjA5N/
 4GtDM22I3ObEZKrztZRXtSxMy7TMg5o42DqKRh4NBjqtSCekMLxyasd30
 IlcLXq0HJ6BK+NaBntVz2w28BEAy1m2lLrq3n3Ka+P2h4yxMFLQ3ku2YT E=;
IronPort-SDR: gPA1rJKMMZeWlSi6wAMw7Mn+l8MU298btC0EIx6H8v39mgBcqMsx47RxdeD10IZjQRNDapJSc/
 uOgr8fhVNKRw==
X-IronPort-AV: E=Sophos;i="5.70,483,1574121600"; d="scan'208";a="27295784"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 25 Feb 2020 08:26:34 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 6D43EA249B; Tue, 25 Feb 2020 08:26:30 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 25 Feb 2020 08:26:29 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 25 Feb 2020 08:26:28 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 25 Feb 2020 08:26:28 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v7 0/6] xl/libxl: domid allocation/preservation changes
Thread-Index: AQHV6Kj8cIQs0OK9UUyKbbfvg2lzPagqg/iAgAAKiXCAAA0A0IAACrIAgADy90A=
Date: Tue, 25 Feb 2020 08:26:28 +0000
Message-ID: <2e238b6813b74a8da10a4888347f18d1@EX13D32EUC003.ant.amazon.com>
References: <20200221112049.3077-1-pdurrant@amazon.com>
 <24147.61855.619335.745427@mariner.uk.xensource.com>
 <dd6cfb5f1770450abf7362ff1872f2b8@EX13D32EUC003.ant.amazon.com>
 <3acd774a777948c6965f9ef94505aadc@EX13D32EUC003.ant.amazon.com>
 <24148.3670.685800.220403@mariner.uk.xensource.com>
In-Reply-To: <24148.3670.685800.220403@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.246]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v7 0/6] xl/libxl: domid
 allocation/preservation changes
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>,
 George Dunlap <George.Dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI0IEZlYnJ1YXJ5IDIwMjAgMTc6NTcKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwKPiA8anVsaWVuQHhlbi5v
cmc+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFzb24gQW5kcnl1awo+IDxqYW5kcnl1a0BnbWFp
bC5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgS29ucmFk
Cj4gUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBHZW9yZ2UgRHVubGFw
Cj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT47IEFudGhvbnkKPiBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+OyB4ZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBTdWJqZWN0OiBSRTogW1BBVENIIHY3IDAvNl0g
eGwvbGlieGw6IGRvbWlkIGFsbG9jYXRpb24vcHJlc2VydmF0aW9uCj4gY2hhbmdlcwo+IAo+IER1
cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtQQVRDSCB2NyAwLzZdIHhsL2xpYnhsOiBkb21pZAo+
IGFsbG9jYXRpb24vcHJlc2VydmF0aW9uIGNoYW5nZXMiKToKPiA+IFNlZQo+IGh0dHBzOi8veGVu
Yml0cy54ZW4ub3JnL2dpdHdlYi8/cD1wZW9wbGUvcGF1bGR1L3hlbi5naXQ7YT1zaG9ydGxvZzto
PXJlZnMvCj4gaGVhZHMvZG9taWQxMgo+IAo+IFRoYW5rcy4gIExHVE0sIHB1c2hlZC4KPiAKCkV4
Y2VsbGVudC4gVGhhbmtzLAoKICBQYXVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
