Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GOBK6cDimluFQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:56:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 479A71123AD
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 16:56:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225642.1532198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTcM-0006yc-UZ; Mon, 09 Feb 2026 15:56:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225642.1532198; Mon, 09 Feb 2026 15:56:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpTcM-0006w1-Rn; Mon, 09 Feb 2026 15:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1225642;
 Mon, 09 Feb 2026 15:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpTcL-0006pv-BF
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 15:56:05 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2414cf1-05cf-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 16:55:57 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-43767807da6so1130155f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 07:55:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376686130csm15300743f8f.1.2026.02.09.07.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 07:55:55 -0800 (PST)
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
X-Inumbo-ID: d2414cf1-05cf-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770652556; x=1771257356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ugHtA7YKc9LJ7RGzKYW0Zgvr6ImA0BoAmJxsXtSlv2s=;
        b=B6v4dk5NW6mmvMUhcnzIGSfuNozO5QD7gubr5XIoaSQ96/DJjiJVmDLLf5Nc6NC8M4
         1lfpGX/gAGJ1tlnWbSsONDuOuk88Fq0FBtem5pBm8h6XehjWdlxniYKbdko15V1m39OW
         ukO6+9834VJnp2AtrdvanzeLpGSwN+elfuO5tTGjSso/xUu1hPNKernllL4V6qi+IwyE
         hYtYk/Zce+5XBQPN4k2NoACJzL5N9rlgz5Pa5+8jf+cRScUix2Is1RDabpr8sLSXZwbk
         YIbrlNEuuqYAJ7NJRBErq4OUB8v1PwqgdsnJfnHUROAGGxTfHEaHZmMwdqQuhW0F3ICg
         6PCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770652556; x=1771257356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugHtA7YKc9LJ7RGzKYW0Zgvr6ImA0BoAmJxsXtSlv2s=;
        b=eFd4VmWsaMzj5RVJXUUz/gCmU8+Zd+psYj8wqqOHAp+nxSXJ9y+tPnJqbZtglhBRhe
         0ZYyKstYD6UCydXM/rHaCeVBejT7LKBL8B2pOra+x2TPKLSqmtzrQIHUUYKrna5OTV0N
         tWGDb1VeSYSHlMyHYfPqGhPf6O5PX1ZzQKWYkDluCIQB/TSfBf2TMl8ymS90Rg3J7RK1
         YGaZDq+W89hL5Y3MZI7Qf5ulw31os+GbkQZFefIYCCybQr2+i1zPwqCKqb8C0Tjsal//
         +/bcN4KT4Vn231KMcqWeyFMhPLYnUmhjUkNc0aspek5YISWK0VCOH5L2ZSWzaExRQJH2
         z2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0sfdkGzWy10Anl8Q86jJe48jBXvjsCV40OHlR918nEIf5T1i8NVeksdjihDmmHZbch8m8R8FT3IA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzECykaaK6xcdQGrRlIBqeLSbNG2nwWRlBylL6amIpQ9OCX0v+Q
	HlOLxJaC112eP86kOvsJJF6Rx7s+MrmkaYIFo4nQDJ2yGwxGz0AcDtDIIb3YCYgs4A==
X-Gm-Gg: AZuq6aLKT4DSP5XcfxQi9uxsspyNR8TTyKGkqfx93gdoy/CNGVRV3eF9r51cKck8O7t
	PnKcO+sNo9BLZ5pF/Nm5GCjbbIX7qkHystPTqbot7oJbCRTwGCvy4ItNEC7XxhkKGS18qQ9t5en
	b8Vmtq0f/yL6G7WAt/z3yPf5390TcJmgo7VtZKudWbO7fw218n6BNiZUPVbOPfegSURn3ll5tEZ
	duIvI0lIbUJiyU1NvYXhYaI+g5bMtDw8UIdDLlZMimDESkdbjJ67PmDKeKwQCawHkxpEgudmmRJ
	4BS+PKGWDorJMTELXidqJ1pjXxpYkRMLSunyEo1sX5kL50f0m5mhXX6mszXYEnkATcyGX7h9OmJ
	m5GTy9eXKU+hFHA+CjYV+ltf6ZpDXiuXu8v79/U8jJeGQxcGbafEQkKjqwZ25n1Yv7dWaw39kOk
	hd6BKM0gU17LiT/waBUbcts1iaZJ0PL9dUYNgU/iIgzQUNajzUOOswdOKLW9Vy+VyxM/Tu7IUNQ
	tolGyyrV7/iIQ==
