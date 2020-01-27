Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3714AA9C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 20:39:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwA9r-0007k5-85; Mon, 27 Jan 2020 19:34:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=F3uC=3Q=amazon.com=prvs=28849360f=elnikety@srs-us1.protection.inumbo.net>)
 id 1iwA9p-0007k0-Ut
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 19:34:49 +0000
X-Inumbo-ID: 1490f524-413c-11ea-b45d-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1490f524-413c-11ea-b45d-bc764e2007e4;
 Mon, 27 Jan 2020 19:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1580153689; x=1611689689;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qa98SqOndbymQuoHvRukMHGmR0qRnIhWvxgHthE/ezA=;
 b=guw0DukFrXBOVxoAdS0ihUof6Z2UN+lOF8aV2l1Jp1Hwdov16JfcAQxu
 X9GVWJiSv5ZxXJ5f90ot0MEh0e6vNF/G7WTvbR53eJRonCnPoj2bDiUnT
 sFsGj9BEPl7gW+jBR3onfSCo8gkQ9cHZyTlMBPFsJELarme5IC8kRVSet w=;
IronPort-SDR: og7ZdLPg+FPkRHp4YnvvHnd+gnWyebox6Oirj2jp94tbcdce2sLxoDuY0lTFW30Zn8QkrSlotK
 lMU3YZI8ra5w==
X-IronPort-AV: E=Sophos;i="5.70,370,1574121600"; d="scan'208";a="22746100"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-baacba05.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Jan 2020 19:34:38 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-baacba05.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3944FA2622; Mon, 27 Jan 2020 19:34:37 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 27 Jan 2020 19:34:36 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.18) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 27 Jan 2020 19:34:31 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1579727989.git.elnikety@amazon.com>
 <f997f1b3a7d515392c15f518ce886710068bb4ef.1579727989.git.elnikety@amazon.com>
 <5a5fb1af-6405-9052-6f6b-0cc650f1e424@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <54470337-d6ba-64a4-e873-5954db070278@amazon.com>
Date: Mon, 27 Jan 2020 20:34:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5a5fb1af-6405-9052-6f6b-0cc650f1e424@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.18]
X-ClientProxiedBy: EX13D25UWB001.ant.amazon.com (10.43.161.245) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v1 2/4] x86/microcode: Improve parsing for
 ucode=
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George
 Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@amazon.co.uk>,
 xen-devel@lists.xenproject.org, David Woodhouse <dwmw@amazon.co.uk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciBnZXR0aW5nIHRoZSBvdGhlciBwYXRjaGVzIGluIHRoZSBzZXJpZXMgb250byBt
