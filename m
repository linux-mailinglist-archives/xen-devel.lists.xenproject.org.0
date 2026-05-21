Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0DAZEzElD2paGgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:30:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07665A8607
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2026 17:30:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1315425.1585243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5MC-00011Q-OX; Thu, 21 May 2026 15:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1315425.1585243; Thu, 21 May 2026 15:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQ5MC-0000zz-KV; Thu, 21 May 2026 15:30:44 +0000
Received: by outflank-mailman (input) for mailman id 1315425;
 Thu, 21 May 2026 15:30:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wQ5MA-0000zX-GD
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 15:30:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQ5M9-00Bmcw-S6
 for xen-devel@lists.xenproject.org; Thu, 21 May 2026 17:30:41 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2515-bab6-0a2a0a5309dd-0a2a450bcd50-24
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:30:41 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0f2521-212f-0a2a450b0019-d155dd2edc52-3
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 17:30:41 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-44a044cb827so4661959f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 May 2026 08:30:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eaa7d9daasm4129691f8f.11.2026.05.21.08.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2026 08:30:40 -0700 (PDT)
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
        d=suse.com; s=google; t=1779377441; x=1779982241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DAvMLbg/7zG1vkGGvBEOl2ZnGXTfXoDw/jP1mgIbf10=;
        b=fiJKwkZt05RIP4Ptx48RZuJeUXyiJrRs51rQ2NYxkq3+t9xfYCFePjG5b1WumOzmgA
         SLKVgCdi4tGkHCiLbAyhp3evyAjxF5mwj7YbK4e66tz37Ua7ld0/Qow1144thYQ5OVrX
         N09LFfSJec411+j2jb3dPoogdZqx1s/QSW2jK/TDafggoqgaVKBWCI0aHz3Yy5fDpk4k
         GAvM1zvl57VWq+9nBjPBck/Q12E97QjxmBUrmsy+16/hl1rMLlpnZDOomfDKwAdDtIo2
         TRTJAEjw0IStBOEkDO6izbZypfcwDKUVF71iCR/K8CY/mBaJ1mmjNXeIux4FDlNcYGrf
         31+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377441; x=1779982241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAvMLbg/7zG1vkGGvBEOl2ZnGXTfXoDw/jP1mgIbf10=;
        b=sgzUGWE4/EeLNFtE5F/A6KtPCMseOF2vCzQkB2vUlEnjEFWihfH7aq39quwx+RSggz
         BkUzIOOF7VFZJgke3ADVOO9ifUC4X3PfBQoLnYKr4aSjNs0SMMBgO+dXI8qNz9IZ1thW
         UohCVg9UWH5nJapICDu7YooG4xx714wL4eCRm/zs/G0aoqyvi8cuxKaK1yFTqd+i66WW
         xvLR8ZvTS/5Hge6ytipGR/XltADAgTYBlhoe+1QwFwTya0PG6RxceOMeKtLMCfZNQEwS
         F9O7HuTOUBSFDDLDdsewtXmkyTPOQZ+UrHINYMyAsinKNzJSofvdOiBjo9fgY7Vyms0I
         M3Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/4xbjkChYTw9N82zj2EBPW6rBJJkj6qk0qVqiMmx4zI1WDWHiHEK7/ra+h+Vw47krH4kCWP4Fzyvw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxfnbpJlVj/mg2GaCZAS2s9vG8lHH9Tpym9Fme74WdQBvsfhWE/
	yLw3oLmXu0xFUlmYY/WV4f9W4N5GvUQpCEHq+qMwAinxztv8xhg1h79xAWMjSsUqPg==
X-Gm-Gg: Acq92OG3u8u7cHozHzoTrr1+z2HkNQ7V7wvlRTPQ3R71gXRkcfOBE6y4h30ZhvpeoZQ
	KmykQJGkIR/Eekz+MnNOPUsMTyyCxcW4gZRvdpgYt6HGLZCuzCwN5Ui4M1lU5jjaEynkgki9c0D
	k1HpafQb+ozCWZExlyHQISHlInOGLD8qSdeXvXh2MQyDWZ+m2oLKqD+n798WkTxtN2X5XfDsXT0
	Q4Omw+NSkmqV861JTMeSY93/oaO0zSI7ImOhSXDkS69achvyua8mRqiJWkJTNlGqQ8gag4beug+
	ues8XS2da8Y0qeWlwCmQ3cmjfK8130tAODtZB9MmtMx9wL7ylo4ZGV2MlPgRNF121DkkssqRiEz
	RsSzNGzokM4EZvgutSu1YKHikTn3DwVwmr++jt1ZeHLbGDG9yXif6E86/bst9zVSrtZkl5ZoP/X
	3WOwKmSxbxcpI9hztCv0VzbWor1pJjWlLmpO6OlQs9o/twF7P5dnTFWXb7eqeKccDLbcvOufpFk
	p33t78HjgrDDDc39NbUKWYGQg==
X-Received: by 2002:a05:6000:25f5:b0:45e:8547:f217 with SMTP id ffacd0b85a97d-45ea410993cmr4607220f8f.37.1779377441014;
        Thu, 21 May 2026 08:30:41 -0700 (PDT)
Message-ID: <1c5238c4-dc03-4204-b5c9-f94ac4c0a65d@suse.com>
Date: Thu, 21 May 2026 17:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/tests: Fix paging-mempool xen_pfn_t format strings
To: Luca Fancellu <luca.fancellu@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20260521152344.2050899-1-luca.fancellu@arm.com>
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
In-Reply-To: <20260521152344.2050899-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1779377441-1AD77F3B-9808D070/0/0
X-purgate-type: clean
X-purgate-size: 1515
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vates.tech,kernel.org,xen.org,arm.com,amd.com,gmail.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B07665A8607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21.05.2026 17:23, Luca Fancellu wrote:
> xen_pfn_t is not an unsigned long on all architectures. In particular,
> Arm32 builds see it as a 64-bit type, so printing it with %lx triggers
> a -Werror=format build failure.
> 
> Use PRI_xen_pfn for the GFN diagnostics instead.
> 
> Fixes: 66c982a5d3614 ("tests/paging-mempool: Extend to test P2M relocation")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

This looks okay, but while we're here ...

> --- a/tools/tests/paging-mempool/test-paging-mempool.c
> +++ b/tools/tests/paging-mempool/test-paging-mempool.c
> @@ -208,7 +208,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
>          if ( errs[i] )
>          {
>              rc = -1;
> -            fail("    Fail: check mark unable to map gfn %05lx: %d\n",
> +            fail("    Fail: check mark unable to map gfn %05"PRI_xen_pfn": %d\n",
>                   gfns[i], errs[i]);
>              continue;
>          }
> @@ -216,7 +216,7 @@ static int check_guest_marks(xen_pfn_t gfn, uint32_t mark_start, size_t count)
>          if ( *mark == exp )
>              continue;
>  
> -        fail("    Fail: check mark: gfn %05lx expecting %08x (%u), got %08x (%u)\n",
> +        fail("    Fail: check mark: gfn %05"PRI_xen_pfn" expecting %08x (%u), got %08x (%u)\n",
>                 gfns[i], exp, ~exp, *mark, ~*mark);

... aren't the two ~ wrong here? The message looks to aim at printing the
same value as hex and dec.

Jan

