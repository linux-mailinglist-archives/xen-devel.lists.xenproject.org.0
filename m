Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086C9CB57E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 09:53:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGILp-00037l-JG; Fri, 04 Oct 2019 07:50:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ihSl=X5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iGILn-00037g-Sg
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 07:50:07 +0000
X-Inumbo-ID: 94eba42e-e67b-11e9-8c93-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94eba42e-e67b-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570175407;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Othca0hIMbBGrlivOVFEQP/Ci1FFGx3R6ngUnR+bz9A=;
 b=Kt8sc6Lj0fo/dtsDxq+9ImwFjZSmffg6LpTqwCWmRmDuCeXedK62FW/c
 NzdfCDxU88YyxYceBWKekPWyHaMVbbS8iNXY6vNzbasFU7oYHAsv0Kiie
 WkNGoC0WWKUT4eEXsXoDCAKVbNcEmbX9gO2rG4UO/sRS/7pZBXlVLPe2j s=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: wH4G7oD1MrUuT4OiKRarF+4JovE/bpFL7nXc1m6lzVDJcA/C3TeTuMlc9/Z40Z1iX3E1A+CfDx
 FfL0nlgrAG6ORR1s0/w69jjMl4yXuazKPDMVj2NLpwgeqBOu6hRvy+fGAJR4pkxSE7UPcDYV3z
 GxLWibD1cumLySE7anh8ywYD4UJ+PLBW9DUZhfdbeRivhDZMWvPs5GSFFRi47Ig+k8ggJdAZk2
 tt9P7PNI0J+7lLCPON0QIrDeV7KGq/dR7U4iaA/T2GwbIe4+lOEF56MY0fwhcPEEa00n2Ofd4r
 LRs=
