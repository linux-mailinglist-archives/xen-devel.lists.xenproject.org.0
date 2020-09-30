Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C14E27EDF6
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 17:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.829.2838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNeRg-0002rb-Ha; Wed, 30 Sep 2020 15:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829.2838; Wed, 30 Sep 2020 15:55:08 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNeRg-0002rC-Dt; Wed, 30 Sep 2020 15:55:08 +0000
Received: by outflank-mailman (input) for mailman id 829;
 Wed, 30 Sep 2020 15:55:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HrGX=DH=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1kNeRe-0002qI-8q
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:55:06 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bda32536-053d-4a9b-b9af-44d4b30145de;
 Wed, 30 Sep 2020 15:55:05 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=HrGX=DH=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
	id 1kNeRe-0002qI-8q
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:55:06 +0000
X-Inumbo-ID: bda32536-053d-4a9b-b9af-44d4b30145de
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id bda32536-053d-4a9b-b9af-44d4b30145de;
	Wed, 30 Sep 2020 15:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601481304;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zzrYign+e+ldn9gBO01TO0yA3HqHycDbFbXdYW2unms=;
  b=AdlGa5j56cyPKZzgzwUg3M/2ByXohLihp7YqAkdSJWaDosLGXgerrUW2
   VTH7+cbqiaX2wr7EMUCcuBnq7vjwvTFUNhTsDlA01/gv4izNmyP6pLS3b
   1lXoOdVjSNurbjMtnikuBoh0FMz/IsfXp3s6aRVTa3YUNTLk71sHsGJfu
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FQKndMVcj8I2Ay5isB1bjeNb2zA2NFzdNB+7Sj/4FV24vG6C48Vp7YkIRFU5ZFHQBtvqVZ6Cio
 /biQOosgkaHPSQm1j4vBQtr8teMdnSxpMkiCes31IZ86xJJeRQcU7Q3JtMPRueG2Ltnq+I9E2D
 /aXNx4sMjXTDAM3JglhfdjRTQbRvLRZMdKhBPbY+K8MiXYBbzc2DbB3xv/zozlNKL1OjQdqxFK
 S21jXNmR6XYF6OtjJtIZhxdVKS6juLwZyIhLPYauxMPfFTQu8jBWIynT/YJblXuKD4eMcFa7Zy
 WcM=
X-SBRS: None
X-MesageID: 28256490
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28256490"
From: Edwin Torok <edvin.torok@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Christian Lindig <christian.lindig@citrix.com>, Roger Pau Monne
	<roger.pau@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>, "JBeulich@suse.com"
	<JBeulich@suse.com>, "wl@xen.org" <wl@xen.org>, "iwj@xenproject.org"
	<iwj@xenproject.org>
Subject: Re: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Thread-Topic: [PATCH 3/8] xen/domctl: Introduce and use
 XEN_DOMCTL_CDF_nested_virt
Thread-Index: AQHWly+mlyDVk2iUSkmQ4hhsZwHZnqmBNDQA
Date: Wed, 30 Sep 2020 15:55:00 +0000
Message-ID: <6d960fdffcaf7fc7d64dcb065ec09941d3d47e43.camel@citrix.com>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
	 <20200930134248.4918-4-andrew.cooper3@citrix.com>
In-Reply-To: <20200930134248.4918-4-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <3211788CB2AE664AB3C05DB9DFDB0446@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gV2VkLCAyMDIwLTA5LTMwIGF0IDE0OjQyICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBMaWtlIG90aGVyIG1ham9yIGFyZWFzIG9mIGZ1bmN0aW9uYWxpdHksIG5lc3RlZCB2aXJ0IChv
ciBub3QpIG5lZWRzDQo+IHRvIGJlDQo+IGtub3duIGF0IGRvbWFpbiBjcmVhdGlvbiB0aW1lIGZv
ciBzZW5zaWJsZSBDUFVJRCBoYW5kbGluZywgYW5kIHdhbnRzDQo+IHRvIGJlDQo+IGtub3duIHRo
aXMgZWFybHkgZm9yIHNlbnNpYmxlIGluZnJhc3RydWN0dXJlIGhhbmRsaW5nIGluIFhlbi4NCj4g
DQo+IEludHJvZHVjZSBYRU5fRE9NQ1RMX0NERl9uZXN0ZWRfdmlydCBhbmQgbW9kaWZ5IGxpYnhs
IHRvIHNldCBpdA0KPiBhcHByb3ByaWF0ZWx5DQo+IHdoZW4gY3JlYXRpbmcgZG9tYWlucy4gIFRo
ZXJlIGlzIG5vIG5lZWQgdG8gYWRqdXN0IHRoZSBBUk0gbG9naWMgdG8NCj4gcmVqZWN0IHRoZQ0K
PiB1c2Ugb2YgdGhpcyBuZXcgZmxhZy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIHlldC4N
Cj4gWy4uLl0NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0K
PiBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbA0KPiBpbmRleCA0OTdkZWQ3Y2UyLi5l
ODc4Njk5YjBhIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWwN
Cj4gKysrIGIvdG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1sDQo+IEBAIC02NCw2ICs2NCw3
IEBAIHR5cGUgZG9tYWluX2NyZWF0ZV9mbGFnID0NCj4gIAl8IENERl9PT1NfT0ZGDQo+ICAJfCBD
REZfWFNfRE9NQUlODQo+ICAJfCBDREZfSU9NTVUNCj4gKwl8IENERl9ORVNURURfVklSVA0KPiAg
DQo+ICB0eXBlIGRvbWFpbl9jcmVhdGVfaW9tbXVfb3B0cyA9DQo+ICAJfCBJT01NVV9OT19TSEFS
RVBUDQo+IGRpZmYgLS1naXQgYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+IGIv
dG9vbHMvb2NhbWwvbGlicy94Yy94ZW5jdHJsLm1saQ0KPiBpbmRleCBmN2Y2ZWM1NzBkLi5lNjQ5
MDdkZjhlIDEwMDY0NA0KPiAtLS0gYS90b29scy9vY2FtbC9saWJzL3hjL3hlbmN0cmwubWxpDQo+
ICsrKyBiL3Rvb2xzL29jYW1sL2xpYnMveGMveGVuY3RybC5tbGkNCj4gQEAgLTU3LDYgKzU3LDcg
QEAgdHlwZSBkb21haW5fY3JlYXRlX2ZsYWcgPQ0KPiAgICB8IENERl9PT1NfT0ZGDQo+ICAgIHwg
Q0RGX1hTX0RPTUFJTg0KPiAgICB8IENERl9JT01NVQ0KPiArICB8IENERl9ORVNURURfVklSVA0K
DQpPQ2FtbCBjaGFuZ2VzIExHVE0uDQpKdXN0IGEgcmVtaW5kZXIgdGhhdCB3ZSdsbCBuZWVkIHRv
IGFwcGx5IHRoZSB4ZW5jdHJsIGNoYW5nZXMgdG8gdGhlDQptb2NrIHhlbmN0cmwgdXNlZCBieSB0
aGUgeGFwaS1wcm9qZWN0IENJIGF0IA0KaHR0cHM6Ly9naXRodWIuY29tL2xpbmRpZy94ZW5jdHJs
IHRvby4NCg0KQmVzdCByZWdhcmRzLA0KLS1FZHdpbg0K

