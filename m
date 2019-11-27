Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2004610A750
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 01:04:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZkle-0004kV-BQ; Wed, 27 Nov 2019 00:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aWg5=ZT=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iZklc-0004kQ-V2
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 00:01:12 +0000
X-Inumbo-ID: 054b9628-10a9-11ea-a55d-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 054b9628-10a9-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 00:01:11 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so5129625wmj.4
 for <xen-devel@lists.xen.org>; Tue, 26 Nov 2019 16:01:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJIK/DKUvFlIeP4398JoZdFvbG32IChClRTst3CpZ5U=;
 b=EZSzwwYOLs1wxruShjpVctMxqf6Hjw/K7WgqLr3QqzHRiXr0/C16hypyPHPZLqXULQ
 UH212t4NSRUQdPQNwzof5x2voIWRaJ/Zca5j+OB+kdeM4dw9qR+ifiOBuX0T+njkYqVr
 qzyagRxaBbuxM8OSR2HTBZQvQ9gcvC0pyS/yGXlRbuR9d3exlESX5M8xkLJx5g16SVUF
 feohjdZ4kGUd1IrBPFJl6jnALifwWaAOM3j8HebJZ++8hNSYxlLZ28mjgciYKDeWUunY
 6zxLdDMMJ8SuDOYXbsCvGqvOvvIKHo/WXYmngOxO5LJ+tETGC9/IwQv/InVM7/uTycYT
 ToWA==
X-Gm-Message-State: APjAAAVijwWr9q9cbGCQ6CqcFoywNk8DUQqzbvGSYyH8JSQv7nuMlfAy
 nTdLidt5rq9XLLu6wgzANqA=
X-Google-Smtp-Source: APXvYqx/XgPB3y3Kbd7LCCDAB9ZS/P3406+U6tYzADjmvS8oniqMmdRQWRCFBePudnbCchgx3/GRLw==
X-Received: by 2002:a1c:808d:: with SMTP id b135mr1322066wmd.175.1574812870889; 
 Tue, 26 Nov 2019 16:01:10 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com
 (cpc91200-cmbg18-2-0-cust94.5-4.cable.virginm.net. [81.100.41.95])
 by smtp.gmail.com with ESMTPSA id z64sm3691415wmg.30.2019.11.26.16.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2019 16:01:10 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
