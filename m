Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9077A0C2C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 20:05:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602618.939289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqhA-0000q5-Hv; Thu, 14 Sep 2023 18:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602618.939289; Thu, 14 Sep 2023 18:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgqhA-0000mj-FC; Thu, 14 Sep 2023 18:04:04 +0000
Received: by outflank-mailman (input) for mailman id 602618;
 Thu, 14 Sep 2023 18:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uqVP=E6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1qgqh9-0000md-AY
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 18:04:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 130a51f5-5329-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 20:03:57 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-401b0d97850so12978605e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 11:03:57 -0700 (PDT)
Received: from [10.80.67.28] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g8-20020a7bc4c8000000b003ff013a4fd9sm2592991wmk.7.2023.09.14.11.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 11:03:56 -0700 (PDT)
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
X-Inumbo-ID: 130a51f5-5329-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1694714637; x=1695319437; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0uZIL9QBIPOi1i43i9sEyM9wySkwjsz8iG0Y7oCg21k=;
        b=kXDtr6LziPEmTeYnW8G1D6ttfmPHsMT6hYa0BvRaPryvHJl5GzkHunqlSBSXGYTUCB
         1zMiO9Dy/0hM9s165kXMysqeNOR5Cf1hJKebK1u3SmBFldz4wnq2bwRjGJnr4PEryScn
         dE80Z/FPhzQS/Z0CrTrNzFuNGPFdPNJ5Vkx00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694714637; x=1695319437;
        h=content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uZIL9QBIPOi1i43i9sEyM9wySkwjsz8iG0Y7oCg21k=;
        b=Hf0q8b2ZQZU3QnIid5JqNDExWlDheIgHmipUYNvQSO9TAD4FuuER0acIN38EoV3cTT
         ZNJUHKfnsBbmYgFXQ5rCR14KNYkUZnpksVdHlELxG3de79+zs6tD/vMqvWOCGXeciurM
         iuMB+yAI8HyaecJGOr/mTYkoVoHNNTH2hzjsVbgrSOVCHYQRSZ3Qoz0s2Afcm1BC3F/1
         Z0jMcnJZlccLbFcm9aPAS+g6JNnJddkyQNlUKtYg+ngnTpEvDLP4nzd8yt7Eoi2Jfpig
         kWr91BauiPX+jVmCMjAz/x7TFJO9WJNqBqNGv7WL12D2OlefmvqefJbjk4skSsSa7N1K
         BUoQ==
X-Gm-Message-State: AOJu0YyIYje7zd6qrSY8xbsHejUKCTtRc5O2nL7uNWrrRkIOqiqu6Bg2
	68BZ5mDEITS7dm4cWs7m1t6Xvg==
X-Google-Smtp-Source: AGHT+IFFqJ5GPcSRyhgS0jIJ/Gjd44om7Km1IR9fgNbuQ8RXjlTTLlHoIY2Np8PPY2sYWxS2q78K6Q==
X-Received: by 2002:a1c:4c09:0:b0:401:cffd:995e with SMTP id z9-20020a1c4c09000000b00401cffd995emr5257922wmf.35.1694714636937;
        Thu, 14 Sep 2023 11:03:56 -0700 (PDT)
Message-ID: <08556a3f-3a96-2929-ef7d-26c3b3cbeb6c@citrix.com>
Date: Thu, 14 Sep 2023 19:03:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/5] x86: Introduce x86_merge_dr6()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Jinoh Kang <jinoh.kang.kr@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230912232113.402347-1-andrew.cooper3@citrix.com>
 <20230912232113.402347-3-andrew.cooper3@citrix.com>
 <126020f0-3054-11d5-c7f9-1f02750cf815@suse.com>
In-Reply-To: <126020f0-3054-11d5-c7f9-1f02750cf815@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/09/2023 3:53 pm, Jan Beulich wrote:
> On 13.09.2023 01:21, Andrew Cooper wrote:
>> The current logic used to update %dr6 when injecting #DB is buggy.  The
>> architectural behaviour is to overwrite B{0..3} and accumulate all other bits.
> While I consider this behavior plausible, forever since the introduction of
> debug registers in i386 I have been missing a description in the manuals of
> how %dr6 updating works. Can you point me at where the above is actually
> spelled out?

The documentation is very poor.  The comment in the code is based on my
conversations with architects.

APM Vol2 13.1.1.3 Debug-Status Register (DR6) says

"Bits 15:13 of the DR6 register are not cleared by the processor and
must be cleared by software after the contents have been read."

although this is buggy given the addition of BLD in the latest
revision.  I've asked AMD to correct it.


SDM Vol3 18.2.3 Debug Status Register (DR6) says

"Certain debug exceptions may clear bits 0-3. The remaining contents of
the DR6 register are never cleared by the processor."

~Andrew

