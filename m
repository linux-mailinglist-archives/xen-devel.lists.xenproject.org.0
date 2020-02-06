Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21877154B75
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 19:49:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izmAq-0005wQ-KT; Thu, 06 Feb 2020 18:46:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uqUj=32=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1izmAp-0005wL-4S
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 18:46:47 +0000
X-Inumbo-ID: 06314786-4911-11ea-b2cb-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 06314786-4911-11ea-b2cb-bc764e2007e4;
 Thu, 06 Feb 2020 18:46:46 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id 203so4833678lfa.12
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2020 10:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNtfkRj/2X7/o5pXHo5K4r84pXmqNESvZ3Qr9rR0Z4A=;
 b=A/QoX9O4Axsb49lvcfPPFNboQPjLfOUfFi55Cc1rMiopUSe9R7mxJVMan9eJTeltfe
 Gwr2jaVJukyM9Y4xD29p6rKoiaah8KewV940zC2IKf6gBB6Tgl9Bb0a92/aRve378Ol3
 hVJEWjKmW7R7un3Ai7EMskwZGKCGyjJpnAaa50Ra1LR+n8tp3ET1IPGeLGidCfv4RRMo
 ikveOQufP8dS+CnpJy+DnWsoyXybNoP2CwSoGoSt00N3w4qIPW39QpbShsPAVKnaE99E
 1o9Mdnk7IwIRr0o6RzG8sFq3Nn7u94SuwaeWNWX/HtMGuA1guqprzsm/EK65tpRIKNGi
 Kuog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNtfkRj/2X7/o5pXHo5K4r84pXmqNESvZ3Qr9rR0Z4A=;
 b=VdUmiug2WLhue3X+6ORNR7uw6PcgCt4HOjPUt4Le2Xu7BgGCfoWrBO01HkF0X7wF5x
 0fBC0ZCSOIZgShcSWbDBplfGR7iXI/m7T1yD5w+skJ+w8DQXkSrw8MPezXg1gbePiRsM
 ObsuOtUKI6ZRk6744mzHPkG7UCzRmMHxlClNWpVUSfIQiuNRHHIa5hMEZYRm/KktmGcz
 MsjFIVrXPvTIsciqDghGFaSRi9MGm9wXXnwPZZAVm3SciYk5y+x8Rze8fYvdv9m+Zu//
 rdAZYhhg0fbiZ4qE7ynajMMXhgYtNYyDfZN50T7CvP1YvlCCZN63cldOqsbfxBjIZdh+
 HVOQ==
X-Gm-Message-State: APjAAAUATGJ920gqdysDw2fWOI9IEAUoIqKSPn/c3Hi2UqoxQ8SIabyu
 b+4ppiAMg6cRMz3YRwwM843ltM2W32OcV1eMhkU=
X-Google-Smtp-Source: APXvYqxYu3sRqfHL0pW4kYWNdOP4GQqFfxqibyviV1LXfAc7oD0x7HEg0VxECoyGcbyXukV65fhqBg3J3gtRwCNIRtM=
X-Received: by 2002:a19:22cc:: with SMTP id i195mr2452753lfi.148.1581014805054; 
 Thu, 06 Feb 2020 10:46:45 -0800 (PST)
MIME-Version: 1.0
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
 <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
In-Reply-To: <e77ce9c5-455a-56c4-32b2-01d73dea33c1@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Thu, 6 Feb 2020 13:46:33 -0500
Message-ID: <CAKf6xpt85LYgd3EfWgmKOhpTp1xz+6g9j=6UgiAUfby6YTQ8sg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH 2/2] VT-d: adjust logging of RMRRs
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
 Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgNiwgMjAyMCBhdCA4OjMzIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBDb25zaXN0ZW50bHkgdXNlIFssXSByYW5nZSByZXByZXNlbnRhdGlv
biwgc2hyaW5rIGxlYWRpbmcgZG91YmxlIGJsYW5rcwo+IHRvIGEgc2luZ2xlIG9uZSwgYW5kIHNs
aWdodGx5IGFkanVzdCB0ZXh0IGluIHNvbWUgY2FzZXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4KPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQvZG1hci5jCj4gKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIu
Ywo+IEBAIC01NjEsNyArNTYxLDcgQEAgc3RhdGljIGludCByZWdpc3Rlcl9vbmVfcm1ycihzdHJ1
Y3QgYWNwaQo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgZHByaW50ayhYRU5MT0dfV0FSTklO
RyBWVERQUkVGSVgsCj4gICAgICAgICAgICAgICAgICAgICAgIiBOb24tZXhpc3RlbnQgZGV2aWNl
ICglMDR4OiUwMng6JTAyeC4ldSkgaXMgcmVwb3J0ZWQiCj4gLSAgICAgICAgICAgICAgICAgICAg
IiBpbiBSTVJSICglIlBSSXg2NCIsICUiUFJJeDY0IikncyBzY29wZSFcbiIsCj4gKyAgICAgICAg
ICAgICAgICAgICAgIiBpbiBSTVJSIFslIlBSSXg2NCIsJSJQUkl4NjQiKV0ncyBzY29wZSFcbiIs
CgpNaXNzZWQgcmVtb3ZpbmcgdGhlICIpIi4KCldpdGggdGhhdCBmaXhlZCwgUmV2aWV3ZWQtYnk6
IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4KClJlZ2FyZHMsCkphc29uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
