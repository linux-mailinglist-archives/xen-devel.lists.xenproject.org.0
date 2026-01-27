Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNhQJP5+eGkFqQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 10:01:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0FB91693
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 10:01:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214114.1524501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkewv-0002I1-Td; Tue, 27 Jan 2026 09:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214114.1524501; Tue, 27 Jan 2026 09:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkewv-0002Ga-Qe; Tue, 27 Jan 2026 09:01:25 +0000
Received: by outflank-mailman (input) for mailman id 1214114;
 Tue, 27 Jan 2026 09:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=y9JO=AA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vkewu-0002GU-Ir
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 09:01:24 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0d1305b-fb5e-11f0-b15f-2bf370ae4941;
 Tue, 27 Jan 2026 10:01:23 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-430f2ee2f00so3152224f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 01:01:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435b1f745e6sm34601403f8f.33.2026.01.27.01.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jan 2026 01:01:21 -0800 (PST)
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
X-Inumbo-ID: c0d1305b-fb5e-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769504482; x=1770109282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XNZ/H729BLC/Vg4e1NTNI56tNXtO41Rq0IwnCM0Jqys=;
        b=MWTnjU5dCu6TC4cfTd+TSp6AjyXCwp8wmQUcnncQrJxvnNShWHEznXckOEnvGosq7N
         csk21kFXpDyD/u5o8ueLF2GD9iR+iy3Dtou3uif/qj1Y6mpZfyI4a6pz1AOxvGXq8o0m
         nlWwHwrBhIKwdN456uwdr+nsz1qjK52fUpycQoOLdhl45Yj7sVu92rTcgQ0ijdHdHI8N
         Yq3gcMcHJnKkT9iUa2TGuRaQC6zlnixsRXWSwWp+7/1+/wbrxlTwDCFtu8G5xORk6GD1
         cQSPALYvUxl5Ur3Knahb7rLs4AXR+FJ9FT9ceavGRt5oIs4rr16scyZG1wJm3vFOMZRI
         4bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769504482; x=1770109282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNZ/H729BLC/Vg4e1NTNI56tNXtO41Rq0IwnCM0Jqys=;
        b=IPdWCL6/y/DimHLuuG8KmSbznsZTfXwVvd+i4CIq6WAnmCRBIzDldcdmMyNidObgl3
         K6JKY4FC+007EaBQveSh0KNYx2b4DvtIhxc9aucvJgQaSlwSZmRBoI4LIlzNq7zQL51f
         ZIvwpqWR/DuSUk4ThIQRvy373DrYnJryHaYuBkSXcjuh5zmlHrV10uHGwE0fGQfOZ1hj
         aCzbVzhywypRd78zMNQ5yey0AM8ZsovplQns+XC05zCKDQCwzyt1u5QASdU81+Sr8ShP
         8xqvw4yzqalpppI9VFTdD2mv5g4A1OXaVwznyu7hjHes2Vtoqs6qS1QaxaPv8oXRSKFD
         alcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6Pxc5czrjukSuj+2K8pgv3wtK3p02TFkDx0ptUF+PQZ7QZqY8JplInEjrQ7+T8naNrSMx4rqkzr4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YweOB/EGsIq7DCXoh7J3kqVoiKnUWbvJA9uansFt8Y+dgTxPBcJ
	uGDTAV04tpX1H2w5THUP3OaBo5Xiu0YVpSgnZiRRUuO09OWXRmemvedhPXvdIL5t8g==
X-Gm-Gg: AZuq6aIt1cjg+eVdgCAZHZPsLgXHHtpCQWWjNlGb/QwRYrDuyYBghLGPsIRJL7F7AI+
	Zh9QuTMtFhrgKsRSfMFGPld6SeVdNDejDNhp3U18P6y4bgtsmCrucMzNr9tvsKGJZrWCC3zgfsW
	oA90rA5ObRv5mIYmv7mZ1EcrRBUHgZ9yMd89GjuOMIaYcqeWw5BSztR8KYGobfmMsTBgk2rObma
	vr5dy3id6Zpw6TCoTRpxvKMexEEmnIMl8agrgFKcHOQNwm/L+Kz8KR3t6nKvQJOs/le2AIpbl8i
	6kAhDjGaxzH+88gmp9YTNVts0z2HOL6vJI1ixZZyU9dZHK6UBIQCoFGJ3WaFDJC0C61d/OupiP6
	LVS26x2qTvV8U0p3ar11Yoh/Em1TZsTAxp8cZawHuYLbcX5jf9xgyYWlqpTiAackqQZ5HsXRZ+r
	0gwpxG6ZWBJvv5a+1rgZl2oNHX47EBjV0/QdMBchhyPiWmOYEn94J3xjH4CDMWp/KgOUhOdCzrQ
	xk=
X-Received: by 2002:a05:6000:22c9:b0:431:8f8:7f24 with SMTP id ffacd0b85a97d-435dd0b8222mr1544977f8f.39.1769504482274;
        Tue, 27 Jan 2026 01:01:22 -0800 (PST)
