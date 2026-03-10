Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PQbKXRCsGlLhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:10:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A42545A9
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 17:10:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250280.1547747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzeu-0006Zc-97; Tue, 10 Mar 2026 16:10:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250280.1547747; Tue, 10 Mar 2026 16:10:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzzeu-0006XG-6H; Tue, 10 Mar 2026 16:10:12 +0000
Received: by outflank-mailman (input) for mailman id 1250280;
 Tue, 10 Mar 2026 16:10:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vzzes-0006XA-DR
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:10:10 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96812c5b-1c9b-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:09:59 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so42037655e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 09:09:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485244b6e9esm217818755e9.5.2026.03.10.09.09.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Mar 2026 09:09:58 -0700 (PDT)
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
X-Inumbo-ID: 96812c5b-1c9b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773158999; x=1773763799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKb99p8Z8dwMpOwrxkhYrxmhrN8VUsSCJFX1+xevsaU=;
        b=g1R21WKvdxVpPRmrTY+O28PIvaa/uNZCVJ7JIpkykS4dn+pDw/nWgdmt9gLkGJPYRT
         0e49uOR8CG5tIbMCeVFwxo0wnx6WxYlH3vjeZguVqz4TQFEdMEJODaqHsYZkxQ7aIKaa
         1IjSi3G/4XW19WoBSiYx3eH323z4LEJFKymxfuF4qsOAddEnS1X4eLmJrnEg3p/X8YLK
         UyNhz+1H8viNkklV7oq3TSols1NHbJQ9kvcbLNWR0W0411A5VHKS0b0sRsT1lqfIkbVd
         XQso/EJt6rfHWHqFMa2KL2H1MmkmWBk0qs6T6f+Vm73vt0MAdM7ymB4B1frR0n8wvnRx
         as6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773158999; x=1773763799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZKb99p8Z8dwMpOwrxkhYrxmhrN8VUsSCJFX1+xevsaU=;
        b=YS7Py1qAXCDaglKQLtldiRF9q+EgcCjTYVf5KAxjQPu/tnqpktKOHq/ScvRk724Ra0
         935H4kVec4UWT5tXOnBPt9JR/vL3VrXTDoCol20eigGH4aQmLtUjCEs5XmRFHCDvlip+
         9yDS9Rfr7pnl0kMQFAULkHEfgzj66InQJOrF8WycV0WCaj2hc2SWEAicoFt0PSK5wX7H
         pJzQBFS0MdwROkH3JJhnhqYOi3KDRjVtb8Z8S5ygvIGTIpbgaJONRzpQLNSL6N0Qmto9
         CXZs1Eh1eEjK+6IFYBabj+ljjxMrtdbJ/KneqPA7z3MSkofVUU+46aAftKJ7aC29cVTm
         6q7w==
X-Forwarded-Encrypted: i=1; AJvYcCVv7gNbls+tU08RKSSm7SSBmYFGHyrP5bRHvIp0vPjgMIsI6r4T/LwCREn/SHJc0GlCJdvssjlBRIY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSQXEALnotKJL0AX+F5VjmbSiVlUkzC+e1ntSmtjeFBBUglI4q
	s/sZgzgLT7ATNfeTBrT8PlpH/7Fe3UsEdG8c+SsIKwISnfclgTSdrK4W6TkH5lfJYQ==
