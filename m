Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9213CB47
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 18:45:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irmhk-0004lu-OH; Wed, 15 Jan 2020 17:43:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H2oz=3E=gmail.com=pgnet.dev@srs-us1.protection.inumbo.net>)
 id 1irmhi-0004lp-If
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 17:43:42 +0000
X-Inumbo-ID: 91d20604-37be-11ea-a2eb-bc764e2007e4
Received: from mail-pf1-x431.google.com (unknown [2607:f8b0:4864:20::431])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 91d20604-37be-11ea-a2eb-bc764e2007e4;
 Wed, 15 Jan 2020 17:43:42 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id w62so8843763pfw.8
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AXFdH0L4JilGXe1Xwc61Lpv77U17BI4aYjFCwFspT9g=;
 b=FZV3Ph8chtDk7vMLuwjGoeiLl+1sq8io2NLhPHX03EkCwWixIi9TI/DIbv3XmTsimr
 UTOBdNFoXdF1aY57REeUC+fcYCzrlyb44m3U68IhaklxPbLUzIivI2Qv+Uf+47kCYlqY
 fMC/QySJzsjYyaLiD6zK7J+hGcADAMKIAR4m4AQZ1CmZwQgc9hYxpcew/IcBUgLwLia7
 XcMcT7xcDQ7ToSTT12kgH5sSI4g4eQSPkDl4LaaxlzOMehbvc9bFBTUCureIFy1Ictt7
 Elr/5aTVBC4HgAoPJHEIkIXj2uLg39c006yLd85qj1tY4IbSVZ+hRZLhqoILlg4Lin6Q
 ZgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AXFdH0L4JilGXe1Xwc61Lpv77U17BI4aYjFCwFspT9g=;
 b=cxggtEUlWmGADqiOBJ5prrw+e93pDCBYiSFmB9H4ofp9CL5Ze8LZQk48nw9Uwl9jgm
 O/oP0fGr1s8vZk8t8aDYgZ+hYhr7pCSwD9zSP7N5OJZDeVW7KrcY1v8sqGb0bO+D+APj
 IaOaBwdhaslRuvxINVxHVBNnmx8YGn9AsZ7hZkvtNDjiiuMJ0wUZiSs71VCJ9qyIZ8Cj
 gqhDHSuD/jf3sl7PvpT6WvTYyv4UFW6aNHRdM5UUnRf53RPfkFVP6IjYKlApGnljhzXn
 jyJmlufy5bUjgJU0421GsFFiTijIQKePkim7b3KTdq+xqZ+JwJZvo0XOGlUaNru6lYf+
 07DQ==
X-Gm-Message-State: APjAAAVzdRr2hQzy+aKX7/qDTvNDnoCh0maqOa6nqlPTHkIXYVdMOuWE
 diYA/zy1Pnh8EQt/N8kyF2TNOOLO
X-Google-Smtp-Source: APXvYqyXwSaQo1uYoXQvhe7+xjevvyKWJHwrqtinkimKLEQodyAmOY01xYXViC7r5My/h2C2mtAoxQ==
X-Received: by 2002:a63:dc41:: with SMTP id f1mr35464736pgj.119.1579110221281; 
 Wed, 15 Jan 2020 09:43:41 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net.
 [99.7.172.215])
 by smtp.gmail.com with ESMTPSA id t63sm22752452pfb.70.2020.01.15.09.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 09:43:41 -0800 (PST)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <6fb9cba6-b19a-680c-09a1-8c32c9f9fe19@gmail.com>
 <19d37ca0-90be-4820-e937-796288fc4517@citrix.com>
 <74cc009f-2d9d-c466-6735-096a47fca7e8@gmail.com>
 <bdfd64dd-6fe7-ec75-5c39-9e8d6063eb85@citrix.com>
