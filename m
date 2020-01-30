Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1482214DF2D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:31:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCh0-0007L0-JL; Thu, 30 Jan 2020 16:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=suiz=3T=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixCgz-0007Kn-1Q
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:29:21 +0000
X-Inumbo-ID: a5c44d50-437d-11ea-8ab6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5c44d50-437d-11ea-8ab6-12813bfff9fa;
 Thu, 30 Jan 2020 16:29:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A4577ACD6;
 Thu, 30 Jan 2020 16:29:11 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <93af32a7-963f-6978-4d37-80e471c1832f@suse.com>
Date: Thu, 30 Jan 2020 17:29:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130145745.1306-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 2/4] add a domain_tot_pages() helper
 function
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNTo1NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9kb21haW4uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21haW4uYwo+IEBAIC0yMTgsNyAr
MjE4LDcgQEAgdm9pZCBkdW1wX3BhZ2VmcmFtZV9pbmZvKHN0cnVjdCBkb21haW4gKmQpCj4gIAo+
ICAgICAgcHJpbnRrKCJNZW1vcnkgcGFnZXMgYmVsb25naW5nIHRvIGRvbWFpbiAldTpcbiIsIGQt
PmRvbWFpbl9pZCk7Cj4gIAo+IC0gICAgaWYgKCBkLT50b3RfcGFnZXMgPj0gMTAgJiYgZC0+aXNf
ZHlpbmcgPCBET01EWUlOR19kZWFkICkKPiArICAgIGlmICggZG9tYWluX3RvdF9wYWdlcyhkKSA+
PSAxMCAmJiBkLT5pc19keWluZyA8IERPTURZSU5HX2RlYWQgKQoKQmVmb3JlIEkgZ28gYW55IGZ1
cnRoZXIgLSBhcmUgeW91IHNpbXBseSByZXBsYWNpbmcgX2FsbF8KLT50b3RfcGFnZXMgdXNlcyBi
eSB0aGUgbmV3IGhlbHBlcj8gSW4gdGhlIGNhc2UgaGVyZSwgZm9yCmV4YW1wbGUsIEkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyB3aGF0IHdlIHdhbnQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
