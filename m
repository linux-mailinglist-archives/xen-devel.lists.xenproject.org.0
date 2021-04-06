Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EA235579E
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106070.202826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnX3-0005DR-09; Tue, 06 Apr 2021 15:22:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106070.202826; Tue, 06 Apr 2021 15:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTnX2-0005D2-T9; Tue, 06 Apr 2021 15:22:20 +0000
Received: by outflank-mailman (input) for mailman id 106070;
 Tue, 06 Apr 2021 15:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iFst=JD=kernel.dk=axboe@srs-us1.protection.inumbo.net>)
 id 1lTnX0-0005Cx-Gf
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:22:18 +0000
Received: from mail-pj1-x1029.google.com (unknown [2607:f8b0:4864:20::1029])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e51c47f-03f7-4796-a0ba-fdd63944e241;
 Tue, 06 Apr 2021 15:22:17 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id t23so4883104pjy.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Apr 2021 08:22:17 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
 by smtp.gmail.com with ESMTPSA id
 q22sm17686696pfk.2.2021.04.06.08.22.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 08:22:15 -0700 (PDT)
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
X-Inumbo-ID: 8e51c47f-03f7-4796-a0ba-fdd63944e241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E6z5kWwAl+1QNK1u0OVgaasZnxxYZm0UhtDBQU9NQyM=;
        b=Mv8FIUEgsM18zskQs7tY7B/k0o7lz07YKooRJA46pT3T4Fujs2+EngigMWz1SeXxk2
         408Wr1wqz8H6xFLG9imGxTklpi19vPMezpxq7NkXPUKoqZtcOp236xq6iXS6PZgoWnSY
         u9svYa3oMjpxZyz71mbTc+/G0S+PY7LxLoupiSd3xqQjmTjJNd/QITXAcJMPpdI9cmuN
         0v2+mgf65BG6o1u6vK2WY1mJSCLMXdZxysUQKoCdJcdHM3Q/Zv0GKV1ct2mwjmxokKcW
         NPW3PoCso53PC6Np4rG6b49qINu/V7X4j/Wi0lAHyHKj84Z+mD17W0DnEuxRS/v2fLyy
         mQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E6z5kWwAl+1QNK1u0OVgaasZnxxYZm0UhtDBQU9NQyM=;
        b=jcNamUr8cakbSeTYrYg5hbCJEBaqWLzIHWY1w4NSRZJ9PJhthLjqzOOA2gfnDO9oTi
         55mrjupIX6A92xeOUF7LbVs5vim54VmZIIXwTsd1g/8mrJylehYz9ega+EqkgZOcK6XR
         2u2p1UxfV862qLINLN8VIfBqwOyrqzjqTOkHbZBSRKWPeK+UQBWHL0hcbV2uwGdTUNPZ
         94Mlfwu78zQvzn+WUuqFzPKone1LPwn2xTGlv2t447pTQJjZ1SqDRgDLUjgFrh4Nxx8F
         XFBfvS1mAK5vlEw20H8oKNWMyMiSyUaRkA17rb2fzVTdFn7rwD5x8i+Pqf+BzOsH1ox6
         fSYA==
X-Gm-Message-State: AOAM530Z2P2LCJDsTfwDC9X8/7iPgBUYZVOa47ZIQaMTMCR0p5YmK+/n
	ebKiJzVBhWChEgJwUg9T4BPLvViOlgWmeA==
X-Google-Smtp-Source: ABdhPJwN5ZKGULvml9xEQa+VKvFePdAogoclt6woGJtjAIRk5kqlNGGROJTag2OMaBAe3myOkBprWA==
X-Received: by 2002:a17:90b:a0c:: with SMTP id gg12mr4750699pjb.184.1617722536134;
        Tue, 06 Apr 2021 08:22:16 -0700 (PDT)
Subject: Re: [PATCH 00/11] Rid W=1 warnings from Block
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, drbd-dev@lists.linbit.com,
 Joshua Morris <josh.h.morris@us.ibm.com>, Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, linux-block@vger.kernel.org,
 Philip Kelleher <pjk1939@linux.ibm.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210312105530.2219008-1-lee.jones@linaro.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>
Date: Tue, 6 Apr 2021 09:22:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 3/12/21 3:55 AM, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Applied 2-11, 1 is already in the my tree.

-- 
Jens Axboe


