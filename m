Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09227184302
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 09:57:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCg61-0007qZ-Pt; Fri, 13 Mar 2020 08:55:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCg5z-0007qU-Vo
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 08:55:08 +0000
X-Inumbo-ID: 560dd644-6508-11ea-b2a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 560dd644-6508-11ea-b2a2-12813bfff9fa;
 Fri, 13 Mar 2020 08:55:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2FAACAD39;
 Fri, 13 Mar 2020 08:55:06 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200313080517.28728-1-jgross@suse.com>
 <20200313080517.28728-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e56d8d5-a66f-1990-faf2-488f1f07ae93@suse.com>
Date: Fri, 13 Mar 2020 09:55:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200313080517.28728-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/spinlocks: fix placement of
 preempt_[dis|en]able()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAwOTowNSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTk5LDEwICsx
OTksMTAgQEAgdW5zaWduZWQgbG9uZyBfc3Bpbl9sb2NrX2lycXNhdmUoc3BpbmxvY2tfdCAqbG9j
aykKPiAgdm9pZCBfc3Bpbl91bmxvY2soc3BpbmxvY2tfdCAqbG9jaykKPiAgewo+ICAgICAgYXJj
aF9sb2NrX3JlbGVhc2VfYmFycmllcigpOwo+IC0gICAgcHJlZW1wdF9lbmFibGUoKTsKPiAgICAg
IExPQ0tfUFJPRklMRV9SRUw7Cj4gICAgICByZWxfbG9jaygmbG9jay0+ZGVidWcpOwo+ICAgICAg
YWRkX3NpemVkKCZsb2NrLT50aWNrZXRzLmhlYWQsIDEpOwo+ICsgICAgcHJlZW1wdF9lbmFibGUo
KTsKPiAgICAgIGFyY2hfbG9ja19zaWduYWwoKTsKPiAgfQoKYXJjaF9sb2NrX3NpZ25hbCgpIGlz
IGEgYmFycmllciBvbiBBcm0sIGhlbmNlIGp1c3QgbGlrZSBmb3IgcGF0Y2ggMQpJIHdvbmRlciB3
aGV0aGVyIHRoZSBpbnNlcnRpb24gd291bGRuJ3QgYmV0dGVyIGNvbWUgYWZ0ZXIgaXQuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
