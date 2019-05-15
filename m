Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23A1F6CD
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 16:43:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQv5V-0002sZ-Ja; Wed, 15 May 2019 14:40:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OzW7=TP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hQv5U-0002sU-53
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 14:40:56 +0000
X-Inumbo-ID: 7175758e-771f-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7175758e-771f-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 14:40:55 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id m20so49155lji.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 07:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=DZTjTQ7Crr8EKEMhDDaJp7XtkKQktI2rt1kO2366V0c=;
 b=srZUTWfMqYUQ4lxi+QZ+xnPVKJltgr4o2wUxLfBE8dT6s58bxne3FW0oyMeOth3azb
 xiZmuH0mME4zYVMFPKyQMOVnznDInRCkWKGOza/BYxRClGWAVjrO2yvftRyCCVl1siE7
 3cRAxuKZuXOS+bZpgRE91l7ct5GVf+tmqQwjSCty7+cg4dA3746PHKXanpYEN9xvD5yA
 0I4UQgTsA9BFdzamow2SFU64riJGdDan+MsNBF44UQXz4pbIE1tnAS53YF37HhhcuZ06
 /gKcGKM+BN4R3bLSALllGXp2fYeRwX4d35uZwlxJVzlVyJfMowmlXsQlSlaEIVqFI8DI
 PMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DZTjTQ7Crr8EKEMhDDaJp7XtkKQktI2rt1kO2366V0c=;
 b=J76mF2wDx9a0mh031Xqk+QnvuU249EtY+LAJ1vXPd2itmoNDVBDp9eAd+ADzSNhJbD
 wFMhO57aYR37gBSUykgcjHmT9VVkk40Rj5/wDD6KzIFi7Fyti/gTO8O4Yj/WPiy79UD9
 JGHy5YXgHxrlOE1X25HiASPZBdCVvl/Zz/4iJgYDoWifTo5urNJlWPBrhlPXoZHfiOPx
 WAf155ROiu3YEzWLwSbAlGKS0K0xzsaM5z2KbY8gbFjrOk9ApELlEpdfhDeoDItzIa98
 Icm2bTrn6teeoYH7+/VoXFdF/sHNU087VOkm1EJ/A7lkq4tAjL/Pt2GY6n6ZuwTU7KzZ
 yF7A==
X-Gm-Message-State: APjAAAV5nl611VIM7YUfLjFYPkQBDm7kakuyqCu2HRv5QLbVLTWj0Lc4
 Q16CWmYNsnAWHv7WwxV4yxw=
X-Google-Smtp-Source: APXvYqwUp/IfDJ1/MxtYaIc1vYvvqm94SyvunuYvuHBhvorBDXPHvIoNX1UvX4baB5BZO5vXvsBG/Q==
X-Received: by 2002:a2e:860a:: with SMTP id a10mr11225920lji.158.1557931253817; 
 Wed, 15 May 2019 07:40:53 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id r62sm383880lja.48.2019.05.15.07.40.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 07:40:52 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <437edfef-00bf-fc90-3bf5-af8fa851fa3a@gmail.com>
