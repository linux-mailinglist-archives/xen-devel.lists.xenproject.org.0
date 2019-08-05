Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5B813D9
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 10:02:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huXtI-0002iA-JS; Mon, 05 Aug 2019 07:58:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=153w=WB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1huXtH-0002i5-2V
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 07:58:47 +0000
X-Inumbo-ID: d92fe42f-b756-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d92fe42f-b756-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 07:58:45 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id b29so49927930lfq.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Aug 2019 00:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+KhnKeZQ2xAFBl0uIH2zL60lxn3VelQMBEHjPZNtoDI=;
 b=iK/rJ5ddBfEOkdNpkylpOLYBb4hOxnD2y4sUFlqMM9Kz1OKZ9jk9gLcIOO2f4Rkc8f
 klh1870XAgDLYaXws+305yMWK54h+Mse+IUufNxH9jZQkjUsG/1tbIMydveAWCUbpjj+
 k8h+lbxKsrHOWoMgSHNYXq7DD7l3Gqlr5eS02JRGIWHLXmkDM63tBHk5ClxJ/QtXHsgE
 Y5FqlXN/Knkb8pzAbu5vreqRLS0guQFZgltF9sj6eWOTWc3hEVTNyNjJ5eNxFobVVKI9
 xyzbIHp9LR413csXFyPtdZA/OwHkhCGOBsLp5DsgGp1plqME0qrOujp5YnJccUHZIY3v
 7csw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+KhnKeZQ2xAFBl0uIH2zL60lxn3VelQMBEHjPZNtoDI=;
 b=I+KyA/B2NmBO7oS0FToZgxTwSWTSjY12I95eCeKjL3L68fc4KIVehRe2SCg2mlf+Ym
 uusbPuEYUqBpLQ1DkFfaADlnBt4sqNRgY7bHVLJhfDxTMqkc1xTRPnb7wa5NBxMEyG65
 G9H6KXou3PvX66C4mrH/XBRmiYRV84w8/Fz9fyb4IwWPxWHuLtqllMifJM66vZBITR8d
 QKYifFdsctjZiXk2f1oIJzheRelNMj9XkDtLIFvZmMkMOwD7NCjKRdB440y6IFANqzjX
 /NbKuyCaV9FAZSpXphvYkEZifvk7lD/AjthLnLLurhiod3TRFm7Uc6PXo5YeBSa+CBct
 7TGg==
X-Gm-Message-State: APjAAAU0ShlVwrCaJdoRcQuC8DODM1HAWkFHs8Ej3Y/2eR6/duGc3GFF
 4p9xvuFeQv1JhXOMWgLWiVQ=
X-Google-Smtp-Source: APXvYqwEYgVPnPae+3EWvbaPip4EXfyLWXZlAkx1O0WRYLr5GbPSjVJ73vFdNB3isml9MTTcQW36FA==
X-Received: by 2002:a19:6557:: with SMTP id c23mr28295282lfj.12.1564991924533; 
 Mon, 05 Aug 2019 00:58:44 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id r17sm17216401ljc.85.2019.08.05.00.58.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 00:58:44 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
Message-ID: <bee1402c-cdd7-c8fc-c0a1-c19cd74f86bf@gmail.com>
Date: Mon, 5 Aug 2019 10:58:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 0/6] iommu/arm: Add Renesas IPMMU-VMSA
 support + Linux's iommu_fwspec
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvLCBhbGwuCgoKRm9yZ290IHRvIG1lbnRpb24gdGhhdCBhbiBhZGRpdGlvbmFsIHBhdGNo
IGZyb20gWGVuIHN0YWdpbmcgaXMgbmVlZGVkLCAKb3RoZXJ3aXNlIFhlbiBtYXkgY3Jhc2ggYXQg
dGhlIGVhcmx5IHN0YWdlOgplYWQ2YjlmNzgzNTVlOGQzNjZlMGM4MGM0YTczZmE3ZmJkNmQyNmNj
CiJ4ZW4vYXJtOiBjcHVlcnJhdGE6IEFsaWduIGEgdmlydHVhbCBhZGRyZXNzIGJlZm9yZSB1bm1h
cCIKCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
