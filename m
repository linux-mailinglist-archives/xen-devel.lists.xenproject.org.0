Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9E04CAA15
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:24:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282462.481179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRmM-000392-E4; Wed, 02 Mar 2022 16:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282462.481179; Wed, 02 Mar 2022 16:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRmM-00036T-AG; Wed, 02 Mar 2022 16:24:42 +0000
Received: by outflank-mailman (input) for mailman id 282462;
 Wed, 02 Mar 2022 16:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sydv=TN=amazon.de=prvs=053930d30=doebel@srs-se1.protection.inumbo.net>)
 id 1nPRmK-00036N-Op
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:24:41 +0000
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com
 [207.171.184.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40887a91-9a45-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 17:24:38 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.25.36.214])
 by smtp-border-fw-9102.sea19.amazon.com with ESMTP; 02 Mar 2022 16:24:23 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with
 ESMTPS id 7BB7C81640; Wed,  2 Mar 2022 16:24:20 +0000 (UTC)
Received: from [10.85.98.33] (10.43.166.127) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Wed, 2 Mar
 2022 16:24:18 +0000
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
X-Inumbo-ID: 40887a91-9a45-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646238279; x=1677774279;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/RXTr240dq8/dXMZX9Q5X7Ekf4Q0aMl1fc6FKE5Dphg=;
  b=EaTbCgBKwA5LV/moJaIAoZSt+Yf0D+zCvsrzsUCFZ0QGC5Pml/OQVRxb
   RDHD81uWrvetuUYW+A2wY2CifWLmaJfgQ2XIv7mdGz/rmb0Cmj6UzQ5Pi
   Dw++xuWvoyg6/yWKNPNHw7vvAJcXWQg45uR3M95nLeUqopEk/ANwWnszp
   g=;
X-IronPort-AV: E=Sophos;i="5.90,149,1643673600"; 
   d="scan'208";a="198951410"
Message-ID: <667db455-737b-47c9-bc4b-5729687b384f@amazon.de>
Date: Wed, 2 Mar 2022 17:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 3/4] livepatch: do the initial build using CROSS_COMPILE
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <julien@xen.org>,
	<Andrew.Cooper3@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-4-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220302142711.38953-4-roger.pau@citrix.com>
X-Originating-IP: [10.43.166.127]
X-ClientProxiedBy: EX13D45EUC001.ant.amazon.com (10.43.164.107) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwMi4wMy4yMiAxNToyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmly
bSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4gCj4gU2V0
dGluZyBpdCBhZnRlcndhcmRzIGZvciBmdXJ0aGVyIGJ1aWxkcyB3aWxsIGNhdXNlIHRoZSBidWls
ZCBsb2dpYyB0bwo+IGRldGVjdCBhIGNoYW5nZSBhbmQgdGh1cyBmb3JjZSBhIHJlYnVpbGQgb2Yg
YWxsIHNvdXJjZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gICBsaXZlcGF0Y2gtYnVpbGQgfCAzICsrLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9saXZlcGF0Y2gtYnVpbGQgYi9saXZlcGF0Y2gtYnVpbGQKPiBpbmRleCBlMTcxNWVhLi4z
OGE5MmJlIDEwMDc1NQo+IC0tLSBhL2xpdmVwYXRjaC1idWlsZAo+ICsrKyBiL2xpdmVwYXRjaC1i
dWlsZAo+IEBAIC05Miw3ICs5Miw2IEBAIGZ1bmN0aW9uIGJ1aWxkX3NwZWNpYWwoKQo+ICAgICAg
IGNkICIke1NSQ0RJUn0iIHx8IGRpZQo+IAo+ICAgICAgICMgQ2FwdHVyZSAubyBmaWxlcyBmcm9t
IHRoZSBwYXRjaGVkIGJ1aWxkCj4gLSAgICBleHBvcnQgQ1JPU1NfQ09NUElMRT0iJHtUT09MU0RJ
Un0vbGl2ZXBhdGNoLWdjYyAiCj4gICAgICAgZXhwb3J0IExJVkVQQVRDSF9CVUlMRF9ESVI9IiQo
cHdkKS8iCj4gICAgICAgZXhwb3J0IExJVkVQQVRDSF9DQVBUVVJFX0RJUj0iJE9VVFBVVC8ke25h
bWV9Igo+ICAgICAgIG1rZGlyIC1wICIkTElWRVBBVENIX0NBUFRVUkVfRElSIgo+IEBAIC00MDgs
NiArNDA3LDggQEAgaWYgWyAiJHtTS0lQfSIgIT0gImJ1aWxkIiBdOyB0aGVuCj4gICAgICAgICAg
IFhFTl9ERUJVRz0iZGVidWc9JFhFTl9ERUJVRyIKPiAgICAgICBmaQo+IAo+ICsgICAgZXhwb3J0
IENST1NTX0NPTVBJTEU9IiR7VE9PTFNESVJ9L2xpdmVwYXRjaC1nY2MgIgo+ICsKPiAgICAgICBl
Y2hvICJQZXJmb3JtIGZ1bGwgaW5pdGlhbCBidWlsZCB3aXRoICR7Q1BVU30gQ1BVKHMpLi4uIgo+
ICAgICAgIGJ1aWxkX2Z1bGwKPiAKClJldmlld2VkLWJ5OiBCam9lcm4gRG9lYmVsIDxkb2ViZWxA
YW1hem9uLmRlPgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1
c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2No
bGFlZ2VyLCBKb25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90
dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIz
NyA4NzkKCgo=


