Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHRyE2UKnGkj/QMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:05:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710D0172EE7
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 09:05:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238462.1540066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuQwT-0000xQ-QR; Mon, 23 Feb 2026 08:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238462.1540066; Mon, 23 Feb 2026 08:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuQwT-0000uN-Nk; Mon, 23 Feb 2026 08:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1238462;
 Mon, 23 Feb 2026 08:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuQwS-0000uH-8M
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 08:05:20 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 620c3d5f-108e-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 09:05:14 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-48375f10628so24590355e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 00:05:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31c56d8sm375008745e9.8.2026.02.23.00.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 00:05:13 -0800 (PST)
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
X-Inumbo-ID: 620c3d5f-108e-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771833914; x=1772438714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aqnHhoDWy61G6LWkBcsQk2zH3mQGxjYNnQGF48GkKOw=;
        b=EJmut0Q9bESOkcIDQ+WZF0AWhiPh2NAi13m8jJq4yeTWYchVS8uwbuhbgsvJZr5aHl
         IbkXyKYDSHdQK6/D2vFgriR/cJLVE9zbX4SITSBnd6QiO8pFo280ns4aEEGw0IQzFwys
         v9eOwGcbeN2DLajQtsOurkNqU1r4xUmuNDYY41hC8VloqQB6BqomjJKXLZYzHBShILpK
         4kR5o+bMqmy3tT5egsJJHsZfbrG/+QMFL92ck+EblLlhfsJwvxjLUs2Miei68ViOTOoT
         Pa3/K+dMwZT4Fq2TOVh3ZwcwdLz/kGLvnsawkh5Nnugd1hpm1qBYqYp8Xcw//6sUBbOm
         TxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771833914; x=1772438714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqnHhoDWy61G6LWkBcsQk2zH3mQGxjYNnQGF48GkKOw=;
        b=LqUOuf57MOclF9YP2S3ktJU5g30nfxhLpyZHhVWb+jOX7CbFGkdDw2AAp9HmyShbCq
         t1lYHL2dKcYO1hN7iUBT36lPVDNXfBcajD13d7d+8udqt9m0WYvy2pT8/ct/If4X3A4J
         PUbkqdhi5KmRMJL5Gxg4qWcUwjNPeba2mCMieMPBm+kft6eBihLuKNu7sLBuF6U4+9Se
         fl0tsuvK9qk8EuHFGFkxEE3lSorEKQ7JCdxDV+iTRRuZvGksSWxLJGNoYPsCPqxTLPXP
         3pg6WyExE45ty8ICd30NgFEzZooJHyr2Q9xGPXAKbuIjkkHl19v+7YmZMJ2eWIcxauyw
         k0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUBJ4lFQougzGWbLA1gFRLNuSqSBhW6AngIGaRrNOIHZ3KJKWmvKp+d1mx7IUnQNK8vbnTLpN+4c6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw17mn5vjvDG2Jent7gmFqEcrIcKFeni30OOwPEv0NDhByX+vpR
	iO1tx+HYkwF71tLwO3Y9zlfrXEp7awm+Ma/GCMTOHBOU2AwBWM44nDVf6sU2zxuKEw==
X-Gm-Gg: AZuq6aJte7mUQ6B1L2gI52zFTAHIA8qdJbMekiJ9ynVEmT99Ga/J734JOHEOWK7IsuA
	fyLaH9Q4a5CdCWHnmkGi1qFlAEbEJPenLs51LtUbsMnbpKa6BafUOLwxZl1puRhlytP3YZodemj
	fXjtHqDBLBapxKOrsaA5HwcYyF66QTDdIasX0wPYiJf/vAQEX+Mx673D+Ko5J1d9yIIJgnCCBlW
	ZtqLU0W0KCztj2MD3ubufKUYXkhGRWFz0Ibx6g+0fTPOqay9gC2QADgApmWv+AgdNSwmFNC2eA0
	NsDAfSICgqfGqfWkcnPk9c9VOJQXX15ohaVHJoG1/wePCWzP7QFGsc16JiLwaQ7WNrWrJcSiYMx
	o+zofPy1/HUOQ3S0YVh7OEcuD5UA/b5gsRdg/tTiYt0CzCw+8Zlv3Zjo2upjarjL+iTC8ig1xt8
	ss7z/f2cAFS5BgbMUc20+C9viGlYQIJOHu+hI25tnFtC801dHQP3hdty8zCVg3y7NBa1S3Iw6ho
	Ay+oMkdMTlcCTcJUZqM0z0luA==
