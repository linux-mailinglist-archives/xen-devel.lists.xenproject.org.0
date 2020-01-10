Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07613647C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 01:57:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipiZM-00053u-8M; Fri, 10 Jan 2020 00:54:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Oz4b=27=amazon.com=prvs=271b483db=anchalag@srs-us1.protection.inumbo.net>)
 id 1ipiZL-00053p-49
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 00:54:31 +0000
X-Inumbo-ID: bda7df76-3343-11ea-b89f-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bda7df76-3343-11ea-b89f-bc764e2007e4;
 Fri, 10 Jan 2020 00:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1578617663; x=1610153663;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=gFWTLYKX2wEcgFfZMvELsMKmvJakxFojhlZCDgHoKHg=;
 b=U7GKw8Jhmg28KGS2rH3tbfnmhFi2Shc9gGMHZFzICGLHJdE/Eobu19B8
 lWijGG8pNWbEeGxLBXOIzUbDtDsVwP38ccgEHdFUzwQStmC4Hd8JypjE1
 7GQJ0KAxFnDu+V7xj0tBhBe5x+OOHMjYOtpGOmscWaNWtzkqCcAXuSvOH M=;
IronPort-SDR: vrQ2rPHO9WRjY8NbeMG8xCyVhFjs61ZAlZ1Xu5GgYue07j+xSBWWpbZpefhBRW+H/Yq4LaxKAh
 CmVfjKPeYQZQ==
X-IronPort-AV: E=Sophos;i="5.69,414,1571702400"; d="scan'208";a="12337450"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-397e131e.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 10 Jan 2020 00:54:20 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-397e131e.us-west-2.amazon.com (Postfix) with ESMTPS
 id 61930A01F7; Fri, 10 Jan 2020 00:54:18 +0000 (UTC)
Received: from EX13D01UWB001.ant.amazon.com (10.43.161.75) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 00:54:12 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13d01UWB001.ant.amazon.com (10.43.161.75) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 10 Jan 2020 00:54:12 +0000
Received: from dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com
 (172.22.96.68) by mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP
 Server id 15.0.1367.3 via Frontend Transport; Fri, 10 Jan 2020 00:54:12 +0000
Received: by dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com (Postfix,
 from userid 4335130)
 id A7D9340E78; Fri, 10 Jan 2020 00:54:12 +0000 (UTC)
Date: Fri, 10 Jan 2020 00:54:12 +0000
From: Anchal Agarwal <anchalag@amazon.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200110005412.GA2095@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
References: <20200107233720.GA17906@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
 <88721569-d425-8df3-2ab2-3aa9155b326c@oracle.com>
 <b0392e02-c783-8aaa-ab5e-8e29385fa281@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0392e02-c783-8aaa-ab5e-8e29385fa281@oracle.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH V2 01/11] xen/manage: keep track of the
 on-going suspend mode
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: konrad.wilk@oracle.co, eduval@amazon.com, peterz@infradead.org,
 x86@kernel.org, linux-mm@kvack.org, axboe@kernel.dk, pavel@ucw.cz,
 hpa@zytor.com, sstabellini@kernel.org, fllinden@amaozn.com, kamatam@amazon.com,
 mingo@redhat.com, xen-devel@lists.xenproject.org, sblbir@amazon.com,
 len.brown@intel.com, linux-pm@vger.kernel.org, anchalag@amazon.com,
 bp@alien8.de, tglx@linutronix.de, jgross@suse.com, netdev@vger.kernel.org,
 Woodhouse@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, vkuznets@redhat.com, davem@davemloft.net,
 dwmw@amazon.co.uk, roger.pau@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDY6NDk6MDdQTSAtMDUwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IAo+IAo+IE9uIDEvOS8yMCA2OjQ2IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6
Cj4gPgo+ID4KPiA+T24gMS83LzIwIDY6MzcgUE0sIEFuY2hhbCBBZ2Fyd2FsIHdyb3RlOgo+ID4+
Kwo+ID4+K3N0YXRpYyBpbnQgeGVuX3NldHVwX3BtX25vdGlmaWVyKHZvaWQpCj4gPj4rewo+ID4+
K8KgwqDCoCBpZiAoIXhlbl9odm1fZG9tYWluKCkpCj4gPj4rwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9ERVY7Cj4gPgo+ID5BUk0gZ3Vlc3RzIGFyZSBhbHNvIEhWTSBkb21haW5zLiBJcyBpdCBP
SyBmb3IgdGhlbSB0byByZWdpc3RlciB0aGUKPiA+bm90aWZpZXI/IFRoZSBkaWZmc3RhdCBzdWdn
ZXN0cyB0aGF0IHlvdSBhcmUgc3VwcG9ydGluZyBBUk0uCj4gCj4gSSBvYnZpb3VzbHkgbWVhbnQg
Km5vdCogc3VwcG9ydGluZyBBUk0sIHNvcnJ5Lgo+IAo+IC1ib3Jpcwo+IAo+ID4KPiA+LWJvcmlz
Cj4gPgoKVEJILCBJIGhhdmUgbm90IHlldCBleHBlcmltZW50ZWQgd2l0aCB0aGVzZSBwYXRjaGVz
IG9uCkFSTSBndWVzdCB5ZXQgYnV0IHRoYXQgd2lsbCBiZSB0aGUgbmV4dCBzdGVwLiBUaGUgc2Ft
ZSAKY29kZSB3aXRoIGNoYW5nZXMgYXMgbmVlZGVkIHNob3VsZCBiZSBtYWRlIHRvIHdvcmsgZm9y
IEFSTS4KQ3VycmVudGx5IEkgYW0gZm9jdXNzZWQgb24gZ2V0dGluZyBhIHNhbmUgc2V0IG9mIApw
YXRjaGVzIGludG8gbWFpbmxpbmUgZm9yIHg4NiBndWVzdHMuCgpUaGFua3MsCgpBbmNoYWwKCj4g
Pj4rCj4gPj4rwqDCoMKgIHJldHVybiByZWdpc3Rlcl9wbV9ub3RpZmllcigmeGVuX3BtX25vdGlm
aWVyX2Jsb2NrKTsKPiA+Pit9Cj4gPj4KPiA+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
