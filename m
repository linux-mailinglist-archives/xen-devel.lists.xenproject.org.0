Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJG4GD8vnGkKAgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:43:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C273D1750CE
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 11:43:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238971.1540357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTOi-0002GY-T6; Mon, 23 Feb 2026 10:42:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238971.1540357; Mon, 23 Feb 2026 10:42:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuTOi-0002DR-QA; Mon, 23 Feb 2026 10:42:40 +0000
Received: by outflank-mailman (input) for mailman id 1238971;
 Mon, 23 Feb 2026 10:42:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuTOg-0002DJ-Qy
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 10:42:38 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e7fcc92-10a4-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 11:42:37 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so36766695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 02:42:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a42eb86bsm84804325e9.15.2026.02.23.02.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 02:42:36 -0800 (PST)
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
X-Inumbo-ID: 5e7fcc92-10a4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771843357; x=1772448157; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6pgzws46isvFUEBd9jQMx5x4y1kwIq7uBsNdnmg/sgI=;
        b=Ee4LFSZ/NGdJRXndnn173GhEp1nqWNyMc+AMau+S1c7kf8LSjbmp3zuEKZUpsyEzbY
         2lDBHZBncZBMalFaUjNqCjC0YG7gP6VVn8VR3obzW8Zxor5IKoqRC1Tig6yFNEKIvL4g
         WY2IkVtUJ8pPmxaZyGx0rkL2glfJxKwbbAM5IxxyGAzXKEpZob7W9XvcDu4AhSABVdRX
         mEkoIZyWNdQ4glyPQsbz4nSsbTzlt+RaO5We2rn+HvpIbPpdz012hM35T/GqZP/gtMer
         BfywIVI79nNHUCopR6EAjQwxfdlkfAIjWZTtZyRHmdPEA3G/CNhTIL6zjhdulo94nIRO
         lBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771843357; x=1772448157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pgzws46isvFUEBd9jQMx5x4y1kwIq7uBsNdnmg/sgI=;
        b=uj7MSxdDH5OS/GVaUxBLoJN0fHCZSzoJsa8T1ccdqRP0sbG5FZTAllenIq8CxlHVsH
         i3U34DTmbS7UEiBa6333/i8U6iTkUm60qEYmbxjFdGsz6xk2x6d6hIxQg3FbWuR622oR
         c5xkruNeWw/aW2MVwmjsjaHZLY1+I282kdycTryy/Iz4fRsdGIlrLdxPUGtcHCod0tSj
         WmncD3X40UBbvOPuOn+g7Y+sp/HSQKX6LOq/EDktpRhDeMnPxtFOGRj2iP0O9kTxy8yN
         KW7nErb70M+NIMt5HqgpLkqkiYz8/lXYquC1dkh3ykBaFU4mkysvg09w460KAHl1JCYJ
         i0lw==
X-Forwarded-Encrypted: i=1; AJvYcCXhoL81qSoqAPT48NbBM4Visv1sGNfG53+/fB6AIo7YR/CULDI0PyEtXtQD/kpG9YO+Rj2uzzCeJmk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwwHzove8Z6lu3SY1GdZt8E9gd+NvEIYDEsHDqyLfd8Xnpbjwxk
	LDPzvnfinBxewRYCGkJp11lnI0EWFJHXyGTFy3+2BAvxddyssXda9jJve0z7PB+E5w==
X-Gm-Gg: AZuq6aJffZftdUDIcMQ5KgvHffLDVfb1v85WlaVKieW1kyZ9iugTs1aJ67ZoBb0jOyL
	q2zERtlnySQ43o/ORKJMrEpBAHDzU3qRoYUDcQQGKNk+lXfP8ko0RranR8s+Zg0HCBgiTX3kCdz
	CY/2nhS+GqpCFbxkL6jMtFKBDIbEw9F1MN/mbi/Di2m4KfF0HvIeH0UIaspj5BUCpG6H6Z2lfK6
	ssslp/4Rgmu/muvRgeZJTLH/3C7cuaKysdgX7VdjbglR1TG3ElDSFm5VzzngUtoJg+8cFWM2ddT
	GZVHx3njFPeS7zCmXBnkkhVsitsV0LONPlQQaUywCPz3wO/nAMnt+eJb4VBJyvsKVcWR6PW9UEu
	39tDTPYWXU86U1bt9AqkBT7jghMNH0VrYmrRo/bB4YtxPDP4MwrfLjAnHZFUU+LYEYXw1ASxJC4
	/R65RkLxqs0Ti+Y0oNCDmPGRjULwciFpVKjictCBDhg7tcfDmyvgWOPTzZ98nQNOiS85VtHgBkT
	qtKsRFyfqKAr7I=
