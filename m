Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74056155CB8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 18:19:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j07FU-0002hm-Mh; Fri, 07 Feb 2020 17:17:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kGlu=33=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j07FT-0002hh-EK
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 17:16:59 +0000
X-Inumbo-ID: a589d4bc-49cd-11ea-a677-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a589d4bc-49cd-11ea-a677-bc764e2007e4;
 Fri, 07 Feb 2020 17:16:58 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r18so342914edl.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2020 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bUcYOipJ54gB5RWl+4S+eMgvMVWFP61sJw8PcKxwVsI=;
 b=y+2cojnFixM0WfF7KJ1m4CQwBpQ6TcAWuXrIHcF/BtQrCVpq7EcKZyF7Kbm/yrYDyK
 W0okk+EfS7aUIaTIJKYJ0XhaxYacWjOmzMtr1+KE4LVM9HTwP2uz/ohgjD77pT9OEyzs
 IdoXGKzcWrw0JC6kD86vNtK5iQlmD/pQsKSJpuzkSiyZiwem3VCGwn9fZzc6wjqdIT8m
 spZEQRh3VB5tyFuyTPjRpCP8uLe7pJCefGclGiwB87XbszForkz0Lg+6DUeAgxXXz+OM
 CvjzeE5YH05S+kKtFrCwuRT5RRBFf1LXi+0hOz8YaBvxlOpSACcqXvk0zZgT+4a6k7G2
 KuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bUcYOipJ54gB5RWl+4S+eMgvMVWFP61sJw8PcKxwVsI=;
 b=EBM2235lhO8lFvVXSGaCzjQIFgJ3mHV32JOJI8Mxa82peghDB/2YVtV1uD3BOFEJtl
 Fx6DUMP6DEquZYAj7juR1/Wn95RG6Soi1WU/yjkc9uXzGaRj75uTuMVQrofEWQenI+N/
 IdGug3hxIZyD99WxOeciJOFfoT5RWWkIWpwA0VThig/gWZTilVw/oi6HQoUu8rGugdqC
 Xwpwsu9P+OL6kDx1yfqgIadPTW7Kk+Z0GbTQigge6NZWiPmuP8PMlFAJQrYeEXNlvHl0
 bf+fbHXnfraUO5WU/FW6uzWTuR9HN93o2qWsWPWbZNuEI+dq6hdOxnl1IfVyLB2QgUbC
 toUQ==
X-Gm-Message-State: APjAAAVo+s/4jbL+esaAMx1Ktj+A+DFkKvH8QdQbYDQQlcRhY0CMxb/C
 UYIZ0zqdl9WRWy33pwMGm1TIbZcSHI8=
X-Google-Smtp-Source: APXvYqyVT7uX3le7FkwbKLtkiSrYZBDS/wNV0oykndGmC3Cc3IzHlFo0UEIwnZlbZAu7C1ze8QPtIA==
X-Received: by 2002:a17:906:4a12:: with SMTP id
 w18mr246167eju.321.1581095817615; 
 Fri, 07 Feb 2020 09:16:57 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id j17sm424484ejo.1.2020.02.07.09.16.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 09:16:57 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id q9so3295262wmj.5
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2020 09:16:57 -0800 (PST)
X-Received: by 2002:a7b:c216:: with SMTP id x22mr5560101wmi.51.1581095816643; 
 Fri, 07 Feb 2020 09:16:56 -0800 (PST)
MIME-Version: 1.0
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
 <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
 <20200207095249.GB4679@Air-de-Roger>
 <86e31583-7f4c-c365-17f1-92b82acb5d81@suse.com>
