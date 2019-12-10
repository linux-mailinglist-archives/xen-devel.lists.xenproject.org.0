Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E542118118
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 08:11:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieZdu-00050l-5f; Tue, 10 Dec 2019 07:09:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VH9u=2A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ieZds-00050f-R4
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 07:09:08 +0000
X-Inumbo-ID: f487021e-1b1b-11ea-88fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f487021e-1b1b-11ea-88fa-12813bfff9fa;
 Tue, 10 Dec 2019 07:09:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36DBBB32B;
 Tue, 10 Dec 2019 07:09:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191203223046.15011-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0c856c55-68c6-11d3-07e7-e2425d459acc@suse.com>
Date: Tue, 10 Dec 2019 08:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191203223046.15011-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/svm: Fix handling of EFLAGS.RF on task
 switch
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
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMTIuMTkgMjM6MzAsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVlQteCB1cGRhdGVzIFJG
IGJlZm9yZSB2bWV4aXQsIHNvIGVmbGFncyB3cml0dGVuIGludG8gdGhlIG91dGdvaW5nIFRTUyBo
YXBwZW5zCj4gdG8gYmUgY29ycmVjdC4gIFNWTSBkb2VzIG5vdCB1cGRhdGUgUkYgYmVmb3JlIHZt
ZXhpdCwgYW5kIGluc3RlYWQgcHJvdmlkZXMgaXQKPiB2aWEgYSBiaXQgaW4gZXhpdGluZm8yLgo+
IAo+IEluIHByYWN0aWNlLCBuZWVkaW5nIFJGIHNldCBpbiB0aGUgb3V0Z29pbmcgc3RhdGUgb2Nj
dXJzIHdoZW4gYSB0YXNrIGdhdGUgaXMKPiB1c2VkIHRvIGhhbmRsZSBmYXVsdHMuCj4gCj4gRXh0
ZW5kIGh2bV90YXNrX3N3aXRjaCgpIHdpdGggYW4gZXh0cmFfZWZsYWdzIHBhcmFtZXRlciB3aGlj
aCBnZXRzIGZlZCBpbnRvCj4gdGhlIG91dGdvaW5nIFRTUywgYW5kIGZpbGwgaXQgaW4gc3VpdGFi
bHkgZnJvbSB0aGUgU1ZNIHZtZXhpdCBpbmZvcm1hdGlvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