X-Received: by 2002:a05:600c:8716:b0:471:1717:411 with SMTP id 5b1f17b1804b1-483a95e9a7fmr139623095e9.24.1771843356714;
        Mon, 23 Feb 2026 02:42:36 -0800 (PST)
Message-ID: <dba3fb3f-b5c9-460c-85fc-761f58e140fc@suse.com>
Date: Mon, 23 Feb 2026 11:42:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Factor out common build rules and helpers in
 tools/tests
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
References: <cover.1771840831.git.edwin.torok@citrix.com>
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
In-Reply-To: <cover.1771840831.git.edwin.torok@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,gitlab.com:url,rules.mk:url];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:edwin.torok@citrix.com,m:anthony.perard@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C273D1750CE
X-Rspamd-Action: no action

On 23.02.2026 11:14, Edwin Török wrote:
> There are a lot of duplicate rules and code in tools/tests.
> To simplify writing new tests move common build rules into a
> `tools/tests/Rules.mk`, and helper macros/functions into `common/{tests,guests}.{c,h}`.
> 
> This also ensures that CFLAGS are applied consistently across all tests (e.g. one test failed
> to build now due to an unused variable error).
> 
> Guest creation also needs to test for the presence of PV, HVM HAP or HVM shadow support
> in Xen and create a guest accordingly. This can be shared.
> 
> After these changes the per-test Makefile only contains entries specific
> to the test (its name, dependencies, etc.) and avoids having to
> copy&paste boilerplate code.
> 
> `tools/tests/x86_emulator` remains unchanged, because the Makefile
> contains a lot of conditional build logic specific to that test.
> 
> An upcoming patch series will introduce new tests using the simplified
> Makefile and shared helpers.
> 
> For convenience this is also available at:
> https://gitlab.com/xen-project/people/edwintorok/xen/-/compare/staging...private%2Fedvint%2Fmigration-tests2?from_project_id=2336572
> https://gitlab.com/xen-project/people/edwintorok/xen/-/pipelines/2342318716
> 
> Edwin Török (7):
>   tools/tests/*/Makefile: factor out common PHONY rules into Rules.mk
>   tools/tests/vpci/main.c: drop unused variables
>   tools/tests/*/Makefile: factor out build rules
>   tools/tests: factor out common helpers
>   tools/tests/common: ensure error messages have a newline
>   tools/tests/tsx: move guest creation to common area
>   tools/tests: print more debug info

Just fyi that there is also
https://lists.xen.org/archives/html/xen-devel/2026-02/msg00751.html.
Can the two of you maybe work together to have a single resulting approach?

Jan

>  tools/tests/Rules.mk                          | 60 +++++++++++++
>  tools/tests/common/guests.c                   | 89 +++++++++++++++++++
>  tools/tests/common/guests.h                   | 11 +++
>  tools/tests/common/tests.c                    | 15 ++++
>  tools/tests/common/tests.h                    | 18 ++++
>  tools/tests/cpu-policy/Makefile               | 41 ++-------
>  tools/tests/cpu-policy/test-cpu-policy.c      |  7 +-
>  tools/tests/domid/Makefile                    | 37 ++------
>  tools/tests/domid/test-domid.c                | 11 +--
>  tools/tests/mem-claim/Makefile                | 31 +------
>  tools/tests/mem-claim/test-mem-claim.c        |  9 +-
>  tools/tests/paging-mempool/Makefile           | 31 +------
>  .../paging-mempool/test-paging-mempool.c      |  9 +-
>  tools/tests/pdx/Makefile                      | 37 +-------
>  tools/tests/pdx/test-pdx.c                    |  3 +-
>  tools/tests/rangeset/Makefile                 | 36 +-------
>  tools/tests/rangeset/test-rangeset.c          |  3 +-
>  tools/tests/resource/Makefile                 | 35 +-------
>  tools/tests/resource/test-resource.c          |  9 +-
>  tools/tests/tsx/Makefile                      | 35 +-------
>  tools/tests/tsx/test-tsx.c                    | 88 +++---------------
>  tools/tests/vpci/.gitignore                   |  1 +
>  tools/tests/vpci/Makefile                     | 36 ++------
>  tools/tests/vpci/main.c                       |  6 +-
>  tools/tests/xenstore/Makefile                 | 37 +-------
>  tools/tests/xenstore/test-xenstore.c          |  4 +-
>  26 files changed, 261 insertions(+), 438 deletions(-)
>  create mode 100644 tools/tests/Rules.mk
>  create mode 100644 tools/tests/common/guests.c
>  create mode 100644 tools/tests/common/guests.h
>  create mode 100644 tools/tests/common/tests.c
>  create mode 100644 tools/tests/common/tests.h
>  create mode 100644 tools/tests/vpci/.gitignore
> 


