Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDVbA6HdkmlvzQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:04:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF63141D26
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 10:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233800.1537155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruWf-00073M-Rg; Mon, 16 Feb 2026 09:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233800.1537155; Mon, 16 Feb 2026 09:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vruWf-000703-ON; Mon, 16 Feb 2026 09:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1233800;
 Mon, 16 Feb 2026 09:04:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vruWe-0006yQ-9B
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 09:04:16 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 775eb687-0b16-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 10:04:14 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4834826e555so30163485e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 01:04:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5ebd1bsm489577495e9.6.2026.02.16.01.04.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 01:04:13 -0800 (PST)
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
X-Inumbo-ID: 775eb687-0b16-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771232654; x=1771837454; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Bs2PYfMa0cbiKKGf3Y4JKk2emM7T4Zm6jQmkZ4O+yHc=;
        b=Uh1FkSl2wprzxfkyYg47rD8jjmpTjA8jTNucBGlW/38HOgAYWVYJtNAEo+aigE0/Pt
         fxOAKci92JCV44GiUevNucPzgTmrNuiWJUX+qgPibGr9IlImi013Prd/l5EruGOMogRj
         1TLMgO7iLoEbMQjKbpN4A1MX6X785mcwuzSZLrw8IaSlLqjxoGukXjtdpyTtCOOmkzJv
         KYxJuHM7UqObn+3GbagNvNxmsyjrHh4A7yP/+l5cWaagxMEtFcrzDermaWZVvBcVytqu
         484EYmWVYzJMmNIvbHbdhFxTEGB7T9t0xyya6Ewv1MDZwQ/y4mqzYMyD72bj9TLSuaDs
         u8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232654; x=1771837454;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bs2PYfMa0cbiKKGf3Y4JKk2emM7T4Zm6jQmkZ4O+yHc=;
        b=PD0WU+VaJ8Nwvnpe6rwo0CM7oDEAm222wxoR40kLexrdjpt+VySWZA5zFyPfQfgWM3
         ryNw1HBMe5/KCAn2R253m5bVn25/n3/gToIOZIXqLBjPN+/OmqjtuMjooNMZwVuckt7A
         dQolH8tg8krUev1pSshYe/rjw1yXqk54NXbB1F7lLJfcww6WAUZylczuHhTpY7dLosK6
         DkLaAjpa6QZGlT5c61R0SAoXbxzKOxjrIjeeV5ZAO3niVYaOz7BkBftQv1n/sN+SIhaL
         BTv6GRhZGvho8xM0szWOIT5i/XPyS5UBkGl7RBoYyNFqjQnapTxyIl1b5mFyZQZDoaIi
         RF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXShZ74ogwQZxVZC+4Skh+0w/pVIiDh6ErO9y8mtPAXuxToDsMFMTBxFhbdn3yv179M50Q20xJ+7IE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJO5i/OD7xsTxxS5J/UpxpA0EA+ZFOZ50+2atvS6YrQVUN40W4
	jOVVkAPpij8+OMPfAE9+MljsXj/0dpAJxzaY3N54e/K2ud8YyAu7IkFBTKjiNwBv4A==
X-Gm-Gg: AZuq6aJkmQh4JSlRhEcin0Y2ygRd+xdx0f1EJhvb+aO6rvVn1ZIdolSYNgY2DoxcAVs
	YOj+HghKBFfj0gEpfofr4W6qQjf5TwaOXu7QQoAgpFCGCXeSDA4OqYjClQGICJL87531ECycDpf
	owt3HXO7mjimYHr50Eryg+RORPgtz9YT/piZ2PbVmr4rSqVl1vtuUS/CpccVLYcgrS7NWjTKl0Z
	ur0tEmTGULeYSA626s1EBKjzPhBi26QdYZDevFtjE9iS0WNRYTIBnhu3dgT1OkSkIqdR/wwTG/6
	29MZTVEwkvNEa/J6hLOmrU/SWZg+bP6PXKI4v7QigWH3q73ZkuKkRb5ZbtryWp8Gyljn1XTC2pg
	HKqLb3QA3IvnPC3RnVQpqXfq9/f4Mn55SQmNeWe8M5D9IhllKgORcyKiXoq+UPeaC5HcFeMWn6n
	pobcR3b2nO2CtTL7m1nN4hoGecoF9FVcziWfytaxS43DeDvLO9KLYP6TqCRmVAiM7+vbeOZZLou
	7ADjGV2uEBZiJs=
X-Received: by 2002:a05:600c:5308:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-48379bf78f1mr113746515e9.27.1771232654050;
        Mon, 16 Feb 2026 01:04:14 -0800 (PST)
Message-ID: <a1d3507c-6e24-42ae-93ed-271ef2d584da@suse.com>
Date: Mon, 16 Feb 2026 10:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/5] xen: change VIRQ_CONSOLE to VIRQ_DOMAIN to allow
 non-hwdom binding