In-Reply-To: <86e31583-7f4c-c365-17f1-92b82acb5d81@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 7 Feb 2020 10:16:20 -0700
X-Gmail-Original-Message-ID: <CABfawhkcHMbiRFSp9WoP2ZPXgOjaWU02tmmOqRafo8VmoQaBCw@mail.gmail.com>
Message-ID: <CABfawhkcHMbiRFSp9WoP2ZPXgOjaWU02tmmOqRafo8VmoQaBCw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgNywgMjAyMCBhdCA5OjU0IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwNy4wMi4yMDIwIDEwOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+ID4gT24gRnJpLCBGZWIgMDcsIDIwMjAgYXQgMDk6MDg6MTVBTSArMDEwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gT24gMDYuMDIuMjAyMCAxNjoyMCwgSmFuIEJldWxpY2ggd3JvdGU6
Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gPj4+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jCj4gPj4+IEBAIC0zMDM3LDkgKzMwMzcsOCBAQCBzdGF0aWMg
aW50IHZteF9hbGxvY192bGFwaWNfbWFwcGluZyhzdHJ1Cj4gPj4+ICAgICAgc2hhcmVfeGVuX3Bh
Z2Vfd2l0aF9ndWVzdChwZywgZCwgU0hBUkVfcncpOwo+ID4+PiAgICAgIGQtPmFyY2guaHZtLnZt
eC5hcGljX2FjY2Vzc19tZm4gPSBtZm47Cj4gPj4+Cj4gPj4+IC0gICAgcmV0dXJuIHNldF9tbWlv
X3AybV9lbnRyeShkLCBwYWRkcl90b19wZm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksIG1mbiwK
PiA+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEssCj4gPj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3RwMm0oZCktPmRlZmF1
bHRfYWNjZXNzKTsKPiA+Pj4gKyAgICByZXR1cm4gc2V0X21taW9fcDJtX2VudHJ5KGQsIGdhZGRy
X3RvX2dmbihBUElDX0RFRkFVTFRfUEhZU19CQVNFKSwgbWZuLAo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgUEFHRV9PUkRFUl80Syk7Cj4gPj4+ICB9Cj4gPj4KPiA+PiBVcG9u
IDJuZCB0aG91Z2h0IC0gZG9lcyB0aGlzIHJlYWxseSB3YW50IHRvIHVzZSBkZWZhdWx0IGFjY2Vz
cz8KPiA+PiBFeGVjdXRlIHBlcm1pc3Npb24gZm9yIHRoaXMgcGFnZSBsb29rcyBhIGxpdHRsZSBz
dXNwaWNpb3VzLgo+ID4+IElzbid0IGl0IHRoZSBjYXNlIHRoYXQgdGhpcyBwYWdlIGRvZXNuJ3Qg
KG5vcm1hbGx5PykgZ2V0Cj4gPj4gYWNjZXNzZWQgYXQgYWxsLCBhbmQgaW5zdGVhZCBpdHMgYWRk
cmVzcyBzZXJ2ZXMgYXMgYW4gaW5kaWNhdG9yCj4gPj4gdG8gdGhlIENQVT8gKEkgZXZlbiB2YWd1
ZWx5IHJlY2FsbCBpdCBoYXZpbmcgYmVlbiBjb25zaWRlcmVkIHRvCj4gPj4gY29uc29saWRhdGUg
dGhpcywgdG8gZS5nLiBhIHNpbmdsZSBwYWdlIHBlciBkb21haW4uKSBJbiB3aGljaAo+ID4+IGNh
c2UgZXZlbiBwMm1fYWNjZXNzX24gbWlnaHQgYmUgZ29vZCBlbm91Z2g/Cj4gPgo+ID4gSG0sIEkg
dGhpbmsgcDJtX2FjY2Vzc19uIGlzIG5vdCBlbm91Z2gsIGFzIHRoYXQgd291bGQgdHJpZ2dlciBh
biBFUFQKPiA+IGZhdWx0IHdoaWNoIGhhcyBwcmVmZXJlbmNlIG92ZXIgdGhlIEFQSUMgYWNjZXNz
IFZNIGV4aXQgKHNlZSAyOS40LjEKPiA+IFByaW9yaXR5IG9mIEFQSUMtQWNjZXNzIFZNIEV4aXRz
KS4KPgo+IEFoLCB5ZXMsIHJlYWRpbmcgdGhhdCB0ZXh0IEkgYWdyZWUuIEhhdmluZyBqdXN0IGEg
c2luZ2xlIHN1Y2ggcGFnZQo+IHBlciBkb21haW4gd291bGQgc3RpbGwgc2VlbSBwb3NzaWJsZSwg
dGhvdWdoLiBBbHRob3VnaCwgaWYgd2UgbWVhbnQKPiB0byBzdXBwb3J0IGEgZ3Vlc3QgbW92aW5n
IHRoZSBBUElDIGJhc2UgYWRkcmVzcywgdGhlbiB3ZSBjb3VsZG4ndCwKPiBhZ2Fpbi4KPgo+ID4g
SSB0aGluayBzZXR0aW5nIGl0IHRvIHAybV9hY2Nlc3Nfcncgc2hvdWxkIGJlIGVub3VnaCwgYW5k
IHdlIHdvdWxkIGdldAo+ID4gRVBUIGZhdWx0cyB3aGVuIHRyeWluZyB0byBleGVjdXRlIGZyb20g
QVBJQyBwYWdlLgo+Cj4gVGhlbiB0aGUgb3RoZXIgcXVlc3Rpb24gaXMgd2hldGhlciB0aGVyZSdz
IGFueSB1c2UgZm9yIGludHJvc3BlY3Rpb24KPiB0byBmdXJ0aGVyIGxpbWl0IHBlcm1pc3Npb25z
IG9uIHRoaXMgKGtpbmQgb2YgZmFrZSkgcGFnZS4gVGFtYXM/CgpJJ20gbm90IGF3YXJlIG9mIGFu
eSB1c2UtY2FzZSB0aGF0IHdvdWxkIHJlc3RyaWN0IHRoZSBFUFQgcGVybWlzc2lvbgpmb3IgTU1J
TyBwYWdlcy4gVGhhdCBzYWlkLCBhbiBhcHBsaWNhdGlvbiBjb3VsZCBzdGlsbCByZXF1ZXN0IHRo
YXQgdG8KYmUgc2V0IGxhdGVyIG9uLiBTaW5jZSB0aGlzIGZ1bmN0aW9uIGhlcmUgZ2V0cyBjYWxs
ZWQgaW4Kdm14X2RvbWFpbl9pbml0aWFsaXNlIEkgc3VzcGVjdCBhIG1lbV9hY2Nlc3MgdXNlciBk
aWRuJ3QgZXZlbiBoYXZlIGEKY2hhbmNlIHRvIGNoYW5nZSB0aGUgZGVmYXVsdF9hY2Nlc3MgdG8g
YW55dGhpbmcgY3VzdG9tIHNvIEkgdmVudHVyZSBpdAp3b3VsZCBiZSBzYWZlIHRvIGNob29zZSB3
aGF0ZXZlciBwZXJtaXNzaW9uIGlzIHNlbnNpYmxlLiBJZiBhbnlvbmUKd2FudHMgdG8gbWVzcyB3
aXRoIHRoZSBwZXJtaXNzaW9uIGxhdGVyIHRoZXkgY2FuIGRvIHRoYXQgcmVnYXJkbGVzcyBvZgp3
aGF0IHdhcyBzZXQgaGVyZS4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
