Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC5BF5A5
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:14:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVQa-0006FO-06; Thu, 26 Sep 2019 15:11:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDVQY-0006FD-Iq
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:11:30 +0000
X-Inumbo-ID: ea742df6-e06f-11e9-9658-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id ea742df6-e06f-11e9-9658-12813bfff9fa;
 Thu, 26 Sep 2019 15:11:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E05A528;
 Thu, 26 Sep 2019 08:11:28 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56C243F534;
 Thu, 26 Sep 2019 08:11:27 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190926150238.1910-1-jgross@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8d6edf1c-096c-f395-db1f-6594b94db822@arm.com>
Date: Thu, 26 Sep 2019 16:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926150238.1910-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/sched: don't let XEN_RUNSTATE_UPDATE
 leak into vcpu_runstate_get()
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDkvMjYvMTkgNDowMiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2
Y3B1X3J1bnN0YXRlX2dldCgpIHNob3VsZCBuZXZlciByZXR1cm4gYSBzdGF0ZSBlbnRyeSB0aW1l
IHdpdGgKPiBYRU5fUlVOU1RBVEVfVVBEQVRFIHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRl
X3J1bnN0YXRlX2FyZWEoKQo+IG9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lgo+IAo+
IEFzIGl0IGlzIHJlcXVpcmVkIHRvIGZpcnN0IHNldCB0aGUgWEVOX1JVTlNUQVRFX1VQREFURSBp
bmRpY2F0b3IgaW4KPiBndWVzdCBtZW1vcnksIHRoZW4gdXBkYXRlIGFsbCB0aGUgcnVuc3RhdGUg
ZGF0YSwgYW5kIHRoZW4gYXQgbGFzdAo+IGNsZWFyIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFIGFn
YWluIGl0IGlzIG11Y2ggbGVzcyBlZmZvcnQgdG8gaGF2ZQo+IGEgbG9jYWwgY29weSBvZiB0aGUg
cnVuc3RhdGUgZGF0YSBpbnN0ZWFkIG9mIGtlZXBpbmcgb25seSBhIGNvcHkgb2YKPiBzdGF0ZV9l
bnRyeV90aW1lLgo+IAo+IFRoaXMgcHJvYmxlbSB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCAy
NTI5Yzg1MGVhNDhmMDM2ICgiYWRkIHVwZGF0ZQo+IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRl
X2luZm8iKS4KPiAKPiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
