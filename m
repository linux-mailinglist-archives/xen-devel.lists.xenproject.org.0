Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2079181BF5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:03:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2q8-0005ea-VX; Wed, 11 Mar 2020 15:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8QTE=44=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jC2q7-0005eV-Kr
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:00:07 +0000
X-Inumbo-ID: fe8b7c7e-63a8-11ea-a6c1-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe8b7c7e-63a8-11ea-a6c1-bc764e2007e4;
 Wed, 11 Mar 2020 15:00:07 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so2713997ljd.4
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 08:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/aJadC8tVmaMrsfW7kHmnAZDvri3UvRcadSe26zcceo=;
 b=W4uXfanEZokLuEhc8GY3VfSCKOBWU6JIB85ZKjaVkRinZi9qc2U277NCF6qTaXj/F8
 0Y/qq/0E3t/83JeEiUP1aOijjM/ZdP1tbxeedKH2rcUQqL8YclN/xGhn+aAg3wqaQ2Y1
 Hyl4OyFNJYmL/DS96Q92G2JBwQ09WrkKlZJHr4p4PVSpiphK/oHjTlSmTMFCuSfoWAGV
 1SCpVfK4z+ZOJayhPXbZpUh6jIVB3cNmidSlDslIvN89/fM4qlLTxWB1vUd7ZsPrElLJ
 4ZnQTW196xPdWNRnSiTwjtGbq2ypY5eKJsjV9QkTrXFBc5fh5NBZEQ0ACq1ewPl18hza
 h5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/aJadC8tVmaMrsfW7kHmnAZDvri3UvRcadSe26zcceo=;
 b=n8qFt/5nLw2W9c2/KHl2RV+EZSBH8m4pEkrf0uZx0FFBhB/0kAcdF6AJuuxrER3jcm
 oBCC88eZqvyydt2zrgMS0GkcwIIzSwDpgy6d/pVLI/jV62mzz58zceNsanHBCX8H4HUb
 A1p8YHanJh8dxGr9Bo4vKcrKjePA5g2A4NFEAYBotLOs+p5oJCIGWh/WwBlASFz3Z8qN
 Th2Z7Kl0iOQOKy4mLNOI6tditNa0uUa9WlUrhdPYmdmbPFhwCV/EUzwK0XFB187lP/Yw
 wNa3N1ruP1MPqAjMiMwU+VgDs/G8PYse0DKXRbeKOuHlmixJygBLY832/JgxSzT8VUtw
 BUVA==
X-Gm-Message-State: ANhLgQ0ysEDsmSy+D3jcTHLVAMzuP7SghmaaMFOyrQydg8RqD5gjTKWJ
 pyredtH3txw9fibBrpIxxeH1HY+74zdcOueFMho=
X-Google-Smtp-Source: ADFU+vurt2pgAcmHRMlHHdBB7CXIchrEtBiEcYt/+M0mLBsy/gPGYH5P08ace1cS7cMUUaLUloV1byJ9L6kpGJJFTdc=
X-Received: by 2002:a2e:891a:: with SMTP id d26mr2313025lji.182.1583938805918; 
 Wed, 11 Mar 2020 08:00:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200309144932.866097-1-george.dunlap@citrix.com>
 <20200309144932.866097-3-george.dunlap@citrix.com>
