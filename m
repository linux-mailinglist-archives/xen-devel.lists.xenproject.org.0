Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2839840B7C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673038.1047169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUXN-0002PH-7F; Mon, 29 Jan 2024 16:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673038.1047169; Mon, 29 Jan 2024 16:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUXN-0002NX-4c; Mon, 29 Jan 2024 16:31:09 +0000
Received: by outflank-mailman (input) for mailman id 673038;
 Mon, 29 Jan 2024 16:31:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9VRI=JH=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1rUUXM-0002NR-6T
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:31:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc9e8702-bec3-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 17:31:06 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33934567777so2496436f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:31:05 -0800 (PST)
Received: from [192.168.13.31] (54-240-197-239.amazon.com. [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a5d6847000000b00339272c885csm8443905wrw.87.2024.01.29.08.31.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 08:31:04 -0800 (PST)
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
X-Inumbo-ID: cc9e8702-bec3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706545865; x=1707150665; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umw2ymJHrHcUjP6X+VJC+3S6WYmpXezSYY5XbqcgcY4=;
        b=hrBGroHVuqBy+81Meg0QttFSGpO5Oe/JM+ZKMKtRFuu7Q8JUAIPsKed284NSpgBZOk
         rw2p/pm+D8BFD4rT2BDTMzVw+xxWhWI9Rl4WLyS/9+6V0njDjbOpu47HQOBMrnIGjzZS
         P5GN3jQejQA7C2Df+PtDVyvWpbQ9TI+J0OMEC1pS1Q+5tvNH0r2ISfIXGfoRzuWxar7Y
         B+/FCZ0aAY0CPNQTzIgB3VRoQROU2rAJNFiKGMy8gWidspRHaw+O1p+xZMe05V/n3Gca
         0+jlmSklml8aj0E/SETgBfAvfFWYv5uYvFjJwuiUaJAJ98DP/10ksHORdrFIqJNcxNqI
         LFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706545865; x=1707150665;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umw2ymJHrHcUjP6X+VJC+3S6WYmpXezSYY5XbqcgcY4=;
        b=XbPQrjVuwOoJ/hk2NcdAnF7rr1d6OUbK98tlEYTZ0wzCUmXFHBChpiOeMedpmAa5RN
         gkQXVsf8idpcQ/1anh7PIKMWttAcmn0HBxEhWkF8QBUAyJDOARZyXW4BxBAauhiUz9sr
         BNmUJQu82fMGjXv79cCtoPHo0BqDsgQmKwOolDms7exWBLSFTI2MPFoPQFaO8o0aGVEP
         ExkqwgXoYZyoHqx39p2GxJt+/atHsS+O2K4XFZMkdSz6ydVaXI6S1KSYbm0z6Pfrlo/I
         X+MUxRs34kKVajuqG5nu/10LXz6UgSDjPgOtzGuCYQTOebPHwYGrarQebdQMnX4PcMmW
         Q9tQ==
X-Gm-Message-State: AOJu0YzImabXxJFkFhl5owCHGzIOEJAF+LNzbHjUPtNkO39ncuyOi/wL
	O0A/71uCrgNimBdtuK2tacRP7Se2hJsFnrnQw7MwjvfEFV7RURoY
X-Google-Smtp-Source: AGHT+IF2uMBb6gt0XwRmTaX3zVcU4ftQT/IU/b8gtNh1+d7EqcNEg1wJ7xgbou4/4AwF7r1Ca5zZyw==
X-Received: by 2002:adf:e786:0:b0:33a:e77f:977b with SMTP id n6-20020adfe786000000b0033ae77f977bmr4053603wrm.12.1706545865175;
        Mon, 29 Jan 2024 08:31:05 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <e16f950d-2e8d-451f-bdd3-3ff9b66a070c@xen.org>
Date: Mon, 29 Jan 2024 16:31:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: paul@xen.org
Subject: Re: [PATCH v5 3/3] x86/iommu: cleanup unused functions
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Mateusz_M=C3=B3wka?= <mateusz.mowka@intel.com>
References: <20240124172953.29814-1-roger.pau@citrix.com>
 <20240124172953.29814-4-roger.pau@citrix.com>
Organization: Xen Project
In-Reply-To: <20240124172953.29814-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24/01/2024 17:29, Roger Pau Monne wrote:
> Remove xen_in_range() and vpci_is_mmcfg_address() now that hey are unused.
> 
> Adjust comments to point to the new functions that replace the existing ones.
> 
> No functional change.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since v2:
>   - Do remove vpci_is_mmcfg_address().
> ---
> Can be squashed with the previous patch if desired, split as a separate patch
> for clarity.
> ---
>   xen/arch/x86/hvm/io.c             |  5 ---
>   xen/arch/x86/include/asm/hvm/io.h |  3 --
>   xen/arch/x86/include/asm/setup.h  |  1 -
>   xen/arch/x86/setup.c              | 53 ++-----------------------------
>   xen/arch/x86/tboot.c              |  2 +-
>   5 files changed, 3 insertions(+), 61 deletions(-)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


