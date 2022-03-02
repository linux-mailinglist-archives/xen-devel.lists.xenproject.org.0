Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACC4CA91D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282360.481048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQzB-0006Sk-DJ; Wed, 02 Mar 2022 15:33:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282360.481048; Wed, 02 Mar 2022 15:33:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQzB-0006PE-94; Wed, 02 Mar 2022 15:33:53 +0000
Received: by outflank-mailman (input) for mailman id 282360;
 Wed, 02 Mar 2022 15:33:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sydv=TN=amazon.de=prvs=053930d30=doebel@srs-se1.protection.inumbo.net>)
 id 1nPQz9-0006Ox-VV
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:33:51 +0000
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27be76b3-9a3e-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 16:33:49 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-6002.iad6.amazon.com with ESMTP; 02 Mar 2022 15:33:38 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-b27d4a00.us-east-1.amazon.com (Postfix) with
 ESMTPS id DC28D810B9; Wed,  2 Mar 2022 15:33:36 +0000 (UTC)
Received: from EX13D03EUC002.ant.amazon.com (10.43.164.60) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Wed, 2 Mar 2022 15:33:35 +0000
Received: from EX13D03EUC002.ant.amazon.com ([10.43.164.60]) by
 EX13D03EUC002.ant.amazon.com ([10.43.164.60]) with mapi id 15.00.1497.028;
 Wed, 2 Mar 2022 15:33:35 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 27be76b3-9a3e-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646235230; x=1677771230;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:mime-version:content-transfer-encoding:subject;
  bh=ibqaci7WSd3i0zZKWuTdO5RE4KcOfudQ884kPSuzPf4=;
  b=A8CYEy2GJvtzKBfHQBx01TiBQgWhNPuzkeLMUx/9FpGavsffTVMu4xKI
   5C4mAzEIy88rKQ7QeNtr7S/AMAICGZgW4YQgbhnhA5KA4LjDGvkLafmSr
   l4KiBEjRP/yOgGsJtqtwI7cV7w0dTfC9lefai61Kl0RatUGbkRnBN1n/d
   A=;
X-IronPort-AV: E=Sophos;i="5.90,149,1643673600"; 
   d="scan'208";a="181121017"
Subject: Re: [PATCH 2/4] livepatch: improve rune for fetching of Build ID
Thread-Topic: [PATCH 2/4] livepatch: improve rune for fetching of Build ID
From: "Doebel, Bjoern" <doebel@amazon.de>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "julien@xen.org"
	<julien@xen.org>, "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrrix.com>
Thread-Index: AQHYLkHj9LWrV4sIVU2Vyf7rjRMtcqysSgEA
Date: Wed, 2 Mar 2022 15:33:34 +0000
Message-ID: <041F8844-D0C8-448B-9126-F5B3EADD2B8C@amazon.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-3-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-3-roger.pau@citrix.com>
Accept-Language: en-US, de-DE
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4671759490103F4D9F65A9763A6AB787@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64

ICAgIFRoZSBjdXJyZW50IG9uZSBpcyBicm9rZW4gd2l0aCBteSB2ZXJzaW9uIG9mIHJlYWRlbGYg
YW5kIHJldHVybnMNCiAgICAnTlRfR05VX0JVSUxEX0lEJy4NCg0KICAgIFNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRycml4LmNvbT4NCiAgICAtLS0NCiAgICAg
UkVBRE1FLm1kIHwgMiArLQ0KICAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkNCg0KICAgIGRpZmYgLS1naXQgYS9SRUFETUUubWQgYi9SRUFETUUubWQNCiAg
ICBpbmRleCBiNDhhM2RmLi45NDhhN2RlIDEwMDY0NA0KICAgIC0tLSBhL1JFQURNRS5tZA0KICAg
ICsrKyBiL1JFQURNRS5tZA0KICAgIEBAIC0xNiw3ICsxNiw3IEBAICQgY3AgLXIgfi9zcmMveGVu
IH4vc3JjL3hlbmJ1aWxkDQogICAgICQgY2Qgfi9zcmMveGVuL3hlbg0KICAgICAkIG1ha2UgbmNv
bmZpZyAjIE1ha2Ugc3VyZSB0byBzZXQgQ09ORklHX0xJVkVQQVRDSD15DQogICAgICQgbWFrZQ0K
ICAgIC0kIEJVSUxESUQ9JChyZWFkZWxmIC1XbiB4ZW4tc3ltcyB8IGF3ayAnL0J1aWxkIElEOi8g
e3ByaW50ICQzfScpDQogICAgKyQgQlVJTERJRD0kKHJlYWRlbGYgLVduIHhlbi1zeW1zIHwgc2Vk
IC1uIC1lICdzL14uKkJ1aWxkIElEOiAvL3AnKQ0KICAgICBgYGANCg0KICAgICBOZXh0LCBidWls
ZCBhIGxpdmUgcGF0Y2gsIHVzaW5nIGEgcGF0Y2ggYW5kIHRoZSBzb3VyY2UsIGJ1aWxkIElELCBh
bmQNCiANCg0KUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+DQoN
CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4
CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpv
bmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVu
dGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


