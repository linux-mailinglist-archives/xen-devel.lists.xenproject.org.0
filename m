Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F0A112B1C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 13:14:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icTTK-0000wm-E9; Wed, 04 Dec 2019 12:09:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SvPU=Z2=amazon.com=prvs=23428832f=sjpark@srs-us1.protection.inumbo.net>)
 id 1icTTI-0000wh-UM
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 12:09:32 +0000
X-Inumbo-ID: eda81960-168e-11ea-a0d2-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eda81960-168e-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575461372; x=1606997372;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=0XU4I7wfx1XBSj0BFbZC9Xa7eD2pt9HXv+vFrvgGosk=;
 b=a3RVxmLZJ+QxCLCZlYVTFQDTFxjReRRcSMKyx2VCUIJP2OhJvugZfhZm
 kOABMbEsKxc5DpJOe+AH5T1rw7v835nZn3dgwAWUnPcmgmAEoC4orkNLV
 DdV4xQ6WXJR8EGjzJr5StI93RhxJM31E21b+DvQyYGNW38qxzDRptK2y0 A=;
IronPort-SDR: pPAh3VyOKYzmvWOsJiLjzYBAm32158CHQmvaLASrfxIVhw/Vd2V9GFkK4QdemQZ6v2teZ/0XXt
 hOgcUUWlP9RQ==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; d="scan'208";a="11545631"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Dec 2019 12:09:19 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 86FCCA26C9; Wed,  4 Dec 2019 12:09:17 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 12:09:16 +0000
Received: from EX13MTAUEE001.ant.amazon.com (10.43.62.200) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 12:09:15 +0000
Received: from u886c93fd17d25d.ant.amazon.com (10.28.85.76) by
 mail-relay.amazon.com (10.43.62.226) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 12:09:13 +0000
To: "Durrant, Paul" <pdurrant@amazon.com>, "konrad.wilk@oracle.com"
 <konrad.wilk@oracle.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>
References: <20191204113419.2298-1-sjpark@amazon.com>
 <62c68f53cc0145ad9d0dfb167b50eac4@EX13D32EUC003.ant.amazon.com>
