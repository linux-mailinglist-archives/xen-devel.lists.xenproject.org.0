Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB67A8F4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:48:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsRV6-0007Md-PL; Tue, 30 Jul 2019 12:45:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wvG0=V3=amazon.de=prvs=10786bff1=nmanthey@srs-us1.protection.inumbo.net>)
 id 1hsRV5-0007MY-LU
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:45:07 +0000
X-Inumbo-ID: db01407f-b2c7-11e9-8980-bc764e045a96
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id db01407f-b2c7-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 12:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1564490706; x=1596026706;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qSkIHvRIdEcWc4m/emHt3KnKdN2/TnYkpWPz7G2Rmi8=;
 b=ev4MgIwzBwaD8xW/J3GNltr1Yq2ADlLP84uUAuS6IRTzWWPjwPeBVGOm
 Rd/vgHUg/hpwdjAMhPEeyj4qRQL4G4yL/kv7WlTwNEIdsWitwRm0XY8yx
 7Fk6gw0L+dchfT1osV7JEMtOKoI+dYb4sva11jAC7rGOEFYy20r/gOD7g s=;
X-IronPort-AV: E=Sophos;i="5.64,326,1559520000"; d="scan'208";a="814914657"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 30 Jul 2019 12:45:02 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 57211A17F1; Tue, 30 Jul 2019 12:45:01 +0000 (UTC)
Received: from EX13D02EUB001.ant.amazon.com (10.43.166.150) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 12:45:00 +0000
Received: from uc1a35a69ae4659.ant.amazon.com (10.43.162.191) by
 EX13D02EUB001.ant.amazon.com (10.43.166.150) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 30 Jul 2019 12:44:54 +0000
To: Jan Beulich <JBeulich@suse.com>
References: <1562921502-20137-1-git-send-email-nmanthey@amazon.de>
 <1562921502-20137-2-git-send-email-nmanthey@amazon.de>
 <b70d3c83-d7c8-e8a3-f587-e5a7cca8ca0d@suse.com>
From: Norbert Manthey <nmanthey@amazon.de>
Openpgp: preference=signencrypt
Autocrypt: addr=nmanthey@amazon.de; prefer-encrypt=mutual; keydata=
 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
 pEddsOqYwOs=
Message-ID: <7524db98-5718-0cd3-b1fe-0ad0a60c0980@amazon.de>
Date: Tue, 30 Jul 2019 14:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b70d3c83-d7c8-e8a3-f587-e5a7cca8ca0d@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.162.191]
X-ClientProxiedBy: EX13D03UWC002.ant.amazon.com (10.43.162.160) To
 EX13D02EUB001.ant.amazon.com (10.43.166.150)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v3 1/2] common/grant_table:
 harden bound accesses
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, Pawel
 Wieczorkiewicz <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>, David
 Woodhouse <dwmw@amazon.co.uk>, Martin Mazein <amazein@amazon.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Bjoern
 Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xOC8xOSAxNDowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTIuMDcuMjAxOSAxMDo1
MSwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+PiBHdWVzdHMgY2FuIGlzc3VlIGdyYW50IHRhYmxl
IG9wZXJhdGlvbnMgYW5kIHByb3ZpZGUgZ3Vlc3QgY29udHJvbGxlZAo+PiBkYXRhIHRvIHRoZW0u
IFRoaXMgZGF0YSBpcyB1c2VkIGFzIGluZGV4IGZvciBtZW1vcnkgbG9hZHMgYWZ0ZXIgYm91bmQK
Pj4gY2hlY2tzIGhhdmUgYmVlbiBkb25lLiBUbyBhdm9pZCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzZXMsIHdlCj4+IHVzZSB0aGUgYXJyYXlfaW5kZXhfbm9zcGVjIG1hY3JvIHdoZXJl
IGFwcGxpY2FibGUsIG9yIHRoZSBtYWNybwo+PiBibG9ja19zcGVjdWxhdGlvbi4gTm90ZSwgdGhl
IGJsb2NrX3NwZWN1bGF0aW9uIG1hY3JvIGlzIHVzZWQgb24gYWxsCj4+IHBhdGggaW4gc2hhcmVk
X2VudHJ5X2hlYWRlciBhbmQgbnJfZ3JhbnRfZW50cmllcy4gVGhpcyB3YXksIGFmdGVyIGEKPj4g
Y2FsbCB0byBzdWNoIGEgZnVuY3Rpb24sIGFsbCBib3VuZCBjaGVja3MgdGhhdCBoYXBwZW5lZCBi
ZWZvcmUgYmVjb21lCj4+IGFyY2hpdGVjdHVyYWwgdmlzaWJsZSwgc28gdGhhdCBubyBhZGRpdGlv
bmFsIHByb3RlY3Rpb24gaXMgcmVxdWlyZWQKPj4gZm9yIGNvcnJlc3BvbmRpbmcgYXJyYXkgYWNj
ZXNzZXMuIEFzIHRoZSB3YXkgd2UgaW50cm9kdWNlIGFuIGxmZW5jZQo+PiBpbnN0cnVjdGlvbiBt
aWdodCBhbGxvdyB0aGUgY29tcGlsZXIgdG8gcmVsb2FkIGNlcnRhaW4gdmFsdWVzIGZyb20KPj4g
bWVtb3J5IG11bHRpcGxlIHRpbWVzLCB3ZSB0cnkgdG8gYXZvaWQgc3BlY3VsYXRpdmVseSBjb250
aW51aW5nCj4+IGV4ZWN1dGlvbiB3aXRoIHN0YWxlIHJlZ2lzdGVyIGRhdGEgYnkgbW92aW5nIHJl
bGV2YW50IGRhdGEgaW50bwo+PiBmdW5jdGlvbiBsb2NhbCB2YXJpYWJsZXMuCj4+Cj4+IFNwZWN1
bGF0aXZlIGV4ZWN1dGlvbiBpcyBub3QgYmxvY2tlZCBpbiBjYXNlIG9uZSBvZiB0aGUgZm9sbG93
aW5nCj4+IHByb3BlcnRpZXMgaXMgdHJ1ZToKPj4gICAtIHBhdGggY2Fubm90IGJlIHRyaWdnZXJl
ZCBieSB0aGUgZ3Vlc3QKPj4gICAtIHBhdGggZG9lcyBub3QgcmV0dXJuIHRvIHRoZSBndWVzdAo+
PiAgIC0gcGF0aCBkb2VzIG5vdCByZXN1bHQgaW4gYW4gb3V0LW9mLWJvdW5kIGFjY2Vzcwo+PiAg
IC0gcGF0aCBjYW5ub3QgYmUgZXhlY3V0ZWQgcmVwZWF0ZWRseQo+IEkgbm90aWNlIHRoaXMgc2Vu
dGVuY2UgaXMgc3RpbGwgdGhlcmUgd2l0aG91dCBtb2RpZmljYXRpb24uIElmIHlvdQo+IGRvbid0
IHdhbnQgdG8gZHJvcCBpdCAoYW5kIHRoZW4gcGVyaGFwcyBtYWtlIGNoYW5nZXMgdG8gYSBmZXcg
bW9yZQo+IHBhdGhzKSwgY2FuIHdlIGF0IGxlYXN0IHNldHRsZSBvbiBhIGxlc3MgZmlybSBzdGF0
ZW1lbnQgbGlrZSAicGF0aAo+IGlzIHVubGlrZWx5IHRvIGJlIGV4ZWN1dGVkIHJlcGVhdGVkbHkg
aW4gcmFwaWQgc3VjY2Vzc2lvbiI/CgpJIHdpbGwgZHJvcCB0aGUgbGFzdCBjb25kaXRpb24sIGFu
ZCBwb3N0IGFuIHVwZGF0ZSBvbmUgbW9yZSB0aW1lLiBGb3IKY29kZSBwYXRoIHRoYXQgY2FuIGJl
IGV4ZWN1dGVkIG9uY2UsIGUuZy4gZHVyaW5nIGluaXRpYWxpemF0aW9uLCBubyBuZWVkCmZvciBt
aXRpZ2F0aW9uIG1pZ2h0IGJlIG9idmlvdXMgZW5vdWdoLCBhbmQgZm9yIG90aGVyIHBhdGgnIG9u
ZSBoYXMgdG8KZGVjaWRlIHdoZXRoZXIgYSBndWVzdCBjYW4gYWN0dWFsbHkgdHJpZ2dlciB0aGVt
IG9mdGVuIGVub3VnaCBzbyB0aGF0IGEKZml4IGlzIHJlcXVpcmVkLgoKQmVzdCwKTm9yYmVydAoK
Li4uIHNuaXAgLi4uCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgK
S3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFu
IFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFy
bG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5
IDIzNyA4NzkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
