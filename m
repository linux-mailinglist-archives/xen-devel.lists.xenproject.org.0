Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGnzG9Sq1GmKwQcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:57:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D13703AA896
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:57:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274503.1560607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0N5-0002ef-Kn; Tue, 07 Apr 2026 06:57:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274503.1560607; Tue, 07 Apr 2026 06:57:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0N5-0002dB-Hj; Tue, 07 Apr 2026 06:57:11 +0000
Received: by outflank-mailman (input) for mailman id 1274503;
 Tue, 07 Apr 2026 06:57:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA0N3-0002d5-At
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:57:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA0N2-001BUm-CJ
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:57:08 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4aab6-5cb7-0a2a0a5109dd-0a2a4506a2a6-38
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:57:08 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4aac4-0df0-0a2a45060019-d155dd29e05e-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:57:08 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so4234561f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:57:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4e6224sm48003021f8f.25.2026.04.06.23.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:57:07 -0700 (PDT)
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
        d=suse.com; s=google; t=1775545028; x=1776149828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Fh16tsKNLfB+syP8WUFdmAE/unEga3r6/dAfO9ALguA=;
        b=Q7opw9MOMDOKPBhByk2t01/X3+nguoDjxyYLTJ2dkmvMKsJ/+vS550vKdQ4v+qltAD
         eGKaj+DaKn8XG1S0MQ5RMdsXZ94SRInbBKVgU6dM20t4too7qtwU9Fh4NfQLwhXaJzcv
         /RfhpAF3wTVAhbeNuzQs8P3Xskp8sZ69xHHXWsbnApL3j3x2ahECVxYnNCLj1gk6qJed
         I5QNRDM/NMFD0VuZuoMwqnsuf2p8yP/eIgVzvQ3fZ+/oAdQpm//gWPWIeYxpWV07uiQ1
         1iN4HThByS4EQemc1txGjXuauJ17iLzUydtQww6UNMjr+BkJeOw2DrKl6vuQolQBpEt4
         F2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545028; x=1776149828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fh16tsKNLfB+syP8WUFdmAE/unEga3r6/dAfO9ALguA=;
        b=npezqURYkoYzC9yO6FmNlRXR3T/Ay9azG7r5BrE4itA4GancPdrQAD7vKuaD5XfkeP
         TcFS/0ZwPSQbZyewZfwg6TgZxVZRlx5CSyYtXDspi81TGJRRQUocQ5nukjoqOXW8do+U
         ZUmnbR+aV6ZA8DSpt7L12p8cuGOFml+oT02BbbyLzWjwrMJXUw+sR89dYnXsFMfmC1Gm
         ktv/i2Cp0Iyo5mDccT01VVziW9o54OYG+QWNFYlNnW1J1r/yYxn/SHpS963xCge2WZUB
         KVAp+Qm97JpSPoOdXi6h194NQzmnKf5X2QNC0kH9Y3YOJpFviJaJ7y4IM+H+z9a3FtDA
         AxPw==
X-Gm-Message-State: AOJu0YwCmMP+rsmfMHBVvT7x1taJwECWd4JSODLXcJ3EkcZRd34ZQFhP
	CloNrZHLcxYxx7RFAZl8syaPxkORV1FF5o09Fw8BathkBo0JxMtGH5LsEn+9lTIxnw==
X-Gm-Gg: AeBDieu4c0Lwell+q6q495AvBphl6VecbKjknjdgTkSLgbJQiuUo6ILTxQWasOzPfqc
	4bESKAgEctHZsBYq9OsHwLWefpK5C/MbmVLXF/EzphmjhOUQTJLhyoTFlT47S04RCe6N7Zrphig
	/pXgHZdf8iRRiy2a2ibvZQUieO8P+0pQUUhbROU1sJTrNZlhuHWwTAsZEFUNSLexrf57BxRS6f+
	UU/vwbdGGn0wCiIs84E5n+c3/0HZYHcMy8+3Q86+FkaRi5Zw7/hZwtnGM4IVBUjikMTN7OIGEbu
	3bKtIut26xk3cUmmtsTIe0QlKz2XJXSmkzQXV9CH+WMipGHrGvM4Lc9R5it+FYezqwzlDEOup9/
	xGZQLSJGgmbgEhHZLB2fyhmjtsSK++IkfW0MaoXZcSeleh1geUuTBJFbSCB1XJ/eGWaypiXY8xy
	V2sTla12m1XOODchfnwslTPM4BSh0EBBrcw171mT8l1Pum0fM+qZLv4Waqfony77QEk14SSt+Yn
	KfLp5QO//xxt+8=
X-Received: by 2002:a05:6000:208a:b0:43b:9c73:2933 with SMTP id ffacd0b85a97d-43d2927f938mr20057301f8f.15.1775545027713;
        Mon, 06 Apr 2026 23:57:07 -0700 (PDT)
Message-ID: <572b62e7-30de-4a23-8602-98a38e02acb7@suse.com>
Date: Tue, 7 Apr 2026 08:57:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260402155512.80170-1-frediano.ziglio@cloud.com>
 <ac-SNHWwML98cLYA@wifi-campus-l-10-3-197-236.u-ga.fr>
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
In-Reply-To: <ac-SNHWwML98cLYA@wifi-campus-l-10-3-197-236.u-ga.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775545028-64A4C3D8-0D763C1B/0/0
X-purgate-type: clean
X-purgate-size: 2506
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[citrix.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D13703AA896
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 03.04.2026 12:11, Roger Pau Monné wrote:
> On Thu, Apr 02, 2026 at 04:55:10PM +0100, Frediano Ziglio wrote:
>> The supported features ELF notes was tested only if the dom0 was
>> PV. Factor out a function to check ELF notes and reuse it even
>> for PVH.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
>> --
>> Changes since v1:
>> - fix typo in title;
>> - fix minor formatting issue;
>> - use is_hardware_domain instead of checking is_pv_shim;
>> - reduce indentation returning earlier;
>> - return error instead of jumping to cleanup code.
>> ---
>>  xen/arch/x86/dom0_build.c             | 14 ++++++++++++++
>>  xen/arch/x86/hvm/dom0_build.c         |  3 +++
>>  xen/arch/x86/include/asm/dom0_build.h |  2 ++
>>  xen/arch/x86/pv/dom0_build.c          | 10 ++--------
>>  4 files changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
>> index 864dd9e53e..a33ce77321 100644
>> --- a/xen/arch/x86/dom0_build.c
>> +++ b/xen/arch/x86/dom0_build.c
>> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>>  }
>>  
>> +int __init dom0_check_parms(
>> +    struct domain *d, const struct elf_dom_parms *parms)
> 
> d should be const also.
> 
>> +{
>> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
>> +        return 0;
>> +
>> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
>> +    {
>> +        printk("Kernel does not support Dom0 operation\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>>  
>>  /*
>>   * If allocation isn't specified, reserve 1/16th of available memory for
>> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
>> index d69a83b089..f95a00acfd 100644
>> --- a/xen/arch/x86/hvm/dom0_build.c
>> +++ b/xen/arch/x86/hvm/dom0_build.c
>> @@ -699,6 +699,9 @@ static int __init pvh_load_kernel(
>>      if ( !check_and_adjust_load_address(d, &elf, &parms) )
>>          return -ENOSPC;
>>  
>> +    if ( (rc = dom0_check_parms(d, &parms)) != 0 )
>> +        return rc;
> 
> I would do the check ahead of check_and_adjust_load_address(), as then
> we could avoid the load address adjustment if we detect earlier than
> the dom0 feature is not present.  But that's just my taste.

+1, perhaps even yet a few more lines further up.

Jan

