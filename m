Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D74DAC9C24
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 12:27:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFyHT-0004fC-7K; Thu, 03 Oct 2019 10:24:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFyHR-0004f7-1N
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 10:24:17 +0000
X-Inumbo-ID: f28c3580-e5c7-11e9-9722-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f28c3580-e5c7-11e9-9722-12813bfff9fa;
 Thu, 03 Oct 2019 10:24:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C751E1000;
 Thu,  3 Oct 2019 03:24:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04CF43F739;
 Thu,  3 Oct 2019 03:24:12 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-4-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011312180.20899@sstabellini-ThinkPad-T480s>
 <af8c7f32-699b-7611-495b-575a81361952@arm.com>
 <alpine.DEB.2.21.1910011714570.2943@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1910020541060.26319@sstabellini-ThinkPad-T480s>
 <a34363de-bafe-eb22-472f-4b0f2e0d325d@arm.com>
 <alpine.DEB.2.21.1910021454250.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <080c5cf0-d57b-65a2-a89a-1a6080595a72@arm.com>
Date: Thu, 3 Oct 2019 11:24:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021454250.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 03/10] xen/arm: traps: Rework
 entry/exit from the guest path
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDAyLzEwLzIwMTkgMjM6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDIgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBUaGF0IHdhcyBt
eSByZWZsZWN0aW9uIG9uIHdoZXRoZXIgaXQgd291bGQgYmUgYSBnb29kIGlkZWEgb3IgYSBiYWQg
aWRlYQo+IHRvIGhhdmUgYSBTRVJST1IgY2hlY2sgb24gdGhlIGZpcSBoeXBlcnZpc29yIGVudHJp
ZXMuIE5vdCBuZWNlc3NhcmVseSBpbgo+IHRoaXMgcGF0Y2guIFByb2JhYmx5IG5vdCBpbiB0aGlz
IHBhdGNoLgoKSWYgeW91IHJlY2VpdmUgYSBGSVEgZXhjZXB0aW9uIG9uIEFybTY0LCB0aGVuIHlv
dSBhcmUgYWxyZWFkeSBkb29tZWQgYmVjYXVzZSB0aGUgCmh5cGVydmlzb3Igd2lsbCBjcmFzaCAo
c2VlIGRvX2JhZF9tb2RlKCkpLiBTbyByZWNlaXZpbmcgdGhlIFNFcnJvciBpcyBnb2luZyB0byAK
YmUgeW91ciBsYXN0IGNvbmNlcm4gaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
