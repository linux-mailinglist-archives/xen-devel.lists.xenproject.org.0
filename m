Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6148E7F5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 11:18:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyBrL-0002kW-1V; Thu, 15 Aug 2019 09:15:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyBrJ-0002kQ-UG
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 09:15:49 +0000
X-Inumbo-ID: 44ca8132-bf3d-11e9-8b99-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 44ca8132-bf3d-11e9-8b99-12813bfff9fa;
 Thu, 15 Aug 2019 09:15:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9409228;
 Thu, 15 Aug 2019 02:15:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 233633F706;
 Thu, 15 Aug 2019 02:15:47 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-6-sstabellini@kernel.org> <87blwtgmma.fsf@epam.com>
 <6914df4a-03e3-31fb-9e93-49a018f1e708@arm.com>
 <alpine.DEB.2.21.1908141535390.8737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c07593ef-6496-cc57-7786-ec86dcb0b098@arm.com>
Date: Thu, 15 Aug 2019 10:15:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908141535390.8737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 6/7] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDE0LzA4LzIwMTkgMjM6NDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDEzIEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDgvMTMv
MTkgMzozNCBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+PiBTdGVmYW5vIFN0YWJlbGxp
bmkgd3JpdGVzOgo+PiBPbiBhIHNpZGUgbm90ZSwgdGhlIGNoZWNrIGlzIHN0aWxsIGluY29ycmVj
dCBoZXJlIGJlY2F1c2UgeW91IHdvdWxkIGFsbG93Cj4+IC9yZXNlcnZlZC1tZW1vcnlALi4uIG9y
IC9yZXNlcnZlZC1tZW1vcnktdGVzdCB0byBwYXNzLgo+IAo+IC4uLmJ1dCB5b3UgYXJlIHJpZ2h0
IHRoYXQgd2Ugc2hvdWxkIGRlYWwgd2l0aCB0aGluZ3MgbGlrZQo+ICIvcmVzZXJ2ZWQtbWVtb3J5
LXRlc3QiIHByb3Blcmx5LiBJdCBsb29rcyBsaWtlIHdlIHNob3VsZCBjb21wYXJlCj4gYWdhaW5z
dCAiL3Jlc2VydmVkLW1lbW9yeS8iLCBub3RlIHRoZSAnLycgYXQgdGhlIGVuZC4KCllvdSBhcmUg
cmlnaHQsIHRoZSB0cmFpbGluZyAvIHNob3VsZCBlbnN1cmUgeW91IG9ubHkgbWF0Y2ggYW55dGhp
bmcgdW5kZXIgdGhlIApyZXNlcnZlZC1tZW1vcnkgbm9kZS4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
