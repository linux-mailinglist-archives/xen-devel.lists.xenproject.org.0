Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xv1RAq9UMWrLgwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:50:39 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F06901B7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 15:50:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="XAE/+UzQ";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339256.1600417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUBR-0006r6-19; Tue, 16 Jun 2026 13:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339256.1600417; Tue, 16 Jun 2026 13:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZUBQ-0006oj-TV; Tue, 16 Jun 2026 13:50:28 +0000
Received: by outflank-mailman (input) for mailman id 1339256;
 Tue, 16 Jun 2026 13:50:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZUBP-0006od-II
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 13:50:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZUBO-00620L-VG
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 15:50:26 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a31549c-5cb7-0a2a0a5109dd-0a2a4506d43a-20
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:50:26 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3154a2-7371-0a2a45060019-d155802ec948-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 15:50:26 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490ac10e337so31040545e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 06:50:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa9f2c0sm96566355e9.15.2026.06.16.06.50.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 06:50:25 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781617826; x=1782222626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/CuczEgNN5H5r1dN3DlhOxPe/xgXHUw3Emk/6LojGyA=;
        b=XAE/+UzQW50b5CPr7fJcaoQuiUwMO9Uc7AjBwXhywuGdjAgux7cKHcc8UqY8AVMhsN
         kFYSD6YKDvgMd5KyGexzH4dT0cajdApRnrAU5fZYV5UpJNOIVjD/5U7lpsE9su9v1RQF
         D63S8kh9n6VetmMOin9uGFt06RDr8m/gIsCSYGecrEE5HvGaapd71mLWDtB8kO4r5ZDW
         o5ZN+X0XgfqYwpma2zL9YhbhIacUPmQT8Ll4uwt9cnImPb9a4nkjJqad3wU+LsnuTDRV
         8wT0UKOL4Oes36feNlc+ioyUvyww6zWNsaOeUFhiYkE81wf5uFo5p71/uC6gJ4OUm/Qe
         PsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617826; x=1782222626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuczEgNN5H5r1dN3DlhOxPe/xgXHUw3Emk/6LojGyA=;
        b=j3HEYn4J4/YYI88NWAvT+AmEAgrrkd7bAMijw/0wY2vlZi/9Yzkqlc4TYsxGIbuGuZ
         GiIYMYf4MbSY3VdSlhCzI1JRoKJyBuTYKkiaoHyvpBPV3pkZ5v8BypG+PEuyAhdnZxpx
         GZzac5ZxRbpcCvvNIFdprNwycsh2e4LceNgmCr5EpqMDsR7X7Kftt8wy7EgudAYMlXYZ
         monp7QcvN6V0r1pTpcD6QFxqGSYvw7ZlChUIHm+ExGvbaC45ZAVu1peHeyAkjaHeNotw
         vKWDaQfX1oJlrrY60xZfZH6C2vrnIN5MMFzxfShTCGIyKVnLhvz+/YO7xSBhq1yfUQpT
         +uWg==
X-Gm-Message-State: AOJu0Yx55B4te9QVjFH4hVC3GvhVDuRvhUU6eXz1U2GqlE/JDcPUSVjS
	bjoVlNHqr+Mkn0im9R1Rb99AM4g2y39UnmUPZJxzfouW4iiFbfleDhipNjRdtT7auLcW54g8OWE
	/CLU=
