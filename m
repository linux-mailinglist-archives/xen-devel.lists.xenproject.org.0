Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E74CAA18
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 17:26:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282468.481190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRnV-0003jy-O9; Wed, 02 Mar 2022 16:25:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282468.481190; Wed, 02 Mar 2022 16:25:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPRnV-0003hX-KD; Wed, 02 Mar 2022 16:25:53 +0000
Received: by outflank-mailman (input) for mailman id 282468;
 Wed, 02 Mar 2022 16:25:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sydv=TN=amazon.de=prvs=053930d30=doebel@srs-se1.protection.inumbo.net>)
 id 1nPRnU-0003hN-0S
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 16:25:52 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b785e72-9a45-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 17:25:50 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1a-1ac2810f.us-east-1.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 02 Mar 2022 16:25:21 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1a-1ac2810f.us-east-1.amazon.com (Postfix) with
 ESMTPS id 1CD6181313; Wed,  2 Mar 2022 16:25:19 +0000 (UTC)
Received: from [10.85.98.33] (10.43.166.127) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Wed, 2 Mar
 2022 16:25:18 +0000
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
X-Inumbo-ID: 6b785e72-9a45-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646238350; x=1677774350;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=IShwUKZBNS2hmzlTxIY7r401dk03n4mPa9d2S0msMZc=;
  b=ZGYXXs5BBwWyrRP+qrCLHGpjkMia4OHv3sT6unA5kRmxAF2r4zdkFbwH
   SiywB8Qx1EUJo7GO45pvZNzFCqnk8Cb9+ZDzrofjLGf78x3jYsj4j5Jdz
   S0L3mtOKAo2EqcH+3rrJhrLCwetoyoHVrFOowlZdf4GUXWgDAvbxzISm7
   Q=;
X-IronPort-AV: E=Sophos;i="5.90,149,1643673600"; 
   d="scan'208";a="996183590"
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build systems
Message-ID: <b9724d0c-d8bc-5142-5fa5-59376d20445b@amazon.de>
Date: Wed, 2 Mar 2022 17:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <julien@xen.org>,
	<Andrew.Cooper3@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220302142711.38953-5-roger.pau@citrix.com>
