Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +8hFLMgcMWofbwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:52:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D0C68DB8B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="C/YjfMAn";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338971.1600066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQSc-00041F-P2; Tue, 16 Jun 2026 09:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338971.1600066; Tue, 16 Jun 2026 09:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQSc-0003yS-L1; Tue, 16 Jun 2026 09:51:58 +0000
Received: by outflank-mailman (input) for mailman id 1338971;
 Tue, 16 Jun 2026 09:51:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQSb-0003yM-4n
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:51:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQSa-0095hh-HZ
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:51:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311cbc-bab6-0a2a0a5309dd-0a2a45039dee-2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:51:56 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311cbc-672d-0a2a45030019-d155802fa880-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:51:56 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b8ac62baso41897205e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:51:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa8b423sm65392005e9.11.2026.06.16.02.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:51:55 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781603516; x=1782208316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=05fGKlc1rUu1TVLYOAFiDjjkaHU95ZE7aSJ6WAMBQJU=;
        b=C/YjfMAnqkJZd3qlqQx/ZED+Qe4iNDs2HfxgrRSFNPdLOyrVQIVghhzexTJZNJ19b1
         NXKb9Wb8+IRcNlyzT5Io/686A7F0bAbwBXVcrZ6Yqn0PIfAQnTEoIAekDx1zUowp2nDA
         5226ZpIYJb92H3ieRMyknV93+TQWlF9o8dxBLj77KvGvz4IvM8eVI1ZKI4m4PzaSqxsU
         9uB1B3nj68n/bexewJxK/5qiyJAsamneYm9BqQkZ6w57pZPmyk9nAAoEvxA9Vky5Qq0U
         0Waa0gcYhwGKlF8u1ZhUmbBu4OJXJ00ALhOiJdjc2tBUMTJbzKPM817IHtmbDSY1wnJH
         qBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603516; x=1782208316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05fGKlc1rUu1TVLYOAFiDjjkaHU95ZE7aSJ6WAMBQJU=;
        b=DVGEVhdOxprp6DelRKwbebzRgaF8Tamo6grmW9kGa3EbHBMMDpoSMUVzZiXBDku+sw
         fVjrWSdOrf88hub96TdGaVsWjawGGLjNDpTI23i+MmDmtXop2oYmvaK1R/Ubx5RCwu6W
         i2TK9fK+o6QSe4OSCXczV5CdrfSqGgPKtPm9C1F2LwaJkYpIMmjr2D5iWZ947L1BvNlF
         ggDvdxny/K60py4SIOmQ2vQXrmWLL3xG1lDxtIQKp8wvi0va1vM/XsllhTlnQiqgb5s2
         uTNizKKbs8wL2ndOAPkKqqvZTW/amOW0fwQCr4KNsXn+IwUYSfCT62da1yKP4eDB2J+c
         CmlA==
X-Gm-Message-State: AOJu0YxNPWIBv7vLJTF9d7DyWOx5yzKUoie/OJMGvkLbSXAYl07utL1g
	pv8XuwsC9XNZROwkX8/77E9frtoot68w6bapi0tjHCDm6cPRmdoU4MgigIkQEf5VuBqowEtr2KZ
	16CA=
X-Gm-Gg: Acq92OGLLFEm39SL65jSSsDjXz35dMWsa6yO2I8i5tDnJW4L9GX90yjpZ9e33Rmb09Q
	TbLnmeCzn0d/chr1YQJapg8ibFozLknDZuyVnvH8ilZVQG4ii+BijoGz/36/id7mO9qdyOeohDT
	Idu6YhR4CrKabQyHSuEGlzYdzFrT2TxjZWXYdGTkSKVGaiXoTc5f4T97AtFN2456e+wLSHlFk2v
	52rcrAitfyAmZDrsXKiRPAB+ZbOGsy21BUN1hOTFroM0odCUS3eSaCIxnYpWgXYYPfD/PahkF9Q
	fvSiTDazBUlk7ApWsxiWNl7gords/Av/F/cJTKI5NHd5QvAvjMW5gbq6LEoBFl/4CvDlkgeuP3j
	p6QNqLZFa7l+EEcTsRHbIibSQqX6JzZ23iptr4vkHIu/Irz/aItpLVd0QW3p25s2O7/hkNLx3yJ
	uqYsvHCa/iN3rM/gtI8U5UOjIBGmntMNY2HgJvLeKJwxZuBDRz7p4WNX7T1qFbd38psn3Bakfw8
	kHLadqMyXHWCWY=
X-Received: by 2002:a05:600c:c4a6:b0:48f:e230:29f4 with SMTP id 5b1f17b1804b1-4922fafbd30mr36297345e9.15.1781603515634;
        Tue, 16 Jun 2026 02:51:55 -0700 (PDT)
Message-ID: <ccc5bc2c-8331-4624-a5be-a5b1d649b1a6@suse.com>
Date: Tue, 16 Jun 2026 11:51:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 7/9] domctl: restrict permission check for
 XEN_DOMCTL_memory_mapping's remove form
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <5f49f890-426e-4076-8326-c2fbff433a35@suse.com>
 <ajESc7Ae_0bzd3IV@macbook.local>
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
In-Reply-To: <ajESc7Ae_0bzd3IV@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781603516-3BB6C938-41553071/0/0
X-purgate-type: clean
X-purgate-size: 2283
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 16D0C68DB8B

On 16.06.2026 11:08, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 04:15:36PM +0200, Jan Beulich wrote:
>> Like is already done for I/O ports on x86 and for IRQ unbinding, check
>> only the requesting domain's permissions (for it to not interfere with
>> MMIO backed by another stubdom DM), but not the target domain's: Removal
>> should be okay even (perhaps: especially) when permissions were already
>> revoked.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/domctl.c
>> +++ b/xen/common/domctl.c
>> @@ -436,11 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xe
>>              goto domctl_out_unlock_rcuonly;
>>  #endif
>>  
>> +        /*
>> +         * NB: The double lock isn't really needed when !add, but is used anyway
>> +         * to keep things simple.
>> +         */
>>          iocaps_double_lock(d, false);
>>  
>>          ret = -EPERM;
>>          if ( !iomem_access_permitted(current->domain, mfn, mfn_end) ||
>> -             !iomem_access_permitted(d, mfn, mfn_end) )
>> +             (add && !iomem_access_permitted(d, mfn, mfn_end)) )
> 
> You seem to be doing the opposite of what the commit message states
> here, and checking for permissions on the target domain, not
> permissions of the requesting domain?

I'm always checking permissions of the requesting domain, while the
target's are now checked only for "add". That's what the description
also says.

What's wrong with the description is ...

> XEN_DOMCTL_ioport_mapping does check against current->domain, and not
> against d.

... that it suggests this to be the behavior at the point of this patch,
when it really is moved to that only in patch 8. The patches used to be
ordered differently earlier on. I guess I should change the wording to
be closer to what's used in "x86/domctl: don't imply I/O port permissions
from I/O port mapping".

> FWIW, we could also remove one branch here by doing:
> 
> ret = -EPERM
> if ( add && iomem_access_permitted(current->domain, mfn, mfn_end) )
> {
>     /* add logic. */
> }
> else if ( !add )
> {
>     /* remove logic. */
> }

Indeed I was wondering whether something like this would be worthwhile,
but I opted for the variant with less overall churn.

Jan