From: PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <000db7ac-bc56-f2a4-b7b2-a5c867be49a7@gmail.com>
Date: Wed, 15 Jan 2020 09:43:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <bdfd64dd-6fe7-ec75-5c39-9e8d6063eb85@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] xen 4.13 + kernel 5.4.11 'APIC Error ... FATAL PAGE
 FAULT' on reboot? non-Xen reboot's ok.
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
Reply-To: pgnet.dev@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xNS8yMCA5OjIxIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IFRoYXQgaXMgdGhlIGNv
bW1hbmQgbGluZSBmb3IgZG9tMCB3aGljaCBpcyBhIFZNLsKgIFlvdSBuZWVkIHRoZSBYZW4KPiBo
eXBlcnZpc29yIGNvbW1hbmQgbGluZS4KCnRoeC4gZG9uZS4KIAo+IFlvdSdsbCBuZWVkIHRvIGVk
aXQgeGVuLTQuMTMuMF8wNC1scDE1MS42ODguY2ZnIHdoaWNoIHdpbGwgYmUgc29tZXdoZXJlCj4g
b24gdGhlIEVTUCAod2hlcmV2ZXIgdGhhdCBpcyBtb3VudGVkIGluIGFuIG9wZW5TVVNFIHN5c3Rl
bSkuCgp2ZXJpZnlpbmcsCgoJY2F0IC9ib290L2VmaS9FRkkvb3BlbnN1c2UveGVuLTQuMTMuMF8w
NC1scDE1MS42ODguY2ZnCgkJW2dsb2JhbF0KCgkJW2NvbmZpZy4xXQoJCW9wdGlvbnM9ZG9tMD1w
dmggLi4uIHJlYm9vdD1hCgkJa2VybmVsPS4uLgoKbm93LCBvbiByZXN0YXJ0LAoKCS4uLgoJWyAg
T0sgIF0gUmVhY2hlZCB0YXJnZXQgU2h1dGRvd24uCglbICAxMzcuNjgyMTcxXSB3YXRjaGRvZzog
d2F0Y2hkb2cwOiB3YXRjaGRvZyBkaWQgbm90IHN0b3AhCglbICAxMzkuMzczNjgzXSB3YXRjaGRv
Zzogd2F0Y2hkb2cwOiB3YXRjaGRvZyBkaWQgbm90IHN0b3AhCglkcmFjdXQgV2FybmluZzogS2ls
bGluZyBhbGwgcmVtYWluaW5nIHByb2Nlc3NlcwoJbWRhZG06IHN0b3BwZWQgL2Rldi9tZDQKCW1k
YWRtOiBzdG9wcGVkIC9kZXYvbWQzCgltZGFkbTogc3RvcHBlZCAvZGV2L21kMgoJbWRhZG06IHN0
b3BwZWQgL2Rldi9tZDEKCW1kYWRtOiBzdG9wcGVkIC9kZXYvbWQwCglSZWJvb3RpbmcuCglbICAx
NDQuOTA4NTIwXSByZWJvb3Q6IFJlc3RhcnRpbmcgc3lzdGVtCgkoWEVOKSBbMjAyMC0wMS0xNSAx
NzozODoyNV0gSGFyZHdhcmUgRG9tMCBzaHV0ZG93bjogcmVib290aW5nIG1hY2hpbmUKCShYRU4p
IFsyMDIwLTAxLTE1IDE3OjM4OjI1XSBBUElDIGVycm9yIG9uIENQVTA6IDQwKDAwKQoJKFhFTikg
WzIwMjAtMDEtMTUgMTc6Mzg6MjVdIFJlc2V0dGluZyB3aXRoIEFDUEkgTUVNT1JZIG9yIEkvTyBS
RVNFVF9SRUcuCgphbmQgcmVib290IHByb2NlZWRzIC4uLgoKdGhlIGVycm9yJ3Mgc3RpbGwgdGhl
cmUsIGJ1dCB3aXRob3V0IHRoZSB0cmFjZS9ub2lzZQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