X-Received: by 2002:a05:6000:2503:b0:437:6b73:ffb1 with SMTP id ffacd0b85a97d-4376b7404dcmr7022383f8f.30.1770652556328;
        Mon, 09 Feb 2026 07:55:56 -0800 (PST)
Message-ID: <1c33beef-f638-4e62-b38a-8b79575adf18@suse.com>
Date: Mon, 9 Feb 2026 16:55:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Add Kconfig option for log-dirty tracking
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260209103118.5885-1-alejandro.garciavallejo@amd.com>
 <c5a9075b-6ed0-4778-b3ad-fe6647dad8b7@suse.com>
 <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
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
In-Reply-To: <DGAJ9XN03HPS.TC0OLO5PJN6H@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 479A71123AD
X-Rspamd-Action: no action

On 09.02.2026 16:24, Alejandro Vallejo wrote:
> On Mon Feb 9, 2026 at 3:48 PM CET, Jan Beulich wrote:
>> On 09.02.2026 11:31, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -146,6 +146,7 @@ config XEN_IBT
>>>  config SHADOW_PAGING
>>>  	bool "Shadow Paging"
>>>  	default !PV_SHIM_EXCLUSIVE
>>> +	select LOG_DIRTY
>>>  	depends on PV || HVM
>>>  	help
>>
>> Why would this be? IOW why would shadow imply log-dirty, but HAP wouldn't?
> 
> The logic is rather opaque. I admit I'm a bit fuzzy on the uses of logdirty.
> 
> I know what it's for and I could navigate the code if a problem arose, but I'm
> less clear about which other elements of the hypervisor rely on it (pod? nsvm?
> vvmx? shadow? hap?).
> 
> If it's strictly toolstack/DM-driven maybe it'd be more apt to have a separate
> LIVE_MIGRATION and SAVE_RESTORE configs where LM selects SAVE_RESTORE, which
> selects LOG_DIRTY. That's also improve some defaults auto-downgraded from the
> max policy just in case a VM is migrated.

It's save (not restore) for both PV and HVM, and VRAM dirty tracking for HVM
only. Ordinary HVM guests will want VRAM tracking, so compiling out support
for it will imo want mentioning in the Kconfig help text.

>>> --- a/xen/arch/x86/domctl.c
>>> +++ b/xen/arch/x86/domctl.c
>>> @@ -220,15 +220,15 @@ long arch_do_domctl(
>>>      {
>>>  
>>>      case XEN_DOMCTL_shadow_op:
>>> -#ifdef CONFIG_PAGING
>>> +        ret = -EOPNOTSUPP;
>>> +        if ( !IS_ENABLED(CONFIG_LOG_DIRTY) )
>>> +            break;
>>> +
>>>          ret = paging_domctl(d, &domctl->u.shadow_op, u_domctl, 0);
>>>          if ( ret == -ERESTART )
>>>              return hypercall_create_continuation(
>>>                         __HYPERVISOR_paging_domctl_cont, "h", u_domctl);
>>>          copyback = true;
>>> -#else
>>> -        ret = -EOPNOTSUPP;
>>> -#endif
>>>          break;
>>
>> Can a HVM-only hypervisor create any guests with this? I simply fail to
>> see how XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION would then make it through to
>> hap_domctl().
> 
> xl doesn't seem to call it at all. hap_set_allocation() is implicitly called
> through paging_enable() -> hap_enable() -> hap_set_allocation()

xl must be calling it, at least in the case where the paging pool size is
explicitly set in the guest config. The important point is - not all of
XEN_DOMCTL_shadow_op's sub-ops are log-dirty related.

It's also odd that you did make changes at the call site here, but then
left the called function (and its sibling paging_domctl_cont()) in place.

Jan

