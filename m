Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFCAF694
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 09:18:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7wq1-000846-5y; Wed, 11 Sep 2019 07:14:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mMAu=XG=phlegethon.org=tjd@srs-us1.protection.inumbo.net>)
 id 1i7wpy-000841-NL
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 07:14:47 +0000
X-Inumbo-ID: d47c54be-d463-11e9-b76c-bc764e2007e4
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d47c54be-d463-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 07:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=phlegethon.org; s=2018070101; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRnN7sXKpWzHjwcuJvcMzoRWrXtn+rLjGpkkvUSF6pY=; b=FjZo5HLslaIka8fFhmT9IMtui
 t1xhmEZveiCRuvLip9Qq3EwdFmV8zJ5mXRAoIlMF9ydE3w10WXAjUbIQCh3uzF2hUbkHfsFtMfNQy
 lWKyqc0Rlx81Zu+3fWgqrYPKkaTsPSFFvkxrgl5t4mHiX9GTHTDiwC6I6jfIMIf+DfSigAZHb+ywr
 g1/97l9D+NZVxEstB9zR4Tlx7cjpSiV2P2kcIkMIEJZN2m5Jj0oYCXbWlxNBdTVHPOo3k2bsXgZbA
 fnw/N6MBas5ZlPXpPEIUfMhIjXWbWjuHAb35PFhX7vtHd7Xr4UHwIq56NQsImAmjI9OD4Q+Bs08F0
 9pTbiKQPA==;
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.2 (FreeBSD))
 (envelope-from <tjd@phlegethon.org>)
 id 1i7wpu-000JC0-7t; Wed, 11 Sep 2019 07:14:42 +0000
Date: Wed, 11 Sep 2019 08:14:42 +0100
From: Tim Deegan <tjd@phlegethon.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190911071442.GA73758@deinos.phlegethon.org>
References: <9deab964-2685-3c04-9e4c-e3df04885742@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9deab964-2685-3c04-9e4c-e3df04885742@suse.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tjd@phlegethon.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH] x86/shadow: fold p2m page accounting into
 sh_min_allocation()
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTA6MzQgKzAyMDAgb24gMDUgU2VwICgxNTY3Njc5Njg3KSwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gVGhpcyBpcyB0byBtYWtlIHRoZSBmdW5jdGlvbiBsaXZlIHVwIHRvIHRoZSBwcm9taXNlIGl0
cyBuYW1lIG1ha2VzLiBBbmQKPiBpdCBzaW1wbGlmaWVzIGFsbCBjYWxsZXJzLgo+IAo+IFN1Z2dl
c3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogVGlt
IERlZWdhbiA8dGltQHhlbi5vcmc+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
