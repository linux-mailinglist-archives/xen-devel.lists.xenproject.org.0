Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K6JDXpRwmnNbgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:55:22 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1BA3051FD
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 09:55:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260151.1553515 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xXW-0004ES-EO; Tue, 24 Mar 2026 08:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260151.1553515; Tue, 24 Mar 2026 08:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4xXW-0004D5-Aq; Tue, 24 Mar 2026 08:55:06 +0000
Received: by outflank-mailman (input) for mailman id 1260151;
 Tue, 24 Mar 2026 08:55:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w4xXV-0004Cz-K2
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 08:55:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4xXU-001Hnb-RB
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 09:55:04 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c25166-bab6-0a2a0a5309dd-0a2a4506d1c4-20
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:55:04 +0100
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c25168-3034-0a2a45060019-d1558032d1e6-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 09:55:04 +0100
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so38526815e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 01:55:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116f173csm42556465e9.2.2026.03.24.01.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Mar 2026 01:55:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1774342504; x=1774947304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hUFnKR3WYShIN8354QNofRdIMmgGO/69e0L2uV7um+o=;
        b=OFslypEECVbTCUqJB5UH3g/ObmfF2dPzlwBbex9NMGy6dWgewAQW1zYBBXtUDOMcDq
         yqtkP+CSnuj2WBOutvhTru1sxaRjMAHYxzNsUW9JSV83OUq0GkckHJkSq0u/wUoJY5dX
         4xCpPDPo7yujcKu6R6p4wr7fZZZCWbBWzZTNf8Iq2Rk9UzcZphev0Is7Lk0vQZ6nLLsB
         Ij647gjOElowg0bsa5SHGvvf4BrBo+65rQWSBZDLatth5cHMesLKosoFHHSH8jdMZ8SS
         Mqhd9uGRVwtoVAmSFYXEP8eUbt5ymj4f3pZZsQIE8QJVNKDmWVcZ/bTBQjGyIYSGytjJ
         ExHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774342504; x=1774947304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUFnKR3WYShIN8354QNofRdIMmgGO/69e0L2uV7um+o=;
        b=PnSOAVPR3TPcHOlqxmjURe4PkVtuHphudfZF3DbAsf71m11l9mtI8mabNFzTGuIqOI
         bbnF37gve8txn8k7ZzOJSYkfLPMRZtWQ0eCgiWUQKA2zmjCcOiRJyq4z7VW6K1gofpx9
         jKLo+Yb87Cy/trrat/PixUFPX0XWk2B+QSP4zCloHqy/CqrjRRu/vQgHXLYnBhWhnf6X
         OjH3fEMqG62EFnwrcFaz3y94nRhMkuzkwytAS5G0hdUlUsOv8nFfIJTcvlKleMlt6AtE
         jcGAok+eJv0zWHm1/ISBhuCQ+qytCZX3utMs5/caWDfdas+5RZyhIvU2NkVf84vHjn5a
         LzYw==
X-Forwarded-Encrypted: i=1; AJvYcCV4RLDpWqzME9EGAFLzk1QoPNBncopuI7CDzyKhgser0Nkp40m1w6tvtxxvq6Ijz7AtndxvFGP60TY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4aeBv6jBiqPbVEAYSiY/JinLrs4ICuytJmL07RQKxDGfU4Ir9
	Q7eJQWbKD01dwFBPB78KqpyPZUmhv5clKeO4wYti3xaOUawhfiEk99q6Y812W6+XLg==
X-Gm-Gg: ATEYQzwuTBinnuih4stwXuvNojPzsdfRm2owEWN4OhqLr+ZeP23dwpLdVca12EEDzpA
	FZ8VJskWMBgUmFpkJYOpcjl/4XJnXFoN/nF8MfG+qu1ey2gK7v2zs++iYQEiRNkAlL7+qqQEnVf
	58KnSHoLwVTAJxXc7x0lzv9UwJQ02u1Cdml6/ywnXXfN2Da2/VHUQPBS/moGUjAH4oFcNn2ZWnJ
	VFaROcx6o2LC38JQMLt9C3IiLosLDCvgatzWAMNYcPEtvjTTi0cLOczlxAoKZrdUrsl4EjRQr7i
	ic6m66bFf92UfUS1+d+4RBpc+Q4U9UMqtIVuhonCOe0PODBHh+9HLIma3Wl+pzShYpiCK4A9Fo2
	yJrPK5B1qWOVCj6SQLbqlPt1B/M4td/lHBr/zDVJEeL9uensjsu1akpjGP+9z+SNbbmo7miEFk4
	S/h3O+uDtToum+Wzfw4ATJNwl1uurkCGZHyilUVglzwvGzkzvSNdh3nwy29++fF1aoaN0CNddca
	mc5S+0jA17FW/Y=
X-Received: by 2002:a05:600c:c083:b0:485:3f72:324d with SMTP id 5b1f17b1804b1-486fee0481amr164606415e9.14.1774342504009;
        Tue, 24 Mar 2026 01:55:04 -0700 (PDT)
Message-ID: <48655cc4-d892-404b-a107-787539effeea@suse.com>
Date: Tue, 24 Mar 2026 09:55:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/vpmu: Expose up to 8 Intel event selectors in PV
 Dom0
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1773160025.git.teddy.astie@vates.tech>
 <715834969eb198850e1fe0d1e66046f929c8d658.1773160025.git.teddy.astie@vates.tech>
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
In-Reply-To: <715834969eb198850e1fe0d1e66046f929c8d658.1773160025.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1774342504-7A5911C2-649187A0/0/0
X-purgate-type: clean
X-purgate-size: 847
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C1BA3051FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 10.03.2026 17:44, Teddy Astie wrote:
> Most (if not all) Intel CPUs starting from Sandy Bridge have up to 8
> event selectors per core, which could be halved per hyperthread.
> 
> However, current PV emulation logic doesn't support up to 8 event selector,
> leading to errors when trying to access them, hence, preventing Linux from
> driving the vPMU correctly.
> 
> Make sure up to MSR_P6_EVNTSEL(7) is usable, which is the same upper bound as
> used in VMX code.
> 
> The check if the event selector actually exist for the hardware is done in
> core2_vpmu_do_{rdmsr,wrmsr}, hence we're not allowing to access non-existent
> MSRs.
> 
> Fixes: 27c554198666 ("x86/VPMU: add support for PMU register handling on PV guests")
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


