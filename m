Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HC3DqbscWk/ZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F3647A2
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:23:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210553.1522201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqui-0004CW-Hk; Thu, 22 Jan 2026 09:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210553.1522201; Thu, 22 Jan 2026 09:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viqui-0004C0-9P; Thu, 22 Jan 2026 09:23:40 +0000
Received: by outflank-mailman (input) for mailman id 1210553;
 Thu, 22 Jan 2026 09:23:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1viquh-0004Bu-QE
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:23:39 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07994dce-f774-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:23:36 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so446912f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:23:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356997df75sm43672878f8f.29.2026.01.22.01.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:23:35 -0800 (PST)
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
X-Inumbo-ID: 07994dce-f774-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769073816; x=1769678616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xWzwu8aKaM9lAYfK0GbQBSQtYNB+KIXFdUJh9rrO2fU=;
        b=GlGlakpt+mQMETDBa19oBCIEgxmqXO4SV48RFY5/EWdQKI1vp5s+B5s2PM4RkbbJzX
         BQEnF8qkKUVKttlovw7/YlMkHI5HULLPiJ/Ud5tUmMj7L+tOvg8EwT1sGGZm8NM4K34t
         n5NDujvf5S2Ymc6LyFwHeXPpI5106v2MwcGZeLG+rpTcATFD5zoIWAeTQyKzM1iT+Ipj
         1RYDWZrpQY8H25u9GH7SlVAeBE0jZL3GWWQ65PsPhrPhxDXRiEDQzKflD05NZ/i2Tga/
         t3ndkBbbmY9fbNQ/x+FRJFjbkR9Jflh0ofsdfkVoqLgb5Ndw8uTVhiZApFLid+WvWjJW
         8yrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073816; x=1769678616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWzwu8aKaM9lAYfK0GbQBSQtYNB+KIXFdUJh9rrO2fU=;
        b=WTyxieJaUzA8Y1537N7C2Z8c21ooeFDpZyFlGwDPV9cnsO4zBbc3JB1/X27QrAGL1E
         eL0ptfb5/bU70w/aq9o9vhs5iikvY0yxkmkbSxwpw6k4YHZy/puvpDzsi8Yo8zphD9Rr
         FAef8FPwa7+RiFz1FlkCutfXZP4DMOtzHpNLlDRdeP7QNrBHO5QLVwbcWRoaxYJu7OtO
         bKf43TXD5aK42/zgsEc6rXaabH07/fP2GwMkGfaKAR7CN5jfOrsyTvL0uMADap/8g+b6
         mUa2Dt7ik9FAQULA3XYwuY41MejMEUnf/leyMJB43NhBEeVklYq1Mzl5dWvQLufE5kgM
         spkQ==
X-Gm-Message-State: AOJu0Yxmu7e4l06inLY1CvoumRGTeMosmvjDmM6A5FilAL/CJa0+vncc
	rftEFnzC8hTHAwPyAWEQRoDn7YFtwsgeTSN+Wq15h3RPDFgawBBiZEP6Kc/WGMnb6Q==
X-Gm-Gg: AZuq6aLex11cmhq+8sDmZe5vQCVk5m9r6EeL26O4JLecHKpnQnE9DwO8vunKC9TyljY
	udM4tjj1SNGIoV6QsAmVHLCMUnaWdhqRVinRSXn/e3N9OyQ34H050eN4dRQrvIz9UnQUxr/xOoN
	Qegf/QuycVmk+kD6NchU08ENaHZuVq3k08MGXJDhVcUr+CCE1bm+CJ+0teCP7VetL7l7Nhu6rcg
	V2H2p3V37qyxhMxWOvMga4sK96eq7+L6xBcH+3X1aSCaIjleIOsFNV8LsGBQQ/7O/meEnIZk0OU
	uk1B4y9BfIXG712QNealvpK8/FLyp824pGU+HutdfNHqLSac5v1Wc1fgB1W6s2QXs8buzGlQsWu
	iLW0F3q/XW7RWigj+dhhD6RM6jiLZ7ehRYiD0ubH9kdGgsOK/Ulz5RRz1vC6DZmjRXHrSM6hZKN
	oeTR01FOyRQzjbQ6Yp40ZydS3hC4a3LRUB2Qh0j2HadxNl1Zu0ZXX3H+iRdX3QFm9cxEXv+DF5G
	Elsm/CFoQQMCg==
X-Received: by 2002:a05:6000:4021:b0:430:f1e8:ed86 with SMTP id ffacd0b85a97d-43569972babmr29203280f8f.4.1769073815951;
        Thu, 22 Jan 2026 01:23:35 -0800 (PST)
Message-ID: <48cd047d-4043-4879-b4e8-84a08ab786ef@suse.com>
Date: Thu, 22 Jan 2026 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] x86/HPET: drop "long timeout" handling from
 reprogram_hpet_evt_channel()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
 <54dbc592-93a6-47bb-9304-14addd41610f@suse.com> <aXHnybJfOmuyA3vK@Mac.lan>
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
In-Reply-To: <aXHnybJfOmuyA3vK@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,citrix.com:email];
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
X-Rspamd-Queue-Id: 959F3647A2
X-Rspamd-Action: no action

On 22.01.2026 10:03, Roger Pau Monné wrote:
> On Mon, Nov 17, 2025 at 03:39:03PM +0100, Jan Beulich wrote:
>> Neither caller passes STIME_MAX, so (bogusly) handling the case isn't
>> necessary.
>>
>> "Bogusly" because with 32-bit counters, writing 0 means on average half
>> the wrapping period until an interrupt would be raised, while of course
>> in extreme cases an interrupt would be raised almost right away.
>>
>> Amends: aa42fc0e9cd9 ("cpuidle: remove hpet access in hpet_broadcast_exit")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/arch/x86/hpet.c
>> +++ b/xen/arch/x86/hpet.c
>> @@ -162,13 +162,6 @@ static int reprogram_hpet_evt_channel(
>>  
>>      ch->next_event = expire;
>>  
>> -    if ( expire == STIME_MAX )
>> -    {
>> -        /* We assume it will take a long time for the timer to wrap. */
>> -        hpet_write32(0, HPET_Tn_CMP(ch->idx));
>> -        return 0;
>> -    }
> 
> I wouldn't mind if you replaced this with an ASSERT(expire != STIME_MAX);

Hmm, yes, can do.

Jan

