Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O0QBw/Q6GklQQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:41:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD2446DCB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 15:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290585.1570148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXpR-0006AL-OJ; Wed, 22 Apr 2026 13:41:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290585.1570148; Wed, 22 Apr 2026 13:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFXpR-00067d-Kz; Wed, 22 Apr 2026 13:41:21 +0000
Received: by outflank-mailman (input) for mailman id 1290585;
 Wed, 22 Apr 2026 13:41:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFXpQ-00067X-Jl
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:41:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFXpP-003U76-Lo
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 15:41:19 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8cff5-2eae-0a2a0a5409dd-0a2a4509eb5c-46
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:41:19 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8cfff-2497-0a2a45090019-d1558034c8b8-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 15:41:19 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso34288515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 06:41:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c01cfsm468483285e9.10.2026.04.22.06.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 06:41:18 -0700 (PDT)
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
        d=suse.com; s=google; t=1776865279; x=1777470079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m0YyVE+2wesXUglYaRjkXixoVcbzQpUU6jfy/QdrwgA=;
        b=SUzDQv0UZrptLqVT/oRW3i9L1C7Q6TxhLB/qjP21IJVvaPYYiMMDDxZYUze9vv+6X8
         usknDS2RMsUYGYb6PqYGKTd1NwYfn1/LzthE31mTayJ3uaqEvQzWgoKKcOCrDQpdjvqx
         iZyRGDrs7QvoVECXykRoIAo2nXu6HnwvDYb7Mi5EORwM3aVMK9J5wiM9rGHjaiaNQWQE
         FDRmySWVCfgCbjlwg3n9W2WdbmFpFgsOARNlIux7mW6NNElTYu67naUjXN2xc3hHSnOp
         x9h1vQrNTCorfwPK6zYgak78TY4+Z4e0UzJDXfRuDQddFfyERbpOIEMla/NQCE67TZZk
         w8Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865279; x=1777470079;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m0YyVE+2wesXUglYaRjkXixoVcbzQpUU6jfy/QdrwgA=;
        b=Xzwym9WUdRdnK44kaJPQl6HCT4MrgThgQ5GG4W43UaQPCrbpUL0FBKzwd7EAcBxsz5
         g4+OoQk/2bwn109fAT8PamdtFU5B1ax29tHp1CiFMzNxO4D/0x99iPqWyhjN5CfnxNxr
         rqYsPC4Ri5Kq/L7ocIYvXUVbNQjaw2psTHvRA9GAbs1GCsK2Rpw04ouN5sqgfbfxnQHb
         gZO5B71rJY/yPRVoriNfCERSIUZ/LVWAJ3QMz7s0vl3zM8ew64k1qjKi1RfY51e6K/gt
         9wXUWQfbKO5oYzU63HlrzTAhLK4SycKTMc1VMUJ57dNujuCChZNnXG8zW+plpL45F9HC
         zEdQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qBGMG1nymnKHkBl96+bf1uypu1tZkkJnWdEsRqJVhuv2pmCktEOuErYWaD8uztzN3JWsKIucr9cw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxK8gbYv7dITYxKuWqWogAojJPdLOGV8FvBhGiuS1BVLVxG2Zxs
	ZFkvXIvnF55ZnhKJPmXBQ6EGsIZbmKklJQY9FtHJi6zQzC8Q3BBxQ/ddbnMdvylnOg==
X-Gm-Gg: AeBDievFjXDi8elwf2pTjBaBQXuV4QAcrjP/PEi/fkzSSVt69SMoFbiGJND0c+qBtT7
	m6Mm6TcqhJi4u7nS0IWoG4XbcyFvz/DOADiczJr+jtZjmrBMidfNxn1vG6qXk8Uv684s8gstUcI
	nS2eeM7zlRUzz6WmSiHsHiBNTO4ak4SOHZH1jloYU4fJKC8wLLZl43D9tYqobhA5ggvIrGQdwdU
	caYgvmEZz1yTnbvCGym3ZEpRpIw+1ro2WdLDSJUyQLp9vVK8QUOntInw5/Yhq2bWYjSUtuyI7A7
	GFA/Jl9bdluR5mpNY2qVTmZnKXvSS+f2BJoHLN/jS2N9xxxhNzWDQCFQ1ishxA1PZaWFhO09mlt
	T7BAZhzi95Jb5pg0LXecscdPHh/UfzO9EIT0dUVdzMVWWSYHYkIAY75EiKP4XNNHAy0ULsNvM70
	dkWAMDHx8/r5Gqu6i/7MOTgWuUB2QDDzMub4DB3hH1ctGnqX/39P2WaXd2MJMVqfpHSfk6ta2V2
	xYmrTFzZ2d8xMdW4u9HSsaAdA==
X-Received: by 2002:a05:600c:8b4b:b0:489:1ff1:74f4 with SMTP id 5b1f17b1804b1-4891ff17707mr149897055e9.4.1776865278927;
        Wed, 22 Apr 2026 06:41:18 -0700 (PDT)
Message-ID: <475e977a-a433-47a5-a91e-8a61405b923d@suse.com>
Date: Wed, 22 Apr 2026 15:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: adjust cfg file buffer freeing
To: Bernhard Kaindl <bernhard.kaindl@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper@citrix.com>
References: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
 <77234acb-4539-4efe-9c30-03cb7a389912@citrix.com>
 <f91fae0b-7d3b-4ca6-a5ed-72de50daee9c@suse.com>
 <LV3PR03MB7707D62ACB8254123F4CB136872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
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
In-Reply-To: <LV3PR03MB7707D62ACB8254123F4CB136872D2@LV3PR03MB7707.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1776865279-43F7EA53-DE008AD3/0/0
X-purgate-type: clean
X-purgate-size: 1000
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:sstabellini@kernel.org,m:marmarek@invisiblethingslab.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:url];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 81FD2446DCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.04.2026 15:16, Bernhard Kaindl wrote:
> Jan Beulich wrote:
> PS: Gitweb finds this commit for adding the function:
> 
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=0d6a3c755374f04f6dd25373da28291a8f35bede
> 
> efi: introduce efi_arch_flush_dcache_area
> 
> Objects loaded by FileHandle->Read need to be flushed from dcache,
> otherwise copy_from_paddr will read stale data when copying the kernel,
> causing a failure to boot.

I.e. irrelevant to the cfg file buffer. So what we could do there to
make things less questionable (as to ordering) is

    if ( file == &cfg )
        file->str[file->size] = 0;
    else
        efi_arch_flush_dcache_area(file->ptr, file->size);

> Introduce efi_arch_flush_dcache_area and call it from read_file.
> 
> This commit introduces no functional changes on x86.
> 
> Reported-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

Stefano, any thoughts?

Jan

