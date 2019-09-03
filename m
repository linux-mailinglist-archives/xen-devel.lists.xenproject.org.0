Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3387EA6BFD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 16:56:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5ABF-0002sW-Ig; Tue, 03 Sep 2019 14:53:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5ABE-0002sL-50
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 14:53:12 +0000
X-Inumbo-ID: 8c58b0cf-ce5a-11e9-ab96-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c58b0cf-ce5a-11e9-ab96-12813bfff9fa;
 Tue, 03 Sep 2019 14:53:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5D14DAD23;
 Tue,  3 Sep 2019 14:53:10 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190829101846.21369-1-jgross@suse.com>
 <20190829101846.21369-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87905a2d-acd5-90b7-1c40-bf81f5ac005b@suse.com>
Date: Tue, 3 Sep 2019 16:53:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190829101846.21369-6-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/5] xen: modify several static locks to
 unique names
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMjoxOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBvcmRlciB0byBo
YXZlIHVuaXF1ZSBuYW1lcyB3aGVuIGRvaW5nIGxvY2sgcHJvZmlsaW5nIHNldmVyYWwgbG9jYWwK
PiBsb2NrcyAibG9jayIgbmVlZCB0byBiZSByZW5hbWVkLgoKQnV0IHRoZXNlIGFyZSBhbGwgbmFt
ZWQgc2ltcGx5ICJsb2NrIiBmb3IgYSBnb29kIHJlYXNvbiwgaW5jbHVkaW5nCmJlY2F1c2UgdGhl
eSdyZSBhbGwgZnVuY3Rpb24gc2NvcGUgc3ltYm9scyAoYW5kIHR5cGljYWxseSB0aGUKZnVuY3Rp
b25zIGFyZSBhbGwgc3VmZmljaWVudGx5IHNob3J0KS4gVGhlIGlzc3VlIHN0ZW1zIGZyb20gdGhl
CmR1YWwgdXNlIG9mICJuYW1lIiBpbgoKI2RlZmluZSBfTE9DS19QUk9GSUxFKG5hbWUpIHsgMCwg
I25hbWUsICZuYW1lLCAwLCAwLCAwLCAwLCAwIH0KCnNvIEknZCByYXRoZXIgc3VnZ2VzdCBtYWtp
bmcgdGhpcyBhIGRlcml2YXRpb24gb2YgYSBuZXcKCiNkZWZpbmUgX0xPQ0tfUFJPRklMRV9OQU1F
KGxvY2ssIG5hbWUpIHsgMCwgI25hbWUsICZsb2NrLCAwLCAwLCAwLCAwLCAwIH0KCmlmIHRoZXJl
J3Mgbm8gb3RoZXIgKHRyYW5zcGFyZW50KSB3YXkgb2YgZGlzYW1iaWd1YXRpbmcgdGhlIG5hbWVz
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