Date: Wed, 27 Nov 2019 00:01:09 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: jgross@suse.com, peng.fan@nxp.com, Alice Guo <alice.guo@nxp.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNi8xMS8yMDE5IDIzOjE3LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VHVlLCAyNiBOb3YgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjYv
MTEvMjAxOSAyMDo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gKyBKdWVyZ2VuCj4+
Pgo+Pj4gSSBtaXNzZWQgdGhhdCB5b3Ugd2VyZW4ndCBpbiBDQyB0byB0aGUgb3JpZ2luYWwgcGF0
Y2gsIHNvcnJ5Lgo+Pj4gSSB0aGluayB0aGlzIHBhdGNoIHNob3VsZCBnbyBpbiwgYXMgb3RoZXJ3
aXNlIExpbnV4IDUuNCBjb3VsZCBydW4gaW50bwo+Pj4gcHJvYmxlbXMuIEl0IGlzIGFsc28gYSBw
cmV0dHkgc3RyYWlnaHRmb3J3YXJkIDQgbGluZXMgcGF0Y2guCj4+Cj4+IDUuNSAob3IgNS42KSBp
cyBub3QgZ29pbmcgdG8gcnVuIG9uIFhlbiBmb3Igb3RoZXIgcmVhc29ucyAoc3RpbGwgaW4gdGhl
Cj4+IHZHSUMpLi4uIFNvIEkgd291bGQgbm90IHZpZXcgdGhpcyBhcyBjcml0aWNhbC4KPiAKPiA1
LjUgaXMgbm90IG91dCB5ZXQsIGluIGZhY3QsIHRoZSBkZXYgd2luZG93IGhhcyBqdXN0IG9wZW5l
ZC4gSXNuJ3QgeW91cgo+IHN0YXRlbWVudCBhIGJpdCBwcmVtYXR1cmU/CgpUaGUgR0lDdjQuMSB3
b3JrIFsxXSBpcyBnb2luZyB0byBwcmV2ZW50IExpbnV4IGJvb3Rpbmcgb24gYWxsIGN1cnJlbnQg
CnZlcnNpb25zIG9mIFhlbi4gV2hpbGUgSSBjYW4ndCBjb25maXJtIHRoaXMgaXMgZ29pbmcgdG8g
YmUgbWVyZ2VkIGluIAo1LjUsIEkgY2FuIHRlbGwgeW91IHRoaXMgd2lsbCBicmVhay4KCj4gCj4g
SW4gYW55IGNhc2UsIGV2ZW4gaWYgcG90ZW50aWFsIGZ1dHVyZSBMaW51eCByZWxlYXNlcyBjb3Vs
ZCBoYXZlIG90aGVyCj4gYWRkaXRpb25hbCBpc3N1ZXMsIEkgZG9uJ3QgdGhpbmsgaXQgc2hvdWxk
IGNoYW5nZSBvdXIgY3VycmVudCB2aWV3IG9uCj4gdGhpcyBzcGVjaWZpYyBpc3N1ZSB3aGljaCBh
ZmZlY3RzIDUuNCwganVzdCByZWxlYXNlZC4KClRoZSBwYXRjaCBpcyBkZWZpbml0ZWx5IG5vdCBh
cyBzdHJhaWdodGZvcndhcmQgYXMgeW91IG1heSB0aGluay4gUGxlYXNlIApyZWZlciB0byB0aGUg
ZGlzY3Vzc2lvbiB3ZSBoYWQgb24gdGhlIGZpcnN0IHZlcnNpb24uIEkgdm9pY2VkIGNvbmNlcm4g
CmFib3V0IHRoaXMgYXBwcm9hY2ggYW5kIGdhdmUgcG9pbnQgd2hhdCBjb3VsZCBnbyB3cm9uZyB3
aXRoIGhhcHBlbi4KClRoaXMgcGF0Y2ggbWF5IGJlIGJldHRlciB0aGFuIHRoZSBjdXJyZW50IHN0
YXRlIChpLmUgY3Jhc2hpbmcpLCBidXQgdGhpcyAKd2Fzbid0IHRlc3RlZCBlbm91Z2ggdG8gY29u
ZmlybSB0aGlzIGlzIHRoZSBjb3JyZWN0IHRoaW5ncyB0byBkbyBhbmQgbm8gCm90aGVyIGJ1ZyB3
aWxsIGFwcGVhciAoSSBkb24ndCBiZWxpZXZlIHJlYWRpbmcgSSpBQ1RJVkVSIHdhcyBldmVyIHRl
c3RlZCAKYmVmb3JlKS4KCkl0IGlzIGFuIGFubm95aW5nIGJ1ZywgYnV0IHRoaXMgaXMgb25seSBh
ZmZlY3RpbmcgNS40IHdoaWNoIGhhcyBqdXN0IApiZWVuIHJlbGVhc2VkLiBJdCBmZWVscyB0byBt
ZSB0aGlzIGlzIGEgZmFpcmx5IHJpc2t5IGNob2ljZSB0byBtZXJnZSBpdCAKcXV0aWUgbGF0ZSBp
biB0aGUgcmVsZWFzZSB3aXRob3V0IGEgZ29vZCBncmFwcyBvZiB0aGUgcHJvYmxlbSAoc2VlIGFi
b3ZlKS4KClNvIEkgd291bGQgZGVmaW5pdGx5LCBwcmVmZXIgaWYgdGhpcyBwYXRjaCBpcyBnZXR0
aW5nIHRocm91Z2ggYmFja3BvcnQgCm9uY2Ugd2UgZ2V0IG1vcmUgdGVzdGluZy4KCldlIGNhbiBz
dGlsbCBkb2N1bWVudCB0aGUgYnVnIGluIHRoZSByZWxlYXNlIG5vdGUgYW5kIHBvaW50IHBlb3Bs
ZSB0byAKdGhlIHBhdGNoLgoKQW55d2F5LCB0aGlzIGlzIEp1ZXJnZW4gY2hvaWNlIGhlcmUuIEJ1
dCBhdCBsZWFzdCBub3cgaGUgaGFzIHRoZSBmdWxsIApwaWN0dXJlLi4uCgpDaGVlcnMsCgpbMV0g
aHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzgwMDQ5NC8KCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
