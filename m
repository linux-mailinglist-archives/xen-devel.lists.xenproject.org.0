Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8281A03F
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 17:32:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP7Sy-0008R8-B1; Fri, 10 May 2019 15:29:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=65qy=TK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hP7Sx-0008R3-8F
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 15:29:43 +0000
X-Inumbo-ID: 6e3f40ac-7338-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e3f40ac-7338-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 15:29:42 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id r76so5420867lja.12
 for <xen-devel@lists.xenproject.org>; Fri, 10 May 2019 08:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Zbln/H27ETFPD+H0RVGhtkijYrHocGwoAVCdzGgRu9Y=;
 b=PiwMCTRF6Weq+Hqoyg7Xjsg99eYbAziOTmEAF8Oh1FLoAKhFxUCIDBmWxfHU+GY6ZR
 9jEiz6oMnSEwS0Y7KfjZ+17PqlgBX3rYKmMMV7LkoKuVX6UtAsa9ORgg6nsUHCh8+ggu
 zBJKo6H6pH8O6MWYrzUXmrMG/TQb1HftZKOd8aUSJRU/iN+UKMEi0ImVldofKzfvkZSw
 QIbzhhsGjbfvHUgaQR6KbfTQK1jirY/KkB0P1TdXY0QB40xwV7d7Zk56h6SxE2LUs3In
 doK5GjYpExq+r0PbYmXMKwvYaGdHb7DThIeik27yESVa9pmHlrgSkGPu0SVrp5IoP82V
 WQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Zbln/H27ETFPD+H0RVGhtkijYrHocGwoAVCdzGgRu9Y=;
 b=RIoVMSNWS4T9FPx1OAri8ZpEheD4bmJ3Fj9rWgZJicC7rCojVLr73Lt2RsFvj/hSpD
 Za+oYFVJIiba1K8ZzpGlojNHJ2aTnxW0GKnHG9HgRVn2YpXeV8gPvR37yOgeZB3Yw0ov
 WcpnTCTvGUbYeZXvJtRsCp2Td+88yPj1+RinJ67iCoPAHCkRO49XKkCUI0zK7nC4p+d8
 lQkLrNqs9U6TUCDCViNHDkB7b60LcLnHNOwmnT0EWIgECVVgCanzXJ0oQTl0qN2D6SoQ
 H81QGpgOsElAbayEOYaw4DA9CCVt07RrnGbiSgEgB/AtOT5znR9y8uu9myJQlTmq/G4J
 TxQw==
X-Gm-Message-State: APjAAAU9XoFtxKVbHiob9qg0ChLkroh1KhfhiBEIPHpobkA7YsF790Bo
 wgX7xStMHHo9eJ2asoyHHo0=
X-Google-Smtp-Source: APXvYqwLt13uLWO3feVHkeL9aVY1eeg3nz5DKRIwbAdyVCW07HjC45ljZ+W8feBiJYCC6HbahacwuQ==
X-Received: by 2002:a2e:8098:: with SMTP id i24mr6237306ljg.88.1557502181188; 
 Fri, 10 May 2019 08:29:41 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id y3sm1462170lfh.12.2019.05.10.08.29.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 08:29:40 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
Message-ID: <1a6c10cd-0d85-9db9-1f98-602fefb40db8@gmail.com>
Date: Fri, 10 May 2019 18:29:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] Add ability to handle nodes with
 interrupts-extended property
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
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhlbGxvLCBhbGwKCgpnZW50bGUgcmVtaW5kZXIuLi4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5k
ciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
