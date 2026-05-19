Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKuGJjUtDGq0XwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:28:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC357B495
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 11:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312650.1582726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGkE-00045J-6g; Tue, 19 May 2026 09:28:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312650.1582726; Tue, 19 May 2026 09:28:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGkE-00042t-1c; Tue, 19 May 2026 09:28:10 +0000
Received: by outflank-mailman (input) for mailman id 1312650;
 Tue, 19 May 2026 09:28:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPGkD-00042a-4h
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:28:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGkC-00Cpd9-G8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:28:08 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c2d13-2eae-0a2a0a5409dd-0a2a4501930a-48
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:28:08 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0c2d27-c1f2-0a2a45010019-d1558033ec05-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:28:08 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso40611415e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 02:28:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8344asm533486555e9.1.2026.05.19.02.28.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 02:28:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1779182887; x=1779787687; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mcsPspDxsi13i8i+IwJlm9w9vaVz+tt+6JNJITaFXjE=;
        b=WHTmudBHgddk5z51b9X6Iy58H6EWNvob1dFVIuCeuPAvHCxEYUeqLairVtDmZsZ4UD
         fUnwRwsGZ1n//rtYVPQxFiZkSs8oZL0Xw8gwL19ygRDw8djhIvHgYVKtG4aqu5HFbtU3
         XuMG2rIW8OXFXJuDTTnxeL8srn9f5g3pFXUVO1iwJWDmsUrwf5YLsUViMJcL1v0lQXM7
         Ch9g8yQuReNTmEfE7QRVG4kCLqHZLPOAJ8+2khSXg/74izGcBbArHd5nSbRnWt1H4EtV
         nYPCMvSs3zTZHet6fFvqaRoXbdG+VfHHjF9xMrwqtquZ7Wab44FHl6pj2tNIgM6DMq5h
         UU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779182887; x=1779787687;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcsPspDxsi13i8i+IwJlm9w9vaVz+tt+6JNJITaFXjE=;
        b=XZmWlBtcRdUKh4PPNVF5RqsQok8GLQDZyCCgs+gC/unfKjDPMOang8aNgb+zy/gIoK
         xCvgPBCfGyHQsMLiM9VooZwbHSQWROMHJzqvJsb79uENaq8M+Fcvhh4aRgme7x35GB2b
         M2JKnIk9FUbjKxzmW2ul/gqzbNNhCL9ZTFU2AfaBQjnH+iJ1ukyUt2TaVBRjhUBV1SXa
         09uy9+YjU1+mVLiRBOmiOn0BqiXjBK/QN9+s/l6mQF2eLTI94hSwjNfppIfQvsryo8qy
         eP6TPyafPKqL6aX/N8zaHOWwJm0tVLjkqFHzTntxi89eIEm0BIHwWH0KQYwd4EJ9CXvK
         ZEGA==
X-Forwarded-Encrypted: i=1; AFNElJ9mCuqmsNdqfZOSy41DoFy9W5jp5+vGnF/hti9AbbvtIlz9EhYVwu0wXkXIVcpGciwXCaLRvYiGZws=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz4sNsbSh2OXZ+dpJsUpDGEAw1W8A89UUFw/mbJ5GFjwnfE7zlc
	BB+jKBGvIZDlPZXPArp3sX7S4QFHvUjI0NdQiJkP2Kinrpoma4BWUZdWgz8RVZlhaA==
X-Gm-Gg: Acq92OEpBnQ4f5CXftvUDUGHU9k4LPhgjv9EQldO/uilavfntan0AKXPaKKm8ITeiE0
	qRdLV7xZKJEGaiJ3RHX9JTFuVoOclrlC16MjPfUuQsTm31DP1ACSIlK/4GgJL39wDzsZbp4dfyu
	ITZJjngzGOjcnsPLxFBw4Y+3a/QqAre2UWhRh+qoWNOcIy0bCSwSY0WA5xKnp6tFzJPHksIiast
	i8SrGKUIkHNDoRi4SYWitFFJo4C8i4/9tU0v/KYTLA69rO8NZVx4/NVo2ZdTzlg3SuPqeY4U+M0
	1CJvIenTG8QWeoT8eT//rDiz8idwvoY4TX3lPyp5tlLmkCSyDYv22qdyF2iLTlujRsV2gpJ7qPS
	tvjKAfyZYewygicZlyiSh4GdgvkWRUIH7A3ZBANA0MNs4BHUGnWD5uQ5ZKnn1SHPHv2G+fjPHUs
	bwYTCJwv2LcNz8KjFFLvZQq9CPAOoeREw2sPjprIPVy+xou1ANQ8EVOSJxqB+wver+LaE9EBY0u
	8sqM6I4sXR4aps=
X-Received: by 2002:a05:600c:c086:b0:48a:563c:c8c5 with SMTP id 5b1f17b1804b1-48fe60eabddmr212967335e9.8.1779182887615;
        Tue, 19 May 2026 02:28:07 -0700 (PDT)
Message-ID: <5f8850b7-11db-4d78-8353-6e0580bd397b@suse.com>
Date: Tue, 19 May 2026 11:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: fix switch_stack_and_jump()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <1ac102874c8f7190ea09787a035692b03e4b46cf.1779179301.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1779182888-AE143FF4-9F3BE07F/0/0
X-purgate-type: clean
X-purgate-size: 1193
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:baptiste.le-duc@vates.tech,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,wdc.com,gmail.com,citrix.com,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2BAC357B495
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.05.2026 10:39, Oleksii Kurochko wrote:
> The following compilation issue occurs when UBSAN related stuff is enabled:
> prelink.o: in function `smp_processor_id':
>   /build/xen/./arch/riscv/include/asm/current.h:46:(.init.text+0x274e2):
>   relocation truncated to fit: R_RISCV_JAL against `init_done'
> make[2]: *** [arch/riscv/Makefile:45: xen-syms] Error 1

There's no init_done() as of yet.

> The switch_stack_and_jump macro uses "j " #fn which assembles to
> JAL x0, init_done is a RISC-V J-type instruction with only ±1MB range.
> 
> Without UBSAN, .init.text is small enough that init_done (which lives in
> .text, not .init.text) is within 1MB of the JAL. With UBSAN enabled, all
> the instrumentation calls bloat .init.text well past 1MB, so init_done
> is now >1MB away from the JAL. The linker tries to truncate the 20-bit
> J-type offset and fails.

.init.text is well below 64k right now. Are you telling us that it grows
by more than a factor of 16 when UBSAN is enabled? IOW while the change
may indeed be needed, I question this explanation. .text growth may matter
as well, and e.g. .rodata (living between both sections) might also grow.

Jan

