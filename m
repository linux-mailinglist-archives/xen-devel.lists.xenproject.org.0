Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF6AC8DAA
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 14:30:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000904.1381089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKys3-0004yy-KY; Fri, 30 May 2025 12:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000904.1381089; Fri, 30 May 2025 12:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKys3-0004ww-Gn; Fri, 30 May 2025 12:29:59 +0000
Received: by outflank-mailman (input) for mailman id 1000904;
 Fri, 30 May 2025 12:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMCM=YO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uKys1-0004wq-Tg
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 12:29:57 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8fd4d4d-3d51-11f0-b894-0df219b8e170;
 Fri, 30 May 2025 14:29:52 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-441d437cfaaso13123875e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 05:29:52 -0700 (PDT)
Received: from [10.81.43.171] ([46.149.103.12])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-450d7fa27b4sm16904945e9.15.2025.05.30.05.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 05:29:50 -0700 (PDT)
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
X-Inumbo-ID: c8fd4d4d-3d51-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748608192; x=1749212992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KsKJzvhM//UflZCltqZ6Kjnw2ewyvR2CQ3NOuVDUC0o=;
        b=ISIxKsRtnyYqhUTCz3Am0wT6AksA4bBc85kZ27RDSetOHWcmtl+xDQzuLee/Ei7/SJ
         sh9zlRNaTc3DMYLwkZF1bWC17MudWXFs3yO6yF1iURxj3XosvEU2alL7q16ysdp+umyu
         xwYTIG0ZOGJ9L5XNWwtRz1IqZub+LbPz8oCS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748608192; x=1749212992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsKJzvhM//UflZCltqZ6Kjnw2ewyvR2CQ3NOuVDUC0o=;
        b=BobocoMQszegHMBrokiGHnf+l8FtGXnDeR3QBvCY7mJnprCuivWoVN8hivczCcw5bz
         QonrWuQui83NJMiEvfxkmdhYXahNGGCCRf2mANIYrKqwgbILJ0FWxgvsBv0AOtdwG721
         ITzFHli589DawpHWbhYp3TKWIZTXTbQOad8GrSuOy13tHx3WB4JUdD72ade0PK5jBjJV
         b2PfrzcLm8GlG0rFiU21FQvrMnuZOA3e+u2/dUAG8hmLyNZHytQK7W+WG8s/2iba+f5s
         p0zt/AGvf5W+J5MQ9SN7lITu4hoRo+xkpA6KNESLJ6lMp2pVIV+3avRI3EZZ+HTqBbKI
         37bw==
X-Gm-Message-State: AOJu0YwU8WbMcPdAvh0fsSS/yAdIzDUPGO+gFxe9rPiZMTnPLL5XLrqm
	RIZ/QN4bfPJbOwBJlqlFJGZkb/0rj/prYeFKM3Vkn0/clveWE3Pll6lUoAyqmYc1HBWsaUj1NM3
	gGtXG
X-Gm-Gg: ASbGnctIEqt64rKdJQ2q9gCihnLQ6aceeecaIV17AuwQxqvJLLG/Rk7JSwbcPUJ5SXI
	GbfJ89DQ/6xmlOM+TttAHTRUb7gWeFBnC0ZKV3PzpDPVNqNLteAuejaeAiiGXPprVJfWALYzKI7
	LfLiGKv/4UFTJoDs1qddpMW7emOu6K23PdtHQTgiMPeGuczpBx1hA7q26MkFDlT0C47pqPw3cGX
	0Q+DPk8RwkQ2vHZRNpgkNqorjoWfhE9N/5v2MsKVxzIRsOlKg/IfXxtgB0BtPfoyPME8VjaB+2T
	/ZSJzGjHng/zeBvlb76p6pD0iKrUTDG4+yNLIRMTs7B5VH5YLtIkmcxTgr6wT7M3F05PGcmA
X-Google-Smtp-Source: AGHT+IHVIrKusi8+f68N/v9+R2bB/ECAMIbGptcYrYY5QLoFcGgTiLHhbIuAfOz9Ql9nN7s6aQz2aw==
X-Received: by 2002:a05:600c:5250:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-450d8875db2mr16855845e9.23.1748608191683;
        Fri, 30 May 2025 05:29:51 -0700 (PDT)
Message-ID: <2912f117-a898-41dd-9e1f-2723728a2237@citrix.com>
Date: Fri, 30 May 2025 13:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/tests: Add install target for vPCI
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250530104307.2550886-1-andrew.cooper3@citrix.com>
 <aDmPDlE2ZWDYg2wm@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aDmPDlE2ZWDYg2wm@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/05/2025 11:57 am, Roger Pau Monné wrote:
> On Fri, May 30, 2025 at 11:43:07AM +0100, Andrew Cooper wrote:
>> This lets it run automagically in CI.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>
>
> I had sent something similar long time ago:
>
> https://lore.kernel.org/xen-devel/20230313121226.86557-1-roger.pau@citrix.com/
>
> But got no reviews.
>
> Thanks, Roger.

Sorry, that fell through the cracks too.

What I'll do if you're happy is submit it as authored by you but with
this content (seeing as it's the one I've tested in the past week), and
A-by me.

~Andrew

