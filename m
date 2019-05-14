Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535491C7C6
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:26:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVXk-0001HI-68; Tue, 14 May 2019 11:24:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zxYt=TO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hQVXi-0001H2-Iw
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:24:22 +0000
X-Inumbo-ID: d1bd1ebe-763a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d1bd1ebe-763a-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 11:24:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCA91374;
 Tue, 14 May 2019 04:24:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53733F71E;
 Tue, 14 May 2019 04:24:18 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
Date: Tue, 14 May 2019 12:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC8wNS8yMDE5IDExOjA4LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAxNC4wNS4xOSAxMjo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSSBndWVz
cyB3ZSBzaG91bGQgYWdyZWUgd2hhdCB0byBpbXBsZW1lbnQgZmlyc3QuCj4+Cj4+IEkgdGhpbmsg
dGhlcmUgYXJlIGFuIGFncmVlbWVudCB0aGF0IHRoZSB0d28gbWV0aG9kcyBzaG91bGQgbm90IGJl
IHVzZWQgdG9nZXRoZXIuCj4gCj4gRm9yIGEgZG9tYWluIG9yIGZvciBhIHBhcnRpY3VsYXIgVkNQ
VT8KPiBIb3cgc2hvdWxkIHdlIHJlc3BvbnNlIG9uIHRoZSByZXF1ZXN0IHRvIHJlZ2lzdGVyIHBh
ZGRyIHdoZW4gd2UgYWxyZWFkeSBoYXZlIAo+IHJlZ2lzdGVyZWQgdmFkZHIgYW5kIHZpY2UgdmVy
c2E/CgogRnJvbSB0aGUgZGlzY3Vzc2lvbiB3aXRoIEphbiwgeW91IHdvdWxkIHRlYXIgZG93biB0
aGUgcHJldmlvdXMgc29sdXRpb24gYW5kIHRoZW4KcmVnaXN0ZXIgdGhlIG5ldyB2ZXJzaW9uLiBT
byB0aGlzIGFsbG93cyBjYXNlcyBsaWtlIGEgYm9vdGxvYWRlciBhbmQgYSBrZXJuZWwgCnVzaW5n
IGRpZmZlcmVudCB2ZXJzaW9uIG9mIHRoZSBpbnRlcmZhY2UuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
