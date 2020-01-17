Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97829140EC3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:15:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUF7-0005gB-2u; Fri, 17 Jan 2020 16:13:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isUF5-0005g5-E9
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:13:03 +0000
X-Inumbo-ID: 3bed3308-3944-11ea-b578-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3bed3308-3944-11ea-b578-12813bfff9fa;
 Fri, 17 Jan 2020 16:13:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B520AAD05;
 Fri, 17 Jan 2020 16:13:00 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <067119d6-fe68-9b9a-72bb-20f1e72910cc@suse.com>
Date: Fri, 17 Jan 2020 17:13:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117133059.14602-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V8 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxNDozMSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gVGhp
cyBwYXRjaCBhaW1zIHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlhbGx5IGd1ZXN0IHByb3Zp
ZGVkCj4gdmFsdWVzLCBmb3IgYWx0cDJtX2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4K
PiAKPiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiBB
Y2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoKUmV2aWV3ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
