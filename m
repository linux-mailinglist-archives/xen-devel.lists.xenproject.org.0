Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3FB4CA94C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:42:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282376.481069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPR6o-0000T5-Eh; Wed, 02 Mar 2022 15:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282376.481069; Wed, 02 Mar 2022 15:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPR6o-0000PZ-A0; Wed, 02 Mar 2022 15:41:46 +0000
Received: by outflank-mailman (input) for mailman id 282376;
 Wed, 02 Mar 2022 15:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sydv=TN=amazon.de=prvs=053930d30=doebel@srs-se1.protection.inumbo.net>)
 id 1nPR6n-0000PT-5I
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:41:45 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4264face-9a3f-11ec-8539-5f4723681683;
 Wed, 02 Mar 2022 16:41:44 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-7d0c7241.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 02 Mar 2022 15:41:42 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-pdx-2c-7d0c7241.us-west-2.amazon.com (Postfix) with
 ESMTPS id 527CF41870; Wed,  2 Mar 2022 15:41:39 +0000 (UTC)
Received: from [10.85.98.33] (10.43.164.197) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.28; Wed, 2 Mar
 2022 15:41:37 +0000
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
X-Inumbo-ID: 4264face-9a3f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646235704; x=1677771704;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=1uk/DSu/NPJuNzMKyaxe3cqibXXxR+rj5TpFZV0/LKE=;
  b=RZbTI3aWoEVH6BBuKyh2aI2g6WJUjMSzo5yOru7yUUBsEIjsdVLWcDGt
   fF5IprU50/kSQwB7v1xgiDnY360VZ+pohUPTEG8tqCQwZiLVTnOoZodQM
   bmpKWG9EWptkg6Zy5JqDWCiT0/vLp8VynTdhdtbpzhwzxQfzAmWlHT5zE
   k=;
X-IronPort-AV: E=Sophos;i="5.90,149,1643673600"; 
   d="scan'208";a="177887057"
Subject: Re: [PATCH 4/4] livepatch: differentiate between old and new build systems
Message-ID: <459241b5-d412-d2e3-0f23-6094db87535a@amazon.de>
Date: Wed, 2 Mar 2022 16:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: <ross.lagerwall@citrix.com>, <konrad.wilk@oracle.com>, <julien@xen.org>,
	<Andrew.Cooper3@citrix.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-5-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220302142711.38953-5-roger.pau@citrix.com>
