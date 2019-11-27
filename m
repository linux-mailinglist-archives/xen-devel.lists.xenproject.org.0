Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600110AF2A
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 13:00:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvwr-00068K-QI; Wed, 27 Nov 2019 11:57:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zG0R=ZT=amazon.com=prvs=22792133f=jgrall@srs-us1.protection.inumbo.net>)
 id 1iZvHk-0001hZ-G3
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:15:04 +0000
X-Inumbo-ID: 2938499c-1107-11ea-a3af-12813bfff9fa
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2938499c-1107-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 11:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574853305; x=1606389305;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aunqLIm/BR7H78uE1OOE7F31RDA+rbq96xojW1eWROc=;
 b=Z2MDd1rGV9/mcOsOnWEsnotTSgUcAERVnF2O6W1FUdESerAPTk9+C/rm
 jppXhzZkeAQRaI5y2E/rLIMyd1F0683qjtmNfDTVtbLgKRfvPLI/iRB7p
 dI3n4LVB541svJE99b8jD3c4de/RurBkno+07uXu2J8ir0Mmi8NFuHDvB 8=;
IronPort-SDR: 1JovmmZtIJ2lmiLhgu+uFeM1SFBOKPv7tHcbx3ZnG/rGFA6YXCodFzroD24Cw7pTc55e1GgURJ
 kWzYGpDFY0rQ==
X-IronPort-AV: E=Sophos;i="5.69,249,1571702400"; 
   d="scan'208";a="6060710"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.124.125.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 27 Nov 2019 11:15:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7344A1C44; Wed, 27 Nov 2019 11:14:59 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:14:59 +0000
Received: from EX13MTAUEB001.ant.amazon.com (10.43.60.96) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 27 Nov 2019 11:14:58 +0000
Received: from a483e7b01a66.ant.amazon.com (10.125.106.64) by
 mail-relay.amazon.com (10.43.60.129) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 27 Nov 2019 11:14:57 +0000
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191126171715.10881-1-pdurrant@amazon.com>
 <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <06f26e5b-d921-1796-391e-d0ec2ae0a3a4@amazon.com>
Date: Wed, 27 Nov 2019 11:14:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <afa87ca4-ecda-82d7-7c99-4dcf807ddd6d@suse.com>
Content-Language: en-GB
Precedence: Bulk
X-Mailman-Approved-At: Wed, 27 Nov 2019 11:57:31 +0000
Subject: Re: [Xen-devel] [PATCH] xen/x86: vpmu: Unmap per-vCPU PMU page when
 the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNy8xMS8yMDE5IDA5OjQ0LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNi4xMS4y
MDE5IDE4OjE3LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdy
YWxsQGFtYXpvbi5jb20+Cj4+Cj4+IEEgZ3Vlc3Qgd2lsbCBzZXR1cCBhIHNoYXJlZCBwYWdlIHdp
dGggdGhlIGh5cGVydmlzb3IgZm9yIGVhY2ggdkNQVSB2aWEKPj4gWEVOUE1VX2luaXQuIFRoZSBw
YWdlIHdpbGwgdGhlbiBnZXQgbWFwcGVkIGluIHRoZSBoeXBlcnZpc29yIGFuZCBvbmx5Cj4+IHJl
bGVhc2VkIHdoZW4gWEVNUE1VX2ZpbmlzaCBpcyBjYWxsZWQuCj4+Cj4+IFRoaXMgbWVhbnMgdGhh
dCBpZiB0aGUgZ3Vlc3QgaXMgbm90IHNodXRkb3duIGdyYWNlZnVsbHkgKHN1Y2ggYXMgdmlhIHhs
Cj4+IGRlc3Ryb3kpLCB0aGUgcGFnZSB3aWxsIHN0YXkgbWFwcGVkIGluIHRoZSBoeXBlcnZpc29y
Lgo+IAo+IElzbid0IHRoaXMgc3RpbGwgdG9vIHdlYWsgYSBkZXNjcmlwdGlvbj8gSXQncyBub3Qg
dGhlIHRvb2wgc3RhY2sKPiBpbnZva2luZyBYRU5QTVVfZmluaXNoLCBidXQgdGhlIGd1ZXN0IGl0
c2VsZiBhZmFpY3MuIEkuZS4gYQo+IG1pc2JlaGF2aW5nIGd1ZXN0IGNvdWxkIHByZXZlbnQgcHJv
cGVyIGNsZWFudXAgZXZlbiB3aXRoIGdyYWNlZnVsCj4gc2h1dGRvd24uCj4gCj4+IEBAIC0yMjI0
LDYgKzIyMjEsOSBAQCBpbnQgZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCBkb21h
aW4gKmQpCj4+ICAgICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSApCj4+ICAgICAgICAgICBodm1f
ZG9tYWluX3JlbGlucXVpc2hfcmVzb3VyY2VzKGQpOwo+PiAgIAo+PiArICAgIGZvcl9lYWNoX3Zj
cHUgKCBkLCB2ICkKPj4gKyAgICAgICAgdnBtdV9kZXN0cm95KHYpOwo+PiArCj4+ICAgICAgIHJl
dHVybiAwOwo+PiAgIH0KPiAKPiBJIHRoaW5rIHNpbXBsZSB0aGluZ3Mgd2hpY2ggbWF5IGFsbG93
IHNocmlua2luZyB0aGUgcGFnZSBsaXN0cwo+IHNob3VsZCBiZSBkb25lIGVhcmx5IGluIHRoZSBm
dW5jdGlvbi4gQXMgdnBtdV9kZXN0cm95KCkgbG9va3MKPiB0byBiZSBpZGVtcG90ZW50LCBob3cg
YWJvdXQgbGV2ZXJhZ2luZyB0aGUgdmVyeSBmaXJzdAo+IGZvcl9lYWNoX3ZjcHUoKSBsb29wIGlu
IHRoZSBmdW5jdGlvbiAodGhlcmUgYXJlIHRvbyBtYW55IG9mIHRoZW0KPiB0aGVyZSBhbnl3YXks
IGF0IGxlYXN0IGZvciBteSB0YXN0ZSk/CgpUaGlzIGlzIG5vdCBlbnRpcmVseSBvYnZpb3VzIHRo
YXQgdnBtdV9kZXN0cm95KCkgaXMgaWRlbXBvdGVudC4KCkZvciBpbnN0YW5jZSwgSSBjYW4ndCBm
aW5kIG91dCB3aG8gaXMgY2xlYXJpbmcgVkNQVV9DT05URVhUX0FMTE9DQVRFRC4gCnNvIEkgdGhp
bmsgdmNwdV9hcmNoX2Rlc3Ryb3koKSB3b3VsZCBiZSBleGVjdXRlZCBvdmVyIGFuZCBvdmVyLgoK
SSBkb24ndCBrbm93IHdoZXRoZXIgdGhpcyBpcyBhbiBpc3N1ZSwgYnV0IEkgY2FuJ3QgZmlndXJl
IG91dCB0aGF0IGlzIGl0IApub3Qgb25lLiBEaWQgSSBtaXNzIGFueXRoaW5nPwoKQ2hlZXJzLAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
