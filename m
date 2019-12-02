Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D4E10E6B2
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 09:08:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibgha-0003Rn-8K; Mon, 02 Dec 2019 08:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZQMp=ZY=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1ibghY-0003Ri-Sj
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 08:05:00 +0000
X-Inumbo-ID: 6f91b014-14da-11ea-83b8-bc764e2007e4
Received: from mail-lf1-x12f.google.com (unknown [2a00:1450:4864:20::12f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f91b014-14da-11ea-83b8-bc764e2007e4;
 Mon, 02 Dec 2019 08:05:00 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id a17so27120355lfi.13;
 Mon, 02 Dec 2019 00:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YT0q6ErbIgCUmILsG9KiDfNIa/IHatVOITvJoLOePBs=;
 b=ZYnLAAowgDDQG3N3PEI3QO7cNl0M/131ogOq3pymEwiKWpZIbqy47ebpu5r9RKuy77
 rVM9JlP4R3YCZo6SyJTJuaU/0ceVDdI9ik4EHLeU5ulXAuvZbKAa0POIiSHMNfcYnX59
 jZNRhcScgHhoUE3J8cy9zzV3pfsbsHfpptLoUAxrb9mFB3qvwXZWzXnnU8kElHMh/IBG
 GN/Zh4c2FeGAOdbLLRmHgNdWj0Ql62TEBiUS8Y2bzKZQTuPKWX7WAGHMEauW7u5En5TW
 8RHA5erfGd55mJVD74RJYQsSP4KZ7piF1pn5b3pmADsRhVVu/+jf+EAE3gjV2VqKfKf0
 5WHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YT0q6ErbIgCUmILsG9KiDfNIa/IHatVOITvJoLOePBs=;
 b=XF1vsOWJZogCZP5Poe4xUBs/jOOEfbWqPrKN5+c9NKaQZDmuNy8qQsgAZmIRnu2ZNA
 /NJvBzFyoLY3SNYUWjv6a2QIqWYfRLfEi26Kf0wapdqaN+z/A8HFYSmjN2qxDgjfMYDE
 cFRuK3OG21TbT7o77PwJ+cD3mm0H3NJgAhGjZovVC42LDWqSc7RcdHF0+gSC7uGTc8fj
 j/cbaEoc9kS+Q9SoAasmRI0trddJ/NDlQdRR3Uqkr4qyskuFfBLtVzmSBDFnTknqsssi
 KcLJzHSa2xPS3+ChWClkKuKq4xERm3sadEUELk2aGXiVbRlq0SHBMg7RlZjtJo4V574a
 Otrg==
X-Gm-Message-State: APjAAAXWGfPNEGOS2D+/cp+InGsfWSdI8gLZ0xW92NIFRBJ5CdTLdvYO
 s1hdeLwQxeJJfhrMnXh5Cdd5quq9
X-Google-Smtp-Source: APXvYqw0tHR8RpFwAweCWTswguH9/mJPBtDfVAvQd3IVr+oRduSzCd/Quac2bB3MqaEmH37lW5L+XA==
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr13002277lfp.121.1575273898343; 
 Mon, 02 Dec 2019 00:04:58 -0800 (PST)
Received: from [10.17.182.20] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 a8sm14512559ljb.11.2019.12.02.00.04.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Dec 2019 00:04:57 -0800 (PST)
To: Rajagopal Aravindan <a.rajagopal@globaledgesoft.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
References: <HK0PR03MB5156D1418F9E15BB16EFA2B391430@HK0PR03MB5156.apcprd03.prod.outlook.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <43715072-2839-2f78-b312-ff5c696b3281@gmail.com>
Date: Mon, 2 Dec 2019 10:04:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <HK0PR03MB5156D1418F9E15BB16EFA2B391430@HK0PR03MB5156.apcprd03.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen PV Audio drivers
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "xen-users@lists.xenproject.org" <xen-users@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMi8xOSA5OjU0IEFNLCBSYWphZ29wYWwgQXJhdmluZGFuIHdyb3RlOgo+IEhlbGxvIE9s
ZWtzYW5kciwKPgpIaSwKPiBXLnIudCB0aGUgc3ViamVjdCwgY2FtZSBhY3Jvc3MgdGhpcyBsaW5r
IAo+IGh0dHBzOi8vbHduLm5ldC9BcnRpY2xlcy83MzAwNzUvLgo+Cj4gQ291bGQgeW91IHBsZWFz
ZSBwb2ludCB1cyB0byBpbnN0cnVjdGlvbnMgZm9yIHRyeWluZyB0aGUgc2FtZSBvbiB4ODYgCj4g
d2l0aCBhIFVidW50dS9BbmRyb2lkIGd1ZXN0ID8KTmV2ZXIgdHJpZWQgdGhhdCBvbiB4ODYsIGJ1
dCBzZWUgbm90aGluZyB3aGljaCBjb3VsZCBzdG9wIHlvdQo+IEkgbWVhbiwgd2hhdCBuZWVkcyB0
byBiZSBlbmFibGVkIGluIHRoZSBob3N0L2d1ZXN0IGFuZCB3aGF0IHRvIGJlIAo+IGFkZGVkIGlu
IGRvbXUuY2ZnIGV0Ywo+CllvdSBjYW4gc3RhcnQgZnJvbSBsb29raW5nIGF0IHRoZSBZb2N0byBt
ZXRhIGxheWVycyB3aGljaCB3ZSBoYXZlCndpdGggdmlydHVhbCBzb3VuZCBlbmFibGVkIFsxXQo+
IFRoYW5rcywKPiBSYWphZ29wYWwKCj4gRGlzY2xhaW1lcjogIlRoaXMgbWVzc2FnZSBpcyBpbnRl
bmRlZCBvbmx5IGZvciB0aGUgZGVzaWduYXRlZCAKPiByZWNpcGllbnQocykuIEl0IG1heSBjb250
YWluIGNvbmZpZGVudGlhbCBvciBwcm9wcmlldGFyeSBpbmZvcm1hdGlvbiAKPiBhbmQgbWF5IGJl
IHN1YmplY3QgdG8gb3RoZXIgY29uZmlkZW50aWFsaXR5IHByb3RlY3Rpb25zLiBJZiB5b3UgYXJl
IAo+IG5vdCBhIGRlc2lnbmF0ZWQgcmVjaXBpZW50LCB5b3UgbWF5IG5vdCByZXZpZXcsIGNvcHkg
b3IgZGlzdHJpYnV0ZSAKPiB0aGlzIG1lc3NhZ2UuIFBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBi
eSBlLW1haWwgYW5kIGRlbGV0ZSB0aGlzIAo+IG1lc3NhZ2UuIEdsb2JhbEVkZ2UgZG9lcyBub3Qg
YWNjZXB0IGFueSBsaWFiaWxpdHkgZm9yIHZpcnVzIGluZmVjdGVkIAo+IG1haWxzLiIgCl5eXiBJ
IGRvIGJlbGlldmUgdGhpcyBpcyBub3QgdGhlIHJpZ2h0IHRoaW5nIGZvciB0aGlzIGxpc3QuLi4K
ClsxXSBodHRwczovL2dpdGh1Yi5jb20veGVuLXRyb29wcy9tZXRhLXh0LXByb2QtZGV2ZWwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
