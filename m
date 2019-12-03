Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F656110254
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 17:32:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icB3o-0001Zi-FP; Tue, 03 Dec 2019 16:30:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icB3n-0001ZX-J3
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:29:59 +0000
X-Inumbo-ID: 259f5b94-15ea-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 259f5b94-15ea-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 16:29:59 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so4496681wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 08:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=i7DCSZ8SSLzczbTHo+K2SX2kuigqQeVpWOdAps1fqPw=;
 b=mM6GVo/CNEoKkn5kwKWuaeBA3cXlnW9KQAkongaBeWyJbe1ZDxTWPX0VVUdirop5FY
 xg1qMydrfGoUisb9XDUB5xDodg09gKWfnO98/zhx6ZQBTRf+V1rivd5gHXcOGlEPf3dc
 0ZDLiiVD7GQ5Qv/g2OHCbdCN4xskgfeVVejC27uCa4laEx2hWUwc5cbiUXNIikDL8fl2
 AF2wkha6Lyx6uhTZY+1fjRWglmSSSr4XLUt6wlaUC67QYlR4dtPwsNIO+WnG0a/El+ZW
 yAr1kBkOrQpDecNgmiL0ChuhFFGSr0XQe4pBXP1NvrcK3Mvj9rtm1oasmKosMWMQJc52
 d1CQ==
X-Gm-Message-State: APjAAAUEPCia8SmHIwGvd6xBF1CVFAo8Jd1ZYZUaTxk0mawf8zZohbzm
 5JBw/71Rt4kLJAQ3Bz9Q2ZM=
X-Google-Smtp-Source: APXvYqy1izYrXmRPDZg4XSAnznsncRS+sJdOV0PDcR11SLi1bcVjDmPAJdylHEU6lDQiNV/JsF6i8Q==
X-Received: by 2002:adf:e591:: with SMTP id l17mr5660690wrm.139.1575390598343; 
 Tue, 03 Dec 2019 08:29:58 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id n8sm4213833wrx.42.2019.12.03.08.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:29:57 -0800 (PST)
Date: Tue, 3 Dec 2019 16:29:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203162956.l5q7rxxvxcmhftfm@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-7-liuwe@microsoft.com>
 <6da5cf63-3db8-f16f-7236-3e28683178ec@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6da5cf63-3db8-f16f-7236-3e28683178ec@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 6/8] x86: switch xen guest implementation
 to use hypervisor framework
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDM6NTI6NDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiA+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gCj4gQWNrZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBhZ2FpbiB3aXRoIG9uZSBtb3JlIHJlbWFyazoKPiAK
PiA+IEBAIC0zMjYsNiArMzEwLDMxIEBAIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCkKPiA+
ICAgICAgICAgIHB2X2NvbnNvbGVfaW5pdCgpOwo+ID4gIH0KPiA+ICAKPiA+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzIHhnX29wcyA9IHsKPiAKPiBBbG9uZyB3aXRoIG90aGVy
IHN0YXRpYyB2YXJpYWJsZSBub3QgaGF2aW5nIGFuIHhnXyBwcmVmaXgsCj4gdGhpcyBvbmUgY291
bGQgbG9zZSBpdHMgb25lLCB0b28uIEJ1dCBJJ20gbm90IGdvaW5nIHRvIG1ha2UKPiB0aGlzIGEg
cmVxdWlyZW1lbnQuCgpJIHdpbGwgZHJvcCB0aGUgeGdfIHByZWZpeCBsb2NhbGx5IHBlciB5b3Vy
IGNvbW1lbnQgaGVyZS4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
