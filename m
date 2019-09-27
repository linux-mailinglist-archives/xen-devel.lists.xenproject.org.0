Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B483C05C0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:52:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpgl-0001CL-VA; Fri, 27 Sep 2019 12:49:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CKAD=XW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDpgk-0001CE-V7
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:49:34 +0000
X-Inumbo-ID: 4155257a-e125-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4155257a-e125-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 12:49:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BC3BB126;
 Fri, 27 Sep 2019 12:49:33 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-25-jgross@suse.com>
 <d5dbedb2c62b2bec4cfd67c2a447a66fa3c7a279.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6e0f8002-9caa-691f-19e0-ca4eee63c063@suse.com>
Date: Fri, 27 Sep 2019 14:49:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d5dbedb2c62b2bec4cfd67c2a447a66fa3c7a279.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 24/46] xen: switch from for_each_vcpu()
 to for_each_sched_unit()
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDkuMjAxOSAxMTozMiwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gRnJpLCAyMDE5
LTA5LTI3IGF0IDA5OjAwICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBXaGVyZSBhcHBy
b3ByaWF0ZSBzd2l0Y2ggZnJvbSBmb3JfZWFjaF92Y3B1KCkgdG8KPj4gZm9yX2VhY2hfc2NoZWRf
dW5pdCgpCj4+IGluIG9yZGVyIHRvIHByZXBhcmUgY29yZSBzY2hlZHVsaW5nLgo+Pgo+PiBBcyBp
dCBpcyBiZW5lZmljaWFsIG9uY2UgaGVyZSBhbmQgZm9yIHN1cmUgaW4gZnV0dXJlIGFkZCBhCj4+
IHVuaXRfc2NoZWR1bGVyKCkgaGVscGVyIGFuZCBsZXQgdmNwdV9zY2hlZHVsZXIoKSB1c2UgaXQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4K
PiBSZXZpZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KCkFuZCB0
aGUgc21hbGwgbm9uLXNjaGVkdWxlciBjaGFuZ2UgaGVyZQpBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
