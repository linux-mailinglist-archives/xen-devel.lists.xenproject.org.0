Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCCAC22EF
	for <lists+xen-devel@lfdr.de>; Fri, 23 May 2025 14:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.995702.1377947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRnN-0007dQ-9W; Fri, 23 May 2025 12:46:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 995702.1377947; Fri, 23 May 2025 12:46:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uIRnN-0007ay-6u; Fri, 23 May 2025 12:46:41 +0000
Received: by outflank-mailman (input) for mailman id 995702;
 Fri, 23 May 2025 12:46:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ep+V=YH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uIRnL-0007as-97
 for xen-devel@lists.xenproject.org; Fri, 23 May 2025 12:46:39 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4ec0d76-37d3-11f0-b892-0df219b8e170;
 Fri, 23 May 2025 14:46:33 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-442f9043f56so53346355e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 May 2025 05:46:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6f0554fsm138195795e9.9.2025.05.23.05.46.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 05:46:32 -0700 (PDT)
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
X-Inumbo-ID: f4ec0d76-37d3-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748004393; x=1748609193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KcdT1Ulu68Zz2c66rwWlTA83N4IJSTMfY3EqHrN6onE=;
        b=ujre3UJW6DX5pnNKtFPKwW9aEbuMjz55nt6s1b6UoCj8KH7tTT0Vqu9zKbAjc+zid2
         KGSvoWMa7J2rJc8swBS6aNbyx5fKw7I7PjtMfPMUIh99oX0ETQVyATKcfS+qkdK1VfON
         uXmjPWc3YwmqfADdiiEcgr68m3UdKj9CCjl+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748004393; x=1748609193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcdT1Ulu68Zz2c66rwWlTA83N4IJSTMfY3EqHrN6onE=;
        b=q7WTWQF9pLFJNi25VuLsJHvwD+BXrNTja1P/9u8z6Gx1zo9c8Hlizd6/TsEKE+DEvx
         heTIFCwYqt6QhHYDlQCrCS/35J6BbYfArMRws63QrLsmtc61lhg5S5ozjDbWmh32Pve6
         urrEShCpZ1qFr1z0Xdblwa4iqKCt2DKUpRP/1fu+zgI8g+ggfjDtGsWnqez+bVcosHyS
         /pAbUQJ+F58JEwcBT8EQS6S5w/3y8ABqQ/XS7bVc47cUk0fjOUJrPzgv+amiuJ1Oqg/W
         +Q/B72mtpuZ1UEw29g+O1MCcC7z/iY4sX9hITSbQ+mjcVjRY5QgnxHCkIS1i67hDmA1m
         e8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXmYxDwYrsln3MKO91AC1y28choUCoezIPMQPj/E0cgLFErDMMzWmoOKXbDv2NjPdjIoXep/Pq6yYY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDrMjwLblDN/Zahef8TlrLHXaJnjKqA10QwId+3oUGdc6g5F++
	iTMHPDc8ugQcC6NCVNkT9tIO72ziZ6/nXMRepumSTmbe1bC4wyUvpFMOXCRxT8OaFAE=
X-Gm-Gg: ASbGncsLh4UNBDVnlsKMbHNZAwVTUFv0P8VB2kGER/RLMbJxDLkG/vBwrfiNU6kjXe2
	O8PXlcqqfSWal2D2VVLB/QRnEDWtFFfi5a5o5gEPdn4AqFVkax2qj7Yexo5FYZelyizfQr6JQxt
	CXwPDV12EWQQtZJBkbci6nUVG/JsBT1bQWp4+uhJymG/TDzCYoEYPGnxBWSVA+czEZRHA8Il/KG
	chNZYy2uflDU/iPwfaqdTwoQxyF36YWF/B9FOp4gjLu72LuHYaTwl/6FkjHkTIX8ydnz5i7ZMJL
	cOGzFh4i8cUEl28RiJ8jJb2Zu3/oKbvB/tK/NwYxJse2ZEsv6Z6N/JAAD+kMqoANzWgVxFonN0B
	MPCH07FZ7kTLisyTv
X-Google-Smtp-Source: AGHT+IF79mOdDEdvF75j4e/cR13n5aGSqSj/s3La+i2e7z1n+BDC5AnjNIpCFq+joRM1S8KLAgdlMQ==
X-Received: by 2002:a05:600c:4e15:b0:44b:1f5b:8c85 with SMTP id 5b1f17b1804b1-44b6d2cc557mr40883075e9.13.1748004393091;
        Fri, 23 May 2025 05:46:33 -0700 (PDT)
Message-ID: <014e27ab-4262-4821-bd1e-8d9ad9d745d2@citrix.com>
Date: Fri, 23 May 2025 13:46:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] x86/boot: print CPU and APIC ID in bring up
 failure
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>
References: <20250523082135.18088-1-roger.pau@citrix.com>
 <20250523082135.18088-2-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250523082135.18088-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2025 9:21 am, Roger Pau Monne wrote:
> Print the CPU and APIC ID that fails to respond to the init sequence, or
> that didn't manage to reach the "callin" state.  Expand a bit the printed
> error messages.  Otherwise the "Not responding." message is not easy to
> understand by users.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

