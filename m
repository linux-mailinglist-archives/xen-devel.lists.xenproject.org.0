Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1561033AC
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 06:23:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXIQ9-0003oc-BY; Wed, 20 Nov 2019 05:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXIQ7-0003oX-PE
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 05:20:51 +0000
X-Inumbo-ID: 83658540-0b55-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83658540-0b55-11ea-b678-bc764e2007e4;
 Wed, 20 Nov 2019 05:20:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C52C7B25D;
 Wed, 20 Nov 2019 05:20:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191101202502.31750-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <6f6a541c-1f4f-d888-bb26-4029f8161df6@suse.com>
Date: Wed, 20 Nov 2019 06:20:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191101202502.31750-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 0/3] Fix PV shim ballooning problems
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTEuMTkgMjE6MjQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gSSBkZWNpZGVkIHRvIGR1
c3Qgb2ZmIG15IGVhcmx5IENQVUlEIGFkanVzdG1lbnRzIHdvcmsgaW4gYW4gZWZmb3J0IHRvIGdl
dAo+IHBhdGNoIDMgaW4gYSBzZW5zaWJsZSBzdGF0ZSBmb3IgNC4xMy4gIEV2ZXIgc28gc2xpZ2h0
bHkgUkZDIGZvciA0LjEzIGdpdmVuCj4gd2hlcmUgd2UgYXJlIGluIHRoZSByZWxlYXNlLCBidXQg
dGhpcyBpcyBmYWlybHkgc2VsZiBjb250YWluZWQuCj4gCj4gQW5kcmV3IENvb3BlciAoMik6Cj4g
ICAgeDg2L2Jvb3Q6IFJlbW92ZSBjYWNoZWQgQ1BVSUQgZGF0YSBmcm9tIHRoZSB0cmFtcG9saW5l
Cj4gICAgeDg2L2Jvb3Q6IENhY2hlIGNwdV9oYXNfaHlwZXJ2aXNvciB2ZXJ5IGVhcmx5IG9uIGJv
b3QKPiAKPiBTZXJnZXkgRHlhc2xpICgxKToKPiAgICB4ODYvZTgyMDogZml4IDY0MGsgLSAxTSBy
ZWdpb24gcmVzZXJ2YXRpb24gbG9naWMKPiAKPiAgIHhlbi9hcmNoL3g4Ni9hcGljLmMgICAgICAg
ICAgICAgfCAgMiArLQo+ICAgeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgICAgICB8IDEzICsr
KysrKysrKysrLS0KPiAgIHhlbi9hcmNoL3g4Ni9ib290L3RyYW1wb2xpbmUuUyAgfCAxMyArKysr
Ky0tLS0tLS0tCj4gICB4ZW4vYXJjaC94ODYvYm9vdC93YWtldXAuUyAgICAgIHwgMTMgKystLS0t
LS0tLS0tLQo+ICAgeGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyAgICAgICB8ICAzIC0tLQo+ICAg
eGVuL2FyY2gveDg2L2NwdS9pbnRlbC5jICAgICAgICB8ICAxICsKPiAgIHhlbi9hcmNoL3g4Ni9l
ODIwLmMgICAgICAgICAgICAgfCAgNCArKy0tCj4gICB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290
LmggICAgIHwgMTIgKysrKysrKystLS0tCj4gICB4ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMgICAg
ICAgIHwgIDYgKy0tLS0tCj4gICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgIHwgIDMg
Ky0tCj4gICB4ZW4vaW5jbHVkZS9hc20teDg2L3Byb2Nlc3Nvci5oIHwgIDIgKy0KPiAgIDExIGZp
bGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQo+IAoKRm9yIHRo
ZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
