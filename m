Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIWAFIWBy2kKIgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:10:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F51365D31
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 10:10:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268596.1557834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UBB-00020i-Fy; Tue, 31 Mar 2026 08:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268596.1557834; Tue, 31 Mar 2026 08:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7UBB-0001yP-D9; Tue, 31 Mar 2026 08:10:29 +0000
Received: by outflank-mailman (input) for mailman id 1268596;
 Tue, 31 Mar 2026 08:10:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7UBA-0001yJ-8l
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 08:10:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7UB8-00E7Gv-2y
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 10:10:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb816d-2eae-0a2a0a5409dd-0a2a4505eb4e-48
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:10:27 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb8173-5aeb-0a2a45050019-d155dd2cd8cd-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 10:10:27 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-43cfce3a195so1145071f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 01:10:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21f173dsm28782924f8f.15.2026.03.31.01.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 01:10:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1774944627; x=1775549427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zavHZ64gGJLvkBKJjtgezSK0/rl3jKjwmCPlWT6kZ14=;
        b=BRz8NSV8wVL6pTBt3QvcGZoEyCv4Hh7QaUg8NlJ7EwjIY53QcgIWZ0DUUZcdi6Wo43
         WVuLcmLhus0B/skA5ZZXRah0MucodWz9k42aBIAn5CAEVn5yK+L3uvjU68kY16RA1N6L
         rcT9mj4Cp9NsL8ZunmtpAxO35OMcbUIwQYoqKK6O1ID2VR05oATPu8Z1VZPUfV4hrgEF
         K2UxXoXhMt9F2+/wElOgqIlUUKcb+wMfYfIw4isVohD7yfealSTinx2tZ2josQ9Vb3VV
         C9fnHDc+1khwqbx7rCGdgqqk38oMaVlmoYdWhLYbYqVeNJ+2cP7Da543mh0hZ92eZJUi
         wkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774944627; x=1775549427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zavHZ64gGJLvkBKJjtgezSK0/rl3jKjwmCPlWT6kZ14=;
        b=H+fK+HCvozMIr9+41MIawqqJpulh40oB96EKMVuNDY1pmOTaGt5k5FQxtQ9alXWNxM
         a0QrvUKBlTvBOvTClpbLpZF5Wc3Xew6bX0uw0qFTwuI4FnUQWc/rQjWbrBS36YptE99S
         N8w0/3UGqqty68cGwXI11i3kNHXqqkw9OBs+3dNhcG5bGa4MFH+o/eBPMQiLlJG67Iu/
         V7NOIcwPUb0hKqIE04ydLA8UsOGgUWTaFQRXAm70NEWIcYLxB+x8D9WY6+hdVwIAgcPf
         jEo7HA2hhx7UGULii4i+zD4XWDKR2WbZGlxEampTcaVgLnXPR/VmD7ASLGHhMgiUSRV+
         m9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUJwO78gqPaSTNJ7l87aNcrkSPsGGKpZdV+wHg8ZWae2fHWFtvnGSxh/SF555mL6eE0mi7gowi4xOI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJPmXW9q/ajpnFu9gQzow8kWmLonEnLrmA6ef1Y7XogKB+Lrkp
	XqgD+GBA1JNz8rNyqs30Qr7WrMxr7izkAZ5vjrwSqv/z2I0f92kxuxWgFqcsHrH62Q==
X-Gm-Gg: ATEYQzw+XU3C8T1jdWI8IFfULBz4cKa1hFFXedy4wa4JeoccXo8qykZ0ySaUs/uQ98M
	V8r04ROPZswb8yVLTaF+b+DzaX0s7cOhU/u5jP4DiNXNaf4sTXHMNajqFZ1w2pvxY8JwAUuFGry
	Dhf4b644Eutt+UmNMyN9E63SX7Vg8LNXUIgqcIK9CvCtYNeUFYCggKccaBIT59T7/a7pSywupo/
	jEh2zohxxmWU7T0NCQUj6MBiU9nGtGMMPZeyuuZ4ty8yEQLhSs1JnPSEpJHBBaKRPZkQ4Ul/nec
	d+BD/v77sFq6ARaRdKF0exMNulo8baU6s5/n4qNkV1mt0bp+mxy5Me9Ba7CtntXi6DyBZqTNLRW
	v6WnCYvxxgOTgJ6YhjikkOZE3Ij0xCp6OtXg/DLVihI6T9PMAwJL36pWYG4KTal3m1+Pv0NjhSi
	GUik7ararJdLtsYaxQaAppp9Bw+GWHQgqQiWZ5Uxr5lewwZ3kU8D/eL6rwL+nJMToJiZV7HHvM+
	tJunM9ZOaDwUy4=
X-Received: by 2002:a05:6000:310d:b0:43d:262:c97b with SMTP id ffacd0b85a97d-43d0262ca87mr9450947f8f.41.1774944627011;
        Tue, 31 Mar 2026 01:10:27 -0700 (PDT)
Message-ID: <5b1e5de7-b2b0-4dae-bbe6-03809637d239@suse.com>
Date: Tue, 31 Mar 2026 10:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/sched: rtds: prevent extratime priority_level
 wraparound
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Dario Faggioli <dfaggioli@suse.com>, George Dunlap <gwd@xenproject.org>,
 Juergen Gross <jgross@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <b6e65a9fb94d581a31e1d06b241522c17a7863cc.1774943670.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1774944627-20A97488-C72123EA/0/0
X-purgate-type: clean
X-purgate-size: 888
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email];
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
X-Rspamd-Queue-Id: A7F51365D31
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 09:54, Oleksii Moisieiev wrote:
> In RTDS, burn_budget() increments priority_level for extratime units
> whenever cur_budget is exhausted. As priority_level is unsigned and was
> unbounded, it could eventually overflow to 0.
> 
> A wrapped value of 0 is the highest RTDS priority, so an extratime unit
> could unexpectedly regain top priority and preempt units with active
> real-time reservations, violating EDF intent.
> 
> Fix this by saturating priority_level at RTDS_MAX_PRIORITY_LEVEL instead
> of incrementing unconditionally. Budget refill semantics are unchanged.
> 
> Normal behavior is unchanged. Once saturated, priority_level remains at
> the lowest priority until the next period update resets it.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

From the description, this looks to want to have a Fixes: tag added.

Jan