X-Gm-Gg: Acq92OFbjF4S+9bImAM2hw2u9J8ka9FCJnDXteGCp2FoPba8tOVnBiS1YxOnhf5M0v+
	OOghsPzFCIPJww5od+01Jlb+4+YD7ar8fBpkOMXr0j+CN7F3qL1U5BnBFTSDDP1RXtVzcMNMzAy
	AQls1BSJyte7bPSCSwScu/SOYTftbA//C1Rm491Dw4gn1wEYBkuIpLCcrnj9GplaJh+5l4qq6MF
	N/N6hpunT7siYu7zLVIJkn6L8tzIr54xC02EWdoYJS37UcPTtkocR7Df36wM4oOwxBzCaKNxrbM
	dlKpEX3TEOEjqZhG5EiJzshPEO+FqAVqeEswLV6MiIR4n3RNoDZ2F4COCK0mEBxuYO1LPeuo3yO
	nxTQeJ1mY1PNqHdzd2VI6vYcePTyIoDomtzIrlbLrMxYm7NGWwOw75+RiRsePZwTOACvwjrWnag
	qMnKbfhti6rZzEt4YNWSHxsGsOlWocCWJfA5mfpqE3EWnuYK35W124xoBAE++MS3/CZjnvrQLRH
	qE6i1ZI+ZPhavAU0CBNMBsgJw==
X-Received: by 2002:a05:600c:6298:b0:492:348:ba08 with SMTP id 5b1f17b1804b1-4922007d38amr219914105e9.16.1781617826225;
        Tue, 16 Jun 2026 06:50:26 -0700 (PDT)
Message-ID: <53afba1b-a791-4ebe-9d00-3ca66065c524@suse.com>
Date: Tue, 16 Jun 2026 15:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] x86: Split .init section to satisfy UEFI CA memory
 mitigation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Frediano Ziglio <frediano.ziglio@citrix.com>
References: <20260616101336.44009-1-frediano.ziglio@citrix.com>
 <20260616101336.44009-5-frediano.ziglio@citrix.com>
 <ajExivEwb88pcOxT@mail-itl> <f80e5c37-96db-4af5-9b9f-28f4ff457a72@citrix.com>
 <8b27a14e-865a-462e-a6dd-1f8323de5f43@suse.com>
 <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
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
In-Reply-To: <a7d9c983-c264-4a90-ba17-b2a49bd85c18@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1781617826-8777FD75-8A21131F/0/0
X-purgate-type: clean
X-purgate-size: 1594
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:marmarek@invisiblethingslab.com,m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:frediano.ziglio@citrix.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[citrix.com,invisiblethingslab.com,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,citrix.com:email,suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F4F06901B7

On 16.06.2026 14:40, Andrew Cooper wrote:
> On 16/06/2026 1:30 pm, Jan Beulich wrote:
>> On 16.06.2026 13:29, Andrew Cooper wrote:
>>> On 16/06/2026 12:20 pm, Marek Marczykowski-Górecki wrote:
>>>> On Tue, Jun 16, 2026 at 11:13:36AM +0100, Frediano Ziglio wrote:
>>>>> From: Frediano Ziglio <frediano.ziglio@cloud.com>
>>>>>
>>>>> Currently .init section is both writeable and executable, split data and code
>>>>> to have 2 sections satisfying W^X rule.
>>>>>
>>>>> It is a requirement for NX_COMPAT so the PE can be loaded with W^X perms
>>>>> in the pagetables.
>>>>>
>>>>> NX_COMPAT is a requirement from shim-review,
>>>>> https://github.com/rhboot/shim-review#do-you-have-the-nx-bit-set-in-your-shim-if-so-is-your-entire-boot-stack-nx-compatible-and-what-testing-have-you-done-to-ensure-such-compatibility
>>>>>
>>>>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
>>>> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>>
>>>> Is that the last piece necessary to satisfy the NX_COMPAT requirement? If
>>>> so, I suppose a subsequent patch should actually set the
>>>> IMAGE_DLLCHARACTERISTICS_NX_COMPAT bit (IIUC ld --nxcompat option), right?
>>> We need to satisfy everything in
>>> https://github.com/xenserver/xen.pg/blob/XS-9/patches/correct-sections-permissions.patch
>>>
>>> .reloc needs to be non-discardable and writeable.
>> Writable? Why?
> 
> Because we take fatal pagefaults against it when it's really read-only.

Wasn't this for relocations _against_ r/o sections, not the .reloc section
itself?

Jan

