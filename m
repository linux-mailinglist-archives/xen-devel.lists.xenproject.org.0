Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67C46DB6D5
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519131.806354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvAv-0001KI-02; Fri, 07 Apr 2023 23:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519131.806354; Fri, 07 Apr 2023 23:07:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvAu-0001HW-T8; Fri, 07 Apr 2023 23:07:20 +0000
Received: by outflank-mailman (input) for mailman id 519131;
 Fri, 07 Apr 2023 23:07:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvAt-0001HQ-LZ
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:07:19 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0989c9b-d598-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:07:17 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id m18so64689plx.5
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:07:17 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a63c108000000b005141e2c733dsm3117978pgf.11.2023.04.07.16.07.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:07:15 -0700 (PDT)
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
X-Inumbo-ID: f0989c9b-d598-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JAx0qx3C6KbkeA3/DQYQ7BheR/mOc8zbOwn50MI/ySU=;
        b=mbYbKfx8mUmFoekiQdkNphSpXLmmbqH8glL3AwV4W3HVWtDJAciucY0lPbRfBpEDFq
         gLlOvNgZ1aLfgvbPXG+Qx/8/igjS3HTbQe0TOOhogHHLu6CsdelnF0yAQM3P4NvkeUlZ
         /xxR7Zdqi7rV2zCgA4fHc1MzHVBEyEVNb2vgXSmk+/mwYBQWFUuxDl3NGR/k474i1eEt
         GapH/ZtfQMmDXQlxBXlVSl3mvt6+PQYPigGuP+NMhSb2Yk4I8i4WH+/5bJi5N0/JyBg7
         qvyMaJ5KjlSKrhsg0GppELpMFE4U4M6ddit4DbdCD0iuZxi2OYxIn/vTltNF+s2Tq4mQ
         uM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908836;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAx0qx3C6KbkeA3/DQYQ7BheR/mOc8zbOwn50MI/ySU=;
        b=xzX81L5bM0BKKevQDGg89IiHg8hwZ31qiy3DHjC4XsaSyHRNayCJzh41GxLdXbP8fU
         UK5timuTba37tgsIRU3roOZC/qUezamZ3MhByWctbbA9XdRgy3+S+uuGTbwzzlP2MYe/
         wNTjkF88G22frSqnb3g/rbGOd827ysb4jtulPivqnPDa4sQXeyCv0YS1AK/ctOM/C9oL
         NmGIYmrc8VE6alTTi4tC64KiIkz2ERtW+9PVsfEQNBhNtwRqVZtGwtUhHrQa633cVic3
         qb8GGJ961CT9nPPSFiaYS/I/dWAu8wgZQtj+kN98VzovLkXk62rZB/Ut2rKYuP4023zx
         TAgA==
X-Gm-Message-State: AAQBX9fPZlHKA7KCt3uvXmUCyJPp2QQS/Ju/GnhXuVv+IQD4aTvagxsc
	3Lk63sUK07vXABx4vCzujhmw6Q==
X-Google-Smtp-Source: AKy350ZaLWvNZM1+jRdEw1wsK7EItizE9LE7fAUvdw6zSKnESjRPfP7KFdel4FWtCgR78LROUj0RRA==
X-Received: by 2002:a05:6a20:ca4e:b0:d7:34a1:85b9 with SMTP id hg14-20020a056a20ca4e00b000d734a185b9mr108846pzb.7.1680908836058;
        Fri, 07 Apr 2023 16:07:16 -0700 (PDT)
Message-ID: <7f1385f0-b0bc-090a-4437-434cb72a7cc6@linaro.org>
Date: Fri, 7 Apr 2023 16:07:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 07/14] accel: Rename struct hax_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-8-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState. Start with the HAX context, renaming its forward
> declarated structure 'hax_vcpu_state' as 'AccelvCPUState'.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h       | 7 +++----
>   target/i386/hax/hax-i386.h  | 3 ++-
>   target/i386/nvmm/nvmm-all.c | 2 +-
>   target/i386/whpx/whpx-all.c | 2 +-
>   4 files changed, 7 insertions(+), 7 deletions(-)

Can this be squashed with previous?  It seems odd to change the name twice in a row.
Is the "v" in AccelvCPUState helpful?

> +    struct AccelvCPUState *accel;
>      /* shared by kvm, hax and hvf */
>      bool vcpu_dirty;

Move below the comment?  Or is that later?


r~

