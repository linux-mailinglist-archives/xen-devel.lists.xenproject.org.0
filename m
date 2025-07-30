Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E292B15FB2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 13:48:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063837.1429557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5Hv-0007GA-1W; Wed, 30 Jul 2025 11:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063837.1429557; Wed, 30 Jul 2025 11:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh5Hu-0007DS-Tu; Wed, 30 Jul 2025 11:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1063837;
 Wed, 30 Jul 2025 11:48:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BoeR=2L=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uh5Hs-0007DL-Pf
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 11:48:00 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0aa8ef6f-6d3b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 13:48:00 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45600581226so64793675e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 04:48:00 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458953cfcadsm25001485e9.18.2025.07.30.04.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 04:47:58 -0700 (PDT)
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
X-Inumbo-ID: 0aa8ef6f-6d3b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1753876079; x=1754480879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M4kvPPxGcKMJa3uhl0gurPJxwA7z3AqL83+xSNF7uDQ=;
        b=GrDL0wB9tyZj+IGUW8ksLLIOHgKRA++6yhzSmbR8pJNp6gMXJevEY8CJSO0tTCYlG0
         e8YFfvq/rRoxxYJLNDSQtkddSC+NubqZvuj/nAUklNgbAyqTUmw11ovYkTePOEGWQ3Ck
         wl6GJyYGGnGp4ySdrYAzWsvQ5AHrGvxArYG/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753876079; x=1754480879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4kvPPxGcKMJa3uhl0gurPJxwA7z3AqL83+xSNF7uDQ=;
        b=SmrN+5XosK/5u/MS2pIhBHdw8HO8QvkxPW0ecD2+Ee6auoryIX2PmgtMF6yTqhxg1m
         4vA69AmUh5fcHDXI1ph6YBU82Rfbpf7Dg/3UiAouDe0MfCxkPAOPHEZjrRcPo0EMuUMc
         sWW9yX9EimTKDknkh79+vr9UtqsrBAzwoguEs7ArTgOa44tS/SlRNRZPOlwIx3e2Bc+y
         UElZuLY1d4dH7bGmgDfICb0uL1H0ctJWjwcPIPfJhAEQ72/CcnmRQV4L/oWReABy5Y0v
         gygca0RsqfHv/BloK6EthtoS5K1ljYCgDwu9Vttgf6vZonElqBaoy4YjFQ1egd+BWRE0
         x8zw==
X-Forwarded-Encrypted: i=1; AJvYcCWjO+apNjeQgBrKBCjMb8dDK0TBvIhLW7RJsj5yJoU/yJBhHjU0xr8TztnfJvUIsml4Q29W3VAcQIc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBB2kCAiDpMJ2Rim+DOxHD/j5OXH04F4dkALojKZ+r7QRrJO47
	AFccicmut+No2kb8tBn5aVXsvTgqfodYbBuNXdHN5duDgDa5hC0qADRgJa77w9A29dw=
X-Gm-Gg: ASbGncvY8yA2tvg3H4doXO+5Q8wWHWMJ+fP2xQ3VVL3hwkgxO89juKtb8fxvDs9x/Mo
	eLKUKuJTqUGxddZkpwJycO6CiEUmFZ5WAZu8Y83lZovmoCWMLQjViaDvONB2KvAw047HhhNTqZh
	RrdKRbaJTVcTyt3vC8R6UsobCTcvBBo2zedj5O4JnKzBqsR00tVDI4LiFgGC7FflA4aiZw8w/Ho
	P23tBx0o89B97lOK4ojJWZbqXNKxnU1WedICalUbZk3+c+//cVaZvdT+bIozgjkkwLVL5LPpgNt
	oWdfaOrsttLKp67sRo1lEmKDwL+q2N7cneWdd1egdgrB+Mw1iKFSgN5aiAky2xlAlHSi6lVHRRI
	Vuw4+rWTh2wsiAClC9Y3q5WtfPJWVAHvlOEh5QfcqN7pYOx0s0N44E5sFq4WcTHcutuq3
X-Google-Smtp-Source: AGHT+IFLahv78jzphyVjuIUt/9P0HU+jTsJxcGuFX1vY8L1+b07C/N9PFVIwtXjyE8LI5dUMmAH2Rw==
X-Received: by 2002:a05:600c:8419:b0:456:58e:318e with SMTP id 5b1f17b1804b1-45892be133fmr31279695e9.30.1753876079313;
        Wed, 30 Jul 2025 04:47:59 -0700 (PDT)
Message-ID: <4612a731-6d2b-4760-8229-eb93e7d20214@citrix.com>
Date: Wed, 30 Jul 2025 12:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: list failed tests at the end of tools job
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250730114624.2260010-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250730114624.2260010-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/07/2025 12:46 pm, Marek Marczykowski-Górecki wrote:
> Currently, if any unit test fails, the final line says only result of
> the last test - one need to scroll through the whole log to find which
> test failed (or whether was it some infra issue).
> Do the simple thing for now and repeate the failed tests list and the
> end.
>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