X-Gm-Gg: ATEYQzwPnn6z/tn722zcZ1eLmU7Sa9EcL4eTOaBoT3wdekJ7a6ldmGHb8sdE/KBp2nH
	vTeEtXuyEuQhEoLJkZVDQAW/+SEAMM02x2zR9dG9iNGVVX+VGNVVQfQEYsys7F9J5Jz3G68zF0A
	jI0h7M0k5xIBA3NCKSTv2mLWpSMsiWhxvVhaWSpIvhBeErmr5C16fiFG6txTWG4ddZ/T2j4ix9n
	tjg33AOPOKyTiHjW83E73pAzYfe6vp1SLq2/uEog8hBzQ0iJKCyNDDNQBcn9leNkCAv96OkslgN
	/X6bocoNpPEnrz72ldt4Vfby+J/Zfd2AHSyb+gr1D+xD965UX5UCx7W5sOMpeIMq1UpSqHPrwOJ
	IxxGDX/RwnKgZStNKiYdmY3r2wF4PyVwpcsfE2NNRd8S17ZCKsfS4/aUoWhHpOYCds27jdL2RdL
	JjZUfLxc/3d+wZedAmoFmxfLUyZlYEX3at34Qk/YH8Y9jr/KQQONXlCN8JZBLyol69LOHlVNMKm
	FIZszMknOO/R4M=
X-Received: by 2002:a05:600c:c8f:b0:483:2c98:4368 with SMTP id 5b1f17b1804b1-4852695aec4mr261574495e9.18.1773158998968;
        Tue, 10 Mar 2026 09:09:58 -0700 (PDT)
Message-ID: <5724bdb3-bec5-4159-a4f4-9bdad39acd7b@suse.com>
Date: Tue, 10 Mar 2026 17:09:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260305130434.635276-1-julian.vetter@vates.tech>
 <20260305130434.635276-2-julian.vetter@vates.tech>
 <c73afb52-e39c-48c8-bf2c-41b509ca0dd0@suse.com>
 <a05e2d6c-5ba7-4651-b9d1-c1b502be0e7b@vates.tech>
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
In-Reply-To: <a05e2d6c-5ba7-4651-b9d1-c1b502be0e7b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 182A42545A9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 10.03.2026 16:56, Julian Vetter wrote:
> On 3/10/26 16:36, Jan Beulich wrote:
>> On 05.03.2026 14:04, Julian Vetter wrote:
>>> @@ -45,7 +52,8 @@ struct ioreq_server {
>>>       /* Lock to serialize toolstack modifications */
>>>       spinlock_t             lock;
>>>   
>>> -    struct ioreq_page      ioreq;
>>> +    ioreq_t                *ioreq;
>>> +    gfn_t                  ioreq_gfn;
>>>       struct list_head       ioreq_vcpu_list;
>>>       struct ioreq_page      bufioreq;
>>
>> This change in data arrangement should in principle be independent of the
>> step to supporting multiple pages. Hence it should be possible to separate
>> out. Problem being that just by looking here and at hvm_{,un}map_ioreq_gfn()
>> I can't conclude how you get away without the "page" field that struct
>> ioreq_page had. If you can get away without, it's not quite clear why the
>> field exists in the first place. If it's not needed, dropping it would be
>> yet another separate, prereq change. At which point the remaining pair of
>> fields could continue to be used, i.e. the change above then wouldn't be
>> needed; va could be renamed if need be, and its type changed.
> 
> Thank you again Jan for your feedback! I don't need the page anymore. 
> When I use vmap(), I don't need to keep track of it, because during 
> teardown, I can recover it via vmap_to_page(). Currently it's necessary 
> because in destroy_ring_for_helper we need the page, to be destroyed. 
> But I see now, on X86 the map_domain_page_global called from 
> prepare_ring_for_helper actually does vmap(&mfn, 1). So the page is also 
> from the vmap range. So for the teardown I assume a vmap_to_page() could 
> be used as well. But I also see there is a special case, if NDEBUG=1, 
> map_domain_page_global short-circuits to mfn_to_virt() for low MFNs 
> (putting the VA in the directmap range) and bypassing vmap. In that case 
> 
> vmap_to_page() would not work. So, this would be really messy. I would 
> rather switch the bufioreq also to an explicitly vmap()'ed page, then we 
> could remove the page pointer and both cases would be aligned again.

That's an option. Yet are you aware of domain_page_map_to_mfn()? Perhaps
that's what you want to switch to using in the patch removing the "page"
field. To then, conditionally or uniformly, switch to vmap_to_{mfn,page}()
when doing the multi-page work in the subsequent patch.

Jan

