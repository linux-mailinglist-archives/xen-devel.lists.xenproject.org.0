Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OiLBJeKwmkLewQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:59:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2F308CA9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:59:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260789.1553988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51LM-0005jY-Em; Tue, 24 Mar 2026 12:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260789.1553988; Tue, 24 Mar 2026 12:58:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w51LM-0005gh-C4; Tue, 24 Mar 2026 12:58:48 +0000
Received: by outflank-mailman (input) for mailman id 1260789;
 Tue, 24 Mar 2026 12:58:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w51LK-0005ga-VD
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:58:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w51LK-0093Uq-6O
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:58:46 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c28a7a-2eae-0a2a0a5409dd-0a2a4502daa6-46
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:58:46 +0100
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c28a85-63bb-0a2a45020019-d1558036d81f-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:58:46 +0100
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4852e9ca034so36811235e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:58:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4870f80b757sm20287055e9.7.2026.03.24.05.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 05:58:45 -0700 (PDT)
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
        d=suse.com; s=google; t=1774357125; x=1774961925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C+Eq44OLRVX8FgGXbGxaWwoDXEk+NHV+AxFtThtytP4=;
        b=ZurTXEVT4FKcOGAKgxKUX2mgv3tcgvzIZNhREjBAX0Uwib5QMdgV2zsOd8BrPGrfmx
         bKu6uQWU1SUVnB2dspILfdJR5OjM27Bmrg0ra83+1c+89ETNS8/bJomwVVYRLN0Z3ZZk
         KiS2zO4RUD2DgVedWZzrd60pXPkCC6gcoKH+6nhZKfbRW5aKebgqZn3z8Z1j4fmtYexs
         0B7e3A9OT30BgFZREbpSZZr9VbG4/KQ4jRQhtWZ5Bi3XT2R16xd/eUa29+iPyy8flh/z
         4nkUPzmUdRNdOA1+B/NFa38Vzpcv6sF1TCLPZB+M1P4cuQBjpGOrJCRlypYPTwcI/Phg
         m5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357125; x=1774961925;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+Eq44OLRVX8FgGXbGxaWwoDXEk+NHV+AxFtThtytP4=;
        b=NKhv4Kwox0DZ1N377f7dGWyH04Z54/zq8CL7I89c4VPR+QlxIvTYeKk8yF03wyu9Ck
         sbm+u1sIHQQ3w+dZYBwzzo+RNQBNjd3beUrpt12FK4Wi7k9r0+u3NKk4yec8WllKhtUI
         IjVBS7fyYkwUbr1XaujtW9ZpFKWIyoNIaM979iu0Smx0+CKslaKBZo/EnmkHi2MMUCW3
         5NLS098b5AbaOs8kMXvRoDJ3py5GJjr/8I71xIvyHfmC5zAqsH/GKFd+/QDbvyZ+wMkL
         0IcF/tg7NapAMjQwdsB62x28bOTksd8Mr5LRqT0RYKAoKK73OSeztrz2lOQNu+oqbOZv
         DKSg==
X-Forwarded-Encrypted: i=1; AJvYcCXV7HRa1eu4A81o7k2jiwpBVkSywt5TmZM4SRcR9vEUeu8Z4n6dDKwA5TMFN91MSAE+RV+PJh4+ku4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwmVphmWewfaOuQvMR2enGBq1AM6TOvdZ6BUm2kkpackKUR3zRb
	CI2Lo8Kehf9Dcj8KndzUl6SpO4xM49s5S1UMmhazV0TWiWm/HvRMVsRvbLVx2mrOGw==
X-Gm-Gg: ATEYQzzquJ8m82nx7IkIYUeQwb8AJNU9fEbvyc6tTr6Gxxta/T+tLdVZnOht/Bs+Y7B
	3WwgdN2dR0UIJoe4lEHPBEa5wdGwVEyn5RYeaWNEGCiNH4CCOmII+p2AJr2XGGFFBk8y+xh1b3L
	trQWU/ghbOP2OJ4eNEzpHZzHE/qA6BJcuHjsxQP9I5Trf52oxk6KwzvUUKoy8qgXXJL8qEn1Xo6
	dCAjtMNTzOWQvvnPS0HWXjdz9655+Hp/45PHcpCg+Lb532V3hHPAzAs8j8ql9RwZHp4TnQksgAD
	w6pq1nfQhZn+dCre/iM0/7+BhVy1a7YwY5JyksGsD+7dsUH/LZM/ZdP5UMlqRA31KyNVssx9+la
	aPc2bUea5yIdz8UeP76oLj9nYQSaPpMtmWlkd7RIPZeSr1VuaAvKrds1AmgFcGqhgjQIioz7J0L
	snpufUKSiGu8kBtQcl2+ZNyWcOi6xtgrjHgx+7J++kAwIxgPI+3oXx0cBMWN+b2PeJCsy/k+LS2
	U/uFu8iegjfeYM=
X-Received: by 2002:a05:600c:8b0a:b0:485:4136:99a8 with SMTP id 5b1f17b1804b1-486fee0fb9emr222399445e9.22.1774357125594;
        Tue, 24 Mar 2026 05:58:45 -0700 (PDT)
Message-ID: <2fa30970-f2c9-44a4-99b6-cf5e22910f26@suse.com>
Date: Tue, 24 Mar 2026 13:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/kexec: Stop hooking NMIs with trap_nop()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260319122549.922724-1-andrew.cooper3@citrix.com>
 <20260319122549.922724-2-andrew.cooper3@citrix.com>
 <c2129389-cc61-44bd-a680-c75b05725749@suse.com>
 <8c64e93e-cade-4c25-b8e8-cd23028628e4@citrix.com>
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
In-Reply-To: <8c64e93e-cade-4c25-b8e8-cd23028628e4@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774357126-BFC8BDB8-6F45585D/0/0
X-purgate-type: clean
X-purgate-size: 610
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 78C2F308CA9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:50, Andrew Cooper wrote:
> On 24/03/2026 11:52 am, Jan Beulich wrote:
>> On 19.03.2026 13:25, Andrew Cooper wrote:
>>> On x86, we simply cannot free the per-cpu block for any CPU that hasn't been
>>> put back into the wait-for-SIPI state.
>> Please remind me, is there a reason we can't put CPUs we have offlined (not
>> parked) into that state?
> 
> INIT clears CR4.MCE.  Any multi-target #MC (even non-fully-broadcast
> ones) which includes this CPU escalates to SHUTDOWN.

Wasn't there a difference between AMD and Intel? After all the above is why
we park Intel CPUs.

Jan

