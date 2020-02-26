Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996471703CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:09:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zCK-0006HK-Cb; Wed, 26 Feb 2020 16:06:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RfmG=4O=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j6zCJ-0006HF-FZ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:06:07 +0000
X-Inumbo-ID: e4da973a-58b1-11ea-aba8-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4da973a-58b1-11ea-aba8-bc764e2007e4;
 Wed, 26 Feb 2020 16:06:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w19so443118lje.13
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 08:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rOkHmsiS0f6//PB+2DsG0ZJbdhjNKUATI6VLDfv2QUo=;
 b=aVOW4DkXN1+lwT9qKfF3AfiwTzMw6FZbSrE+g3AWjm+CIv6WUCKHBc+1mFtgVs46i6
 N5aMeCPVPsHGuAIz/zl8mImy7g4KORMruCJyy8jwKNXGwrWVra8GR2sZgS4o8sRKp6rr
 NCHSRKT+rIi8niMsvuPNCYWPhwmhGNJhuUlzkQhe0RpLqaA5fdePQGGJKoqk5rO4QyZM
 1HByFvG7UsHUneZCa9PlBe0RtW/KHNkZD+wyKM8CqMuMlJD19qa/SVdXVncGofsm+0DC
 j3RCBMJT6VP8Vlz6KqaXZRGt9Q9BBPqs4lsBsRZIPX5QT6tbrs4PAXIy/axB6szWzLZh
 KYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rOkHmsiS0f6//PB+2DsG0ZJbdhjNKUATI6VLDfv2QUo=;
 b=h+RguxCIDMn2CawMXrJZQfukZOih+Ger4nN3DAUcov08uihYRij9OXIIhUpK/Ro2As
 NMyVBJ1R9LbCgcpQBeyg1XUSWBIhQ1Aja+HH9zA/OF/lDAAcyhEnHBrZ667tdSVz/HcQ
 A7D33jSj3vGjK0OF3rB7aBQ8Rdlej74cAuYrl+Px4APnlOUHloJ4ELRgGnkbxGnha/Hg
 eCEotq4q4ZqbUsvw3HWIybr9t5HFNrJbLBPbpTmK55iuCpHuKnjkECGg6Kcwrc84Cd0b
 01ltJdXrmdVWohpmxIyOSbgIcRHO6xw8zhN7c76UIq4Qeex6LhKMC0D3QDdnDhDCb/iu
 YkTA==
X-Gm-Message-State: APjAAAW/CMb6lodz0xrIfz4dDTfdsUbbyW1k1JvzWd9V0OiWBvGc827V
 LctXPpIrzT9o4512rMKqskARKP7bhu4FiDC4bj+42+Fa
X-Google-Smtp-Source: APXvYqwPhE8fFFZWSvb3fpyLYACpkLCLGglP3CXXXXs+FA7Php+GHcnq18GBnS5bBdCTeXqJGndF8wCdTipRDjotupM=
X-Received: by 2002:a2e:6c06:: with SMTP id h6mr3517488ljc.246.1582733165547; 
 Wed, 26 Feb 2020 08:06:05 -0800 (PST)
MIME-Version: 1.0
References: <20200226152013.12200-1-jandryuk@gmail.com>
 <20200226152013.12200-2-jandryuk@gmail.com>
 <24150.37734.588539.567057@mariner.uk.xensource.com>
In-Reply-To: <24150.37734.588539.567057@mariner.uk.xensource.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Feb 2020 11:05:54 -0500
Message-ID: <CAKf6xpu=X0a1-AsBJ=JwzBFo0evdk0JtQoAWXShkyatWy1BAOA@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH 1/2] tools/helpers: Introduce
 cmp-fd-file-inode utility
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
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMTA6NDggQU0gSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gSmFzb24gQW5kcnl1ayB3cml0ZXMgKCJbUEFUQ0ggMS8y
XSB0b29scy9oZWxwZXJzOiBJbnRyb2R1Y2UgY21wLWZkLWZpbGUtaW5vZGUgdXRpbGl0eSIpOgo+
ID4gVGhpcyBpcyBhIEMgaW1wbGVtZW50YXRpb24gb2YgdGhlIHBlcmwgY29kZSBpbnNpZGUgb2Yg
bG9ja2luZy5zaCB0bwo+ID4gY2hlY2sgdGhhdCB0aGUgbG9ja2VkIGZpbGUgZGVzY3JpcHRvciBh
bmQgbG9jayBmaWxlIHNoYXJlIHRoZSBzYW1lIGlub2RlCj4gPiBhbmQgdGhlcmVmb3JlIG1hdGNo
LiAgT25lIGNoYW5nZSBmcm9tIHRoZSBwZXJsIHZlcnNpb24gaXMgcmVwbGFjaW5nCj4gPiBwcmlu
dGluZyAieSIgb24gc3VjY2VzcyB3aXRoIGV4aXQgdmFsdWVzIG9mIDAgKHNoZWxsIFRydWUpIGFu
ZCAxIChzaGVsbAo+ID4gRmFsc2UpLgo+Cj4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIHVz
ZSBzdGF0KDEpID8gIE9uIExpbnV4Cj4gICAgc3RhdCAtTCAtYyVELiVpIC9kZXYvc3RkaW4gYmxh
aC5sb2NrCj4gb3Igc29tZSBzdWNoLCBhbmQgdGhlbiBjb21wYXJlIHRoZSB0d28gbnVtYmVycy4K
Pgo+IEknbSByZWx1Y3RhbnQgdG8gaG9zdCBhIGdlbmVyYWwtcHVycG9zZSBzaGVsbCB1dGlsaXR5
IGluIHhlbi5naXQsIG5vCj4gbWF0dGVyIGhvdyB1c2VmdWwuLi4KClRoYW5rcyBmb3IgdGFraW5n
IGEgbG9vay4KCkknZCBiZSBoYXBweSB0byB1c2Ugc3RhdCBpZiBpdCB3b3Jrcy4gIFRoZSBjb21t
ZW50IGluIGxvY2tpbmcuc2ggYWJvdmUKdGhlIHVzYWdlIGlzOgogICAgICAgICMgV2UgY2FuJ3Qg
anVzdCBzdGF0IC9kZXYvc3RkaW4gb3IgL3Byb2Mvc2VsZi9mZC8kX2xvY2tmZCBvcgogICAgICAg
ICMgdXNlIGJhc2gncyB0ZXN0IC1lZiBiZWNhdXNlIHRob3NlIGFsbCBnbyB0aHJvdWdoIHdoYXQg
aXMKICAgICAgICAjIGFjdHVhbGx5IGEgc3ludGhldGljIHN5bWxpbmsgaW4gL3Byb2MgYW5kIHdl
IGFyZW4ndAogICAgICAgICMgZ3VhcmFudGVlZCB0aGF0IG91ciBzdGF0KDIpIHdvbid0IGxvc2Ug
dGhlIHJhY2Ugd2l0aCBhbgogICAgICAgICMgcm0oMSkgYmV0d2VlbiByZWFkaW5nIHRoZSBzeW50
aGV0aWMgbGluayBhbmQgdHJhdmVyc2luZyB0aGUKICAgICAgICAjIGZpbGUgc3lzdGVtIHRvIGZp
bmQgdGhlIGludW0uICBQZXJsIGlzIHZlcnkgZmFzdCBzbyB1c2UgdGhhdC4KCi4uLndoaWNoIEkg
dGhvdWdodCBydWxlZCBvdXQgc3RhdC4KClJlZ2FyZHMsCkphc29uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
