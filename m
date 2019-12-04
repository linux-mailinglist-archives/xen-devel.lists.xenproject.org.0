Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A250112F87
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 17:05:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icX7D-0004dw-SV; Wed, 04 Dec 2019 16:02:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=R9pO=Z2=amazon.com=prvs=2347cf4ab=jgrall@srs-us1.protection.inumbo.net>)
 id 1icX7B-0004dp-K8
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 16:02:57 +0000
X-Inumbo-ID: 891af4d8-16af-11ea-8206-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 891af4d8-16af-11ea-8206-12813bfff9fa;
 Wed, 04 Dec 2019 16:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575475376; x=1607011376;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hSF6V0pMxzwsgWyIV66UAX8pFZrRuLFfgwUHX6tIdtU=;
 b=B3fI9imuFM+QyV5FgPKQpR6MnUBTh7urVwi/AsRcCbNOxKDXpQtW0pJk
 iq0f+H/d3yZk9M0hd1stUUK9Nc7pujyjRW5eWD85IbPGEdN4yLxl8n4f5
 b+MYplZdsJoBt9i/XZmPviNJNeE6EkpsC7n7lc+MXxZVJzj02+Um33vQ4 Y=;
IronPort-SDR: JxdyXIweOlqxMa9t9o3taKnZfS9MJpOUuwfo0DZuSmwG7Rwpvb9AjswhrAZaxOWCdGXNhMgTVN
 t7Myp1l/FBPA==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="6199413"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 04 Dec 2019 16:02:53 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 75413240B6A; Wed,  4 Dec 2019 16:02:51 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 16:02:50 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 4 Dec 2019 16:02:49 +0000
Received: from a483e7b01a66.ant.amazon.com (10.125.106.66) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server id
 15.0.1367.3 via Frontend Transport; Wed, 4 Dec 2019 16:02:46 +0000
To: Boris Ostrovsky <BORIS.OSTROVSKY@ORACLE.COM>
References: <20191128093828.8462-1-pdurrant@amazon.com>
 <33cd176f-074f-9c3a-1ba6-7a1b40f604ed@suse.com>
 <b39e656f-47a2-0132-1dd4-e6a3a9c3607a@oracle.com>
 <6992520f-c191-8282-d0f2-74713cfe0e54@amazon.com>
 <14C0E8CA-60F6-4903-8AC5-A7285F283A4E@ORACLE.COM>
From: Julien Grall <jgrall@amazon.com>
Message-ID: <e17569a6-d47c-63e7-e11d-9920435b711a@amazon.com>
Date: Wed, 4 Dec 2019 16:02:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <14C0E8CA-60F6-4903-8AC5-A7285F283A4E@ORACLE.COM>
Content-Language: en-GB
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] xen/x86: vpmu: Unmap per-vCPU PMU page
 when the domain is destroyed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwNC8xMi8yMDE5IDE1OjU5LCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gCj4gCj4+IE9u
IERlYyA0LCAyMDE5LCBhdCAxMDo1NSBBTSwgSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4gd3JvdGU6Cj4+Cj4+IEhpIEJvcmlzLAo+Pgo+PiBPbiAyOC8xMS8yMDE5IDIxOjUwLCBCb3Jp
cyBPc3Ryb3Zza3kgd3JvdGU6Cj4+PiBPbiAxMS8yOC8xOSA1OjIzIEFNLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4+PiBPbiAyOC4xMS4yMDE5IDEwOjM4LCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+Pj4K
Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS92cG11LmMKPj4+Pj4gKysrIGIveGVuL2FyY2gv
eDg2L2NwdS92cG11LmMKPj4+Pj4gQEAgLTU3NiwxMSArNTc2LDM2IEBAIHN0YXRpYyB2b2lkIHZw
bXVfYXJjaF9kZXN0cm95KHN0cnVjdCB2Y3B1ICp2KQo+Pj4+PiAgICAgICAgICAgICAgdnBtdS0+
YXJjaF92cG11X29wcy0+YXJjaF92cG11X2Rlc3Ryb3kodik7Cj4+Pj4+ICAgICAgIH0KPj4+Pj4g
Kwo+Pj4+PiArICAgIHZwbXVfcmVzZXQodnBtdSwgVlBNVV9DT05URVhUX0FMTE9DQVRFRCk7Cj4+
Pj4+ICAgfQo+Pj4+IEJvcmlzLCB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIC0gYXJlIHlvdSBpbiBh
Z3JlZW1lbnQgd2l0aCB0aGlzCj4+Pj4gY2hhbmdlLCBub3cgdGhhdCB0aGUgc2V0dGluZyBvZiB0
aGUgZmxhZyBpcyBiZWluZyBsZWZ0IHVudG91Y2hlZD8KPj4+IFllcywgdGhpcyBpcyBmaW5lLgo+
Pgo+PiBDYW4gd2UgdGFrZSB0aGlzIGFzIGFuIEFDSz8KPiAKPiAKPiBZZXMsIG9mIGNvdXJzZS4K
ClRoYW5rIHlvdSEKCkBBbmRyZXcsIEBKYW46IHRoaXMgaXMgeDg2IGNvZGUsIGJ1dCBJIGFtIGhh
cHB5IHRvIGNvbW1pdCBpdCBpZiB5b3UgcHJlZmVyLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
