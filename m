Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NUIoKADoM2rWHwYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:43:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 072976A022A
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 14:43:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KLIpuJWw;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341106.1601660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC5n-0007r0-F0; Thu, 18 Jun 2026 12:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341106.1601660; Thu, 18 Jun 2026 12:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waC5n-0007oB-BQ; Thu, 18 Jun 2026 12:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1341106;
 Thu, 18 Jun 2026 12:43:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waC5m-0007o3-8A
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 12:43:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waC5l-0040VU-Km
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 14:43:33 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e7ee-bab6-0a2a0a5309dd-0a2a450ac046-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:43:33 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a33e7f5-93a5-0a2a450a0019-d155dd2cc4e5-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 14:43:33 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-464192ab2e1so415635f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 05:43:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923a159ba3sm34035245e9.0.2026.06.18.05.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 05:43:31 -0700 (PDT)
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
        d=suse.com; s=google; t=1781786613; x=1782391413; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=C95d68+yZOE4HTb1CDtCaLcYo4vkjAiOMRUI6oXvhPQ=;
        b=KLIpuJWwO9c75OLfxKQsS/XQN/WJqjpseAtlU0s+Zn0srsXisW8vmjEyMP/e85gRUz
         tvmOUCigNtX4uDS2bBablecROxWdL8P+PeYXn1Ax1mi0UxO7TMNyV+z4RS2ipO1ZltAM
         1mbLxhRvqgc1i1+A9SnzyqmkJWX+GgAsmY+sgGPxolTBzJeOZtneruxQgpAfF3wXXXb2
         0fIOAPiSL2lDj3LVnVQDLYcKdb5O6cwyDUDzaw7gWD8jPBUOqg+TlCLAVPuDt0mOZ4qL
         QyicGPpUvdT5UpNv7IkzQ8qG5MAaY9XdltxHnSP/ETY4cJNmUOaR7igfePZe0ZF2zICB
         gi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781786613; x=1782391413;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C95d68+yZOE4HTb1CDtCaLcYo4vkjAiOMRUI6oXvhPQ=;
        b=nDlWug594cUT28MAXrqpvqRim81H4CGOgJfcnP5RL5HAx84rjTw/iV5boOBGnim00O
         hQST0bTYw0/ox4dk8UFjH3sVuBDGgIpe0ZNOqXordARYCEiFM411Xi63KOj0x098PfqO
         y99ibeOIVH2aHdcNl3V73EAkYq6nXlNxsXF0D5fKaPHsZ1B2LgReJMZWcqYq3wzLpG+Z
         fRmVZlObXPwuJXN7b5yeIaukSCvub8BKxVFtUWhNBdbKpiwuVZn/GMqC+KQAlOKVW12v
         5rjB6svNHq8kkXKsJHeAcfeGjpvln1oMbQvdW6IT0UVPl1MA2Sm/B9M+hpL0KhIPaWsQ
         j1Kg==
X-Forwarded-Encrypted: i=1; AFNElJ+V5iVbMRttiFf++hEF6LdKavqoHt2alkFifQhjwDH2Go8aoHp6v5N8hzQOfTgZvqqAy7J+MBgP49Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw42pTfFjcJBpyUUb4FCRXJuEnYqI2on+6zXHMsY+RcvLspE6Lg
	Mc94/ZDDfUgYPS0/aMuztYRhD06ZUuP5hxwDypHzk7LSsbJ+1wp3YXfmCaDMCrH/QQ==
X-Gm-Gg: AfdE7cm23VHVYWLwEtVD/i6exOKHYMQ0odUttTD17Eh17qXAwCv/bMlN8HgJzscECC+
	OqVWGzJhTZ1xAqGmWjh1kwA+pWRCRFAZgtESafYopobJvL4Id7ZE8d3lod3+1Nk6uPDJTERZfCC
	BHYLZkskkzQVgGbiaf8pfiGPybkUurKvtUbTjw69zr5uqA4C8n6xSZU3YlZm+SAl22VOFywf+E8
	7SIrg0djYgN3jGWI88dRNWTsdzxicJeyMbk6+kReE7Vs43BbpRYPrcyFVMZqxaY3YbyULYxd//o
	8lWRqgHxgoVK4AnM8WTWwtBFrlWaMUmZ0R4impynwfn8g+ah1N8xUyajXl920sYL86NqmSRtFV4
	Bb/OVbwHCbppk5ENtAdrABmmoAZR4kKH6qCZG14VNBPRfQqDHwWhaefTSpXftauK16sBKP1qMDB
	TLYapcn9rIm7cm0IA5p0VVj8sea2+Bh5cd2GXG10gctZQbS3VVOnjoulCdEugM8TjN1sFQKKo1r
	XP9HY64SgYDGyc=
