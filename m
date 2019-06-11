Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0553D20B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:18:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajRE-0001Xe-MY; Tue, 11 Jun 2019 16:15:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/Vbh=UK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hajRD-0001XT-8n
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:15:55 +0000
X-Inumbo-ID: 2fc34478-8c64-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2fc34478-8c64-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:15:54 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id i21so12249698ljj.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=0vqxCW7MtYFxvhlBfMVY9GSPZLNpLhLUZtghTl3vEMI=;
 b=Red/EvXr/M/xl8BgK/0WghDcc1yMQfJwxYWpxtbUOdRgQycRSVJ+Wq0MGcb8YecNbZ
 WO4Zp3dcntl8PJqsstjcp3hz+msAU9O+RU0wK3+FNDIPKm7y3fVejCV6EAuObGpZK4hF
 mrf7cdfBXO+vXlNaByWp5vIYBpSZAqeOVL/ofBbAzbX7hv2ZSvbIzYBMIqweWPt3pcGj
 c7afbJ+7T2fNfF4wIJPJa+09OxRFryO1HOVP4H3Kcxc95bbWoEX/Cn5Hpz4GtUB7eVcX
 4IiJO2i7EjWd8zFtip023SE4+G+Q13JprrmwSW/dQM3WN6hc5Ni8ypnjjKeDSRjFyA0p
 4D6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=0vqxCW7MtYFxvhlBfMVY9GSPZLNpLhLUZtghTl3vEMI=;
 b=YgWX8P04XuDh6xWEl49G+qWfHNgYhBIpkx4cBhW/PcDI8RyFHGiB3NGL/Rpu2auMht
 rDdNE46fj8cPlK16+Nv6LFarP+slBNkMR9LYTqoerssj/siWVL46zIWqNtmY/3pWkSib
 apxFRWdIZuuePPgJ00fU4zAHMrnUbfjdlPjJ5Ajce7k2nuHgoNkA3vW+zfeKwiS6rBkO
 VrNhFt9f67WgYHroL77TFSUzxnzBobcI9a7FammyCg3ZZDoJ0wIKeGWPkdtrZE7TmNZ0
 dTyMaxolUwbBhHn+ETeUUPLJDggvC0vid+k3SOunMJ0QTDhJ+2efVxvrsucS36GHso7n
 qNTQ==
X-Gm-Message-State: APjAAAVJlDEBiVDIo5XZVbfo5pCu2vTb1lTbBs9UuDkc+Hxhb4WI4OoP
 0ep1TwaNFye7n6R6xcnXvCw=
X-Google-Smtp-Source: APXvYqwALicDmwry64+9OE4cNiuVpxpfxCCPf5B6uKKA6NlcXJLYjE9fyW7WKIEoXvoRQ/zQA8FpNg==
X-Received: by 2002:a2e:9ac4:: with SMTP id p4mr25563264ljj.185.1560269753234; 
 Tue, 11 Jun 2019 09:15:53 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id x19sm2712290ljb.6.2019.06.11.09.15.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 09:15:52 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-3-git-send-email-olekstysh@gmail.com>
 <a35d398b-d2e9-9c80-8ac2-923a82c68019@arm.com>
 <fbb40b64-c23b-be02-2c56-f0e0bf47324b@gmail.com>
 <c84036fb-27c9-8fb1-ec3b-f43a8e66515f@arm.com>
 <cb9dca07-8b44-e644-2383-e37f8c12aa57@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bfefcd4f-4c70-82f9-5b53-88390ea4c1de@gmail.com>
Date: Tue, 11 Jun 2019 19:15:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <cb9dca07-8b44-e644-2383-e37f8c12aa57@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, nd@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDEwLjA2LjE5IDIyOjQ1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSBKdWxpZW4K
Cgo+IE5vdyBhcHBsaWVkIHRvIG15IHN0YWdpbmcgYnJhbmNoLiBJdCB3aWxsIGJlIGNvbW1pdHRl
ZCB0b25pZ2h0Lgo+Cj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2hlcy4KClRoYW5rIHlvdSBmb3Ig
dGhlIHJldmlldy4KCgo+Cj4KPiBDaGVlcnMsCj4KLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlz
aGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
