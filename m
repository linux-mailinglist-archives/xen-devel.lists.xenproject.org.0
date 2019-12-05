Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEF1113F53
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 11:25:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icoGn-000549-OC; Thu, 05 Dec 2019 10:22:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY9/=Z3=amazon.com=prvs=2352ce6fd=hongyxia@srs-us1.protection.inumbo.net>)
 id 1icoGm-000544-DQ
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 10:22:00 +0000
X-Inumbo-ID: 12100e56-1749-11ea-821d-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12100e56-1749-11ea-821d-12813bfff9fa;
 Thu, 05 Dec 2019 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575541319; x=1607077319;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=06imSNjoxGlETe8YWjtZe2R3tChk3ZomAiThdZdAIQ4=;
 b=BkqH9ufI/QAZIKYl97IRNCJybqKG3lQNkxP1NpdkiyX1b5KxvV7DW0dE
 YDA/dO+/yGFuhMwl8jrtMVdAS5WvVb8xlO0kDiOgNq7rFCNnnyRtVE8tX
 ArbmaNQrB5ihUyrTYLn+D9WSBMIQ+VJxaUyYi6Gri1IiBo38ErKDqfN0e Y=;
IronPort-SDR: URIBmvW5GjzfZHz1aXvPTAbtSbm6hlxnLlyi7A9D2aQOX2bx+ag+ZAAMCBYtPg0qX+cSx0dxRK
 UH+/bJpEa+ug==
X-IronPort-AV: E=Sophos;i="5.69,281,1571702400"; 
   d="scan'208";a="6320985"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-2225282c.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 05 Dec 2019 10:21:58 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-2225282c.us-west-2.amazon.com (Postfix) with ESMTPS
 id 60998A1812; Thu,  5 Dec 2019 10:21:57 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 10:21:56 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 5 Dec 2019 10:21:56 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Thu, 5 Dec 2019 10:21:56 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
Thread-Index: AQHVqsZfUUkkwnnLd0eTJfD97tMSLaerVhWA
Date: Thu, 5 Dec 2019 10:21:56 +0000
Message-ID: <f13c0e4808e320a0233f82b9be005fe5b2679469.camel@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
In-Reply-To: <3885863bfc54a5f5f05cddb3cd9afe24897f27b3.1575477921.git.hongyxia@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.67]
Content-ID: <253E5C701C6DC946A4675682EF7C3A9A@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pk9uIDAyLjEwLjIwMTkgMTk6MTYsIEhvbmd5YW4gWGlhIHdyb3RlOg0KPj4gV2Ugd2lsbCBzb29u
IG5lZWQgdG8gY2xlYW4gdXAgbWFwcGluZ3Mgd2hlbmV2ZXIgdGhlIG91dCBtb3N0IGxvb3AgaXMN
Cj4+IGVuZGVkLiBBZGQgYSBuZXcgbGFiZWwgYW5kIHR1cm4gcmVsZXZhbnQgY29udGludWUncyBp
bnRvIGdvdG8ncy4NCj4NCj5JIHRoaW5rIGFscmVhZHkgd2hlbiB0aGlzIHN0aWxsIHdhcyBSRkMg
SSBkaWQgaW5kaWNhdGUgdGhhdCBJJ20gbm90DQo+aGFwcHkgYWJvdXQgdGhlIGludHJvZHVjdGlv
biBvZiB0aGVzZSBsYWJlbHMgKGluY2x1ZGluZyBhbHNvIHBhdGNoIDgpLg0KPkkgcmVhbGl6ZSBp
dCdzIHF1aXRlIGEgbG90IHRvIGFzaywgYnV0IGJvdGggZnVuY3Rpb25zIHdvdWxkIGJlbmVmaXQN
Cj5mcm9tIHNwbGl0dGluZyB1cCBpbnRvIHBlci1sZXZlbCBoZWxwZXIgZnVuY3Rpb25zLCB3aGlj
aCAtIGFmYWljdCAtDQo+d291bGQgYXZvaWQgdGhlIG5lZWQgZm9yIHN1Y2ggbGFiZWxzLCBhbmQg
d2hpY2ggd291bGQgYXQgdGhlIHNhbWUNCj50aW1lIGxpa2VseSBtYWtlIGl0IHF1aXRlIGEgYml0
IGVhc2llciB0byBleHRlbmQgdGhlc2UgdG8gdGhlDQo+NS1sZXZlbCBwYWdlIHRhYmxlcyBjYXNl
IGRvd24gdGhlIHJvYWQuDQo+DQo+VGhvdWdodHM/DQo+DQo+SmFuDQoNCkEgY29tbW9uIHBhdHRl
cm4gSSBoYXZlIGZvdW5kIHdoZW4gbWFwcGluZyBQVEUgcGFnZXMgb24tZGVtYW5kIChhbmQgSQ0K
dGhpbmsgaXMgdGhlIGV4YWN0IGludGVudGlvbiBvZiB0aGVzZSBsYWJlbHMgZnJvbSBXZWksIGFs
c28gZGVzY3JpYmVkDQppbiB0aGUgY29tbWl0IG1lc3NhZ2UpIGlzIHRoYXQgd2Ugb2Z0ZW4gbmVl
ZCB0byBkbzoNCg0KbWFwIHNvbWUgcGFnZXMgLSBwcm9jZXNzIHRob3NlIHBhZ2VzIC0gZXJyb3Ig
b2NjdXJzIG9yIHRoaXMgaXRlcmF0aW9uDQpvZiBsb29wIGNhbiBiZSBza2lwcGVkIC0gX2NsZWFu
IHVwIHRoZSBtYXBwaW5nc18gLSBjb250aW51ZSBvciByZXR1cm4NCg0KQXMgbG9uZyBhcyBjbGVh
bmluZyB1cCBpcyByZXF1aXJlZCwgdGhlc2UgbGFiZWxzIHdpbGwgbGlrZWx5IGJlIG5lZWRlZA0K
YXMgdGhlIGNsZWFuLXVwIHBhdGggYmVmb3JlIHNraXBwaW5nIG9yIHJldHVybmluZywgc28gSSB3
b3VsZCBzYXkgd2UNCndpbGwgc2VlIHN1Y2ggbGFiZWxzIGV2ZW4gaWYgd2Ugc3BsaXQgaXQgaW50
byBoZWxwZXIgZnVuY3Rpb25zDQoodmlydF90b194ZW5fbFsxMjNdZSgpIGxhdGVyIGluIHRoZSBw
YXRjaCBzZXJpZXMgaXMgYW4gZXhhbXBsZSkuIEkgc2VlDQp0aGUgbGFiZWxzIG1vcmUgb3IgbGVz
cyBhcyBvcnRob2dvbmFsIHRvIG1vZHVsYXJpc2luZyBpbnRvIGhlbHBlcg0KZnVuY3Rpb25zLg0K
DQpJIHdvdWxkIGFsc28gbGlrZSB0byBzZWUgc29tZSBoZWxwZXJzIGJlY2F1c2UgdGhlc2UgZnVu
Y3Rpb25zIGFyZQ0KZ2V0dGluZyB0b28gbG9uZyBhbmQgY29udm9sdXRlZCwgYnV0IEkgd29uZGVy
IGlmIHRoZXkgY291bGQgYmUgYW5vdGhlcg0KbWluaS1zZXJpZXMgb3V0c2lkZSB0aGUgZGlyZWN0
bWFwLXJlbW92YWwgc2VyaWVzLg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
