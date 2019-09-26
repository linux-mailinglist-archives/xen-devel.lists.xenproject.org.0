Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E433CBF589
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 17:09:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDVM2-0005AN-Sy; Thu, 26 Sep 2019 15:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDVM0-0005AI-N1
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 15:06:48 +0000
X-Inumbo-ID: 42437286-e06f-11e9-9658-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 42437286-e06f-11e9-9658-12813bfff9fa;
 Thu, 26 Sep 2019 15:06:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97E2CAED6;
 Thu, 26 Sep 2019 15:06:46 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190926150238.1910-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7333c1c-b27a-69db-b7e9-262481405f6e@suse.com>
Date: Thu, 26 Sep 2019 17:06:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNzowMiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiB2Y3B1X3J1bnN0YXRl
X2dldCgpIHNob3VsZCBuZXZlciByZXR1cm4gYSBzdGF0ZSBlbnRyeSB0aW1lIHdpdGgKPiBYRU5f
UlVOU1RBVEVfVVBEQVRFIHNldC4gVG8gYXZvaWQgdGhpcyBsZXQgdXBkYXRlX3J1bnN0YXRlX2Fy
ZWEoKQo+IG9wZXJhdGUgb24gYSBsb2NhbCBydW5zdGF0ZSBjb3B5Lgo+IAo+IEFzIGl0IGlzIHJl
cXVpcmVkIHRvIGZpcnN0IHNldCB0aGUgWEVOX1JVTlNUQVRFX1VQREFURSBpbmRpY2F0b3IgaW4K
PiBndWVzdCBtZW1vcnksIHRoZW4gdXBkYXRlIGFsbCB0aGUgcnVuc3RhdGUgZGF0YSwgYW5kIHRo
ZW4gYXQgbGFzdAo+IGNsZWFyIHRoZSBYRU5fUlVOU1RBVEVfVVBEQVRFIGFnYWluIGl0IGlzIG11
Y2ggbGVzcyBlZmZvcnQgdG8gaGF2ZQo+IGEgbG9jYWwgY29weSBvZiB0aGUgcnVuc3RhdGUgZGF0
YSBpbnN0ZWFkIG9mIGtlZXBpbmcgb25seSBhIGNvcHkgb2YKPiBzdGF0ZV9lbnRyeV90aW1lLgo+
IAo+IFRoaXMgcHJvYmxlbSB3YXMgaW50cm9kdWNlZCB3aXRoIGNvbW1pdCAyNTI5Yzg1MGVhNDhm
MDM2ICgiYWRkIHVwZGF0ZQo+IGluZGljYXRvciB0byB2Y3B1X3J1bnN0YXRlX2luZm8iKS4KPiAK
PiBSZXBvcnRlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgpBbmQgeWV0
IGFub3RoZXIgdGltZQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
