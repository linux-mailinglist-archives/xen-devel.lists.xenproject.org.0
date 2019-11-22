Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA03E1073BE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2019 14:57:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iY9PM-00008y-VT; Fri, 22 Nov 2019 13:55:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iY9PL-000088-Ut
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2019 13:55:35 +0000
X-Inumbo-ID: c1695d54-0d2f-11ea-a352-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c1695d54-0d2f-11ea-a352-12813bfff9fa;
 Fri, 22 Nov 2019 13:55:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 26D13AC37;
 Fri, 22 Nov 2019 13:55:34 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <b95777174dca3eec45804195628edfc97aa8ecba.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b001b4fa-5940-bf25-8d52-8f0605f417fb@suse.com>
Date: Fri, 22 Nov 2019 14:55:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b95777174dca3eec45804195628edfc97aa8ecba.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 6/9] x86/mm: add an end_of_loop label in
 map_pages_to_xen
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gV2Ugd2lsbCBzb29uIG5l
ZWQgdG8gY2xlYW4gdXAgbWFwcGluZ3Mgd2hlbmV2ZXIgdGhlIG91dCBtb3N0IGxvb3AgaXMKPiBl
bmRlZC4gQWRkIGEgbmV3IGxhYmVsIGFuZCB0dXJuIHJlbGV2YW50IGNvbnRpbnVlJ3MgaW50byBn
b3RvJ3MuCgpJIHRoaW5rIGFscmVhZHkgd2hlbiB0aGlzIHN0aWxsIHdhcyBSRkMgSSBkaWQgaW5k
aWNhdGUgdGhhdCBJJ20gbm90CmhhcHB5IGFib3V0IHRoZSBpbnRyb2R1Y3Rpb24gb2YgdGhlc2Ug
bGFiZWxzIChpbmNsdWRpbmcgYWxzbyBwYXRjaCA4KS4KSSByZWFsaXplIGl0J3MgcXVpdGUgYSBs
b3QgdG8gYXNrLCBidXQgYm90aCBmdW5jdGlvbnMgd291bGQgYmVuZWZpdApmcm9tIHNwbGl0dGlu
ZyB1cCBpbnRvIHBlci1sZXZlbCBoZWxwZXIgZnVuY3Rpb25zLCB3aGljaCAtIGFmYWljdCAtCndv
dWxkIGF2b2lkIHRoZSBuZWVkIGZvciBzdWNoIGxhYmVscywgYW5kIHdoaWNoIHdvdWxkIGF0IHRo
ZSBzYW1lCnRpbWUgbGlrZWx5IG1ha2UgaXQgcXVpdGUgYSBiaXQgZWFzaWVyIHRvIGV4dGVuZCB0
aGVzZSB0byB0aGUKNS1sZXZlbCBwYWdlIHRhYmxlcyBjYXNlIGRvd24gdGhlIHJvYWQuCgpUaG91
Z2h0cz8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