X-Originating-IP: [10.43.164.197]
X-ClientProxiedBy: EX13D02EUC004.ant.amazon.com (10.43.164.117) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMDIuMDMuMjIgMTU6MjcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0g
dGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+IAo+IAo+IAo+IERvIG5v
dCBhdHRlbXB0IHRvIG1vZGlmeSB0aGUgYnVpbGQgc3lzdGVtIGlmIENGTEFHUyBhcmUgbm90IHNl
dCBpbgo+IFJ1bGVzLm1rLCBhbmQgaW5zdGVhZCByZWx5IG9uIENPTkZJR19MSVZFUEFUQ0ggYWxy
ZWFkeSBzZXR0aW5nCj4gLWZ7ZnVuY3Rpb24sZGF0YX0tc2VjdGlvbnMuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gLS0tCj4gVGhp
cyBkZXBlbmRzIG9uIGdldHRpbmcgdGhlIHBhdGNoIHRvIGFkZCAtZntmdW5jdGlvbixkYXRhfS1z
ZWN0aW9ucwo+IHdoZW4gdXNpbmcgQ09ORklHX0xJVkVQQVRDSCBhY2NlcHRlZC4KPiAtLS0KPiAg
IGxpdmVwYXRjaC1idWlsZCB8IDIyICsrKysrKysrKysrKysrLS0tLS0tLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9saXZlcGF0Y2gtYnVpbGQgYi9saXZlcGF0Y2gtYnVpbGQKPiBpbmRleCAzOGE5MmJlLi42NTZj
ZGFjIDEwMDc1NQo+IC0tLSBhL2xpdmVwYXRjaC1idWlsZAo+ICsrKyBiL2xpdmVwYXRjaC1idWls
ZAo+IEBAIC05OCwxNCArOTgsMjAgQEAgZnVuY3Rpb24gYnVpbGRfc3BlY2lhbCgpCj4gCj4gICAg
ICAgIyBCdWlsZCB3aXRoIHNwZWNpYWwgR0NDIGZsYWdzCj4gICAgICAgY2QgIiR7U1JDRElSfS94
ZW4iIHx8IGRpZQo+IC0gICAgc2VkIC1pICdzL0NGTEFHUyArPSAtbm9zdGRpbmMvQ0ZMQUdTICs9
IC1ub3N0ZGluYyAtZmZ1bmN0aW9uLXNlY3Rpb25zIC1mZGF0YS1zZWN0aW9ucy8nIFJ1bGVzLm1r
Cj4gLSAgICBjcCAtcCBhcmNoL3g4Ni9NYWtlZmlsZSBhcmNoL3g4Ni9NYWtlZmlsZS5iYWsKPiAt
ICAgIHNlZCAtaSAncy8tLXNlY3Rpb24tYWxpZ25tZW50PTB4MjAwMDAwLy0tc2VjdGlvbi1hbGln
bm1lbnQ9MHgxMDAwLycgYXJjaC94ODYvTWFrZWZpbGUKPiAtICAgICMgUmVzdG9yZSB0aW1lc3Rh
bXBzIHRvIHByZXZlbnQgc3B1cmlvdXMgcmVidWlsZGluZwo+IC0gICAgdG91Y2ggLS1yZWZlcmVu
Y2U9YXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2VmaWxlCj4gLSAgICBtYWtlICIt
aiRDUFVTIiAkWEVOX0RFQlVHICY+ICIke09VVFBVVH0vYnVpbGRfJHtuYW1lfV9jb21waWxlLmxv
ZyIgfHwgZGllCj4gLSAgICBzZWQgLWkgJ3MvQ0ZMQUdTICs9IC1ub3N0ZGluYyAtZmZ1bmN0aW9u
LXNlY3Rpb25zIC1mZGF0YS1zZWN0aW9ucy9DRkxBR1MgKz0gLW5vc3RkaW5jLycgUnVsZXMubWsK
PiAtICAgIG12IC1mIGFyY2gveDg2L01ha2VmaWxlLmJhayBhcmNoL3g4Ni9NYWtlZmlsZQo+ICsg
ICAgaWYgZ3JlcCAtcSAnbm9zdGRpbmMnIFJ1bGVzLm1rOyB0aGVuCgpUaGlzIG1lYW5zIHdlIGFy
ZSBzdGlsbCBicmVha2luZyBsaXZlcGF0Y2ggYnVpbGRzIGZvciBhbGwgWGVuIHZlcnNpb25zIApi
ZXR3ZWVuIHlvdXIgcmVjZW50IHBhdGNoIGFuZCB0aGUgb3JpZ2luYWwgcGF0Y2ggdGhhdCBtb3Zl
ZCBDRkxBR1MgdG8gCnhlbi9NYWtlZmlsZSAoY29tbWl0IDI3NDBkOTZlZmRkMzAwOWY4YWRiNDBh
YWNkYmNmMDVjZmU4ZDFiYmIsIEZyaSBBcHIgCjI0IDE0OjU3OjEwIDIwMjAgKzAyMDApLgoKSXMg
dGhpcyBhY2NlcHRhYmxlPyAoSSBtZWFuLCBubyBvbmUgc2VlbXMgdG8gaGF2ZSBub3RpY2VkLi4u
KQoKPiArICAgICAgICAgIyBTdXBwb3J0IGZvciBvbGQgYnVpbGQgc3lzdGVtLCBhdHRlbXB0IHRv
IHNldCAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucyBhbmQgcmVidWlsZAo+ICsgICAgICAgIHNl
ZCAtaSAncy9DRkxBR1MgKz0gLW5vc3RkaW5jL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5jdGlv
bi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMvJyBSdWxlcy5tawo+ICsgICAgICAgIGNwIC1wIGFy
Y2gveDg2L01ha2VmaWxlIGFyY2gveDg2L01ha2VmaWxlLmJhawo+ICsgICAgICAgIHNlZCAtaSAn
cy8tLXNlY3Rpb24tYWxpZ25tZW50PTB4MjAwMDAwLy0tc2VjdGlvbi1hbGlnbm1lbnQ9MHgxMDAw
LycgYXJjaC94ODYvTWFrZWZpbGUKPiArICAgICAgICAjIFJlc3RvcmUgdGltZXN0YW1wcyB0byBw
cmV2ZW50IHNwdXJpb3VzIHJlYnVpbGRpbmcKPiArICAgICAgICB0b3VjaCAtLXJlZmVyZW5jZT1h
cmNoL3g4Ni9NYWtlZmlsZS5iYWsgYXJjaC94ODYvTWFrZWZpbGUKPiArICAgICAgICBtYWtlICIt
aiRDUFVTIiAkWEVOX0RFQlVHICY+ICIke09VVFBVVH0vYnVpbGRfJHtuYW1lfV9jb21waWxlLmxv
ZyIgfHwgZGllCj4gKyAgICAgICAgc2VkIC1pICdzL0NGTEFHUyArPSAtbm9zdGRpbmMgLWZmdW5j
dGlvbi1zZWN0aW9ucyAtZmRhdGEtc2VjdGlvbnMvQ0ZMQUdTICs9IC1ub3N0ZGluYy8nIFJ1bGVz
Lm1rCj4gKyAgICAgICAgbXYgLWYgYXJjaC94ODYvTWFrZWZpbGUuYmFrIGFyY2gveDg2L01ha2Vm
aWxlCj4gKyAgICBlbHNlCj4gKyAgICAgICAgIyAtZntmdW5jdGlvbixkYXRhfS1zZWN0aW9ucyBz
ZXQgYnkgQ09ORklHX0xJVkVQQVRDSAo+ICsgICAgICAgIG1ha2UgIi1qJENQVVMiICRYRU5fREVC
VUcgJj4gIiR7T1VUUFVUfS9idWlsZF8ke25hbWV9X2NvbXBpbGUubG9nIiB8fCBkaWUKPiArICAg
IGZpCj4gCj4gICAgICAgdW5zZXQgTElWRVBBVENIX0JVSUxEX0RJUgo+ICAgICAgIHVuc2V0IExJ
VkVQQVRDSF9DQVBUVVJFX0RJUgoKQmpvZXJuCgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIg
R2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1
bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


