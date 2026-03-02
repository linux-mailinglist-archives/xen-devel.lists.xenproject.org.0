Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAxYFiJvpWlXAgYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:06:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB11D72C4
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:06:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244134.1543596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx166-0002db-Hj; Mon, 02 Mar 2026 11:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244134.1543596; Mon, 02 Mar 2026 11:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx166-0002bt-F9; Mon, 02 Mar 2026 11:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1244134;
 Mon, 02 Mar 2026 11:05:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx165-0002bn-G2
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:05:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c90b2bd6-1627-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:05:56 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4398d9a12c6so3296550f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 03:05:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb776dfsm233971295e9.1.2026.03.02.03.05.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 03:05:54 -0800 (PST)
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
X-Inumbo-ID: c90b2bd6-1627-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772449555; x=1773054355; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=synUOoO4di3izuTF0VsHWZ83ix9ypOvwSIO3snD+w7c=;
        b=YK9Fr3UTvK3Eq+KrSo09OJA2FbW7QpIvqZZnzksIOkbpSww/t4QZa28V+xDN7z5eDx
         4yIG7gyGMq1vjgZi4RzyhMaERNKHQxfgJfdSlF+CQ/Sn11yJtAMdFdd920s5w6ZNXAMy
         uX3vVQX4brzgwGda2PGy5p5YEKue3mGZEOdBnG15vM8TARX5roo8bQ+blhK8I5TrEv0m
         YoORjJ6fz1ymuO75/NkkWSP+4oAr0KuMIGKn0FQ7kkgH3GfzFxrD8cr1WSWDgMeQ03W1
         HBU+6QP8yD34Da2C/W5ZDvCaEHpyiSSCyd32BCOq7CLWSixKXpU8FPu5qjK8CdvDz5EM
         st8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449555; x=1773054355;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=synUOoO4di3izuTF0VsHWZ83ix9ypOvwSIO3snD+w7c=;
        b=UPh2A0a2re3lyU6uHNa7tdnSCOZ1+9191LNOruElQo4rgIzAX6459OdcTyf/8Tbyqk
         ga6ycVqd8HjlPk2Zf2ZjKiPA+DenriVapd/wsRXmqICNKAYnv31a1PRva/han/Gs4Le5
         RZ0NmDJT0Uu+cBJFUGo9lSCqYnyAuk+hyYmf5j78OjGT6Jx40k5f9OEE6Q4lLApA7Jdo
         D9ACd5evY3yYYwjxkzQRl8VcehkgOa3xFQvGiGsEVHY2fbjD2qEdwBg425cbztj3gUpG
         npHhTGx/z4nehUWYEutp/ifgVn9hck1XhOpr8NkNekTPPbqL6LiYN8+D1FKr2o0pD79K
         dH0g==
X-Forwarded-Encrypted: i=1; AJvYcCVR7G5w7JGcBu/8Cza6gGiMFuT0ltIdPSa9aCQfzd1481W/DiP+15JzSKIf10SLf20aaYBwK/dPQx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2CCdkMcm4hsaIepgutNLPro/kibWd1nYMmsvLESEX7AiFr4v5
	JEZAqepkc/LqZU40Q8d1VyEjbZpKeJX8uWANbL6jAs6rJ0M1wTxurPzOY6Pq9SQZFw==
X-Gm-Gg: ATEYQzxY3IPuW0Gn8cDH8vBFwCQNgD89q0B8sQIqeFatcYStngJpgSUFMLnknMzY+fR
	ojSncAeHC26TOOwexT/rUy2bflWCdDK61km1HRASa4v5GDqmG5/xKDVvXiUNV+TBiT1rm6OtTip
	jTY/nVVKUBNYjnxLZJgWvMXcxBPnnQh89QlWc9Ri1EegrweAkEI5sY4gSz4pmtKr3akSV6RNKvG
	pI/64P4Fpy1QXDnO9xsWN7zZr7v+vcbbkcXCn2Er9KCAf/+TyjDxkrToRWYiB31QNvL5BGEwlyY
	VPVSkZ69hi9c15bHkfv7CmhEazQnc48fcSkttSW3nL2B4ozWlBzAqAnVD5cebJvO1YBJvhHMymw
	rkx9T2HIBHHbWJaHkrFT/TQjWJZngP/nKdyrGO4rnjjtHGwQtR/PbNh2tWRGOSVAo1mIvWQwrx/
	/MhNMIWVfaC3ec5U/9BQYvc0uhQ+yMyh2XG527NHNw33uAf6CrLsGN/FQdiunD06Glc6I6NV8rX
	TmscqQEu/7EALI=