To: Stefano Stabellini <sstabellini@kernel.org>,
 Daniel Smith <dpsmith@apertussolutions.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2602041533440.3175371@ubuntu-linux-20-04-desktop>
 <20260204233712.3396752-2-stefano.stabellini@amd.com>
 <82c06e52-1db0-46e5-be9f-7ca0360ffc70@suse.com>
 <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
 <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
 <alpine.DEB.2.22.394.2602131206040.6031@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602131206040.6031@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6EF63141D26
X-Rspamd-Action: no action

On 13.02.2026 21:09, Stefano Stabellini wrote:
> On Tue, 10 Feb 2026, Jan Beulich wrote:
>> On 10.02.2026 00:23, Stefano Stabellini wrote:
>>> On Mon, 9 Feb 2026, Jan Beulich wrote:
>>>> On 05.02.2026 00:37, Stefano Stabellini wrote:
>>>>> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
>>>>> global to VIRQ_DOMAIN to allow other domains to bind to it.
>>>>>
>>>>> Note that Linux silently falls back to polling when binding fails, which
>>>>> masks the issue.
>>>>>
>>>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>
>>>> Technically this is an ABI change, and hence I'm uncertain it can go without
>>>> that aspect being at least mentioned, perhaps even its implications properly
>>>> discussed.
>>>
>>> I am not sure if it qualifies as an ABI change or not but I am happy to
>>> expand the commit message in any way you might suggest.
>>>
>>> The jist of it is already in the commit message, really the key element
>>> is that VIRQ_CONSOLE can be bound by multiple domains.
>>>
>>> Aside from spelling out "this is an ABI change" what do you have in
>>> mind?
>>
>> What I mean is discussion of the implications for domains using the vIRQ.
>> Previously most domains would have attempts to bind this vIRQ rejected.
>> Technically it is possible that kernels had code paths blindly doing the
>> binding, relying on it to work only when running as Dom0. And really, you
>> appear to break XEN_DOMCTL_set_virq_handler when used with VIRQ_CONSOLE,
>> without which its binding wasn't possible at all before (except for the
>> hardware domain, which get_global_virq_handler() falls back to when no
>> other domain is set). Or am I mis-reading things, as I can't spot any use
>> of VIRQ_CONSOLE under tools/, whereas I would have expected provisions
>> for (host) console handling to be delegated to a separate control or
>> console domain? Of course other toolstacks (the XAPI-based one for
>> example) might actually have such provisions.
>>
>> And then there's the XSM question: XEN_DOMCTL_set_virq_handler obviously
>> is subject to XSM checking. The same isn't true for VIRQ_DOMAIN-type
>> vIRQ-s. Yet this vIRQ isn't supposed to be universally available to
>> every DomU. Instead the ->console->input_allowed checking is kind of
>> substituting such a check, which iirc Daniel said (in more general
>> context) shouldn't ever be done. IOW in patch 5 you're actually effecting
>> policy, which should be XSM's job aiui.
>>
>> Bottom line: The patch may need to be more involved, but at the very
>> least the description would need updating to justify it being as simple
>> as it is right now.
> 
> What do you think of this:

Quite a bit better, yet for me at least not something I would feel happy
to take as a basis for an ack.

> ---
> 
> xen/console: change VIRQ_CONSOLE from global to per-domain
> 
> Previously VIRQ_CONSOLE was a global VIRQ (VIRQ_GLOBAL type), meaning
> only the hardware domain (or a domain explicitly set via
> XEN_DOMCTL_set_virq_handler) could bind it. Any other domain attempting
> to bind would fail with -EBUSY because get_global_virq_handler() would
> return hwdom by default.
> 
> This patch changes VIRQ_CONSOLE to VIRQ_DOMAIN type, allowing any domain
> to bind it independently, similar to VIRQ_ARGO. The console notification
> is now sent via send_guest_domain_virq() directly to the focus domain
> rather than through send_global_virq().
> 
> Implications:
> 
> 1. Guest kernels that previously called bind on VIRQ_CONSOLE blindly
>    will now succeed. Linux handles binding failure gracefully by falling
>    back to polling, so this should not cause regressions.
> 
> 2. XEN_DOMCTL_set_virq_handler can no longer be used with VIRQ_CONSOLE.
>    The domctl explicitly rejects non-VIRQ_GLOBAL types. This means
>    toolstacks that relied on set_virq_handler to delegate console handling
>    to a separate console domain will need to use a different mechanism.
>    Note: No known in-tree toolstack uses set_virq_handler with VIRQ_CONSOLE.

XAPI at the very least would want checking here, imo.

> 3. VIRQ_DOMAIN bindings are not subject to XSM checks beyond the
>    standard event channel allocation policy. Access control for console
>    input is enforced via the per-domain console->input_allowed flag,
>    which is set for:
>    - The hardware domain (by default in domain_create())
>    - dom0less domains on ARM (in construct_domU())
>    - The PV shim domain on x86 (in pv_shim_setup_dom())
>    - Domains with vpl011 using the Xen backend (in domain_vpl011_init())

Daniel, can you please take a look from (conceptual) XSM/Flask perspective?

Jan

