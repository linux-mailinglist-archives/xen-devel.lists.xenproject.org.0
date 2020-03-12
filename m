Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D20418364E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:38:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCQp7-0004GZ-98; Thu, 12 Mar 2020 16:36:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCQp6-0004GU-3f
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:36:40 +0000
X-Inumbo-ID: a5852ae4-647f-11ea-b1d8-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5852ae4-647f-11ea-b1d8-12813bfff9fa;
 Thu, 12 Mar 2020 16:36:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 749C5AC24;
 Thu, 12 Mar 2020 16:36:38 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <158402065414.753.15785539969715690913.stgit@Palanthas>
 <2e53ee4c-e2d9-f892-c8c3-62bff0c526ab@suse.com>
 <94b27cbc655806ea2853e5f3c099d2a4a93ee5ce.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <695059b0-cfdb-3368-4215-2ea1f751fdae@suse.com>
Date: Thu, 12 Mar 2020 17:36:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <94b27cbc655806ea2853e5f3c099d2a4a93ee5ce.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] xen: credit2: avoid vCPUs to ever reach
 lower credits than idle
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
Cc: Juergen Gross <jgross@suse.com>, Charles Arnold <carnold@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDMuMjAyMCAxNzoxMSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVGh1LCAyMDIw
LTAzLTEyIGF0IDE2OjI2ICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gTG9va2luZyBhdCB0
MmNfdXBkYXRlKCkgSSdtIGFsc28gZ2V0dGluZyB0aGUgaW1wcmVzc2lvbiB0aGF0Cj4+IHRoZXJl
J3MgVUIgd2hlbiB0aGUgc3VidHJhY3Rpb24gdW5kZXJmbG93cy4gQWZ0ZXIgYWxsLCBpZgo+PiAt
MSA8PCAzMCB3YXNuJ3Qgc21hbGwgZW5vdWdoIGEgdmFsdWUsIEkgZG9uJ3Qgc2VlIHdoeSAtMSA8
PCAzMQo+PiB3b3VsZCBiZS4KPj4KPiBNbW0uLi4gbm90IHN1cmUgSSBhbSBnZXR0aW5nLiBBcmUg
eW91IHN1Z2dlc3Rpbmcgd2Ugc2hvdWxkIGFwcGx5IGEgY2FwCj4gdG8gdmFsPwo+IAo+IElmIHll
cywgdGhpcyBsb29rcyBsaWtlIGFuIGlzc3VlIGluZGVwZW5kZW50IGZyb20gd2hhdCB0aGUgdmFs
dWUgb2YKPiBDU0NIRUQyX0lETEVfQ1JFRElUIGlzLCBidXQgeWVhaCwgd2UgY2FuIGRvIHRoYXQu
IE9yIGFtIEkgbWlzc2luZwo+IHNvbWV0aGluZz8KCldlbGwsIGF0IHRoZSB2ZXJ5IGxlYXN0IFVC
IG5lZWRzIHRvIGJlIGF2b2lkZWQsIGkuZS4gd2Ugc2hvdWxkbid0CnN1YnRyYWN0IHdoZW4gdGhl
IHJlc3VsdCBpcyBub3QgcmVwcmVzZW50YWJsZSBpbiAiY3JlZGl0IidzIHR5cGUuCkJ1dCBldmVu
IGJleW9uZCB0aGF0IHRoZXJlIG1heSBiZSBhIG5lZWQgZm9yIHRoZSBzdWJ0cmFjdGlvbiB0bwph
Y3R1YWxseSBhY3QgYXMgaWYgaXQgd2FzIHNhdHVyYXRpbmcgYXQgSU5UX01JTi4gKFNpbWlsYXJs
eQphZGRpdGlvbnMgbWF5IG5lZWQgdG8gc2F0dXJhdGUgYXQgSU5UX01BWCwgaWYgdGhlcmUncyBh
bnkKcG9zc2liaWxpdHkgZm9yIHRob3NlIHZhbHVlcyB0byBncm93IGxhcmdlLikKCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
