Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL+RC8mt+Wky+wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:43:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE5E4C8CC3
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 10:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300341.1574870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBNV-0004DY-Fn; Tue, 05 May 2026 08:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300341.1574870; Tue, 05 May 2026 08:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKBNV-0004Bq-C4; Tue, 05 May 2026 08:43:41 +0000
Received: by outflank-mailman (input) for mailman id 1300341;
 Tue, 05 May 2026 08:43:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKBNT-0004BE-Tc
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 08:43:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKBNT-008p5B-9P
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:43:39 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9adb2-bab6-0a2a0a5309dd-0a2a450b8962-36
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:43:39 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f9adba-212f-0a2a450b0019-d155802dcdd9-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 10:43:39 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso43995265e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 01:43:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48d1a98247fsm17639875e9.0.2026.05.05.01.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 01:43:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1777970618; x=1778575418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0//ladv0CDpbweCjcqd+Fj+nnO8JuT9nkhnkBOafoa0=;
        b=O03MCs4JJvlb4yFy1ILujIjPxReLEAIrlfxkRkSjXKcabrjfVevN2Re6cmPHqWBzNA
         xBmvt5otX1C+r1oDJJdQEFcmlucwasDIExgaOQfQBLgr+um0y5Q2VRpwLKdTWfI3t+4l
         ktv70Gusw1kxbVAcjmdTHQQzLdZmUMbKf0OmAeimdf7bXfQdIKNNqGqtzAx73H1+Brav
         EXeLB9v+Ir3x54thKsinmORTseO3DtkjT47MqK+UowV9dek2ZgjjbAeZpcH7pLbQocTj
         E9YVWIlpnrK1weyTSHnx5nvonX4PVEGywzFBg+MRJJkcUDNOan1TpUjAux1gyRCty12m
         ozPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777970618; x=1778575418;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0//ladv0CDpbweCjcqd+Fj+nnO8JuT9nkhnkBOafoa0=;
        b=EMzgoCi0K0Hw1QUK9JKqT0fIZ0zDLY71RV3SXxQk8qpG5uGEOH507p4yyzy2TzKPhd
         ix0zFK4QYl4jIXsEuL1IJUSZzVIP7MlEXWc60W4oI2MvuH7lE+x1Q9tMRQxL1Av9OI/R
         n83+TCNwK4b1fByB57SJAtNbectP8mYYV5PxO1Wz34SdQlz6VblaPO0N3k/MAcSvS0ID
         mSfvGcS+3kDwH7TSgrBF2Nb5YVGhfeo3yl09LYEL5ao01DwksUGiyclV7JIL3/9YQUKz
         7+aSF3WWUoYa23CouFxZXNYquBnbP8bDYqnBCf9z/d2DlvyUunwkWpufGoSsg1NKqLO6
         mhuw==
X-Forwarded-Encrypted: i=1; AFNElJ8ihXsptA4E2TYHi3uuP/WgiC00Id8eNxqVtV+kZbhTj0uxehR/qslTY+kFwAqb/pV7synG/QpOAi0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykuQxUU1eV+/dxJFheA17N+P6/30o9NyfFz/AJ01+fl9WJxw5v
	s5kapDd295eHWjhLui1Re2n4gh7ientYhsPNLSOl9Q7fjIYP7WZRV7QmBrVxjRqFDw==
X-Gm-Gg: AeBDieu/4drHtkIBthAvui17oc3evCmPQmpTLjOuZJuxK1IoKYgVuDBQZUCoU4AbIzs
	7q0YzZsurugU9rQLuvR/qjVZYaMe4oU/OwHbH3s3ybG7cAPvsFcL7rPQnGgxgKXWSboo4dhhtpR
	x9N0rM/HC+6L+FyhRIcTnJdboZFRpIJ+MbpZb2F7CVKSoUPEAmIQZHXh6N1HrJP7sPZF48EDBrS
	BH+LgTzraUHJbk2zbhUIKRgselAo1eT3U/M7wlBdx+cF8vtfpTTCnRQgAFNewfnIPutxfZH+56Z
	wnX+dARUHymTLDC2wdXj7qOzz9u0+DVJlS/BTB/mf9YFJCaHddIEu9ZnSwvvYUr6d9jkDaA7W3y
	DLpreP+wpNK8GvU6eJjbgmI7PtPpF7HetvhsCbAB34D5rNb9OKw5VOeQCdY6EKxCN3Lm70Xfzt4
	k/gtE74Js3+UgDq/lfj+2sS/U8y2Ax2sK/0XBbhwlezRDBErswlziV2bhJSKsBZaAklOD9g8zrX
	3ihSsimRkKBRB0+TlDRlnTU8Q==
