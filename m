Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4A534E41
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:02:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCnf-0005V6-WB; Tue, 04 Jun 2019 17:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYCne-0005V1-PI
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:00:38 +0000
X-Inumbo-ID: 46744ada-86ea-11e9-afa9-5b5c175bc4b6
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 46744ada-86ea-11e9-afa9-5b5c175bc4b6;
 Tue, 04 Jun 2019 17:00:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 323A3A78;
 Tue,  4 Jun 2019 10:00:37 -0700 (PDT)
Received: from [10.37.8.2] (unknown [10.37.8.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55F583F5AF;
 Tue,  4 Jun 2019 10:00:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906031456390.14041@sstabellini-ThinkPad-T480s>
 <20190603220245.22750-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c4b2faf1-b1b1-0035-62ac-60e5ab35aba7@arm.com>
Date: Tue, 4 Jun 2019 18:00:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190603220245.22750-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/3] xen/arm: fix nr_pdxs calculation
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMy8xOSAxMTowMiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IHBmbl90b19wZHggZXhwZWN0cyBhbiBhZGRyZXNzLCBub3QgYSBzaXplLCBhcyBhIHBhcmFt
ZXRlci4gU3BlY2lmaWNhbGx5LAo+IGl0IGV4cGVjdHMgdGhlIGVuZCBhZGRyZXNzLCB0aGVuIHRo
ZSBtYXNrcyBjYWxjdWxhdGlvbnMgY29tcGVuc2F0ZSBmb3IKPiBhbnkgaG9sZXMgYmV0d2VlbiBz
dGFydCBhbmQgZW5kLiBUaHVzLCB3ZSBzaG91bGQgcGFzcyB0aGUgZW5kIGFkZHJlc3MgdG8KPiBw
Zm5fdG9fcGR4Lgo+IAo+IFRoZSBpbml0aWFsIHBkeCBpcyBzdG9yZWQgaW4gZnJhbWV0YWJsZV9i
YXNlX3BkeCwgc28gd2UgY2FuIHN1YnRyYWN0IHRoZQo+IHJlc3VsdCBvZiBwZm5fdG9fcGR4KHN0
YXJ0X2FkZHJlc3MpIGZyb20gbnJfcGR4czsgd2Uga25vdyB0aGF0IHdlIGRvbid0Cj4gbmVlZCB0
byBjb3ZlciBhbnkgbWVtb3J5IGluIHRoZSByYW5nZSAwLXN0YXJ0IGluIHRoZSBmcmFtZXRhYmxl
Lgo+IAo+IFJlbW92ZSB0aGUgdmFyaWFibGUgYG5yX3BhZ2VzJyBiZWNhdXNlIGl0IGlzIHVudXNl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlu
eC5jb20+CgpSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
