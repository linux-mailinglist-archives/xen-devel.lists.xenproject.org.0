Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05812D01A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 13:54:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iluUt-0002J9-OE; Mon, 30 Dec 2019 12:50:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4aY4=2U=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iluUs-0002J4-GO
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 12:50:10 +0000
X-Inumbo-ID: e8f84a24-2b02-11ea-a02e-12813bfff9fa
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8f84a24-2b02-11ea-a02e-12813bfff9fa;
 Mon, 30 Dec 2019 12:50:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id g17so32553197wro.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Dec 2019 04:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=K63iJpTQzvGuj9of5DSlH0zE8xCCHHZOF1PWbb7du4M=;
 b=QfI2N8sI157mVdFje8NtExb2bddPt6R37vLCxzMZ46pSY3W5D00ueZppHGvwaIWP4F
 FF5uCoAcKwgwpFqWYOBIH4/B4nSIWZ8TTN6fPRNm5kWJyJmytyzeGJHuyz4zDxuu5u7z
 IvbrU/7/PV5LInUidHb3ntA9gcMchnj+ut44UdIC0ivyH3v4dIAE/j4UijSxU3xOOQtY
 huSqU9mMOh351m5PSYpzc9l/FD0+65jjZa8wBYHK1/Rr3eSBfL9sZQYK6BgqzbUlzey3
 V//YdDCnQWwnaMYfC7vIzZwWayQbinUgKKurUD+beKugVJxvuot4n1kJMBGg+mStMOsQ
 zY/w==
X-Gm-Message-State: APjAAAWGKWh9Sr48dQQfERumNHtBe+e84M/lZVTgSTySnvTyAj6HLLmi
 aqpgkLLe1BokCi3TYnJjrF4=
X-Google-Smtp-Source: APXvYqz3oEESogEpRy4hPvb6c9xAtTmmO0VYcmsgjqgEwL22p0B/y4jKsFPPXyfef37W7j4nAQEYeA==
X-Received: by 2002:a5d:4d8d:: with SMTP id b13mr70467654wru.6.1577710208295; 
 Mon, 30 Dec 2019 04:50:08 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id v14sm45040211wrm.28.2019.12.30.04.50.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2019 04:50:07 -0800 (PST)
Date: Mon, 30 Dec 2019 12:50:05 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191230125005.q7ugafs3tu3itls7@debian>
References: <20191227134516.15530-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191227134516.15530-1-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools/libxl: Reposition build_pre() logic
 between architectures
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
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMDE6NDU6MTZQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgY2FsbCB0byB4Y19kb21haW5fZGlzYWJsZV9taWdyYXRlKCkgaXMgbWFkZSBv
bmx5IGZyb20geDg2LCB3aGlsZSBpdHMKPiBoYW5kbGluZyBpbiBYZW4gaXMgY29tbW9uLiAgTW92
ZSBpdCB0byB0aGUgbGlieGxfX2J1aWxkX3ByZSgpLgo+IAo+IGh2bV9zZXRfY29uZl9wYXJhbXMo
KSwgaHZtX3NldF92aXJpZGlhbl9mZWF0dXJlcygpLAo+IGh2bV9zZXRfbWNhX2NhcGFiaWxpdGll
cygpLCBhbmQgdGhlIGFsdHAybSBsb2dpYyBpcyBhbGwgaW4gY29tbW9uCj4gY29kZSAocGFydHMg
aWZkZWYnZCkgYnV0IGRlc3BpdGUgdGhpcywgaXMgYWxsIGFjdHVhbGx5IHg4NiBzcGVjaWZpYy4K
PiAKPiBNb3ZlIGl0IGludG8geDg2IHNwZWNpZmljIGNvZGUsIGFuZCBmb2xkIGFsbCBvZiB0aGUg
eGNfaHZtX3BhcmFtX3NldCgpIGNhbGxzCj4gdG9nZXRoZXIgaW50byBodm1fc2V0X2NvbmZfcGFy
YW1zKCkgaW4gYSBmYXIgbW9yZSBjb2hlcmVudCB3YXkuCj4gCj4gRmluYWxseSAtIGVuc3VyZSB0
aGF0IGFsbCBoeXBlcmNhbGxzIGhhdmUgdGhlaXIgcmV0dXJuIHZhbHVlcyBjaGVja2VkLgo+IAo+
IE5vIHByYWN0aWNhbCBjaGFuZ2UgaW4gY29uc3RydWN0ZWQgZG9tYWlucy4gIEZld2VyIHVzZWxl
c3MgaHlwZXJjYWxscyBub3cgdG8KPiBjb25zdHJ1Y3QgYW4gQVJNIGd1ZXN0Lgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpJJ20g
ZmluZSB3aXRoIG1vdmluZyB0aGUgY29kZS4gQUlVSSBBcm0gZ3Vlc3RzIGFsc28gbmVlZCB0byBz
ZXQgYXQgbGVhc3QKb25lIGh2bSBwYXJhbSBmb3IgY2FsbGJhY2sgdmVjdG9yLCBidXQgdGhhdCdz
IGFscmVhZHkgaGFuZGxlZCBpbgpsaWJ4bF9hcm0uYy4KCkFzIGZhciBhcyBJIGNhbiB0ZWxsIHRo
ZSBjb2RlIGlzIGNvcnJlY3QsIHRoZXJlIGlzIG5vIGNvZGUgaW4gYmV0d2Vlbgp0aGUgbW92ZWQg
Y29kZSB0aGF0IGRlcGVuZHMgb24gc29tZSBvZiB0aGUgZmllbGRzIGJlaW5nIHNldCBpbiBhCnNw
ZWNpZmljIG9yZGVyLCBzbzoKCkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
