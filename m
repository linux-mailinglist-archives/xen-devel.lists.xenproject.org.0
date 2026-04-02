Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNdBF1cGzmnpkQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:01:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59893843EC
	for <lists+xen-devel@lfdr.de>; Thu, 02 Apr 2026 08:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1271072.1559374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8B6p-0006Bu-AG; Thu, 02 Apr 2026 06:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1271072.1559374; Thu, 02 Apr 2026 06:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w8B6p-0006AM-7A; Thu, 02 Apr 2026 06:00:51 +0000
Received: by outflank-mailman (input) for mailman id 1271072;
 Thu, 02 Apr 2026 06:00:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w8B6n-0006AG-EK
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 06:00:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w8B6m-008rsg-IM
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 08:00:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ce060d-e002-0a2a0a5209dd-0a2a45088202-8
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:00:48 +0200
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69ce0610-fab6-0a2a45080019-d155dd32e0ea-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2026 08:00:48 +0200
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-43d0deb7ad5so451053f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Apr 2026 23:00:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2a6f5bsm5101239f8f.7.2026.04.01.23.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2026 23:00:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1775109648; x=1775714448; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yaf0L/aba7KFXbNtMvWN19EjHOGvOBBMQ+U+ojOOcWE=;
        b=PGR/5hECkMQ1lKD+eDmTfWSgsdqOWOzqVNULRlFYUZoG8tv7MScdtID32vjL3e3A1z
         K1jQlwYNxoB2gYIlvfkgYAXtC1ziJMMckiDmjpCbaz+7eQsTyskbiiWWw69BadptuAgP
         UFCYuGSvremUnIF4BMc1GA5rvTRYJ1n/02lpaYoyOq1fP4sUbt+s/OARiI0Ns8ZzDtYc
         LUatVSZj1PhzUFAzSADbJplGIYKX+ow3/SCMxA02UXK4+y0V7lCd7WPoAByyWXk1/P2o
         ipRGVv5gG/j6n4kPcVsdMYjD/XQrL8BdXh+6F2QUrQQODVQi0j7kPUmAZ+3apd9TREe+
         5ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775109648; x=1775714448;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaf0L/aba7KFXbNtMvWN19EjHOGvOBBMQ+U+ojOOcWE=;
        b=a31eKQj1rLZ50eCsE+mdiRVk7h07bQPz+XgJlvYmkuMhly3hko0JpWgMG1wtcUpfi6
         8rtT6xx/BHCea4tomc7n8iqx/m9vDGGXKynuPZhe2l3BSPfVxxfv+o4W6VFwe/YhZG/S
         4EyuP+ApB9Il8QqAWZHRpJgSls9Tid1v0k2Jc1rXHCxZ2jyvccVF/uQDTrK1A0vdXLEo
         b8p8C3m2+DXYIcP/5pfJ111M5km88PYawe1+AujXWJc9AFXP43IBt3rVr3uU73jbgK9K
         UDHIgwTzq3Wlu7nzkvY6zbnIVroggfjruhZjKM9GOgxGPrlU4bNfJltySTHze9DaQkxR
         pC/A==
X-Forwarded-Encrypted: i=1; AJvYcCU+/gd10STEjKKx15c9ev4QWUCk8jBnHSkJ9tEdrM9+xXdHx8iCX0e7eBFWNQMTp0nR6qcgp2xnTk4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN1AkSievcRETS7nVCNn7Q83TwhVAracIm/OjMQwTmFfmtLQ0Q
	PbcUiIxFiufaRR+FTNvHaMmBM4miGfF0KwvML4Tyr1VcKQZRioVjFXNlrunSL4rLQw==
X-Gm-Gg: ATEYQzzHdaeVZvGkcJN9LCSsA8g2Mxdsc0U9pW6TWX1icKwUnFrIZMTPrf7Wu+p66vm
	faRyOZEpvEogVWxJ14/KJEUyUxhAycd4GjJOJo/Lx2iTuWSlxmE9WBTp8KJNWgHG3LnkvGiU0Ng
	fXUwZULvDSfFMK0enNb9bF5uEvqSbbv5tg10rE+79Sf7zeGijji/YGStgZrKCL/lY3Kxr0pwnli
	gQLxxSDfifrfAfZYhyYyl/LQ9rwdF3gPdr+mrHuPjyNnytU6UT+beoaXjqutDFfWQRVc7jvh3vy
	JPe8/mtjksatVFsZlUVqEG60WNrhvBpsuOYd11HfhzSbilcMeMCaV45KNKH+fCqirqfJzuy1Zdz
	MVerzKGJBXF0IEL27tJjOQQ/zsfW9NEKCmb66dBZpM/ICGa/oZNvlM/xSmUD1W34MKIZEA+Kpb1
	bBaLIHWxLAIX3z0s9LChPLNIs0ToCt7lXFBolFVTVhIiv5xpMoBFS7Fk9JTXvrHrM17jXfBmN6l
	tNZcM9W8Em1zcE=
