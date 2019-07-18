Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F86CF9A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:21:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7FM-0005U0-8J; Thu, 18 Jul 2019 14:19:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho7FK-0005Tv-Vi
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:18:59 +0000
X-Inumbo-ID: f93019f6-a966-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f93019f6-a966-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:18:55 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id d24so27523579ljg.8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6rdtaf14Xiezqi+rSYuE2S7KccvjTLVDDnTqtuMdwl0=;
 b=b2lt5WPKgvEFLcAjDmmH5Zl4zQH7qqbE9nUiAfSp4YIAa27Zj3PdBM3PHu3i8IZ07n
 2brT9mX64owGp+8UJ6Una96JwL4cQt5GczzPO4LoepRtrYWlCEIFlO09WFXS5PdWZvJ6
 Q9+DQeQVYz+7yIaGiZfGfVZrMFVsZo1dmiyzVLoO1IFdrFoB1nRSbKA41owFQluuva2O
 Pot1LQCdGZp6e8r9wqaD9a+i3n4VLV48pfauiw82QRnUQzd9sk1x+loroI2lvLUVjTRN
 mOxUpAnpf9IrYe4dIpK4+RsdEXCczX+1BwexLJbdkd2nc2Gso/blM+Wf5Vc0TeLRZGjE
 1LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6rdtaf14Xiezqi+rSYuE2S7KccvjTLVDDnTqtuMdwl0=;
 b=t7Kn683MkFro1Xzxi8UAY6ad8wECG57xchVsDgywLHX76R6Ie1prMIHqE+v+OWTIfr
 XD8D8Apwp8tZSLMSCCuuOgI1P8ETt+KlSygkFlnhfmO2ZIr94He0rYDchhuezzQBBHfI
 28CEC+gvOhrm61VlPkbedGcWLNN9AJrb/Vte7P4cdddOnvHue+vRhg7uDDVnB7/xdn4d
 E5t2aVTzHH2C0nKIJEyWSg8fQmkRcl3fArq+Fh4dezi02zjUNoimjompC8YvalKSGtNS
 EFQCBLz0jPS9aWssxymC1tKbnxeIUm2z55a4c7UhbWeLTyoLEFLUeHshgNahs5uUn8V0
 /53Q==
X-Gm-Message-State: APjAAAVbGipoDDZgH2OJM6p5LhqfHO0xFcr8DJatALxcWyEfyXKWPlwk
 0bbwHimquMpZs6w8HVETs2A=
X-Google-Smtp-Source: APXvYqz6ky8PKTfk7KO7EXr8aQWfBg+vJ9Rn21+mob3h80qkd+IeI+N2xy4veJb5VTeMxEaknpXylw==
X-Received: by 2002:a2e:900c:: with SMTP id h12mr23361371ljg.197.1563459533805; 
 Thu, 18 Jul 2019 07:18:53 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 p27sm3997509lfo.16.2019.07.18.07.18.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 07:18:53 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
 <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <8224da03-6fd7-381e-7600-2a506becd7c9@gmail.com>
