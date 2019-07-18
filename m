Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7621D6CF80
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:14:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho78m-0005KS-Fu; Thu, 18 Jul 2019 14:12:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho78k-0005KI-Up
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:12:10 +0000
X-Inumbo-ID: 07359e93-a966-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07359e93-a966-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:12:09 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x3so19398244lfc.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 07:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8vWcIHW+PPJHPRGK+q1n/MDukzT8xVr6X40GBd/+wk8=;
 b=ip5RyBbDBpY6qWQPM7IYiRW9D0zJjJQf/bRPKV5cNAlgAyYgJE8z4HyjMxhsREeZQQ
 EHskPPz0tgYhctXYaexUJLSjTarIVjJtFkc/pAWnk1yrcKj7hwk3h30cjWXFNUSdU9Jy
 VZ93pRPFtnqFoujOpYAzFFb9wxe+cjvP6G7TqdPI65yjYDRl5ddZNlywNH/LkAclBMaz
 ZgbKw0JmiBd9WO4M4J6zvqxmS8jlT8Usc/TZC/arwx0OuFvZ7kTyO7wDt89lyLhNVlk8
 rF/yskor1OsiA8Xv2JrYf/79CLrg72XiVYWYiIsPFyVM5HFKcutOCN8nkz27xgm6OpkE
 vefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8vWcIHW+PPJHPRGK+q1n/MDukzT8xVr6X40GBd/+wk8=;
 b=I9PxB4+IOg/kZKFGcnUDkLaiSHEaCswEthIcWvEx2GLsZ3TsrMs6OvWSqbxbcxPhfo
 GXnnSlpkYhbmP3m/ox1KMPakzgnld5y8ga03MtkGRasiWF+fA+gBI5QVhpghn9gvDEOl
 DD6kUsDMDmVU5abzI9o49LALn5+EA2XJvOuVW1qn+AaDjMv5+4vYuT0Bbhv7SsDn5ljG
 vSyJ7HjmzuSwXdnPmcjBSzRlQLZTvmHJgZ590ZADGSoD8t4Ym0233b3au71yMJ+Ma/09
 O9R9vBofBep6iYXdtFrJpREaahs2ojjnm3SuYWcDHvB6jF2Poo0HnjZTGM/I5Pwx+4ZQ
 f3IQ==
X-Gm-Message-State: APjAAAWAnrjaxWwlpWDPsi5gC5xNTAJ0NsJWCdnv4CmzDIckiTdubkPO
 8TjyeKSRj1+Pqw/MgFfsCEw=
X-Google-Smtp-Source: APXvYqwXmOa4aYWqbwqs/spMZrlH2ouMvVvaQmfbSHUv8Qm1I02OFmcDTQNuq37jdk7bPlSM4OF3TA==
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr21473160lfm.120.1563459127937; 
 Thu, 18 Jul 2019 07:12:07 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 24sm5760909ljs.63.2019.07.18.07.12.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 07:12:07 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1563443655-15802-1-git-send-email-andrii.anisov@gmail.com>
 <abf62099-b848-b7ec-b665-52a2dce755b7@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <17c91de8-dbdb-7c56-08e4-a18b900783d3@gmail.com>
Date: Thu, 18 Jul 2019 17:12:05 +0300
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

SGVsbG8gSmFuLAoKT24gMTguMDcuMTkgMTQ6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEEgY29u
Y3JldGUgc2NlbmFyaW8gd2hlcmUgdXBkYXRlX3J1bnN0YXRlX2FyZWEoKSBhbmQgdmNwdV9ydW5z
dGF0ZV9jaGFuZ2UoKQo+IGNhbiBhY3R1YWxseSByYWNlIHdvdWxkIGJlIHZlcnkgd29ydGh3aGls
ZSB0byBwb2ludCBvdXQgaGVyZS4gSW4gcGFydGljdWxhcgo+IG9uIEFybSBJJ20gbm90ICh5ZXQ/
KSBzZWVpbmcgaG93IHRoaXMgY291bGQgaGFwcGVuLgoKVGhlIHNjZW5hcmlvIGlzIHF1aXRlIHRy
aXZpYWw6IHNvbWUgdmNwdSB1cHRkYXRpbmcgaXRzIHJ1bnN0YXRlIHZhbHVlcyAoZS5nLiBjb250
ZXh0IHN3aXRjaGluZykgd2hpbGUgdGhvc2UgdmFsdWVzIGFyZSBiZWluZyByZWFkIGJ5IGEgZ3Vl
c3QgdXNpbmcgb3RoZXIgdmNwdS4KCj4gQ29uc2lkZXJpbmcgdGhlIHZhbHVlIG9mIFhFTl9SVU5T
VEFURV9VUERBVEUgaXQgbXVzdCBiZSBhIHJhdGhlciByYXJlIHJhY2UKPiBhbnl3YXksIEkgd291
bGQgZ3Vlc3MuCgpJJ20gbm90IHN1cmUgaG93IGRvIHlvdSBsaW5rIHRoZSB2YWx1ZSBvZiBYRU5f
UlVOU1RBVEVfVVBEQVRFIGFuZCB0aGUgaXNzdWUgb2NjdXJyZW5jZSByYXRlLiBDb3VsZCB5b3Ug
cGxlYXNlIHByb3ZpZGUgbW9yZSBkZXRhaWxzIGFib3V0IHRoZSBpZGVhPwoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
