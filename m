Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3AC7F916
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:25:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXVj-0000gw-8m; Fri, 02 Aug 2019 13:22:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htXVi-0000gr-4s
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:22:18 +0000
X-Inumbo-ID: 8c419643-b528-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8c419643-b528-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 13:22:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5F3C1570;
 Fri,  2 Aug 2019 06:22:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3FB83F71F;
 Fri,  2 Aug 2019 06:22:15 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-2-git-send-email-andrii.anisov@gmail.com>
 <ad2a343e-1a65-6569-17a2-e5b676908e49@arm.com>
 <de4feda4-d8b6-4922-26f5-ea3d3f940563@gmail.com>
 <2da153e4-2e11-18af-5a0d-cdc12beaf858@arm.com>
 <be1d31db-60d6-6e05-e50d-d5bc6963d9e7@gmail.com>
 <096ebef8-0bc5-8b49-9b59-10fdb7e6c1de@arm.com>
 <0f4bd23e-587d-d166-01a1-7c4d44ad4b50@gmail.com>
 <10fd9482-8440-ac7c-c40e-4b735ecfe97c@arm.com>
 <2e95c614-e01a-ddc3-7c96-3de4ca9c73b4@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <78ad7a71-f8d2-85f1-290f-b58b6b707bc5@arm.com>
Date: Fri, 2 Aug 2019 14:22:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2e95c614-e01a-ddc3-7c96-3de4ca9c73b4@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 1/6] xen/arm: Re-enable interrupt later in the
 trap path
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMDIvMDgvMjAxOSAxMzoyNCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiAK
PiAKPiBPbiAwMi4wOC4xOSAxMjowMywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBBIGZhaXIgYW1v
dW50IG9mIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIGRlYWwgd2l0aCB0aGUgZ3Vlc3QgaXRzZWxm
IChpLmUgdkdJQywgCj4+IFAyTS4uLikKPiAKPiBBbGwgdGhhdCBzdHVmZiBpcyB3aGF0IGh5cGVy
dmlzb3IgZG9lcyBmb3IgdGhlIGd1ZXN0LiBBbmQgZG9lcyBiZWhpbmQgdGhlIAo+IGd1ZXN0J3Mg
YmFjay4KUGxlYXNlIGRlZmluZSAiZ3Vlc3QncyBiYWNrIi4KClRlY2huaWNhbGx5IGEgZ3Vlc3Qg
YWNjZXNzaW5nIGFuIElPIGRvZXMgbm90IGtub3cgdGhhdCB0aGUgYWNjZXNzIHdpbGwgYmUgCmVt
dWxhdGVkLiBTbyB0aGlzIHNob3VsZCBhbHNvIHRha2UgaW50byBhY2NvdW50IGFzICJndWVzdCdz
IGJhY2siLgoKQW4gaHlwZXJjYWxsIGlzIGluaXRpYXRlZCBieSB0aGUgZ3Vlc3QgZGlyZWN0bHks
IHNvIEkgYWdyZWUgdGhpcyBpcyBub3QgZG9uZSBvbiAKZ3Vlc3QncyBiYWNrLgoKU29tZSBvZiB0
aGUgd29yayBkb25lIGluIGxlYXZlX2h5cGVydmlzb3JfdGFpbCgpIGlzIGFuIGV4dGVuc2lvbiBv
ZiBJTyAKZW11bGF0aW9uLiBUaGV5IGFyZSBub3QgZG9uZSBkaXJlY3RseSBpbiB0aGUgSU8gZW11
bGF0aW9uIGJlY2F1c2UgdGhleSBtYXkgdGFrZSAKYSBsb25nIHRpbWUgYW5kIGdldCBwcmVlbXB0
aW9uLiBTbyBJIGRvbid0IHNlZSBhbnkgZGlmZmVyZW5jZSB3aXRoICJJTyBlbXVsYXRpb24iLgoK
UmVnYXJkaW5nIHRoZSB2R0lDLiBUaGlzIGlzIGEgYml0IG1vcmUgYSBncmV5IGFyZWEuIFdoaWxl
IGl0IGlzIGFuIG92ZXJoZWFkIG9mIAp2aXJ0dWFsaXphdGlvbiwgdGhpcyBpcyBpbmRpcmVjdGx5
IGluaXRpYXRlZCBieSB0aGUgZ3Vlc3QuIEluZGVlZCwgeW91IHdvdWxkIApvbmx5IGNvbmZpZ3Vy
ZSB0aGUgdkdJQyBpZiB5b3UgcmVjZWl2ZSBhbiBpbnRlcnJ1cHQgZ2VuZXJhdGVkIGJ5IG9uZSBv
ZiB0aGUgCmRldmljZSBhc3NpZ25lZC4KCj4gCj4+ICwgc28gSSB0aGluayB0aGV5IHNob3VsZCBi
ZSBhY2NvdW50ZWQgdG8gdGhlIGd1ZXN0IHRpbWUuCj4gVGhpcyBwb2ludCBpcyBhcmd1YWJsZS4g
VGhhdCdzIHdoeSB3ZSBoYXZlIGEgZGlzY3Vzc2lvbiBoZXJlIHRvIGFncmVlIG9uIHRoZSAKPiB0
aW1lIGFjY291bnRpbmcgYXBwcm9hY2gsIHdoYXQgd2lsbCBkaXJlY3RseSBhZmZlY3Qgc2NoZWR1
bGluZyBhY2N1cmFjeS4KCk5vdGUgdGhlICJJIHRoaW5rIiBpbiBteSBhbnN3ZXIuIFNvIHRoaXMg
aXMgbXkgb3BpbmlvbiBhbmQgeW91ciBpbnB1dCBpcyBleHBlY3RlZC4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
