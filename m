Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E00BDB599D8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 16:27:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124693.1466943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWeX-0006VK-VC; Tue, 16 Sep 2025 14:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124693.1466943; Tue, 16 Sep 2025 14:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyWeX-0006Sy-RW; Tue, 16 Sep 2025 14:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1124693;
 Tue, 16 Sep 2025 14:27:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KURy=33=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uyWeW-0006Ss-Sr
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 14:27:28 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d867ba-9309-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 16:27:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ec44b601b8so806013f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 07:27:23 -0700 (PDT)
Received: from [172.20.3.155] ([12.157.112.82])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7761af2e09dsm12303109b3a.76.2025.09.16.07.27.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 07:27:22 -0700 (PDT)
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
X-Inumbo-ID: 42d867ba-9309-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758032843; x=1758637643; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3aHQVorPOxvsoXCkZqV0/Enf6ycaWx6Ys4jGKOncfg=;
        b=Z6FMObJLUxsA7z3fEDfU3NO4QK0LvcOjZN3alRhw9OTfcf0dN5OCusvynn+Mr0OFdi
         lSVoiPT+9BmhPA0lSkPV+GaMrBd9mAFNoWBG6VDpBIB+zgUPSHzi29CjVOyd70MiR0BM
         goC0aHA89qHUanW4q6sO4tnFtlpmWdwLM13xQkgHsUZBIu4/5dSHc6BxcgKI/pF29N0x
         iDmwvU8ROsRxwql29gzNxlcIMd515m5PeTF1vu1nIhsTlW8O7Ff0ixg5aIAafQO135Xf
         lvct+sqOxDkZ/mZ/QglKooPfI+0M7TKzeJLcsa1GjEvYXMsgwr3VjMBT3in7Jqvi+0Lc
         3Y9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758032843; x=1758637643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3aHQVorPOxvsoXCkZqV0/Enf6ycaWx6Ys4jGKOncfg=;
        b=EKmrN71oAjICjtqyBTiH61IYm0gSJPtk1qVAe+0zapaJF1llnUZfHbMx6exTYAOhKK
         z86LDqO6ls0WpA0iMTt4+8FbQtBexHfabuFtte3cSa1xs5yW5uJGGeY5DrpOHXbc/PYE
         40H47K0vFP+Fqhz4/vIb4p6U14aEUyFHJmOrVJepTvbZBVfiDCw9jnbpnnlEEG23Wyao
         JBOX2ejZwa3u7ZLGyi/MuddFAz6kmM0AHe/AFsHqFmsg9Yv0gyTcYvEd8lrij6x1iXwc
         9NBlZm5whS+hMX4JZxhOYvJM1o1/vcAOuyDx6g4wA6FXCF4o3bbzPCQVm+p0uP6iACL/
         P2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVr4Fy0hTMTKYAuiiQ9ThhR+DkNjY8dAerUgCPJh9xaS41iXEZwyrECZTRfpYUMjXOucYyhFdR2w58=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyeo6yONVVLgizRojMGqCQuC55qeYWaiMqD7ixIigZZXP0g0xWa
	/6SVClWlempljUQ9W+gFbWOlwyYJZ96UVVU+ujK+dAzgk/chDbjHRVnAuvK0b6Sv1w==
X-Gm-Gg: ASbGncvBCOnf7YAE73+WxFU7OVSJckPiB/nKQCN1VtNXSqzlpb08rwTlS7B5WyqVGoG
	eGXNoPYwZkLAnkkRa70uP7Aq4tR/A5iA9aww8rWCSaS7r60clLHiwJZ6JwdT2Pd4VwKVfdxyJPz
	rI7EPpFh4kzxI5GSnWiAJSvFhtwOm/1HZhCqsrUp7SWnHhl7oESSYm1idQBes8//jv4CKz9TvQk
	nQs7ytJjSe79E/KprthFuf9qpaE5S8CqRs7w393tRvmKrlGCOC6eU28ZbHbo4q8y/YXS2501+c9
	5F+1NEFBjMl7tG07L5dPKfeQedpVb6UfcM0gweokYy0UTS3EFjACSS2quR5J+sFCIwXQzY7EqDZ
	uPQku0pg136mBZNihxYzlHUScCDImDXE=
X-Google-Smtp-Source: AGHT+IEqh7XdLTvBtcjdD3jkGU4Agh/KA8GAx2ZYB1F7zD+JpEXb2viNHJyn6I5HZ+lAvbVa424t9w==
X-Received: by 2002:a05:6000:178e:b0:3e3:f332:7414 with SMTP id ffacd0b85a97d-3e765a08455mr12944810f8f.58.1758032842865;
        Tue, 16 Sep 2025 07:27:22 -0700 (PDT)
Message-ID: <b20b152d-cc51-491a-ac2b-148ece34efd4@suse.com>
Date: Tue, 16 Sep 2025 16:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misra: add deviation of Rule 2.1 for BUG() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0adc0a8f75cb88b0b26d38289d1dd5823386290d.1758024454.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.09.2025 14:45, Dmytro Prokopchuk1 wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -98,6 +98,23 @@ Deviations related to MISRA C:2012 Rules:
>         even when debug-only assertions like `ASSERT_UNREACHABLE()` are removed.
>       - ECLAIR has been configured to ignore those statements.
>  
> +   * - R2.1
> +     - In the specific build configuration (when the config CONFIG_ACPI is not
> +       defined) the 'BUG()' macro is intentionally used in the 'prepare_acpi()'
> +       function in the header file 'xen/arch/arm/include/asm/domain_build.h'
> +       defined as 'static inline' to trigger a runtime error if ACPI-related
> +       features are used incorrectly.
> +     - Tagged as `deliberate` for ECLAIR.

I response to me outlining a deviation-less alternative you tried it out
and said it works. Then why is the deviation still being put in place?

> +   * - R2.1
> +     - In the specific build configuration (when the config CONFIG_HAS_ITS is not
> +       defined) the 'BUG()' macro is intentionally used in the 'gicv3_do_LPI()'
> +       and 'gicv3_its_setup_collection()' functions defined as 'static inline'
> +       in the header file 'xen/arch/arm/include/asm/gic_v3_its.h' to catch and
> +       prevent any unintended execution of code that should only run when ITS is
> +       available.
> +     - Tagged as `deliberate` for ECLAIR.

Taking both together and considering that really, when we no longer limit
Misra checking to specific configurations, we are going to have many more
of such "problems", I fear this way of deviating them simply doesn't scale.
Imo this needs a SAF-style deviation that can be applied without needing to
add a new section of text every time.

Jan

