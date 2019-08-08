Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A9D8629B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 15:06:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvi5A-0007OB-16; Thu, 08 Aug 2019 13:03:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u8RY=WE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hvi58-0007N9-Hj
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 13:03:50 +0000
X-Inumbo-ID: f614807a-b9dc-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f614807a-b9dc-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 13:03:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i21so9567427ljj.3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2019 06:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=sNYlHqHEg6tTpi4mmH1loEhHWsDWsjOyVPlihdujqRw=;
 b=DpNIXJsA9zmQNV0Bhm4cZrR5SE8m5sLMmXj2nh7TzRxAaZOqUjgMVJZPGbk7XIuiYU
 nN/wb8njzn5tW+XGTb3s/KN7gdlJqLAutmo+5zcYormAIBTO6q4DZMPWTRHXPwpmU0ST
 Qoi71DmVlA2aGsSitPpA4e7pSlOh5/jp2bL68j0l9DVlWAHktREsLhD58guo2rqkm849
 nN2+WqShRaIi/8j68UrFAP6escwT/UWMnvuotIXbiA+Q6XER7IK0yDkQKKHZXiRIDEXv
 lDQwsaB8W7EbymAyFoRa+gXsHwnGhClRXIjYWvgtNRKcmJHliHlOBpKi088riRKs23FS
 wSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=sNYlHqHEg6tTpi4mmH1loEhHWsDWsjOyVPlihdujqRw=;
 b=VyjX1RzIoALHT2oQI646hQmEg6H59xjdkFNOOPVqlXmm2EXxoUqgwgAdtFXbFHMIOG
 e6T+jOBR1CW7Y+9AJe4Q7fRFiTcpTS1PJvoMaf6zkCD45gUfaVcEiwejJcaAqC7W2Qp8
 jhaetaRiQ61m4nrqrhBGxNQOkqm5V+TuN5C3dRAygsQYEL92c+5AUNEZhFAOIJgDbuVl
 sy3nW1cqryYzszfM+IyqVK6hIwRGytAOL9pmBuLO54QsDtLS33hpmFf3NUdy8bObjWej
 //iPkvz4Bf6Gd5R00UoFjd4sFEMD3phGWMRZ3JBFJTHBglvEWbdnaXw6CogED/3ydGe3
 GrEg==
X-Gm-Message-State: APjAAAUbdR47ovGqUCIDfMMvyvQkMsHfxTWvu9U+RauOwLktsfHx119j
 7FTJ0gkS4Qp5QVhBTFf0ID4=
X-Google-Smtp-Source: APXvYqwG5FuZVR/FhWG+pSGgQU0ftXRFhP1HdeeC32VrCUjQG0QMesOgHWyhltA2V8iFo4niYEE+IA==
X-Received: by 2002:a2e:80d6:: with SMTP id r22mr8173300ljg.83.1565269427465; 
 Thu, 08 Aug 2019 06:03:47 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id b17sm19004146ljf.34.2019.08.08.06.03.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:03:46 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1565261603-9632-1-git-send-email-olekstysh@gmail.com>
 <20190808110107.kh2jbl2eztgzong3@Air-de-Roger>
 <e5483aef-cb1f-4fa0-eea7-59005ababa38@gmail.com>
 <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <a6d060d0-663e-83ac-e880-813db882b677@gmail.com>
