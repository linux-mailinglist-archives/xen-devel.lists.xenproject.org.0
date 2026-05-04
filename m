Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM8GDGkr+GmkrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:15:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 890504B877D
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:15:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299427.1573956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJldF-0003Kh-Fp; Mon, 04 May 2026 05:14:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299427.1573956; Mon, 04 May 2026 05:14:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJldF-0003IE-9T; Mon, 04 May 2026 05:14:13 +0000
Received: by outflank-mailman (input) for mailman id 1299427;
 Mon, 04 May 2026 05:14:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJldE-0003I8-3y
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:14:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJldC-007IuY-Kf
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:14:10 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82b16-2eae-0a2a0a5409dd-0a2a4507ee38-26
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:14:10 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f82b22-229c-0a2a45070019-d1558036cde2-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:14:10 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso32314295e9.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:14:10 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fee4f79sm68254765e9.20.2026.05.03.22.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:14:09 -0700 (PDT)
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
        d=suse.com; s=google; t=1777871650; x=1778476450; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AtowkhyPRGWDHxAfF0IBdnr6lRIaISsKeQXivwSe6uE=;
        b=BnPo8PV8bUrgGTSyU3DhdgoU6imNgl2YMO0/F5XkmLoGlv1vcsz2wRGd95FRfoLUgr
         CiARojRlqECYugdWQsqyzFRwaH6/o0mdDHYxYxKDhTpXOOiC9S2H30MDaKH8Z/YSwkSD
         78lraIgZbXxETybcmKACNhAlsDevEJwjbsmB+kdO3LdeF3RrsxmQGkRSpEXzvjhX2FJa
         Sj/okaZG8FFG5tdO0L1lkl8EdXKg5Ndp4bP3NZgjNs+ufB2aYp026uimSFyGlW3TsheX
         bL9lSe37Y+o/umXL5Rm3Y8whxS+W4OrCDaNIqk9pFtQakwguOTGaKWv+0zPN4iOJTf7G
         qJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777871650; x=1778476450;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AtowkhyPRGWDHxAfF0IBdnr6lRIaISsKeQXivwSe6uE=;
        b=YkIMCK1zbLP04FLoLiw+ZLMlmeUmqbMy777iUyvIB6z52nhv+wDjG5UuRrWjbi/jaD
         ml7mNKEiyNygFyzh3EFZvPLI2ERWJdapTd0uoar5qQKyzb1oVZhOc3bJuA8tkpxqWW89
         UfPFLX3H90bQMhPj3QVNiM7W6qfdwGXdvBtFHXOZ+wwHv7589gEj+2/lqqD+JejvsnDV
         5a6hkl8UaHTPSsRzxJY6vF8CjVtPBEvSJJdVRXgnfFlLiCzsJlffJ3Q6WrBTWBpYzONI
         AqibJBSt5Z6vQW15A8Bl1vX2JYWVZ18z1Wf8jwgKEXfKMo5pqHw1olCWUjPIaS4s9fyU
         iwTg==
X-Gm-Message-State: AOJu0Yzy46b34/BdcKv/CheVnrh7WuO5q10wQoV0MjtoiII953VXqAqu
	YkXc3JUCxKiCQuFwRzALSD7V7bC02C+7x0KladEou0sEY0TsC5vrxvduzLco83hupQ==
X-Gm-Gg: AeBDietbgx2JDXabU9ialFDhmDoPdcp8m0FryHP1TzvOufDUF8QvUsXzznveB1JneCd
	1iO0rVNssJiHaOPxmYjkPkhuzYIDV0L0sqxA9Tsoe4vZQWOJOh7pJYj07tiAywIICKGZEEBmeib
	JG9Qw7B9MJKAWPRJXTkBRiCKhxeuZiLgqZi85Mwkl8diaYsMciTiOIC3FK7y63kkUdZgIA1ajSS
	e/D4AUxTgTjhZEL3njOa0SrrM0wNk7fxWudP7uzwggghbKk4tlWQ/KK5sD6RVIfy07nSvvrpiJR
	TeTYvWnlX5ZjDZkaMadMN6HHGEIovZh6zwDwjQFgbJDjyvgPmGFgsyj50vaG0gYfUa7pHnysr3A
	Y7GISsp36VEJ5nyUTI+RxRPRElvARgTIUjMfkcnliQX9fYVnc4iW9SRiu85CMiDrSu8svnzkqKg
	7wpBwhev/MlyCudDTyjNMXioUNfpdR4mX14ybgaJLHK9hKXf1pO5ewmqX58f8R680tBtV/vwtlH
	z4x76Q+QzpPi4mFhnYpetlDojR1XniUSPlccWVrvyaCXnjn2VqF1tlRdOvSkZ9atQyGwyE=
X-Received: by 2002:a05:600c:1604:b0:48a:66a8:9981 with SMTP id 5b1f17b1804b1-48d0562f7efmr31502105e9.27.1777871649736;
        Sun, 03 May 2026 22:14:09 -0700 (PDT)
Message-ID: <53c4fb20-8cb9-440a-b37a-d829ec940e1b@suse.com>
Date: Mon, 4 May 2026 07:14:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/svm: Always sync guest CR2 on VMExit
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260501213826.1291860-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2605011443580.512397@ubuntu-linux-20-04-desktop>
 <981a0dad-dcbb-42c8-a840-6f228eb89be1@citrix.com>
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
In-Reply-To: <981a0dad-dcbb-42c8-a840-6f228eb89be1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1777871650-16E67C48-E2DFA8EB/0/0
X-purgate-type: clean
X-purgate-size: 1428
X-Rspamd-Queue-Id: 890504B877D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 02.05.2026 00:21, Andrew Cooper wrote:
> On 01/05/2026 10:44 pm, Stefano Stabellini wrote:
>> On Fri, 1 May 2026, Andrew Cooper wrote:
>>> Under SVM, there are two copies of guest CR2.  One is v->arch.hvm.guest_cr[2]
>>> and one is in the VMCB.
>>>
>>> Xen doesn't intercept CR2 accesses, so this mostly goes unnoticed; hardware
>>> loads and saves the guest CR2 across VMRUN/VMExit.
>>>
>>> For HAP guests (where #PF is not intercepted, and therefore we don't typically
>>> inject #PF either), this causes the guest CR2 value to be lost on migrate.  As
>>> migration is cooperative and not done from the #PF handler, this also goes
>>> unoticed by guests.
>>>
>>> It also means that an emulated MOV-from-CR2 reads a stale value.
>>>
>>> Reported-by: Stefano Stabellini <sstabellini@kernel.org>
>>> Fixes: d1bd157fbc9b ("Big merge the HVM full-virtualisation abstractions.")
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Thanks, sadly I made the mistake of extending my XTF PoC for this.
> 
> There are also bugs on the emulated MOV-to-CR2 side, and they're far
> harder to untangle.

Any slightly closer details as to what?

> This patch probably wants to go in in this form, accepting that there
> are issues still to be addressed on the other side.

I agree:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

