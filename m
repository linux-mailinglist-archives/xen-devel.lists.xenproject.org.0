Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AAEA1CEC2
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:17:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877334.1287483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA08-0005Vq-S8; Sun, 26 Jan 2025 21:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877334.1287483; Sun, 26 Jan 2025 21:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcA08-0005Sk-P1; Sun, 26 Jan 2025 21:17:04 +0000
Received: by outflank-mailman (input) for mailman id 877334;
 Sun, 26 Jan 2025 21:17:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tcA07-0005Se-NE
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:17:03 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1063b31-dc2a-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 22:17:00 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-21661be2c2dso63069875ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:17:00 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f7ffa75bafsm5669849a91.31.2025.01.26.13.16.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:16:57 -0800 (PST)
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
X-Inumbo-ID: e1063b31-dc2a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737926219; x=1738531019; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMRLOGE6yrO6E+licLk956mV4oo4UqHJMRzU5NR3n4c=;
        b=LPQ9rE2XZmdmbBe7Oo8EVcy+3kuVUIQ63V/Kev6xBnQTYYO59KIupPIH/NAhfRYPN3
         ZSau6iWpzF92VVDvzRGXavVlDh4Zw0oK8blSj0HGksx90ZsOBQ2SFUcv7ns+oQqoZWbY
         ZDGKyUhw1pgmc56FsEQek7tOXru84wnJImEc0SlcywjdaNQKeADpjlZ5PMmCusoBPjM7
         zITjWcuR6UJGyWs10xd4xyJN6sxTmNIn4Sa9bwdUb07tzqFi8tTZ0p/J1xDC/HMI8xVf
         JLVSZawPTZ9oz1rZgu88yEh5hRtE1OvX4FZpww6kQur7qJNsqZZXMzqPmRKHiRzmVeFz
         IpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737926219; x=1738531019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMRLOGE6yrO6E+licLk956mV4oo4UqHJMRzU5NR3n4c=;
        b=J5hR4ijxEPvfCB7yXzKTxybU3gmzs4OeIP2T7B1WIGB0gP+isSufx9cTb1w7sZDjPF
         Ja1H+3IeQ3z+Zmx+MoEHAnMKnlSeu+NFp8Vz+1TjhO2MJ1hwXpd/ATpQSNgwsUDIHKpB
         SR4gHWNAY9fPxxSKbeItbCbiyLi13S4lCkrC2cV202+M6sEQSYwnw9Ftj4WLTX9Q8+SK
         We0xp4QvUetXkdtgqH6BA1U8DADv8/jt3KHjll85LY5xlg/JNcRGWHPgE9VRA2ENB1Rv
         eBswH4K9WXyV155mEtAs8oDOhTZ93ZWZmpRN4jcZ3w7cjRajdE3WJNSbSUTN9wzu7n7S
         JHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXiZVTccgwFPryT+ScPnNLd730PzB1iTQ3/W/nORDuMqwfusJIPaYKupXWxExht53ErfG0cQJSXmY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzq3qBSu3AR0f9hgz0RI0HmB0yUBjCFRekGixxd+4ukIkV8XWlH
	Ba6F9wzSlgHcvkx5L9Vv3cF7Qy62A9CDrAuW76rJIdrgaUi3Aa3ITdXHVqJKSrg=
X-Gm-Gg: ASbGncsicjNj2NW1Gs+SVL8GkW7kLMM5etYLGwy53wHkwN2EaIz4sGJWxZQDp1SK7R/
	kr+fVvBv7N87KoSzoRxbKaNxV9225X5fKM0jfF7+6qVpHXLn2fLWpUaINLbwBeTzerLY8RhIAVQ
	MCt9CV9n6z7l7BFtpy3AteGM6JnTDKxkDKF85mpor0wos1c1/vxonH/gKvZR9eoy8USdy/l8xZh
	60d9O1RBt1SLi6sXsHGHBmaIkwJQkk+/LKNtECZ/nJWIGVHJk6MS1fU1Kd3RFS19Vt6JvqTxHnJ
	evSDwDN5jAqTsStY498AfaiPg+tFnPtdED3heOaC4ziiMZo=
X-Google-Smtp-Source: AGHT+IFBHji7Q02DuNHRJzVlNXhJjAx8HDsMis8mrPSUngwfhLK6I5AlZnoO5BvEYdWLX8kF5J4JkA==
X-Received: by 2002:a17:90b:2243:b0:2ee:e961:303d with SMTP id 98e67ed59e1d1-2f782d9ee8emr55346160a91.35.1737926218792;
        Sun, 26 Jan 2025 13:16:58 -0800 (PST)
Message-ID: <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Date: Sun, 26 Jan 2025 13:16:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-17-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
> ("Use a dedicated function to request exit from execution
> loop"), tlb_flush() and tb_flush() are related to TCG
> accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   cpu-target.c | 33 +++++++++++++++++++--------------
>   1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/cpu-target.c b/cpu-target.c
> index a2999e7c3c0..c05ef1ff096 100644
> --- a/cpu-target.c
> +++ b/cpu-target.c
> @@ -45,22 +45,27 @@
>   #ifndef CONFIG_USER_ONLY
>   static int cpu_common_post_load(void *opaque, int version_id)
>   {
> -    CPUState *cpu = opaque;
> +#ifdef CONFIG_TCG
> +    if (tcg_enabled()) {

Why do you need both ifdef and tcg_enabled()?  I would have thought just tcg_enabled().

Are there declarations that are (unnecessarily?) protected?


r~

