Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B28BCC07
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:03:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnEZ-0004AJ-J5; Tue, 24 Sep 2019 16:00:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCnEY-00041d-1b
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 16:00:10 +0000
X-Inumbo-ID: 6228f8d2-dee4-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 6228f8d2-dee4-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 16:00:09 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF302142F;
 Tue, 24 Sep 2019 09:00:08 -0700 (PDT)
Received: from [10.1.39.57] (unknown [10.1.39.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 488893F694;
 Tue, 24 Sep 2019 09:00:08 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190924154633.852828-1-volodymyr_babchuk@epam.com>
 <20190924154633.852828-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3ffe3503-29a6-04d0-06ef-760da7850e30@arm.com>
Date: Tue, 24 Sep 2019 17:00:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924154633.852828-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/arm: optee: handle shared buffer
 translation error
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gOS8yNC8xOSA0OjQ2IFBNLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90
ZToKPiBUaGVyZSBpcyBhIGNhc2UgcG9zc2libGUsIHdoZW4gT1AtVEVFIGFza3MgZ3Vlc3QgdG8g
YWxsb2NhdGUgc2hhcmVkCj4gYnVmZmVyLCBidXQgWGVuIGZvciBzb21lIHJlYXNvbiBjYW4ndCB0
cmFuc2xhdGUgYnVmZmVyJ3MgYWRkcmVzc2VzLiBJbgo+IHRoaXMgc2l0dWF0aW9uIHdlIHNob3Vs
ZCBkbyB0d28gdGhpbmdzOgo+IAo+IDEuIFRlbGwgZ3Vlc3QgdG8gZnJlZSBhbGxvY2F0ZWQgYnVm
ZmVyLCBzbyB0aGVyZSB3aWxsIGJlIG5vIG1lbW9yeQo+IGxlYWsgZm9yIGd1ZXN0Lgo+IAo+IDIu
IFRlbGwgT1AtVEVFIHRoYXQgYnVmZmVyIGFsbG9jYXRpb24gZmFpbGVkLgo+IAo+IFRvIGFzayBn
dWVzdCB0byBmcmVlIGFsbG9jYXRlZCBidWZmZXIgd2Ugc2hvdWxkIHBlcmZvcm0gdGhlIHNhbWUK
PiB0aGluZywgYXMgT1AtVEVFIGRvZXMgLSBpc3N1ZSBSUEMgcmVxdWVzdC4gVGhpcyBpcyBkb25l
IGJ5IGZpbGxpbmcKPiByZXF1ZXN0IGJ1ZmZlciAobHVja2lseSB3ZSBjYW4gcmV1c2UgdGhlIHNh
bWUgYnVmZmVyLCB0aGF0IE9QLVRFRSB1c2VkCj4gdG8gaXNzdWUgb3JpZ2luYWwgcmVxdWVzdCkg
YW5kIHRoZW4gcmV0dXJuIHRvIGd1ZXN0IHdpdGggc3BlY2lhbAo+IHJldHVybiBjb2RlLgo+IAo+
IFRoZW4gd2UgbmVlZCB0byBoYW5kbGUgbmV4dCBjYWxsIGZyb20gZ3Vlc3QgaW4gYSBzcGVjaWFs
IHdheTogYXMgUlBDCj4gd2FzIGlzc3VlZCBieSBYZW4sIG5vdCBieSBPUC1URUUsIGl0IHNob3Vs
ZCBiZSBoYW5kbGVkIGJ5IFhlbi4KPiBCYXNpY2FsbHksIHRoaXMgaXMgdGhlIG1lY2hhbmlzbSB0
byBwcmVlbXB0IE9QLVRFRSBtZWRpYXRvci4KPiAKPiBUaGUgc2FtZSBtZWNoYW5pc20gY2FuIGJl
IHVzZWQgaW4gdGhlIGZ1dHVyZSB0byBwcmVlbXB0IG1lZGlhdG9yCj4gZHVyaW5nIHRyYW5zbGF0
aW9uIGxhcmdlICg+NTEyIHBhZ2VzKSBzaGFyZWQgYnVmZmVycy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpBY2tlZC1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
