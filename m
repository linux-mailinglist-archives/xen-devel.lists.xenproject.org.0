Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAMzMp+Ry2nMJAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:19:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2622C366E8A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2026 11:19:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1268786.1557987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VEw-0003T3-2Y; Tue, 31 Mar 2026 09:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1268786.1557987; Tue, 31 Mar 2026 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7VEv-0003Qn-Ve; Tue, 31 Mar 2026 09:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1268786;
 Tue, 31 Mar 2026 09:18:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7VEu-0003Qh-5R
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 09:18:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7VEt-006leb-H8
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2026 11:18:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69cb914d-5cb7-0a2a0a5109dd-0a2a4506cd66-22
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:18:23 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69cb915f-3034-0a2a45060019-d1558033b113-3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 11:18:23 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4870206f73bso33607175e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 31 Mar 2026 02:18:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21f173dsm29352616f8f.15.2026.03.31.02.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2026 02:18:22 -0700 (PDT)
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
        d=suse.com; s=google; t=1774948703; x=1775553503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Oae1aM5KHM553oDKw2AgHIwEz7/gxAgSy8DAWt12xNk=;
        b=TOBpJTEm3yxwx79uu+GVLxYwRT91BrTsgoooIVXLZnia4RQLuQfnDF75g04yyZGV2h
         jD7P7gb8ZVhl+ffRFL9va8RlR+tGaW8lpVSJxoDPLacZTKmpbdCG5gGA1xWSML37UkpP
         C7g3/TYBGOhjf/79GjxeF/NA9TIypXP8lBCBsh6LpPEpUljg9qP+yBEl5GcobFuLSkTI
         7TdAzt1ophlU5jgSqxBByv5wGcDIIi42aHkFHxa41rEubwEFmAvVP8QbMgj/hD2oNLo3
         zc7d3gkjtt2n24t7eqbvvMQeC9ZKlYX622aqnVw+UpcHSD52B+YY1PsNi67xbEvRdZ8C
         r+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948703; x=1775553503;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oae1aM5KHM553oDKw2AgHIwEz7/gxAgSy8DAWt12xNk=;
        b=k9JPyjtnvw2ExFNnQxjKhHTFCP33yo7xMfupeuoF2OcB0/OW15gat/tnis/W4IXt3k
         QPgfqNLEeu25eZy/X4zeuJ/pJmTefgqCW3K5Hr9ENUXymnuYQrImuxB3JrjlevlCdQPD
         IGRjU2cOE3ud2Ca/45uDQBCbAzM8p70kobu83yUPxwfNDJeiwKgyzi9L5GDnsdrt+r/7
         c4A2r+n4Q9uMN26Oy1BfihV3F5ITxUWe4HmeG2DBxg4kyFbbL8qkrIKvnQG04ha5NEeu
         PPa5ggOwGylhh40sslY9UQXCAFt2JackR235pmOc9C8JYCFpZHmGZJ/pgWvAG4hWDT/c
         ScJw==
X-Forwarded-Encrypted: i=1; AJvYcCU4jfsoHqJf628C75qwuCRX+0lbz7kGYdFW71ZRc5XEbz5saxSxyFDXQMtWAJn97xetwdb8kioQvYU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwBIpHBds4KmWQlc6LgLUATd4/mnuz/cFZ4oQZXp2l0q0KWEvRy
	aBZNItrePOzkTTMWMHfxzOgYhWeYYkDAKZulsV5QqRLFIdCbcatUNOVTUTc1nDs9D6o+xfqf0rS
	lTaD6LA==
X-Gm-Gg: ATEYQzx8EgYqkD0qdq6PpSOGdRR07YE4vjUjnm+paWvqcKVt6dy9Js0JhEAHrTHCQay
	ruuDZbf9ctKjcHt+v1cbJP76ppDnQXM0dOHsWLH8RHYKxMYvO3a0LBEyGDhiDOmMGCXwl6MDr9W
	Hw2oTQZFNI4khLpYSQDccU8TH6AjBLKshgM+8KP3En0izYmVFdgOi3Pym0go9S85mHbhvv42SD3
	e8kZisgsKDqaiFHsXt19X2Sg29FEzNix1BNCUkIrAk4qcaID47gfogaiu0NbYzawj1rzBX/92mC
	e7/5ZcTlOaWtWIsu+mqJx63SXAX0G4Rqln1wTzQujuJQWbFkRP2ds2SlkEZV8lyw4FGhMQfcVc+
	N2vlk0abbTCggJQrFFTWm4IsqWovdr3mG6mqfflZjK5FgMLy5/YGjcDHrtfDohVslwg6Lyr0EjU
	MmgKrHDYaSuurlA3Cwk5DnhQSLwhBV6kbSGLnKK7OZLauZCrMp037mm6HHAezTEbkOSIY2t4VP3
	1tliDK/gMbOSVo=
X-Received: by 2002:a05:600c:5249:b0:487:386:3714 with SMTP id 5b1f17b1804b1-48727f7bb08mr287638315e9.17.1774948702803;
        Tue, 31 Mar 2026 02:18:22 -0700 (PDT)
Message-ID: <70dea46e-5045-4032-b6a7-b92427000978@suse.com>
Date: Tue, 31 Mar 2026 11:18:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/hypercall-abi: Add a footnote about SYSCALL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20260331084059.20053-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260331084059.20053-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774948703-823921C2-2540E8FC/0/0
X-purgate-type: clean
X-purgate-size: 937
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
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2622C366E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31.03.2026 10:40, Andrew Cooper wrote:
> @@ -138,6 +138,10 @@ means.
>     kernel, hypercalls issues from such a mode will be interpreted with the
>     32bit ABI.  Such a setup is not expected in production scenarios.
>  
> +.. [#syscall] The ``SYSCALL`` instruction modifies ``%rcx`` and ``%r11``.
> +   These registers want spilling or marking as clobbered if invoking the
> +   hypercall without the use of the hypercall page.

For most hypercalls this is sufficient, but ...

>  .. [#iret] ``HYPERCALL_iret`` is special.  It is only implemented for PV
>     guests and takes all its parameters on the stack.  This stub should be
>     ``jmp``'d to, rather than ``call``'d.  HVM guests have this stub

... for this one merely marking as clobbered isn't an option, aiui. It needs
the two registers put on the stack, and in a specific order. At least as long
as VGCF_in_syscall is clear in the stack frame.

Jan

