Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5724640071B
	for <lists+xen-devel@lfdr.de>; Fri,  3 Sep 2021 22:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.178494.324537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG74-0004rz-9E; Fri, 03 Sep 2021 20:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 178494.324537; Fri, 03 Sep 2021 20:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mMG74-0004p8-5E; Fri, 03 Sep 2021 20:48:38 +0000
Received: by outflank-mailman (input) for mailman id 178494;
 Fri, 03 Sep 2021 20:48:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lnve=NZ=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1mMG71-0004ox-Uy
 for xen-devel@lists.xenproject.org; Fri, 03 Sep 2021 20:48:36 +0000
Received: from mail-wr1-x42a.google.com (unknown [2a00:1450:4864:20::42a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cbd8ebd2-f9d7-4f70-b376-9c2795757b2f;
 Fri, 03 Sep 2021 20:48:34 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x6so372036wrv.13
 for <xen-devel@lists.xenproject.org>; Fri, 03 Sep 2021 13:48:34 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id t23sm273507wrb.71.2021.09.03.13.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 13:48:33 -0700 (PDT)
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
X-Inumbo-ID: cbd8ebd2-f9d7-4f70-b376-9c2795757b2f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JR2N3hW+DAAOOkmrYLuui81slBAvGFUWkGnERbEB/4A=;
        b=oIoi1f5ZWFOc0RmycwGdPB1omD0xRAxTNPvzzN59dsRqEHrjnFus9NLUNjhn6i17pj
         ivO2uKGYQ/5srtBFw7S7dxLFCPr0Dg84Ff6W1/9vJTqoS6LzG+xh4J2hCztqivPqnava
         u/7bE8JnlgID+82FLwTwyyj/Qz3U6Qik1/Tf5wLbcyLfdBYFCdE7+xNUeGNupoQceOtK
         DuiPtlLD47X/8EiY6wq+LG78nSM5X+oluNwRPdUvyRQTAk0pPxYuJQ+0FSqNABy+klPa
         /Gw/OIgSOH/QuL9vGuSTxQAkWanGr1FY2e4K3sb0MB5auKQ+KdAP6aCeWBFl5rG2tuai
         4CPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JR2N3hW+DAAOOkmrYLuui81slBAvGFUWkGnERbEB/4A=;
        b=R4VRmijr0Yo1qLLJ+affaxnJgfi6/TS8eNggVwo2P2usLW2mAd9Re8ol84KRTjFA5V
         uQyo9aZ9CPBdVRwFN/5t/nPRRWVidA9k1sFKPUr2YkmmS2C56Jd8xxtq3noEyCFjEL4w
         tvDTNZaOGXIlDgGbSCuEC4MM3FhAJmQytFTUvfWbFenkZ63UxpXxLnasHB95ESA/bWcu
         FzOy9BtMws46TEruYQqtATHJVcArlbxzAIYqiuXryf6QOo1GSX4W7KbSFQVPu0uwejEu
         Vb1+fyu/O52J0aMy7C/zg7OHuV9OlR/uToJLhI2OTltd/OooXRXvh1jXrp5aSRp/qp91
         wrVA==
X-Gm-Message-State: AOAM533mF7xGV4iAT81N1LiQIwe6oiDubNQ8+PWrxxFdUmengaGTpEgp
	UsviioydSIKTAO+UYh0KZSRrPoZRGyF8cPxyLXU=
X-Google-Smtp-Source: ABdhPJwYxL1wBdNoflELnyXgoIfkyp1X+C47Clew7iV3DpVZ/QyfLSQUi3F7MAdXmgdYugc/uDUBHg==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr908323wrm.198.1630702113942;
        Fri, 03 Sep 2021 13:48:33 -0700 (PDT)
Subject: Re: [PATCH v3 30/30] accel: Add missing AccelOpsClass::has_work() and
 drop SysemuCPUOps one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Cameron Esfahani <dirty@apple.com>, Claudio Fontana <cfontana@suse.de>,
 Colin Xu <colin.xu@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 haxm-team@intel.com, Kamil Rytarowski <kamil@netbsd.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Thomas Huth <thuth@redhat.com>,
 Wenchao Wang <wenchao.wang@intel.com>, xen-devel@lists.xenproject.org
References: <20210902161543.417092-1-f4bug@amsat.org>
 <20210903181943.763360-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b1a24c2-cdd6-ec88-d0d8-540bf5f96c38@linaro.org>
Date: Fri, 3 Sep 2021 22:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903181943.763360-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/3/21 8:19 PM, Philippe Mathieu-Daudé wrote:
> cpu_common_has_work() is the default has_work() implementation
> and returns 'false'.
> 
> Explicit it for the QTest / HAX / HVF / NVMM / Xen accelerators
> and remove cpu_common_has_work().
> 
> Since there are no more implementations of SysemuCPUOps::has_work,
> remove it along with the assertion in cpu_has_work().
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   include/hw/core/cpu.h             | 2 --
>   accel/hvf/hvf-accel-ops.c         | 6 ++++++
>   accel/qtest/qtest.c               | 6 ++++++
>   accel/xen/xen-all.c               | 6 ++++++
>   hw/core/cpu-common.c              | 6 ------
>   softmmu/cpus.c                    | 9 ++-------
>   target/i386/hax/hax-accel-ops.c   | 6 ++++++
>   target/i386/nvmm/nvmm-accel-ops.c | 6 ++++++
>   8 files changed, 32 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

