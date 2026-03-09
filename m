Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEvQBpMJr2lzMQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 18:55:31 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF84723E057
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 18:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249605.1547066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzeoD-0002BA-2N; Mon, 09 Mar 2026 17:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249605.1547066; Mon, 09 Mar 2026 17:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzeoC-00028o-Vs; Mon, 09 Mar 2026 17:54:24 +0000
Received: by outflank-mailman (input) for mailman id 1249605;
 Mon, 09 Mar 2026 17:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9QdD=BJ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1vzeoB-00028d-Ay
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 17:54:23 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fdda7f7b-1be0-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 18:54:17 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso97084755e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Mar 2026 10:54:17 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a8f610sm12732545e9.7.2026.03.09.10.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 10:54:15 -0700 (PDT)
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
X-Inumbo-ID: fdda7f7b-1be0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773078856; x=1773683656; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQpCcbWib06GwrSrjKEgPauEB4pMQNN0BW8pnBJ7+wc=;
        b=AoQPx0vcvC4+N37Al/MmKLSpkhQHr0yf38PVakix4nXGwRE/USQJKX+sNKUJOUSN+2
         QCDg+FSY68xsknyg1x9Eigozv2nkq2TM4p+9ZIfu+RXaJCQEBO5udbUSITPzrG0hS+MN
         DU9+lIX1HOq7d1k85cc4FG9npcFwd/mE/6siZfukQ33F61dZ0ejGFH2kZvJBN9FYHCbQ
         nkPpHIv+Ug7GquchSDwvXOqB0V5iQrxPrsWf/rljNPOQ31EFHeRlb/Uhhk1k3IsK/W5P
         nnqKgfcFUE82gVl1K+o+0V7GjqiXCkHpVyk2MjdXkOB5Zhh9PnSVdDkZedF0Uh93vqt9
         FIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773078857; x=1773683657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQpCcbWib06GwrSrjKEgPauEB4pMQNN0BW8pnBJ7+wc=;
        b=dSA1vSHpotk7tbaRjIOYO9owO5pZ2GLKDAqpFevtbJY6YWIqWoz4Kk6iI6JWxrpFYM
         OF/alj0glpvRHtpuKFHZjVv1Pgzew2EK0YBk0ARdHrsh2IVMOAYKwyRx5NeOyHObGSUI
         g6yfXyy9ijMpF2ETrY4S0m/js0/TKHEbiiuaJKkA7li70J+lc25Y3LNWS39LBSfqEjm7
         6COfruwvd5MXEUC7dyHjD3NAxmwg9TBXERmhN7iVxQpb+2OW5U75acO1+UtrU9wyIy00
         KhEQAHgSVVPYHtEmB3Q5gtDXLR6Gd8rmPAuJk8zzCsJkz42FgNWeKTvCyJvpDL2A18lP
         /EUA==
X-Forwarded-Encrypted: i=1; AJvYcCV4x6qRmex+uYIiZRDo78UvSEOqH+6Gkj/YIzEOKqnpKcCpWlpWYNN9jNKm1HFqCl1m30MT3egdloc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZ4s4xw2xpHpR9AC7HICQmLPNkeg+Td02e8/wzLg8bcpRN4rBR
	Q9yraSpWo39dqgjARtR8NY/z3UxWd5HlLRVajYH4CdZAptFrHkmdA/tWmYA5oAPGhNo=
X-Gm-Gg: ATEYQzxnixMn7PyQ9y6Gbb+j0hOfLi6VyugQ8BEmKHOeZUWXCBL4sOf3/URr1hafEEk
	Cjj8W1Bt1S4p39WvMX0u2X/u7r+Gy+C8mC5wxcCyEr/Bi0wySmZrYvS/3pRhZ0DbEem+Cx/4a3s
	Fj026y8IuPjIYsGQiAn/uTrEeK18V1X0C5pFXJZOeCOHk6RSFqV9TS0AmZxW9ONPY/4ZJN/QrRm
	a/RhVkjqLiqj8PqWQu5HWE5H65xOLgQspkUnjeObVX50AQ3iMwSvhpwH6MqywlpO/6uZSpzRc+G
	M9TT9KHPTR/32o1q/JmzN4jqaiX1TCJ7z6DOK7ROzM99T5E8IlW7aTBw6jPDWGxrvdBDzpskCk+
	0umEwxykafM7XrCtIueYRX+7INQAkBEhti8u9jbikHzn7EgivKeOlb8aCRxWxr6rTJDAiC/P3as
	rlyYivwx3r8k+e8WsDzsYln/MeO0sKtu10ojwTNVDI/1h52O1UaJcFU/F6bGan0PiKtA==
X-Received: by 2002:a05:600c:4445:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-4852690febamr219281285e9.5.1773078856525;
        Mon, 09 Mar 2026 10:54:16 -0700 (PDT)
Message-ID: <80f7ebc0-2ca9-489e-a017-29965a3fa50b@linaro.org>
Date: Mon, 9 Mar 2026 18:54:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] accel: Try to build without target-specific knowledge
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, xen-devel@lists.xenproject.org
References: <20260225051303.91614-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260225051303.91614-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AF84723E057
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:kvm@vger.kernel.org,m:pierrick.bouvier@linaro.org,m:pbonzini@redhat.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[philmd@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 25/2/26 06:12, Philippe Mathieu-Daudé wrote:

> Philippe Mathieu-Daudé (5):
>    accel/kvm: Include missing 'exec/cpu-common.h' header
>    accel/mshv: Forward-declare mshv_root_hvcall structure
>    accel/mshv: Build without target-specific knowledge
>    accel/hvf: Build without target-specific knowledge
>    accel/xen: Build without target-specific knowledge

Series queued, thanks.

