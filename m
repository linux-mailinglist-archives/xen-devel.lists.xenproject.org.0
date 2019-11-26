Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD0310A355
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 18:27:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZeaC-0003DZ-In; Tue, 26 Nov 2019 17:25:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D0sf=ZS=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iZeaC-0003DU-0V
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 17:25:00 +0000
X-Inumbo-ID: ac275032-1071-11ea-a55d-bc764e2007e4
Received: from mail-qk1-x742.google.com (unknown [2607:f8b0:4864:20::742])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac275032-1071-11ea-a55d-bc764e2007e4;
 Tue, 26 Nov 2019 17:24:59 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id m125so16784282qkd.8
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2019 09:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C4Ol1NT5PNcRKw0O7ex0TiHoizZeB3iszyv5y6kEkpM=;
 b=Kiti5RLgWZezOhUOUNkLuIaMZXWpRXM0qwbIJALHyxzVkKRze7YRjUFjP4/5CtJfzx
 nVidCN3TFiJjNcNvw7NQ32Gl97mwDQCYdMi/G7PildohSjBktJoBu7eNb9r+Z7mmTiwX
 nkKYYR9wOQ+AlPQeu3+ff/A2tNfFP9woR8rnmvJv4L3pKsI+dEVu0c9AsPg3aDHLU9C8
 AO4xBHXpz7SRnMkzqbSJ6A8BDIwEwf6a8/sTu0H8Oc+aW2gCxZeYa6bvnqd5rq0UcX+t
 pD24jdS+SNva3W6cxvlBnKMD5qNbjJVWDYcZSvWEpLd1EQ/QzUHP94Ndn0/nMDysjybR
 2O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C4Ol1NT5PNcRKw0O7ex0TiHoizZeB3iszyv5y6kEkpM=;
 b=Fu+CJ9JWCVTAPbmmYzIhW59kXu5wR+rp66G+tLapxmmy/g4C2cWdX31NkjuHfoO8aN
 SIJEJUHR5M3XCw1JC70N7OvL0KgpztDUWwOy0tRxmep9XhlMiU7M4297bzWy+pK8sloP
 UcsczBbgx7RuAIOMmzT2fYIyvlFyiWxWN1C7geVqwSZY6XQ8Kjf8n5omt6B5gNjHT+mX
 /6Pz+lcGCht8f4fDdOGPKCxNk8Ep4VCMP2Zz5P2dFDCfPS0HkvFv4mCLoVXpzIz5dehp
 Dyl6edt+gdzS7CGWGFdmxoyCXVBMKxkP40aE43GBfxJsRt8JPYCV5lp7p9l24xAtKrrx
 e+aQ==
X-Gm-Message-State: APjAAAXQc6nh1pFaMnsne67OigKrr/TxoVbNPvMfzO8DjcogkZX6Yc7c
 bOzMf7wCs6gzFZ7MYPibIf18SmbgvJ+Oo6Xjv1TGlg==
X-Google-Smtp-Source: APXvYqy/cIHGqqxjTMCyLHqALIYgOSCn8mPJtY1XXsSDTIlUhwUWpcUYIlBQsI6uHrXqB71Uwpy6KwIng23Rr1k3/R0=
X-Received: by 2002:ae9:f511:: with SMTP id o17mr18553356qkg.157.1574789098935; 
 Tue, 26 Nov 2019 09:24:58 -0800 (PST)
MIME-Version: 1.0
References: <59a11ca9-d0df-f24d-b1df-8b1e02e73e3f@suse.com>
 <20191126095018.c7yy2qkqwsodpvhz@debian>
In-Reply-To: <20191126095018.c7yy2qkqwsodpvhz@debian>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 26 Nov 2019 09:24:47 -0800
Message-ID: <CAMmSBy_b=ku5vytUhikad-4UmROOkh91npSArFxE1dX7aZM_ug@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Subject: Re: [Xen-devel] [PATCH] EFI: fix "efi=attr=" handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTo1MSBBTSBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3cm90
ZToKPgo+IE9uIFR1ZSwgTm92IDI2LCAyMDE5IGF0IDA5OjI1OjI3QU0gKzAxMDAsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4gQ29tbWl0IDYzM2E0MDk0NzMyMSAoImRvY3M6IEltcHJvdmUgZG9jdW1l
bnRhdGlvbiBhbmQgcGFyc2luZyBmb3IgZWZpPSIpCj4gPiBmYWlsZWQgdG8gaG9ub3IgdGhlIHN0
cmNtcCgpLWxpa2UgcmV0dXJuIHZhbHVlIGNvbnZlbnRpb24gb2YKPiA+IGNtZGxpbmVfc3RyY21w
KCkuCj4gPgo+ID4gUmVwb3J0ZWQtYnk6IFJvbWFuIFNoYXBvc2huaWsgPHJvbWFuQHplZGVkYS5j
b20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4K
PiBSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KClRlc3RlZC1ieTogUm9tYW4gU2hh
cG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4KClRoYW5rcywKUm9tYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