YXN0ZXIsIEphbi4KClRoaXMgaXMgdGhlIG9ubHkgcGF0Y2ggb3V0IG9mIHRoaXMgc2VyaWVzIHRo
YXQgZGlkIG5vdCBtYWtlIGl0IHRocm91Z2gsIApzbyBJIGtlZXBpbmcgbXkgY29tbWVudHMgaGVy
ZS4KCk9uIDIzLjAxLjIwIDExOjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMi4wMS4yMDIw
IDIzOjMwLCBFc2xhbSBFbG5pa2V0eSB3cm90ZToKPj4gRGVjb3VwbGUgdGhlIG1pY3JvY29kZSBp
bmRleGluZyBtZWNoYW5pc20gd2hlbiB1c2luZyBHUlVCIHRvIHRoYXQKPj4gd2hlbiB1c2luZyBF
RkkuIFRoaXMgYWxsb3dzIHVzIHRvIGF2b2lkIHRoZSAidW5zcGVjaWZpZWQgZWZmZWN0IiBvZgo+
PiB1c2luZyBgPGludGVnZXI+YCB3aGVuIGJvb3RpbmcgdmlhIEVGSS4KPiAKPiBQZXJzb25hbGx5
IEknZCBwcmVmZXIgdXMgdG8gY29udGludWUgY2FsbCB0aGlzIHVuc3BlY2lmaWVkLiBJdAo+IHNp
bXBseSBzaG91bGRuJ3QgYmUgdXNlZC4gUGVvcGxlIHNob3VsZG4ndCByZWx5IG9uIGl0IGdldHRp
bmcKPiBpZ25vcmVkLiAoSWlyYywgZGVzcGl0ZSB0aGlzIGJlaW5nIHYxLCB5b3UgaGFkIHByZXZp
b3VzbHkKPiBzdWJtaXR0ZWQgYSBwYXRjaCB0byB0aGlzIGVmZmVjdCwgd2l0aCBtZSByZXBsYXlp
bmcgYWJvdXQgdGhlCj4gc2FtZS4pCj4gCj4+IFdpdGggdGhhdCwgWGVuIGNhbiBleHBsaWNpdGx5
IGlnbm9yZSB0aGF0IG9wdGlvbiB3aGVuIHVzaW5nIEVGSS4KPiAKPiBEb24ndCB3ZSBkbyBzbyBh
bHJlYWR5LCBieSB3YXkgb2YgdGhlICJpZiAoICF1Y29kZV9tb2RfZm9yY2VkICkiCj4geW91IGRl
bGV0ZT8KPiAKCk5vdCBxdWl0ZS4gSWYgY2ZnLmVmaSBkb2VzIG5vdCBzcGVjaWZ5ICJ1Y29kZT08
ZmlsZW5hbWU+IiwgdGhlbiBhIApgdWNvZGU9PGludGVnZXI+YCBmcm9tIHRoZSBjb21tYW5kbGlu
ZSBnZXRzIHBhcnNlZCwgcmVzdWx0aW5nIGluIHRoZSAKInVuc3BlY2lmaWVkIiBiZWhhdmlvdXIu
IEhlcmUsIHRoZSB1Y29kZV9tb2RfaWR4IHdpbGwgaG9sZCB0aGUgPGludGVnZXI+IAp3aGljaCB3
aWxsIGJlIHVzZWQgYXMgaW5kZXggaW50byB0aGUgbW9kdWxlcyBwcmVwYXJlZCBpbiB3aGF0ZXZl
ciBvcmRlciAKdGhlIGVmaS9ib290LmMgZGVmaW5lcy4KCkluIGFueSBjYXNlLCBsZXQgbWUga25v
dyAoYW5kIG90aGVycyB0b28pIGlmLCBsYXRlciBvbiwgeW91IG1heSB3YW50IHRvIApmYXZvciB0
aGUgZXhwbGljaXRseSBpZ25vcmUgKG9wcG9zZWQgdG8gdW5zcGVjaWZpZWQpIHNlbWFudGljIGFu
ZCBJIHdpbGwgCmJlIGhhcHB5IHRvIHNlbmQgYW5vdGhlciByZXZpc2lvbiBvZiB0aGlzIHBhdGNo
IHdoaWxlIGFkZHJlc3NpbmcgeW91ciAKY29tbWVudCBiZWxvdy4KCj4+IC0tLSBhL2RvY3MvbWlz
Yy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2MveGVuLWNvbW1hbmQt
bGluZS5wYW5kb2MKPj4gQEAgLTIxNDcsOSArMjE0Nyw5IEBAIGZvciB1cGRhdGluZyBDUFUgbWlj
cmNvZGUuIFdoZW4gbmVnYXRpdmUsIGNvdW50aW5nIHN0YXJ0cyBhdCB0aGUgZW5kIG9mCj4+ICAg
dGhlIG1vZHVsZXMgaW4gdGhlIEdyVUIgZW50cnkgKHNvIHdpdGggdGhlIGJsb2IgY29tbW9ubHkg
YmVpbmcgbGFzdCwKPj4gICBvbmUgY291bGQgc3BlY2lmeSBgdWNvZGU9LTFgKS4gTm90ZSB0aGF0
IHRoZSB2YWx1ZSBvZiB6ZXJvIGlzIG5vdCB2YWxpZAo+PiAgIGhlcmUgKGVudHJ5IHplcm8sIGku
ZS4gdGhlIGZpcnN0IG1vZHVsZSwgaXMgYWx3YXlzIHRoZSBEb20wIGtlcm5lbAo+PiAtaW1hZ2Up
LiBOb3RlIGZ1cnRoZXIgdGhhdCB1c2Ugb2YgdGhpcyBvcHRpb24gaGFzIGFuIHVuc3BlY2lmaWVk
IGVmZmVjdAo+PiAtd2hlbiB1c2VkIHdpdGggeGVuLmVmaSAodGhlcmUgdGhlIGNvbmNlcHQgb2Yg
bW9kdWxlcyBkb2Vzbid0IGV4aXN0LCBhbmQKPj4gLXRoZSBibG9iIGdldHMgc3BlY2lmaWVkIHZp
YSB0aGUgYHVjb2RlPTxmaWxlbmFtZT5gIGNvbmZpZyBmaWxlL3NlY3Rpb24KPj4gK2ltYWdlKS4g
VGhpcyBvcHRpb24gc2hvdWxkIGJlIHVzZWQgb25seSB3aXRoIGxlZ2FjeSBib290LCBhcyBpdCBp
cyBleHBsaWNpdGx5Cj4+ICtpZ25vcmVkIGluIEVGSSBib290LiBXaGVuIGJvb3RpbmcgdmlhIEVG
SSwgdGhlIG1pY3JvY29kZSB1cGRhdGUgYmxvYiBmb3IKPj4gK2Vhcmx5IGxvYWRpbmcgY2FuIGJl
IHNwZWNpZmllZCB2aWEgdGhlIGB1Y29kZT08ZmlsZW5hbWU+YCBjb25maWcgZmlsZS9zZWN0aW9u
Cj4+ICAgZW50cnk7IHNlZSBbRUZJIGNvbmZpZ3VyYXRpb24gZmlsZSBkZXNjcmlwdGlvbl0oZWZp
Lmh0bWwpKS4KPiAKPiBKdXN0IGxpa2UgaW4gcGF0Y2ggMSwgcGxlYXNlIGRpc3Rpbmd1aXNoICJF
RkkgYm9vdCIgaW4gZ2VuZXJhbCBmcm9tCj4gInVzZSBvZiB4ZW4uZWZpIiAocmVsZXZhbnQgaGVy
ZSBvZiBjb3Vyc2Ugb25seSBpZiBpbmRlZWQgd2Ugd2VudAo+IHdpdGggdGhpcyBwYXRjaCkuCj4g
Cj4gSmFuCj4gCllvdSBoYXZlIG1lbnRpb25lZCB0aGlzIHZlcnkgc2FtZSByZW1hcmsgb24gdGhl
IG90aGVyIHBhdGNoIHRvby4gTXkgCnVuZGVyc3RhbmRpbmcgaXMgdGhhdCAiRUZJIGJvb3QiIG1h
eSBiZSBhbWJpZ3VvdXMgYmV0d2VlbiAoYSkgd2UgYXJlIAphY3R1YWxseSBib290aW5nIGZyb20g
eGVuLmVmaSBvciAoYikgYSBzeXN0ZW0gd2l0aCBFRkkgc3VwcG9ydCAoYW5kIHRoZSAKbGF0dGVy
IG1heSBzdGlsbCBiZSBmYWxsaW5nIG9udG8gZ3J1YiBmb3IgYm9vdGluZykuIExldCBtZSBrbm93
IGlmIAp0aGF0J3Mgbm90IGFjdHVhbGx5IHdoYXQgeW91ciByZW1hcmsgaXMgYWJvdXQuCgpDaGVl
cnMsCkVzbGFtCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
