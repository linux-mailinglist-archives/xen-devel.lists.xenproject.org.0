Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC57640B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 13:03:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqxxC-0000lb-F2; Fri, 26 Jul 2019 11:00:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hqxxA-0000hY-T4
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 11:00:00 +0000
X-Inumbo-ID: 81282944-af94-11e9-ae01-774d43ce81cc
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 81282944-af94-11e9-ae01-774d43ce81cc;
 Fri, 26 Jul 2019 10:59:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6FA344;
 Fri, 26 Jul 2019 03:59:56 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E73343F71A;
 Fri, 26 Jul 2019 03:59:55 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1564137460-25629-1-git-send-email-andrii.anisov@gmail.com>
 <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c971845f-7305-22c2-081f-9faa36e4c8d2@arm.com>
Date: Fri, 26 Jul 2019 11:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564137460-25629-7-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC 5/6] arm64: call enter_hypervisor_head only
 when it is needed
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

SGksCgpPbiAyNi8wNy8yMDE5IDExOjM3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEZyb206IEFu
ZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gCj4gT24gQVJNNjQgd2Uga25v
dyBleGFjdGx5IGlmIHRyYXAgaGFwcGVuZWQgZnJvbSBoeXBlcnZpc29yIG9yIGd1ZXN0LCBzbwo+
IHdlIGRvIG5vdCBuZWVkIHRvIHRha2UgdGhhdCBkZWNpc2lvbi4gVGhpcyByZWR1Y2VzIGEgY29u
ZGl0aW9uIGZvcgo+IGFsbCBlbnRlcl9oeXBlcnZpc29yX2hlYWQgY2FsbHMgYW5kIHRoZSBmdW5j
dGlvbiBjYWxsIGZvciB0cmFwcyBmcm9tCj4gdGhlIGh5cGVydmlzb3IgbW9kZS4KCk9uZSBjb25k
aXRpb24gbG9zdCBidXQgLi4uCgo+IAo+IEN1cnJlbnRseSwgaXQgaXMgaW1wbGVtZW50ZWQgZm9y
IEFSTTY0IG9ubHkuIEludGVncmF0aW5nIHRoZSBzdHVmZgo+IHdpdGggQVJNMzIgcmVxdWlyZXMg
bW92aW5nIGAgaWYgKCBndWVzdF9tb2RlKHJlZ3MpIClgIGNvbmRpdGlvbgo+IGludG8gQVJNMzIg
c3BlY2lmaWMgdHJhcHMuCgouLi4gb25lIG1vcmUgZGl2ZXJnZW5jZSBiZXR3ZWVuIGFybTMyIGFu
ZCBhcm02NC4KClRoZXJlIGFyZSBwcm9iYWJseSBkb3plbnMgb2YgbW9yZSBjb25kaXRpb25zIGlu
IHRoZSBjb2RlIHRoYXQgYXJlIG5vdCBuZWNlc3NhcnkgCmZvciBvbmUgb2YgdGhlIGFyY2hpdGVj
dHVyZXMuIFlldCB0aGVyZSBhcmUgdmFsdWUgdG8ga2VlcCBldmVyeXRoaW5nIGNvbW1vbiAKYmVj
YXVzZSB0aGUgYmVuZWZpdHMgb3V0d2VpZ2ggdGhlIGxpa2VseSBub24gcGVyZm9ybWFuY2UgaW1w
cm92ZW1lbnQuCgpTbyBJIGFtIG5vdCBjb252aW5jZWQgdGhhdCB0aGlzIGhhcyBhbnkgdmFsdWUg
Zm9yIFhlbi4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