X-Received: by 2002:a05:600c:8b2c:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483a95e24ebmr150343315e9.16.1771833913526;
        Mon, 23 Feb 2026 00:05:13 -0800 (PST)
Message-ID: <340104fc-7c31-42e6-aec3-4fda0f527aa6@suse.com>
Date: Mon, 23 Feb 2026 09:05:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: don't use #if in macro invocations
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <23951625-939c-4658-8146-84c1f12381d0@suse.com>
 <24e8dd35-114d-4ba8-aa92-dad7cbcbd37b@citrix.com>
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
In-Reply-To: <24e8dd35-114d-4ba8-aa92-dad7cbcbd37b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 710D0172EE7
X-Rspamd-Action: no action

On 20.02.2026 16:29, Andrew Cooper wrote:
> On 18/02/2026 9:03 am, Jan Beulich wrote:
>> As per the standard this is UB, i.e. we're building on a defacto extension
>> in the compilers we use. Misra C:2012 rule 20.6 disallows this altogether,
>> though. Use helper always-inline functions instead.
>>
>> In sh_audit_l1_table(), along with reducing the scope of "gfn", which now
>> isn't used anymore by the if() side of the conditional, also reduce the
>> scope of two other adjacent variables.
>>
>> For audit_magic() note that both which parameters are needed and what
>> their types are is attributed to AUDIT_FAIL() accessing variables which
>> aren't passed as arguments to it.
>>
>> No functional change intended. Of course codegen does change with this,
>> first and foremost in register allocation.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I included this patch on an interim branch of other MISRA fixes of mine
> to get a run.
> 
> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/13198988953
> 
> There's one more violation still to fix:
> 
>     if ( unlikely((level == 1)
>                   && sh_mfn_is_a_page_table(target_mfn)
> #if (SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC )
>                   /* Unless the page is out of sync and the guest is
>                      writing to it. */
>                   && !(mfn_oos_may_write(target_mfn)
>                        && (ft == ft_demand_write))
> #endif /* OOS */
>                   ) )
>         sflags &= ~_PAGE_RW;
> 
> 
> 
> I also looked at this one previously.  Making mfn_oos_may_write()
> visible outside of SHOPT_OUT_OF_SYNC is quite invasive.

We could simply add a stub returning constant true for the !OOS case.

> Here, I suggest dropping the unlikely() as the easiest fix.  It's almost
> certainly useless anyway.

Especially when used around an && expression.

I may want to go a little further there, if already we need to touch this,
combining the two adjacent "level == 1" checks:

    if ( level == 1 )
    {
        /* Protect guest page tables. */
        if ( unlikely(sh_mfn_is_a_page_table(target_mfn))
#if SHADOW_OPTIMIZATIONS & SHOPT_OUT_OF_SYNC
             /*
              * Unless the page is out of sync and the guest is writing to it.
              */
             && (ft != ft_demand_write || !mfn_oos_may_write(target_mfn))
#endif /* OOS */
           )
            sflags &= ~_PAGE_RW;

        /*
         * paging_mode_log_dirty support
         *
         * Only allow the guest write access to a page a) on a demand fault,
         * or b) if the page is already marked as dirty.
         *
         * (We handle log-dirty entirely inside the shadow code, without using
         * the p2m_ram_logdirty p2m type: only HAP uses that.)
         */
        if ( unlikely(paging_mode_log_dirty(d)) && !mmio_mfn )
        {
            if ( ft & FETCH_TYPE_WRITE )
                paging_mark_dirty(d, target_mfn);
            else if ( (sflags & _PAGE_RW) &&
                      !paging_mfn_is_dirty(d, target_mfn) )
                sflags &= ~_PAGE_RW;
        }
    }

Thoughts?

The two different ways of checking for "guest is writing" also look somewhat
unhelpful. But there's yet another "ft & FETCH_TYPE_WRITE" elsewhere, so it
may want to be a separate patch to switch to uniformly comparing against
ft_demand_write.

Jan

