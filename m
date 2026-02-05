Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGimFNFlhGkh2wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 10:41:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B2F0F05
	for <lists+xen-devel@lfdr.de>; Thu, 05 Feb 2026 10:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1221690.1529865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvqr-0006YQ-Ti; Thu, 05 Feb 2026 09:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1221690.1529865; Thu, 05 Feb 2026 09:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnvqr-0006Ve-Qh; Thu, 05 Feb 2026 09:40:41 +0000
Received: by outflank-mailman (input) for mailman id 1221690;
 Thu, 05 Feb 2026 09:40:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DyEx=AJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vnvqq-0006VY-NI
 for xen-devel@lists.xenproject.org; Thu, 05 Feb 2026 09:40:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bac970dd-0276-11f1-b161-2bf370ae4941;
 Thu, 05 Feb 2026 10:40:39 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4806f80cac9so4089525e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 01:40:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483179d7346sm58058815e9.0.2026.02.05.01.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 01:40:37 -0800 (PST)
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
X-Inumbo-ID: bac970dd-0276-11f1-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770284438; x=1770889238; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4WNcCuYvwijHXkoR0zyLqapDQwNFn30PTvEA3LI1yao=;
        b=WB1MpHmlDs/NKKk4KtNaqRKEBqxi1PMAsvLX7XdXGTYJAzUdu0L59ECcQEbIW+GCn1
         dxJJQjmyUsr673BdKm2a7lfLrgVi0FfDQz5N4VtwBZoLCO5dmoM0I/pR8PsaBzjAYXtQ
         tMZQu7iYdxXavyD0fb41qYqt/94kQhvd47lMWdhVjy0ekbmIqT3RgO1EWN8dWsmPNLP3
         6TEb+Pl6yAHROBDKZ7VROAgJuWtCMeImJxXRVXUfAqKVU7W4r/Msiz5h34AWWut6PXcU
         KBrVCmgmTKZssOn+cmB6mueFkHSzTq6WzZF7X66o0otKN2FiwHrdDR8ExugLBjZE0DY3
         oZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770284438; x=1770889238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WNcCuYvwijHXkoR0zyLqapDQwNFn30PTvEA3LI1yao=;
        b=vvouowSypPg0Wpz4VdeMpdOjz26ICJslpVx1mwCZOn+xyJwZxHVVwZ5Jyf/sW1b8sS
         0YFJAXF0kYpf0pT1Lt2si5NRtNk6udcZpYwDhKgI7UmNfJ9+NOZ70Z/YB0NfQEJEFA1K
         qnNuO1/3u9H1ZzwkfsTgmJPXe0g3jp9uP/8+K+ReDVkLWRMMBlRqmxijuhq8m/BzGRWd
         CprH+0EXS1WU13wXdf7g5bxnARkhlA41ys13plCWRN3vCqht4xxp80ijfqUIFNmatYAV
         bdJ1t2EwiZpqB1byCWncDXB00NHcV1Fsf+gyvKOYI53UqtVFvFYZeujosaptp4S0yldp
         RnrA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JNb7XIInqD5UoeJKucguw13cvwU1oVJJmDC5q5td5DzFdK/S8NJlL8YdpnCTIuowAzNiLQtPvwc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyr48XrRENnOGvOz13mSKtmPIp6qVsn0eD8Dnj7eSaIEpzyrP1r
	sPMJd3p4EnTHMOko8LvvVYUeTzvNxe4OmZ6Lic15imFKLsc2fWPw9H4ywLF2EJOtUw==
