Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA947E0216
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 12:30:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMrNj-0005d9-Oq; Tue, 22 Oct 2019 10:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cFHx=YP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iMrNi-0005d4-4q
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 10:27:14 +0000
X-Inumbo-ID: 828fcd52-f4b6-11e9-bbab-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 828fcd52-f4b6-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 10:27:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so16590195ljj.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Oct 2019 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=4o+heNMiJOfO5cF0wrC1dFxA1elS+kHdqD7CL+AsAck=;
 b=Z0HaZeZZowAcr2IToAl0WqWzPFUtTXAEoZiY0AOc8t9FdpvXVtp3cOxskFqZvrZC/8
 ++w4WvgGbFioarMCJiMQLqtJrVQNSVUnAa6sJjVRyF6Dvp/06mb/GHkM9jCFtUdfz1v2
 NqQuzIkw6N9cUerfTV7eK0+otkkhpjsRl8DGgbi+JZtwTbrsinJDDiaq6yI0YPG6Dc8A
 EOT4o0WtsGn4/r0/bnpndxQS432ADgHkOFB5hVgINSKRf6lGYoAWxPPDhh3MojxbhEC6
 dNqHCRTSMF7KzSQ/8NMX1xBFWPer4554Rsi8Xa8CQAbn5gFs3U+Du/biPQ4z2LXE0n/C
 42Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=4o+heNMiJOfO5cF0wrC1dFxA1elS+kHdqD7CL+AsAck=;
 b=koAhyyQUCokCQ59Nj5EPPFKEeCPkNA93d8z9OJTU4zp1SKATe3shuTvtAFyxFvhpo9
 aEWW4QIfjsRvbUAUeDvu4sorLsmtD033Vjxz20ZQRAjdBP7UcwuRLlXM2OKOI/896AYD
 49W3eS8mAwcxu5J9fxZJmw6iUU7HdBUyjdFV6e+wG3OX0VycSeEO7p6YY1TKSrZYyV4e
 m05bsMbpTa3TrRuDM+B2r3UDSJGPnV6rEVevPgUBMqwT1qLxikJQh9DA+HYyvY33Ugsu
 4G9gp6lPHLWDySRhBpZwsutO/8GxF2vqVLwDN3u/AT3zsX9Cc4xyTr4ysn5UaA5Pp6lh
 w81w==
X-Gm-Message-State: APjAAAX9o/hN/u0z7GAgkrWMj9WMq6I2n4z8jRteYuPKUEFfh56emgD9
 HgnJ40Pp7U/3RstN45Mjrsw=
X-Google-Smtp-Source: APXvYqx4J4+xW4wxI/dtiq1KduiqK1LVhHHOWI46Xp5/CtB53kT7safMEJpePQkqWb2TjSnxa7EaSw==
X-Received: by 2002:a2e:97ca:: with SMTP id m10mr18027161ljj.195.1571740031799; 
 Tue, 22 Oct 2019 03:27:11 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id u8sm11354672lfb.36.2019.10.22.03.27.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 03:27:11 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
References: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
Message-ID: <ae58dcda-4ac0-f1c6-2984-ec0302dc5961@gmail.com>
Date: Tue, 22 Oct 2019 13:27:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571220487-6582-1-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] xen/arm: domain_build: Don't
 expose IOMMU specific properties to hwdom
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
Cc: jgross@suse.com, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 julien.grall@arm.com, sstabellini@kernel.org, volodymyr_babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIGFsbAoKCkdlbnRsZSByZW1pbmRlci4uLgoKLS0gClJlZ2FyZHMsCgpPbGVrc2FuZHIgVHlz
aGNoZW5rbwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
