Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ygj2LprtMGpjYwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:30:50 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB168C862
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 08:30:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=dGpfPU2X;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338664.1599696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNJf-0005Zk-SQ; Tue, 16 Jun 2026 06:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338664.1599696; Tue, 16 Jun 2026 06:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZNJf-0005YO-Pg; Tue, 16 Jun 2026 06:30:31 +0000
Received: by outflank-mailman (input) for mailman id 1338664;
 Tue, 16 Jun 2026 06:30:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZNJd-0005YH-UY
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 06:30:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZNJc-00FL6R-K2
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:30:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30ed81-5cb7-0a2a0a5109dd-0a2a4502a83a-24
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:30:28 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a30ed83-af86-0a2a45020019-d1558033d0af-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 08:30:27 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso52563395e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 23:30:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-461abb44c3dsm142837f8f.9.2026.06.15.23.30.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2026 23:30:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1781591427; x=1782196227; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GuJ38IK9EwFymKF6pZK9hlCOwvCYQ/y1c/SgaMdkOFI=;
        b=dGpfPU2XT+dFsa7zSi4DZFXx9kvlVqriXa7agxW0KWtrvr9ApYYWPL8yJocjNHikss
         Ek+94cys6+rn9lS29QmX6p9/e9O9tBy/kw6Wcc77CMmgPQEClzyggszU4ioXlox9NLO0
         Ty8brGzo7YK3Rf8iySdV1ITOdCkwwFRUBE7oim7ZMEpCtRL+MMT8ycl2/iUn3b/RsAe/
         bzrY7+0OXs37hZFHKm02rCPm4Ay+THIjV44K0X9fpp/2vmYKd3QBQGbH/W3EoZ0x3+ww
         4yUtPP3GxcDp3cfE6NUi0afO0wEDwPS4pIhzwLe22k+arE/why+FVy+JkWdhd8OsQeja
         trHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781591427; x=1782196227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuJ38IK9EwFymKF6pZK9hlCOwvCYQ/y1c/SgaMdkOFI=;
        b=lIBnKWSBBm7DMpx+3FaeBgQGgdqKaXavHbycbmr+AT+Y7wD1hfligSuDCzZ3o+YHu+
         06ZFGHy5jo9mB9WJh+ufO2ObiSOQN6GooWhJpIUsndVDuXm91alFRe2gxusYfky50ccr
         fYHNJEJn7psPNr4xM7BSLxNOWF3wUzUUdiZbl3ulXeJZAXKSxO/MJm+1enJIeBxENF9I
         1nHAyZnSd5ZVvfLpS7hEWWKwEs0+CrorFhqXVNcSYfZ8nY8BxX3y73njkCyUtNsKWV4n
         ZUr5R9BzVnjp1At/16kL2k6yC92FfNxit2jADeub0z0/KHPCbyqwcm846yyKIc4ZQ7FD
         Og4g==
X-Gm-Message-State: AOJu0YwsPdFQJQlaYjJl6+ONT76OvfANaqt/uTQuXUY3iuPdtSZ8TsMK
	TSyXImVY6YZSJen9ufUy6jeK+VdQWRY8u5eICFhXybkis5dI2gH7cAZ/ujwJeFSQAiDUjFnSfP/
	6Mns=
X-Gm-Gg: Acq92OHtU9W8PpUqnzKkpaINyJ0kANcE4nHycLig6zcK+lj2FUwVECNdsQxDj0XOF9Z
	Fh2O4Mz8q3USM/pf8C2stpGVLovk5oKDyqhfl6DS1RKcKDQOnx+kQKcal3mPQ1DQOiAehFsLiYQ
	IjZjQMAD/SzjCaTBLz9qaAO+LJNC+DHmWW0f66bqdXDMK0R4UY7zbkIDTe9GZYDk+QIE4CAfsK2
	Dsebo0Wa0Wz0cN6frUVhYSYnO4BNp3+/lDUozYsQtMT6tD0eK6xX2Bw/Bsr2XI4X45ce8f8C7dd
	QqNtVvfyqYfmnh0pGwRfLK2IkOSYpJmaYqAxmYVHkqdqzcUkz/ePYx35YYE6DInerMH9O7YhOPL
	Rk2571rR4R4QE6+0a5yOBDMxyrdDmqEUNWcN4nzMXsfFjBiQDPPpCv6elxXTOBm7aXPEdXIVYO2
	U4/sg4cQMHTWU6CwgwZZ5SDz0H9GU4km4jqF1b3EfG16g7ZrBlLoxRjweteE4mZ4HWgsyIxjruy
	gx+gUaw+yyGs14=
X-Received: by 2002:a05:600c:34c9:b0:492:1e50:978d with SMTP id 5b1f17b1804b1-492200838bemr190504895e9.16.1781591427241;
        Mon, 15 Jun 2026 23:30:27 -0700 (PDT)
Message-ID: <1fbb67ab-09f3-4924-b6aa-139fc5d1acc7@suse.com>
Date: Tue, 16 Jun 2026 08:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "xen/cpufreq: fix usages of align_timer() in the
 on-demand governor"
To: Jason Andryuk <jason.andryuk@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20260615193944.19392-1-jason.andryuk@amd.com>
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
In-Reply-To: <20260615193944.19392-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1781591427-80145161-51CAE332/0/0
X-purgate-type: clean
X-purgate-size: 2165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 11FB168C862

On 15.06.2026 21:39, Jason Andryuk wrote:
> The original commit showed a ~6% regression in a benchmark.  The call to
> align_timer(firsttick, period) rounds firsttick up to the next mutiple
> of the period, if firsttick % period != 0:
> 
> align_timer(0, period)          -> 0
> align_timer(1, period)          -> period
> align_timer(period, period)     -> period
> align_timer(period + 1, period) -> 2 * period
> 
> So adding the period (sampling_rate) before calling align_timer() will
> in most cases incease the expiration to 2 * period (sampling_rate) (the
> exception being firsttick % period == 0).  This longer timer slows the
> reaction time of the algorithm.
> 
> This reverts commit a0ed5bcfbeee81c91c574ad484faa057054eaf09.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> This is backported in stable trees and should be reverted there as well
> (found in 4.20.3).
> 
> A Fixes seems superfluous and not normally used with a revert, but if
> needed:
> Fixes: a0ed5bcfbeee ("xen/cpufreq: fix usages of align_timer() in the on-demand governor")

If "git grep" is intended to (also) find such straight reverts by merely
matching "Fixes: ", I think the tag should still be put there.

Talking of Fixes: tags - the original change had two of them, so there
must have been a problem? Or, Roger, was this purely an observation from
looking the the code?

> --- a/xen/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
> @@ -185,8 +185,7 @@ static void cf_check do_dbs_timer(void *dbs)
>      dbs_check_cpu(dbs_info);
>  
>      set_timer(&per_cpu(dbs_timer, dbs_info->cpu),
> -              align_timer(NOW() + dbs_tuners_ins.sampling_rate,
> -                          dbs_tuners_ins.sampling_rate));
> +            align_timer(NOW() , dbs_tuners_ins.sampling_rate));
>  }

As much as I understand you wanting to have things simple by doing a
straight revert, imo the formatting flaws better wouldn't be introduced
again. If I ended up committing this, I'd very likely take the liberty
of doing so. Yet before ack-ing the question above needs answering.

Jan

