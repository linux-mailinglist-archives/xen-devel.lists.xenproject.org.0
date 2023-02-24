Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7C36A22FB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 21:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501544.773343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeIY-0006Jr-Br; Fri, 24 Feb 2023 20:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501544.773343; Fri, 24 Feb 2023 20:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVeIY-0006Gw-8E; Fri, 24 Feb 2023 20:04:06 +0000
Received: by outflank-mailman (input) for mailman id 501544;
 Fri, 24 Feb 2023 20:04:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVeIW-0006Gq-If
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 20:04:04 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6245af14-b47e-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 21:04:02 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id eg37so1644854edb.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 12:04:02 -0800 (PST)
Received: from [192.168.1.93] (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.gmail.com with ESMTPSA id
 w18-20020a50d792000000b004af720b855fsm88757edi.82.2023.02.24.12.04.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 12:04:01 -0800 (PST)
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
X-Inumbo-ID: 6245af14-b47e-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0A3Um1lvGw9ad7leL/bytGGZ60GVzQoDPB4UpXIlpbU=;
        b=Uo2a/xQBhTjfhu1Jq6jjVoSdPG8TU4mTZ4YWNAVWebpSTOKDuQu1eVRTOXxwejP67n
         6rwT7L/evVZFuT5bzDpz3/zE7F6pxSpDUBlejvSn8Yr2FvXiY6BT0On6tp0pUSH0ogKX
         VYYGAgwNNfYIA7dTAB0Mswo7vMe/poACXmn2avfqOfqW7dHyxDTATlLc/LZpB0j7bOzO
         ybkN3YVIi0Yt24tlqQsMFPiOSoAE4ZqyOKZRqGjGyB4Ud01ZO22XN/XRUx217aC/YkTF
         B49tCr85Ekx5xW3Eo2ttA6pl9E9gRR8eDIEYIoL2a/fE3vZClsdtriyYBrIljpRtR/9O
         GZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0A3Um1lvGw9ad7leL/bytGGZ60GVzQoDPB4UpXIlpbU=;
        b=Az3qujbpkUWFoM1Z1+b2zHC1as9IowNmSjMwbzjkRstxRVoz6IPgCW2JZBZ8tt/b5d
         G37GKnS/7wQZsqEnyPSL2pqKLkQaeO482+/RdWH85f6S2WoQfzu3yVr235z95Cev6CDN
         auECg+xT0vs/Qfx+mC34hmvih1e0nG6WmrmvBcMpsV7FJg7LK8AWrnNLOl7/tSi6dgt7
         dW73QNebk/Zuxu47PLn8G6zXf96pCxqerpFkTD7O1nc3AJF3KN5AJzFzGstXDdEhBKjA
         /kqMmNE9o/UWr9EGuXWGnRXJ1jl8hD+QY72hjXgCeH/NqIDP48SrZoz5sI315cbe1cgF
         xXmA==
X-Gm-Message-State: AO0yUKX4TCSfhLlMUq8tLlSvQu0GUQXOXITfJ75USXMHcLrH25m3Ap0t
	79/vo3KYAPsDAc8YYA4NdQ4=
X-Google-Smtp-Source: AK7set9CGw+aqlBqHJ8GbX9tp0e/2wBqU0yj9aZAIVpljF5ZGNxOvf3lJr1PomcZGvz9eHE6sLR17Q==
X-Received: by 2002:aa7:dada:0:b0:4af:6a7e:9286 with SMTP id x26-20020aa7dada000000b004af6a7e9286mr7317704eds.6.1677269042279;
        Fri, 24 Feb 2023 12:04:02 -0800 (PST)
Message-ID: <d0d69efe-1f84-7fc2-a2b2-bfad5ac5332f@gmail.com>
Date: Fri, 24 Feb 2023 22:04:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 04/14 - ALT] x86/svm: Remove the asm/hvm/svm/emulate.h
 header
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>
References: <20230224185010.3692754-5-burzalodowa@gmail.com>
 <20230224195847.2762464-1-andrew.cooper3@citrix.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <20230224195847.2762464-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/23 21:58, Andrew Cooper wrote:
> These days, this is just two length helpers.  Move into the private svm.h
> 
> No functional change intended.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Xenia Ragiadakou <burzalodowa@gmail.com>

-- 
Xenia

