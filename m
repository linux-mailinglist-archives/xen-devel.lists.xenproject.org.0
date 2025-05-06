Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF9AAC23E
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 13:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.977055.1364135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGHY-000810-Ou; Tue, 06 May 2025 11:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 977055.1364135; Tue, 06 May 2025 11:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCGHY-0007yj-M8; Tue, 06 May 2025 11:16:16 +0000
Received: by outflank-mailman (input) for mailman id 977055;
 Tue, 06 May 2025 11:16:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cniF=XW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uCGHW-0007yc-DS
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 11:16:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ea4b933-2a6b-11f0-9ffb-bf95429c2676;
 Tue, 06 May 2025 13:16:02 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a0b135d18eso211014f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 May 2025 04:16:02 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099ae0c31sm13532139f8f.10.2025.05.06.04.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 04:16:01 -0700 (PDT)
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
X-Inumbo-ID: 7ea4b933-2a6b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746530162; x=1747134962; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7CSMyQv+DQP+Roh6PLIJOtftCARSzT2JDX/KcCY7xRo=;
        b=RXvX55hzxWFJWTf/NTM7WCgpLSmAEfippNzhvbRflovvVDb8WgAWf1S5ntXW1wY6X8
         9XEQT7BaQWokf3qP6kaNwSY5QyNXEqH1Qm20Chg/9xtqI3mcnxcnIyHZDp0Q7JlaA4iH
         u7jC09wtLtfAi/wxF820avOsG1ftp3fSglO5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746530162; x=1747134962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CSMyQv+DQP+Roh6PLIJOtftCARSzT2JDX/KcCY7xRo=;
        b=RaHV8gMh8YxrPQkFq0ebYUqykjpoLg48vecUhJM/5D2uQCBLZKwFXrbshIIFccyFLH
         m0b8wcIMXGkqVx/vqhbCLbJUDcJJIIfmyiWCn3DII8g3A6OGnzEnYUW3s65Y8rFnsSVX
         +LWQ6fe8lP5i5JyI0/oDEiWR+RGK4YY7L2ateQ1R/MP4vP6MOzHe35vhXSybxe/4t0zG
         eSvV5rZSRQBob9g/RiyujMgBc/K4es7AvgMN4XvTSAJveBmfZkOQveIE8lzhVV7tuO+i
         iqWKl3x53Fbw0j8hOXFIE3FjfOYa7FuEillOM9ohXBzF3PdiBbhP4ziKao7+zD7JV5QP
         W69A==
X-Forwarded-Encrypted: i=1; AJvYcCVLgOhkckv69P4X9vErHo7hMcoYMY6DiA5XBuxHVsL8iqX2/6a7YsBZtBiMbAJYrOWTgKIqtOXpmVM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwXhoUgQDrWyr1vIY4p7Vb1AemPb5M59P1b1ft2bY+M/cXVyCbK
	YCouJ6sbJA2noP8O2N7pmFoEe1zQAQyjMsYpUWb1fofzQeU/OQthDnMDT418Ao0=
X-Gm-Gg: ASbGncuFhCfxgImxrUBRIIgyXGBa/+kJHo8j0y06W7/XnD9TxVkmLRLHj37anJHmgVs
	f4wJAzxI7pO8uJyQOOu4o/K9ekuvB9Cs29FnBiuSGxZ69nSdJB/wVFlQg41Ar0sJJc6szYSxBVd
	wnRZr0gnNMoH9+QVNeBV42pejcrexNCKkEtM0TxYWOY6L7YaxdDSS8j7qV8jQeA9dVm75gue0Rq
	cDBGEgyF6UNjUo64ZaFHkGxvfKlmU4SdYiMvH3uPLBg3r21L0RtKqGL+k1xkyn7gGm1dBpU80Xx
	ZBmDh+S2qamQmV6Jus/tnZISgCyNMjrNa8wEGatkydmCguJV1yXSlgVlvBJ/XbU4Gik5j/6Go/F
	mOXhQtQ==
X-Google-Smtp-Source: AGHT+IH1nMcXETKTUesDeXvaEY8g2+UEhpa6hPYMAri7OG0+JM5C6Tvu/60zzImhUR3CeS8cTm/LgQ==
X-Received: by 2002:adf:cc8b:0:b0:3a0:ad23:8a21 with SMTP id ffacd0b85a97d-3a0ad238a45mr1261546f8f.13.1746530161864;
        Tue, 06 May 2025 04:16:01 -0700 (PDT)
Message-ID: <cecf40ed-9cf2-4e86-aa82-e0c33643868d@citrix.com>
Date: Tue, 6 May 2025 12:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250506083148.34963-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/05/2025 9:31 am, Roger Pau Monne wrote:
> When a guest is allowed access to cache control operations such tracking
> prevents having to issue a system-wide cache flush, and rather just flush
> the pCPUs where the vCPU has been scheduled since the last flush.
>
> Note that domain-wide flushes accumulate the dirty caches from all the
> vCPUs, but clearing the vCPU masks will require pausing all vCPUs, which
> seems overkill.  Instead leave the vCPU dirty masks as-is, worse case it
> will result in redundant flushes in further calls.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

I'm afraid this doesn't work.

Unlike TLBs, dirty cacheline can move sideways, e.g. by foreign or grant
mapping, but also naturally because of how cache coherency works.

We need to use the guarantees given to us by the architecture to simply
nop out cache flushes when safe to do so.

Everything else is either a shootdown (clflush/opt/clwb, and doesn't
even trap to Xen), or needs to be a global WB{NO,}INVD.  Partial WBINVDs
are of no value.

~Andrew

