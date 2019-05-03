Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C45B12F98
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 15:52:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMYYb-00021w-BV; Fri, 03 May 2019 13:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQLm=TD=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hMYYZ-00021i-6c
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:48:55 +0000
X-Inumbo-ID: 2a49f44e-6daa-11e9-9e84-175de7f87fc7
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a49f44e-6daa-11e9-9e84-175de7f87fc7;
 Fri, 03 May 2019 13:48:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1556891323; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=69s/w3eXVVOB2YvXVKp+KFTRRSrd42tCTOzMHno26Xk=;
 b=X2iBW6c3V7KLu7JdyycLVi81xgFAMQCvf/kJcLRZl7mQVMrF2XCR4rrIZmnsFFAb+R5FYx4C
 UGPwggWVgOZlblfgq5YVg5nbiOfRJjNFFj6XTW0jRuUytt3/PhE1WyrItp9BtgwPy5hJQ8Ub
 D40IIwtT4YqejjmVOGHCNCOvBs0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mxa.mailgun.org with ESMTP id 5ccc46ba.7f1f7c149df0-smtp-out-n01;
 Fri, 03 May 2019 13:48:42 -0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p16so6844064wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 06:48:41 -0700 (PDT)
X-Gm-Message-State: APjAAAW4v13DCLCtlvb6lqgCSacS13J5aL0Ds7ll6/XbZCkEyVs3A5yP
 VOZfc89c6v5b0ljV/oiHrT7kdwKb4RNOl7Yg3Yo=
X-Google-Smtp-Source: APXvYqykeYcq86C/7i/w8Tf1kSZBKD18NPZOiz8LFJyMVPdr77EW1k/iUIIRaXGR10DGjTCVZzEYWAEDiVzL2/1qi9g=
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr6522182wma.53.1556891320988; 
 Fri, 03 May 2019 06:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
In-Reply-To: <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 3 May 2019 07:48:03 -0600
X-Gmail-Original-Message-ID: <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
Message-ID: <CABfawhnW6++ptuOwcMHV=1Fqk7MD7MHNTKEDY2w9UFztRe3YCw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjEyIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDMuMDUuMTkgYXQgMDA6MTMsIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPiA+IEBAIC0xMDAyLDcgKzk4OSwxMCBAQCBzdGF0aWMgaW50IHNoYXJl
X3BhZ2VzKHN0cnVjdCBkb21haW4gKnNkLCBnZm5fdCBzZ2ZuLCBzaHJfaGFuZGxlX3Qgc2gsCj4g
PiAgICAgIC8qIEZyZWUgdGhlIGNsaWVudCBwYWdlICovCj4gPiAgICAgIGlmKHRlc3RfYW5kX2Ns
ZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkKPiA+ICAgICAgICAg
IHB1dF9wYWdlKGNwYWdlKTsKPiA+IC0gICAgcHV0X3BhZ2UoY3BhZ2UpOwo+ID4gKwo+ID4gKyAg
ICBCVUdfT04oIXB1dF9jb3VudCk7Cj4gPiArICAgIHdoaWxlICggcHV0X2NvdW50LS0gKQo+ID4g
KyAgICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUoY3BhZ2UpOwo+Cj4gU3RyaWN0bHkgc3BlYWtpbmcg
SSB0aGluayB0aGUgQlVHX09OKCkgc2hvdWxkIGJlIG1vdmVkIGFoZWFkIG9mIHRoZQo+IGlmKCkg
aW4gY29udGV4dCwgc28gdGhhdCBhIHByb2JsZW1hdGljIHB1dF9wYWdlKCkgd291bGQgbm90IGdl
dAo+IGV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0aGUgc3lzdGVtIGlzIHRv
IGRpZSBzb29uIGFmdGVyKS4KCkkgZG9uJ3QgZm9sbG93IC0gd2hlcmUgaXMgdGhlIHByb2JsZW1h
dGljIHB1dF9wYWdlKCk/IEFuZCB3aHkgaXMgaXQgcHJvYmxlbWF0aWM/CgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
