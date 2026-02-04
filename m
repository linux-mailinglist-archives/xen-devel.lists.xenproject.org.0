Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHQSI5hag2mJlQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:41:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0626E73D3
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 15:41:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220839.1529252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vne3r-0002XX-EN; Wed, 04 Feb 2026 14:40:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220839.1529252; Wed, 04 Feb 2026 14:40:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vne3r-0002Vu-AZ; Wed, 04 Feb 2026 14:40:55 +0000
Received: by outflank-mailman (input) for mailman id 1220839;
 Wed, 04 Feb 2026 14:40:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vne3q-0002Vo-4u
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 14:40:54 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80e6e649-01d7-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 15:40:52 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-4358fb60802so556705f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 06:40:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e3a486sm7217308f8f.16.2026.02.04.06.40.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 06:40:50 -0800 (PST)
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
X-Inumbo-ID: 80e6e649-01d7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770216051; x=1770820851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig7495zagXTaV3LGRYpbGKDHbCMUmfDmDmN/xBZYsr8=;
        b=baNHan5o90IuMOlkI6w3b0voH1X5ujeJTpeEPCatAcQLvoqgr/WvQtAO/Sojm5F17J
         /9FbxUnntfitSiCmUuoZD+gEqWQ7BqJo10lVes2/vX1j6JUN6HJJkLSgRN9niWSS3H4J
         2ySEL7oGe++ysuaAU0w2N+aci+AFxVkHwYLQrjyAtwUDWONTjg1Wdgem5xsIShPOWbtX
         hSp90+pX24tGS0l4efd7QcdaKPvdaHvoifPV8k/hBcDJhSuHFeUiRqo6efprzKIDtZtj
         aTw33RR6CsKE0satE3dC+RGc3TDPzK5sRsgDqMDn+6BkSkzAQlC1NG6ZozP1Qkc7DJnB
         ucGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770216051; x=1770820851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig7495zagXTaV3LGRYpbGKDHbCMUmfDmDmN/xBZYsr8=;
        b=UgPN6IaQ5bWkwz/eQPdN7X76tUHxjzT5fOlNBOkKutAqxKFaUKq4MrSC/pQt9wI+hH
         69vhh7IhKCRP+JlGRY5y4JztS6YP2DIXZO4xOqwLd4F3i0CYWCQXcy9vYqZwWR1wKgzS
         vVS37Mnm7Q4ND2T2TRKKbA8lOmaoD/Q6UE6yZezG3CEqcoOB9Jp5Goorx95X0/9FtWnv
         hC3Nrcgtc+w1JS+LtkYI5saRhTIyQy2UaibJtp9PY7Z8ZQ3J7lIqCCTFEVjWE+sYrG6Z
         gnh0OPfYa3IVJtmx77cZMttwjKC1/VXWEdc3UYTVoYJWpERHq0cwd91jfcmossqPSLDv
         r2lg==
X-Forwarded-Encrypted: i=1; AJvYcCXRpaM4nfAT6P7f4hPrxBpd5ERJzV7WRcL8CTmHBcnWP1/bMnSXmSw/E84fvqFE9Yf4rkI3SXxGHps=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx8ZpIWJLtd2jgi5T21SYzX3fZKDvKbdNEHuHpdq9vXii4h7jbG
	1g6ZkLTE6t0Nyp8HyGm9iSqelt9WMLOulCs8f+ZGU0noV+0mPF6eeQD9s7kTTONAug==
X-Gm-Gg: AZuq6aJjJZzI89WA7XGcIIkAp9PD3t+gplTybfLW/1COLqCmwJV61SlTfvHCqcM5L/j
	nYoDBtixENObdoFiU+4PYF1C7l2tTOqTUspwAx8E3D9mspTmAOGwiS4pSX+JFKJC2YsRTdMRCCI
	5xa4rBSTkS92TnSQVxliqhpQeWFLsx1363DjKu78ng/3+QOaK0/NxUNwj3sC6Qz2uCfJCzpVKmW
	sEXYURfF1uek3BlJfLYuBIC2iMrT6fSqetTo1hiLPzBbvNyjsWE2ijqGnDgE7CeHUJEghsePqmI
	wIrBbNIJFMeraNH0t84FH1GusdohEgy9k/fg+oW0cY7vO+tb0aPA89CtrObHRVTvcGQQZOmsarD
	wlOm98SpaHocx9Nb7c+22deNHYJy/7ysIYi7DJ9ggirJdXyvFzhXz3StER9126BttK3QVWmtKG6
	9kfwUl2FVHuCrDpPKaJ0Ahqycrz3eVTLI+4SDP2smwet5elkOjl2J8KXeP1MV7UVq6x1wpBfkZN
	YA=
X-Received: by 2002:a05:6000:2890:b0:435:db93:7311 with SMTP id ffacd0b85a97d-43611439308mr11178227f8f.18.1770216051250;
        Wed, 04 Feb 2026 06:40:51 -0800 (PST)
Message-ID: <c7b3b54d-3550-4abd-a52c-365202133078@suse.com>
Date: Wed, 4 Feb 2026 15:40:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
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
In-Reply-To: <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F0626E73D3
X-Rspamd-Action: no action

On 04.02.2026 15:20, Andrew Cooper wrote:
> On 04/02/2026 12:25 pm, Roger Pau Monne wrote:
>> The limitation of shared_info being allocated below 4G to fit in the
>> start_info field only applies to 32bit PV guests.  On 64bit PV guests the
>> start_info field is 64bits wide.  HVM guests don't use start_info at all.
> 
> All shared info?  HVM does use it, but doesn't see the MFN.

I think it's really start_info that is meant here, as that's where the
restriction comes from.

>> +    if ( virt_to_maddr(d->shared_info) >> 32 )
>> +    {
>> +        shared_info_t *prev = d->shared_info;
>> +
>> +        d->shared_info = alloc_xenheap_pages(0, MEMF_bits(32));
>> +        if ( !d->shared_info )
>> +        {
>> +            d->shared_info = prev;
>> +            rc = -ENOMEM;
>> +            goto undo_and_fail;
>> +        }
>> +        put_page(virt_to_page(prev));
>> +        clear_page(d->shared_info);
> 
> I think copy_page() would be more appropriate.  That way there are fewer
> implicit ordering dependencies.

I'd strongly recommend against copy_page() here. If there was any data in
there that would need copying, it would need to be done field-wise, using
the compat xlat machinery. The layouts are different. It may be prudent to
assert that the original page is still completely zeroed.

Jan

