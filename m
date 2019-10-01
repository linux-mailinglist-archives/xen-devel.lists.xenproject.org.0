Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04081C37CD
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 16:42:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJJF-0002UL-P2; Tue, 01 Oct 2019 14:39:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFJJE-0002UA-4Z
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:39:24 +0000
X-Inumbo-ID: 424b694e-e459-11e9-9702-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 424b694e-e459-11e9-9702-12813bfff9fa;
 Tue, 01 Oct 2019 14:39:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 627F5ADFE;
 Tue,  1 Oct 2019 14:39:22 +0000 (UTC)
To: Dongli Zhang <dongli.zhang@oracle.com>, xen-devel@lists.xenproject.org,
 netdev@vger.kernel.org
References: <1569938201-23620-1-git-send-email-dongli.zhang@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2071a165-c25f-210d-bda3-9090fe0d5c0e@suse.com>
Date: Tue, 1 Oct 2019 16:39:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569938201-23620-1-git-send-email-dongli.zhang@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/1] xen-netfront: do not use ~0U as
 error return value for xennet_fill_frags()
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
Cc: boris.ostrovsky@oracle.com, sstabellini@kernel.org, joe.jin@oracle.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMTU6NTYsIERvbmdsaSBaaGFuZyB3cm90ZToKPiB4ZW5uZXRfZmlsbF9mcmFn
cygpIHVzZXMgfjBVIGFzIHJldHVybiB2YWx1ZSB3aGVuIHRoZSBza19idWZmIGlzIG5vdCBhYmxl
Cj4gdG8gY2FjaGUgZXh0cmEgZnJhZ21lbnRzLiBUaGlzIGlzIGluY29ycmVjdCBiZWNhdXNlIHRo
ZSByZXR1cm4gdHlwZSBvZgo+IHhlbm5ldF9maWxsX2ZyYWdzKCkgaXMgUklOR19JRFggYW5kIDB4
ZmZmZmZmZmYgaXMgYW4gZXhwZWN0ZWQgdmFsdWUgZm9yCj4gcmluZyBidWZmZXIgaW5kZXguCj4g
Cj4gSW4gdGhlIHNpdHVhdGlvbiB3aGVuIHRoZSByc3BfY29ucyBpcyBhcHByb2FjaGluZyAweGZm
ZmZmZmZmLCB0aGUgcmV0dXJuCj4gdmFsdWUgb2YgeGVubmV0X2ZpbGxfZnJhZ3MoKSBtYXkgYmVj
b21lIDB4ZmZmZmZmZmYgd2hpY2ggeGVubmV0X3BvbGwoKSAodGhlCj4gY2FsbGVyKSB3b3VsZCBy
ZWdhcmQgYXMgZXJyb3IuIEFzIGEgcmVzdWx0LCBxdWV1ZS0+cngucnNwX2NvbnMgaXMgc2V0Cj4g
aW5jb3JyZWN0bHkgYmVjYXVzZSBpdCBpcyB1cGRhdGVkIG9ubHkgd2hlbiB0aGVyZSBpcyBlcnJv
ci4gSWYgdGhlcmUgaXMgbm8KPiBlcnJvciwgeGVubmV0X3BvbGwoKSB3b3VsZCBiZSByZXNwb25z
aWJsZSB0byB1cGRhdGUgcXVldWUtPnJ4LnJzcF9jb25zLgo+IEZpbmFsbHksIHF1ZXVlLT5yeC5y
c3BfY29ucyB3b3VsZCBwb2ludCB0byB0aGUgcnggcmluZyBidWZmZXIgZW50cmllcyB3aG9zZQo+
IHF1ZXVlLT5yeF9za2JzW2ldIGFuZCBxdWV1ZS0+Z3JhbnRfcnhfcmVmW2ldIGFyZSBhbHJlYWR5
IGNsZWFyZWQgdG8gTlVMTC4KPiBUaGlzIGxlYWRzIHRvIE5VTEwgcG9pbnRlciBhY2Nlc3MgaW4g
dGhlIG5leHQgaXRlcmF0aW9uIHRvIHByb2Nlc3MgcnggcmluZwo+IGJ1ZmZlciBlbnRyaWVzLgo+
IAo+IFRoZSBzeW1wdG9tIGlzIHNpbWlsYXIgdG8gdGhlIG9uZSBmaXhlZCBpbgo+IGNvbW1pdCAw
MGIzNjg1MDJkMTggKCJ4ZW4tbmV0ZnJvbnQ6IGRvIG5vdCBhc3N1bWUgc2tfYnVmZl9oZWFkIGxp
c3QgaXMKPiBlbXB0eSBpbiBlcnJvciBoYW5kbGluZyIpLgo+IAo+IFRoaXMgcGF0Y2ggY2hhbmdl
cyB0aGUgcmV0dXJuIHR5cGUgb2YgeGVubmV0X2ZpbGxfZnJhZ3MoKSB0byBpbmRpY2F0ZQo+IHdo
ZXRoZXIgaXQgaXMgc3VjY2Vzc2Z1bCBvciBmYWlsZWQuIFRoZSBxdWV1ZS0+cngucnNwX2NvbnMg
d2lsbCBiZQo+IGFsd2F5cyB1cGRhdGVkIGluc2lkZSB0aGlzIGZ1bmN0aW9uLgo+IAo+IEZpeGVz
OiBhZDRmMTVkYzJjNzAgKCJ4ZW4vbmV0ZnJvbnQ6IGRvbid0IGJ1ZyBpbiBjYXNlIG9mIHRvbyBt
YW55IGZyYWdzIikKPiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhhbmcgPGRvbmdsaS56aGFuZ0Bv
cmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
