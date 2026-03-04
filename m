Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHTPAWtUqGlutQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:48:59 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD48203405
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:48:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245697.1545042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoSR-0002Uu-Ua; Wed, 04 Mar 2026 15:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245697.1545042; Wed, 04 Mar 2026 15:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxoSR-0002T9-Rm; Wed, 04 Mar 2026 15:48:19 +0000
Received: by outflank-mailman (input) for mailman id 1245697;
 Wed, 04 Mar 2026 15:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxoSQ-0002Jq-Lv
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:48:18 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b3e01f8-17e1-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:48:09 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48375f10628so47190585e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 07:48:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851c907a08sm2074985e9.0.2026.03.04.07.48.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 07:48:08 -0800 (PST)
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
X-Inumbo-ID: 8b3e01f8-17e1-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772639289; x=1773244089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=szv7ibgFC1wfNHL1X56ycFpl6qWz9laDnmraUSEN+Jo=;
        b=WwNAHwefR03PASbf2b7rnpLaKnxsgLzx0nkm/cmKsihnHGYfnkE/xaeNfYvc8k6kjl
         VdW+3WGJGqYTbgAyoGIi2yT2nHqZn5g9yChvJE5kibNye4Z0Kaa/QVlP3qYIABA0G265
         En5exJtj3RQuNlucVdvBBL0v+RMp8KZBX1MwAsa0IB6mCNKIGZl2pO4QvG5C6vdNEvJB
         yNJiWKcima65pi0/V42Hj5v7NDPBKRJeMkwGlYH/OR9NUxjb4VijDYpyeD57vVYryyH/
         xLhw6LSmBAdyccvBSfdHSPggDJzzo+bN1SQE7jYm5MOlDUbUPqk9vDKXvu2NsRoD6iSv
         T4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772639289; x=1773244089;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szv7ibgFC1wfNHL1X56ycFpl6qWz9laDnmraUSEN+Jo=;
        b=oDEJmEPfsRhgl7e2pu6CVSOhqkOkRWvR8Ov8aBqOWa+Q+OGM7kzw4IsPa4G0T8be3w
         lpmV5D0zVVV/llBb2wPTOXiaKbR5AEWgwcSf0LX8Z4CwZao7R2TOBxcTp8jysVF5Yl2B
         rq+ImPumYM8HtRRSHj7fE97IeJM2+Rr1U+/6I4hdKFKjgSlwiPCBpNge8sBK37s46JTS
         96TUAV3Guyh2l4zciAnSGoCJDDh3tuwaEjltIxmvLHrXPKM0O3o0fVMKR4SCKlr3yy0b
         PJAyB+kQ52Fv1laFNDop8pOmBn9suF/UqoAXwP7r2fm5qsmUB/pJ5pU91GQPPm6loF6q
         RLhQ==
X-Gm-Message-State: AOJu0Yxjn/+0mK8YM23rW3Po0MZLX9Fns5Ss5vcO2hbBVbhZ+twOq4wp
	BMVs8XfKc7HPVocE23cAyMb0ClITgt1DWRmE8fNlMoKmGAHrqs/0ZNnsY8bYU6n15Q==
X-Gm-Gg: ATEYQzzkg/KXM8fd5D26//D440jZ/kPec0cqa+HEXW6/x9ttCFpIt8HIFH2fa/uYuNc
	ZFjS5Hcta6GtxTPTjRCf2jpC2NjEi+iWHyrMAgpt30p9DBlMcVtgyqCsAoUmM4Lj0t0aE0zjCRC
	Ws83gLUxs3P0tW2W8pLbzqXVFpznEmQlQlzC2TWEO5lb6sXWgOFcwnINtBUP7vMPs0+HjU/sOCc
	/svxbmiAOW8DS5+Z26oLMMImS7k6gNdxfzuINgyaEPAku/J3X4TgoYUseheR9jgedKNDeYEHilU
	1KQ/iq0zxha2zTwZuMe5JoS/quJXnIwdDedf5DcnPgQOiyyZj9i7Y7RrY1527YHSI/p93WOryJy
	jADoYn+3uV9B0gpXvdJFpWPviKIs/PN1MQtpS9v3ssm8Yts8/sxMIn2B+WeWom90hwehkkc4ce1
	EAw/WeOVM35NbQg6ngCv0vbjSsaDYMDtonjlic1cvTEnC3kxMBInb9ntZCPXDSPgO5Py10Um6gm
	mtcAfss8udDSY4VyjFRovBSXQ==
X-Received: by 2002:a05:600c:4e8a:b0:480:3a71:92b2 with SMTP id 5b1f17b1804b1-4851988ade2mr36628565e9.26.1772639289007;
        Wed, 04 Mar 2026 07:48:09 -0800 (PST)
Message-ID: <80129c3a-77cb-4cb1-b3fd-128454e3db0b@suse.com>
Date: Wed, 4 Mar 2026 16:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
 <aahSBk--J_xqEzOq@macbook.local>
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
In-Reply-To: <aahSBk--J_xqEzOq@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6DD48203405
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 16:38, Roger Pau Monné wrote:
> On Thu, Feb 26, 2026 at 10:01:45AM +0100, Jan Beulich wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
>>  {
>>      struct domain *d = container_of(head, struct domain, rcu);
>>      struct vcpu *v;
>> -    int i;
>> +    unsigned int i;
>>  
>>      /*
>>       * Flush all state for the vCPU previously having run on the current CPU.
>> @@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
>>       */
>>      sync_local_execstate();
>>  
>> -    for ( i = d->max_vcpus - 1; i >= 0; i-- )
>> +    for ( i = d->max_vcpus; i-- > 0; )
> 
> Is there any reason we need to do those loops backwards?
> 
> I would rather do:
> 
> for ( i = 0; i < d->max_vcpus; i++ )
> 
> ?

I think it's better to keep like this. The latter of the loops would better
clear d->vcpu[i] (to not leave a dangling pointer), and there may be code
which assumes that for ordinary domains d->vcpu[] is populated contiguously.
Hardly any code should touch the vCPU-s of a domain destructed this far, but
still better safe than sorry, I guess.

In no case would I like to mix both changes.

Jan

