Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1A4151403
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 02:43:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iynDP-0003Z9-Lg; Tue, 04 Feb 2020 01:41:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0Mmy=3Y=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iynDO-0003Z3-0V
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 01:41:22 +0000
X-Inumbo-ID: 713fbf40-46ef-11ea-b211-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 713fbf40-46ef-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 01:41:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 17:41:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="278914766"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2020 17:41:19 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:41:12 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 17:40:58 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.76]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 09:40:56 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 3/4] x86/vvmx: don't enable interrupt window when
 using virt intr delivery
Thread-Index: AQHV2ow4fIiMRb5UHEuKszNRUR/Gx6gKQuBA
Date: Tue, 4 Feb 2020 01:40:56 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D765962@SHSMSX104.ccr.corp.intel.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
 <20200203121919.15748-4-roger.pau@citrix.com>
In-Reply-To: <20200203121919.15748-4-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzg2ZGJlNDMtOWI3Mi00YjVhLTk4YzktNzAwZWFmODc4YjBhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiM09iN3ZxbXg1YlpLRm56R1dBZG1mRGxWUkhGbHozZFdwTmRxVFdDY3hLTkU4MUtGVjZpRG1VRHo2dGk2Rld3SSJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 3/4] x86/vvmx: don't enable interrupt
 window when using virt intr delivery
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBN
b25kYXksIEZlYnJ1YXJ5IDMsIDIwMjAgODoxOSBQTQ0KPiANCj4gSWYgdmlydHVhbCBpbnRlcnJ1
cHQgZGVsaXZlcnkgaXMgdXNlZCB0byBpbmplY3QgdGhlIGludGVycnVwdCB0byB0aGUNCj4gZ3Vl
c3QgdGhlIGludGVycnVwdCB3aW5kb3cgc2hvdWxkbid0IGJlIGVuYWJsZWQsIGFzIHRoZSBpbnRl
cnJ1cHQgaXMNCj4gYWxyZWFkeSBpbmplY3RlZCB1c2luZyB0aGUgR1VFU1RfSU5UUl9TVEFUVVMg
dm1jcyBmaWVsZC4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGlu
dGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