Date: Thu, 18 Jul 2019 17:18:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] schedule: mask out XEN_RUNSTATE_UPDATE from
 state entry time
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTguMDcuMTkgMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbnNp
ZGVyaW5nIHRoZSB2YWx1ZSBvZiBYRU5fUlVOU1RBVEVfVVBEQVRFIGl0IG11c3QgYmUgYSByYXRo
ZXIgcmFyZSByYWNlCj4gYW55d2F5LCBJIHdvdWxkIGd1ZXNzLgoKSSdtIG5vdCBzdXJlIGFib3V0
IHRoZSBleGFjdCByYXRlIG9mIHRoZSByYWNlLCBidXQgd2l0aCBmb2xsb3dpbmcgcHJpbnRzOgoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUu
YwppbmRleCAyNWY2YWIzLi42YmE4MmI4IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0xODgsNiArMTg4LDEzIEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKICAgICAgICAgIHYtPnJ1bnN0YXRl
LnRpbWVbdi0+cnVuc3RhdGUuc3RhdGVdICs9IGRlbHRhOwogICAgICAgICAgdi0+cnVuc3RhdGUu
c3RhdGVfZW50cnlfdGltZSA9IG5ld19lbnRyeV90aW1lOwogICAgICB9CisgICAgZWxzZQorICAg
IHsKKyAgICAgICAgcHJpbnRrKCJkZWx0YSAlIlBSSXg2NCIsIHYtPnJ1bnN0YXRlLnN0YXRlX2Vu
dHJ5X3RpbWUgaXMgJSJQUkl4NjQiLCBuZXdfZW50cnlfdGltZSAlIlBSSXg2NCJcbiIsCisgICAg
ICAgICAgICAobG9uZyB1bnNpZ25lZCBpbnQpZGVsdGEsCisgICAgICAgICAgICAobG9uZyB1bnNp
Z25lZCBpbnQpdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSwKKyAgICAgICAgICAgIChsb25n
IHVuc2lnbmVkIGludCluZXdfZW50cnlfdGltZSk7CisgICAgfQogIAogICAgICB2LT5ydW5zdGF0
ZS5zdGF0ZSA9IG5ld19zdGF0ZTsKICB9CgpJJ3ZlIGdvdCBteSBjb25zb2xlIGNvbXBsZXRlbHkg
Zmxvb2RlZCB3aXRoIHNvbWV0aGluZyBsaWtlIGZvbGxvd2luZzoKCihYRU4pIGRlbHRhIDgwMDAw
MDAwMDAwMDA4ZTgsIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgaXMgODAwMDAwMThkNThl
M2NiMywgbmV3X2VudHJ5X3RpbWUgMThkNThlNDU5YgooWEVOKSBkZWx0YSA4MDAwMDAwMDAwMDAx
Yzk4LCB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIGlzIDgwMDAwMDE4ZDgyMjRmYTUsIG5l
d19lbnRyeV90aW1lIDE4ZDgyMjZjM2QKKFhFTikgZGVsdGEgODAwMDAwMDAwMDAwMTJjMCwgdi0+
cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSBpcyA4MDAwMDAxOGQ5NGZlYTE0LCBuZXdfZW50cnlf
dGltZSAxOGQ5NGZmY2Q0CihYRU4pIGRlbHRhIDgwMDAwMDAwMDAwMDBjYTgsIHYtPnJ1bnN0YXRl
LnN0YXRlX2VudHJ5X3RpbWUgaXMgODAwMDAwMThkYTg3NGU4YywgbmV3X2VudHJ5X3RpbWUgMThk
YTg3NWIzNAooWEVOKSBkZWx0YSA4MDAwMDAwMDAwMDAxMzM4LCB2LT5ydW5zdGF0ZS5zdGF0ZV9l
bnRyeV90aW1lIGlzIDgwMDAwMDE4ZGIyNjAyYmMsIG5ld19lbnRyeV90aW1lIDE4ZGIyNjE1ZjQK
KFhFTikgZGVsdGEgODAwMDAwMDAwMDAwMDc4MCwgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGlt
ZSBpcyA4MDAwMDAxOGRkZDllZDFhLCBuZXdfZW50cnlfdGltZSAxOGRkZDlmNDlhCihYRU4pIGRl
bHRhIDgwMDAwMDAwMDAwMDE2ZjgsIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWUgaXMgODAw
MDAwMThlMTlkZWYzOSwgbmV3X2VudHJ5X3RpbWUgMThlMTllMDYzMQooWEVOKSBkZWx0YSA4MDAw
MDAwMDAwMDE2NjljLCB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lIGlzIDgwMDAwMDE4ZTIy
YjE1NTMsIG5ld19lbnRyeV90aW1lIDE4ZTIyYzdiZWYKKFhFTikgZGVsdGEgODAwMDAwMDAwMDAw
MTBlMCwgdi0+cnVuc3RhdGUuc3RhdGVfZW50cnlfdGltZSBpcyA4MDAwMDAxOGUyZDI4ZTcyLCBu
ZXdfZW50cnlfdGltZSAxOGUyZDI5ZjUyCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
