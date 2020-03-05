Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA8817A78B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 15:35:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9rXw-0001yV-Ff; Thu, 05 Mar 2020 14:32:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OR8N=4W=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1j9rXu-0001yP-Vh
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 14:32:19 +0000
X-Inumbo-ID: 1d84355e-5eee-11ea-b52f-bc764e2007e4
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d84355e-5eee-11ea-b52f-bc764e2007e4;
 Thu, 05 Mar 2020 14:32:18 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id p5so4808858lfc.7
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2020 06:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qCTKsGYwKUMtIolr5YGUnx6vbwZZplzclFvDnDKo9wQ=;
 b=F5QsJekyNJCDE2dCRRjy/yICuITMZCXc39qC79qHm+VkrftnMQNuszVlxNov6ygLHv
 vaKGDdyVrzF4TcoO7La+CPcqgWi77najPPkE1FGkiYF/MpN8zjht6drLO29/gNmNfyg8
 L60D1bAJynEULILt9hR19Hs0FZQ4O7UVLu+N2OhnFlICWlUAFX9JlpE7sIHUUjm0nsaE
 SqozVY4rWdYpTlPCYZBA8yd5wKpNPUoHjwc7pz5+D9tJCyzsgCxP3JcZ3lRE1eBgCdfK
 bJzMZTwKRQx9iD+Fbr0iw62enOxVooHg58SeIYAAYFamWQeNb03TAJED4A+hTM0ZR0Fg
 IJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qCTKsGYwKUMtIolr5YGUnx6vbwZZplzclFvDnDKo9wQ=;
 b=rP/Cp32caj8SFYBAhaZVAH2cZqkwE86vHwOSaz99eYU0VffiLGj37WEOJIBi0X5ONc
 8MNunLr9oC/P8sfj38RhmlhsmKtF5HZa3RxE6deriX7Ls+70iQ5aTC+ebMuGJQZDKrPh
 dsi3zi7gy36El1b81uiwxSaVYhe+xV+vu4TyGndzqfsNDEJAAVCVv60HzxyPTQxIH3vm
 G2ocos1SQFQPISiB0rqxVdhFtjW4CLCdXLa6ShKkXBErpdrTZddvKK1bMNV1JkcT/LJ9
 nL7tNBkzjDJkU+rKTI5Plu/I1/DUAmQ6jUEWiJxNAzTN4dTqHM2e6gS3Iomhe1gv1vkQ
 5XcA==
X-Gm-Message-State: ANhLgQ25B1XzeK4fTJCv8xYQ7+6qsWN8dPtjB1fQiA06Dp/N8TKiH199
 1P1Xa/12C8/8xLVoHlgGW0gRpY35OCMNwmHgOZw=
X-Google-Smtp-Source: ADFU+vtSDb5uh/XBUKedWjwhbUCFM5K/ZiUf6MlY6SnxAyFxeRkmyMMlF1cdTEkKA9i7OhnPXyzKq/JVcHIAzX7hz3I=
X-Received: by 2002:ac2:5203:: with SMTP id a3mr489434lfl.152.1583418737428;
 Thu, 05 Mar 2020 06:32:17 -0800 (PST)
MIME-Version: 1.0
References: <d9916032f6214e57caaac1d7a4b8afcf1723ad08.1583179824.git.rosbrookn@ainfosec.com>
 <71388529-cfd8-cf6f-72f2-111e4e4f777c@citrix.com>
In-Reply-To: <71388529-cfd8-cf6f-72f2-111e4e4f777c@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Thu, 5 Mar 2020 09:32:05 -0500
Message-ID: <CAEBZRScfhXfQQ16zJBgfFG+z8MveJcRzq1+AxRo1SA6GN9+ygA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2] golang/xenlight: implement constructor
 generation
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
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBbHRob3VnaCwgSSdtIG5vdCBzdXJlIGlmIHRoYXQgaW1wbGllcyAiVGhlcmUncyBhbHJlYWR5
IGJvaWxlcnBsYXRlLCBzbwo+IGl0J3MgZXh0cmEgaW1wb3J0YW50IHRvIGF2b2lkIGFkZGluZyBt
b3JlIiwgb3IgIlRoZXJlJ3MgYWxyZWFkeQo+IGJvaWxlcnBsYXRlLCBzbyBpdCB3b24ndCBodXJ0
IHRvIGhhdmUgYSBiaXQgbW9yZSwgYW5kIHdyYXAgdGhlIHdob2xlCj4gdGhpbmcgaW4gYSBuaWNl
ciBsaWJyYXJ5LiIKCkkgdGhpbmsgdGhlIGJvaWxlcnBsYXRlIGFkZGVkIGhlcmUgaXMgbmVjZXNz
YXJ5LiBXZSBuZWVkIHRvIHByb3ZpZGUgYQp1bmlmb3JtIHdheSBmb3IgdXNlcnMgdG8gaW5pdGlh
bGl6ZSBhIHhlbmxpZ2h0IHR5cGUgd2hpY2ggaGlkZXMgdGhlCnVzZSBvZiBfaW5pdCgpIGFuZCBm
cm9tQywgYW5kIEkgdGhpbmsgdGhpcyBpcyB0aGUgc2ltcGxlc3Qgd2F5IHRvIGRvCnRoYXQuIEFu
ZCwgSSdtIG5vdCBvcHBvc2VkIHRvIHRoZSBpZGVhIG9mIHdyaXRpbmcgYSAibmljZXIiIHBhY2th
Z2UgdG8Kd3JhcCB4ZW5saWdodC4KCj4gT1RPSCwgd2Ugc2hvdWxkIGJlIGFibGUgdG8gaGF2ZSBs
aWJ4bCBhdXRvbWF0aWNhbGx5IGNvcHkgY19pbmZvLnR5cGUKPiBmcm9tIGJfaW5mby50eXBlIGlm
IGNfaW5mby50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0lOVkFMSUQgLS0gaWYgaXQKPiBkb2Vz
bid0IGRvIHNvIGFscmVhZHkuCgpUaGF0IHNvdW5kcyBzaW1wbGUgZW5vdWdoLgoKLU5SCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
