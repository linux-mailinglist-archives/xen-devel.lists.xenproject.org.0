Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C93209B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 16:32:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRHO7-0005RG-Vf; Thu, 16 May 2019 14:29:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N6Wg=TQ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hRHO5-0005Qo-B9
 for xen-devel@lists.xen.org; Thu, 16 May 2019 14:29:37 +0000
X-Inumbo-ID: 071b9ec0-77e7-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 071b9ec0-77e7-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 14:29:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id n22so2781723lfe.12
 for <xen-devel@lists.xen.org>; Thu, 16 May 2019 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cVLZWjTTQBov11ycRvzQJUg9jbZn5eRMzjNU12BBo8g=;
 b=swRqQYQauN0nxiSpmwlNWzVUK5ngRdzz8yk6LFBlQ9SfXJRWxqzB0unZB87rsuuYqP
 VofKS/IWdYjcdO1KmrGRdAxti5QMipaVj6b4Qs1dx/pz5pASmlAQtC3yOWatBDHroslW
 kcGCOED/jWnl788JoJL7fUhqu7DYb1wnQYYxRXNpgyKH4yFfqce4aAGGckzS7oQb8dCx
 mVWh35hTAOEKnFN2AgU9+ayWNhleJKgwHcFBIbpamv6bsbvWnAWWaJUM2hRXP+bDMoiz
 lKOqPTEflN1gGEI3ULfIgJ0AAnyEgxVY5FyDkaFPgWPVjSSr8g0ikElvNqjR74tlg7UM
 d3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cVLZWjTTQBov11ycRvzQJUg9jbZn5eRMzjNU12BBo8g=;
 b=bJ4HEl0ZFZnEUrDfzIha1jQcVTO3N9Ftgz+RneL6H6p1aIjAciMfLpnxu9RqK1DZSt
 WqB65gh1jwpVR4i/7JoJ3OBqChuB0hjvUv7a09fGWH2OlvI/xjHpBwQTlV+ljqO+UAUr
 68AMfYHTk0f9+BcYSPMGXNSdiwXRTxxHUYb6DbYd/ptxKXAjQ7umCAKcYdt12JngCBEV
 tzy2/L0zdqU9/O1xpZOQxqN02wSm/eDJOSzpq88NNIMdKq2x9kYRrEEKCDa/ecuTSQf9
 qkelikCFFMEEaA0QnT8KFdwSf7t1XEBvUuGhHD6ha45eqVy0otxmEYnFwmqyuJMh9nXW
 oiVQ==
X-Gm-Message-State: APjAAAXgZN35f84rw1WIffCYEk61pCuLZTAVJEKiLmv4THaDupBrzHZ8
 VXPOxcY6DkOtv7ZF+1b64CA=
X-Google-Smtp-Source: APXvYqzBJPqjlsuWN0iFCAXNv3pwjZe2vAhyCP5EtI0WWacOjm6tdTZWl7WeETxO95SJfOAg5Xrw7A==
X-Received: by 2002:a19:c517:: with SMTP id w23mr8069708lfe.73.1558016974686; 
 Thu, 16 May 2019 07:29:34 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 x21sm923539ljj.43.2019.05.16.07.29.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 07:29:33 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
 <80187476-c972-7d88-d6f7-09c04d96705e@gmail.com>
 <4912f9e5-860a-04ce-92bc-99e1abe700a1@arm.com>
 <0095c6f0-531c-3794-991e-662a9a1283be@gmail.com>
 <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f2180e29-2e12-ad57-da03-97f48ed592e8@gmail.com>
Date: Thu, 16 May 2019 17:29:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <837c80dd-4033-a54e-d700-454df167e2d0@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi4wNS4xOSAxNzoyOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdlbGwsIGlmIHlvdSBm
YWlsIHRoZSBjaGVjayB0aGVuIGl0IG1lYW5zIHNvbWVvbmUgd2FzIG1vZGlmeWluZyBpdCBiZWhp
bmQgeW91ciBiYWNrLiBUaGF0IHNvbWVvbmUgY291bGQgdXBkYXRlIHRoZSBydW5zdGF0ZSB3aXRo
IHRoZSBuZXcgaW5mb3JtYXRpb24gb25jZSBpdCBpcyBtb2RpZmllZC4gU28gSSBjYW4ndCBzZWUg
aXNzdWUgd2l0aCBub3QgdXBkYXRpbmcgdGhlIHJ1bnN0YXRlIGluIHRoZSBjb250ZXh0IHN3aXRj
aC4KClRoYXQncyBmYWlyIGVub3VnaC4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