X-Originating-IP: [10.43.166.127]
X-ClientProxiedBy: EX13D51EUC001.ant.amazon.com (10.43.164.111) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwMi4wMy4yMiAxNToyNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmly
bSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4gCj4gRG8g
bm90IGF0dGVtcHQgdG8gbW9kaWZ5IHRoZSBidWlsZCBzeXN0ZW0gaWYgQ0ZMQUdTIGFyZSBub3Qg
c2V0IGluCj4gUnVsZXMubWssIGFuZCBpbnN0ZWFkIHJlbHkgb24gQ09ORklHX0xJVkVQQVRDSCBh
bHJlYWR5IHNldHRpbmcKPiAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAtLS0KPiBU
aGlzIGRlcGVuZHMgb24gZ2V0dGluZyB0aGUgcGF0Y2ggdG8gYWRkIC1me2Z1bmN0aW9uLGRhdGF9
LXNlY3Rpb25zCj4gd2hlbiB1c2luZyBDT05GSUdfTElWRVBBVENIIGFjY2VwdGVkLgo+IC0tLQo+
ICAgbGl2ZXBhdGNoLWJ1aWxkIHwgMjIgKysrKysrKysrKysrKystLS0tLS0tLQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2xpdmVwYXRjaC1idWlsZCBiL2xpdmVwYXRjaC1idWlsZAo+IGluZGV4IDM4YTkyYmUuLjY1
NmNkYWMgMTAwNzU1Cj4gLS0tIGEvbGl2ZXBhdGNoLWJ1aWxkCj4gKysrIGIvbGl2ZXBhdGNoLWJ1
aWxkCj4gQEAgLTk4LDE0ICs5OCwyMCBAQCBmdW5jdGlvbiBidWlsZF9zcGVjaWFsKCkKPiAKPiAg
ICAgICAjIEJ1aWxkIHdpdGggc3BlY2lhbCBHQ0MgZmxhZ3MKPiAgICAgICBjZCAiJHtTUkNESVJ9
L3hlbiIgfHwgZGllCj4gLSAgICBzZWQgLWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYy9DRkxBR1Mg
Kz0gLW5vc3RkaW5jIC1mZnVuY3Rpb24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zLycgUnVsZXMu
bWsKPiAtICAgIGNwIC1wIGFyY2gveDg2L01ha2VmaWxlIGFyY2gveDg2L01ha2VmaWxlLmJhawo+
IC0gICAgc2VkIC1pICdzLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgyMDAwMDAvLS1zZWN0aW9uLWFs
aWdubWVudD0weDEwMDAvJyBhcmNoL3g4Ni9NYWtlZmlsZQo+IC0gICAgIyBSZXN0b3JlIHRpbWVz
dGFtcHMgdG8gcHJldmVudCBzcHVyaW91cyByZWJ1aWxkaW5nCj4gLSAgICB0b3VjaCAtLXJlZmVy
ZW5jZT1hcmNoL3g4Ni9NYWtlZmlsZS5iYWsgYXJjaC94ODYvTWFrZWZpbGUKPiAtICAgIG1ha2Ug
Ii1qJENQVVMiICRYRU5fREVCVUcgJj4gIiR7T1VUUFVUfS9idWlsZF8ke25hbWV9X2NvbXBpbGUu
bG9nIiB8fCBkaWUKPiAtICAgIHNlZCAtaSAncy9DRkxBR1MgKz0gLW5vc3RkaW5jIC1mZnVuY3Rp
b24tc2VjdGlvbnMgLWZkYXRhLXNlY3Rpb25zL0NGTEFHUyArPSAtbm9zdGRpbmMvJyBSdWxlcy5t
awo+IC0gICAgbXYgLWYgYXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2VmaWxlCj4g
KyAgICBpZiBncmVwIC1xICdub3N0ZGluYycgUnVsZXMubWs7IHRoZW4KPiArICAgICAgICAgIyBT
dXBwb3J0IGZvciBvbGQgYnVpbGQgc3lzdGVtLCBhdHRlbXB0IHRvIHNldCAtZntmdW5jdGlvbixk
YXRhfS1zZWN0aW9ucyBhbmQgcmVidWlsZAo+ICsgICAgICAgIHNlZCAtaSAncy9DRkxBR1MgKz0g
LW5vc3RkaW5jL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRhdGEt
c2VjdGlvbnMvJyBSdWxlcy5tawo+ICsgICAgICAgIGNwIC1wIGFyY2gveDg2L01ha2VmaWxlIGFy
Y2gveDg2L01ha2VmaWxlLmJhawo+ICsgICAgICAgIHNlZCAtaSAncy8tLXNlY3Rpb24tYWxpZ25t
ZW50PTB4MjAwMDAwLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgxMDAwLycgYXJjaC94ODYvTWFrZWZp
bGUKPiArICAgICAgICAjIFJlc3RvcmUgdGltZXN0YW1wcyB0byBwcmV2ZW50IHNwdXJpb3VzIHJl
YnVpbGRpbmcKPiArICAgICAgICB0b3VjaCAtLXJlZmVyZW5jZT1hcmNoL3g4Ni9NYWtlZmlsZS5i
YWsgYXJjaC94ODYvTWFrZWZpbGUKPiArICAgICAgICBtYWtlICItaiRDUFVTIiAkWEVOX0RFQlVH
ICY+ICIke09VVFBVVH0vYnVpbGRfJHtuYW1lfV9jb21waWxlLmxvZyIgfHwgZGllCj4gKyAgICAg
ICAgc2VkIC1pICdzL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5jdGlvbi1zZWN0aW9ucyAtZmRh
dGEtc2VjdGlvbnMvQ0ZMQUdTICs9IC1ub3N0ZGluYy8nIFJ1bGVzLm1rCj4gKyAgICAgICAgbXYg
LWYgYXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2VmaWxlCj4gKyAgICBlbHNlCj4g
KyAgICAgICAgIyAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucyBzZXQgYnkgQ09ORklHX0xJVkVQ
QVRDSAo+ICsgICAgICAgIG1ha2UgIi1qJENQVVMiICRYRU5fREVCVUcgJj4gIiR7T1VUUFVUfS9i
dWlsZF8ke25hbWV9X2NvbXBpbGUubG9nIiB8fCBkaWUKPiArICAgIGZpCj4gCj4gICAgICAgdW5z
ZXQgTElWRVBBVENIX0JVSUxEX0RJUgo+ICAgICAgIHVuc2V0IExJVkVQQVRDSF9DQVBUVVJFX0RJ
UgoKUmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+CgpDb25maXJt
aW5nIHRoYXQgSSBjYW4gYnVpbGQgYSBsaXZlcGF0Y2ggYWdhaW5zdCB1cHN0cmVhbSBtYXN0ZXIg
d2l0aCAKeW91ciBzZXJpZXMgYW5kIHRoZSBvdGhlciBDT05GSUdfTElWRVBBVENIIHBhdGNoLgoK
CgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAox
MDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBKb25h
dGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRl
ciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


