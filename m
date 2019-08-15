Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1713C8EC8F
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2019 15:18:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyFak-0007Ze-8w; Thu, 15 Aug 2019 13:14:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sCuO=WL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hyFai-0007ZZ-LJ
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 13:14:56 +0000
X-Inumbo-ID: ac7baa2e-bf5e-11e9-8524-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac7baa2e-bf5e-11e9-8524-bc764e2007e4;
 Thu, 15 Aug 2019 13:14:56 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r9so2192606ljg.5
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2019 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0CJ+nZvjWa5opSUwY0JBeVv+WvBO5vTzM+SKAVRWkSM=;
 b=FUbbKmf5C1hF1Jjqw3sZCDoBVsIKgitgFtt9sAGsVbSH7QE/jpCGQ01dlBsxZANRM2
 ErEGjkW0b/k0Lt2/0UOGCs1NRIcM0wBEyWP/AGixmPWbs4QxEf3AQasJ6beHCmYJtxsC
 vI+5cxtW/MiNOgw5iQRWbRtTtTC9OrAXrCoTi7lCSLW1OJSW04SLUkg4B0A0q9kr+jys
 Vg1tcE206YC9Csq9TVmBTGknswfnueLqO+ysT7VSLrHp9Zq2XuK012HxI5JZbF/7xJ7U
 iBnLrLZI/VtBQQZ5BXIkXiVV/9SnmU+6BFsaCjpLxnhd+I4qkHNAt8oTl0tTqRidDaqR
 If4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0CJ+nZvjWa5opSUwY0JBeVv+WvBO5vTzM+SKAVRWkSM=;
 b=WvXZ24YzufOR52cBbVBYjgo5v+ChuBIJFhZJYIxnBQKHEFD/6lqg9z4EnuiIHWxvZ/
 g+vgEtVPbZTrPHOm8gOaJKr3P6UALhKsThu2Qf0FKBUvcCvffn9Y3yJqSudlrpV+Xb6S
 MCI7VIHEePRMm/YYzlMW9lbpEIV8kqNeGAxuRmqaYZ58yDzxFNqxBZGYEJ+vEyAchCgY
 xhuJoDlklbFkj8jIxgmSQYMgR7sIZbdv4bVpBK3HswpMCPzIqTf24woSCZPIuiO1HZbB
 6c1PNu7thfwK21Nr+3t8Uc5qNwAwNSV3emZF+I/coiRbbIaXXzAkjD9mtW8+AJHVxuCI
 cEyg==
X-Gm-Message-State: APjAAAVcuS8s0DVXwGwx6DG+4FboCcPC3sLi80PpS70Rv0v3+0+LSJLL
 qB/3HKHW2uss2YokUSSsKNI=
X-Google-Smtp-Source: APXvYqyebMIl2AV1EgTNA4/zEsMrM3UiDe9rIbhAV0UZKSmcxwTDcmxcP9q16Pop8AQCeqTWzgnsZA==
X-Received: by 2002:a2e:b0cf:: with SMTP id g15mr2608087ljl.237.1565874894888; 
 Thu, 15 Aug 2019 06:14:54 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id d2sm474748ljc.15.2019.08.15.06.14.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Aug 2019 06:14:54 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-3-git-send-email-olekstysh@gmail.com>
 <3c6d54f2-06ad-6bd1-447b-0e4cbef3d391@arm.com>
 <8626bea6-cec3-128a-3b7a-b4c1542a659a@gmail.com>
 <7101e744-784b-9b89-3a90-e748ff03a02d@arm.com>
 <6119cff5-b39a-3782-18d9-f6e51c57ac37@gmail.com>
 <74e0b656-a6a1-d0c6-3cb2-e32d552d42c8@arm.com>
 <alpine.DEB.2.21.1908141208300.8737@sstabellini-ThinkPad-T480s>
 <becf5395-56cd-ccc6-4931-0e3854532ac8@arm.com>
 <44ba5fba-48c3-f352-510c-fc0d8ada181a@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b8a98f17-4f10-8a2d-2223-7bfd520e7a77@gmail.com>