Date: Thu, 8 Aug 2019 16:03:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2dfcda6f-c5da-7b86-429f-f11827ad1b08@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Let the IOMMU be accessible by
 Dom0 if forcibly disabled in Xen
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
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKdWxpZW4sIFJvZ2VyLgoKCgo+Pgo+Pgo+Pj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQg
MDE6NTM6MjNQTSArMDMwMCwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4+Pj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+
Cj4+Pj4gRG9uJ3Qgc2tpcCBJT01NVSBub2RlcyB3aGVuIGNyZWF0aW5nIERUIGZvciBEb20wIGlm
IElPTU1VIGhhcyBiZWVuCj4+Pj4gZm9yY2libHkgZGlzYWJsZWQgaW4gYm9vdGFyZ3MgKGUuZy4g
ImlvbW11PTAiKSBpbiBvcmRlciB0byBsZXQKPj4+PiB0aGUgSU9NTVUgYmUgYWNjZXNzaWJsZSBi
eSBET00wLgo+Cj4gSSBkb24ndCB0aGluayB5b3VyIGNvZGUgaXMgZG9pbmcgd2hhdCB5b3UgZXhw
ZWN0Li4uIElmIGlvbW11PTAsIHRoZW4gCj4gWGVuIHdpbGwgbm90IGxvb2t1cCBmb3IgSU9NTVVz
IChpb21tdV9oYXJkd2FyZV9zZXR1cCgpIHdpbGwgbm90IGJlIAo+IGNhbGxlZCkuIFNvIG5vbmUg
b2YgdGhlIGRldmljZSB3aWxsIGhhdmUgREVWSUNFX0lPTU1VIHNldCBhbmQgaGVuY2UgCj4gdGhl
eSBhcmUgYWxyZWFkeSBnaXZlbiB0byBkb20wLgo+Cj4gQnV0IEkgdGhpbmsgaXQgaXMgd3Jvbmcg
dG8gZ2l2ZSB0aGUgSU9NTVVzIHRvIERvbTAgd2hlbiBpb21tdT0wLiBUaGlzIAo+IGlzIG5vdCB0
aGUgZ29hbCBvZiB0aGlzIG9wdGlvbi4gSWYgeW91IHdhbnQgdG8gcGFzc3Rocm91Z2ggdGhlIElP
TU1VIAo+IHRvIERvbTAsIHRoZW4geW91IHNob3VsZCB1c2UgdGhlIHBhcmFtZXRlciBpb21tdV9o
d2RvbV9wYXNzdGhyb3VnaC4KPgo+IEhvd2V2ZXIsIEkgYWdyZWUgd2l0aCBSb2dlciB0aGF0IGdp
dmluZyB0aGUgSU9NTVUgdG8gZG9tMCBpcyBhIHByZXR0eSAKPiBiYWQgaWRlYS4gU28gdGhpcyBz
aG91bGQgYmUgZml4ZWQuCgoKSSBmdWxseSBhZ3JlZSB3aXRoIHRoZSBhcmd1bWVudHMgcHJvdmlk
ZWQgdGhhdCBpdCBpcyBhIGJhZCBpZGVhLiBTbywgCnBsZWFzZSBjb25zaWRlciB0aGF0IHBhdGNo
IGFzIG5vdCByZWxldmFudC4KCgpCdXQsIEkgYW0gbm90IHN1cmUgSSBmb2xsb3cgdGhlIGxhc3Qg
c2VudGVuY2U6CgogPj4+IElmIGlvbW11PTAsIHRoZW4gWGVuIHdpbGwgbm90IGxvb2t1cCBmb3Ig
SU9NTVVzIAooaW9tbXVfaGFyZHdhcmVfc2V0dXAoKSB3aWxsIG5vdCBiZSBjYWxsZWQpLiBTbyBu
b25lIG9mIHRoZSBkZXZpY2Ugd2lsbCAKaGF2ZSBERVZJQ0VfSU9NTVUgc2V0IGFuZCBoZW5jZSB0
aGV5IGFyZSBhbHJlYWR5IGdpdmVuIHRvIGRvbTAuCgpJIGNhbiBzZWUgdGhhdCBkZXZpY2VzIGhh
dmUgREVWSUNFX0lPTU1VIHNldC4gQWx0aG91Z2gsIHRoZSBJT01NVSBkcml2ZXIgCmlzIG5vdCBp
biB1c2UsIGl0IGlzIHByZXNlbnQgYW5kIGNvbXBhdGlibGUgbWF0Y2hlcy4gU28sIGV2ZW4gaWYg
CmlvbW11PTAsIHRoZSBJT01NVSBkZXZpY2VzIGFyZSBub3QgZ2l2ZW4gdG8gRG9tMCwgYmVjYXVz
ZSBvZiBza2lwcGVkLiBPciAKSSBtaXNzZWQgc29tZXRoaW5nPwoKCi0tIApSZWdhcmRzLAoKT2xl
a3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
