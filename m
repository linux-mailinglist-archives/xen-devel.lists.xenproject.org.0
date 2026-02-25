Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAa7Kk9Qn2k7aAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6546919CCB8
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 20:41:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1241037.1542278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKkF-0004Ur-Ed; Wed, 25 Feb 2026 19:40:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1241037.1542278; Wed, 25 Feb 2026 19:40:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvKkF-0004SV-Bg; Wed, 25 Feb 2026 19:40:27 +0000
Received: by outflank-mailman (input) for mailman id 1241037;
 Wed, 25 Feb 2026 19:40:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2gY1=A5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1vvKkE-0004C4-25
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 19:40:26 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d41bfc30-1281-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 20:40:25 +0100 (CET)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-827270d50d4so108647b3a.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Feb 2026 11:40:25 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739dabd43sm46995b3a.25.2026.02.25.11.40.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Feb 2026 11:40:23 -0800 (PST)
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
X-Inumbo-ID: d41bfc30-1281-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772048424; x=1772653224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdPCqf+ZgvZyaMYq7z8u2nsVi2kkVmJgqOcGRdKnmy0=;
        b=yIJQMQcGcGtk4IhSBGmVEX2MS4rDP8CsAukNtg7zB9W8KLyCEPy8xOFxbtMMBHVQPd
         zVWQ1oHvvkwSieYTLl/1U5O6POEITh4zXwTNla4ffGBvQBp5y8ShJpumqYOOGfkpEVL6
         HP2cb0vI1ZmRMaYK1SwCy4afgVVUBtzd2qYPANkiE50ebBTGM0pGRq/ieW7n3Qga/Js+
         uegOy6oz/GiFaIfgPWfgqJ/IkazQJEq0WpTSspaA5dWapE1SHn4K7bLRVay63e/8hMkt
         cRkCrcrRnt4dRps3jGWNAMPop7V4vVxR+xROEVoy0tK5UrlicQFHmXQJK3cMl1rqWgNg
         KUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772048424; x=1772653224;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdPCqf+ZgvZyaMYq7z8u2nsVi2kkVmJgqOcGRdKnmy0=;
        b=i4h6uzu9KMHhTsvqdpl1dWxRv0vkvYzZSfVk6BDyt+PM0n15xoE+ctD9miOqvb+VCQ
         G9ZKg6RXf0Aig+d4nHHRudvlLuv1MjYJvI6WOHeH9pkTChe7aCePgeFlTEtop3tNN94j
         AYOoo+Ht3Dgfl1QaMXbv9HgsXBl9T/xlbik0B9V73Eswp9vyaOfR/Pirj2QsV8myzztb
         7X1kTE/6DDw226gZJBMmU6bEsDnegBFn85/lKTC5iR+uwDLY39L2tV+BlQ+6KYL/AcNt
         hIuesh0IJw3o+bWeFdEayJ8sZuMoi6rg7ma06maYHKutKQtb0I4z8M5LeILCC/HRXD7h
         8UZw==
X-Forwarded-Encrypted: i=1; AJvYcCUdrZ30fgbLXgtEdRhezqjd57mUHMpnkMoAejf97OjFNbdmfAw7esG4IrPn7v16vnYANWmPAEUcdfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzHPObNuiyrGS+eA/3WP2UOaEu/DZYwyEl5CL2Ola10R/di9iB
	kZOM6LI1FPTkekaZtZ7jYmsxIeW54/Nemx206JfmISXNvOqY4l0CFBG9xeD2rn4AWvA=
X-Gm-Gg: ATEYQzz75rVtQ0wZBHoMVNoHwLl/mZ8wOPoe0SjTfIxX4vIVn2zWQct+xgnoCVPwqr3
	/KzhOYx3JkHf6SOrMpJLmztU6NqiE0tJADQCwxTWRNkmbP/qtcRQwGDr85ur+minr4FfzDfsMAU
	odRdR4m0EjT20556WCSsND7wzXnUMQZFREYeqvsbE6d73BnJ4tzIi478uRQt18QMFntsnFiAxTY
	6viI58dtnCHuLf05LcxCx+Rj5uvmKb6kXY21Q/V+neK+lf/EqPp34owN/hsMUG1IAgjXvfjDL/v
	Qchh4X7PFHZE3PX05yIJi2ngCwkm4ZfA6jfFfEd32ogBF2KIq0NJMMwiqdTlq5N8p38tWOOSAVC
	YbOUujiST+ErpBotkFW6JMgjB5FCEKpYNSGYB+WQbtl/IJTUlOQlBxtRofD4SgHZz07wArZfBni
	832qSK0hXC0Hhp1GJ1RPPL8vrGGSP77Zcd97YHcONg0KBjblLj1H9EDhGBWWqF0aufW1aS
X-Received: by 2002:a05:6a00:2e11:b0:81f:50ea:5da1 with SMTP id d2e1a72fcca58-826da8bd871mr16961315b3a.2.1772048423601;
        Wed, 25 Feb 2026 11:40:23 -0800 (PST)
Message-ID: <9dab95ec-f4f0-4e5d-bec7-b773edddb3cd@linaro.org>
Date: Wed, 25 Feb 2026 11:40:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] accel/mshv: Forward-declare mshv_root_hvcall
 structure
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org,
 Magnus Kulke <magnus.kulke@linux.microsoft.com>, Wei Liu <wei.liu@kernel.org>
References: <20260225051303.91614-1-philmd@linaro.org>
 <20260225051303.91614-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260225051303.91614-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philmd@linaro.org,m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,m:magnus.kulke@linux.microsoft.com,m:wei.liu@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierrick.bouvier@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6546919CCB8
X-Rspamd-Action: no action

On 2/24/26 9:13 PM, Philippe Mathieu-Daudé wrote:
> Forward-declare the target-specific mshv_root_hvcall structure
> in order to keep 'system/mshv_int.h' target-agnostic.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/mshv_int.h | 5 ++---
>   accel/mshv/mshv-all.c     | 2 +-
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