X-Received: by 2002:a05:600c:a30a:b0:485:30d4:6b9e with SMTP id 5b1f17b1804b1-48d18ce275fmr22165355e9.21.1777970618561;
        Tue, 05 May 2026 01:43:38 -0700 (PDT)
Message-ID: <6b241236-ed6d-4ada-beac-8f660bd55185@suse.com>
Date: Tue, 5 May 2026 10:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/xen: Fix a potential problem in
 xen_e820_resolve_conflicts()
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20260505080653.197775-1-jgross@suse.com>
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
In-Reply-To: <20260505080653.197775-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1777970619-7DB68F3B-5902DA93/0/0
X-purgate-type: clean
X-purgate-size: 2539
X-Rspamd-Queue-Id: 9EE5E4C8CC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:boris.ostrovsky@oracle.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 05.05.2026 10:06, Juergen Gross wrote:
> When fixing a conflict in xen_e820_resolve_conflicts(), the loop over
> the E820 map entries needs to be restarted, as the E820 map will have
> been modified by the fix. Otherwise entries might be skipped by
> accident.
> 
> Fixes: be35d91c8880 ("xen: tolerate ACPI NVS memory overlapping with Xen allocated memory")
> Signed-off-by: Juergen Gross <jgross@suse.com>

First, while trying to review this, isn't there another issue in
xen_e820_swap_entry_with_ram(), in that

			entry->addr = entry_end - swap_size +
				      swap_addr - swap_entry->addr;


really means to be

			entry->addr = entry_end - swap_size +
				      swap_entry->addr - swap_addr;

(affecting non-page-aligned E820 entries)?

Further, that function converts swap_entry to the page-aligned superset
of the passed in range. How is it guaranteed that this new range won't
overlap with the predecessor and/or successor one? Wouldn't that need
to be conversion to the page-aligned subset instead?

And then, is passing the page-aligned superset to xen_add_remap_nonram()
really appropriate? Why would any leading or trailing space there be
subject to remapping?

> --- a/arch/x86/xen/setup.c
> +++ b/arch/x86/xen/setup.c
> @@ -695,17 +695,22 @@ static void __init xen_e820_resolve_conflicts(phys_addr_t start,
>  		return;
>  
>  	end = start + size;
> -	entry = xen_e820_table.entries;
> +	mapcnt = 0;
>  
> -	for (mapcnt = 0; mapcnt < xen_e820_table.nr_entries; mapcnt++) {
> +	while (mapcnt < xen_e820_table.nr_entries) {
> +		entry = xen_e820_table.entries + mapcnt;
>  		if (entry->addr >= end)
>  			return;
>  
>  		if (entry->addr + entry->size > start &&
> -		    entry->type == E820_TYPE_NVS)
> +		    entry->type == E820_TYPE_NVS) {
>  			xen_e820_swap_entry_with_ram(entry);
> +			/* E820 map has been changed, restart loop! */
> +			mapcnt = 0;
> +			continue;
> +		}
>  
> -		entry++;
> +		mapcnt++;
>  	}
>  }

Given what exactly xen_e820_swap_entry_with_ram() does, restarting from
entry 0 looks to be needed only if the non-RAM entry ended up moving down
(strictly speaking even there it wouldn't need to be entry 0). If it
moved up, simply not incrementing mapcnt would look to suffice. Since the
extra overhead is likely tolerable here (with simplicity of the code
being more important), this may want mentioning in a code comment (or at
least the description). Preferably with that:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