X-Received: by 2002:a5d:5f86:0:b0:437:75c1:5777 with SMTP id ffacd0b85a97d-43d1507b692mr11678625f8f.16.1775109647701;
        Wed, 01 Apr 2026 23:00:47 -0700 (PDT)
Message-ID: <51916e05-6b41-4fc6-8cce-57b580f17aea@suse.com>
Date: Thu, 2 Apr 2026 08:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] make ioremap_wc() x86 only (for the time being)
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <924f3ef2-7883-4322-a921-edc814c96719@suse.com>
 <20adacfa-06ce-4508-916d-f15d8f17788f@suse.com>
 <3bf90b33-c028-4f45-bda0-9d1bd5386c02@gmail.com>
 <6fa82fcc-d21d-476d-b020-fc40a645a74c@gmail.com>
 <97c56309-1bbf-471b-88c4-d13af3867f95@xen.org>
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
In-Reply-To: <97c56309-1bbf-471b-88c4-d13af3867f95@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1775109648-75159497-32347FC1/0/0
X-purgate-type: clean
X-purgate-size: 3282
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vates.tech,amd.com,wdc.com,gmail.com,lists.xenproject.org,arm.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:bertrand.marquis@arm.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B59893843EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 02.04.2026 05:31, Julien Grall wrote:
> Hi Oleksii,
> 
> On 30/03/2026 15:24, Oleksii Kurochko wrote:
>>
>>
>> On 3/30/26 4:22 PM, Oleksii Kurochko wrote:
>>>
>>>
>>> On 2/19/26 4:53 PM, Jan Beulich wrote:
>>>> Its use in domain building is questionable: Already at the point both 
>>>> uses
>>>> were introduced, ioremap_cache() existed. I can't see why kernel and
>>>> initrd would need mapping WC, when at the same time other similar 
>>>> mappings
>>>> (in common/device-tree/) are done WB.
>>>>
>>>> With those uses replaced, neither Arm nor RISC-V have a need for the
>>>> function anymore.
>>>>
>>>
>>> It is okay for RISC-V, but for Arm, IIRC, likely it was done because 
>>> guest might start with cache disabled and PAGE_HYPERVISOR_WC on Arm 
>>> uses "Normal Non-cacheable" what could lead to that guest won't see 
>>> some part of kernel and/or initrd as it could be in a cache and won't 
>>> be flushed to RAM.
>>>
>>> But probably I misremembered something and 
>>> clean_and_invalidate_dcache_va_range() or something similar should be 
>>> called before guest is laucned.
>>
>> okay, so for this case copy_to_guest_phys_flush_dcache() is called after 
>> initrd and kernel are loaded.
> 
> Looking at the code, we are using ioremap_wc() on the source side rather 
> than the destination. So the use of copy_to_guest_phys_flush_cache() 
> would not matter as this only applies to the destination.
> 
> Regarding the source side, the cache only guarantees coherency when either:
>    * the memory attributes are similar between the component that loaded 
> it (most likely the firmware) and Xen
>    * The component that loaded it issued a cache flush
> 
> I saw Jan mentioned that other part of the device-tree code are using 
> ioremap_cache(). They were adding afterwards and I can't remember why we 
> consisder it was ok.

This sounds like you think it isn't okay.

> For older mapping we would be switching from a 
> non-cacheable mapping (HYPERVISOR_WC) to a cacheable one (HYPERVISOR).

Whereas this sounds like you think switching everything to WB (or whatever
the correct term on Arm) would be okay. IOW - I'm confused, and hence I'm
...

> While I agree we should have some consistency in the mappings, I am a 
> bit unease to change the attributes without any written details on why 
> there will not be any impact.

... also unclear as to whether this actually is an objection to the Arm
part of the change (incl patch 1). Please clarify.

As to written details: Mappings of ordinary RAM shouldn't need any extra
documentation when done WB. Any non-standard mappings (like WC) should
instead have comments. The absence of such comments indicates to me that
at the time the "best thing thought to be available" was used, i.e. WC
preferred over UC (which plain ioremap() would have used). Additionally,
the use of ioremap_wc() from initrd_load() (not Arm-specific) pretty
clearly isn't appropriate for RISC-V, aiui.

That said, using ioremap*() for RAM feels bogus in the first place. At
the time vmap() didn't exist yet, so it may have been appropriate. If
there are reasons not to use it here, perhaps something like Linux'es
memremap() should long have been introduced?

Jan

