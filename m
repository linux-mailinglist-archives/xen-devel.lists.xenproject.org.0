Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA12B21C8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Nov 2020 18:16:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.26811.55315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcg6-0002YS-5D; Fri, 13 Nov 2020 17:16:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 26811.55315; Fri, 13 Nov 2020 17:16:02 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdcg6-0002Y3-1M; Fri, 13 Nov 2020 17:16:02 +0000
Received: by outflank-mailman (input) for mailman id 26811;
 Fri, 13 Nov 2020 17:16:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
 id 1kdcg4-0002Xw-FO
 for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:16:00 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b84f65a2-de3d-42fa-b0c7-610ba2afca55;
 Fri, 13 Nov 2020 17:15:59 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7f73527.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 13 Nov 2020 16:51:13 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1e-c7f73527.us-east-1.amazon.com (Postfix) with ESMTPS
 id F12C7B2C71; Fri, 13 Nov 2020 16:51:11 +0000 (UTC)
Received: from [192.168.31.251] (10.43.162.50) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 13 Nov 2020 16:51:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=EgAG=ET=amazon.de=prvs=579e99c79=doebel@srs-us1.protection.inumbo.net>)
	id 1kdcg4-0002Xw-FO
	for xen-devel@lists.xenproject.org; Fri, 13 Nov 2020 17:16:00 +0000
X-Inumbo-ID: b84f65a2-de3d-42fa-b0c7-610ba2afca55
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b84f65a2-de3d-42fa-b0c7-610ba2afca55;
	Fri, 13 Nov 2020 17:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1605287760; x=1636823760;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Z8RkLCygUZ9uffdO4CgEDopjHE/cbAn5BcNhzPPDyQA=;
  b=r9M8Bq3Tk2z583F2Wxvclrq6kHAv2c8GPPSYYRziAH2Ei8D7hMxaDv+A
   f1PCWF/cMa+mGYAxsR7q9MtrSvxkv3XCe0X3WAM/WXc15uaJRl2eHl5c9
   6tJgDGv5CzkYzB6JORkH1m1k0qyKsbYGzQUmdE00NoMSkRrK5NbMY1gxL
   g=;
X-IronPort-AV: E=Sophos;i="5.77,476,1596499200"; 
   d="scan'208";a="95102610"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-1e-c7f73527.us-east-1.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP; 13 Nov 2020 16:51:13 +0000
Received: from EX13D03EUC002.ant.amazon.com (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
	by email-inbound-relay-1e-c7f73527.us-east-1.amazon.com (Postfix) with ESMTPS id F12C7B2C71;
	Fri, 13 Nov 2020 16:51:11 +0000 (UTC)
Received: from [192.168.31.251] (10.43.162.50) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 13 Nov
 2020 16:51:08 +0000
Subject: Re: [XEN PATCH] tools/xenstore: Log xenstored build ID on startup
To: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <jgrall@amazon.co.uk>, Eslam Elnikety <elnikety@amazon.de>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>
References: <20201113141823.58712-1-doebel@amazon.de>
 <b61119da-b6e8-7746-9298-54bf60da88ea@suse.com>
From: Bjoern Doebel <doebel@amazon.de>
Message-ID: <90212fe0-4cdb-61b3-2da0-c31ab5aeb89e@amazon.de>
Date: Fri, 13 Nov 2020 17:51:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <b61119da-b6e8-7746-9298-54bf60da88ea@suse.com>
Content-Language: en-GB
X-Originating-IP: [10.43.162.50]
X-ClientProxiedBy: EX13D24UWB001.ant.amazon.com (10.43.161.93) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjAgMTU6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjExLjIwMjAgMTU6
MTgsIEJqb2VybiBEb2ViZWwgd3JvdGU6Cj4+IC0tLSBhL3Rvb2xzL3hlbnN0b3JlL01ha2VmaWxl
Cj4+ICsrKyBiL3Rvb2xzL3hlbnN0b3JlL01ha2VmaWxlCj4+IEBAIC02Niw2ICs2NiwxMCBAQCAk
KFhFTlNUT1JFRF9PQkpTKTogQ0ZMQUdTICs9ICQoU1lTVEVNRF9DRkxBR1MpCj4+ICAgeGVuc3Rv
cmVkOiBMREZMQUdTICs9ICQoU1lTVEVNRF9MSUJTKQo+PiAgIGVuZGlmCj4+Cj4+ICsjIHhlbnN0
b3JlZDogZW5mb3JjZSBjcmVhdGlvbiBvZiBhIGJ1aWxkSUQgc2VjdGlvbiBhbmQgdXNlIGEgbGlu
a2VyCj4+ICsjIHNjcmlwdCB0byBhZGQgYWRkaXRpb25hbCBzeW1ib2xzIGFyb3VuZCB0aGF0IHNl
Y3Rpb24KPj4gK3hlbnN0b3JlZDogTERGTEFHUyArPSAgLVdsLC0tYnVpbGQtaWQ9c2hhMSAtV2ws
LVQsYnVpbGRpZF9zeW1ib2xzLmxkCj4gU2luY2UgaW4gdGhlIGh5cGVydmlzb3IgYnVpbGQgd2Un
cmUgY2FyZWZ1bCB0byBub3QgdXNlIC0tYnVpbGQtaWQKPiB3aGVuIHRoZSBsaW5rZXIgZG9lc24n
dCBzdXBwb3J0IGl0LCBJIHN1cHBvc2UgdGhlIHNhbWUgY2FyZSBuZWVkcwo+IGFwcGx5aW5nIGhl
cmUuIFNlZSB0aGUgc2V0dGluZyBvZiBidWlsZF9pZF9saW5rZXIgaW4gLi9Db25maWcubWsuCgpP
aywgSSB3aWxsIG1ha2UgdGhpcyBjb25kaXRpb25hbCBvbiB0aGUgc2V0dGluZyBvZiAkKGJ1aWxk
X2lkX2xpbmtlcikuCgo+Cj4gSmFuCgpCam9lcm4KCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50
ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVl
aHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFt
IEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJs
aW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


