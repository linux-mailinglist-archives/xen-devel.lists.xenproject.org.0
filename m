Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB78A38A7A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 18:20:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890767.1299905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4mi-0001gO-C0; Mon, 17 Feb 2025 17:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890767.1299905; Mon, 17 Feb 2025 17:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk4mi-0001dl-97; Mon, 17 Feb 2025 17:19:56 +0000
Received: by outflank-mailman (input) for mailman id 890767;
 Mon, 17 Feb 2025 17:19:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bxB9=VI=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tk4mh-0001df-9p
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 17:19:55 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 669cb96b-ed53-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 18:19:53 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-439350f1a0bso27658275e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 09:19:53 -0800 (PST)
Received: from [192.168.1.121] ([176.167.144.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1b83a3sm157295295e9.33.2025.02.17.09.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 09:19:51 -0800 (PST)
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
X-Inumbo-ID: 669cb96b-ed53-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739812793; x=1740417593; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
        b=atFFUBG5NX3bIaVItS3CeePxC1xHg8BnOlz7LkY39c5NGQHbQhl7ncf55+EtwhpBrh
         rYKijcwOvxuCtFwze80fuEILLXE+hOir2BEAhGOaoSFBz1GGSdv1XpQYnYnnxJ+ANF1B
         DRWXoVUNMmEjkaAK2qVXlWs7ow7FpYId5zXz/fKPJ0so1umLSbiR9+N7EJm+aGLiybhQ
         UEWLxepnsz+k3gxGHLqGfa52uOaxPy9YH03JKNCOdS0KCRxb8vfF9ujUndgoQVS0phyy
         aJtdfjCe0yUAWB9shMj3EjoMCj+lFRZS6j9SuwtYGoh6OobYCDABjnG8PNuhZWOT8bT2
         DDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739812793; x=1740417593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ6iKHAl4GiTXceekAQxS3dDYx6wGvfJgfBKoYsDbfU=;
        b=CM8qq43d3PmUgEjibPcYLjKYSxO8Ai7O9vX2WDhcmB1e3fXGnW1JxcoohfgIwwUD+M
         2/eeeCk8MDaQLApnr0QmiwjbUD/kp0DFliEcHG65hRtJhHO6el8ysFiAu4HUf8MbUx83
         pfO3LUz6kU5ciyYHTlqpSxMLcLONKcJpa+B0XeqFgw/U5RXjMnPD174FABg6OYQJBF/Q
         LO/+1wVLicqLWeFkCRy21l4mZQ1ZUhFpgrpWEvXPf34cNmB0z8ZIVg+R+il0pyVz2Vu2
         TUROdWlBtpGzet+qfUKjwmexMVLVnnOXLxiUoHG2z5GDm7MpbyO9bDxMPX7WzlsXbIz9
         nl0g==
X-Forwarded-Encrypted: i=1; AJvYcCXkG8OQeZu8/ioaP0p5/dynouAp4RBt0eDUxcZS48w1t3sk+IBrfvcp/P0hLNdqVXFMivClLNFGtDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyb6OiwrDjn4qd0VRTyUf2j+X6bP5879yeoOD/yIx8Ffaa7TdJn
	GR2+o9Az6cyfuqe2KuznwFij413NlU3af0Scnb0A2ZGI7g7OWTtcIY8Uaki0Ut4=
X-Gm-Gg: ASbGncshQgBrnZ2tY+m1vrQu7Yri4XFzbK4PyBxDpHep5lDKquejUpDmdJa8RuJ+78a
	QMEkMfecZ8PLsILeej6WWVBuWg5pWsyfEnhN6IYTxLiljKOKO/8h0kXIJZFRtLXNgE8kImSaRLp
	aWbBwl4IMC4OzanpE9oWT5ZSnBmaCQs4gH205NxpKXx5qkNY8jZc/i4/wHx8HBM+E8C91ekUili
	W+fJ04mz4Z8PYtvEGzkIkmqdeDSrOazKiQX6rh77JTh70dxp8JnstidUI0gcLmqumpXYtMaSP4K
	WoL4tPO9y6XZBhottb549qR5rqZqQg==
X-Google-Smtp-Source: AGHT+IEgo1pk8uQGUSG6ebpaxNPekQ6qVjpVo6fgVMW/kIFnegEFZYxMbxaDbrxa4QtPRDs+dN9QbQ==
X-Received: by 2002:a05:600c:3396:b0:439:8439:de7e with SMTP id 5b1f17b1804b1-4398439dfdamr42175065e9.15.1739812792683;
        Mon, 17 Feb 2025 09:19:52 -0800 (PST)
Message-ID: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Date: Mon, 17 Feb 2025 18:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/1/25 22:16, Richard Henderson wrote:
> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>> ("Use a dedicated function to request exit from execution
>> loop"), tlb_flush() and tb_flush() are related to TCG
>> accelerator.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>
>> diff --git a/cpu-target.c b/cpu-target.c
>> index a2999e7c3c0..c05ef1ff096 100644
>> --- a/cpu-target.c
>> +++ b/cpu-target.c
>> @@ -45,22 +45,27 @@
>>   #ifndef CONFIG_USER_ONLY
>>   static int cpu_common_post_load(void *opaque, int version_id)
>>   {
>> -    CPUState *cpu = opaque;
>> +#ifdef CONFIG_TCG
>> +    if (tcg_enabled()) {
> 
> Why do you need both ifdef and tcg_enabled()?  I would have thought just 
> tcg_enabled().
> 
> Are there declarations that are (unnecessarily?) protected?

No, you are right, tcg_enabled() is sufficient, I don't remember why
I added the #ifdef.

Could I include your R-b tag without the #ifdef lines?

