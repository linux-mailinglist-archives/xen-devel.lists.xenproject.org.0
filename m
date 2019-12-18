Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9F12569A
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 23:23:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihhgm-0006IY-VJ; Wed, 18 Dec 2019 22:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihhgl-0006IO-7s
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 22:21:03 +0000
X-Inumbo-ID: a7dacac0-21e4-11ea-a1e1-bc764e2007e4
Received: from mail-lj1-f196.google.com (unknown [209.85.208.196])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7dacac0-21e4-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 22:20:54 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id k1so3268332ljg.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 14:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sCabMkauHcqNzhnsQi8bzXTgx5Eh1+s2ClrYlt5gLUo=;
 b=t7AzkprWbBPvOoKS1vc+NZLtbnlcqTWrMPNUVD2oGxwo7yHnqH64tDwzGX+zoF7Sq1
 dwsQG7knlWHdUhR8YzoxSM4DKEzfsthtjktvsHqGGqi6vk7QJ707oWCgQWYnH1krhKvC
 2xP593iaKaATMC3IrMaqFtLWzRfCl1tpl8diURYQZnL7o8eBw7QQhxzJKr45zwG8LmDq
 KWUDvMJs0ZwGA9kz1bk6EXFlN6/cSDp2cZE5jsRqPbdS8qY0pO94bIb4R6ZF0gad6Mal
 Hp4eHb6+cf6MVFWN6kZ8BG5sI6kjy3jVDQ9zzM0Ma9u8osff64gwCXJBdUAOely8wjvZ
 OsVg==
X-Gm-Message-State: APjAAAU+iV+DBrnn4ZTCD0RT6BCrusXcD5Qj9gJzRVQBMa5GlenoUDFU
 CHQ+WODeL5I3V4Bq6u4iwKWpYBk/x1g=
X-Google-Smtp-Source: APXvYqw6Pqn4GYT3f3jF7YHufixTxNDutV6hpi3JNyM8P8pN323zqTLqn8NOYAR24Za9DKUws43W8w==
X-Received: by 2002:a2e:2c04:: with SMTP id s4mr3715017ljs.35.1576707653277;
 Wed, 18 Dec 2019 14:20:53 -0800 (PST)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com.
 [209.85.208.173])
 by smtp.gmail.com with ESMTPSA id a19sm2350085ljd.90.2019.12.18.14.20.52
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Dec 2019 14:20:53 -0800 (PST)
Received: by mail-lj1-f173.google.com with SMTP id j26so3899185ljc.12
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 14:20:52 -0800 (PST)
X-Received: by 2002:a2e:9cc:: with SMTP id 195mr1950533ljj.130.1576707652749; 
 Wed, 18 Dec 2019 14:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20191218144233.15372-1-liuwe@microsoft.com>
 <20191218144233.15372-7-liuwe@microsoft.com>
 <dcd1dc1a6e99484bbabb6c994c6506ce@EX13D32EUC003.ant.amazon.com>
 <CY4PR21MB0629365FA8E64586AAD0E031D7530@CY4PR21MB0629.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR21MB0629365FA8E64586AAD0E031D7530@CY4PR21MB0629.namprd21.prod.outlook.com>
From: Wei Liu <wl@xen.org>
Date: Wed, 18 Dec 2019 22:20:36 +0000
X-Gmail-Original-Message-ID: <CAK9nU=oGJkAZWxYdYZXjhR7A4GW-7rtHiVzbNvv4Q_95Q8nB9w@mail.gmail.com>
Message-ID: <CAK9nU=oGJkAZWxYdYZXjhR7A4GW-7rtHiVzbNvv4Q_95Q8nB9w@mail.gmail.com>
To: Michael Kelley <mikelley@microsoft.com>
Subject: Re: [Xen-devel] [PATCH v2 6/6] x86: implement Hyper-V clock source
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, "Durrant,
 Paul" <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOCBEZWMgMjAxOSBhdCAyMDoyNCwgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1p
Y3Jvc29mdC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1h
em9uLmNvbT4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxOCwgMjAxOSA3OjI0IEFNCj4KPiA+
ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2YgV2Vp
IExpdQo+ID4gPiBTZW50OiAxOCBEZWNlbWJlciAyMDE5IDE0OjQzCj4KPiBbc25pcF0KPgo+ID4g
PiArCj4gPiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHJlYWRfaHlwZXJ2X3RpbWVyKHZvaWQp
Cj4gPiA+ICt7Cj4gPiA+ICsgICAgdWludDY0X3Qgc2NhbGUsIG9mZnNldCwgcmV0LCB0c2M7Cj4g
PiA+ICsgICAgdWludDMyX3Qgc2VxOwo+ID4gPiArICAgIGNvbnN0IHN0cnVjdCBtc19oeXBlcnZf
dHNjX3BhZ2UgKnRzY19wYWdlID0gaHlwZXJ2X3RzYzsKPiA+ID4gKwo+ID4gPiArICAgIGRvIHsK
PiA+ID4gKyAgICAgICAgc2VxID0gdHNjX3BhZ2UtPnRzY19zZXF1ZW5jZTsKPiA+ID4gKwo+ID4g
PiArICAgICAgICAvKiBTZXEgMCBpcyBzcGVjaWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRl
bm1lbnQgaXMgbm90Cj4gPiA+ICsgICAgICAgICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBU
aGUgcmVmZXJlbmNlIHRpbWUgY2FuIG9ubHkgYmUKPiA+ID4gKyAgICAgICAgICogb2J0YWluZWQg
ZnJvbSB0aGUgUmVmZXJlbmNlIENvdW50ZXIgTVNSLgo+ID4gPiArICAgICAgICAgKi8KPiA+ID4g
KyAgICAgICAgaWYgKCBzZXEgPT0gMCApCj4gPgo+ID4gT2xkZXIgdmVyc2lvbnMgb2YgdGhlIHNw
ZWMgdXNlZCB0byB1c2UgMHhGRkZGRkZGRiBJIHRoaW5rLCBhbHRob3VnaCB3aGVuIEkgbG9vayBh
Z2FpbiB0aGV5Cj4gPiBzZWVtIHRvIGhhdmUgYmVlbiByZXRyby1hY3RpdmVseSBmaXhlZC4gSW4g
YW55IGNhc2UgSSB0aGluayB5b3Ugc2hvdWxkIHRyZWF0IGJvdGgKPiA+IDB4RkZGRkZGRkYgYW5k
IDAgYXMgaW52YWxpZC4KPgo+IEZXSVcsIHRoZSAweEZGRkZGRkZGIHdhcyBqdXN0IGEgYnVnIGlu
IHRoZSBzcGVjLiAgSHlwZXItViBpbXBsZW1lbnRhdGlvbnMgb25seQo+IHNldCB0aGUgdmFsdWUg
dG8gMCB0byBpbmRpY2F0ZSBpbnZhbGlkLiAgVGhlIGVxdWl2YWxlbnQgTGludXggY29kZSBjaGVj
a3Mgb25seSBmb3IgMC4KPgoKVGhhbmtzIGZvciBjaGltaW5nIGluLCBNaWNoYWVsLgoKSW4gdGhh
dCBjYXNlIEkgd2lsbCBzdWJtaXQgYSBmaXggdG8gY2hhbmdlIFhlbidzIHZpcmlkaWFuIGNvZGUg
dG8KcmVtb3ZlIHRoZSB3cm9uZyB2YWx1ZSB0aGVyZS4KCldlaS4KCj4gTWljaGFlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
