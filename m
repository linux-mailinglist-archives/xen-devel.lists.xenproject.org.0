Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIkEJLvgCmqR8wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 11:49:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE7E56A0E9
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2026 11:49:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1311728.1581848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOuah-0002BU-Rw; Mon, 18 May 2026 09:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1311728.1581848; Mon, 18 May 2026 09:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOuah-000298-Of; Mon, 18 May 2026 09:48:51 +0000
Received: by outflank-mailman (input) for mailman id 1311728;
 Mon, 18 May 2026 09:48:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wOuag-000291-TN
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 09:48:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOuaf-008Use-ME
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 11:48:49 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ae079-bab6-0a2a0a5309dd-0a2a450ac1b6-28
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 11:48:49 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0ae081-56b3-0a2a450a0019-d155802ba5ae-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 11:48:49 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so11470205e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 02:48:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48feaa2a878sm121655855e9.1.2026.05.18.02.48.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2026 02:48:48 -0700 (PDT)
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
        d=suse.com; s=google; t=1779097729; x=1779702529; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Elz3+3vXcMkAfADXuRQNuRK7otMpj7E9wyS0gDnZ29M=;
        b=Bv6WOOlbUSBnR+UOMIHq8Biw6rTTIUFG5fgl6bePoMil1ZD5mcCOjGGSBbzZbZGrUq
         +1/IrCPUoJIA/MsiKG+CVmVreqitA9HvyKfmbETjImoCtcMK3s1ik7z/BYGTFcCI6CY0
         5OoOhAWf66ZSSLSkDVIeE7WtBDRBEbMoJvf9iIKbAQZ+O0m34AIdzan9S5XlesxI1De4
         hMWZbJVc54eP5uraoq30HI7o+oqXw+jxxkZsGdsG2UpDLy/tnzFjCSDu1hZlVNXa2Ri3
         ZJW0JIe6Spa33HTlbdBIvfGl4Niz+okReowaJHeoos6nPzY5hTqq9ITldMfFn8w/HGN1
         m6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097729; x=1779702529;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Elz3+3vXcMkAfADXuRQNuRK7otMpj7E9wyS0gDnZ29M=;
        b=XacZ4YXB3PlafHzUqwMcqTO9xD3axliBn9F69A6JjEMG74UfUqkej7zC2IC+PqxGlB
         7J0wF/4pkDIgl/44P9VsmQ/FSG/yKkOjyMaubtbZu8/OIQNDgPyTRjzFzzIlU2e1mKpH
         ObSVg5EHw495u+g9TjiuTWLj2+cJjCRQleeauIKYPfb2df0+330+Gv6++2p+FDPMUhVk
         Fbgc+256WkekEv7CAfoSGR8N7j7Ub4dlumFKJpEpu4canXjg4hwj1Bc21I7Oa4H9Tfhv
         nZ5J5jf2jttZ+3wa3uSmnUnyxnlQoDd2n81QKUVDdGcQ+pWz1mY0+mc3yPLyImcaUjsP
         UI1A==
X-Forwarded-Encrypted: i=1; AFNElJ9M7OIkfInCPcuoZxX92XEQx0l9iqnoNcby7cPDQCL1+VRbH2sBj+lKkHrO3Ha6lefw1AxTlAhX0EI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/EB865yb/GdrJQGeyo26/+imky6dzQwaFKwwC7B6VejcSvyhi
	ZnZHZ+2kySWXSGtezar0MC06E7YWvHVdypr2odFeyE5v6Mzlzlal9k0a1xC+TQq4Wg==
X-Gm-Gg: Acq92OEFYMzVkbacx7lu2H6yVZM9lC59tMt2JvPtovBe8LpnzYqMg/t/VCIsVHzfK/U
	Jong+eAMHsQTeotBIoZweq/id0fSDQhZML0LBzlfBWr80AXv1H6qoI7AuNoh7u0LqlTGS2Wgi+Q
	6YJemrIvj18XGUkLYKZ9cF/rtYOAvAohJZ3b0yvt2SDqVHNa8JHj4g/j1ygRvaLB7gMRFAmE5SP
	YCeje4oRLG1UgWPy4as36XCTHBZgxzwrFLIvfS3sfJYKgyVzryJrGrQYJXYWrGN3/6jJNrsnDh4
	6Z7sS/C5mArcKlCDIbkrc0oF22DGv3SSBcfigqwxnXCgSCxz+RYd/Ett+u57ALbV4teaDU8ChrW
	cEvg+TBlK0qrkf+m3uy9XK1pCkMJuLjycQXMYyGVC/lNW4VlTvyQj2bF3NBLBQdlLDKQ1qshhMf
	OFLQs3S7iL0naRnpnXBbcQHI/uiAj3ArWtZATImUdxapFZVNeCUjhJ8phKGPqTmvJ7hf6nPai9+
	HIPmwn0u36yxVJcgCwHdz3rzQ==
X-Received: by 2002:a05:600c:c4a7:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48fe539519dmr209155345e9.14.1779097729021;
        Mon, 18 May 2026 02:48:49 -0700 (PDT)
Message-ID: <784e95e0-1a77-46eb-a4ef-bc8be8c9b176@suse.com>
Date: Mon, 18 May 2026 11:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/MCE: adjust ID2COOKIE() for Misra C:2012 rule 11.2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bc9ed10d-5ae6-4d9d-af90-648931731a52@suse.com>
 <8ef5af19-7660-4ee9-9cf6-094c744abd0c@citrix.com>
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
In-Reply-To: <8ef5af19-7660-4ee9-9cf6-094c744abd0c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1779097729-7D9808B7-8E4CF4B9/0/0
X-purgate-type: clean
X-purgate-size: 1080
X-Rspamd-Queue-Id: EAE7E56A0E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 13.05.2026 19:00, Andrew Cooper wrote:
> On 13/05/2026 3:03 pm, Jan Beulich wrote:
>> ... ("Conversions shall not be performed between a pointer to an
>> incomplete type and any other type"): Add an intermediate cat to void *.
> 
> cast
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14351897188
>> (covering more than just this)
>>
>> --- a/xen/arch/x86/cpu/mcheck/mce.c
>> +++ b/xen/arch/x86/cpu/mcheck/mce.c
>> @@ -1264,7 +1264,7 @@ static void cf_check __maybe_unused x86_
>>  
>>  #if BITS_PER_LONG == 64
>>  
>> -#define ID2COOKIE(id) ((mctelem_cookie_t)(id))
>> +#define ID2COOKIE(id) ((mctelem_cookie_t)(void *)(id))
> 
> The interface here is horrible, because we're passing a pointer to a
> uint64_t to userspace and back.
> 
> But, can't we just cast through unsigned long instead?  The compiler is
> happy, and that feels safer than using a pointer type.

As per https://gitlab.com/xen-project/hardware/xen-staging/-/jobs/14416863057
that doesn't work.

Jan

