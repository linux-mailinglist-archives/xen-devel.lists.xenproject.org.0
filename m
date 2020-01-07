Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CA7132A4C
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 16:45:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioqzs-0001Tc-DW; Tue, 07 Jan 2020 15:42:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ioqzq-0001TX-SB
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 15:42:18 +0000
X-Inumbo-ID: 48b0733a-3164-11ea-ac3e-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48b0733a-3164-11ea-ac3e-12813bfff9fa;
 Tue, 07 Jan 2020 15:42:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so19945652wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 07:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jsFz3hGpHotuKPlv3sDGd4AT0v9D5qxA2eqVyUHPqIo=;
 b=MBFHwyzgun7OkUZP01E7Gx+OrRdGGqvhUqyuSQwuRHpFHxboogTo6jyJ1rxSTCYxTn
 Im5HMAA4Hab6/Kk+cCT9Dg5gD0hB378HfMcotoFnubc5Va3/KduVhCIvlwze38uae+wI
 HV2wPO3UoFgWqxvK4nYYkmFtjS39J2JkglqPSTkKgZ2Vc4SQTCc6QHd3aL8GwRLikQ1+
 7yvhGJ5sscSJB4IVW1pGgsMblxKtzlGxqYz/bW6ffDar32n9UlYTyragVQbO0OXm1OIo
 ZYpGuOjWu2CaJbPJWHNY9aWYIF9h/hVSMsijARlDQZ3tm1qZuCZLNBVzZwtuigVr15QZ
 PaGw==
X-Gm-Message-State: APjAAAUjFc8wBzTBqS7aLIlNEbTYdgRBYgvQr5HfktLWSem5a53Lh2hK
 y+fxwQPOygplNyOS9ryu9/I=
X-Google-Smtp-Source: APXvYqwcJbGV4/IaXUtUpvXmRVK8Cge4uHGxY3HUTFN0+kYKn2xWGp06mOJK1dLS2dxvEO0cR8+rvQ==
X-Received: by 2002:a1c:7d92:: with SMTP id
 y140mr37977083wmc.145.1578411736988; 
 Tue, 07 Jan 2020 07:42:16 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id t1sm27579206wma.43.2020.01.07.07.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:42:16 -0800 (PST)
Date: Tue, 7 Jan 2020 15:42:14 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200107154214.oz2qyunmeyzfsgfv@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-2-liuwe@microsoft.com>
 <eae9980b-90dd-e747-9400-7bc044b06360@citrix.com>
 <20200105214541.5z5ibv2nlyebbypj@debian>
 <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c289d1bb-246a-6295-b8ff-e318789987e3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMDk6NTc6NTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKWy4uLl0KPiA+Cj4gPj4gVGhlIGxvY2tlZCBiaXQgaXMgcHJvYmFibHkgYSBnb29kIGlk
