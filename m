Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14202EE2B2
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 15:37:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRdRk-0002Db-4n; Mon, 04 Nov 2019 14:35:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRdRj-0002DT-Bm
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 14:35:07 +0000
X-Inumbo-ID: 4abf2274-ff10-11e9-a180-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4abf2274-ff10-11e9-a180-12813bfff9fa;
 Mon, 04 Nov 2019 14:35:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8DE98AD17;
 Mon,  4 Nov 2019 14:35:04 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20191104135812.2314-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40cba9d9-24b0-3141-4ba8-02e03049f1bf@suse.com>
Date: Mon, 4 Nov 2019 15:35:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191104135812.2314-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/events: remove event handling recursion
 detection
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAxNDo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBfX3hlbl9ldnRjaG5f
ZG9fdXBjYWxsKCkgY29udGFpbnMgZ3VhcmRzIGFnYWluc3QgYmVpbmcgY2FsbGVkCj4gcmVjdXJz
aXZlbHkuIFRoaXMgbWVjaGFuaXNtIHdhcyBpbnRyb2R1Y2VkIGluIHRoZSBlYXJseSBwdm9wcyB0
aW1lcwo+IChrZXJuZWwgMi42LjI2KSB3aGVuIHRoZXJlIHdlcmUgc3RpbGwgWGVuIHZlcnNpb25z
IGFyb3VuZCBub3QgaG9ub3JpbmcKPiBkaXNhYmxlZCBpbnRlcnJ1cHRzIGZvciBzZW5kaW5nIGV2
ZW50cyB0byBwdiBndWVzdHMuCj4gCj4gVGhpcyB3YXMgY2hhbmdlZCBpbiBYZW4gMy4wLCB3aGlj
aCBpcyBtdWNoIG9sZGVyIHRoYW4gYW55IFhlbiB2ZXJzaW9uCj4gc3VwcG9ydGVkIGJ5IHRoZSBr
ZXJuZWwsIHNvIHRoZSByZWN1cnNpb24gZGV0ZWN0aW9uIGNhbiBiZSByZW1vdmVkLgoKV291bGQg
eW91IG1pbmQgcG9pbnRpbmcgb3V0IHdoaWNoIGV4YWN0IGNoYW5nZShzKSB0aGlzIHdhcyh3ZXJl
KT8KSXQgaGFkIGFsd2F5cyBiZWVuIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGUgcmVjdXJzaW9u
IGRldGVjdGlvbgp3YXMgbWFpbmx5IHRvIGd1YXJkIGFnYWluc3QgZHJpdmVycyByZS1lbmFibGlu
ZyBpbnRlcnJ1cHRzCnRyYW5zaWVudGx5IGluIHRoZWlyIGhhbmRsZXJzICh3aGljaCBpbiB0dXJu
IG1heSBubyBsb25nZXIgYmUgYW4KaXNzdWUgaW4gbW9kZXJuIExpbnV4IGtlcm5lbHMpLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
