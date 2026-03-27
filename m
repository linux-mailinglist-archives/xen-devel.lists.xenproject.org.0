Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIcrNJhtxmmkJwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:44:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F196343B04
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:44:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265464.1556376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65bn-0005gH-1w; Fri, 27 Mar 2026 11:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265464.1556376; Fri, 27 Mar 2026 11:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65bm-0005dN-Uz; Fri, 27 Mar 2026 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 1265464;
 Fri, 27 Mar 2026 11:44:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w65bm-0005dH-1Z
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:44:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w65bl-005qDP-Dy
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:44:09 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c66d72-2eae-0a2a0a5409dd-0a2a4507856e-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:44:08 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c66d88-fd74-0a2a45070019-d1558029cdaf-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:44:08 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-486fda2a389so16268135e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 04:44:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c65dc4sm96601185e9.3.2026.03.27.04.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 04:44:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1774611848; x=1775216648; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oxKrPsI2eDkIy3KL0s9SZz26jzr0u5XOd3U130luGgU=;
        b=Io1ORe+HOaLjYAeq8zWXVHFSK6Rs1OUctX9fawUT9LbS0NuJCgEadIHRypsrTMvknS
         HzC1lhjqh6FvwszDchkcNLa6oIE7nGWY2WkiXVoqYKHC2r/16VUvUwkhLlzNXsNiAv54
         W/ZiG8FA5x647wz6vVKZi73BUffh3FdMVttRavbgzpppwAQQzxoxhwCZvvZEEe3A+lyW
         BE1KUyNP9XXaJIhpayITKJ7XcmerVSJWEZA1m/EkH7Iau2YWuRuH6nFMdE3C8MwG9xsb
         cuGnhJkM9KluWEXwAleWzRqbtDmuItr6frP+D/TZVHtcZdlSWR92b23Skul10bxX6CRB
         PCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611848; x=1775216648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oxKrPsI2eDkIy3KL0s9SZz26jzr0u5XOd3U130luGgU=;
        b=Y2ZcCGRBfKYweTOV+b1knR1zqWRUrZFcMODQQ4qwFFLzuisjIwZBIK0ibbTVe89h0F
         LFpnAK4u3tahhBdZtYksLd520R+adBtxz1xMHy7z5m6LJxcJNo8QsDbb93ycUMrhFSZ4
         G2wLJ40vYXWa38ClHHeseqSFg7JQsvm1lrC4thecvYCuz6e8m32NoidbrO1AsU7lY+qp
         +3/lM7ACHR2fSuX8++Fos0q111v/ISOIet6KimYBDPkOsOij1XpyEyqkH72xJb5+HwMD
         e6DpkWRpsmkvjVnJKeiFBDvaxOpP6Td6OnIdIhii9IS+i0+TMufMXNGZhV3zaMleKxx8
         XdAg==
X-Forwarded-Encrypted: i=1; AJvYcCU3NGN0DW0uDO0eObEosJFn8sHnM0L0ZVStxtBBxB5VZI21y2brqgC/6GhbtflTib0S/TEqM0hzLQs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxHHrqYcdoj3/4LACZl/t6DbsIr4vW0Inr20/kl7KQB3AnMONa
	W0ponBbfb9siOBB724EBj85FnKz361k0eQb0rWGtQztYA2W6e1feNZCCrDP92zwRoGokOtmXPNF
	zYcSE1A==
X-Gm-Gg: ATEYQzxpv8wMBkYyMhqM/AK9TLRS7uZBl7Iw//G1TNOkPU1o9GJrmcxbgB0rxbeHvfJ
	2qYASqSjeOwW2BGWe8xIhSpJ3KO8waJ678yAJ6nOd4cg6aObt1FD/Oq6aLOnl0/U1oged7Y2KEN
	hyJREI/mEyqyO/BhOvkwoQJ34XcoOXdXIbB+RQLhUBg0I54Kb3dUkb0fSSNJbIljD929ST66j7J
	j3cY3IDBbmv/wp29/m1725kKQdtS89GAOnYK62g3w6p8T9CZvcWES2gIHFksR0xXXKk+Dvs5Pj+
	J+Hsw8cy2wj4+a7ehIlpXnFVrVi36hib4hpvSAMDUTg9o24M/S8JNmptak8g5vBFGjgTmNvlbEZ
	T/t+BEqTcJ5+z+LQaUUzAu3ohQHWKt6vTulKA5R9/wDSVaiLdjCM/qxqFgcgf6WXlahqm6Hcbm4
	ovpaO3X77e4zvHkFgw/7S6/RwENCXbZt2Sb7CYkhhOcV728ScTXb+KP8SsszKQS98JePDOQyoN7
	zMhPwCZuKodPyj2JPlHR2r7KQ==
X-Received: by 2002:a05:600c:450a:b0:485:5981:1423 with SMTP id 5b1f17b1804b1-48727d67a16mr32560905e9.3.1774611848009;
        Fri, 27 Mar 2026 04:44:08 -0700 (PDT)
Message-ID: <c2fe5809-0e23-43c5-876b-6cc3a41e3d92@suse.com>
Date: Fri, 27 Mar 2026 12:44:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/sched: validate RTDS putinfo period and budget
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <06fbc96288c6aba60369914c2cdbc656ca32fcf8.1774611038.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1774611848-4E6AF303-5CEA6736/0/0
X-purgate-type: clean
X-purgate-size: 1477
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:dfaggioli@suse.com,m:gwd@xenproject.org,m:jgross@suse.com,m:mengxu@cis.upenn.edu,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,epam.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F196343B04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 12:31, Oleksii Moisieiev wrote:
> The RTDS domain-wide XEN_DOMCTL_SCHEDOP_putinfo path only checks for
> zero values before applying period and budget to all vCPUs in the
> domain.
> 
> This is weaker than the per-vCPU XEN_DOMCTL_SCHEDOP_putvcpuinfo path,
> which already rejects values below the minimum, above the maximum, and
> cases where budget exceeds period.
> 
> Use the same validation rules for putinfo as for putvcpuinfo, so
> invalid domain-wide updates are rejected with -EINVAL instead of being
> applied inconsistently.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> Changes in v3:
> - changed rt_validate_params input to get struct instead of
> period and budget
> - improved code readability
> 
> Changes in v2:
> - introduce rt_validate_params helper function to check period and budget
> 
>  xen/common/sched/rt.c | 37 ++++++++++++++++++++++++-------------
>  1 file changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index 7b1f64a779..c161bf7f78 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1362,6 +1362,23 @@ out:
>      unit_schedule_unlock_irq(lock, unit);
>  }
>  
> +static int
> +rt_validate_params(struct xen_domctl_sched_rtds *rtds,

Since you only read from that struct, pointer-to-const please. Can likely
be adjusted while committing if no other need for a v4 arises.

Jan