Message-ID: <25b25628-3f99-46b8-94f5-b9c78601fbe0@suse.com>
Date: Tue, 27 Jan 2026 10:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] PCI: determine whether a device has extended
 config space
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <edb5eeb2-2cb2-4614-a042-7788fbb345c7@suse.com>
 <fd509fbb-9dc4-4619-847f-6edd2a1bdb7f@amd.com>
 <553d1a7a-e465-413f-a60f-32455bbce621@suse.com>
 <b6a4e2cf-e95f-461d-9c6e-34a2f8815d8c@amd.com>
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
In-Reply-To: <b6a4e2cf-e95f-461d-9c6e-34a2f8815d8c@amd.com>
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:stewart.hildebrand@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid,amd.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9F0FB91693
X-Rspamd-Action: no action

On 27.01.2026 05:13, Stewart Hildebrand wrote:
> On 1/26/26 03:58, Jan Beulich wrote:
>> On 23.01.2026 23:24, Stewart Hildebrand wrote:
>>> On 1/19/26 09:46, Jan Beulich wrote:
>>>> Legacy PCI devices don't have any extended config space. Reading any part
>>>> thereof may return all ones or other arbitrary data, e.g. in some cases
>>>> base config space contents repeatedly.
>>>>
>>>> Logic follows Linux 6.19-rc's pci_cfg_space_size(), albeit leveraging our
>>>> determination of device type; in particular some comments are taken
>>>> verbatim from there.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>
>> Thanks, but see below (as that may change your take on it).
>>
>>>> ---
>>>> Should we skip re-evaluation when pci_mmcfg_arch_enable() takes its early
>>>> exit path?
>>>
>>> I don't have a strong opinion here, though I'm leaning toward it's OK as is.
>>
>> Maybe I need to add more context here. Not short-circuiting means that for
>> a brief moment ->ext_cfg for a device can be wrong - between
>> pci_check_extcfg() clearing it and then setting it again once all checks
>> have passed. As long as only Dom0 is executing at that time, and assuming
>> Dom0 actually issues the notification ahead of itself playing with
>> individual devices covered by it, all is going to be fine. With
>> hyperlaunch, however, DomU-s can't be told "not to fiddle" with devices
>> they've been assigned.
>>
>> With the yet-to-be-written vPCI counterpart changes the window is actually
>> going to get bigger for DomU-s using vPCI.
>>
>> For hyperlaunch this is going to be interesting anyway, on systems like
>> the one you mentioned. First, without Dom0 / hwdom, how would we even
>> learn we can use MCFG? And even with hwdom, how would we keep DomU-s from
>> accessing the devices they were passed until ->ext_cfg has obtained its
>> final state for them (and vPCI reached proper state, too)?
> Ah, I see. Thanks for the additional context.
> 
> First of all, to re-answer the original question, it still feels more of a
> nice-to-have optimization than a necessity since we don't have hyperlaunch PCI
> passthrough upstream yet.

My fear here is that an aspect like this one may easily be forgotten when
later doing the actual hyperlaunch work, or when finally making PCI properly
supported on Arm64 (where then dom0less would be equally affected, unless
Arm has found a way to avoid the dependency on Dom0's ACPI AML parsing).

> Of course, skipping re-evaluating ext_cfg would be a
> welcome change if you're up for it.

We can surely keep this as an incremental change to be made. I guess I want
to give Roger a chance to comment before deciding whether to commit the
patch here as-is.

> An alternative approach might be to
> implement pci_check_extcfg() such that it only modifies ->ext_cfg if it needs to
> be changed, but again, I don't have an issue with it as is.

That wouldn't help much imo, as there's then still a time window where what
the field says is wrong relative to what we already have accounted for in
our MCFG handling.

> With that said, what do you think if we took the stance that ->ext_cfg shouldn't
> be re-evaluated for a pdev while it's assigned to a domU with vPCI? I.e. we
> would return an error from the pci_mmcfg_reserved hypercall in this case.

I don't like this idea, as it's functionally limiting (if MCFG becomes
available only later) or functionally wrong (if, for whatever reason, MCFG
becomes unavailable later).

In no event would I consider returning an error from that hypercall. If
anything I'd see us ignore it.

> If I understand things correctly, conceptually speaking, from a system
> perspective, setting up mcfg is something that *should* be done at boot, not
> ad-hoc during runtime.

Yes, and that concept simply collides with hyperlaunch's plan to launch
more than just Dom0 right at boot. Dom0 booting is part of the system
booting, after all.

> In the hyperlaunch model that I'm envisioning, there will
> also be hardware/control domain separation, and we will want to limit the
> hardware domain's ability to interfere with other domains. So I'd consider
> disabling the mmcfg_reserved hypercall anyway in such a configuration. The
> assumption with this model is that we would not need rely on dom0 to enable mcfg
> the system/platform of choice.

But you need to work with the hardware you've got. For customized systems
it certainly is an option to arrange for firmware to suitably report what
Xen needs to be independent of Dom0. But for general purpose systems this
won't necessarily fly.

> Longer term, if we really think we need to support hyperlaunch while relying on
> a dom0 to initialize mcfg, we could potentially delay assigning pdevs to
> hyperlaunch domUs until ->ext_cfg has been initialized and is not expected to
> change. This would imply implementing hotplug for PVH domUs (also needed for
> "xl pci-attach" with PVH domUs). I wrote some patches in an internal branch to
> expose an emulated bridge with pcie hotplug capability, laying some of the
> groundwork to support this, and I'll plan to eventually send this work upstream.

Which isn't quite what I understand one of hyperlaunch's goals is (to have all
domains be statically configured, and hence be in final, usable shape right
when their booting completes).

Jan

