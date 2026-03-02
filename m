Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGCPH0ZkpWmx+wUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:19:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E477B1D653A
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 11:19:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244098.1543564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0NF-0003Z2-UZ; Mon, 02 Mar 2026 10:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244098.1543564; Mon, 02 Mar 2026 10:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx0NF-0003Xb-Rg; Mon, 02 Mar 2026 10:19:37 +0000
Received: by outflank-mailman (input) for mailman id 1244098;
 Mon, 02 Mar 2026 10:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vx0NF-0003XV-8T
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 10:19:37 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4da1324d-1621-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 11:19:31 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48370174e18so23711335e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Mar 2026 02:19:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75df9fsm466930745e9.13.2026.03.02.02.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2026 02:19:30 -0800 (PST)
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
X-Inumbo-ID: 4da1324d-1621-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772446771; x=1773051571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BakMZ5RFd9MhIZpYeFUPwVKqIOkHWDTdjwc32yW0zaw=;
        b=WIct12XFJjlVdXtAAAH6S9+H6E7thOIoc9auz+DrRwAIeiXKig+zBoChTC3zwVYVnO
         EQ0V0Gkq6iaS3+vgL9xDOFoihrVqcggualP/p5NxAA/HkAaOm8UPqJMVuI/JYplvZnxU
         Lk79cI+SIdwCAbqsgVCrjJLrt4jFtzteWKcxgQffNQHC3R/CvTAoIFuBtMVPsE1hM/Vu
         REWVsLnP5XzCq+z+/YTwrzKRcFbUQl8AsLIfGJT4sSx20mszLDsrMFQaReVvyShaaNQ/
         dYxPP8AlIpvLZ/v8cSW97DKThbZGhhrA05Gj9+rdPVaN9W0J3wfAjXbl8mdts6ZLQ5pM
         fa4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772446771; x=1773051571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BakMZ5RFd9MhIZpYeFUPwVKqIOkHWDTdjwc32yW0zaw=;
        b=CIe4SP41lLKiv+8Enl6CsqNGhpXOh3DBKHZLI9YM5m/FHgstSf52MFMG8hyToqQjrA
         OYQGrW1z+iCQpvBBzpbWRlohraoAyBxp9OcTelIlhCm7podWwwPseFVM5oy/16tzZ6hD
         7y4VNsQHlp11HbeEhik9HVwjhT91nGKDNxBhQMBqSVIha9AiRms437hFlM/+pn3Lnd0D
         2ntrKfOMhHo6W5iKz67FrxLOw7ojfuLrT1XEJfOL1ZspA2KUa1HdwEaKozRMeNK6WZlH
         VoiM2VHNbhG0eZY2vUN5yLuux5mXR1vY4Mg0dRWUHPtFJaddreSuC0hWqYEpAh8T9560
         N5Lg==
X-Gm-Message-State: AOJu0Ywqn8FzqPVLmtF7HCOhDCWBp3QUsw0140y3tprqxZT285gYFYwL
	5EZ+N8G4wOGaCfJOglQbp89YGh1xEEUFjWxaii+S6ab9Z358KxLFh0nVe3WI3+0hCw==
X-Gm-Gg: ATEYQzyxXE3XE5UglvPZ7dCeo5PN48Kmny4WjDzvUPkFEcSgzL977Rqn0FwcextAU/B
	0qxUMA9GJ/oEFp77lfgq593gonm0ZdBDo5HOgyJQJgcZYjwSpdpQ3EbUAqsvo5tg2X+FfsH/9hD
	lymwh4fu6Mlu5lfWAvPrzkB4Isk7QgKMR9Ana/1I/bTvNCmgKsTMJ5llTeFoMSKCzxXld533lXQ
	mg18SIfLdx1ue7hyPwswezhulDfy6Ydrvdyuppah9ukuNyxhYbppCZh5vuHvduNkQcLydqAXet7
	8Cawj3wRazdDjRtiZYJ+WTKF4gmvLbBj8r+PmgM2L8MTO7zknlABazJTsMWDeSVWAYU88VaID1E
	Tvjy2rwEX4APxjH9j2Ae+XgbOUi2ZPwzpKLVD0MfZF6uyA/NB249Vqhr1Av4fI2DMQvoYaUgGzI
	l2eHf3sdUG9ec1Fic/+OdEJg5Pa+R1+N1uHW8O+gaoTvj96CZxb+G/7DhSl7ogpDWzhQ5CswJqe
	/b0oAbHkbmAeXw=
