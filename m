Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13D14283F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:32:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itUJB-00075I-Ri; Mon, 20 Jan 2020 10:29:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itUJA-00075D-SL
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 10:29:24 +0000
X-Inumbo-ID: b978b806-3b6f-11ea-b93f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b978b806-3b6f-11ea-b93f-12813bfff9fa;
 Mon, 20 Jan 2020 10:29:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23E38B376;
 Mon, 20 Jan 2020 10:29:22 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
 <20200117204223.30076-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eab4676-0754-d891-279b-327d664c57d9@suse.com>
Date: Mon, 20 Jan 2020 11:29:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117204223.30076-2-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/boot: Create the l2_xenmap[]
 mappings dynamically
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAyMTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgYnVpbGQtdGlt
ZSBjb25zdHJ1Y3Rpb24gb2YgbDJfeGVubWFwW10gaW1wb3NlcyBhbiBhcmJpdHJhcnkgbGltaXQg
b2YgMTZNCj4gdG90YWwsIHdoaWNoIGlzIGEgbGltaXQgbG9va2luZyB0byBiZSBsaWZ0ZWQuCj4g
Cj4gTW92ZSBsMl94ZW5tYXBbXSBpbnRvIHRoZSBCU1MsIGFuZCBhZGp1c3QgYm90aCB0aGUgQklP
UyBhbmQgRUZJIHBhdGhzIHRvIGZpbGwKPiBpdCBpbiBkeW5hbWljYWxseSwgYmFzZWQgb24gdGhl
IGZpbmFsIGxpbmtlZCBzaXplIG9mIFhlbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCj4gdjI6Cj4gICogUmV3cml0ZSBzZXZlcmFsIGNvbW1lbnRz
CgpUaGlzIGhhcyBoZWxwZWQgaW5kZWVkLCB0aGFua3MuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
