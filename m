Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBReFOPtcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:29:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B719E64875
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210575.1522221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqzp-0005aW-93; Thu, 22 Jan 2026 09:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210575.1522221; Thu, 22 Jan 2026 09:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqzp-0005YE-54; Thu, 22 Jan 2026 09:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1210575;
 Thu, 22 Jan 2026 09:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viqzo-0005Xp-0S
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:28:56 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c531a3f6-f774-11f0-b15e-2bf370ae4941;
 Thu, 22 Jan 2026 10:28:54 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso6443975e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:28:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480497035cdsm15214865e9.19.2026.01.22.01.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:28:53 -0800 (PST)
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
X-Inumbo-ID: c531a3f6-f774-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769074134; x=1769678934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wc9AqtrxitJ6rxcMDvLhYEG147LWguTFiQKngD4K1x8=;
        b=DvT3JK25okfaLpn3w2iy+eawBLrrgG84QKgEu0SIahaa4s/K/PZ/vgZ1du0PLnDF1/
         auVI/l7tLp1lNLSIxCU4q7DbNGDXNmlo+ws+gOmHGYkM0PT5u0nM0jydHYxAgsFGcH94
         qHI8Vgrxr2sphxS0uvOV0WYIY5hbwS4xEkMe9ZwoKU+y2UkhdHVfettbRdsWblULiVqf
         Wc9UEaPW7wWH4N70taWkCyUEiGOozB/q3V/ou/Et8LPYSUq+ry/+eUM2x/XVovZIcOVH
         4lTBPk1An7qiDhMN+4a8l9KBxRsagSR69HFELlkq8i0PI9kD25brHvQnr1AiKh5/4BTk
         ccHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074134; x=1769678934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wc9AqtrxitJ6rxcMDvLhYEG147LWguTFiQKngD4K1x8=;
        b=UKr+6E3xJ4CjrTWcRImOcZyUKxObnmuvmcyS7/ZllzFvdmHpCVLpOb195AWd2s9jnJ
         WjsbgYmycglInMv/cB1kyJRYYwA40ug/cdUijUdBcATEXNuTj47iLPruXQJi+aTCCL4T
         gEHp5HN7t9dl6gmU5slq69t9LePJjqymONwqU9C2FZUZvRRt1da0rwBwuovfdkC9dPfn
         u9fK34H3tHG7wthHaWrsYqONwcQCGD7V6Gk9A0emEgs6KoHA8taNlSndg3qfJSCVWMIq
         hPmHvQa5J3f+XpUwUaBmiLXeVtcjq4xhQoYZrOQ24rRmGwwt++bukg5gbVFQ9WCAYC16
         lnbw==
X-Gm-Message-State: AOJu0YwzvOjAv4ZNzH8N9ufhu6HlPBigNIFYsWlzFJm1ZJQLxJ6YxRq9
	/tdT3jfZeabZR6nbqIuYOfVw/zW2Bq0LFDW+Mmd4UxC5juHN4ZlRYQrzntuhqRMCnQ==
X-Gm-Gg: AZuq6aJVRB6jZMj0tf8Ie6Xx5w9Hpqf/q9JiLNyDAoUA1DRXfCJexfwn2FgeIh2Zyu1
	fBbttT7ITJhCqNcDgEI/XgvGfW6RudKexmEQYYMefeDmDOPv2qA1s94uuyBJuTiQ94pKoEHk2ey
	EfgFvpnPvERbTTbEEgeXuqVAkjzhUMRubFhnWLWuMc+QHPKM1hZ8Hn3G6bkFKOWOurhXET00dss
	WqmnW1ofoqeUcu1qCeUTwCDbLxQ0RAV28L2mtWBQJNPpmZUCtpgJJLsOBkx4CtA9GplEhHhX5CR
	f/lvHLN/IVxJu0UcegUIai//dxC09tJ39YOii48kK8KWRU1Wnvst0Yb3hT+xl1BUoJXmxkjEqXg
	TAFdtNweDU/C+ufpuMyCHZDgYc9MAaMbmQqPZKeDbi8fPUoNoPrll1GBJKlUc4yV45l1OPskWm1
	Buorlv7a0eCapgu909MLRPkWrlG9eOz7vWGlHxkY7uJSyH5amk0VUJQPM3gJCcvx9whDN7Ocl3R
	rM=
X-Received: by 2002:a05:600c:1d1d:b0:480:39ad:3b7c with SMTP id 5b1f17b1804b1-4803bdb88bcmr164470225e9.16.1769074133950;
        Thu, 22 Jan 2026 01:28:53 -0800 (PST)
Message-ID: <f87d523c-def4-408f-9626-a268c636e582@suse.com>
Date: Thu, 22 Jan 2026 10:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
 reprogram_hpet_evt_channel()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com> <aXHrgwifS3PDzdfa@Mac.lan>
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
In-Reply-To: <aXHrgwifS3PDzdfa@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: B719E64875
X-Rspamd-Action: no action

On 22.01.2026 10:18, Roger Pau Monné wrote:
> On Mon, Nov 17, 2025 at 03:39:30PM +0100, Jan Beulich wrote:
>> When this was added, the log message was updated correctly, but the zero
>> case was needlessly checked separately: hpet_broadcast_enter() had a zero
>> check added at the same time, while handle_hpet_broadcast() can't possibly
>> pass 0 here anyway.
>>
>> Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Similar to the previous commit, I wonder whether it would make sense
> to add an ASSERT_UNREACHABLE() if that error path is not reachable
> given the logic in the callers.

That would mean

    if ( unlikely(expire < 0) )
    {
        printk(KERN_DEBUG "reprogram: expire <= 0\n");
        return -ETIME;
    }

    if ( unlikely(expire == 0) )
    {
        ASSERT_UNREACHABLE();
        return -ETIME;
    }

which I fear I don't like (for going too far). Even

    if ( unlikely(expire <= 0) )
    {
        printk(KERN_DEBUG "reprogram: expire <= 0\n");
        ASSERT(expire);
        return -ETIME;
    }

I'd be uncertain about, as that needlessly gives 0 a meaning that isn't
required anymore in this function.

Jan

