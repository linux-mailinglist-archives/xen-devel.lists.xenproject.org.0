Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CCAD8F55
	for <lists+xen-devel@lfdr.de>; Wed, 16 Oct 2019 13:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKhO3-0005WM-Td; Wed, 16 Oct 2019 11:22:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QYkk=YJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iKhO3-0005WH-AG
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 11:22:39 +0000
X-Inumbo-ID: 423ff852-f007-11e9-93b1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423ff852-f007-11e9-93b1-12813bfff9fa;
 Wed, 16 Oct 2019 11:22:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4ADEBB2F3;
 Wed, 16 Oct 2019 11:22:37 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190921100836.21396-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021820560.2691@sstabellini-ThinkPad-T480s>
 <8519f342-2140-6740-9765-0b10d70f52e9@arm.com>
 <1ead1d4a-842f-2c35-ce30-6b67da226e6d@arm.com>
 <4c40ec62-2138-e2a5-269b-682a19ef69e2@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d4d2fa63-f0ef-7772-aa63-93cd23d7d1a1@suse.com>
Date: Wed, 16 Oct 2019 13:22:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <4c40ec62-2138-e2a5-269b-682a19ef69e2@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RESEND][PATCH for-4.13] xen/arm: mm: Clear boot
 pagetables before bringing-up each secondary CPU
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMTAuMTkgMTM6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBBcmdoIGZv
cmdvdCBhZ2Fpbi4gTWF5YmUgdGhlIDNyZCB3aWxsIGJlIGJldHRlcj8KClllcyEgWW91IG1hZGUg
aXQhIDstKQoKPiAKPiBTb3JyeSBmb3IgdGhlIG5vaXNlLgo+IAo+IENoZWVycywKPiAKPiBPbiAx
NS8xMC8yMDE5IDE3OjM2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+Pgo+PiBJIGFjdHVh
bGx5IGZvcmdvdCB0byBDQyBKdWVyZ2VuLiBObyB3b25kZXIgd2h5IEkgaGFkIG5vIGFuc3dlciA6
KC4KPj4KPj4gQ2hlZXJzLAo+Pgo+PiBPbiAxMC8xMC8xOSAzOjUxIFBNLCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+PiArSnVlcmdlbgo+Pj4KPj4+IE9uIDAzLzEwLzIwMTkgMDI6MjIsIFN0ZWZhbm8g
U3RhYmVsbGluaSB3cm90ZToKPj4+PiBPbiBTYXQsIDIxIFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwg
d3JvdGU6Cj4+Pj4+IEF0IHRoZSBtb21lbnQsIGJvb3QgcGFnZXRhYmxlcyBhcmUgb25seSBjbGVh
cmVkIG9uY2UgYXQgYm9vdC4gVGhpcyAKPj4+Pj4gbWVhbnMKPj4+Pj4gd2hlbiBib290aW5nIENQ
VTIgKGFuZCBvbndhcmRzKSB0aGVuIGJvb3QgcGFnZXRhYmxlcyB3aWxsIG5vdCBiZQo+Pj4+PiBj
bGVhcmVkLgo+Pj4+Pgo+Pj4+PiBUbyBrZWVwIHRoZSBpbnRlcmZhY2UgZXhhY3RseSB0aGUgc2Ft
ZSBmb3IgYWxsIHNlY29uZGFyeSBDUFUsIHRoZSBib290Cj4+Pj4+IHBhZ2V0YWJsZXMgYXJlIG5v
dyBjbGVhcmVkIGJlZm9yZSBicmluZ2luZy11cCBlYWNoIHNlY29uZGFyeSBDUFUuCj4+Pj4+Cj4+
Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+
Pj4KPj4+PiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJu
ZWwub3JnPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
