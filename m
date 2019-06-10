Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2FC3BDEE
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 23:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haRNg-0000FM-OY; Mon, 10 Jun 2019 20:59:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m4ix=UJ=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1haRNf-0000FG-5i
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:59:03 +0000
X-Inumbo-ID: 92ab7612-8bc2-11e9-8980-bc764e045a96
Received: from mail-yw1-xc42.google.com (unknown [2607:f8b0:4864:20::c42])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92ab7612-8bc2-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:59:01 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id m80so4328822ywd.11
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 13:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BMWy3ohj2zLak8Jhrfv29KcYtpY2vVHAsjJl485NXFU=;
 b=IDU1ejz8F/ICbao+Z/t7kqb75jTo7ZOJge/njGM3fw+oewZ3t+4UQ+u2m6q9Yb9sg5
 BHjsI6h7gMu0/WkkrzQBFC5oPIMhrBABHh2eoK5vwXrSsoSNyadcGDvwmFqElHQiA6pM
 dGe4/UIzVRamzA86hSwI31zq/uBBlxBkuOQCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=BMWy3ohj2zLak8Jhrfv29KcYtpY2vVHAsjJl485NXFU=;
 b=CXGu69MW13pFB2BZWkL+u2sB2VC9tBBIzroI9jiuUEOqJ3zb3p7y0xr++DkjNT1C+g
 EDfjImo7KspUtQV6ieMGOI4QOfzpKaWLUYBxqrc+MS8LPXQzcSYo5ftJNaJwc4uwNhZ9
 AJQi4XHXneLtSE4tO4ZIAXbckm7J2kAa4qUZistfMRJ7/iI4wA8uWuqujSNi1wjR376W
 cJy7t1Yp/A4ZljNsd1GnsKqWvhIjuZ2aWFv/QVByM0AGvDnX+bR+KDeHUjY7LzwMWR3h
 Lcj3BH4u8EhVDsWSQVf05YWPjoyARmtEuPmzV4ASJKpGDt4TI/hrBqFB3eaRhzDc8Kkd
 dyXQ==
X-Gm-Message-State: APjAAAUszHsosO+L2XEO+FbTRGA+1hPp/MpasWI7YsGgIpvFwUKWt6HR
 EQpYE75F+Su6rQ0vZrXEazQ44A==
X-Google-Smtp-Source: APXvYqxNFVYBIhOD3JPbBS1/L7rNaPxkGeXpHl4Tv3/jhtoXYzjVrRM5GZsGQLSq649GtAcAdRtpfQ==
X-Received: by 2002:a81:834c:: with SMTP id t73mr17016402ywf.74.1560200341039; 
 Mon, 10 Jun 2019 13:59:01 -0700 (PDT)
Received: from doug-macbook.localdomain
 ([2600:1700:7b90:52f0:3d7a:9971:564f:2532])
 by smtp.gmail.com with ESMTPSA id t4sm3322244ywa.69.2019.06.10.13.59.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 13:59:00 -0700 (PDT)
Date: Mon, 10 Jun 2019 15:58:59 -0500
From: Doug Goldstein <cardoe@cardoe.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190610205859.gme3krz3cd2njvxm@doug-macbook.localdomain>
Mail-Followup-To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
References: <1560189148-25219-1-git-send-email-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1560189148-25219-1-git-send-email-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] automation: Add an 'all' target for
 container maintenance
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdW4gMTAsIDIwMTkgYXQgMDY6NTI6MjhQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgo+IC0tLQo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBEb3VnIEdvbGRz
dGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRv
ZUBjYXJkb2UuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
