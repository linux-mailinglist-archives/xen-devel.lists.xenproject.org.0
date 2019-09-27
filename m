Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3254DC0703
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 16:08:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDqry-0002RX-52; Fri, 27 Sep 2019 14:05:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAPT=XW=amazon.com=prvs=166d6d219=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDqrw-0002RS-MX
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 14:05:12 +0000
X-Inumbo-ID: d1f3af66-e12f-11e9-967a-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by localhost (Halon) with ESMTPS
 id d1f3af66-e12f-11e9-967a-12813bfff9fa;
 Fri, 27 Sep 2019 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569593111; x=1601129111;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=DTzEZOygJJ1l6HWlgGgHJxappEsqHFgKJIRJQBi9Vt0=;
 b=o5UABkWnZoGilcYsbFH6eSeH/TE5clo5tyZGVaX/ZkXPrWVSZOcmtD+U
 6eYEZ6mFE1VnmRbqXyRlouOaMZf3hROY2SjolgL34/z/uJrwlklZyPPqJ
 c8eQqz6b34STf/eNkEst8MFxTyRl4UsmcIlT6ts3NM/8PPI30xXMdMe38 E=;
X-IronPort-AV: E=Sophos;i="5.64,555,1559520000"; d="scan'208";a="837364124"
Received: from sea3-co-svc-lb6-vlan2.sea.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.47.22.34])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 27 Sep 2019 14:02:29 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id C26E5A1864; Fri, 27 Sep 2019 14:02:13 +0000 (UTC)
Received: from EX13D16UWB002.ant.amazon.com (10.43.161.234) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 14:02:13 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D16UWB002.ant.amazon.com (10.43.161.234) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 14:02:13 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 27 Sep 2019 14:02:11 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
 <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
 <d9cc437b-add6-3a71-be44-c5d5b74b9d8f@suse.com>
From: <hongyax@amazon.com>
Message-ID: <6d410229-a7b9-22dc-3708-90d1ae9d728a@amazon.com>
Date: Fri, 27 Sep 2019 15:02:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d9cc437b-add6-3a71-be44-c5d5b74b9d8f@suse.com>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcvMDkvMjAxOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjcuMDkuMjAxOSAx
NDo1NCwgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IAo+IFByZS1wb3B1bGF0ZT8gVGhlcmUn
cyBzb21lIGNvbmNlcHRpb25hbCBxdWVzdGlvbiB0aGVuOiBXaGVuIHRoZQo+IGRpcmVjdCBtYXAg
aXMgZ29uZSwgYXJlIHlvdSBtYXBwaW5nIFhlbiBoZWFwIHBhZ2VzIGludG8gdGhlIHBsYWNlCj4g
dGhleSdkIGhhdmUgbGl2ZWQgYXQgaW4gdGhlIGRpcmVjdCBtYXA/IEknbSBub3QgY29udmluY2Vk
IHRoYXQncwo+IHdoYXQgd2Ugd2FudC4gSW4gZmFjdCBJJ20gbm90IGNvbnZpbmNlZCB3ZSdkIHdh
bnQgdG8gcmV0YWluIHRoZQo+IGRpc3RpbmN0aW9uIGJldHdlZW4gWGVuIGhlYXAgYW5kIGRvbWFp
biBoZWFwIHRoZW4gYW55IGZ1cnRoZXIgLQo+IHRoZXJlJ3Mgbm8gcmVhc29uIGFueW1vcmUgYXQg
dGhhdCBwb2ludCAoYWZhaWN0KS4KClllcy4gTXkgcGF0Y2hlcyBtYXAgeGVuaGVhcCBwYWdlcyB0
byB3aGVyZSB0aGV5IHdvdWxkIGhhdmUgbGl2ZWQgb24gdGhlIGRpcmVjdCAKbWFwIHJlZ2lvbiwg
YW5kIHVubWFwIHdoZW4geGVuaGVhcCBwYWdlcyBhcmUgZnJlZWQuIFRoZSBvcmlnaW5hbCBwcm9w
b3NhbCB3YXMgCnRvIHVzZSB2bWFwKCkgd2hpY2ggd2UgZmluZCBkaWZmaWN1bHQgdG8gaW1wbGVt
ZW50LgoKLSB2bWFwIHRha2VzIGFuIGFycmF5IG9mIG1mbnMuIE1hcHBpbmcgYSBsYXJnZSByZWdp
b24gcmVxdWlyZSAKYWxsb2NhdGluZy9mcmVlaW5nIG1lbW9yeSBmb3IgYSBsYXJnZSBhcnJheSBv
ZiBtZm5zLCB1bmxlc3Mgd2UgY2hhbmdlIG9yIGFkZCAKYW5vdGhlciB2bWFwIHZhcmlhbnQuCi0g
dmE8LT5wYSBjb252ZXJzaW9uLiBNYXBwaW5nIHhlbmhlYXAgdG8gZGlyZWN0IG1hcCByZWdpb24g
bWFrZXMgYWxsIHRoZSAKeGVuaGVhcCBjb252ZXJzaW9uIG1hY3JvcyBzdGlsbCB3b3JrLiBUaGUg
dm1hcCBwcm9wb3NhbCBuZWVkcyB0byBhZGQgYW5vdGhlciAKZmllbGQgaW4gcGFnZV9pbmZvIChi
cmVha2luZyB0aGUgcG93ZXIgb2YgMikgb3IgdG8gaGF2ZSBhIHNlcGFyYXRlIHN0cnVjdHVyZSAK
c29tZXdoZXJlIGVsc2UgZm9yIHZhL3BhIGNvbnZlcnNpb24uCgpPZiBjb3Vyc2UsIHdlIGNvdWxk
IGNoYW5nZSBhbGwgdGhlIGNvZGUgZm9yIHhlbmhlYXAgdG8gdXNlIHRoZSBzYW1lIGRvbWhlYXAg
Cm1hcHBpbmcgc3RydWN0dXJlLCB3aGljaCBpcyBwcm9iYWJseSBhbm90aGVyIGxhcmdlIHBhdGNo
IHNlcmllcy4KCkhvbmd5YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
