Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMduIAYxnGkKAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:50:46 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3154175259
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:50:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238997.1540387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTWL-0004tO-5R; Mon, 23 Feb 2026 10:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238997.1540387; Mon, 23 Feb 2026 10:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTWL-0004qL-28; Mon, 23 Feb 2026 10:50:33 +0000
Received: by outflank-mailman (input) for mailman id 1238997;
 Mon, 23 Feb 2026 10:50:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuTWK-0004qF-6A
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:50:32 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7857deb2-10a5-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:50:30 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48370174e18so22330325e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 02:50:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a316eb08sm284437575e9.0.2026.02.23.02.50.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 02:50:29 -0800 (PST)
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
X-Inumbo-ID: 7857deb2-10a5-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771843829; x=1772448629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SQTPopzAqqCq/5PWbsjN/UzcoXhfjO5guQXUy6Y3f0s=;
        b=JpEQpclUY66bmjHN02GZwWrmn8wqrY+2PxnP8im3h5q3lydq0fUaEh/c57hN5eqUTl
         3ilbIM8gZ+YeT7YDmUu4tlZ2ax20epbsmgZXjtx/JxuEwyFYiYzKNTHOodkxpEYeDWgf
         kdPc6f8O+kc/NSh8fvXOTqMJNMoi+RLI34F8hH9urmCxaSWFsiOZkOgchXlqbVQJC853
         JBHK2rhVrMfY3y97aoISBpPMMzdobS3uTY0wR7XcdlQ9fseSCW9xQgbLH+JxNi87TU8s
         SBCfKdFmTWNbPqjP25tVEPVVSKjIBdB/6C7LOLOu3mgJT2eQGrsBcarK88X5fa0Jw+lJ
         s52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843829; x=1772448629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SQTPopzAqqCq/5PWbsjN/UzcoXhfjO5guQXUy6Y3f0s=;
        b=bEbPtFaGS/i2TS1zdf4TjS2c2bfFqZ7bup3NO4AAcyA5vKDuKXzoOTRdrBAHKOQNVX
         yYZBk2DRjpvlFerhb5jPzagHcXKVOfkFV226n27xvn4SVYR5Q8aCmi98mnm0eJO/Cwao
         BlA90D4uUZwdDHE2bu9UFjN3adWM+InkRYf/NWh2YufZWmVByVZprNaBvg56I+bZ3V1/
         A9XSC60r8ZS3fNDmAKB/EqP3lZarnvUxKioaagzEh33wofOKxz/lRKcnN+UT+izh6UQQ
         leU/w4tEkQXMcOC03tn+1nk7NBID4tOsJRMW/lE4yDAAJdIVyLLciylRQ9GEDo3vCKeL
         +4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkt8qFWNK9nY184ENOE+bl2CbZtx/xYcXYdZsOrLjL2rUnwU3VncEiyNIiDoJSh1fq2NKqU+XNLGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyuTkgOt+xTBoyf0dy/MpT29LAO3CaDF1YGPs2R5hIPsAscz5W4
	MvRWiaaSadQyuV9yHGKuaYrwZlbBI4OesZLTglMwW8zAidZeVzNybjMKfAzrXrKKoA==
X-Gm-Gg: AZuq6aJytxO5W5AifeHle3kStoB5SvCbKPkfI26d6ykE2K1eDsr9YooLLfYVgQxSMOy
	+I5Ozr379IMlyx9rPhiqL8frv3NBuv5/LIs+uT0eTQag8WKsLLCjUEQwm5DCmnmgVj2Xn+oUrtY
	LNE6DmDp79NsCH2pffot3FD49SxCndsmDSITPPHSC4Zm76P9ko6fcwlKVFrxYV5CcZWwGdToy1P
	blb/pE06KfeqP5eycJlKrE25uMHURqoeKxiixmbyJMvLTvhMDZ9g01KA95RDOnnRLeOc+oxPn/u
	3dzEWIh5G9mrqGg6b6VGBuptAcHM+Utrj5d5Hc/dvSSh1wQDE1F0GADBPqfEvxixVA5xt2LjlEb
	mEDmpY+vVbhpb5GGemdmSAhsBXdiIFnpAWgWNFM28QxqeuFmo9scWvKsxmM09+fKGYy2nyQ76zw
	TZUC9P3rCZn3psrt9sGf/DZyDcBcS9+V80rKzs+m3mrwoPFUJ6rz6So5Y83N1MydpSb2/cmJZb0
	EeNd+kdMSGnjxXTre3nR4eoAg==
X-Received: by 2002:a05:600c:8b01:b0:475:de14:db1e with SMTP id 5b1f17b1804b1-483a95f8ce9mr137881725e9.24.1771843829574;
        Mon, 23 Feb 2026 02:50:29 -0800 (PST)
Message-ID: <b23d0a09-1aa5-434c-9459-93f537f3c128@suse.com>
Date: Mon, 23 Feb 2026 11:50:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] xen: Bracket uses of macro parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-12-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260220214653.3497384-12-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D3154175259
X-Rspamd-Action: no action

On 20.02.2026 22:46, Andrew Cooper wrote:
> --- a/xen/arch/x86/mm/shadow/multi.c
> +++ b/xen/arch/x86/mm/shadow/multi.c
> @@ -793,7 +793,7 @@ do {                                                                    \
>  do {                                                                    \
>      int __done = 0;                                                     \
>      _FOREACH_PRESENT_L1E(_sl1mfn, _sl1e, _gl1p,                         \
> -                         ({ (__done = _done); }), _code);               \
> +                         ({ (__done = (_done)); }), _code);             \

Could I talk you into dropping the unnecessary pair of parentheses (around the
assignment) in exchange?

Jan