Date: Wed, 15 May 2019 17:40:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-3-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 03/10] xen: extend
 XEN_DOMCTL_memory_mapping to handle memory policy
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 JBeulich@suse.com, andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDAxLjA1LjE5IDAwOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6CgpIaSwgU3RlZmFu
bwo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2RvbWN0bC5jIGIveGVuL2NvbW1vbi9kb21jdGwu
Ywo+IGluZGV4IDE0MGY5NzkuLjlmNjJlYWQgMTAwNjQ0Cj4gLS0tIGEveGVuL2NvbW1vbi9kb21j
dGwuYwo+ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMKPiBAQCAtOTI4LDYgKzkyOCw3IEBAIGxv
bmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0
bCkKPiAgICAgICAgICAgdW5zaWduZWQgbG9uZyBtZm5fZW5kID0gbWZuICsgbnJfbWZucyAtIDE7
Cj4gICAgICAgICAgIGludCBhZGQgPSBvcC0+dS5tZW1vcnlfbWFwcGluZy5hZGRfbWFwcGluZzsK
PiAgICAgICAgICAgcDJtX3R5cGVfdCBwMm10Owo+ICsgICAgICAgIHVpbnQzMl90IG1lbW9yeV9w
b2xpY3kgPSBvcC0+dS5tZW1vcnlfbWFwcGluZy5tZW1vcnlfcG9saWN5Owo+ICAgCj4gICAgICAg
ICAgIHJldCA9IC1FSU5WQUw7Cj4gICAgICAgICAgIGlmICggbWZuX2VuZCA8IG1mbiB8fCAvKiB3
cmFwPyAqLwo+IEBAIC05NTgsOSArOTU5LDI3IEBAIGxvbmcgZG9fZG9tY3RsKFhFTl9HVUVTVF9I
QU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkKPiAgICAgICAgICAgaWYgKCBhZGQg
KQo+ICAgICAgICAgICB7Cj4gICAgICAgICAgICAgICBwcmludGsoWEVOTE9HX0dfREVCVUcKPiAt
ICAgICAgICAgICAgICAgICAgICJtZW1vcnlfbWFwOmFkZDogZG9tJWQgZ2ZuPSVseCBtZm49JWx4
IG5yPSVseFxuIiwKPiAtICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgZ2ZuLCBtZm4s
IG5yX21mbnMpOwo+ICsgICAgICAgICAgICAgICAgICAgIm1lbW9yeV9tYXA6YWRkOiBkb20lZCBn
Zm49JWx4IG1mbj0lbHggbnI9JWx4IGNhY2hlPSV1XG4iLAo+ICsgICAgICAgICAgICAgICAgICAg
ZC0+ZG9tYWluX2lkLCBnZm4sIG1mbiwgbnJfbWZucywgbWVtb3J5X3BvbGljeSk7Cj4gICAKPiAr
ICAgICAgICAgICAgc3dpdGNoICggbWVtb3J5X3BvbGljeSApCj4gKyAgICAgICAgICAgIHsKPiAr
I2lmZGVmIENPTkZJR19BUk0KPiArICAgICAgICAgICAgICAgIGNhc2UgTUVNT1JZX1BPTElDWV9B
Uk1fTUVNX1dCOgo+ICsgICAgICAgICAgICAgICAgICAgIHAybXQgPSBwMm1fbW1pb19kaXJlY3Rf
YzsKPiArICAgICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgICAgICAgICAgIGNhc2Ug
TUVNT1JZX1BPTElDWV9BUk1fREVWX25HUkU6Cj4gKyAgICAgICAgICAgICAgICAgICAgcDJtdCA9
IHAybV9tbWlvX2RpcmVjdF9kZXY7Cj4gKyAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyNl
bmRpZgo+ICsjaWZkZWYgQ09ORklHX1g4Ngo+ICsgICAgICAgICAgICAgICAgY2FzZSBNRU1PUllf
UE9MSUNZX1g4Nl9VQzoKPiArICAgICAgICAgICAgICAgICAgICBwMm10ID0gcDJtX21taW9fZGly
ZWN0Owo+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsjZW5kaWYKPiArICAgICAgICAg
ICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQ
OwoKSWYgSSBjb3JyZWN0bHkgdW5kZXJzdGFuZCB0aGUgY29kZSwgd2UgY2FuJ3QganVzdCByZXR1
cm4gYW4gZXJyb3IgaGVyZSAKKGRvbWN0bF9sb2NrIGlzIHRha2VuLCBldGMpLiBMb29rcyBsaWtl
IHdlIHNob3VsZCBzdG9yZSBhbiBlcnJvciBhbmQgCm1vZGlmeSBjb2RlIHRvIGV4ZWN1dGUgZXhp
dCBwYXJ0LgoKCi0tIApSZWdhcmRzLAoKT2xla3NhbmRyIFR5c2hjaGVua28KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
