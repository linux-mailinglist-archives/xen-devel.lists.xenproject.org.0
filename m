Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A0615BEC5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:56:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2E0K-0005qz-6e; Thu, 13 Feb 2020 12:54:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3q6q=4B=amazon.co.uk=prvs=305d558ea=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j2E0I-0005qq-TH
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:54:02 +0000
X-Inumbo-ID: e90b63b8-4e5f-11ea-ade5-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e90b63b8-4e5f-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 12:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581598442; x=1613134442;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lNxtX5405xYaRfEpNFDy7o5fwHwyTGLzE/9XOP73LbA=;
 b=i01gZIiqSabq7EHNiDgWXgiVMOcMGqPoWOkiZQjXf/ylnLNtG4zl9/XX
 LEjDgzUq1BcWMllo7ELF2pDRFZO2+fIYarl+jSeV3QEqtHAW2IvVnIQrk
 ubOWVmj+vnsBXStmHm3Ojgr4yfbZpWToFS9wA1EQLQxB5HPEp0TM0dQHC U=;
IronPort-SDR: LnRMt6WwN52aie3wHTDDjElifWDccEjeudZtNp6eHVWC8V4ta3o89164asgQlrgl3DwfVXl5fo
 CC4NL1kB/GHQ==
X-IronPort-AV: E=Sophos;i="5.70,436,1574121600"; d="scan'208";a="16939802"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-81e76b79.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 13 Feb 2020 12:53:49 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-81e76b79.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3FB42A1C97; Thu, 13 Feb 2020 12:53:49 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 13 Feb 2020 12:53:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 13 Feb 2020 12:53:48 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 13 Feb 2020 12:53:47 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
Thread-Index: AQHV2oCoSQ6jJjHUtUGr3S6VkEPAzagN2XmQgAAFMgCAAAcEMIALPgrQ
Date: Thu, 13 Feb 2020 12:53:47 +0000
Message-ID: <80b062bbac5f4b48ad31dd7b6676c3bf@EX13D32EUC003.ant.amazon.com>
References: <20200203105654.22998-1-pdurrant@amazon.com>
 <fe250b28cc42442c86fdb108e1702c45@EX13D32EUC003.ant.amazon.com>
 <97420ba1-ecc1-8545-d36b-8d67d6ac226a@suse.com>
 <91137906fece4250abbdf7ccad975cdf@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <91137906fece4250abbdf7ccad975cdf@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.77]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v9 0/4] purge free_shared_domheap_page()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KW3NuaXBdDQo+IA0KPiBPaywgdGhhbmtzLiBL
ZXZpbiBoYXMgY29tcGxldGVkIGhpcyBhY2tzIChwYXRjaGVzICMxIGFuZCAjNCkuDQo+IA0KPiBH
ZW9yZ2UsIEp1bGllbiwgVGltLA0KPiANCj4gICBDYW4gSSBoYXZlIGFja3Mgb3Igb3RoZXJ3aXNl
LCBwbGVhc2U/DQo+IA0KDQpJIGhhdmUgYWNrcyBmcm9tIEp1bGllbiBhbmQgVGltLiBHZW9yZ2Us
IGNhbiB5b3UgYWNrIG9yIG90aGVyd2lzZSBwbGVhc2U/DQoNCiAgUGF1bCANCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
