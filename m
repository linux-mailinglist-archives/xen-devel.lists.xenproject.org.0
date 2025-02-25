Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B20A443CE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 16:03:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895854.1304500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwTG-0001E8-0K; Tue, 25 Feb 2025 15:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895854.1304500; Tue, 25 Feb 2025 15:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmwTF-0001Bm-Ts; Tue, 25 Feb 2025 15:03:41 +0000
Received: by outflank-mailman (input) for mailman id 895854;
 Tue, 25 Feb 2025 15:03:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MqP+=VQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tmwTE-0001Bg-IQ
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 15:03:40 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b15806cc-f389-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 16:03:38 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso37893245e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 07:03:38 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ab37403cfsm18269235e9.1.2025.02.25.07.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 07:03:35 -0800 (PST)
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
X-Inumbo-ID: b15806cc-f389-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740495818; x=1741100618; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O/6jncaPsADPhH6CmqIkWa1U8s/u8eQdcb8iZUjmloU=;
        b=jCcKPHE5Wpb8zoIiu+R5FV2+EXvu9S4tQt+B070dtuQe37ZjRCWKT27kVCjXfJ61rN
         CV47M2s7O7WCz1AbqqVi+JfZH5iKKU3Sx4+Xijt/Se4oO9+Ui0xIlHOC9HU8SzLhW1L3
         iw7MRn2I6lvlC46yXnMxT3kx+7t+PjFtPkxlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740495818; x=1741100618;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/6jncaPsADPhH6CmqIkWa1U8s/u8eQdcb8iZUjmloU=;
        b=qmPb/3S/Jn1UjQn66qM+/031gtv9qNP/0Sm6rlDcLoqzdAZfbsU6Aok040KI9Bro1J
         kQAhWoKPs+2FG/G8R2gL+dtMWNDfdpRomU6wmNymv+/Afd8Z0iBsxAWA2btAZ4uNyzBZ
         CtW0etvDdLXbInDKYNsNhn97vhLjxpEdzJ4byKcOI78a3cYl00q/EEpyOLEUbMtefVPV
         f1UKVu0b0aolxtJiFbbolBeHSXpuarsrmZtTvGF6N7KY03xrkLPl72yk+8xd37AsXAWk
         EdJYbodfG4X2yAlUdx/ehRT2s4Y6kCQONLpLS0qhhYE1gOy8UPpYxUjcL0FugzXLc86i
         VV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWK4L8UE+0vGS81gP2/GRjSd+XpWDkyONiPnF2g+MwUIkZptLuduqvVhqGvKvoBvNUNBiufKnUrCao=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7+tartTfo5NWozx7IYsa/HsUs78CeTJTt3g0j9UkIWw1y/3Vv
	igmjwyxL9ZA3x2uXHEGAhD7t3zUaHGRjhDms+3e9iLMJc1tcYpTs7V7GHhJVslo=
X-Gm-Gg: ASbGncvVG1q7shas0OD0tj7/lVNsssKdrmSS90IFegIAsWLa19+NdEA9efbocObruf8
	Pra6ZF15RzaEC8IxpFSJ+RNzFV9TYyPI4CiErHstFwjswpXaa4hA1flvOTdX6HGCpuRXtGjfsy6
	Hm+4CM6MF0tLUSG2pGNOwLd2z40nSmZELg5FUyCcFfPCC7WEbkRoXkGYIFVpqEvrSAXMuUoRrNK
	L/I55UD8OeqWUKuMbjCt0gW3XN/wF9Q2ttX7RlFpElBgGNeepUDmrDwpOuANSp9YKnY3NmV9fxK
	A/FozSr1vXgVL9An5W1mG1i8CmDpp50smvVTI5yOBF9C7Kt6f6nJ8b3FsHEirm80uA==
X-Google-Smtp-Source: AGHT+IEjTMSTqoCavtDRV+7TZQ09+FguCGFaHu4YO6g4OrcTMu4GmWwevFqXHW/wJwAaKOQHUnua5w==
X-Received: by 2002:a05:600c:4e50:b0:439:8653:20bb with SMTP id 5b1f17b1804b1-439b2b06189mr165115245e9.14.1740495816323;
        Tue, 25 Feb 2025 07:03:36 -0800 (PST)
Message-ID: <40e13135-a273-4886-9cb1-6eccf42d7a58@citrix.com>
Date: Tue, 25 Feb 2025 15:03:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/DM: slightly simplify set_mem_type()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4a40f0ea-2ce0-4485-aa70-b23634f73dc1@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <4a40f0ea-2ce0-4485-aa70-b23634f73dc1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 3:00 pm, Jan Beulich wrote:
> There's no need to access the static array twice per iteration, even
> more so when that's effectively open-coding array_access_nospec().
> Along with renaming the "new type" variable, rename the "old type" one
> as well, to clarify which one is which.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