X-Received: by 2002:a05:600c:6217:b0:476:d494:41d2 with SMTP id 5b1f17b1804b1-483c9bc5c06mr198013635e9.29.1772446771154;
        Mon, 02 Mar 2026 02:19:31 -0800 (PST)
Message-ID: <c244113f-50ad-4b8d-8176-50d140ef1e4d@suse.com>
Date: Mon, 2 Mar 2026 11:19:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (auto-)ballooning issue
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <a8a61b98-0798-44c1-8426-0fb18a77a6ca@suse.com>
 <aXnvl46pk_Wnd9bi@Mac.lan>
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
In-Reply-To: <aXnvl46pk_Wnd9bi@Mac.lan>
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
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: E477B1D653A
X-Rspamd-Action: no action

On 28.01.2026 12:14, Roger Pau Monné wrote:
> On Tue, Aug 26, 2025 at 05:28:29PM +0200, Jan Beulich wrote:
>> Hello,
>>
>> the other day I observed a strange issue with XTF's selftest failing to
>> have its VMs created, when running all flavors in a group. (Other tests
>> look to be similarly affected, it's just the selftest that I run most
>> frequently.) Originally I suspected a PVH-specific issue, but the
>> problem surfacing only there is because with PVH Dom0 I have less free
>> memory left after boot than with PV Dom0. Beyond that, both
>> configurations use the same hypervisor, with built-in DOM0_MEM="-255M".
>>
>> The issue looks to be further affected (but not caused) by domain
>> cleanup being quite a bit slower under PVH Dom0, compared to PV. I.e.
>> by the time the 2nd test is started, memory from the 1st one still
>> wasn't completely freed. The result is that randomly one of the latter
>> (batched) tests fails at domain creation ("failed to free memory for
>> the domain").
>>
>> xl's freemem() calls libxl_set_memory_target() followed by
>> libxl_wait_for_memory_target(). The latter function expects the domain
>> to balloon down enough for its ->tot_pages (in the hypervisor) to be
>> at or below the previously set target. However, already immediately
>> after boot "xl list -l" and "xs ls /" show target values which are 1
>> page below the hypervisor's record. With libxl_set_memory_target()
>> requesting relative adjustment, the Dom0 kernel will balloon out the
>> requested number of pages, but ->tot_pages going down by as many pages
>> isn't enough to please libxl_wait_for_memory_target().
>>
>> I'm not even close to having an opinion as to where the problem is: It
>> could be that the kernel's balloon driver is off by a page. I'm more
>> inclined though to think that it is entirely unrealistic to expect the
>> kernel's balloon driver and Xen to have an exactly matching view of
>> the memory owned by the domain. Yet then it is simply invalid to
>> compare values taken from Xenstore against values taken from Xen. While
>> problematic for absolute requests, for relative ones it should be
>> possible apply the decrement to the source later used to compare
>> against while waiting.
> 
> Little late, sorry.  I think:
> 
> xen/balloon: improve accuracy of initial balloon target for dom0
> https://lore.kernel.org/xen-devel/20260128110510.46425-3-roger.pau@citrix.com/
> 
> Might improve the situation here, as it should make the dom0 initial
> balloon target match what the toolstack expects, and then
> (auto-)ballooning targets should also be accurate w.r.t. the memory
> freed by dom0.

Just to confirm (finally got around to it) - both patches together indeed
eliminate the observed anomaly.

Jan

