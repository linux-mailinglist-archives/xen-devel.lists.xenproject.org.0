Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9203A338696
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 08:32:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96858.183680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcHq-0004v1-4h; Fri, 12 Mar 2021 07:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96858.183680; Fri, 12 Mar 2021 07:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKcHq-0004uc-1B; Fri, 12 Mar 2021 07:32:42 +0000
Received: by outflank-mailman (input) for mailman id 96858;
 Fri, 12 Mar 2021 07:32:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oflA=IK=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1lKcHp-0004uW-3i
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 07:32:41 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a46377ee-2f46-4b33-b10e-6276af17b8ef;
 Fri, 12 Mar 2021 07:32:40 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id l19so3174561wmh.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Mar 2021 23:32:40 -0800 (PST)
Received: from ?IPv6:2a00:23c5:5785:9a01:d41c:67e5:a11f:43fe?
 ([2a00:23c5:5785:9a01:d41c:67e5:a11f:43fe])
 by smtp.gmail.com with ESMTPSA id s18sm7584487wrr.27.2021.03.11.23.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 23:32:39 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: a46377ee-2f46-4b33-b10e-6276af17b8ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2vLlMPsBQyKsFoewMMaHWk8ZTsxgQH5oRVh2R46t72I=;
        b=eRvxO3OGAh8x8s+TynQ7Qqc3QtYDI2+D5HRMO+W6qXwkTWKvw4ZHRjJq3w3HNt79s3
         wK/B+6YiYJCSK/Ymqr49GsKrHXzrZa9HN5cmiaDP0jhbiaL1B4nReFSpiV3xL9qdVDEt
         +f/Zx0V12aKrSKs50Bxr4PS9za2RyfMnPF521YbpTkB49TKwp+MB5JSZVxkZ6WDslpeC
         uwCBLjeZDyPyTiObbs6tFqTaJT5iykEOoP/f9cQUKfkCAvV3iw5yMnjGDc+NObpR6Z4S
         1BOkc+0kho1n01vhzcoXnJo3DUzf7q+TtDRRduA23Sn8VySUh2nBZw1k/kYW9ddJxaEG
         j78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=2vLlMPsBQyKsFoewMMaHWk8ZTsxgQH5oRVh2R46t72I=;
        b=bi7EGP4dzX3fdRm78VIHo9Cz134peI1D5Wi/870hDMuljn8UBSeLHxODZs/FF0E7Xl
         Abjj5O41GC2E+gHC93qBV84pdsyEdWY5VVI9RkNwm3bxPJxgHuHoQAKhie513FqoAuDK
         vpZ8lImiaO31sOPjJMaMmx805axaDr+hPrn9BE5kUmxfk/z811poyKLEBMzR27PutOM+
         +OI+z+2uphzUWljswRTyfokl8JnL33p39W0OosYSpnT9E46VS1416kq5qrh2tJm+UWoc
         dkQ9iB4yOWn6xgP3WS1Hd957i+s3KgEENT7i7FlkpzbXU3361Om8L4Ynd8WDoXf+X6f8
         Xs6Q==
X-Gm-Message-State: AOAM532sjqqI7gJbF9SPqEp8zgdkVWZ1hU6EBcYKuS27FajUUVixC27E
	iCYwew3mMLK9F8OMzGva8rmoJ8HvP4o=
X-Google-Smtp-Source: ABdhPJzU96plijb1/pNdMD1WsWX8VrvNK0AR4kCLhxXPrq8Xm20pf8hcvX6ZNj/+TL4Vzt3y7TBaCg==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr11452642wma.43.1615534359651;
        Thu, 11 Mar 2021 23:32:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
To: ChiaHao Hsu <andyhsu@amazon.com>, netdev@vger.kernel.org
Cc: wei.liu@kernel.org, davem@davemloft.net, kuba@kernel.org,
 xen-devel@lists.xenproject.org
References: <20210311225944.24198-1-andyhsu@amazon.com>
Message-ID: <bb75476f-881a-bb6b-e368-0bf7044cd57e@xen.org>
Date: Fri, 12 Mar 2021 07:32:38 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311225944.24198-1-andyhsu@amazon.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/03/2021 22:59, ChiaHao Hsu wrote:
> In order to support live migration of guests between kernels
> that do and do not support 'feature-ctrl-ring', we add a
> module parameter that allows the feature to be disabled
> at run time, instead of using hardcode value.
> The default value is enable.
> 
> Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>

Reviewed-by: Paul Durrant <paul@xen.org>