In-Reply-To: <20200309144932.866097-3-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Wed, 11 Mar 2020 10:59:54 -0400
Message-ID: <CAEBZRSfBMyaaM60uyD+AxM0m0AMLGTriKBVvuAoEX7ki7a0JAQ@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v4 3/3] golang/xenlight: Implement
 DomainCreateNew
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TG9va3MgZ29vZCwgSSBqdXN0IGhhdmUgdHdvIHNtYWxsIGNvbW1lbnRzOgoKPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvZ29sYW5nL3hlbmxpZ2h0L3hlbmxpZ2h0LmdvIGIvdG9vbHMvZ29sYW5nL3hlbmxp
Z2h0L3hlbmxpZ2h0LmdvCj4gaW5kZXggNTZmYTMxZmQ3Yi4uODA4YjRhMzI3YyAxMDA2NDQKPiAt
LS0gYS90b29scy9nb2xhbmcveGVubGlnaHQveGVubGlnaHQuZ28KPiArKysgYi90b29scy9nb2xh
bmcveGVubGlnaHQveGVubGlnaHQuZ28KPiBAQCAtMTExMSwzICsxMTExLDI0IEBAIGZ1bmMgKEN0
eCAqQ29udGV4dCkgUHJpbWFyeUNvbnNvbGVHZXRUdHkoZG9taWQgdWludDMyKSAocGF0aCBzdHJp
bmcsIGVyciBlcnJvcikKPiAgICAgICAgIHBhdGggPSBDLkdvU3RyaW5nKGNwYXRoKQo+ICAgICAg
ICAgcmV0dXJuCj4gIH0KPiArCj4gKy8vIGludCBsaWJ4bF9kb21haW5fY3JlYXRlX25ldyhsaWJ4
bF9jdHggKmN0eCwgbGlieGxfZG9tYWluX2NvbmZpZyAqZF9jb25maWcsCj4gKy8vICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCAqZG9taWQsCj4gKy8vICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9hc3luY29wX2hvdyAqYW9faG93LAo+ICsvLyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgbGlieGxfYXN5bmNwcm9ncmVzc19ob3cgKmFv
cF9jb25zb2xlX2hvdykKCkNvbnZlbnRpb25hbGx5LCB3ZSB3YW50IHRvIGhhdmUgY29tbWVudHMg
Zm9yIGV4cG9ydGVkIGZ1bmN0aW9ucyBhbG9uZwp0aGUgbGluZXMgb2Y6CgogICAgLy8gRG9tYWlu
Q3JlYXRlTmV3IGNyZWF0ZXMgYSBuZXcgZG9tYWluIHdpdGggY29uZmlnLCBhbmQgcmV0dXJucwpp
dHMgRG9taWQgb24gc3VjY2Vzcy4KICAgIC8vIEEgbm9uLW5pbCBlcnJvciBpcyByZXR1cm5lZCBp
ZiBjb25maWcgY2Fubm90IGJlIG1hcnNoYWxlZCwgb3IKYW4gZXJyb3Igb2NjdXJzIHdpdGhpbiBs
aWJ4bC4KCkJlc2lkZXMgYmVpbmcgZWFzaWVyIHRvIHJlYWQsIGl0IG1ha2VzIGRvY3VtZW50YXRp
b24gbW9yZSBjbGVhciBvbgpnb2RvYy9wa2cuZ28uZGV2LgoKPiArZnVuYyAoQ3R4ICpDb250ZXh0
KSBEb21haW5DcmVhdGVOZXcoY29uZmlnICpEb21haW5Db25maWcpIChEb21pZCwgZXJyb3IpIHsK
CkNhcGl0YWxpemluZyAiQ3R4IiBoZXJlIGlzIGEgbGl0dGxlIHdlaXJkIHRvIG1lLiBTaW5jZSBp
dCdzIG9ubHkgdGhlCnJlY2VpdmVyIG5hbWUsIHRoZXJlJ3Mgbm8gZWZmZWN0LCBidXQgc2luY2Ug
Y2FwaXRhbGl6ZWQgaWRlbnRpZmllcnMKaGF2ZSBzcGVjaWFsLW1lYW5pbmcgaW4gb3RoZXIgY29u
dGV4dHMsIEkgd291bGQgYXZvaWQgZG9pbmcgdGhpcy4KCkkgb25seSBwb2ludCB0aG9zZSBvdXQg
aW4gY2FzZSB5b3Ugd2FudCB0byBjaGFuZ2UgaXQgb24gY2hlY2staW4uIEJlc2lkZXMgdGhhdCwK
ClJldmlld2VkLWJ5OiBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25AYWluZm9zZWMuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