From: <sjpark@amazon.com>
Message-ID: <fcf414ab-4ee4-bafc-6683-5527df7a9731@amazon.com>
Date: Wed, 4 Dec 2019 13:09:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62c68f53cc0145ad9d0dfb167b50eac4@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 0/2] xen/blkback: Aggressively shrink page
 pools if a memory pressure is detected
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sj38.park@gmail.com" <sj38.park@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMTkgMTI6NTIsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tCj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMu
eGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZgo+PiBTZW9uZ0phZSBQYXJrCj4+IFNlbnQ6IDA0
IERlY2VtYmVyIDIwMTkgMTE6MzQKPj4gVG86IGtvbnJhZC53aWxrQG9yYWNsZS5jb207IHJvZ2Vy
LnBhdUBjaXRyaXguY29tOyBheGJvZUBrZXJuZWwuZGsKPj4gQ2M6IHNqMzgucGFya0BnbWFpbC5j
b207IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgbGludXgtCj4+IGJsb2NrQHZnZXIu
a2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGFyaywgU2VvbmdqYWUK
Pj4gPHNqcGFya0BhbWF6b24uY29tPgo+PiBTdWJqZWN0OiBbWGVuLWRldmVsXSBbUEFUQ0ggMC8y
XSB4ZW4vYmxrYmFjazogQWdncmVzc2l2ZWx5IHNocmluayBwYWdlCj4+IHBvb2xzIGlmIGEgbWVt
b3J5IHByZXNzdXJlIGlzIGRldGVjdGVkCj4+Cj4+IEVhY2ggYGJsa2lmYCBoYXMgYSBmcmVlIHBh
Z2VzIHBvb2wgZm9yIHRoZSBncmFudCBtYXBwaW5nLiAgVGhlIHNpemUgb2YKPj4gdGhlIHBvb2wg
c3RhcnRzIGZyb20gemVybyBhbmQgYmUgaW5jcmVhc2VkIG9uIGRlbWFuZCB3aGlsZSBwcm9jZXNz
aW5nCj4+IHRoZSBJL08gcmVxdWVzdHMuICBJZiBjdXJyZW50IEkvTyByZXF1ZXN0cyBoYW5kbGlu
ZyBpcyBmaW5pc2hlZCBvciAxMDAKPj4gbWlsbGlzZWNvbmRzIGhhcyBwYXNzZWQgc2luY2UgbGFz
dCBJL08gcmVxdWVzdHMgaGFuZGxpbmcsIGl0IGNoZWNrcyBhbmQKPj4gc2hyaW5rcyB0aGUgcG9v
bCB0byBub3QgZXhjZWVkIHRoZSBzaXplIGxpbWl0LCBgbWF4X2J1ZmZlcl9wYWdlc2AuCj4+Cj4+
IFRoZXJlZm9yZSwgYGJsa2Zyb250YCBydW5uaW5nIGd1ZXN0cyBjYW4gY2F1c2UgYSBtZW1vcnkg
cHJlc3N1cmUgaW4gdGhlCj4+IGBibGtiYWNrYCBydW5uaW5nIGd1ZXN0IGJ5IGF0dGFjaGluZyBh
cmJpdHJhcmlseSBsYXJnZSBudW1iZXIgb2YgYmxvY2sKPj4gZGV2aWNlcyBhbmQgaW5kdWNpbmcg
SS9PLgo+IE9PSS4uLiBIb3cgZG8gZ3Vlc3RzIHVuaWxhdGVyYWxseSBjYXVzZSB0aGUgYXR0YWNo
bWVudCBvZiBhcmJpdHJhcnkgbnVtYmVycyBvZiBQViBkZXZpY2VzPwpHb29kIHBvaW50LsKgIE1h
bnkgc3lzdGVtcyBoYXZlIHRoZWlyIGxpbWl0IGZvciB0aGUgbWF4aW11bSBudW1iZXIgb2YgdGhl
CmRldmljZXMuwqAgVGh1cywgJ2FyYml0cmFyaWx5JyBsYXJnZSBudW1iZXIgb2YgZGV2aWNlcyBj
YW5ub3QgYmUgYXR0YWNoZWQuwqAgU28sCnRoZXJlIGlzIHRoZSB1cHBlcmJvdW5kLsKgIFN5c3Rl
bSBhZG1pbmlzdHJhdG9ycyBtaWdodCBiZSBhYmxlIHRvIGF2b2lkIHRoZQptZW1vcnkgcHJlc3N1
cmUgcHJvYmxlbSBieSBzZXR0aW5nIHRoZSBsaW1pdCBsb3cgZW5vdWdoIG9yIGdpdmluZyBtb3Jl
IG1lbW9yeQp0byB0aGUgJ2Jsa2JhY2snIHJ1bm5pbmcgZ3Vlc3QuCgpIb3dldmVyLCBtYW55IHN5
c3RlbXMgYWxzbyB0ZW1wdCB0byBzZXQgdGhlIGxpbWl0IGhpZ2ggZW5vdWdoIHNvIHRoYXQgZ3Vl
c3RzCmNhbiBzYXRpc2Z5IGFuZCB0byBnaXZlIG1pbmltYWwgbWVtb3J5IHRvIHRoZSAnYmxrYmFj
aycgcnVubmluZyBndWVzdCBmb3IgY29zdAplZmZpY2llbmN5LgoKSSBiZWxpZXZlIHRoaXMgcGF0
Y2hzZXQgY2FuIGJlIGhlbHBmdWwgZm9yIHN1Y2ggc2l0dWF0aW9ucy4KCkFueXdheSwgdXNpbmcg
dGhlIHRlcm0gJ2FyYml0cmFyaWx5JyBpcyBvYnZpc291c2x5IG15IGZhdWx0LsKgIEkgd2lsbCB1
cGRhdGUgdGhlCmRlc2NyaXB0aW9uIGluIHRoZSBuZXh0IHZlcnNpb24gb2YgcGF0Y2hzZXQuCgoK
VGhhbmtzLApTZW9uZ0phZSBQYXJrCgo+Cj4gICBQYXVsCj4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
