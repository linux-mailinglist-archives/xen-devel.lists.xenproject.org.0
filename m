Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mN/lM7j3+mmlUwMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:11:36 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D544D7ACD
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 10:11:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301256.1575546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXL4-00045i-9j; Wed, 06 May 2026 08:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301256.1575546; Wed, 06 May 2026 08:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKXL4-00043S-6b; Wed, 06 May 2026 08:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1301256;
 Wed, 06 May 2026 08:10:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKXL2-00043J-NH
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 08:10:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKXL1-008psN-Vq
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 10:10:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69faf77a-e002-0a2a0a5209dd-0a2a450ba0e2-16
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:10:35 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69faf77b-212f-0a2a450b0019-d1558036a962-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 10:10:35 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso5781685e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 01:10:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e53110aebsm15943495e9.3.2026.05.06.01.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 01:10:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1778055035; x=1778659835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I1Q773YCyGDhccizyfSd5RaGlc03FuD+GtUIu69ZED8=;
        b=EDGoxPM85TR5koUFDeCT1xZGAwTOJdBh+BwyHWxL0pUA1ytu7UpyXG903d3SZHCiuA
         jj7m+qzFAFo4wtsBKuSUmT02zyyacCBfy6CbB1TSscoWDkmOeNvEe0DSq13vutsOkSzK
         e/K7KOoBWYVJRYEpKnYEyQ0AzK7BgxolwEXC5VuMaWAR74ojTKAZ0QhPW+LaXVHUQ9Iv
         ZbDtw1Uv2zaTVTNuHU3B2J3XeAOgc9VSCEkciAduJIjKhZqQXbmnAd36dPwsFzaJImzB
         L/ZInhZrX+/NKNidwioUP5bXr9zM50Zugpp5P5H1obZ7II5ZeZPpHMwelaZG1rX83Cre
         SjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778055035; x=1778659835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I1Q773YCyGDhccizyfSd5RaGlc03FuD+GtUIu69ZED8=;
        b=CV7OVRbr8Bc1FzIorbga2fY4OcdWRLQ9IK8BGt82kD7cBawibhPx6jjl33FJoDdoKk
         6OsclU7KV6JXCB+TrGoLSyClHEXv/f526p02aiotfQB2itFv8OxaTjncA71YBfnfnIIv
         iCPRMjSiEYkjSCSnCjQ7nDln646ZcMqQ7DQnqR56tRDC6BSvzSjFmq/FDJAO87EY0Uhf
         cPmsQ5k/Py1FFiAcs8+bjbb6Udoc8yc5F4XvrPAt9cFy8zNekRGTPz/2shSvcaPxgw/F
         L3S6+SIBzqPcohRHFWhxTSh2WhHzX3Zvy5aHQcuUsxc0/UxBD2ep+IPXNIyNHzm+g99z
         KOVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9zriojz1lcoWOiv817PwIt7DEqOmnjJlRAwQDLD98hn9OslPIGDSCEL9bseVSmPO9W6cLx8A5ho4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPbgKPGmnvJNzLN9+aS4IZm6Cr8IoSgH4H/o9V0AixeLQ8cCsC
	mGCu7k86d5qw57m6WC1ouv4UitY4mIiO617uzjY3l/dn3dv0auJY0qJbQNw/HFNGxQ==
X-Gm-Gg: AeBDies/zjOf0PizTtKB3OBgceL+LrHScziFCBlRbJSAAnU7YFqjcz+Aj0ja14SVdHH
	6oM1KHJwJAozh0wbFTrVJ2rYl90OJwzYyvbLcfHmPrFADaeIiHzPJzcj/dceY1Vg42AjxBSBhaj
	oFDz46nLLnnadmcwGbLaAI/CKqOTm0Sto9BUQyW1V0K1KZ2dBn3uHXLzeX7lxSgNSQtJUqcV+D+
	J6DwX/DhEHewRgSMAIWrE1Of6BhrpY8VLCjEOS4b6b2POoqUsOI08dydm5kV2rH+nyOSmprjoSz
	MvtxLVKHydy6u1uaBeJRPBh2VTguqAQXAlG4UQHICZzJqONUMCzBG2oF+gTacwLrFNLlZOmRdd2
	1vlpbGFmarzQn/LxrvMexLkV59hzgP8uIHjB0zr7vVo0pNRUWwZ/dHXj909YGO1ahCEFO74L4li
	/v6TbFeqQRPftsOpqf3zyW+e+OdHTg2QXh20jPJvOZx906WinTV90HDGAkHQJlcvI0w1jcyUfTb
	kSbz3J6dz7/cZW38/6d6+gmIw==
X-Received: by 2002:a05:600c:5395:b0:489:1d7a:4537 with SMTP id 5b1f17b1804b1-48e5226c508mr34081445e9.3.1778055035168;
        Wed, 06 May 2026 01:10:35 -0700 (PDT)
Message-ID: <8ae99c06-5523-41f6-a34f-d34934e23a39@suse.com>
Date: Wed, 6 May 2026 10:10:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] xen: introduce CONFIG_HAS_DOMAIN_TYPE
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Michal Orzel <michal.orzel@amd.com>
References: <cover.1777296786.git.oleksii.kurochko@gmail.com>
 <7c91e1a705e1046be4af1c5671a8d91cf3557013.1777296786.git.oleksii.kurochko@gmail.com>
 <5daeb8f7-cf0f-4ea7-a686-93df36b43a30@suse.com>
 <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
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
In-Reply-To: <2ec5eec1-0a7d-445f-9d96-99b3070afeb1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1778055035-7FF7EF3B-F6077B4E/0/0
X-purgate-type: clean
X-purgate-size: 1649
X-Rspamd-Queue-Id: 36D544D7ACD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 09:44, Oleksii Kurochko wrote:
> On 5/4/26 2:21 PM, Jan Beulich wrote:
>> On 27.04.2026 17:34, Oleksii Kurochko wrote:
>>> @@ -69,6 +70,14 @@ static inline uint32_t alloc_phandle(struct kernel_info *kinfo)
>>>       return kinfo->next_phandle >= GUEST_PHANDLE_GIC ? 0 : kinfo->next_phandle++;
>>>   }
>>>   
>>> +static inline void set_domain_type(struct domain *d, struct kernel_info *kinfo)
>>
>> Pointer-to-const for the 2nd parameter?
> 
> I will apply this comment and comment above.
> 
>>
>>> +{
>>> +#ifdef CONFIG_HAS_DOMAIN_TYPE
>>> +    /* Type must be set before allocate memory */
>>
>> This comment would be more prominent if it lived outside of the #ifdef,
>> perhaps (read on) ahead of the function. I wonder though why it's only
>> a comment, and not e.g. an assertion. If an assertion was possible to
>> add, the comment would want to live next to it. Without an assertion
>> putting it ahead of the function may be better.
>>
>> Depending on how far to go, changes could be made while committing, or a
>> proper v5 may want submitting.
> 
> I think that instead of comment or just after comment the following 
> could be added:
>    ASSERT(!domain_tot_pages(d));
> 
> Jan, Michal, do you see any concern with that ASSERT() or I could add it 
> and keep your Ack-by and R-by.

I'm okay with it being added, as long as you have made sure that it is
legitimate to have. IOW (as pointed out numerous times before) you may
not assert on state that's user/admin controlled, and that isn't covered
by another, earlier check. In such a case an error would need returning
instead.

Jan

