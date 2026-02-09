Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOkiLvX5iWkiFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:15:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCD111C64
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:15:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225599.1532140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSyN-0006wo-RQ; Mon, 09 Feb 2026 15:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225599.1532140; Mon, 09 Feb 2026 15:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpSyN-0006tu-NT; Mon, 09 Feb 2026 15:14:47 +0000
Received: by outflank-mailman (input) for mailman id 1225599;
 Mon, 09 Feb 2026 15:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpSyM-0006tl-Mi
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:14:46 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e916a6b-05ca-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 16:14:41 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so1285936f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:14:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43629745f7asm24198696f8f.33.2026.02.09.07.14.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 07:14:40 -0800 (PST)
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
X-Inumbo-ID: 0e916a6b-05ca-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770650081; x=1771254881; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw/e7qFA/uy55lgtUniJoilC/5fMrBjXrEN6CGnb1D4=;
        b=TxpZdCwS7vRjabqpJChZeU5lC4peVWF8EuADEPCnHU1MF8a2DIOlGTgD0VgNCyU/SB
         RKdQ1UaHUfEIoZ+aASZmS+yn8zhKtXh26HfKzdSthHsNM7aVGHwRkV6c0q+SRjj5Gm4l
         vDV8YcN3nyBVxvUYjd1ntEHRUdpQ7a8RrzBc8aaqmYFAgkquP5mjOpMv2bIt/qvyotvI
         vavFJ8qMZHXsjtNRjxReT+WR54QmyuBY3OgwpC7mmWEwL99yyNpDqFhEk9P2BzMLXrCL
         k3biTjyLCeLN2v/dYZSxsQs5OrggpLYrrheN6j/tk4zZ+IyiNlwXrjAVze2WryFiAj0I
         Pn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650081; x=1771254881;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw/e7qFA/uy55lgtUniJoilC/5fMrBjXrEN6CGnb1D4=;
        b=ZfJHVuTpL8TrEIFkyPMXsNX5l6zG9ktEmNB/Rv1lAtqCdb+vHZ33F8peZGNRE4t73r
         XV2yi8AC0GVnclKHIYHiWZZ2tHiDadoGpjZuqXqbnFtXrrbx5ysbxyPcp397l3Ib6Dyi
         2GdHA4azVrY1KTfjzqFrB4yoHcDD4gI4VJcPGRUD/Kn406okIKuLhVjEEVKqVmPs3Pht
         uyEnlVOwz+D8tl0ODdoeOcBU7zM0Eomfvt/5h5Ovp1GasPBgIO1S+f7JlBF0hiGgCL8b
         OAfpq4BE0e21+2PyP1GiOvl8YdGSnynf//AGdRvzy4N6Zkz6D2ulcoSWJREGqJsUj0sj
         CEJw==
X-Forwarded-Encrypted: i=1; AJvYcCVrgFqjlQ8jRYspl6i3wYYZDm74cMgv4clekmb2dvRBH0zr76H4oSef5WooFg6lGvrfOikUphVIIy0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxCuvhClm2sKSJuA9No6EGH5kjU//SxPr1PeSGwsZe+RLxCdmPf
	qHQlj3VFwpEUjUjq55DeiyFYZdUzxra0pUpCV3ImAbJUlVH9nfdUpiU/EAOdIB9yqQ==
X-Gm-Gg: AZuq6aJOV/9srwBU2RSRP+CsgNcqXeNB4nkgNsMrI1aL9iR3qGyHirU9a7Sne4bqUyJ
	I0MIw+BtYv9H0DzgJcu5tBUs+E8Bi15bZBh+eGyILym1smWwRqSjeNBCC+OQW+5+NKdq1Gl71ph
	kV7BmwWITpa2TSlGwLK1fo67BLgLZAsF8UNPyCCO+TDQRYWjRrSjvjgOjDVdTCgXs+3qZB1bfvZ
	yOQgAXX9yjwj6O6nhjO5nDl5Ablu/Jm+BRErCGg38ie0WFtryrGFqnHkd1Ev6IHHkhqa9Foa4XK
	R5J1fyODoHySO3C40Oe3BUHnT1/XHiPd4YCyqYKHCP5Hy2omsm+FCO7ntwhK3fwKNALsJDDt6Qb
	on/QyMQLOKb0aXvRHBbb2gJmQRBucdtsvqAZ/PXKQiRKuTheRCnVmY2akwe4HjUQK1i8zphczTQ
	e1bfYXx9kKueCaC8FfN4z9XWJkPlUPpHJqe2L8yCmFPyjylbjVtNcFPRmxdJW0ovYhFEO601N3g
	Js=
X-Received: by 2002:a5d:588b:0:b0:431:32f:314d with SMTP id ffacd0b85a97d-43629341fc1mr17611286f8f.25.1770650080443;
        Mon, 09 Feb 2026 07:14:40 -0800 (PST)
Message-ID: <6caea7dd-24e0-467b-beb6-3888616aab2e@suse.com>
Date: Mon, 9 Feb 2026 16:14:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/shadow: Delete the none.c dummy file
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org
References: <20260209104104.7840-1-alejandro.garciavallejo@amd.com>
 <fcbdc4bf-249a-4495-b0fb-434c0e793484@suse.com>
 <DGAIWLL4CNGJ.22MBOK3KETJG0@amd.com>
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
In-Reply-To: <DGAIWLL4CNGJ.22MBOK3KETJG0@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:tim@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 2BFCD111C64
X-Rspamd-Action: no action

