Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C716C415A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 21:55:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFOD9-0006vB-TZ; Tue, 01 Oct 2019 19:53:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFOD8-0006v5-A2
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 19:53:26 +0000
X-Inumbo-ID: 20ef28f5-e485-11e9-9707-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 20ef28f5-e485-11e9-9707-12813bfff9fa;
 Tue, 01 Oct 2019 19:53:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6EF420842;
 Tue,  1 Oct 2019 19:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569959605;
 bh=PgH639NT+C+vmD+FDXWnUQ+U6viXLiFryvYvfd8KWyg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=r17enuzJNxyp/R8Cy/NjZWEYXYTCSToKqwwKAWi9cLFvLER512+mCvADdSRET0Zqy
 ep8EgHZGVliusLfgsUMMt7BvTeduxyhzR4+5FugfVqhTph6198MW3g9lWkVvoAZKQf
 aEu6YD9uz99BXtXTW0exh+t0kmIe4ByFRuj3RHWE=
Date: Tue, 1 Oct 2019 12:53:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <874l0y9dlz.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1910011253120.20899@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-2-julien.grall@arm.com> <874l0y9dlz.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 01/10] xen/arm64: entry:
 Introduce a macro to generate guest vector and use it
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSGVsbG8g
SnVsaWVuLAo+IAo+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4gCj4gPiBNb3N0IG9mIHRoZSBndWVz
dCB2ZWN0b3JzIGFyZSB1c2luZyB0aGUgc2FtZSBwYXR0ZXJuLiBUaGlzIG1ha2VzIGZhaXJseQo+
ID4gdGVkaW91cyB0byBhbHRlciB0aGUgcGF0dGVybiBhbmQgcmlzayBpbnRyb2R1Y2luZyBtaXN0
YWtlcyB3aGVuIHVwZGF0aW5nCj4gPiBlYWNoIHBhdGguCj4gPgo+ID4gQSBuZXcgbWFjcm8gaXMg
aW50cm9kdWNlZCB0byBnZW5lcmF0ZSB0aGUgZ3Vlc3QgdmVjdG9ycyBhbmQgbm93IHVzZSBpdAo+
ID4gaW4gdGhlIG9uZSB0aGF0IHVzZSB0aGUgb3Blbi1jb2RlIHZlcnNpb24uCj4gPgo+ID4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdl
ZC1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKUmV2
aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
