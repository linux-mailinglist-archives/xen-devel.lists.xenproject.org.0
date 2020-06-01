Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4A1EB236
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 01:35:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jfty6-0006QL-4F; Mon, 01 Jun 2020 23:35:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zqDJ=7O=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1jfty5-0006QE-15
 for xen-devel@lists.xenproject.org; Mon, 01 Jun 2020 23:35:45 +0000
X-Inumbo-ID: 9cc5b902-a460-11ea-8993-bc764e2007e4
Received: from mail-pl1-x641.google.com (unknown [2607:f8b0:4864:20::641])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cc5b902-a460-11ea-8993-bc764e2007e4;
 Mon, 01 Jun 2020 23:35:44 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id n9so573190plk.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Jun 2020 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X4I89W39vWdVNoghag0DFn1ebCW1eil3jLJKcfTKZ5M=;
 b=Rz09eZ1jDr2GqUZY/02LI/v+G4Mymsh044uItJIu+SnTWqBOlAr+pJ1tg3MAcjFFs1
 Wl6k+fmHMq6vXzx2AY0IPGk7NZeU4+E1Sdxl6Mw5AoL9jND4oWQZEQZD+r57AvzHYH/N
 NuhvsCmxF/i2/oBgKNFahnAkMkXFOc81T1dqP9gwS5GJh/0SPKNFan23YgZ6NQ73MEYJ
 qtizNevWe96Vk8MzhSZxh7Hzp13L2QEO5pK/Ckpe0BVTVtsiYNZzxunfsbyOeIti92AR
 Gv4QktnI7lS9pbKOOeJaYUI0JaAylDORYJBmQBzWNsCRniPV5I/JXtMFJ7Pws0xd4Q6l
 nS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X4I89W39vWdVNoghag0DFn1ebCW1eil3jLJKcfTKZ5M=;
 b=k3oJxeOVfBUUZnEuJFVq4BPWwLnyTOBYXVTsC/EvNmJYRTFp6zOgVcg+Uu9XnuZ6DP
 1BfiFCMKXpKD3yyH+8JEHkA02ZaLAM3RP7RvB4cLEPsUYwBhm3oJ1ZhzXt95A60IJvj0
 obWzBvg+p7lwDR9CUKxNgQMvEEG/+lpZBH69dWCM++dqNKfZHbLTsRX3S1THeTkEA5hy
 yQ9h8RpaMsOLNk5HsWcUlF6QG0Xk1zgEUsTWNUd+c3MavBqwb+Ttiz6sN+RORMBQ5t+0
 KbPxacrDyUxdpLO1QImqYMgQ5y7FQLflRq1nkbzaszi0HaAZgdBh9NYg4ifrTC+Bv4Yx
 GA3Q==
X-Gm-Message-State: AOAM530MGDG2HHlf4yfZ0O5FVMODW5m0WONmUMTL3AKL+CkJaKhtpuKL
 VXeSXLoGoJ+DzxwN7MDyqqXzJQ==
X-Google-Smtp-Source: ABdhPJxfVrNnYPK0N8OZPuZkt0Nk1A1urRieu/jIbg1ZT2QBbNMgMrB6P433MN9FZD6oMK1YrM174A==
X-Received: by 2002:a17:902:7896:: with SMTP id
 q22mr23251618pll.216.1591054543738; 
 Mon, 01 Jun 2020 16:35:43 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id z1sm441635pfr.88.2020.06.01.16.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 16:35:43 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] hw/pci-host/prep: Correct RAVEN bus bridge memory
 region size
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200601142930.29408-1-f4bug@amsat.org>
 <20200601142930.29408-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <92a1fda6-0ee9-e7f2-7248-b79c01c7b2e3@linaro.org>
Date: Mon, 1 Jun 2020 16:35:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200601142930.29408-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 6/1/20 7:29 AM, Philippe Mathieu-Daudé wrote:
> memory_region_set_size() handle the 16 Exabytes limit by
> special-casing the UINT64_MAX value. This is not a problem
> for the 32-bit maximum, 4 GiB.
> By using the UINT32_MAX value, the bm-raven MemoryRegion
> ends up missing 1 byte:
> 
>   $ qemu-system-ppc -M prep -S -monitor stdio -usb
>   memory-region: bm-raven
>     0000000000000000-00000000fffffffe (prio 0, i/o): bm-raven
>       0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
>       0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff
> 
> Fix by using the correct value. We now have:
> 
>   memory-region: bm-raven
>     0000000000000000-00000000ffffffff (prio 0, i/o): bm-raven
>       0000000000000000-000000003effffff (prio 0, i/o): alias bm-pci-memory @pci-memory 0000000000000000-000000003effffff
>       0000000080000000-00000000ffffffff (prio 0, i/o): alias bm-system @system 0000000000000000-000000007fffffff
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/pci-host/prep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