On 09.02.2026 16:06, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 3:36 PM CET, Jan Beulich wrote:
>> On 09.02.2026 11:41, Alejandro Vallejo wrote:
>>> It only has 2 callers, both of which can be conditionally removed.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>> ---
>>> I'd be ok conditionalising the else branch on...
>>>
>>>     IS_ENABLED(CONFIG_SHADOW_PAGING )|| IS_ENABLED(CONFIG_LOG_DIRTY)
>>>
>>> logdirty patch: https://lore.kernel.org/xen-devel/20260209103118.5885-1-alejandro.garciavallejo@amd.com
>>>
>>> ... to avoid the danger of stale pointers, with required changes elsewhere so
>>> none.c is only compiled out in that case.
>>
>> I'm not sure I understand this remark. Is this about something in the other
>> patch (which I haven't looked at yet), or ...
>>
>>> --- a/xen/arch/x86/mm/paging.c
>>> +++ b/xen/arch/x86/mm/paging.c
>>> @@ -634,7 +634,7 @@ int paging_domain_init(struct domain *d)
>>>       */
>>>      if ( hap_enabled(d) )
>>>          hap_domain_init(d);
>>> -    else
>>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>>          rc = shadow_domain_init(d);
>>>  
>>>      return rc;
>>> @@ -645,7 +645,7 @@ void paging_vcpu_init(struct vcpu *v)
>>>  {
>>>      if ( hap_enabled(v->domain) )
>>>          hap_vcpu_init(v);
>>> -    else
>>> +    else if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
>>>          shadow_vcpu_init(v);
>>>  }
>>
>> ... these two hunks? In this latter case, I don't think the bigger conditional
>> would be correct.
> 
> It'd be about these hunks and the inclusion condition for shadow/. I suggest that
> because...
> 
>>
>>> --- a/xen/arch/x86/mm/shadow/none.c
>>> +++ /dev/null
>>> @@ -1,77 +0,0 @@
>>> -#include <xen/mm.h>
>>> -#include <asm/shadow.h>
>>> -
>>> -static int cf_check _toggle_log_dirty(struct domain *d)
>>> -{
>>> -    ASSERT(is_pv_domain(d));
>>> -    return -EOPNOTSUPP;
>>> -}
>>> -
>>> -static void cf_check _clean_dirty_bitmap(struct domain *d)
>>> -{
>>> -    ASSERT(is_pv_domain(d));
>>> -}
>>> -
>>> -static void cf_check _update_paging_modes(struct vcpu *v)
>>> -{
>>> -    ASSERT_UNREACHABLE();
>>> -}
>>> -
>>> -int shadow_domain_init(struct domain *d)
>>> -{
>>> -    /* For HVM set up pointers for safety, then fail. */
>>> -    static const struct log_dirty_ops sh_none_ops = {
>>> -        .enable  = _toggle_log_dirty,
>>> -        .disable = _toggle_log_dirty,
>>> -        .clean   = _clean_dirty_bitmap,
>>> -    };
>>> -
>>> -    paging_log_dirty_init(d, &sh_none_ops);
>>
>> How do you avoid d->arch.paging.log_dirty.ops remaining NULL with this
>> removed?
> 
> ... as you point out, the ops don't get initialised. Adding the log-dirty
> condition ensures there's no uninitialised ops (even when unreachable).

IOW the remark is kind of (but not quite) making that other change a prereq?
(See my remark there as to typing together SHADOW_PAGING and LOG_DIRTY.)

>>> -    d->arch.paging.update_paging_modes = _update_paging_modes;
>>
>> Same question for this function pointer.
>>
>>> -    return is_hvm_domain(d) ? -EOPNOTSUPP : 0;
>>> -}
> 
> Oh. This was a hard miss, true that.
> 
>>> -
>>> -static int cf_check _page_fault(
>>> -    struct vcpu *v, unsigned long va, struct cpu_user_regs *regs)
>>> -{
>>> -    ASSERT_UNREACHABLE();
>>> -    return 0;
>>> -}
>>> -
>>> -static bool cf_check _invlpg(struct vcpu *v, unsigned long linear)
>>> -{
>>> -    ASSERT_UNREACHABLE();
>>> -    return true;
>>> -}
>>> -
>>> -#ifdef CONFIG_HVM
>>> -static unsigned long cf_check _gva_to_gfn(
>>> -    struct vcpu *v, struct p2m_domain *p2m, unsigned long va, uint32_t *pfec)
>>> -{
>>> -    ASSERT_UNREACHABLE();
>>> -    return gfn_x(INVALID_GFN);
>>> -}
>>> -#endif
>>> -
>>> -static pagetable_t cf_check _update_cr3(struct vcpu *v, bool noflush)
>>> -{
>>> -    ASSERT_UNREACHABLE();
>>> -    return pagetable_null();
>>> -}
>>> -
>>> -static const struct paging_mode sh_paging_none = {
>>> -    .page_fault                    = _page_fault,
>>> -    .invlpg                        = _invlpg,
>>> -#ifdef CONFIG_HVM
>>> -    .gva_to_gfn                    = _gva_to_gfn,
>>> -#endif
>>> -    .update_cr3                    = _update_cr3,
>>> -};
>>> -
>>> -void shadow_vcpu_init(struct vcpu *v)
>>> -{
>>> -    ASSERT(is_pv_vcpu(v));
>>> -    v->arch.paging.mode = &sh_paging_none;
>>
>> And the same question yet again for this pointer.
> 
> However, on the whole. Under what circumstances are these handlers invoked?
> 
> They are only compiled in for !CONFIG_SHADOW. But these are only applied with
> HAP disabled. Are they for PV or something?

The .gva_to_gfn hook is clearly HVM-only. We still want to be sure to have no
NULL pointers around that we could stumble across, especially as long as PV=y.

Jan

