Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 465E2A59EA3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 18:32:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906746.1314132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trgzR-0006Jj-3n; Mon, 10 Mar 2025 17:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906746.1314132; Mon, 10 Mar 2025 17:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trgzR-0006HV-1B; Mon, 10 Mar 2025 17:32:33 +0000
Received: by outflank-mailman (input) for mailman id 906746;
 Mon, 10 Mar 2025 17:32:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iUjf=V5=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1trgzP-0006HM-8c
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 17:32:31 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3e582a7-fdd5-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 18:32:30 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22185cddbffso99068865ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 10:32:30 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736cc153016sm3620330b3a.173.2025.03.10.10.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 10:32:28 -0700 (PDT)
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
X-Inumbo-ID: a3e582a7-fdd5-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741627948; x=1742232748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKvTTaeAXFeAoKKy/TUEugm6Lvxdb1J/dR+hd8yG8+Q=;
        b=EN/W5LxjZpdmD55TMnCWqkl1JZAjdqfUY/Z4b5oJlTlzvQfVVJ8d0VuZucLP9NwST1
         OU2o4LFGGYCS87m1BhlvqgbMZJIOllqcLJKTxZUzEvbvfxTnNCbFVbYcfrCyWfRwriX9
         cPAckxHdIpnLZoY4fxFyBBMK1aVZOcM8ayb+3bVvq21CWYhKNiOrj+/9wltFVkW6x1nG
         gZfbO3erQfF7OCXNqSjAGXl0BgS/cbLs0b/I+jNoKgbp8HMlbEblkum61f0HgERSwXhe
         J1pM63A7UlKmAgbqkBAnswSH/dOYcNPqfmDGiA6QWzYjlLIL4EhALaIdH58DTIyObeAk
         gr3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741627948; x=1742232748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKvTTaeAXFeAoKKy/TUEugm6Lvxdb1J/dR+hd8yG8+Q=;
        b=KojWPprIllOkmuDcV9kE7Cqrjh6Bka3l7SJjTXGefk+rGjXdbK6roet//k4yhKamvq
         pKkTbQ3l76ECHCtzdJHMQZfTNCMJ0O96rtI5WJ+YUAkHudqwan6ssNgxiDan3R0v9Rgh
         XJMD65G2598104+Pi8Vk3juTh6uJOv0DiAAy3WJ8xJLMZsehGjAFXEWfYlK6bztJojUG
         Dpe/Z36Y9rS70qZrRWQESRPOt6tfx/b8hUSwg9tBvYncy5+72XEJA2+dnJUJeJu423EZ
         PWEncSL8aZp3blSz8X0Hr9O9pItyy/JrxZpqNqEOeYoynpEPh3Q/sk9oAYkuK9cq7o0h
         PDtw==
X-Gm-Message-State: AOJu0Yy0zD4IpdDyLunpg7BLEsVGcKnKC5mnlyMSSGDkMnFP2Z1fy8PO
	l2TpBYy6ZGmiTNx6Ea+oaPbZ8mMGjQpZi7zHEaUfCErhq1yLeZdF1n+Qd3mENu1yVadQFSnEdW/
	z
X-Gm-Gg: ASbGncvrl3aD9iipC6Q6rNgbTL8JmS4xxo+0bi5AD+kdG9dgF+NEcavtSu+AFh7xflh
	SnIotv3hidN3zlBLH4RRtkjzornaDXvi0mPg4yihJw7JGTQEwrMKcm84n7UuqN98KPQ99aKcm+m
	gue7Aex/Xxy1ZJ/FQNqCB1se0f3410NtfQj08E9gZfQ382bH+4EJPRx3wqcluXw41BcA8AL5mQM
	YM/vZx5Thu1b9PjVpg5rfEwXbf4hV1tynesseary7HTorE0BumV+VFlQzmUHcpHGODbSBd/AxRP
	a6m+SLPCIysr1+XrMyQaVu71A7uUifwNMj39eCelIMepsSHfFr28NW8h7ja4KQ3lMgjbkZOv9gM
	RSmw7K2ma
X-Google-Smtp-Source: AGHT+IGlsTuVM/mWYGBPfTtazpwhgbmQOPR2gjCm9rQY9M9e9b0UBRTLp/Z541I5JBsXGEodHFeYGw==
X-Received: by 2002:a05:6a00:1aca:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-736ec5c3c05mr456490b3a.2.1741627948521;
        Mon, 10 Mar 2025 10:32:28 -0700 (PDT)
Message-ID: <3dfedea0-baa3-4768-9c6b-033cb8b8adbd@linaro.org>
Date: Mon, 10 Mar 2025 10:32:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/16] hw/xen: add stubs for various functions
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: "open list:X86" <xen-devel@lists.xenproject.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
 <20250310045842.2650784-14-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250310045842.2650784-14-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/25 21:58, Pierrick Bouvier wrote:
> Those functions are used by system/physmem.c, and are called only if
> xen is enabled (which happens only if CONFIG_XEN is not set).
> 
> So we can crash in case those are called.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   hw/xen/xen_stubs.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++
>   hw/xen/meson.build |  3 +++
>   2 files changed, 59 insertions(+)
>   create mode 100644 hw/xen/xen_stubs.c


Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

