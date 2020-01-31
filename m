Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E20C14ED78
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 14:35:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixWPM-0004ow-UD; Fri, 31 Jan 2020 13:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r7oN=3U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ixWPL-0004or-34
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 13:32:27 +0000
X-Inumbo-ID: 1e9768a6-442e-11ea-8bc7-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1e9768a6-442e-11ea-8bc7-12813bfff9fa;
 Fri, 31 Jan 2020 13:32:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 667EAAAC6;
 Fri, 31 Jan 2020 13:32:25 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-2-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e83d45fd-301e-036b-48f0-5e9cf8a343d3@suse.com>
Date: Fri, 31 Jan 2020 14:32:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200130145745.1306-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 1/4] x86 / vmx: move teardown from
 domain_destroy()...
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDEuMjAyMCAxNTo1NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLiB0byBkb21haW5f
cmVsaW5xdWlzaF9yZXNvdXJjZXMoKS4KPiAKPiBUaGUgdGVhcmRvd24gY29kZSBmcmVlcyB0aGUg
QVBJQ3YgcGFnZS4gVGhpcyBkb2VzIG5vdCBuZWVkIHRvIGJlIGRvbmUgbGF0ZQo+IHNvIGRvIGl0
IGluIGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHJhdGhlciB0aGFuIGRvbWFpbl9kZXN0
cm95KCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPgoKQnR3LiwgdGhpcyBjYW4gaGF2ZSBteQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgphcyBzb29uIGFzICJ4ODYvSFZNOiByZWxpbnF1aXNoIHJlc291cmNl
cyBhbHNvIGZyb20gaHZtX2RvbWFpbl9kZXN0cm95KCkiCmhhcyBnb25lIGluLiBCdXQgdGhhdCdz
IHN0aWxsIHBlbmRpbmcgYW4gYWNrIG9yIG90aGVyd2lzZSBieSB5b3UuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
