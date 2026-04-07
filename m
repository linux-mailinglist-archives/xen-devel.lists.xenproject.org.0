Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLzdOdTb1GlxyAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:26:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7E23ACD00
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 12:26:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274837.1560816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3dL-0005iu-8e; Tue, 07 Apr 2026 10:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274837.1560816; Tue, 07 Apr 2026 10:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA3dL-0005hS-5Y; Tue, 07 Apr 2026 10:26:11 +0000
Received: by outflank-mailman (input) for mailman id 1274837;
 Tue, 07 Apr 2026 10:26:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA3dK-0005hM-7p
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 10:26:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA3dJ-003qFl-JU
 for xen-devel@lists.xen.org; Tue, 07 Apr 2026 12:26:09 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4dbb7-e002-0a2a0a5209dd-0a2a4506da5a-42
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 12:26:09 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4dbc1-0df0-0a2a45060019-d1558036b980-3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 12:26:09 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48374014a77so64800215e9.3
 for <xen-devel@lists.xen.org>; Tue, 07 Apr 2026 03:26:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4889b559a15sm212529775e9.2.2026.04.07.03.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 03:26:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1775557569; x=1776162369; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9SWgznumzZ9O+S2o6JthXmeT9POCO5TAQbD8MXJlBiE=;
        b=g5wndo/7Mb+65IM5Xg0QoPXfVASYpcVN/GT1hBHUXtPY4j6JTojLup1KVaGl+7MHTa
         CQv52mFpq/w9tVvW9Bf+5q4tBd1frOqhhdRBiTq6go1JdqW1ZC6n6viwSOZyWABNU2cJ
         8gceYzv0WacZ0BYCmFrkcilo1aOyeZNW0I3H1/IJvChhWtpsQ21WnjKEPGlr1QQYSsqH
         lUNOSepcgAG4qsWm6iV9h3Gt5C5uHp9Pwcxy5HmAYTwE0LjtPSoA5OPZO12LlEv8ki4a
         11WfxVnIQT9N0Rg0PCOTbyE8IxRyicFW+mEIWsHPnez8px+Wd1HFF2L8Obq8bBYI6jSR
         tZvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775557569; x=1776162369;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SWgznumzZ9O+S2o6JthXmeT9POCO5TAQbD8MXJlBiE=;
        b=U4cAUbFBxSFyaN6mS1HWiTMP/IXp60zSQyIyfuBLGE4ckqVfx4F3M8LBmNggHoNaP7
         00Q3TFDgqJbEtOC2GUNh2CgMQi1uNCLSAgMEvSK41Ze9qO4RH6OFXmKrWHJnpFvIDKeE
         pTDs0dB3R1Bqk9Sq9CNnDpC3wBXxsaP9cHVltpO/qeH4P62+YCe21IOIj0uqo5gRqkdZ
         0mWEBwigfqhS8HRi83i1z3fmJrgOcm2JhA/cmcHKtCEh1AxQiNbmAkvxDSrqcvmexD5X
         9L0OONGQscP8HtQNX0qDH6h7eAOoFypMJY/y2byMiIyExlZxTJXOLOVURtLbEiZ3Tuwx
         R74g==
X-Gm-Message-State: AOJu0Yyfw8dJxtf5T3ehv+yTwimywHVetyDu8yjQzPocsMZBCr318pfM
	73cnCQP6r2pKjAxEnLWoYJaJwelDuryFPtcQJrftg/DeAscRdOgX4P71GGvs5kYRTQ==
X-Gm-Gg: AeBDiettJ2jPPNv4lRG1fahXhE+GRYhapsnEIt65eeqe9NJzEjXXy4yXiGUCkOLhh1K
	J0x7/tC+upnnguzWJLJZRZOZfephUEXo5bKixTWgnKqNlNRenKk6+Ilg6nntz+p1nFXWbyn+us0
	lLZBmRNcu8/NFrfA4qsTjWV2ksQsAsyu5Skma1ykQFT2M3ds3rxUzRaAYF1CcV7oyyspPCft1JJ
	ZDSPmOPoV2Ti7ZYKnD+yi4/daf2ya7+kP9IkHWBa1xrCg+1pCH0JNy4OwXy7E2XoTKxAIRnTZxZ
	4OO3a2zxh3MfzGlOfT9omYDijLF/1CWLpIqxbacMjnshpuKaHokjWm5WiMRrjXULwnQyxEb6yyO
	hPAlDRtTv634Jipqr09QMj3frb3GV4lOLR5ZmpK/KL3Tx9pI69c3AThpXUKLgqgrHLj5KEEJ0Vm
	1bIQVdPURJDuiD9w1KndwJB4/DKCXYv0BUBG2945uiBDtGJCY0QgsxJQPaWNPU4qvaQpN+iaMQo
	dTJVsXPYlbPPUk=
X-Received: by 2002:a05:600c:5292:b0:488:8d44:bf98 with SMTP id 5b1f17b1804b1-488996e8254mr248407255e9.7.1775557568710;
        Tue, 07 Apr 2026 03:26:08 -0700 (PDT)
Message-ID: <e9c1f232-e81e-4202-8550-6fd3afeab206@suse.com>
Date: Tue, 7 Apr 2026 12:26:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen on Zen 3
To: =?UTF-8?B?TWF0ecOhxaEgS3JvdXBh?= <kroupa.matyas@gmail.com>
Cc: xen-devel@lists.xen.org
References: <5490687.niJfEyVGOH@rivendell.hailstone.cz>
 <1f1cfdeb-adbd-420d-a187-d0007fcad123@suse.com>
 <4454038.v2OnDr8pfo@rivendell.hailstone.cz>
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
In-Reply-To: <4454038.v2OnDr8pfo@rivendell.hailstone.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775557569-5FB3B3D8-6B705426/0/0
X-purgate-type: clean
X-purgate-size: 938
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS(0.00)[m:kroupa.matyas@gmail.com,m:xen-devel@lists.xen.org,m:kroupamatyas@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xen.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F7E23ACD00
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 07.04.2026 12:14, Matyáš Kroupa wrote:
> Dne úterý 7. dubna 2026 11:05:40, středoevropský letní čas, Jan Beulich 
> napsal(a):
>> Not exactly, there is an earlier exit from the function when num_roots is 0.
>> If that line is the problem one, then presumably num_roots < num_nodes, thus
>> yielding roots_per_node as 0. Sadly you didn't enable enough verbosity for
>>
>> 	pr_debug("Found %d AMD root devices\n", num_roots);
>>
>> to actually leave a trace in the log. I'd guess the value to be 1, but there
>> being multiple nodes at the same time. You may want to instrument the
>> function a little more to be certain.
> 
> I booted it with either loglevel=8 or ignore_loglevel, but could not get the 
> pr_debug to output anything. It did however print a lot of pci and other debug 
> messages as expected.

Iirc loglevel options don't affect pr_debug(); dynamic-printk options need
using instead.

Jan

