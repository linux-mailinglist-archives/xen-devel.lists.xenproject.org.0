Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76964AC61A
	for <lists+xen-devel@lfdr.de>; Sat,  7 Sep 2019 12:39:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i6Y4M-0006IL-Ou; Sat, 07 Sep 2019 10:35:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1qDq=XC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i6Y4K-0006IG-Gv
 for xen-devel@lists.xenproject.org; Sat, 07 Sep 2019 10:35:48 +0000
X-Inumbo-ID: 3f6304aa-d15b-11e9-abfd-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3f6304aa-d15b-11e9-abfd-12813bfff9fa;
 Sat, 07 Sep 2019 10:35:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DFD31000;
 Sat,  7 Sep 2019 03:35:44 -0700 (PDT)
Received: from [10.37.12.3] (unknown [10.37.12.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35C283F59C;
 Sat,  7 Sep 2019 03:35:43 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190812173019.11956-1-julien.grall@arm.com>
 <20190812173019.11956-15-julien.grall@arm.com>
 <alpine.DEB.2.21.1908221013480.22783@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ff7f2a3d-fa2e-33bc-1051-3cff6517d760@arm.com>
Date: Sat, 7 Sep 2019 11:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908221013480.22783@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 14/28] xen/arm32: head: Rework and
 document check_cpu_mode()
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

SGkgU3RlZmFubywKCk9uIDgvMjIvMTkgNjoxNCBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgMTIgQXVnIDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQSBicmFuY2gg
aW4gdGhlIHN1Y2Nlc3MgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBpbnZlcnRpbmcgdGhlIGJyYW5j
aAo+PiBjb25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVzcyBjb21t
ZW50IGFzIFhlbiBjYW4gb25seQo+PiBydW4gYXQgSHlwZXJ2aXNvciBNb2RlLgo+Pgo+PiBMYXN0
bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0ZXJzIHVzYWdlIHdp
dGhpbiB0aGUKPj4gZnVuY3Rpb24uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gQWxyZWFkeSBwcm92aWRlZCBieSByZXZpZXdlZC1i
eSBsYXN0IHRpbWUKCldob29wcywgSSB3aWxsIGFkZCBpdCBpbiB0aGUgbmV4dCByZXZpc2lvbi4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
