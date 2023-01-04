Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1952665D72B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 16:19:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471263.731052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Y4-0006gX-KH; Wed, 04 Jan 2023 15:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471263.731052; Wed, 04 Jan 2023 15:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD5Y4-0006dQ-Gr; Wed, 04 Jan 2023 15:19:24 +0000
Received: by outflank-mailman (input) for mailman id 471263;
 Wed, 04 Jan 2023 15:19:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G5yt=5B=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pD5Y3-0006bu-Oi
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 15:19:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a278203-8c43-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 16:19:21 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id ja17so25823465wmb.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Jan 2023 07:19:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c35c900b003d6b71c0c92sm69512254wmq.45.2023.01.04.07.19.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 07:19:21 -0800 (PST)
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
X-Inumbo-ID: 2a278203-8c43-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kPTejbbi0VjrwZB3qm0I8/+jmgejs37VoikSC1jaUtQ=;
        b=AhDzPHiSag5hRqrsTQN2J0vuhBPs6nWR14Nx5/y7Eg0iKnIDoPZPGkD9b4OwiPoR9u
         wS9wgHnq7Ei4czHMLFTstFMhCH94/k12Ehtc4wRjzriD1k8WsGRQyUCzc9gTaImXQNhg
         qqwLwDiOkCUBdgQqahpfsNY3lfYZgilLFDbpu6SFuL6zxpz8oBVLVMJmVO5lg5HEE2Hi
         Ia9CuCDCBhGADcfj6+Qjr7uK7SoThYMhM1JnGu6XtSq0Bw/hj8L7MbItaxiQLEynibq4
         koSFvychnjqJrUvLRBcE+yuFr4jJChIxAVVfzEg7fULMcQxwxiYsWLpaMam1a5HJWq0h
         A+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPTejbbi0VjrwZB3qm0I8/+jmgejs37VoikSC1jaUtQ=;
        b=TFDJiTY4wth89+k86/hJLASTAgvNVw56P+wX+8ma5fPaX9tH+2XsJjPy9g667Qr5C4
         +tIpnrGPg1yDgZxDn3wMYExNn0S2avpJTiMziIFWHPUFy8XgSmgPu+i6aU0FQMvYWDr1
         HdB8MOpQQ0kF8/8iLWpqHH7Fx4gfOqcHkNe89VJbbHnkD8nYLHYJPr5U4YX7eumEDmYr
         ONtLfW4oBqjxnIBYEZjKH2ScuGQUXd1ivwegWqDhQY7NZkpWgn/DjcrKomtGC0qru22X
         qK3OmGhxAFCKBi7DMxE61JD1C5GE76yMSeWomITh7r8XWgxRPs6iF4+RIvKhukfSbRUq
         5Uyg==
X-Gm-Message-State: AFqh2krF8pxrTbO3mxcnoNAdPWP+CDVkzyK3tK5qMg1r+isG/AEseW81
	XvseS2eeOiM8beTQ0716ABGbyg==
X-Google-Smtp-Source: AMrXdXur2qtX7wLHbl0tKH2b2is4RZ/VKSr2T4aG8FJIBb61gSsVoK18AtRN6qbV2HSt2GDGU9Bh7A==
X-Received: by 2002:a05:600c:4d25:b0:3d2:27ba:dde0 with SMTP id u37-20020a05600c4d2500b003d227badde0mr34776131wmp.33.1672845561368;
        Wed, 04 Jan 2023 07:19:21 -0800 (PST)
Message-ID: <265c7231-31a0-09a5-2b39-57e0d610661f@linaro.org>
Date: Wed, 4 Jan 2023 16:19:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 5/6] hw/isa/piix: Resolve redundant k->config_write
 assignments
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Durrant <paul@xen.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Chuck Zmudzinski <brchuckz@aol.com>
References: <20230104144437.27479-1-shentey@gmail.com>
 <20230104144437.27479-6-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104144437.27479-6-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 15:44, Bernhard Beschow wrote:
> The previous patch unified handling of piix_write_config() accross all
> PIIX device models which allows for assigning k->config_write once in the
> base class.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