X-SBRS: 2.7
X-MesageID: 6713952
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,255,1566878400"; 
   d="scan'208";a="6713952"
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
References: <20191004064010.25646-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7cc89db1-90de-8435-77f3-c69e6e0217e4@citrix.com>
Date: Fri, 4 Oct 2019 08:50:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191004064010.25646-1-jgross@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix locking in
 sched_tick_[suspend|resume]()
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
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAwNzo0MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBzY2hlZF90aWNrX3N1
c3BlbmQoKSBhbmQgc2NoZWRfdGlja19yZXN1bWUoKSBzaG91bGQgbm90IGNhbGwgdGhlCj4gc2No
ZWR1bGVyIHNwZWNpZmljIHRpbWVyIGhhbmRsZXJzIGluIGNhc2UgdGhlIGNwdSB0aGV5IGFyZSBy
dW5uaW5nIG9uCj4gaXMganVzdCBiZWluZyBtb3ZlZCB0byBvciBmcm9tIGEgY3B1cG9vbC4KPgo+
IFVzZSBhIG5ldyBwZXJjcHUgbG9jayBmb3IgdGhhdCBwdXJwb3NlLgo+Cj4gUmVwb3J0ZWQtYnk6
IFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gLS0tCj4gVG8gYmUgYXBwbGllZCBv
biB0b3Agb2YgbXkgY29yZSBzY2hlZHVsaW5nIHNlcmllcy4KClRoZXJlIGlzIGEgc29tZXdoYXQg
aW50ZXJlc3Rpbmcgc3RhY2sgdHJhY2UgdG8gZ28gd2l0aCB0aGlzCgooWEVOKSBUZXN0aW5nIE5N
SSB3YXRjaGRvZyBvbiBhbGwgQ1BVczogb2sKKFhFTikgLS0tLVsgWGVuLTQuMTMuMC04LjAuMTIt
ZMKgIHg4Nl82NMKgIGRlYnVnPXnCoMKgIE5vdCB0YWludGVkIF0tLS0tCihYRU4pIENQVTrCoMKg
wqAgNzkKKFhFTikgUklQOsKgwqDCoCBlMDA4Ols8ZmZmZjgyZDA4MDI0NjdkYz5dIHNldF90aW1l
cisweDM5LzB4MWY3CihYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDAwMsKgwqAgQ09OVEVYVDog
aHlwZXJ2aXNvcgo8c25pcD4KKFhFTikgWGVuIGNhbGwgdHJhY2U6CihYRU4pwqDCoMKgIFs8ZmZm
ZjgyZDA4MDI0NjdkYz5dIHNldF90aW1lcisweDM5LzB4MWY3CihYRU4pwqDCoMKgIFs8ZmZmZjgy
ZDA4MDIyYzFmND5dIHNjaGVkX2NyZWRpdC5jI2NzY2hlZF90aWNrX3Jlc3VtZSsweDU0LzB4NTkK
KFhFTinCoMKgwqAgWzxmZmZmODJkMDgwMjQxZGZlPl0gc2NoZWRfdGlja19yZXN1bWUrMHg2Ny8w
eDg2CihYRU4pwqDCoMKgIFs8ZmZmZjgyZDA4MDJlZGE1Mj5dIG13YWl0LWlkbGUuYyNtd2FpdF9p
ZGxlKzB4MzJiLzB4MzU3CihYRU4pwqDCoMKgIFs8ZmZmZjgyZDA4MDI3OTM5ZT5dIGRvbWFpbi5j
I2lkbGVfbG9vcCsweGE2LzB4YzIKKFhFTikKKFhFTikgUnVubmluZyBzdHViIHJlY292ZXJ5IHNl
bGZ0ZXN0cy4uLgooWEVOKSBQYWdldGFibGUgd2FsayBmcm9tIDAwMDAwMDAwMDAwMDAwNDg6CihY
RU4pIHRyYXBzLmM6MTU2NDogR1BGICgwMDAwKTogZmZmZjgyZDBiZmZmZjA0MSBbZmZmZjgyZDBi
ZmZmZjA0MV0gLT4KZmZmZjgyZDA4MDM4OTNmMgooWEVOKcKgIEw0WzB4MDAwXSA9IDAwMDAwMDgy
Y2ZiOWMwNjMgZmZmZmZmZmZmZmZmZmZmZgooWEVOKSB0cmFwcy5jOjc1OTogVHJhcCAxMjogZmZm
ZjgyZDBiZmZmZjA0MCBbZmZmZjgyZDBiZmZmZjA0MF0gLT4KZmZmZjgyZDA4MDM4OTNmMgooWEVO
KcKgIEwzWzB4MDAwXSA9IDAwMDAwMDgyY2ZiOWIwNjMgZmZmZmZmZmZmZmZmZmZmZgooWEVOKSB0
cmFwcy5jOjEwOTg6IFRyYXAgMzogZmZmZjgyZDBiZmZmZjA0MSBbZmZmZjgyZDBiZmZmZjA0MV0g
LT4KZmZmZjgyZDA4MDM4OTNmMgooWEVOKcKgIEwyWzB4MDAwXSA9IDAwMDAwMDgyY2ZiOWEwNjMg
ZmZmZmZmZmZmZmZmZmZmZgooWEVOKcKgIEwxWzB4MDAwXSA9IDAwMDAwMDAwMDAwMDAwMDAgZmZm
ZmZmZmZmZmZmZmZmZgooWEVOKQooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqCihYRU4pIFBhbmljIG9uIENQVSA3OToKKFhFTikgRkFUQUwgUEFHRSBGQVVMVAoo
WEVOKSBbZXJyb3JfY29kZT0wMDAwXQooWEVOKSBGYXVsdGluZyBsaW5lYXIgYWRkcmVzczogMDAw
MDAwMDAwMDAwMDA0OAooWEVOKSAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqCgp3aGljaCBkZW1vbnN0cmF0ZXMgQ1BVIDc5IGV4cGxvZGluZyBzdHJhaWdodCBvdXQgb2Yg
aWRsZSwgd2hpbGUgdGhlIEJTUAppcyBjb250aW51aW5nIHRvIGJvb3QuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