ZWEsIGJ1dCBvbmUgYXNwZWN0IG1pc3NpbmcgaGVyZSBpcwo+ID4+IHRoZSBjaGVjayB0byBzZWUg
d2hldGhlciB0aGUgaHlwZXJjYWxsIHBhZ2UgaXMgYWxyZWFkeSBlbmFibGVkLCB3aGljaCBJCj4g
Pj4gZXhwZWN0IGlzIGZvciBhIGtleGVjIGNyYXNoIHNjZW5hcmlvLgo+ID4+Cj4gPj4gSG93ZXZl
ciwgdGhlIG1vc3QgaW1wb3J0YW50IHBvaW50IGlzIHRoZSBvbmUgd2hpY2ggZGVzY3JpYmVzIHRo
ZSAjR1AKPiA+PiBwcm9wZXJ0aWVzIG9mIHRoZSBndWVzdCB0cnlpbmcgdG8gbW9kaWZ5IHRoZSBw
YWdlLsKgIFRoaXMgY2FuIG9ubHkgYmUKPiA+PiBhY2hpZXZlZCB3aXRoIGFuIEVQVC9OUFQgbWFw
cGluZyBsYWNraW5nIHRoZSBXIHBlcm1pc3Npb24sIHdoaWNoIHdpbGwKPiA+PiBzaGF0dGVyIGhv
c3Qgc3VwZXJwYWdlcy7CoMKgIFRoZXJlZm9yZSwgcHV0dGluZyBpdCBpbiAudGV4dCBpcyBnb2lu
ZyB0byBiZQo+ID4+IHJhdGhlciBwb29yLCBwZXJmIHdpc2UuCj4gPj4KPiA+PiBJIGFsc28gbm90
ZSB0aGF0IFhlbidzIGltcGxlbWVudGF0aW9uIG9mIHRoZSBWaXJpZGlhbiBoeXBlcmNhbGwgcGFn
ZQo+ID4+IGRvZXNuJ3QgY29uZm9ybSB0byB0aGVzZSBwcm9wZXJ0aWVzLCBhbmQgd2FudHMgZml4
aW5nLsKgIEl0IGlzIGdvaW5nIHRvCj4gPj4gbmVlZCBhIG5ldyBraW5kIGlkZW50aWZpY2F0aW9u
IG9mIHRoZSBwYWdlIChwcm9iYWJseSBhIG5ldyBwMm0gdHlwZSkKPiA+PiB3aGljaCBpbmplY3Rz
ICNHUCBpZiB3ZSBldmVyIHNlZSBhbiBFUFRfVklPTEFUSU9OL05QVF9GQVVMVCBhZ2FpbnN0IGl0
Lgo+ID4+Cj4gPj4gQXMgZm9yIHN1Z2dlc3Rpb25zIGhlcmUsIEknbSBzdHJ1Z2dsaW5nIHRvIGZp
bmQgYW55IG1lbW9yeSBtYXAgZGV0YWlscwo+ID4+IGV4cG9zZWQgaW4gdGhlIFZpcmlkaWFuIGlu
dGVyZmFjZSwgYW5kIHRoZXJlZm9yZSB3aGljaCBnZm4gaXMgYmVzdCB0bwo+ID4+IGNob29zZS7C
oCBJIGhhdmUgYSBzaW5raW5nIGZlZWxpbmcgdGhhdCB0aGUgYW5zd2VyIGlzIEFDUEkuLi4KPiA+
IFRMRlMgb25seSBzYXlzICJnbyBmaW5kIG9uZSBzdWl0YWJsZSBwYWdlIHlvdXJzZWxmIiB3aXRo
b3V0IGZ1cnRoZXIKPiA+IGhpbnRzLgo+ID4KPiA+IFNpbmNlIHdlJ3JlIHN0aWxsIHF1aXRlIGZh
ciBhd2F5IGZyb20gYSBmdW5jdGlvbmluZyBzeXN0ZW0sIGZpbmRpbmcgYQo+ID4gbW9zdCBzdWl0
YWJsZSBwYWdlIGlzbid0IG15IHRvcCBwcmlvcml0eSBhdCB0aGlzIHBvaW50LiBJZiB0aGVyZSBp
cyBhCj4gPiBzaW1wbGUgd2F5IHRvIGV4dHJhcG9sYXRlIHN1aXRhYmxlIGluZm9ybWF0aW9uIGZy
b20gQUNQSSwgdGhhdCB3b3VsZCBiZQo+ID4gZ3JlYXQuIElmIGl0IHJlcXVpcmVzIHdyaXRpbmcg
YSBzZXQgb2YgZnVuY3Rpb25hbGl0aWVzLCB0aGFuIHRoYXQgd2lsbAo+ID4gbmVlZCB0byB3YWl0
IHRpbGwgbGF0ZXIuCj4gCj4gVG8gY29wZSB3aXRoIHRoZSAib25lIGlzIGFscmVhZHkgZXN0YWJs
aXNoZWQgYW5kIGl0IGlzIGFscmVhZHkgbG9ja2VkIgo+IGNhc2UsIHRoZSBvbmx5IG9wdGlvbiBp
cyB0byBoYXZlIGEgZml4bWFwIGVudHJ5IHdoaWNoIGNhbiBiZSBzZXQKPiBkeW5hbWljYWxseS7C
oCBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBmaXhtYXAgcmVnaW9uIGlzIG1hcmtlZCBOWCBhbmQg
NjRHCj4gYXdheSBmcm9tIC50ZXh0Lgo+IAo+IFBvc3NpYmx5IHRoZSBsZWFzdCBiYWQgb3B0aW9u
IGlzIHRvIGhhdmUgc29tZSBidWlsZC10aW1lIHNwYWNlIChzbyAwIG9yCj4gNGsgZGVwZW5kaW5n
IG9uIENPTkZJR19IWVBFUlYpIGJldHdlZW4gdGhlIHBlci1jcHUgc3R1YnMgYW5kCj4gWEVOX1ZJ
UlRfRU5ELCB3aGljaCBvcGVyYXRlcyBsaWtlIHRoZSBmaXhtYXAsIGJ1dCBlbmRzIHVwIGFzIFgv
Uk8gbWFwcGluZ3MuCj4gCgpPSy4gVGhpcyBpcyBwcm9iYWJseSBub3QgdG9vIGRpZmZpY3VsdC4g
Cgo+IFRoYXQgd2F5LCB0aGUgdmlydHVhbCBhZGRyZXNzIGVuZHMgdXAgaW4gYSB1c2VmdWwgcG9z
aXRpb24gKHdydCB1c2luZwo+IGRpcmVjdCBjYWxsIGluc3RydWN0aW9ucykgaXJyZXNwZWN0aXZl
IG9mIHdoZXJlIHRoZSBnZm4gaXMvZW5kcyB1cC7CoCBBcwo+IGZvciBndWVzc2luZywgYSBnb29k
IHN0YXJ0IGlzIHByb2JhYmx5IE1BWFBIWVNBRERSLgoKVG8gbWFrZSBzdXJlIEkgdW5kZXJzdGFu
ZCB5b3VyIGNvcnJlY3RseTogeW91J3JlIHRhbGtpbmcgYWJvdXQgdXNpbmcgdGhlCnBhZ2UganVz
dCBiZWxvdyBNQVhQSFlTQUREUiAoZGVyaXZlZCBmcm9tIHBhZGRyX2JpdHMgZnJvbSB4ZW4gc291
cmNlKSwKcmlnaHQ/CgpXZWkuCgo+IAo+IH5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
