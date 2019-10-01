Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E611C3391
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 13:59:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFGlk-0003rJ-TK; Tue, 01 Oct 2019 11:56:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=emkH=X2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iFGlj-0003r8-3H
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 11:56:39 +0000
X-Inumbo-ID: 860c77ac-e442-11e9-bf31-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id 860c77ac-e442-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 11:56:38 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so15170520wrx.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 04:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=R3BpaO/5j6G8MDlf8VGjBeoX3UKRw2f0EL8YpwZOxEs=;
 b=Pm4mNfcibt8aVqGI5h4dACzvmO7ZpaxEi/mDVqaP2VpKUWs0ULNpUH5fXOSkEuL/H0
 p0aLndJD7MUcUBecD/inxqZkeUNtRCtwyOmUdNVOrvdrWMj9JkCBSusWFEQTprnvH+NA
 z66bpd+XT7V3PIzo9vVWOhBBNH5z0bKfL5fxWWMCPIIXkyz/HiaECJgXWgV9zMY6kdvJ
 rGtRbnadA2hUvsX03/tY71qyDhCmXwEVpzw3YhB8TuLOf1ijKC/k4hLmmbyZZTXiB5DU
 oka6Qz3a7TbJ4eWCtF3jVESqgM1XWnpKibVBgs+VP1RAVtGs3W8DyW6q1/xj9XElAXqe
 FxTQ==
X-Gm-Message-State: APjAAAWDKTzBSWXYhkd1IOatmU9ERRtWvvO4aWst4KxOPpN9FqrBcA5j
 RHWgbeRF+G0xzMHi5mnhIB0=
X-Google-Smtp-Source: APXvYqyG8o2XQTxszht1Kirtf3nO4nsEYwFwzU5DFJswsVfJYx30VZSjc6U3giKghRephkW9iLCXpg==
X-Received: by 2002:adf:ce86:: with SMTP id r6mr3008935wrn.57.1569930997660;
 Tue, 01 Oct 2019 04:56:37 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id r7sm16360242wrx.87.2019.10.01.04.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:56:37 -0700 (PDT)
