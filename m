Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wiK7AELrTWpkAAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 08:16:34 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B07221DC
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 08:16:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=eSfpf6Fk;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356615.1611187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLZP-0001zj-MX; Wed, 08 Jul 2026 06:15:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356615.1611187; Wed, 08 Jul 2026 06:15:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whLZP-0001vw-JU; Wed, 08 Jul 2026 06:15:43 +0000
Received: by outflank-mailman (input) for mailman id 1356615;
 Wed, 08 Jul 2026 06:15:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1whLZO-0001vq-78
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 06:15:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whLZM-008bha-Ay
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 08:15:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4deb06-5cb7-0a2a0a5109dd-0a2a450ca842-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 08:15:40 +0200
Received: from [209.85.221.51] (helo=mail-wr1-f51.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4deb0b-f399-0a2a450c0019-d155dd33d5e8-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 08:15:40 +0200
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-47c6e9a694bso146998f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 23:15:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa0f2186bsm39179942f8f.36.2026.07.07.23.15.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 23:15:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1783491339; x=1784096139; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FS+okSTrlpGdNwPnNqvozFFhLfsc0f1GG8/L1AHK2l8=;
        b=eSfpf6FkzPnpVz5W0yBWXVGA8IEm+1/NNzVtbJEi3K3pxIVqfPnYlrXx2B+ZSOP8Br
         ii0sbXx5cmhUuDUGo98UmDDWkBmlsy34oVQu/4XIUSciJxQqpy1Euacij058LIupYALj
         //RfRYpAcLMEzH2AKvYeVwaTsTJZPKYzGUZjn4gIHy1FgGfZRoHAZG/C4Xe7c4c1OuK+
         3LpxCgYlLNoX/8H8DenMtnAL9FLJo2CxILoc14G2eezYly+eW8UokTmmcLXGSrMhS3Bu
         HGigDAjAe9IBpwE4+dLsPUlRCKbIaGJV+n8L3pv/Ee5i+s99CXqrjd8ZG5e1XcEFvg/j
         NTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783491339; x=1784096139;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FS+okSTrlpGdNwPnNqvozFFhLfsc0f1GG8/L1AHK2l8=;
        b=hpHPdLBZm4DeNB8bwjw8KgxX1SuSsPP08Ypizfh9C8rrrdUo/4KPrt1DYvSc/f7+4p
         NPdltV8J7njKuz4flRsVgQr0LyXyXv3ddeiOjk2LiswhWtVDTwJNdr5D1T0aZQuO9fzI
         1BkTYe3Sfeuu0GKe3QnXp/iEg2l9N/BdOjeKlRYv1xVZZaQv+aHa0PTHSO2J5dYrDvQN
         79R2A1n08ij2vQlwf53YtoBFId6tFkOkPuFQdy2zW4Y3ECn5KGwRmmYI9m+rxA6irgwm
         4Uj8AiIgBV7Kz9b/mmMJCGlYh3BtKcmyIa/GAmqo84nwZemgLjFv78AyIXShz3uEEmP6
         zXdA==
X-Forwarded-Encrypted: i=1; AHgh+Rq7Kfgp7NIESJXWM549b/Jymp9G5yGbcgOatnAgwH1tTOhCGCSSzSwcewmnCK0U1Blg1bgpyDRFlYs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwKHbfwBfIi/T3u4FfC0T2RUjj9Xo4R8Y+0TaNQ8suLSh+yYM0S
	FR4uqliMdFgLn+5TZw0l2FCFkUvQq1XhQQ1gW9qRU1KfgrExQPPfFZRPGxL/MJc6cg==
X-Gm-Gg: AfdE7ck4YOupMMbEuFi8uey7uwuBwR55Z6yNOs3nG6UnhZ2LDHI8aDCrMqznU7EmAvM
	k6Gpz6Y3P0vw46nTAP5ZW9wOSTm518JmU1yv/bJBDyKR3tLbl4U33wJnzhQEv6DINtAZTRQ4Kpu
	xl/flKhOTFF+lCONFftgnPa9GKA81aPQoBOy1HMlUECsLASGBBXEfmm9aD90SZaBA3WzdL4JuGt
	7Kzs2sK4DYmau7mWOQ9Gr6fGd+uimVAZxpwdaNtddErN2TwmjUdhENj5RsMA0MlHqkFKRjVG4nV
	OGWxm6ZPasKqxULJib60miHOxfy6p2DBGLiPwM99rxgAy+cUWhevjhAFvjJV3dtsq1qqOCgRX5Z
	G9iKt69kD75Sgg0O2aXWPerBl4m/g2prco3Whdj39sM3YxWIfaOs1H2hlCLtHnRMh7kZ0w8crio
	JL+r7O5K4dYby07FvEYZbyEDZwvmFm6E7/TQFHVvPMtsXr1YTULVdONMa3QgkVYErRR1h+A0KVl
	xjG
X-Received: by 2002:a5d:5f82:0:b0:461:9950:da50 with SMTP id ffacd0b85a97d-47df07a9521mr854249f8f.11.1783491339602;
        Tue, 07 Jul 2026 23:15:39 -0700 (PDT)
Message-ID: <21ec0511-bf7e-44fa-b6f6-99d9c4085eda@suse.com>
Date: Wed, 8 Jul 2026 08:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] dom0less: Prevent division by zero in
 handle_passthrough_prop()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cce2493855ce3b610a2d36cbcd149292254170aa.1783436517.git.dmytro_prokopchuk1@epam.com>
 <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
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
In-Reply-To: <e494980c-485e-4dc6-ba84-e40fd53442d6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783491340-93536D51-0C527B83/0/0
X-purgate-type: clean
X-purgate-size: 1869
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:dkim,suse.com:mid,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:dmytro_prokopchuk1@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,epam.com];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 493B07221DC

On 07.07.2026 18:08, Oleksii Kurochko wrote:
> On 7/7/26 5:16 PM, Dmytro Prokopchuk1 wrote:
>> --- a/xen/common/device-tree/dom0less-build.c
>> +++ b/xen/common/device-tree/dom0less-build.c
>> @@ -154,6 +154,13 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>>   
>>       /* xen,reg specifies where to map the MMIO region */
>>       cell = (const __be32 *)xen_reg->data;
>> +
>> +    if ( (address_cells * 2 + size_cells) == 0 )
> 
> Considering that this calculation happens second time here ...
> 
>> +    {
>> +        printk(XENLOG_ERR "Invalid address/size cells combination (both 0)\n");
>> +        return -EINVAL;
>> +    }
>> +
>>       len = fdt32_to_cpu(xen_reg->len) / ((address_cells * 2 + size_cells) *
>>                                           sizeof(uint32_t));
> 
> ... I think it would be nice to calculate that once.

Hmm, originally I meant to simply stay silent here. But now that you say this,
I'd like to express that I find this 2nd calculation of the same expression
bogus. If the goal is to deal with both values being zero at the same time,
check that (and nothing else). If instead the goal is to truly prevent the
divisor expression from ending up 0, that (and not a shorter surrogate) would
need checking. In particular, the multiplication by sizeof(uint32_t) can
convert non-zero to zero.

At that point the question then would be whether overflow (and hence
truncation) in any of the involved expressions shouldn't also be detected /
rejected.

Finally, as we're already touching on this code: sizeof(uint32_t) also is
bogus, and it is a good example of why sizeof(<expression>) is to be
preferred over sizeof(<type>): What's meant here is - afaict - sizeof(*cell),
i.e. sizeof(__be32). (Imo using sizeof() with the wrong type is worse than
writing simply 4.)

Jan

