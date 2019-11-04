Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C61A1EE342
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 16:12:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRdzC-0005DS-N8; Mon, 04 Nov 2019 15:09:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jRce=Y4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iRdzB-0005DN-BF
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 15:09:41 +0000
X-Inumbo-ID: 1f94153c-ff15-11e9-a181-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f94153c-ff15-11e9-a181-12813bfff9fa;
 Mon, 04 Nov 2019 15:09:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A700BADD5;
 Mon,  4 Nov 2019 15:09:39 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191104135812.2314-1-jgross@suse.com>
 <40cba9d9-24b0-3141-4ba8-02e03049f1bf@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <acaf58cb-47f2-7e7e-f25d-ff83ae8a8066@suse.com>
Date: Mon, 4 Nov 2019 16:09:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <40cba9d9-24b0-3141-4ba8-02e03049f1bf@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMTkgMTU6MzUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA0LjExLjIwMTkgMTQ6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IF9feGVuX2V2dGNobl9kb191cGNhbGwoKSBjb250
YWlucyBndWFyZHMgYWdhaW5zdCBiZWluZyBjYWxsZWQKPj4gcmVjdXJzaXZlbHkuIFRoaXMgbWVj
aGFuaXNtIHdhcyBpbnRyb2R1Y2VkIGluIHRoZSBlYXJseSBwdm9wcyB0aW1lcwo+PiAoa2VybmVs
IDIuNi4yNikgd2hlbiB0aGVyZSB3ZXJlIHN0aWxsIFhlbiB2ZXJzaW9ucyBhcm91bmQgbm90IGhv
bm9yaW5nCj4+IGRpc2FibGVkIGludGVycnVwdHMgZm9yIHNlbmRpbmcgZXZlbnRzIHRvIHB2IGd1
ZXN0cy4KPj4KPj4gVGhpcyB3YXMgY2hhbmdlZCBpbiBYZW4gMy4wLCB3aGljaCBpcyBtdWNoIG9s
ZGVyIHRoYW4gYW55IFhlbiB2ZXJzaW9uCj4+IHN1cHBvcnRlZCBieSB0aGUga2VybmVsLCBzbyB0
aGUgcmVjdXJzaW9uIGRldGVjdGlvbiBjYW4gYmUgcmVtb3ZlZC4KPiAKPiBXb3VsZCB5b3UgbWlu
ZCBwb2ludGluZyBvdXQgd2hpY2ggZXhhY3QgY2hhbmdlKHMpIHRoaXMgd2FzKHdlcmUpPwoKTGlu
dXgga2VybmVsOiAyMjk2NjRiZWU2MTI2ZTAxZjg2NjI5NzZhNWZlMmU3OTgxM2I3N2M4Clhlbjog
ZDgyNjNlOGRiYWY1ZWYxNDQ1YmVlMDY2MjE0M2EwZmNiNmQ0MzQ2NgoKPiBJdCBoYWQgYWx3YXlz
IGJlZW4gbXkgdW5kZXJzdGFuZGluZyB0aGF0IHRoZSByZWN1cnNpb24gZGV0ZWN0aW9uCj4gd2Fz
IG1haW5seSB0byBndWFyZCBhZ2FpbnN0IGRyaXZlcnMgcmUtZW5hYmxpbmcgaW50ZXJydXB0cwo+
IHRyYW5zaWVudGx5IGluIHRoZWlyIGhhbmRsZXJzICh3aGljaCBpbiB0dXJuIG1heSBubyBsb25n
ZXIgYmUgYW4KPiBpc3N1ZSBpbiBtb2Rlcm4gTGludXgga2VybmVscykuCgpUaGlzIHdvdWxkIGhh
dmUgYmVlbiBkb2FibGUgd2l0aCBhIHNpbXBsZSBib29sLiBUaGUgbW9yZSBjb21wbGV4CnhjaGcg
YmFzZWQgbG9naWMgd2FzIElNTyBmb3IgcmVjdXJzaW9uIGRldGVjdGlvbiBhdCBhbnkgcG9pbnQu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
