Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMaoNIh++GmIwAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:10:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409954BC34E
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 13:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299692.1574245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrBC-0002l4-Bd; Mon, 04 May 2026 11:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299692.1574245; Mon, 04 May 2026 11:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJrBC-0002if-8W; Mon, 04 May 2026 11:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1299692;
 Mon, 04 May 2026 11:09:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJrBA-0002iZ-Ml
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 11:09:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJrB9-005XRw-JW
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 13:09:35 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87e6e-e002-0a2a0a5209dd-0a2a450adfcc-4
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:09:35 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87e6f-56b3-0a2a450a0019-d155802ee4e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 13:09:35 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488ad135063so35221425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 04:09:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-44b63d78692sm21473485f8f.27.2026.05.04.04.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 04:09:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1777892975; x=1778497775; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GV6gOGLf9tk9qH5BYp/3y7eNhugFp4R5MsRVDKmonG0=;
        b=SjEh739bED3yPUfeutJZAzvBSjXY1hbe7b+vYrbXE8Lg/ui2zK546fKR0qGilumQSS
         ATPQcDsMeUUh2Tw6zl23MQKL1OToyOrbUKwgcLSdnqB53u8CYSMrsUB29L2uS479djlE
         i+hHgxNH3kY9ITAklZoQfGgmjOQn59XI3J/MD2C2CCgGbfEAZW3U21RxQSwEQlKT8NdM
         c3J2RsE1+AcZyu+hmH3m0jIJBsBF3nh8ZzklMirEKBOO4zu1bJSNPGVpxyKVetoBIDp+
         nXPUgzOFlo+VzINebmCuU0u+KLDD+gtq5XGgH6RBm/K59FnfDvLMb3irHf0DSs24llyz
         YKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892975; x=1778497775;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV6gOGLf9tk9qH5BYp/3y7eNhugFp4R5MsRVDKmonG0=;
        b=DEetxSdNhnnJUAdt1w9tget4TnNk2BO0fj4eBi8Tj+eBPiJoBW/cyZwKaAr3TWXlnq
         eChtYfZx4LqXy0VhUJIB179z7CWvx9kVjj1eb0yD6FCoW4uLm29GK3pue0bSPXHBvxik
         QA1rtKcTRHpSTN5tWwc/wqY1xTUQ9QjJt479LCFADEMRFeL4YLldvTN9uNT0XMnzSB9N
         7U/cHwbZdTyWNIzJw4JoW87pPK/cArZwkkcb77Fbb7KW3beDPwO0dttzpGXQV0Z3bphF
         MMuiA/I+Qpu3iD6NSTnI92b5XJ7kvqTuCqEcauEI/2BUbb6FXUtIXDWF7Dq/X4GJSH+R
         AvQw==
X-Gm-Message-State: AOJu0YwxZnXml64C1G3o0JT+47zmOPo6DH8CDKrR8Ao57kjJb7eKOwSQ
	+IYN4zMc+cpMtwXDSpg50lFgDW2mVHZS5PC3crx8n5t4xfK16Y4fFhJw0RAOstex1g==
X-Gm-Gg: AeBDiet9x2OIEzypDuH9LaDe5VDwZwU6lB3xLECka3Bq7v4vbBkKmxz10CYRUz3NJjv
	P5D9CuMrHKG+poJE9/EzGqh6IRWUQcVc7UEE0l4+UIisZpicXxm46xyHrWx3WvA8Q25ZiWWsaRc
	bKqzVsZF5y1rUgPPAPVf7P2W0zMHmf0esR5cf/prUoakKo2zt6dk0tJCKM7EXXpE/4ehIXf5D2e
	8moof5kErMb3jvT6ZlNApPh1vf4SmAqY07G2zHck9p072ifJNDNjg59HRAwK1JF+048X0w6r0GE
	dqgAB5MOnS3npotD7kFgCGLMZ9euzA2E1+hi5NaaCqsvWyGl9AhIyFLASf3lfOA7sfbvyFMraZZ
	EgkXJ/Tsks3iijqKsZnfEClXuThXS351saYYq76t+2oTJZdFrQxv0x+tkW0YSwbuTQK4ARZJ9HB
	qKYWfwQCejXvdU0ZCv6xf3SEwgEbQRhdYo7WM4b/6HILxO57bSj85v2CPNPDMjbKLyaYcMWI7wj
	ieP6Ep+s1C6n9deOl0Y8CFrTg==
X-Received: by 2002:a05:600c:628d:b0:48a:56de:d620 with SMTP id 5b1f17b1804b1-48a988a223emr161931735e9.14.1777892974787;
        Mon, 04 May 2026 04:09:34 -0700 (PDT)
Message-ID: <f0bcede9-159b-4440-8bae-f6784da3e14c@suse.com>
Date: Mon, 4 May 2026 13:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] xev/hvm: Add HVMOP_get|set_ecam_space hypercalls
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-10-thierry.escande@vates.tech>
 <afC9XAtGOkug0qFB@macbook.local>
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
In-Reply-To: <afC9XAtGOkug0qFB@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1777892975-453638B7-FCB79E61/0/0
X-purgate-type: clean
X-purgate-size: 2590
X-Rspamd-Queue-Id: 409954BC34E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28.04.2026 15:59, Roger Pau Monné wrote:
> On Fri, Mar 13, 2026 at 04:35:03PM +0000, Thierry Escande wrote:
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -5195,6 +5195,58 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>>          break;
>>  
>> +    case HVMOP_set_ecam_space: {
>> +        xen_hvm_ecam_space_t ecam;
>> +        struct domain *d;
>> +
>> +        if ( copy_from_guest( &ecam, guest_handle_cast(arg, xen_hvm_ecam_space_t), 1 ) )
>                                 ^ extra space, here and at the
>                                   closing parenthesis.
> 
> Line length is also past the 80 character limit, same below in
> HVMOP_get_ecam_space.
> 
>> +            return -EFAULT;
> 
> This operation (and the matching get variant) needs an XSM check.
> 
>> +
>> +        d = rcu_lock_domain_by_any_id(ecam.domid);
>> +        if ( d == NULL )
>> +            return -ESRCH;
>> +
>> +        if ( d->arch.ecam_addr ) {
> 
> Coding style, opening braces should be on a new line.
> 
>> +            rcu_unlock_domain(d);
>> +            return -EFAULT;
> 
> This would better return -EBUSY

I agree, yet I'd like to suggest that this may want changing further: If
one can "set" the address, shouldn't one also be able to "clear" it? That
could (pretty) naturally be expressed by ecam.addr being 0 in the request.
Which would then require permitting non-0 .ecam_addr in that specific
case.

>> +        if ( (ecam.size >> 28) || (!ecam.addr) ) {
>                                      ^ the parenthesis here are
>                                      unneeded.
> 
>> +            rcu_unlock_domain(d);
>> +            return -EINVAL;
>> +        }
>> +
>> +        d->arch.ecam_addr = ecam.addr;
>> +        d->arch.ecam_size = ecam.size;
> 
> I'm a bit worried about a domain being able to set it's own ECAM hole,
> assessing all the side-effects of this might be complex.
> 
> Won't the code here better check the region passed in the hypercall is
> indeed not mapped in the p2m, so that trapping of ECAM accesses works
> as expected?
> 
> Also, how does the ECAM hole get setup on native?  I assume there are
> some magic registers in the PCI config space of a platform device that
> the firmware uses to position the ECAM space?

That may even be outside of any device's config space, e.g. custom MMIO.
I didn't check, but I guess that may also be the case for Q35.

Jan