X-Gm-Gg: AZuq6aLPBIgTDfEaxEu3l+H24gkyLXvs68dL1xme5XGS1oXUVDUGBBqWxnvj+yOGoqZ
	XCUvByWXLZ0lXkGkosq0jZ7qAj44EZnoAZ74o2vQQ0qaaOYDvTX74GOi8/unZvVZdUe5fsLxgdF
	3S3ebMPIpZYJX3MZSc5qlhqzZx6QgrNyqbv2u0297TEPxUP4i8bz42Xa+uzWXyjU9wJ4yqO2gB5
	7DuYBHYcu7YYmT2t0OQCJBYsRT+oJIrnG5SyCQ4e+obje2bZpkFsjVmpb/sXwNZtL4dyn7H7P6E
	B0Te84hf4CMlwB2osdNLlFWr5SuczUKnWeNomk2da8xTs2gYal0mBqb/yAB8J+soerZbP6cm+7F
	NiwfZDhQb/aZBbQBD2H3sgKC1pn+ymOd2O+Z2kV2SgqgARnFRFFWCzwOU4ny/Bs0/xgpcZe859v
	AugcUNGftljtsIWqhJLb9n+OnLTAJb5pJGjLfzXCxZxRtEv/75xyjoDxMy0gJkRnH9s8UjF8WbE
	2E=
X-Received: by 2002:a05:600c:5250:b0:477:b734:8c41 with SMTP id 5b1f17b1804b1-4830e924044mr89181225e9.1.1770284438342;
        Thu, 05 Feb 2026 01:40:38 -0800 (PST)
Message-ID: <ae9b6edb-1df6-438d-8e46-37995f330d69@suse.com>
Date: Thu, 5 Feb 2026 10:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] xen/mm: limit non-scrubbed allocations to a
 specific order
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260130145726.85907-1-roger.pau@citrix.com>
 <20260130145726.85907-5-roger.pau@citrix.com>
 <2c2b6189-9404-4378-a101-3a93cbadee43@suse.com> <aYNvEpxAqkJPfGF6@Mac.lan>
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
In-Reply-To: <aYNvEpxAqkJPfGF6@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AA8B2F0F05
X-Rspamd-Action: no action

On 04.02.2026 17:08, Roger Pau Monné wrote:
> On Tue, Feb 03, 2026 at 04:00:09PM +0100, Jan Beulich wrote:
>> On 30.01.2026 15:57, Roger Pau Monne wrote:
>>> @@ -1117,6 +1130,14 @@ static struct page_info *alloc_heap_pages(
>>>                      scrub_one_page(&pg[i], cold);
>>>  
>>>                  dirty_cnt++;
>>> +
>>> +                /*
>>> +                 * Use SYS_STATE_smp_boot explicitly; ahead of that state
>>> +                 * interrupts are disabled.
>>> +                 */
>>> +                if ( system_state == SYS_STATE_smp_boot &&
>>> +                     !(dirty_cnt & 0xff) )
>>> +                    process_pending_softirqs();
>>>              }
>>>              else
>>>                  check_one_page(&pg[i]);
>>
>> Coming back to this, I see two possible issues. One is that on x86 enabling
>> of IRQs happens a bit earlier than setting of SYS_STATE_smp_boot. Maybe this
>> isn't really a problem right now, but it could become one if the "wrong"
>> thing is inserted into that window in __start_xen().
> 
> Even if IRQs are enabled a bit earlier, the watchdog is only setup
> after SYS_STATE_smp_boot state is set.

Hmm, yes. Adjustments like this, otoh, shouldn't primarily be to silence the
watchdog, but to address overly long delays that might trigger it. I.e. they
might (generally: would) be as relevant without the watchdog actually being
active.

>> The other is that only x86 actually ever sets that state.
> 
> TBH we have never seen the watchdog triggering during initial domain
> creation, so the workaround added here was out of caution.  There's a
> certain amount of contention required for the watchdog to trigger, and
> that scenario doesn't happen during boot, as domain creation is
> serialized.

It is right now, but really both dom0less and hyperlaunch could benefit from
parallelization.

> I could maybe gate the softirq processing as:
> 
>                 if ( system_state < SYS_STATE_active && local_irq_enabled() &&
>                      !(dirty_cnt & 0xff) )
>                     process_pending_softirqs();

Yes please.

> Or completely avoid softirq processing in alloc_heap_pages().

Rather not, imo.

Jan

