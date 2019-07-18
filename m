Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9266D3E8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 20:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoB7D-000204-Vs; Thu, 18 Jul 2019 18:26:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bmnl=VP=gmail.com=persaur@srs-us1.protection.inumbo.net>)
 id 1hoB7C-0001zy-Kj
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 18:26:50 +0000
X-Inumbo-ID: 9b457ff0-a989-11e9-8980-bc764e045a96
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9b457ff0-a989-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 18:26:49 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id k20so53001142ios.10
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yG0YNENBNe4tX836Vz/fksbV0550GUecHlRUhK6WG/M=;
 b=Km8WjLZqf1VMEKIkVdOSbxm6sl5TqP8wjn7eJCkR53n434dCi8yJg4ftZVTO5kuTSX
 DkIT/7J5ndLJDlHYa3Yufsf9kdqlksQzFZ2zWGjEPVDwk3VzZ/15VmF8pjQzh+TbUbK1
 /N6ztNs7CjFBwZ+e26Lgbr85XokGiJ5B4iAWjWtLho14K1g367wCOgGu8EbwyWpejjnk
 q3F20pxnfQjETZGIxx8U3LVp3esBTHqvnZEUz507fFxlMeJqzwLLEZw+Tu7w2EFN5p2K
 Yhm+UQD69773Us8Gvs6mV81LJYJQhKHjmLm7wMXpCeGB3WdltfdidynPs5ykRPZ/GWN8
 p6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=yG0YNENBNe4tX836Vz/fksbV0550GUecHlRUhK6WG/M=;
 b=uI6RL9I9NCHr8gdqb4s/LVtKP+HzAyLce4wC49gCuyMUd8pJaGdNRD9FiQFBgzQpiD
 GRm3Sd46cSPlCSSw2gkLnHP4e56oWZ0RYuaet2AMb7m3zPjE3LOhj6/XovqDdRW0JarU
 CMwQIdIYgqpEFy84tqBaEt6WKfDGuNOxpblEidKgyq6LhA0wEr7iHqCouccTRY5+HWyx
 ziZds3zgQCRGBSaxGfhnDG+MCJGTXN/KDENgwVFUJDd2jk5raK84K+q1zsBmyIow4Dza
 ditOYK43b2i7RZ48kshR2oY9IPiwvNTYckGkpNXHFxgHVAPmiS31E6h7bU4HjzL1l6Dg
 SOcA==
X-Gm-Message-State: APjAAAXqAX5P/xDdt7PwiNOqOOm7i7uds4FSAUYS+5hDToQ/EyI3KaNS
 iCU7UJkuBMympMAtz3KSsCI=
X-Google-Smtp-Source: APXvYqwDWxuhebZX8JKO1LuNoireBurTcXa7mowieiCPUietmNB7XbrcMGCDfWtWc3h/Vvx9UEM/7g==
X-Received: by 2002:a5d:964d:: with SMTP id d13mr33228232ios.224.1563474408882; 
 Thu, 18 Jul 2019 11:26:48 -0700 (PDT)
Received: from [100.64.72.253] ([205.185.206.117])
 by smtp.gmail.com with ESMTPSA id t4sm22341497iop.0.2019.07.18.11.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 11:26:48 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Rich Persaud <persaur@gmail.com>
X-Mailer: iPad Mail (16F203)
In-Reply-To: <b6599113-99ec-8c92-5316-09c0992ab122@citrix.com>
Date: Thu, 18 Jul 2019 14:26:47 -0400
Message-Id: <29A6C124-6EF4-45C2-860E-D34A9B6D2087@gmail.com>
References: <20190418015203.1636-1-dpsmith@apertussolutions.com>
 <1cf0e5e9-2109-9517-49d9-88c5251cf156@citrix.com>
 <5CC19CAC0200007800229037@prv1-mh.provo.novell.com>
 <b6599113-99ec-8c92-5316-09c0992ab122@citrix.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH] golang/xenlight: Fixing compilation for go
 1.11
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
Cc: nicolas.belouin@gandi.net, George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 "Daniel P.Smith" <dpsmith.dev@gmail.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBPbiBBcHIgMjUsIDIwMTksIGF0IDA3OjQxLCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIDQvMjUvMTkgMTI6NDAgUE0sIEphbiBCZXVsaWNo
IHdyb3RlOgo+Pj4+PiBPbiAxOC4wNC4xOSBhdCAxNToxMSwgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4gd3JvdGU6Cj4+Pj4gT24gNC8xOC8xOSAyOjUyIEFNLCBEYW5pZWwgUC4gU21pdGggd3Jv
dGU6Cj4+Pj4gVGhpcyBkZWFscyB3aXRoIHR3byBjYXN0aW5nIGlzc3VlcyBmb3IgY29tcGlsaW5n
IHVuZGVyIGdvIDEuMTE6Cj4+Pj4gLSBleHBsaWNpdGx5IGNhc3QgdG8gKkMueGVudG9vbGxvZ19s
b2dnZXIgZm9yIEN0eC5sb2dnZXIgcG9pbnRlcgo+Pj4+IC0gYWRkIGNhc3QgdG8gdW5zYWZlLlBv
aW50ZXIgZm9yIHRoZSBDIHN0cmluZyBjcGF0aAo+Pj4+IAo+Pj4+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBQLiBTbWl0aCA8ZHBzbWl0aEBhcGVydHVzc29sdXRpb25zLmNvbT4KPj4+IAo+Pj4gUmV2
aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KPj4+IAo+
Pj4gQlRXLCBkbyB5b3Uga25vdyBpZiB0aGlzIHdpbGwgY29tcGlsZSBmb3Igb2xkZXIgdmVyc2lv
bnMgb2YgZ28/Cj4+PiAKPj4+IFRoaXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgZm9yIGJhY2twb3J0
IGFzIHdlbGwgKGNjJ2luZyBKYW4pLgo+PiAKPj4gRGlkIHlvdSBtZWFuIElhbiwgdGhpcyBiZWlu
ZyBhIHRvb2xzIHBhdGNoPwo+IAo+IEkgZ3Vlc3Mgc28uICBTb3JyeSwgSSBkaWRuJ3QgcmVhbGl6
ZSBJYW4gd2FzIGRvaW5nIHRoZSB0b29scyBiYWNrcG9ydHMuCj4gCj4gLUdlb3JnZQoKV2l0aCB0
aGUgZ29sYW5nIHRvb2xzIG1haW50YWluZXIgY2hhbmdlIGNvbXBsZXRlZCwgaXMgYW55dGhpbmcg
ZnVydGhlciBuZWVkZWQgZm9yIHRoaXMgcGF0Y2ggdG8gYmUgbWVyZ2VkPwoKUmljaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
