Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BmLN04u1mkUBggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:30:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F5E3BA89F
	for <lists+xen-devel@lfdr.de>; Wed, 08 Apr 2026 12:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275659.1561422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQB0-0004ET-3p; Wed, 08 Apr 2026 10:30:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275659.1561422; Wed, 08 Apr 2026 10:30:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAQB0-0004BS-0p; Wed, 08 Apr 2026 10:30:26 +0000
Received: by outflank-mailman (input) for mailman id 1275659;
 Wed, 08 Apr 2026 10:30:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAQAx-0004BM-SZ
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 10:30:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAQAv-005Dp1-M6
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:30:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d62e39-2eae-0a2a0a5409dd-0a2a4502d408-40
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:30:23 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d62e3e-42fa-0a2a45020019-d155dd32bd2c-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 12:30:22 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43cfd96354aso3747033f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 03:30:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d27a8sm58069456f8f.17.2026.04.08.03.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 03:30:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1775644222; x=1776249022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2Pf94YWijPYUnVaNF1+VESWUoq9N5V67EaNnKmtQhk=;
        b=cCdaPU4aP+IISF9JH8U9nEiCU4Wogr1VMXQ0HenuA69hL3OkuvSMT0ydmhHk5dGxNB
         4ft/s8joiSppHziDj9QzA5pv90FG5KMZZ3lE51UfTrzlsSK4QW1eVQEhQwCVCYMT3+EO
         yn4hlHINzVujFlShQdZV4ihyIXBXg+ReawPJnuJTtrSPnqBcp/WfURODu6lNiQg8uDW9
         9ntINxzYIIBQ8r6Vu6a3e+nBtvnJ/RYOw1GXQYcdvLFFe6ZMmLTgdZEi/VN+DntWTgYp
         FuxvcLiBhFwvVYB3w4F+ueuNe0Q753DY0J+IuNPMvnIH2voP3IcF7cgGMTjbTUiR0/UR
         Q86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775644222; x=1776249022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2Pf94YWijPYUnVaNF1+VESWUoq9N5V67EaNnKmtQhk=;
        b=CXOZc8bs0uC0Mi3lukUblUIrwrACU8Qc1D+GR2bW+l7KzJ2TTaq0PcrG9ECal71Ojl
         mW7gdIlD73O8roWSFJgEDFx0pcaHVNUf45WP5HiOro0WxD/PbYIdTOWfNtyPMYAegJvX
         G84AQcjJM8nbFjXTVV1zN1OAClV+EBrMNdkFfKS3krAgWNiWNj1qi9IwEWH24gR1RgKR
         h/m64fRSK++dApghiX2ZGOR2PsUFDQgU3j+wyKhtPDbmqK/S3MaP9Eob3XrWRS7EK0xM
         fDWos8Y4+yJlP2N9NPf2PZmTQwMd5RlVZkCWzw1H37iz6IzwbD7dZGd/7XxqH2LAXLff
         vkvA==
X-Forwarded-Encrypted: i=1; AJvYcCVlxGsnE2YKG3KAHj8XqDf+3ymoWFPKFO/y3Jhb8g2+KdFEVkP5uRI4X7SLwHcZlHfPCr3IqBwaeQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxV8wRJm5zR2TMw4xGF1qnEih26FcYTnRFlntrbxmASnTZz9eCH
	A9XWHwt/Jh81bT5kiV7vf2MDx9rZtXOItwNu9pyr3GGrIWh8loyH+kEq0hGis+v5oA==
X-Gm-Gg: AeBDievXWWRuEtvr2tLYvHgt21lt96f24BQqNuo7vZwncYaErurEm/pUINRhpMol5UH
	s5ZgNiG5nHUPvgLqbPmzKMZx6g+D4C48JOzwBjTjykFnFOKpYYugy+sMvX05Qq+AS462MHLGkWs
	3dNXZzRSdvwFBc80Ueb3a6iJ9/zOE+dwlOnsiZ6DoK1WIy56a5bs8c8KDj+RMttqxZ+9CwHwGb/
	+l0iVmnI1QRIz/iGtJYVycnxvDdPSP1ugP1i6h2iFcejMWwGm2h5B8pJQHfg45n9HXKunKsx9kE
	Ckz4wPin1IMzM+U3THoEebkS1b7shrbeYtPKg4Mt5FSbr/40A8ntuLAy8PVDyGAXnfg0Ur2KrmB
	7zvcma9qvBOkfLla7iFGc5mr5m+awZiww24MFC4TuBsSW368PwKseaOFzMPjxDmOSfhJ9SbFq4M
	cdoWRqpuMy5lOHeK3fGBmujbsO3bBxgVa1o4iLmZb4kDUHjTj2NbcIikHYDBlnvRSikiHyK59Do
	esvcTkbA0e7z+M=
X-Received: by 2002:a05:6000:1789:b0:43c:f969:2e1 with SMTP id ffacd0b85a97d-43d29276481mr30118680f8f.6.1775644221542;
        Wed, 08 Apr 2026 03:30:21 -0700 (PDT)
Message-ID: <0463fd32-ffac-482b-a58b-d457389e9157@suse.com>
Date: Wed, 8 Apr 2026 12:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/x86: Check supported features even for PVH dom0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260402155512.80170-1-frediano.ziglio@cloud.com>
 <eb6e0314-423b-412e-af29-c423463d78dd@suse.com>
 <adYsZsPP8HOLeY1g@wifi-campus-l-10-3-197-236.u-ga.fr>
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
In-Reply-To: <adYsZsPP8HOLeY1g@wifi-campus-l-10-3-197-236.u-ga.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1775644222-AED20CD1-3697A19D/0/0
X-purgate-type: clean
X-purgate-size: 1513
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:freddy77@gmail.com,m:frediano.ziglio@cloud.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,cloud.com,citrix.com,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 51F5E3BA89F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08.04.2026 12:22, Roger Pau Monné wrote:
> On Tue, Apr 07, 2026 at 08:56:03AM +0200, Jan Beulich wrote:
>> On 02.04.2026 17:55, Frediano Ziglio wrote:
>>> --- a/xen/arch/x86/dom0_build.c
>>> +++ b/xen/arch/x86/dom0_build.c
>>> @@ -320,6 +320,20 @@ unsigned long __init dom0_paging_pages(const struct domain *d,
>>>      return DIV_ROUND_UP(memkb, 1024) << (20 - PAGE_SHIFT);
>>>  }
>>>  
>>> +int __init dom0_check_parms(
>>
>> I understand the "dom0" in the name is owing to the filename and perhaps
>> adjacent other similar functions, yet ...
>>
>>> +    struct domain *d, const struct elf_dom_parms *parms)
>>> +{
>>> +    if ( parms->elf_notes[XEN_ELFNOTE_SUPPORTED_FEATURES].type == XEN_ENT_NONE )
>>> +        return 0;
>>> +
>>> +    if ( is_hardware_domain(d) && !test_bit(XENFEAT_dom0, parms->f_supported) )
>>
>> ... if this was about solely Dom0, no is_hardware_domain() should be present
>> here. Maybe s/dom0/initdom/ ?
> 
> I think the naming of the feature flag is not very useful TBH.  What
> is the kernel really advertising when setting XENFEAT_dom0?  I've
> assumed it was the capability of running as a hardware domain, which
> requires a different set of functionality inside of the kernel to deal
> with hardware devices.

Yes, that's my understanding.

> We might want to take this opportunity to clarify in the headers what
> XENFEAT_dom0 means.

I'm not opposed, yet this isn't directly related to giving the function
an appropriate name.

Jan

