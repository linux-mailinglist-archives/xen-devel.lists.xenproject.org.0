Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7470D1A5AF
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2019 02:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hPFVO-0008Rc-7s; Sat, 11 May 2019 00:04:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C3x+=TL=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hPFVL-0008RS-U7
 for xen-devel@lists.xenproject.org; Sat, 11 May 2019 00:04:43 +0000
X-Inumbo-ID: 6013fbf5-7380-11e9-8980-bc764e045a96
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6013fbf5-7380-11e9-8980-bc764e045a96;
 Sat, 11 May 2019 00:04:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 17:04:40 -0700
X-ExtLoop1: 1
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga005.fm.intel.com with ESMTP; 10 May 2019 17:04:40 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Fri, 10 May 2019 17:04:40 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.150]) with mapi id 14.03.0415.000;
 Sat, 11 May 2019 08:04:38 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Tamas K Lengyel <tamas@tklengyel.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] x86/vmx: correctly gather gs_shadow value for
 current vCPU
Thread-Index: AQHVAHjnK6tl+cGIj0mIoTPkfrhBzqZlGRWw
Date: Sat, 11 May 2019 00:04:37 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA2A2D8@SHSMSX104.ccr.corp.intel.com>
References: <20190501235203.1179-1-tamas@tklengyel.com>
In-Reply-To: <20190501235203.1179-1-tamas@tklengyel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDQzMzA1MWYtNmRjNC00ZDRiLTkzMGQtZTgyZDQ2NWYyNmRkIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWE95SUQ4S04wNExTVkxxSWcwVlZ6QnlCSEc0d1wvNVViQWZiYlkrS1ZOVDNrMGtMXC95QSs2dUEyM24yYXNoYkRKIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBUYW1hcyBLIExlbmd5ZWwgW21haWx0bzp0YW1hc0B0a2xlbmd5ZWwuY29tXQo+IFNl
bnQ6IFRodXJzZGF5LCBNYXkgMiwgMjAxOSA3OjUyIEFNCj4gCj4gQ3VycmVudGx5IHRoZSBnc19z
aGFkb3cgdmFsdWUgaXMgb25seSBjYWNoZWQgd2hlbiB0aGUgdkNQVSBpcyBiZWluZwo+IHNjaGVk
dWxlZAo+IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0
aHJvdWdoIHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPiBzaW5jZSBpdCBkb2Vzbid0IHJlcHJlc2Vu
dCB0aGUgYWN0dWFsIHN0YXRlIG9mIHRoZSB2Q1BVIGF0IHRoZSB0aW1lIHRoZSBldmVudAo+IHdh
cyByZWNvcmRlZC4gVGhpcyBwcmV2ZW50cyB2bV9ldmVudCBzdWJzY3JpYmVycyBmcm9tIGNvcnJl
Y3RseSBmaW5kaW5nCj4ga2VybmVsCj4gc3RydWN0dXJlcyBpbiB0aGUgZ3Vlc3Qgd2hlbiBpdCBp
cyB0cmFwcGVkIHdoaWxlIGluIHJpbmczLgo+IAo+IFJlZnJlc2ggc2hhZG93X2dzIHZhbHVlIHdo
ZW4gdGhlIGNvbnRleHQgYmVpbmcgc2F2ZWQgaXMgZm9yIHRoZSBjdXJyZW50Cj4gdkNQVS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CgpB
Y2tlZC1ieTogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
