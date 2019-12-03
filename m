Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BE9111B26
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 22:51:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icG1s-0003rq-FS; Tue, 03 Dec 2019 21:48:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icG1q-0003rl-LB
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 21:48:18 +0000
X-Inumbo-ID: 9d2d78ae-1616-11ea-81eb-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d2d78ae-1616-11ea-81eb-12813bfff9fa;
 Tue, 03 Dec 2019 21:48:17 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575409698; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=HIBFEwFhrG7ARldaQK/STcvZYy7JmaWHmg01Ujfg3yo=;
 b=Up4soJ/gHo492MmG0M8Dpk+QKukGbi5dHhlKoZxg3HzRaZWISVWua3mD6ciChwICYJvJVr4F
 +GmCPukA9akio5xoZblGQtDlmOCcTVTJc2HeiXXOglxY3m9fdMoScFxPmYY7LC/fI+st4IFa
 6xw36EVKimPMm6P5RYjy6kyLPig=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mxa.mailgun.org with ESMTP id 5de6a408.7f22bf6aa9f0-smtp-out-n03;
 Tue, 03 Dec 2019 18:06:00 -0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b11so3930874wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:05:59 -0800 (PST)
X-Gm-Message-State: APjAAAUJ2pesnaWaYC5hNzXSp/mhNhV6qZgaXDDinZ4TRxyGvwAZ/Pex
 jXTmOOUTgBJxjMN0yr83Oj7achf6MirTuxhlXW4=
X-Google-Smtp-Source: APXvYqzRbo866UffpPDhRr/wYAx97m3zr+rsn0+MCCu8kKbiNcqsvxIsYFRmqvJ2wjeFxzuOjxhJZ7SIK/tw7PmnIy0=
X-Received: by 2002:a7b:c392:: with SMTP id s18mr23214158wmj.169.1575396358985; 
 Tue, 03 Dec 2019 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
In-Reply-To: <20191203171030.11680-1-andrew.cooper3@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:05:22 -0500
X-Gmail-Original-Message-ID: <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
Message-ID: <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IGluZGV4IDk1OTA4M2Q4YzQuLjc2Njc2ZmY0YzAgMTAwNjQ0
Cj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiArKysgYi94ZW4vaW5jbHVk
ZS9wdWJsaWMvdm1fZXZlbnQuaAo+IEBAIC0yODEsNiArMjgxLDcgQEAgc3RydWN0IHZtX2V2ZW50
X2RlYnVnIHsKPiAgICAgIHVpbnQzMl90IGluc25fbGVuZ3RoOwo+ICAgICAgdWludDhfdCB0eXBl
OyAgICAgICAgLyogSFZNT1BfVFJBUF8qICovCj4gICAgICB1aW50OF90IF9wYWRbM107Cj4gKyAg
ICB1aW50NjRfdCBwZW5kaW5nX2RiZzsKClRoaXMgaXMganVzdCBhIG5pdHBpY2sgYnV0IEkgd291
bGQgcHJlZmVyIGlmIHdlIGhhZCB0aGUgX3BhZCBmaWVsZCBhcwp0aGUgbGFzdCBlbGVtZW50IGlu
IHRoZSBzdHJ1Y3QgYW5kIGtlZXAgYWxsIDY0LWJpdCBtZW1iZXJzIHVwIGluIHRoZQpmcm9udC4K
ClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