X-Received: by 2002:a05:600c:8010:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-492382266cdmr58548215e9.30.1781786612379;
        Thu, 18 Jun 2026 05:43:32 -0700 (PDT)
Message-ID: <31bcc003-d876-4298-8edf-3fd3a07eda96@suse.com>
Date: Thu, 18 Jun 2026 14:43:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22] XSM: guard .sysctl() and .readconsole() hooks
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <bf642902-7235-45a8-a470-f164a930c0c1@suse.com>
 <8536e453-423d-45a0-bb82-38283eca4786@citrix.com>
 <0604a985-96fc-454f-b9a1-242bc6cce9b6@suse.com>
 <e5443d3c-a3ec-4698-b20e-b867f150aa5e@apertussolutions.com>
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
In-Reply-To: <e5443d3c-a3ec-4698-b20e-b867f150aa5e@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1781786613-B17F1DB8-A09E11DB/0/0
X-purgate-type: clean
X-purgate-size: 2126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.xenproject.org,citrix.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,citrix.com:email,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 072976A022A

On 18.06.2026 14:40, Daniel P. Smith wrote:
> On 6/18/26 8:23 AM, Jan Beulich wrote:
>> On 18.06.2026 14:13, Andrew Cooper wrote:
>>> On 18/06/2026 12:32 pm, Jan Beulich wrote:
>>>> Leaving the hook pointers in struct xsm_ops when !SYSCTL would lead to
>>>> the BUG_ON() in xsm_fixup_ops() triggering for respectively configured
>>>> hypervisors.
>>>>
>>>> While moving the #ifdef for the corresponding xsm_*() wrappers, also move
>>>> those for xsm_page_offline() (where the hook pointer field already is
>>>> suitably guarded).
>>>>
>>>> Fixes: c9eabaa03a68 ("xen/xsm: wrap around xsm_sysctl with CONFIG_SYSCTL")
>>>> Fixes: bddd9af6049f ("xen/sysctl: wrap around XEN_SYSCTL_readconsole")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Ugly.  We probably ought to see about booting the RANDCONFIG hypervisor
>>> too, which should be able to spot things like this.
>>>
>>> This is a regression vs 4.21, so does need including.
>>
>> Aiui it's a regression vs 4.20, i.e. will want backporting to 4.21.
>>
>>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, although...
>>
>> Thanks.
>>
>>>> --- a/xen/include/xsm/xsm.h
>>>> +++ b/xen/include/xsm/xsm.h
>>>> @@ -61,8 +61,10 @@ struct xsm_ops {
>>>>   #endif
>>>>       int (*set_target)(struct domain *d, struct domain *e);
>>>>       int (*domctl)(struct domain *d, struct xen_domctl *op);
>>>> +#ifdef CONFIG_SYSCTL
>>>>       int (*sysctl)(int cmd);
>>>>       int (*readconsole)(uint32_t clear);
>>>> +#endif
>>>
>>> ... this is now the 3rd CONFIG_SYSCTL in xsm_ops.
>>>
>>> I know it will grow the diff, but can we see about collecting them into
>>> a single region, and in dummy_ops too?  It will shrink the overall
>>> result, and the order of pointers in this ops structure is uninteresting.
>>
>> I have a far more consolidating patch in the works, which is how I actually
>> noticed the issue. I'd prefer to keep things as simple as possible here.
> 
> Would also be good to clean up flask_ops similarly.

Hence the "far more consolidating" - that'll happen (implicitly) all in one
go.

Jan

