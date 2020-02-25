Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C1E16C1DD
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:13:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6Zyl-0006wS-N9; Tue, 25 Feb 2020 13:10:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6Zyk-0006wN-GS
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:10:26 +0000
X-Inumbo-ID: 2de63111-57d0-11ea-92fb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2de63111-57d0-11ea-92fb-12813bfff9fa;
 Tue, 25 Feb 2020 13:10:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2CA21B1B1;
 Tue, 25 Feb 2020 13:10:21 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E53B3E3.6070304@hisilicon.com>
 <8bb7d100-0ca4-c0f9-b294-f2e7a173e1c9@xen.org> <5E546B6B.70906@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cdcc6ec0-4dfa-20eb-a160-c803f5f95f93@suse.com>
Date: Tue, 25 Feb 2020 14:10:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E546B6B.70906@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] ns16550: Re-order the serial port address
 checking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDIuMjAyMCAwMTozMywgV2VpIFh1IHdyb3RlOgo+IE9uIDIwMjAvMi8yNSA2OjAzLCBK
dWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoYW5rIHlvdSBmb3Igc2VuZGluZyBhIGZvbGxvdy11cC4K
Pj4KPj4gT24gMjQvMDIvMjAyMCAxMTozMCwgV2VpIFh1IHdyb3RlOgo+Pj4gQ2hlY2sgdGhlIHNl
cmlhbCBwb3J0IGFkZHJlc3Mgc3BhY2UgYmVmb3JlIGNoZWNraW5nIHRoZSBhZGRyZXNzLgo+Pgo+
PiBDb3VsZCB5b3UgZXhwbGFpbiBpbiBhIHNlbnRlbmNlIHdoeSB5b3Ugd2FudCB0byByZS1vcmRl
cj8KPiAKPiBEbyB5b3UgdGhpbmsgaXMgaXQgT0sgdG8gZXhwbGFpbiBhcyBmb2xsb3dpbmc6Cj4g
Cj4gVGhlIHNlcmlhbCBwb3J0IGFkZHJlc3Mgc3BhY2UgSUQgcXVhbGlmaWVzIHRoZSBhZGRyZXNz
Lgo+IFdoZXRoZXIgYSB2YWx1ZSBvZiB6ZXJvIGZvciB0aGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBj
YW4gc2Vuc2libHkKPiBtZWFuICJkaXNhYmxlZCIgZGVwZW5kcyBvbiB0aGUgYWRkcmVzcyBzcGFj
ZSBJRC4gSGVuY2UgY2hlY2sgdGhlCj4gYWRkcmVzcyBzcGFjZSBJRCBiZWZvcmUgY2hlY2tpbmcg
dGhlIGFkZHJlc3MuCgpXaXRoIHRoaXMgZGVzY3JpcHRpb24gLi4uCgo+Pj4gU2lnbmVkLW9mZi1i
eTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpBbmQgSSdtIHNvcnJ5IGZvciBoYXZpbmcgZm9yZ290dGVu
IHRvIHN3aXRjaCB0aGVzZSBhcm91bmQKd2hpbGUgY29tbWl0dGluZyB5b3VyIGVhcmxpZXIgcGF0
Y2guCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
