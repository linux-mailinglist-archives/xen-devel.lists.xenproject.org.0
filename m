Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kADeBO2DBGpwLAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:13 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470795348D1
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 16:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1308028.1579566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA84-0005ze-38; Wed, 13 May 2026 14:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1308028.1579566; Wed, 13 May 2026 14:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNA83-0005wk-VO; Wed, 13 May 2026 14:00:03 +0000
Received: by outflank-mailman (input) for mailman id 1308028;
 Wed, 13 May 2026 14:00:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNA82-0005f0-JF
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 14:00:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNA82-00DNJz-01
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 16:00:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0483d8-bab6-0a2a0a5309dd-0a2a4507d6a6-14
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:01 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0483e1-229c-0a2a45070019-d155dd2fd93f-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 16:00:01 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43fe62837baso3577780f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 07:00:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4548ec6cd75sm39586716f8f.16.2026.05.13.07.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2026 07:00:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778680801; x=1779285601; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FYcDpS0ohCmuC4c6r+owxa4nOatQt/GrowgGaH6tQgM=;
        b=YGp5/p1dNJX+48+jejhjviLMiet7eel8vN9EcRk8RlQ/vJ2IYW/i1LnkFYO6ISZPhX
         c3T7aegK+QzkwVjqnuP/kbtfF999zUQXlxkkFyFrPUcRjjLwiGKfzLy2V8YLPhl8AMmV
         isxlY0j6HeHvtX5yu0OAgUB/+dTQAWCxdNXUTUyaNXO/ozR1YCOORWQko1/Gt3ZvBFWm
         Myv1yqQNKW001iS1AF4B8aGy97AG5Az0WpG4jyC007iHk/B5T7pnu8jrowuBMdXO30mY
         Y+CI9ORDGgPGhqnycyCibZsqQHJBvaKqi445euWJ/aYUDiWMOdSaSQnZdL+P5p5mE0/L
         WDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680801; x=1779285601;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FYcDpS0ohCmuC4c6r+owxa4nOatQt/GrowgGaH6tQgM=;
        b=Zw7/uTo0tI1/6tdvp7eAyQdtNTMJ5mzc8+fnyoINQfXBP/R1Hlx6yZk1W1TK3fU6wp
         D9HQxNuFpO5AXpRIXyT7hhUHgE2HJVxHGXCshj1xxA9U37hfExZlCVXYYyLFMqRpJYRQ
         PLSTfL6/cHi1NbCf28wIVM2vZO8PZs7jZ+VZ7GXWmtpo/p4aUZ0aDNLaLB8ubjbHPs58
         CnQhYu2QHicyzCi5B5TO4jk446PVbC+KhEaHeU5l7Q7wDi8sEEL7ob7khAehq3Gp0Z4r
         Yx757kfE14FZ/LixQLE0G6tTaZlJ+nwSgfOfeNmnRHwYh0XFVJd8CuLU0Sh86ggmNKkF
         X9Xg==
X-Gm-Message-State: AOJu0Yx4Ry9s7bzzEV9DMdJpJwoVzY/813QLbR785rhlp/I2kz4TIAh1
	jWUmiNbfWd9YvZrbRXhiiEDcfYY4DJMq6jIq1oyoWwf18TmZALUrhSpWvKG18rBTY//OlLnl2v3
	aK3Y=
X-Gm-Gg: Acq92OFL0Bp2Qnr1fOOUaiu5KuM3aV6sdFYSWQT8t8ddmt5Y+29MbZFaxPt2yNJ8T4Z
	VdC8FeFjyJISJwkGyZ1wCuIVPS5YOWsa1DifwVaqJSv4vXfxA+erEAgVIR5AI9TcHT8Vj4Bv14u
	JwJnLlunsmyCE889kZkW7h4U28Iz9yEaQOKn7TdVucnAJX5eqM2fLKABsYep6OtejJGHxZMwytY
	X98pLDAE7Qb5wQbcBIzhC5KtniVEhiSGgijOcydfZhK+oQeP6LD7h/CKFpWfA42h5UDzC348JV7
	q2L4oE+bgIF9gI+5P/Dapx1a6SkD0PbjV3ONdMVRnEBCV8WY/t3GKtNWC4BQ4N0QeJCVAwWeFJo
	S5smrWtpqhsS3oiSg/njR0Tqu+l9OoxJgg/N1J22Bhw+Lo17oyLroEyWFVq92VEm+hvdxsyhxxX
	TjMuYafA3ez0ATMhyljwNKXagbsnskI4tXVNo9bmcNvE9ga9AJaTeq0L7MzAL64pU1OwFOe1ILz
	vN1BRmGadgdBPU=
X-Received: by 2002:a5d:64e3:0:b0:455:51ee:7afb with SMTP id ffacd0b85a97d-45c5859f1efmr5562569f8f.2.1778680801127;
        Wed, 13 May 2026 07:00:01 -0700 (PDT)
Message-ID: <13ca5f9f-d985-41bf-9c30-afd657dade89@suse.com>
Date: Wed, 13 May 2026 16:00:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 0/2] common: Misra rule 8.3
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778680801-21165C48-6B70E4CA/0/0
X-purgate-type: clean
X-purgate-size: 227
X-Rspamd-Queue-Id: 470795348D1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,gitlab.com:url,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
(covering more than just this)

1: kexec: kexec_crash_save_info() vs Misra C:2012 rule 8.3
2: crypto/rijndael: adjust for Misra C:2012 rule 8.3

Jan

