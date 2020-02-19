Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1775164ABD
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:40:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4SMZ-0002dl-Rh; Wed, 19 Feb 2020 16:38:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rwKB=4H=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1j4SMX-0002dg-TR
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:38:13 +0000
X-Inumbo-ID: 3867ec4e-5336-11ea-ade5-bc764e2007e4
Received: from mail-wr1-x442.google.com (unknown [2a00:1450:4864:20::442])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3867ec4e-5336-11ea-ade5-bc764e2007e4;
 Wed, 19 Feb 2020 16:38:13 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w12so1339977wrt.2
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2020 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JJbXHfjLBVyOzHIQ/8CiQsz9pBoeJpg7z9eI5wbz9F0=;
 b=BN3oJ0K5GtHwXqHI+Lcpk+7aLFqbI+lY2Cdf/syycaDqedO2l2b/dMfe9jFrYx4rl6
 fjJZ5dzECyAsvyq0T1oKenHgPcTfZ4ESxmfP20IVc/mLH4FimWM0nJtWpDsccK9rvdZp
 lMdR2tvamEkCEchI2NA6yEaP+v/FQyodDXfxvT0jI0PpY0taKzkf6L07VBtnwRQhShIz
 AyA+MZfyuVBvGkVu6cWaq9b6mNCSNjoMn+L8LONnKCcxUxSnIgfoOiRi6W+0Dv161v5w
 LpF0hjx4q1yURJi8k8rV5pnrzL/+hzHhrbdNLanr6aRNY37ZYWHHhIwYnjav+6yTlyjx
 81hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JJbXHfjLBVyOzHIQ/8CiQsz9pBoeJpg7z9eI5wbz9F0=;
 b=PlXR//jstXdXQV7u648fU6VtitjzPDaG8YNkmPD9fMOuPREqZPrlUP3knkXDOv9pSz
 3x1iwX4dhzd0sfujccrQ7T3PCEfwPbUAl2sztjjy4xxiSWVRSywwZUefMkFilS5cETGU
 fgD0QC0hV8xAzZ4vw4qbcIBXBwF1x784IRKsj4Nv4wUTo3S4s9/D7oYf17Rtp6/zR82M
 vXzLm3F87z0O8+pd0MSj2oP7Wdq2RABM4lIsc/YvrNR3fRm8alZr7pBTvyNga6HanfBo
 k4zdD+qWAur5wnAwNuzDwOmauwRFlEox9DvO4NlQ/kv5inJXMdV3mTdcKQTpamYWXiz/
 bKBA==
X-Gm-Message-State: APjAAAW74PuwotVHhl/Wyp6Nsj8U5KmV7A/fOZ+iprxPIuJV0xRBfp/2
 AHoSswaRdBna4JVhcoD/fiQajnkNGSB8KiZ1doc=
X-Google-Smtp-Source: APXvYqw/1rV0H0E7SG0qCnhxRbstVcruB6y/Qw7dIc6VEcx8SWnLtzdejND9KpHxW09A+YWCZoA3lT92o23nh/g7U1w=
X-Received: by 2002:a5d:5381:: with SMTP id d1mr36226876wrv.259.1582130292387; 
 Wed, 19 Feb 2020 08:38:12 -0800 (PST)
MIME-Version: 1.0
References: <20200219091811.9689-1-aisaila@bitdefender.com>
In-Reply-To: <20200219091811.9689-1-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 19 Feb 2020 09:37:36 -0700
Message-ID: <CABfawhkS2f6p9gFDP6h4vS5b7eAe_d-knsrvcz9O8zyjv-stvw@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V3] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMjoxOSBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQo8
YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gQXQgdGhpcyBtb21lbnQgYSBndWVz
dCBjYW4gY2FsbCB2bWZ1bmMgdG8gY2hhbmdlIHRoZSBhbHRwMm0gdmlldy4gVGhpcwo+IHNob3Vs
ZCBiZSBsaW1pdGVkIGluIG9yZGVyIHRvIGF2b2lkIGFueSB1bndhbnRlZCB2aWV3IHN3aXRjaC4K
Pgo+IFRoZSBuZXcgeGNfYWx0cDJtX3NldF92aXNpYmlsaXR5KCkgc29sdmVzIHRoaXMgYnkgbWFr
aW5nIHZpZXdzIGludmlzaWJsZQo+IHRvIHZtZnVuYy4KPiBUaGlzIGlzIGRvbmUgYnkgaGF2aW5n
IGEgc2VwYXJhdGUgYXJjaC5hbHRwMm1fd29ya2luZ19lcHRwIHRoYXQgaXMKPiBwb3B1bGF0ZWQg
YW5kIG1hZGUgaW52YWxpZCBpbiB0aGUgc2FtZSBwbGFjZXMgYXMgYWx0cDJtX2VwdHAuIFRoaXMg
aXMKPiB3cml0dGVuIHRvIEVQVFBfTElTVF9BRERSLgo+IFRoZSB2aWV3cyBhcmUgbWFkZSBpbi92
aXNpYmxlIGJ5IG1hcmtpbmcgdGhlbSB3aXRoIElOVkFMSURfTUZOIG9yCj4gY29weWluZyB0aGVt
IGJhY2sgZnJvbSBhbHRwMm1fZXB0cC4KPiBUbyBoYXZlIGNvbnNpc3RlbmN5IHRoZSB2aXNpYmls
aXR5IGFsc28gYXBwbGllcyB0bwo+IHAybV9zd2l0Y2hfZG9tYWluX2FsdHAybV9ieV9pZCgpLgoK
SSdtIGp1c3Qgd29uZGVyaW5nLCB3aGF0IHByZXZlbnRzIHRoZSBndWVzdCBmcm9tIGNhbGxpbmcg
dGhpcyBIVk0gb3AKYmVmb3JlIGRvaW5nIHZtZnVuYz8gVGhpcyBzZWVtcyB0byBvbmx5IG1ha2Ug
YSBkaWZmZXJlbmNlIGluIGNhc2UgdGhlCmFsdHAybSBtb2RlIGlzIGVpdGhlciBzZXQgYXMgZXh0
ZXJuYWwgb3IgbGltaXRlZCAob3IgaGF2ZSBhIG1vcmUKZmluZS1ncmFpbmVkIFhTTSBwb2xpY3kg
bG9hZGVkKS4gSXMgdGhhdCBjb3JyZWN0PyBJZiBzbywgcGVyaGFwcwptZW50aW9uIHRoYXQgaW4g
dGhlIGNvbW1pdCBtZXNzYWdlIGFuZCBhcyBhIGNvbW1lbnQgb24gdGhlIGxpYnhjCmZ1bmN0aW9u
IHNvIHRoYXQgcGVvcGxlIGRvbid0IGdldCBhIGZhbHNlIHNlbnNlIG9mIHNlY3VyaXR5IHdoZW4g
dXNpbmcKdGhlIG1peGVkIG1vZGUuCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
