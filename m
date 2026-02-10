Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPmxJu7iimmjOgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 08:49:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F367111807F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 08:49:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226076.1532618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiTK-0008IP-I5; Tue, 10 Feb 2026 07:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226076.1532618; Tue, 10 Feb 2026 07:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpiTK-0008GQ-Ek; Tue, 10 Feb 2026 07:47:46 +0000
Received: by outflank-mailman (input) for mailman id 1226076;
 Tue, 10 Feb 2026 07:47:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpiTI-0008GJ-QR
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 07:47:44 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6b53823-0654-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Feb 2026 08:47:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47ee76e8656so7543705e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 23:47:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-436296b2ed9sm32667095f8f.5.2026.02.09.23.47.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 23:47:39 -0800 (PST)
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
X-Inumbo-ID: c6b53823-0654-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770709660; x=1771314460; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lj/kdMU95yIvIlb2e5Lipa6vut8jCioOSX3crbuoXFI=;
        b=CLYk8QIZUd3ipvpQMiMgBFMfm2C+tpWx5z7UQeLwN+eK9Bs7kBhWtXNFeYEsGAVb9K
         WQZa+nmIxiyp6bQZ7sHK/k1C+C5Rs+VqfQiiQfvsu90bWzGL596BUH2e8tk8oUCmNyDx
         guME/rxlS+Ry3u988OR29yv4m/egCeIH1tKMLIK8JCUVE/Ry4tf3J9AZH8JD1HXFMroL
         qAKK/iBSFAXERc+hZYB8tPygVCkuUt1rsFmUPafq3XZrcv4IaJYDb0zAsr/45DttqZqQ
         Mo4DcsVa6dri/scHFgTiVe/R2rdC2Dr4QVBEzQ+ulCT70P31svzK4whP6e2xup3KVVP4
         kQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770709660; x=1771314460;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lj/kdMU95yIvIlb2e5Lipa6vut8jCioOSX3crbuoXFI=;
        b=lvEJLRcwHmTUTj8NKdq6vscm9prdwm0ovFU4yqqnJuvQAQ3G44QKM374htXRUjJyyb
         7Lw2bKtv/5EGFy2FsrsoMQIlYLV/1RpbxzvlBuE6PS31zGPHHQCh7xoxNcnznWDY415M
         nFHPaXNZX4rOOW2W0ecWETBs0JVe1hlpPgZIYNHxxAEZUcrLB7j0TjhvE1j8CJfKAGHs
         GzgtUle8lLOTvLYw3DIoXB2kq8Zpp+xHiclXkflPgLAYRWDsCnzDgiijVuLUnFGUwRDW
         jqg93ucUdv5NpZ4OyZYxGhd1UBrsiMCpR4NiUcr7MpMbTCWYGHEgoUWoTOANUlmmJAsl
         HlOw==
X-Forwarded-Encrypted: i=1; AJvYcCUDuIK1V4OoNSE2D5PiRpsYMw8nRHlDxavDmNojadNkpmKNXNSmYAsGnt9fhY9raEPlPdX26Rn2Ahs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyCGyX1lIxfDVJ1XrBR2FB5rjfLmhNTZgpcE6SMNHLjdOITB/Kj
	wMY2fZl07xccGmyGbyLp62n20Hl9MM1QgQZ7/crfDfNdXDUWLkBf0f6EzBRunnOjFA==
X-Gm-Gg: AZuq6aIL2hxIVYBrogMWB+ysqieq1WozaHlznpzPTbhrIcEdH2ns7FhbUH9S+p74cYK
	8104ZCjJzjJYZdQk1u3gdqx/kAmSyOxEuzWixKxWkpm/7+W/+QvmDF1iKnhi3hGSpR+8d1XxeNX
	ut1VVGa/TALBI3hwX28/FDkhDisJ61KHu71FPn/gvW4VO/ejNxoEC5B4Rq/Hv8HlC/EqTSrJoPT
	qOB0WK5yUvW72CSX/N4ZDOPgcSEixU2i9sFei6Ze/MmKur/35SmzhbFUsHqO7YIuLAS0Png/2B1
	+hAd/7Lkear7LUbpGi4W5lWRAVgd6qlrQQhZiFKVKHu8zu0Ulc4c2QH6jPC5mOnZiz3Xl9NaVn2
	VDZ3StL9aApRrNnP//TTkNhdjSiXb3OTrbBdYGgjXkANIHX5U6j1oGIpqiY/JgFId6NB8inArXa
	SWGJCTuA6mweRVkLu6mGnp8VPO1PpOTozs5W7AUI34LCooyHSBaB5csnzDJynJ9uybJHAbp8tC9
	8lkZCMdnVtFTp9gGgAGO7VTAQ==
X-Received: by 2002:a05:600c:3590:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-48320236b01mr215371875e9.30.1770709660100;
        Mon, 09 Feb 2026 23:47:40 -0800 (PST)
Message-ID: <43e80ad6-7b42-42de-b36f-1a9079589912@suse.com>
Date: Tue, 10 Feb 2026 08:47:38 +0100
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
In-Reply-To: <alpine.DEB.2.22.394.2602091520460.1134401@ubuntu-linux-20-04-desktop>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
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
X-Rspamd-Queue-Id: F367111807F
X-Rspamd-Action: no action

On 10.02.2026 00:23, Stefano Stabellini wrote:
> On Mon, 9 Feb 2026, Jan Beulich wrote:
>> On 05.02.2026 00:37, Stefano Stabellini wrote:
>>> Today only hwdom can bind VIRQ_CONSOLE. This patch changes the virq from
>>> global to VIRQ_DOMAIN to allow other domains to bind to it.
>>>
>>> Note that Linux silently falls back to polling when binding fails, which
>>> masks the issue.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>
>> Technically this is an ABI change, and hence I'm uncertain it can go without
>> that aspect being at least mentioned, perhaps even its implications properly
>> discussed.
> 
> I am not sure if it qualifies as an ABI change or not but I am happy to
> expand the commit message in any way you might suggest.
> 
> The jist of it is already in the commit message, really the key element
> is that VIRQ_CONSOLE can be bound by multiple domains.
> 
> Aside from spelling out "this is an ABI change" what do you have in
> mind?

What I mean is discussion of the implications for domains using the vIRQ.
Previously most domains would have attempts to bind this vIRQ rejected.
Technically it is possible that kernels had code paths blindly doing the
binding, relying on it to work only when running as Dom0. And really, you
appear to break XEN_DOMCTL_set_virq_handler when used with VIRQ_CONSOLE,
without which its binding wasn't possible at all before (except for the
hardware domain, which get_global_virq_handler() falls back to when no
other domain is set). Or am I mis-reading things, as I can't spot any use
of VIRQ_CONSOLE under tools/, whereas I would have expected provisions
for (host) console handling to be delegated to a separate control or
console domain? Of course other toolstacks (the XAPI-based one for
example) might actually have such provisions.

And then there's the XSM question: XEN_DOMCTL_set_virq_handler obviously
is subject to XSM checking. The same isn't true for VIRQ_DOMAIN-type
vIRQ-s. Yet this vIRQ isn't supposed to be universally available to
every DomU. Instead the ->console->input_allowed checking is kind of
substituting such a check, which iirc Daniel said (in more general
context) shouldn't ever be done. IOW in patch 5 you're actually effecting
policy, which should be XSM's job aiui.

Bottom line: The patch may need to be more involved, but at the very
least the description would need updating to justify it being as simple
as it is right now.

Jan

