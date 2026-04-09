Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APYvG5dN12lpMQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 08:56:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C29EF3C6C3F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 08:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276690.1562022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjIU-0000sP-KO; Thu, 09 Apr 2026 06:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276690.1562022; Thu, 09 Apr 2026 06:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAjIU-0000qd-Hi; Thu, 09 Apr 2026 06:55:26 +0000
Received: by outflank-mailman (input) for mailman id 1276690;
 Thu, 09 Apr 2026 06:55:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAjIS-0000qX-Kv
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 06:55:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAjIR-000Op8-Dg
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 08:55:23 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d74d51-bab6-0a2a0a5309dd-0a2a4505b5cc-40
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:55:23 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d74d5a-3760-0a2a45050019-d155802ced3f-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 08:55:22 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-488afb0427eso7179375e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 23:55:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488cfa75ae2sm55728395e9.14.2026.04.08.23.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 23:55:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1775717722; x=1776322522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=77RYlQihBFJrEyN2OYCeqoLNl5MjmqFfyuopBe97xrw=;
        b=dyDNVqxQUj//RRSkpoe8KWAcufL3FZ+moX5wPLXqOMcAHICPxBzTwFnPQ4AvvKF2GL
         DhXc2D/dgWVzb0sCrcw4GApvUNHaCRAW1S5s24gMVdC+l1L3C5lKDNU1aM7+mdH3Bu0x
         mzdqxiZ3/yhQcgxMy5gsg+oqVSWV5uxVQJDEKJyeWGhQQTK2PqmQkrBakGNIyzad2Grh
         3zJL1UnXJh2Zoi1JOah6PJNmxoqHHTg8RBNTUal5vtJ0JNwVck7OWRhLLgYkYhiS67ZL
         Ray89+KZShqnW7Ylu2f1VDQEDz5xlDzGKv6YhwHKAcsua71YyXtZZIh1aurNrBKcYxAh
         C15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775717722; x=1776322522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77RYlQihBFJrEyN2OYCeqoLNl5MjmqFfyuopBe97xrw=;
        b=XzZJmFrS7wy2qBsFfde6hzGQmbOULTH41T3cumITYUUpRJVAft3VD//80bR1/Q5BvB
         q76h/U5a7DdNKqouJV5zYIS3E2hVUCdts61x33p8GH0L93UlApvMmNRbw6OdTwey4X6h
         6W91alDi3brlTaD4vCESKCVuaW0wheMcrLB64Nuibv5TErlvs0le9l/MBBYEOa/HuAPX
         Eto9hVXtuGgxdyRYoiokpCy50MxI7r1FRECO1emGUrwjVJJjWBUN+tYDUF/eeCTH5hZU
         rkSb+oFo6tnYZ08HDppQGBbuKVzW406JkD18OJ1k9eKw0v7GLC9K+3R3z/X0JXglOXMF
         xoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/l0B0IG90i5jfOhdMPt3uTDv+aOSf2/CM7ynKr9f2YGC39xp5x1CsCRLzRlt/cyZU5m5tExUnCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy65PfZyjPrdJpsSw8+WCSRPsJ9G7XqL3Xv/ogFkP+4MxS/a2Zc
	KP8JEG9WRhH+p8qrEQO++1WV9ASGPGMWrwC5JUd0vR1BWVPf5MLMFJ2c4K9gxCWd45dOIwq1gig
	Htos97A==
X-Gm-Gg: AeBDiesaS3Z6PjToSAsrQrpG+NkLEAktS3gpLt/Jmmb3eU2PDWfcnTPQLzdvqDjPicu
	7IvG53IdST+W/cXPudyOgdD9eYFDPJi662xsGmcZU1Ssp6g65nbFOfaCyCoML0kahh8cwmRvp8a
	XEvi34jKqP209Qdvpi69WIYGaGS+HX/SGh0Dc8yUU5HzOkDm0oe/KjEfZJY2CzasnxdW5HE1bSr
	EHSwcmLsrPeVv3qqZ3v/o55H2Qfen6MWr4IfUy9jy5zS5MWgV/2duG5bbwuTDHcyUF5igBxKGA0
	1eFxtASPzKdBd2bP5UOVnVw9oUsxkE8QNdSvwHogbkqHmbwhLHF6WKoxbdfRhPRID1IGhmO1d4x
	a/qGr04aEOChGXjRi9m9APTz8kKRHZzuQuwWrlcCB/eaixqac7C/q7H4HK6iOdOSxv2tiN3rpK+
	gwEHK693oRr1C+r77iyffXl6mwtreYpOpAi6qqKMp/6PS9k/MP5B0KoNALbxCvIwR2O6WOdeaXk
	rq4/6OgYL7p2No=
X-Received: by 2002:a05:600c:83cd:b0:488:bd79:94d8 with SMTP id 5b1f17b1804b1-488bd7997demr146932165e9.18.1775717722408;
        Wed, 08 Apr 2026 23:55:22 -0700 (PDT)
Message-ID: <996efc8a-7380-4231-b19f-fde19eee58ac@suse.com>
Date: Thu, 9 Apr 2026 08:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] x86/hap: Wait for remote CPUs during TLB flush
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260401163521.3603665-1-ross.lagerwall@citrix.com>
 <20260401163521.3603665-2-ross.lagerwall@citrix.com>
 <b985f554-0338-4426-8981-0613f112f166@suse.com>
 <ed2006d0-1f5f-45ea-a8d8-bd9c064fe048@citrix.com>
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
In-Reply-To: <ed2006d0-1f5f-45ea-a8d8-bd9c064fe048@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1775717723-22D2796F-486EB4F9/0/0
X-purgate-type: clean
X-purgate-size: 1178
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C29EF3C6C3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 17:48, Ross Lagerwall wrote:
> On 4/8/26 4:21 PM, Jan Beulich wrote:
>> On 01.04.2026 18:35, Ross Lagerwall wrote:
>>> A future change to on_selected_cpus() will change the semantics of the
>>> wait parameter so that it doesn't wait for remote CPUs to "check in" if
>>> wait == 0. Adjust the call here to retain the existing behaviour so it
>>> continues to wait for the remote CPUs to VMExit.
>>
>> Doesn't this go too far though? IOW wouldn't we better make the "wait"
>> parameter a tristate then?
> 
>  From what I can see, the current wait == 0 behaviour only exists as a
> limitation of the implementation: The local CPU needs to wait for all
> the remote CPUs to have read "func" and "info" before dropping the lock
> to avoid a race condition.
> 
> With that limitation removed, I don't see a valid reason to maintain
> this beahviour as an option, though I could be convinced otherwise.

Well, the specific case here is where that behavior is wanted. Rather than
penalizing that case (by using "wait until complete"), I'm asking to retain
prior behavior ("wait until 'checked in'"). Even if (for now) only for this
one case.

Jan

