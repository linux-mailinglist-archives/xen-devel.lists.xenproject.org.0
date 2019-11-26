Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33096109C25
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 11:18:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZXsl-0001Fq-72; Tue, 26 Nov 2019 10:15:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQNV=ZS=amazon.de=prvs=226749d31=wipawel@srs-us1.protection.inumbo.net>)
 id 1iZXsj-0001Fl-TM
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 10:15:41 +0000
X-Inumbo-ID: b2ebb336-1035-11ea-9db0-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2ebb336-1035-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574763342; x=1606299342;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=ZBx5VXpUVUv2aiv4Han2PIjMqDGJmKvHjLszKAu1SFI=;
 b=sepv4qn8bVNe4/Mdelu27bWE6CB4eYHyMFfxSfpV2BycdW3Gdcneg1/f
 4XIG6/byXPXv2Io1TuRDTI9ReGbH+RhwaIOBB52tzBeUmytCw87bPIO19
 NwHj+mcvBJLBuF67YhsiSKQu2TcHxAZAKBPL2VCIIXWIbsx9Tz/xFBLXD s=;
IronPort-SDR: KK3WP8m6ln4EBzGh7iS239pKyKJRfeAgDJS43JUQTq/lyhPiG6Mn+BJyEASm5KHo2BIdsBjzhE
 ND+21wStxMVw==
X-IronPort-AV: E=Sophos;i="5.69,245,1571702400"; 
   d="scan'208";a="1513291"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 26 Nov 2019 10:15:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id 92259C0C1C; Tue, 26 Nov 2019 10:15:36 +0000 (UTC)
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 10:15:35 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 10:15:34 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 10:15:34 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 6/7] livepatch-build: Strip transient or
 unneeded symbols
Thread-Index: AQHVbIJL506ye4DSz0WZpp8FbmWqCqecYx6AgAFIvgA=
Date: Tue, 26 Nov 2019 10:15:34 +0000
Message-ID: <B12B667E-EFE2-433E-A041-ECDE86470CA9@amazon.com>
References: <20190916113056.16592-1-wipawel@amazon.de>
 <20190916113056.16592-7-wipawel@amazon.de>
 <9dd3a4db-b348-6770-1815-86ce78377119@citrix.com>
In-Reply-To: <9dd3a4db-b348-6770-1815-86ce78377119@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.67]
Content-ID: <284D5077A754FF4E9037953E359CD4F1@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 6/7] livepatch-build: Strip transient or
 unneeded symbols
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDI1LiBOb3YgMjAxOSwgYXQgMTU6MzgsIFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vy
d2FsbEBjaXRyaXguY29tPiB3cm90ZToKPiAKPiBPbiA5LzE2LzE5IDEyOjMwIFBNLCBQYXdlbCBX
aWVjem9ya2lld2ljeiB3cm90ZToKPj4gSW4gdGhlIHByb2Nlc3Mgb2YgY3JlYXRpbmcgYSBmaW5h
bCBob3RwYXRjaCBtb2R1bGUgZmlsZSBtYWtlIHN1cmUgdG8KPj4gc3RyaXAgYWxsIHRyYW5zaWVu
dCBzeW1ib2xzIHRoYXQgaGF2ZSBub3QgYmVlbiBjYXVnaHQgYW5kIHJlbW92ZWQgYnkKPj4gY3Jl
YXRlLWRpZmYtb2JqZWN0IHByb2Nlc3NpbmcuIEZvciBub3cgdGhlc2UgYXJlIG9ubHkgdGhlIGhv
b2tzCj4+IGtwYXRjaCBsb2FkL3VubG9hZCBzeW1ib2xzLgo+PiAKPj4gCgpzbmlwCgo+PiBmdW5j
dGlvbiBjcmVhdGVfcGF0Y2goKQo+PiB7Cj4+ICAgICBlY2hvICJFeHRyYWN0aW5nIG5ldyBhbmQg
bW9kaWZpZWQgRUxGIHNlY3Rpb25zLi4uIgo+PiBAQCAtMTUwLDYgKzE3Miw3IEBAIGZ1bmN0aW9u
IGNyZWF0ZV9wYXRjaCgpCj4+ICAgICBORVdfRklMRVM9JChjb21tIC0yMyA8KGNkIHBhdGNoZWQv
eGVuICYmIGZpbmQgLiAtdHlwZSBmIC1uYW1lICcqLm8nIHwgc29ydCkgPChjZCBvcmlnaW5hbC94
ZW4gJiYgZmluZCAuIC10eXBlIGYgLW5hbWUgJyoubycgfCBzb3J0KSkKPj4gICAgIGZvciBpIGlu
ICRORVdfRklMRVM7IGRvCj4+ICAgICAgICAgY3AgInBhdGNoZWQvJGkiICJvdXRwdXQvJGkiCj4+
ICsgICAgICAgIHN0cmlwIC0tc3RyaXAtdW5uZWVkZWQgIm91dHB1dC8kaSIKPiAKPiBUaGlzIHN0
cmlwcyBkZWJ1ZyBzeW1ib2xzIHRvbyB3aGljaCBpcyBub3QgbmVjZXNzYXJpbHkgZGVzaXJhYmxl
IGFuZCBJIHRoaW5rIGZvciBtb3N0IHNvZnR3YXJlIGlzIG5vcm1hbGx5IGxlZnQgYSBoaWdoIGxl
dmVsIHByb2Nlc3MgKGUuZy4gcnBtYnVpbGQpLiBDYW4geW91IG1ha2UgdGhpcyBvcHRpb25hbCBw
bGVhc2U/Cj4gCgpZZXMsIHdpbGwgZG8uIFRoYW5rcyBmb3IgbG9va2luZy4KCj4gVGhhbmtzLAo+
IC0tIAo+IFJvc3MgTGFnZXJ3YWxsCgpCZXN0IFJlZ2FyZHMsClBhd2VsIFdpZWN6b3JraWV3aWN6
CgoKCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIu
IDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIs
IFJhbGYgSGVyYnJpY2gKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcg
dW50ZXIgSFJCIDE0OTE3MyBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
