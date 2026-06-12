Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MAU8KEPRK2p+FgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:28:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA6B678449
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:28:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="FlVuP1/l";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1336438.1598200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyAz-0001vV-PD; Fri, 12 Jun 2026 09:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336438.1598200; Fri, 12 Jun 2026 09:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXyAz-0001u8-MU; Fri, 12 Jun 2026 09:27:45 +0000
Received: by outflank-mailman (input) for mailman id 1336438;
 Fri, 12 Jun 2026 09:27:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wXyAy-0001u2-3Z
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:27:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXyAu-009dgL-TH
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:27:40 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bd106-bab6-0a2a0a5309dd-0a2a4507a650-28
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:27:40 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2bd10c-229c-0a2a45070019-d155dd2eed6c-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:27:40 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-45eeba68948so555974f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 02:27:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea843d63sm51441555e9.12.2026.06.12.02.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jun 2026 02:27:39 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781256460; x=1781861260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UuqefO+BCmkHbDRWiT+tgDlqdP5xX1r/enShExC4NfQ=;
        b=FlVuP1/lKV49OWbvs2XtUHPudgL/J3M7znKPyZjxhF361U4yRc1XsWGLiwSp21bMjt
         tXBHnVBZVLtpymRfh/rrtZ6NcuQFd7wJbfx3sJnpHD+SF11PAP4dVjH72KyZ+TTbYkvD
         Dubw6ssNRN5l+KX654YiaKKKOzu/BP0xv1q0lMxCt1Omd0Wyai4IOnF5Jwj1ZDQWqTTi
         /pFTD+FW0+npApnnJQW+gwUT9qg4fUMjkQ4PU+0EMJBg6Zlhk4ZBLPLleVOBXcH9HyhR
         mZAFx6biGOpSYoa1R0taMRWfcr5SzGfhutuagy8lrdsjnCoSsAPCrnLnL6O4CVe9rO1A
         UXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256460; x=1781861260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UuqefO+BCmkHbDRWiT+tgDlqdP5xX1r/enShExC4NfQ=;
        b=W7PJPU66/BZFzlja7lwY0tSaMo03fZAUle6IYzFlb6kN+JwarhQWw+ttuGqV332c0l
         gMeML8JTFvqTu8xgrb9ORC7+pgingVocvigd2uGJMAsniQMHvw6REEhwCa/4lNfldDJD
         JbQ7ACjTIHSRQGumvkyfPfjAZM+14i3REKTM5wAp213RaXwCnrM3Ws1MCdAdiGLYyp5l
         iaPMw6rrRL6bmKnTqGxJAnosdO3fvJ2+Gx+c3726TXVQpzK13i/xnknx4HODYI2ZT8bx
         GG608kzwI/3/W238TXBo2ZCVl4sLyl685mIVQAJIWA/0/QU5SXIj8N/NSwufAbT5pzsi
         VVDw==
X-Forwarded-Encrypted: i=1; AFNElJ8IAYPDJSjn8N9KaF78P0AEoZyH72M6+QLZe3mTSlQQ0WxOeFL22T40csxNlPEyzx4y2omaRqwP5xA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJsIirC2ZZY/mruG0G3qKnPbPuyRel9QCAkP2VwEQKc4LYq8wS
	x2uPKINUoaFLMVXnwkFZlv0YcIqsWZBwKTgdiE4Y/76+NAVAF26PQFc1uqsJiewObg==
X-Gm-Gg: Acq92OHkc7eeBxESUDGu4UHyL+mo988RNvcriF9rGhi0sHUN802wf5lQzu4MKBERCSs
	5N4LxcjVcXqSXXt0IlRXPjc5Yk21Z7sYOtAwvKeSmPbxS45yB05uBK2hRr/PU6ifIYEoilbpE67
	3ldfz76SZUJkj00QF7tYL0YI0Lkmn3stzpZOJR/1RLs14cCIVA+J6w0TJdYp0Af9E7aC6gedFzu
	vGVLpoH5sn8+d5Jk4D6QMBue2smALUFD0XB97J6Sxoun5xVJFg05K0g74gkg1tpXKV1QD92ZpYE
	H2xzWXd95SauWr9ORB6mi2OwRWoFp8XpQNGupe0suI+/PULY7nEe4vAfyvqXvDqacOlkFfYyMVT
	JgUe87mF9rdsFsmZkWZaX8ZoADWBxGURt7wTJSfL4ahrE+i3zUeGsvY0WJlllHkJ9wOtrsgvc5h
	ZLrqTJMCS/qsvjM4CUQ1f5miPuqaZjyZSIE/bDjX0waaPtYEvk+edH0fGNvb8q+NiE2y3U7TW5e
	nuf9QlsyUoP7r8=
X-Received: by 2002:a05:600c:3145:b0:490:be44:32ea with SMTP id 5b1f17b1804b1-490ec4a16b9mr24529325e9.7.1781256460151;
        Fri, 12 Jun 2026 02:27:40 -0700 (PDT)
Message-ID: <93904b00-6e26-49c4-be8f-e7d8aed8e590@suse.com>
Date: Fri, 12 Jun 2026 11:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3] xen/x86: Change stub page allocation/free
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleskii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20260612082213.82235-1-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20260612082213.82235-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781256460-22772C48-5AC7B3D2/0/0
X-purgate-type: clean
X-purgate-size: 1798
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,amd.com,citrix.com,vates.tech,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:oleksii.kurochko@gmail.com,m:jason.andryuk@amd.com,m:andrew.cooper3@citrix.com,m:teddy.astie@vates.tech,m:oleskii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,m:oleskiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0DA6B678449

On 12.06.2026 10:22, Roger Pau Monne wrote:
> From: Jason Andryuk <jason.andryuk@amd.com>
> 
> Today the inline tracking of the stub page is problematic.  0xcc is used to
> indicate unused, but it is also a "clear value."  A !CONFIG_PV build or
> when running with FRED support will not populate the LSTAR/CSTAR stubs at
> CPU bringup.  If a CPU is then offlined, the stubs page will be freed as
> its content will be all 0xcc, regardless of the stubs page still begin
> referenced by other CPUs.
> 
> The new approach uses a global, CPU-indexed dynamically allocated array of
> stub addresses.  However, to handle NUMA aware allocations, we cannot
> allocate all the memory in advance because of the NUMA dependency.  Take
> advantage of the fact that Xen will attempt to contiguously pack CPUs on
> the same NUMA node (see normalise_cpu_order()), and on CPU bringup use the
> same stubs page the previous CPU did if suitable.  Note the code would
> still function properly even if CPUs from NUMA nodes are not contiguously
> packed, it just consumes more memory.
> 
> stub pages are no longer freed.  They remain referenced in the global

Nit: Didn't you mean to s/stub/Stub/ as per Andrew's comment?

> CPU-indexed array and are re-used if the CPU is re-onlined.
> 
> The stubs array doesn't have an explicit lock.  During boot it's accessed
> single threaded.  During runtime, &cpu_add_remove_lock serializes access.
> 
> Fixes: 7a66ac8d1633 ("x86: move syscall trampolines off the stack")
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Tested-by: Jason Andryuk <jason.andryuk@amd.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