Date: Thu, 15 Aug 2019 16:14:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <44ba5fba-48c3-f352-510c-fc0d8ada181a@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 2/6] iommu/arm: Add ability to handle
 deferred probing request
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
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDE1LjA4LjE5IDE1OjU0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+IEkgbm90aWNlZCB0aGVyZSB3YXMgYWxyZWFkeSBhIHBhbmljKCkgaW4gaW9tbXVfc2V0dXAo
KSBqdXN0IGluIGNhc2UgdGhlIHVzZXIKPiBmb3JjZSB0aGUgdXNlIG9mIElPTU1VIGJ1dCB0aGV5
IHdlcmUgbm90IGluaXRpYWxpemVkLiBJIHdhcyBoYWxmLXRlbXB0ZWQgdG8gc2V0Cj4gaW9tbXVf
Zm9yY2UgdG8gdHJ1ZSBmb3IgQXJtLCBidXQgSSB0aGluayB0aGlzIGlzIGEgZGlmZmVyZW50IGlz
c3VlLgo+Cj4gU28gaGVyZSBteSB0YWtlIChub3QgdGVzdGVkIG5vciBjb21waWxlZCkuCgpUaGFu
ayB5b3UuIEkgd2lsbCBjaGVjayBpdCBhbmQgY29tZSBiYWNrIHdpdGggcmVzdWx0cy4KCgo+Cj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9zZXR1cC5jIGIveGVuL2FyY2gvYXJtL3NldHVwLmMK
PiBpbmRleCAyYzVkMTM3MmMwLi44Zjk0ZjYxOGIwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL3NldHVwLmMKPiBAQCAtNzU1LDYgKzc1NSw3
IEBAIHZvaWQgX19pbml0IHN0YXJ0X3hlbih1bnNpZ25lZCBsb25nIGJvb3RfcGh5c19vZmZzZXQs
Cj4gICAgICAgICAgIC5tYXhfZ3JhbnRfZnJhbWVzID0gZ250dGFiX2RvbTBfZnJhbWVzKCksCj4g
ICAgICAgICAgIC5tYXhfbWFwdHJhY2tfZnJhbWVzID0gb3B0X21heF9tYXB0cmFja19mcmFtZXMs
Cj4gICAgICAgfTsKPiArICAgIGludCByYzsKPiAgIAo+ICAgICAgIGRjYWNoZV9saW5lX2J5dGVz
ID0gcmVhZF9kY2FjaGVfbGluZV9ieXRlcygpOwo+ICAgCj4gQEAgLTg5MCw3ICs4OTEsOSBAQCB2
b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+ICAg
Cj4gICAgICAgc2V0dXBfdmlydF9wYWdpbmcoKTsKPiAgIAo+IC0gICAgaW9tbXVfc2V0dXAoKTsK
PiArICAgIHJjID0gaW9tbXVfc2V0dXAoKTsKPiArICAgIGlmICggIWlvbW11X2VuYWJsZWQgJiYg
cmMgIT0gLUVOT0RFViApCj4gKyAgICAgICAgcGFuaWMoIkNvdWxkbid0IGNvbmZpZ3VyZSBjb3Jy
ZWN0bHkgYWxsIHRoZSBJT01NVXMuIik7Cj4gICAKPiAgICAgICBkb19pbml0Y2FsbHMoKTsKPiAg
IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4gaW5kZXggMjEzNTIzMzczNi4uZjIx
OWRlOWFjMyAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vaW9tbXUu
Ywo+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5jCj4gQEAgLTUxLDYg
KzUxLDE0IEBAIGludCBfX2luaXQgaW9tbXVfaGFyZHdhcmVfc2V0dXAodm9pZCkKPiAgICAgICAg
ICAgcmMgPSBkZXZpY2VfaW5pdChucCwgREVWSUNFX0lPTU1VLCBOVUxMKTsKPiAgICAgICAgICAg
aWYgKCAhcmMgKQo+ICAgICAgICAgICAgICAgbnVtX2lvbW11cysrOwo+ICsgICAgICAgIC8qCj4g
KyAgICAgICAgICogSWdub3JlIHRoZSBmb2xsb3dpbmcgZXJyb3IgY29kZXM6Cj4gKyAgICAgICAg
ICogICAtIEVCQURGOiBJbmRpY2F0ZSB0aGUgY3VycmVudCBub3QgaXMgbm90IGFuIElPTU1VCj4g
KyAgICAgICAgICogICAtIEVOT0RFVjogVGhlIElPTU1VIGlzIG5vdCBwcmVzZW50IG9yIGNhbm5v
dCBiZSB1c2VkIGJ5Cj4gKyAgICAgICAgICogICAgIFhlbi4KPiArICAgICAgICAgKi8KPiArICAg
ICAgICBlbHNlIGlmICggcmMgIT0gLUVCQURGICYmIHJjICE9IC1FTk9ERVYgKQo+ICsgICAgICAg
ICAgICByZXR1cm4gcmM7Cj4gICAgICAgfQo+ICAgCj4gICAgICAgcmV0dXJuICggbnVtX2lvbW11
cyA+IDAgKSA/IDAgOiAtRU5PREVWOwo+Cj4KPgo+Cj4+IENoZWVycywKPj4KLS0gClJlZ2FyZHMs
CgpPbGVrc2FuZHIgVHlzaGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
