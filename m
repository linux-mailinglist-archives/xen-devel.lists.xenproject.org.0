Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48824150178
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 06:36:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyUM3-0004xM-18; Mon, 03 Feb 2020 05:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyUM1-0004xH-IH
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 05:33:01 +0000
X-Inumbo-ID: a32ce75c-4646-11ea-b211-bc764e2007e4
Received: from mga03.intel.com (unknown [134.134.136.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a32ce75c-4646-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 05:32:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Feb 2020 21:32:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,396,1574150400"; d="scan'208";a="248482871"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 02 Feb 2020 21:32:57 -0800
Received: from fmsmsx161.amr.corp.intel.com (10.18.125.9) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 21:32:57 -0800
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 FMSMSX161.amr.corp.intel.com (10.18.125.9) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 2 Feb 2020 21:32:57 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.141]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 13:32:55 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
 <roger.pau@citrix.com>
Thread-Topic: [PATCH] EPT: do away with hidden GUEST_TABLE_MAP_FAILED == 0
 assumptions
Thread-Index: AQHVzVQtuL5DYbrelUexAzgHlDml0qgJC/zg
Date: Mon, 3 Feb 2020 05:32:55 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75E5B1@SHSMSX104.ccr.corp.intel.com>
References: <54929bde-aa1c-598c-6d74-894f387ebd6c@suse.com>
In-Reply-To: <54929bde-aa1c-598c-6d74-894f387ebd6c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDJlODFiMDUtYjI0MS00MzFhLTg2ZjEtZDdhZGIxZjY0NzJiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibDRkelwvdXlhdEpqOWhPaHdyUkRIcERtYktieXRST24ybzR4NmlUOXZQSFE1Z3JCREl6Tzk2WTFJM3NjbmxcLzM3In0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] EPT: do away with hidden
 GUEST_TABLE_MAP_FAILED == 0 assumptions
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5
LCBKYW51YXJ5IDE4LCAyMDIwIDEyOjM2IEFNDQo+IA0KPiBUaGUgY29kZSBpcyBxdWl0ZSBhIGJp
dCBlYXNpZXIgdG8gcmVhZCBhbmQgdG8gcmVhc29uIGFib3V0IHRoaXMgd2F5LA0KPiBJIHRoaW5r
Lg0KPiANCj4gSW4gZXB0X3NldF9lbnRyeSgpIGFkZGl0aW9uYWxseSBjaGFuZ2UgdGhlIGZ1bmN0
aW9uJ3MgcmV0dXJuIHZhbHVlIGluDQo+IHRoZSBNQVBfRkFJTEVEIGNhc2UgdG8gLUVOT01FTTsg
LUVOT0VOVCB3b3VsZCBiZSBhcHBsaWNhYmxlIG9ubHkgd2hlbg0KPiBlcHRfbmV4dF9lbnRyeSgp
IHdhcyBpbnZva2VkIHdpdGggInJlYWRfb25seSIgc2V0IHRvIHRydWUuDQo+IA0KPiBJbiB0d28g
Y2FzZXMsIHdoZXJlIGVwdF9uZXh0X2xldmVsKCkgZm9sbG93cyBhbiBlcHRfc3BsaXRfc3VwZXJw
YWdlKCkNCj4gaW52b2NhdGlvbiwgYWN0dWFsbHkgdGlnaHRlbiB0aGUgbG9vcCBleGl0IGNvbmRp
dGlvbiBmcm9tDQo+ICI9PSBNQVBfRkFJTEVEIiB0byAiIT0gTk9STUFMX1BBR0UiLiBDb250aW51
aW5nIHRoZXNlIGxvb3BzIGZvciBvdGhlcg0KPiB0aGFuIE5PUk1BTF9QQUdFIGlzIGludmFsaWQs
IGFuZCB0aGVyZSBhcmUgQVNTRVJUKClzIGluIHBsYWNlIGFmdGVyDQo+IHRoZXNlIGxvb3BzLg0K
PiANCj4gQWxzbyByZWR1Y2UgdGhlIHNjb3BlIG9mICJyZXQiIHZhcmlhYmxlcyB3aGVyZSBwb3Nz
aWJsZSwgaW4gcGFydGljdWxhcg0KPiB0byBiZXR0ZXIgZGlzdGluZ3Vpc2ggdGhlbSBmcm9tICJy
YyIgb2Z0ZW4gdXNlZCBpbiB0aGUgc2FtZSBmdW5jdGlvbi4NCj4gDQo+IEZpbmFsbHkgZHJvcCBw
b2ludGxlc3MgImVsc2UiIGluIGEgZmV3IGFyZWFzIHRvdWNoZWQgYW55d2F5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpSZXZpZXdlZC1i
eTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
