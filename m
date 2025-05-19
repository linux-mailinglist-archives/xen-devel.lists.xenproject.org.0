Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB37ABBF0B
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989826.1373783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Rw-0004pE-PI; Mon, 19 May 2025 13:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989826.1373783; Mon, 19 May 2025 13:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0Rw-0004nU-Ma; Mon, 19 May 2025 13:22:36 +0000
Received: by outflank-mailman (input) for mailman id 989826;
 Mon, 19 May 2025 13:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0Ru-0004f1-Qy
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:22:34 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 531a9687-34b4-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:22:34 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5fbcd9088a7so207092a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:22:34 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae48253sm5785790a12.81.2025.05.19.06.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:22:33 -0700 (PDT)
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
X-Inumbo-ID: 531a9687-34b4-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660954; x=1748265754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uIDeus1vsoHTicE2Z2VgYl/dNp0Zsle+G/4lsoYeIBI=;
        b=MbkrjCQ1B68iG9DACpwwU0WDP4Og4L14Lzjbt27vX9UjtregzeW4mMtn1GGjaJGmPK
         YfLW9ZzjuqRy48kv1INQV6lokNFiV8SnONtbpv33ZMcSznu0CRWOXD9mn1VzUrTTpoXQ
         fdOcukKoGGFff3780vnA0rtYMAOWZTi32WaBzN0bGJDTOVLYUS1R9+blSR3jDm76s3X/
         IOm3CcMasjN8fKHf+8Qd4rIb7zp8MqrFo4+3nYQbUzhA3z8IaKK5NoyaKzCU+/QGqEkH
         2xSgqpFJVL/oA4eE8g40E2BvzuwRA+/vNdvAv1SlFV77Pitsxmb79186MGChNRYyuaKQ
         ydIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660954; x=1748265754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIDeus1vsoHTicE2Z2VgYl/dNp0Zsle+G/4lsoYeIBI=;
        b=opb3UJbe+G3GIQxmDv4gfDJRuXlxQN2XIddwsTlPT+tpir803WuqegZ0wZB4dWPiu1
         UhDioE1RagYkMj7RnC7UMHrfVYdVued9OjOP4OefbQOUb7Z8RjhlJnD8qdBaPshgdk1a
         QTX0tD2IZH8sj59GGxCqEBDI4LaDMoBFgpVEpPCk2aT2rPzIneLMi5T1+L1b0jY1nS8V
         vmfY1jJGGte284yrDiqgTYVdj6X9Sjk7h/gVwiGeODO+tGZ0s0KFgsnQPFArn/SdK1pG
         7zw8pxjIwQ7Au9XEuDE46T71NdEC+4m2InihsJIsgrfYitah+vQlkzqV8yXUcGuHs4C0
         1+IQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZVnKpl/47SNnnE3AcP29LNwh44faljwXAQF5JYOMiQF++3V31wu6JHqc2ApU8oIewsLw73dB2pzI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGvb5zdBASm+WMV6yRMG/wwI9CIPpBtdZkIMyKwZgUG5kTYGJ9
	N1d2lPGYKc/iBvvJ9qecFzhRTwdR3hueBorf/l7cR6q2sw04RzqerejcsUcpdkgegQ==
X-Gm-Gg: ASbGnctN8twHHvDwehZZOM1dAfD+NcMNtTty3+rMZ9UT89MAkeQPGiE2HztQteku8YI
	eqqf9uW550DyJlSKHavP5LgKExilNVpwm5s5Uc+XMsWl1DamnCtcv0bKj0A+vUwXlqHLyOI/F3X
	8EGePvHqNRoS7PkfDMmu894m/NlfGqrSUZXdE8kPyOcs86j26/L4XsQMIYJgwwxjeYbCfzWVPCw
	oDxgaBuzYvgs5W/44PiHev2b2FFjAO1yWXO1SjBPnrk5HrHq3PCcYhciHCoK4vUweWQFfejOs3z
	9MtnNScEowYi1EKHlz/eBs3dj58zPuqLIzM8mBKYtKQ0f97bEJVry/QmW2SdgQ==
X-Google-Smtp-Source: AGHT+IEWKi5lcrHZBb3KA1Ko4dCN4pOgwspWblnpZm8z7DEtrpo5pjWvI6ZnL8p32TEc5h6/iPOOPA==
X-Received: by 2002:a05:6402:1057:b0:600:29cc:e061 with SMTP id 4fb4d7f45d1cf-60029cce38fmr9011601a12.13.1747660953728;
        Mon, 19 May 2025 06:22:33 -0700 (PDT)
Message-ID: <558c7ec2-77ea-42e6-8568-af8b74e19c88@suse.com>
Date: Mon, 19 May 2025 15:22:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] x86/hvm: reduce the need to flush caches in
 memory_type_changed()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-7-roger.pau@citrix.com>
 <c01ec6e8-bb45-4072-a527-99a7c72fc714@suse.com> <aCsRJBmoP-al6Kgk@Mac.lan>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aCsRJBmoP-al6Kgk@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.05.2025 13:08, Roger Pau Monné wrote:
> On Sun, May 18, 2025 at 01:44:49PM +0200, Jan Beulich wrote:
>> On 16.05.2025 11:45, Roger Pau Monne wrote:
>>> Not sure whether this attempt to reduce cache flushing should get some
>>> mention in the CHANGELOG.
>>
>> Err on the side of adding an entry there?
> 
> Oleksii would you be fine with me adding:
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index 1ea06524db20..fa971cd9e6ee 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -11,6 +11,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     - For x86, GCC 5.1 and Binutils 2.25, or Clang/LLVM 11
>     - For ARM32 and ARM64, GCC 5.1 and Binutils 2.25
>   - Linux based device model stubdomains are now fully supported.
> + - On x86:
> +   - Restrict the cache flushing done in memory_type_changed() to improve
> +     performance.

Maybe better to mention function names here, saying "after a memory type change
by a guest" instead?

Jan

