Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FB8715CB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hprlj-0007YI-SJ; Tue, 23 Jul 2019 10:11:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h8hN=VU=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hprli-0007YD-J8
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:11:38 +0000
X-Inumbo-ID: 411c587d-ad32-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 411c587d-ad32-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 10:11:37 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id r15so11935086lfm.11
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2019 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sv6kEnmscaWciUlqfd4WbT5/vr2rsZz1Se+KE9K59lc=;
 b=ROffL7IRcZvzMBuBcjheI1tyCTQJnnXkCOOmFMOn4Pjo1InmI4x+GMbenE+xcD2W5c
 ZtOhY/wrG/+VPUAmgitsAzYcQw1YmQ/XCkw7rW8OfWbDAoRpEVjTuv7GnIVg10WgFE3d
 AYmWBr0Os7/M2YYfv7gCnq/WilvMVVOjVooNC3HcYvPDcCAdnu3jQShH86oxOYgRxLLF
 QIPIbyvkkDdlslNvs7cx9rNKC0wMo0NlPyofSOpcB+IXIF5b3IKtvKqXxT8HKpwa1Edy
 KCXNgOhHPFDkktmxvwdjVqfwhsVyB00V/k+jIsDqNxOCXlQP3Zehgs2lWRqZoYiMj9xk
 Ceow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sv6kEnmscaWciUlqfd4WbT5/vr2rsZz1Se+KE9K59lc=;
 b=IddDRLzJBlX/0rO4C+uR2xi6WLo5CkF7ThFbIL0QsiV9kl8vaxiGxHgjruyplYOe0Q
 9LYfskcLrUuLB8cbRA4nKNHtz7tbMTZuWZF8eoWmdx4XQV0/7xznHIsyUhPpl3ubSQMK
 8YpjNAUMpJC05dUk2E2TNX4eGmCADKs/PMgfFeRDBzlSjlPOUNwTz5HRp7nRwJ6ugC6n
 SFSZTh5FTeoHMoxO6s85fJO6GZMyvnGjHXQLsVZtxC6zQeTKWCS6VK5kHRoMfzeu73ar
 EtmfOlaVyLKLtiVuQ7o93X0f5wuxK1oJCov8uKsjtkvaEUsIl2lkcqM/rYneEPi9geXp
 nJqQ==
X-Gm-Message-State: APjAAAUI/wORrl5nfqCDXUVL7sXWws3jrb+2Z08dCus3/9F/JIPZXkUZ
 3wCpZD+t+4ZdALfVxWqS+2M=
X-Google-Smtp-Source: APXvYqw4Ou1p2el20BEu47TtMwgBIpdODrr+Qt3u9wWgtL6jxcd08db3Mi6/GiMzLf4HEwUcyvugfg==
X-Received: by 2002:a19:6557:: with SMTP id c23mr20957238lfj.12.1563876695817; 
 Tue, 23 Jul 2019 03:11:35 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t21sm6390500lfd.85.2019.07.23.03.11.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 03:11:34 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
 <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
 <a4877031-1abd-e683-aae9-5d8ce5df98b5@suse.com>
 <7ddef8b7-ec79-d7ce-4123-31ae63a5e7b3@arm.com>
 <35df7b4d-068d-15d3-2197-d5a6dee23917@suse.com>
 <6e608435-a414-320b-307a-a413c82cf9aa@arm.com>
 <a3b0d7ed-db9d-9c03-9fef-1b42b02b3f4b@gmail.com>
 <039019e1-ac02-019f-9ce1-78ed64198d5e@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d43b6a38-e9aa-3802-c30b-0d4f4d61f98d@gmail.com>
Date: Tue, 23 Jul 2019 13:11:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <039019e1-ac02-019f-9ce1-78ed64198d5e@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMjMuMDcuMTkgMTI6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEJleW9u
ZCB0aGF0IEkgY29udGludWUgdG8gYmUgb2YgdGhlIG9waW5pb24gdGhhdCBpdCBzaG91bGQgYmUK
PiBhbGwtb3Itbm90aGluZzogQW55IHBvaW50ZXIgcG9pbnRpbmcgYW55d2hlcmUgYXQgb3IgaW5z
aWRlIHRoZQo+IHJlZ2lvbiBzaG91bGQgYmUgYWNjZXB0ZWQsIG9yIGp1c3QgdGhlIG9uZSBwb2lu
dGluZyBwcmVjaXNlbHkgYXQKPiB0aGUgc3RhcnQuCgpJdCdzIHJlYXNvbmFibGUgZW5vdWdoIGFu
ZCBJIGFncmVlIHdpdGggdGhhdC4KU29ycnkgZm9yIG1pc3NpbmcgdGhpcyBwb2ludC4KCi0tIApT
aW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
