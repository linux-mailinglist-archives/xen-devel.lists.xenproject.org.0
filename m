Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6485617A8D6
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 16:29:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9sNS-0006uo-65; Thu, 05 Mar 2020 15:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9sNQ-0006uh-Ce
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 15:25:32 +0000
X-Inumbo-ID: 8d05cea4-5ef5-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8d05cea4-5ef5-11ea-8eb5-bc764e2007e4;
 Thu, 05 Mar 2020 15:25:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7DF5EAD48;
 Thu,  5 Mar 2020 15:25:30 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f6bf0ce-045f-6c6c-fd98-bba72bcf89d1@suse.com>
Date: Thu, 5 Mar 2020 16:25:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200213125449.14226-5-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/8] xen: add locks with timeouts for
 keyhandlers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMzo1NCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBNb3N0IGtleWhhbmRs
ZXJzIGFyZSB1c2VkIHRvIGR1bXAgaHlwZXJ2aXNvciBkYXRhIHRvIHRoZSBjb25zb2xlIGFuZAo+
IHRoZXkgYXJlIHVzZWQgbW9zdGx5IGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuIEluIHRob3NlIGNh
c2VzIGl0IG1pZ2h0Cj4gaGFwcGVuIHRoYXQgc29tZSBkYXRhIHN0cnVjdHVyZXMgYXJlIGxvY2tl
ZCBhbmQgdGh1cyBhcmUgYmxvY2tpbmcgdGhlCj4gaGFuZGxlciB0byBhY2Nlc3MgdGhlIGRhdGEu
Cj4gCj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzdGlsbCBnZXQgc29tZSBpbmZvcm1hdGlvbiBk
b24ndCB1c2UgcGxhaW4KPiBsb2NraW5nIGZ1bmN0aW9ucyBpbiB0aGUga2V5aGFuZGxlcnMsIGJ1
dCBhIHZhcmlhbnQgb2YgdHJ5bG9ja3Mgd2l0aAo+IGEgdGltZW91dCB2YWx1ZS4gVGhpcyBhbGxv
d3MgdG8gd2FpdCBmb3Igc29tZSB0aW1lIGFuZCB0byBnaXZlIHVwIGluCj4gY2FzZSB0aGUgbG9j
ayB3YXMgbm90IG9idGFpbmVkLgo+IAo+IEFkZCB0aGUgbWFpbiBpbmZyYXN0cnVjdHVyZSBmb3Ig
dGhpcyBmZWF0dXJlIGluY2x1ZGluZyBhIG5ldyBydW50aW1lCj4gcGFyYW1ldGVyIGFsbG93aW5n
IHRvIHNwZWNpZnkgdGhlIHRpbWVvdXQgdmFsdWUgaW4gbWlsbGlzZWNvbmRzLgo+IAo+IFVzZSB0
aGUgbmV3IGxvY2tpbmcgc2NoZW1lIGluIHRoZSBoYW5kbGVycyBkZWZpbmVkIGluIGtleWhhbmRs
ZXIuYy4KClBlcnNvbmFsbHkgSSB0aGluayB0cnlsb2NrIChhcyBhbHJlYWR5IHVzZWQgaW4gc29t
ZSBwbGFjZXMpIGlzIHRoZQp3YXkgdG8gZ28uIElpcmMgb3RoZXJzIGRpc2FncmVlZCwgYnV0IGFs
c28gZGlkbid0IGxpa2UgdGhlIGFwcHJvYWNoCnRha2VuIGhlcmUuIEknbSBub3QgaW50ZW5kaW5n
IHRvIHN0YW5kIGluIHRoZSB3YXkgaWYgYSBtYWpvcml0eQphcHByb3ZlcyBvZiB0aGlzIG1vZGVs
LCBidXQgSSdtIG5vdCBnb2luZyB0byBhY2sgdGhlc2UgY2hhbmdlcwpteXNlbGYuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