X-Received: by 2002:a05:600c:8718:b0:480:1b1a:5526 with SMTP id 5b1f17b1804b1-483c9bde838mr208233985e9.16.1772449555158;
        Mon, 02 Mar 2026 03:05:55 -0800 (PST)
Message-ID: <b7fd4685-1c46-428b-8f5d-b6eb447f0ee7@suse.com>
Date: Mon, 2 Mar 2026 12:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Excluding init_on_free for pages for initial balloon down (Xen)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>
References: <aaRVcVmtv2UBD-GF@mail-itl>
 <513e624f-35c1-4d43-ba3f-c96af613d400@suse.com>
 <224968e6-7236-4efe-bcc0-ab39ac0c6c45@kernel.org> <aaVuB3x3y4ROr5XA@mail-itl>
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
In-Reply-To: <aaVuB3x3y4ROr5XA@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marmarek@invisiblethingslab.com,m:jgross@suse.com,m:xen-devel@lists.xenproject.org,m:boris.ostrovsky@oracle.com,m:akpm@linux-foundation.org,m:david@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BBBB11D72C4
X-Rspamd-Action: no action

On 02.03.2026 12:01, Marek Marczykowski-Górecki wrote:
> On Mon, Mar 02, 2026 at 09:40:29AM +0100, David Hildenbrand (Arm) wrote:
>> On 3/2/26 07:36, Jürgen Groß wrote:
>>> On 01.03.26 16:04, Marek Marczykowski-Górecki wrote:
>>>> Hi,
>>>>
>>>> Some time ago I made a change to disable scrubbing pages that are
>>>> ballooned out during system boot. I'll paste the whole commit message as
>>>> it's relevant here:
>>>>
>>>>      197ecb3802c0 xen/balloon: add runtime control for scrubbing
>>>> ballooned out pages
>>>>
>>>>      Scrubbing pages on initial balloon down can take some time,
>>>> especially
>>>>      in nested virtualization case (nested EPT is slow). When HVM/PVH
>>>> guest is
>>>>      started with memory= significantly lower than maxmem=, all the extra
>>>>      pages will be scrubbed before returning to Xen. But since most of
>>>> them
>>>>      weren't used at all at that point, Xen needs to populate them first
>>>>      (from populate-on-demand pool). In nested virt case (Xen inside KVM)
>>>>      this slows down the guest boot by 15-30s with just 1.5GB needed
>>>> to be
>>>>      returned to Xen.
>>>>           Add runtime parameter to enable/disable it, to allow
>>>> initially disabling
>>>>      scrubbing, then enable it back during boot (for example in
>>>> initramfs).
>>>>      Such usage relies on assumption that a) most pages ballooned out
>>>> during
>>>>      initial boot weren't used at all, and b) even if they were, very few
>>>>      secrets are in the guest at that time (before any serious userspace
>>>>      kicks in).
>>>>      Convert CONFIG_XEN_SCRUB_PAGES to CONFIG_XEN_SCRUB_PAGES_DEFAULT
>>>> (also
>>>>      enabled by default), controlling default value for the new runtime
>>>>      switch.
>>>>
>>>> Now, I face the same issue with init_on_free/init_on_alloc (not sure
>>>> which one applies here, probably the latter one), which several
>>>> distributions enable by default. The result is (see timestamps):
>>>>
>>>>      [2026-02-24 01:12:55] [    7.485151] xen:balloon: Waiting for
>>>> initial ballooning down having finished.
>>>>      [2026-02-24 01:14:14] [   86.581510] xen:balloon: Initial
>>>> ballooning down finished.
>>>>
>>>> But here the situation is a bit more complicated:
>>>> init_on_free/init_on_alloc applies to any pages, not just those for
>>>> balloon driver. I see two approaches to solve the issue:
>>>> 1. Similar to xen_scrub_pages=, add a runtime switch for
>>>>     init_on_free/init_on_alloc, then force them off during boot, and
>>>>     re-enable early in initramfs.
>>>> 2. Somehow adjust balloon driver to bypass init_on_alloc when ballooning
>>>>     a page out.
>>>>
>>>> The first approach is likely easier to implement, but also has some
>>>> drawbacks: it may result in some kernel structures that are allocated
>>>> early to remain with garbage data in uninitialized places. While it may
>>>> not matter during early boot, such structures may survive for quite some
>>>> time, and maybe attacker can use them later on to exploit some other
>>>> bug. This wasn't really a concern with xen_scrub_pages, as those pages
>>>> were immediately ballooned out.
>>>>
>>>> The second approach sounds architecturally better, and maybe
>>>> init_on_alloc could be always bypassed during balloon out? The balloon
>>>> driver can scrub the page on its own already (which is enabled by
>>>> default). That of course assumes the issue is only about init_on_alloc,
>>>> not init_on_free (or both) - which I haven't really confirmed yet...
>>>> If going this way, I see the balloon driver does basically
>>>> alloc_page(GFP_BALLOON), where GFP_BALLOON is:
>>>>
>>>>      /* When ballooning out (allocating memory to return to Xen) we
>>>> don't really
>>>>         want the kernel to try too hard since that can trigger the oom
>>>> killer. */
>>>>      #define GFP_BALLOON \
>>>>          (GFP_HIGHUSER | __GFP_NOWARN | __GFP_NORETRY | __GFP_NOMEMALLOC)
>>>>
>>>> Would that be about adding some new flag here? Or maybe there is already
>>>> one for this purpose?
>>>
>>> There doesn't seem to be a flag for that.
>>>
>>> But I think adding a new flag __GFP_NO_INIT and testing that in
>>> want_init_on_alloc() _before_ checking CONFIG_INIT_ON_ALLOC_DEFAULT_ON
>>> would be a sensible approach.
>>
>> People argued against such flags in the past, because it will simply get
>> abused by arbitrary drivers that want to be smart.
> 
> Could it be named differently to discourage such usage? Maybe
> __GFP_BALLOON_OUT ?
> 
>> Whatever leaves the buddy shall be zeroed out. If there is a
>> double-zeroing happen, the latter could get optimized out by checking
>> something like user_alloc_needs_zeroing().
>>
>> See mm/huge_memory.c:vma_alloc_anon_folio_pmd() as an example where we
>> avoid double-zeroing.
> 
> It isn't just reducing double-zeroing to single zeroing. It's about
> avoiding zeroing such pages at all. If a domU is started with
> populate-on-demand, many (sometimes most) of its pages are populated in
> EPT.

ITYM "unpopulated in EPT"?

Jan

> The idea of PoD is to start guest with high static memory size, but
> low actual allocation and fake it until balloon driver kicks in and make
> the domU really not use more pages than it has. When balloon driver try
> to return those pages to the hypervisor, normally it would just take
> unallocated page one by one and made Linux not use them. But if _any_
> zeroing is happening, each page first needs to be mapped to the guest by
> the hypervisor (one trip through EPT), just to be removed from them a
> moment later...
> 
>>>> Any opinions?
>>>
>>> You are aware of the "init_on_alloc" boot parameter? So if this is fine
>>> for you, you could just use approach 1 above without any kernel patches
>>> needed.
>>
>> I don't think init_on_alloc can be enabled after boot. IIUC, 1) would
>> require a runtime switch.
> 
> Indeed.
> 