Date: Tue, 1 Oct 2019 12:56:35 +0100
From: Wei Liu <wl@xen.org>
To: Hongyan Xia <hongyax@amazon.com>
Message-ID: <20191001115635.ppzoacxypjjx5nzu@debian>
References: <cover.1569833766.git.hongyax@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1569833766.git.hongyax@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2 00/55] Switch to domheap for Xen PTEs
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
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTE6MzI6NTJBTSArMDEwMCwgSG9uZ3lhbiBYaWEgd3Jv
dGU6Cj4gVGhpcyBzZXJpZXMgaXMgbW9zdGx5IFdlaSdzIGVmZm9ydCB0byBzd2l0Y2ggZnJvbSB4
ZW5oZWFwIHRvIGRvbWhlYXAgZm9yCj4gWGVuIHBhZ2UgdGFibGVzLiBJbiBhZGRpdGlvbiwgSSBo
YXZlIGFsc28gbWVyZ2VkIHNldmVyYWwgYnVnIGZpeGVzIGZyb20KPiBteSAiUmVtb3ZlIGRpcmVj
dCBtYXAgZnJvbSBYZW4iIHNlcmllcyBbMV0uIEFzIHRoZSB0aXRsZSBzdWdnZXN0cywgdGhpcwo+
IHNlcmllcyBzd2l0Y2hlcyBmcm9tIHhlbmhlYXAgdG8gZG9taGVhcCBmb3IgWGVuIFBURXMuCj4g
Cj4gVGhpcyBpcyBuZWVkZWQgdG8gYWNoaWV2ZSB0aGUgdWx0aW1hdGUgZ29hbCBvZiByZW1vdmlu
ZyB0aGUKPiBhbHdheXMtbWFwcGVkIGRpcmVjdCBtYXAgZnJvbSBYZW4uIFRvIHdvcmsgd2l0aG91
dCBhbiBhbHdheXMtbWFwcGVkCj4gZGlyZWN0IG1hcCwgWGVuIFBURSBtYW5pcHVsYXRpb25zIHRo
ZW1zZWx2ZXMgbXVzdCBub3QgcmVseSBvbiBpdC4KPiBVbmZvcnR1bmF0ZWx5LCBQVEUgQVBJcyBj
dXJyZW50bHkgdXNlIHRoZSB4ZW5oZWFwIHRoYXQgZG9lcyBub3Qgd29yawo+IHdpdGhvdXQgdGhl
IGRpcmVjdCBtYXAuIEJ5IHN3aXRjaGluZyB0byBkb21oZWFwIEFQSXMsIGl0IGlzIG11Y2ggZWFz
aWVyCj4gZm9yIHVzIHRvIGJyZWFrIHRoZSByZWxpYW5jZSBvbiB0aGUgZGlyZWN0IG1hcCBsYXRl
ciBvbiwgbm90IG9ubHkgZm9yCj4gUFRFcyBidXQgZm9yIGFsbCBvdGhlciBtZW1vcnkgYWxsb2Nh
dGlvbnMgYXMgd2VsbC4KPiAKPiBJIGhhdmUgYnJva2VuIGRvd24gdGhlIGRpcmVjdCBtYXAgcmVt
b3ZhbCBzZXJpZXMgaW50byB0d28uIFRoaXMgc2VyaWVzCj4gaXMgdGhlIGZpcnN0IGJhdGNoLiBU
aGUgcGF0Y2hlcyBjaGFuZ2UgdGhlIGxpZmUgY3ljbGUgb2YgWGVuIFBURXMgZnJvbQo+IGFsbG9j
LWZyZWUgdG8gYWxsb2MtbWFwLXVubWFwLWZyZWUsIHdoaWNoIG1lYW5zIFBURXMgbXVzdCBiZSBl
eHBsaWNpdGx5Cj4gbWFwcGVkIGFuZCB1bm1hcHBlZC4gVGhpcyBhbHNvIG1ha2VzIHNlbnNlIHRv
IGJlIHRoZSBmaXJzdCBiYXRjaCBmcm9tIGEKPiBzdGFiaWxpdHkgUG9WLCBzaW5jZSB0aGlzIGlz
IGp1c3QgYW4gQVBJIGNoYW5nZSBhbmQgdGhlIGRpcmVjdCBtYXAgaGFzCj4gbm90IGJlZW4gYWN0
dWFsbHkgcmVtb3ZlZC4gRnVydGhlciwgdGhlIG1hcCBhbmQgdW5tYXAgaW4gdGhlIHJlbGVhc2UK
PiBidWlsZCB1c2UgdGhlIGRpcmVjdCBtYXAgYXMgYSBmYXN0IHBhdGgsIHNvIHRoZXJlIGlzIGFs
c28gbm8gcGVyZm9ybWFuY2UKPiBkZWdyZWRhdGlvbiBpbiBhIHJlbGVhc2UgYnVpbGQuCj4gCj4g
SSBoYXZlIHRlc3RlZCBib3RoIGRlYnVnIGFuZCByZWxlYXNlIGJ1aWxkIG9uIGJhcmUtbWV0YWwg
YW5kIG5lc3RlZAo+IHZpcnR1YWxpc2F0aW9uLiBJIGFtIGFibGUgdG8gcnVuIFBWIGFuZCBIVk0g
Z3Vlc3RzIGFuZCBYVEYgdGVzdHMgd2l0aG91dAo+IGNyYXNoZXMgc28gZmFyIG9uIHg4Ni4gSSBh
bSBhYmxlIHRvIGJ1aWxkIG9uIEFBcmNoNjQuCj4gCj4gVGhpcyBzZXJpZXMgaXMgYXQgaHR0cHM6
Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2h4MjQyL3hlbi5naXQsCj4geGVuX3B0
ZV9tYXAgYnJhbmNoLgo+IAo+IC0tLQo+IENoYW5nZWQgc2luY2UgdjE6Cj4gLSBzcXVhc2ggc29t
ZSBjb21taXRzCj4gLSBtZXJnZSBidWcgZml4ZXMgaW50byB0aGlzIGZpcnN0IGJhdGNoCj4gLSBy
ZWJhc2UgYWdhaW5zdCBsYXRlc3QgbWFzdGVyCgpGWUkgaW4gdGhlIGZ1dHVyZSBpdCBpcyBiZXR0
ZXIgdG8gcmViYXNlIGFnYWluc3Qgc3RhZ2luZy4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
