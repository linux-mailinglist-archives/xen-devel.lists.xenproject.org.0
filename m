Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJekD0hc12kCNAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:59:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE673C75D7
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 09:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276761.1562085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkHY-0004DY-Nm; Thu, 09 Apr 2026 07:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276761.1562085; Thu, 09 Apr 2026 07:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAkHY-0004BS-Kd; Thu, 09 Apr 2026 07:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1276761;
 Thu, 09 Apr 2026 07:58:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAkHX-0004As-It
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 07:58:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAkHW-004XTq-VN
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 09:58:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d75c16-5cb7-0a2a0a5109dd-0a2a450bde08-42
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:58:30 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d75c26-bca8-0a2a450b0019-d1558029e0ed-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 09:58:30 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so8282835e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 00:58:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ccfbbb7fsm29755565e9.0.2026.04.09.00.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 00:58:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1775721510; x=1776326310; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q1X4cwP96GL4JxfESvU/b8wpEscDe3VPj2Leviv73Gc=;
        b=Rx/Y2VAH28zQUuxi9UGK+D/Shd0k6f8Yh1W3al7ms3wd2wdTgCGf4QLD0sm5JxwN0h
         RwhJU8HW32IvC4Ef2DLiHTbQm4/43qMWp4uMF5BhBY232oR4gci+6vf7+BtSe1XBMF87
         Wpi6lQIflOwX8esf5Yd5TAm3EqBhNoaATL12NW7Op3a+WdOY7n1fA3dPTlTmBDWuMSfr
         5BjR5Hv8o6UsSZ7JBFXpSl6DvMb2GT6LznEHY6GDigt2lzO8kMPXAgnMg3l1jRWbpHaS
         xAaRg4cDyNzo5bpK1nGxPe0/RpV4vSwSVaovRyQHvYBWrCp+sb1MA3IgDtb8S692ZHpI
         V55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775721510; x=1776326310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1X4cwP96GL4JxfESvU/b8wpEscDe3VPj2Leviv73Gc=;
        b=O+ylm+tFOqsQQwwKK0qZ/+/2L/vtw2QMmW7WHw/AauMFiClXkv7f2UHLn0xS0JaZzA
         d4boYA1eN+6ar0XXVLX9hbvi63d/8su2+XkiFZS0z1J5pxlYJFaKmed/9nJA86o6bGkQ
         nvoqQ/9EHJaM5OA4mhV+71o61EgN24pt8SWmhKfAQPFAd/ay8No56DWz0NW4i2koJrtz
         u84Vx7gwXhD51mLvVWtrmkBr8+HFqhO8mhFxdLYLAlCbrvZRDxBwKvrkzG0xdReKu72R
         iCMm7FP/gBYvkuYxcfHA9I6Fq6pfvCTll2FJjr5ee1Hi1VCcL8N+XfRQOMHO3DVc7fXG
         W2QA==
X-Gm-Message-State: AOJu0YxfRIXtMbDYrAr7Tvb0nm3dplQuVL/9OEoh7xcN2GmGRSrA84Rp
	ESFm4EEeivvYytAeSrsqF7Y0+Ug19Q2TFsaoR4+WSGQM3YxCMDBHgpzZqSLiXIupHw==
X-Gm-Gg: AeBDiet1PlbLKEfzBPrW+A4pNxDnyPWoN4z8iTNkwyI/H3iU9aC7LeyhFR7hpJTWC99
	A7cZp7I7vPxwRoDTrI2k4eFRyvIwHBzDCm1DzYckBekzVEDM4SrtkeS/RTcaL+rEIde9Bhh4/Iw
	dPHcFlJ48HHNpVQR8AoGRGRGW1JLIW31Gd0kry/M40BhLg5inTFTovHL1UEwomdxKqXQ5RgKhYw
	T4stx1qZ5J6lTjDimbUQvl1zS3we5r/DzmHDlB0S6XN2cA2JqpyjqSpBjeCKCDEzxuO/V0znf4k
	O0xtxHoqKraXaxFWUVEHFuotW5aWW2krL5RVomfo86S/mt1ujxRwA1zdiS1m9iqhYL6ncMgju02
	Be4lLr+QnZrsmynQtfsjgKWAqGhquoCU8xoo2aFqciv/Xzfm6VVx6E8b10c/LyiuYzKp995epG/
	1EvwbP9qsFk5yGAjL6yqqqAI4BLtwH1AVp5hfBTlHob01qylJHKexs7PV2R157ibMorrJ+eaJxg
	jyNQUbi+ZpnlX4=
X-Received: by 2002:a05:600c:5292:b0:488:8c89:cfaa with SMTP id 5b1f17b1804b1-488996b021fmr370621505e9.3.1775721510273;
        Thu, 09 Apr 2026 00:58:30 -0700 (PDT)
Message-ID: <17abf692-2b49-4f34-b09d-31e6a1741550@suse.com>
Date: Thu, 9 Apr 2026 09:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] make ioremap_attr() common
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <145299a0-b25c-4612-82c6-9401a2f88ad2@suse.com>
 <72526f3a-726a-4a1e-8d80-1a336175c1af@suse.com>
 <addasqowkczVjsE4@macbook.local>
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
In-Reply-To: <addasqowkczVjsE4@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1775721510-EED4F2A1-8C47931F/0/0
X-purgate-type: clean
X-purgate-size: 1387
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,wdc.com,gmail.com,arm.com,epam.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CAE673C75D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 09:52, Roger Pau Monné wrote:
> On Wed, Apr 08, 2026 at 02:07:23PM +0200, Jan Beulich wrote:
>> This core backing function is uniform; what varies across architectures
>> are the attributes passed and hence the wrappers around it. Yet of course
>> extra checking or special handling may be needed per arch, so introduce a
>> suitable hook.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Just looked at the common and x86 bits, both LGTM.

I'll transcribe this into

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com> # x86, common

>> ---
>> Declarations (or inline counterparts) aren't being moved around, to avoid
>> the need to touch source files using the functions. Quite possibly they
>> want to consistently go into xen/io.h and asm/io.h.
>>
>> Of course ioremap.c could also go into lib/.
> 
> Maybe I'm missing the point, but what's the benefit for it to go into
> lib/?  Is there any realistic scenario where we might have a
> functional hypervisor build that doesn't require ioremap?

Well, the difference likely is between "in principle" vs "in practice". In
principle a lot of code could really be regarded "library" like. In practice
whether to put code in lib/ really matters for stuff which may only be
needed in certain configurations.

Jan

