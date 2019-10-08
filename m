Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9532CF18F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 06:23:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHgw7-0007Ir-CT; Tue, 08 Oct 2019 04:17:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=05QO=YB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHgw5-0007Im-95
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 04:17:21 +0000
X-Inumbo-ID: 83cde4a4-e982-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83cde4a4-e982-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 04:17:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3DC0EAFBC;
 Tue,  8 Oct 2019 04:17:17 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1570456846.git.rosbrookn@ainfosec.com>
 <5c509297c01b8931986b1d039de1c72e89e44037.1570456846.git.rosbrookn@ainfosec.com>
 <ae9cfdb0-c7c8-ad5d-b0f6-d3cc235eb68f@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b8770db7-ef59-9a64-57ab-5ad23c98e81a@suse.com>
Date: Tue, 8 Oct 2019 06:17:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ae9cfdb0-c7c8-ad5d-b0f6-d3cc235eb68f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 01/24] golang/xenlight: fix calls to
 libxl_domain_unpause/pause
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 IanJackson <ian.jackson@eu.citrix.com>, kerriganb@ainfosec.com,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTAuMTkgMTg6MzksIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvNy8xOSA0OjEy
IFBNLCBOaWNrIFJvc2Jyb29rIHdyb3RlOgo+PiBGcm9tOiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9v
a25AYWluZm9zZWMuY29tPgo+Pgo+PiBUaGVzZSBmdW5jdGlvbnMgcmVxdWlyZSBhIHRoaXJkIGFy
Z3VtZW50IG9mIHR5cGUgY29uc3QgKmxpYnhsX2FzeW5jb3BfaG93Lgo+Pgo+PiBQYXNzIG5pbCB0
byBmaXggY29tcGlsYXRpb24gZXJyb3JzLiBUaGlzIHdpbGwgaGF2ZSB0aGUgZWZmZWN0IG9mCj4+
IHBlcmZvcm1pbmcgdGhlc2Ugb3BlcmF0aW9ucyBzeW5jaHJvbm91c2x5Lgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgo+IAo+IFJldmll
d2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4gCj4gSnVl
cmdlbiwgdGhpcyBpcyBhY3R1YWxseSBhIGJ1ZyBmaXggKHRoZXNlIGxpbmVzIGRpZG4ndCBnZXQg
dXBkYXRlZCB3aGVuCj4gdGhlIEFQSSBjaGFuZ2VkKSwgc28gSSdtIGdvaW5nIHRvIGNoZWNrIHRo
aXMgaW4gbGF0ZXIgdGhpcyB3ZWVrIGlmIHlvdQo+IGRvbid0IG9iamVjdC4KClJlbGVhc2UtYWNr
ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
