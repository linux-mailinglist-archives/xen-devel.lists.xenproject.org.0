Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IRLMlv/u2murAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:51:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351562CC35D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2026 14:51:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1257236.1551668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DmG-00073Q-Ti; Thu, 19 Mar 2026 13:51:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1257236.1551668; Thu, 19 Mar 2026 13:51:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w3DmG-00070O-R4; Thu, 19 Mar 2026 13:51:08 +0000
Received: by outflank-mailman (input) for mailman id 1257236;
 Thu, 19 Mar 2026 13:51:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8LP9=BT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w3DmF-00070I-GG
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2026 13:51:07 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac70c3f0-239a-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Mar 2026 14:51:05 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-486507134e4so11700005e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Mar 2026 06:51:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b51892244sm17879078f8f.22.2026.03.19.06.51.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Mar 2026 06:51:04 -0700 (PDT)
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
X-Inumbo-ID: ac70c3f0-239a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773928264; x=1774533064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vFQ2rwShxVe9+05EBZXrp27ng6Ez5bN7KdIOH4xut+0=;
        b=HCsfoJTHytDx5wdcA9qojrcEOPwOuVcIEOcyJSBOFQ4OQq6OfNbK21z8Fmi/ac0lID
         w0O7VBBHBJjwb7ttDfx85MF/SPuR9BhWDGnsmjC5XAjfHoIMWP1twG+QzDPOi9aNo1MB
         +z8tDnZcZGUijCuTb3Z6MJPgQhn+uhBF0Q63qeb8nGsrnfYx+KC3hKv+bOy+yyINgPRB
         zE5CQHEgm0A7p1KlroPchsVRawkoxWPB8qC5DwEoCEYscwoM3rZw/wzULwCuWoTsHYAv
         ceUgQEXECABDjfuTzcJc8W0pK9StXP2qq+S+v84fS4yVOMNuBXfwKZWhBV+/Z3CSBLrZ
         RuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773928264; x=1774533064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFQ2rwShxVe9+05EBZXrp27ng6Ez5bN7KdIOH4xut+0=;
        b=XnI1yG+/+lfCIBjID/t20J9zOnugPocoVDi9Qa9IGG6GTwOPJirA8NrG/j6lS4/u56
         z0mK6fAA1qRxmaTUlsUFhSd7D7TtqAWIk8Z/hIb+QDOvyscGBJh+nuDx7GsUKo8AHxAP
         eYRw3i4Ut98p+SowT+3Yj570+CM6drdWa8qn7j/ylkz9bbEJ0o3A48JG5GalEaihVY2M
         6B7S0OtiWvpSaV3xpLJQS5A+74iohvLMS5A73R0V06gWKazG+rC3UUhw3K4SqNeSljAJ
         1SfKMIBpHGXcoXz1WnJ3/hGG1UKBclHv05lrSkSSVy7lXd+TJKR1QBAdI7XzMsWcpGdf
         slUA==
X-Forwarded-Encrypted: i=1; AJvYcCUJN4fBAAPLkU2mVITfZvLaADE4+KVni0CUY7J6HQeYL+xxxFeuxHZy3mG5oYaikGHTVIWYZPEf1t4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzcPvqQENPSiAHaHZy9jwb3gJlHYnPYKXx7n1KrfCdCVz6O4bvf
	V2Y4uWJtb8ijqOMWk8XlTim3Q7kvaMTrXfgQav18Er7Zu4WZIy0PPf50Eg0S7Vjmpw==
X-Gm-Gg: ATEYQzwpV5t4L/oA2pG/R8XLbLt3KTAdeaOEmP8XhkM0aSvj+lnQXiZ0Y+QxekDcSiu
	cQkJXhRbNmY9lQ223UUCe4Q2ckxJgj8sf8Mw8FLZNTEMWgf5ku0ucmoy7uICe8P2Az8IMqs/gZE
	uvljfPSSBpeEqWhwiBA2WcHNk69Cohsa09Ve3n7LFHGg7rDizXUhPKHoeBkGNoFmL7ATkmFOJBI
	32moUKcQ/Lzq8YroOjx6woHL1OPXpaxPqq/D7pVhPAZ03J/A7PMNeIlksx4E+JJ9itKDL2QfZA1
	ewHv6KtEz1iDg1V+Y8kBM0f9P4taKF7fXR5wmcPVlronHSpqH+/UXwlMdvq7H5R+e6lK+dv0Uak
	x6Nwc/AEL6971ijdZy7GhXlrOhxT0nhmjouDCmm0fUezddSUV6Rg6gvh9GZNtoKRMDknuBuJRoD
	ILr0i41bvlrnCuyXK/6nKK6mt19CWFA200OiNcDq4QaosQ3vt0iP1HMxoUMF4ORqprzsA0LrYVU
	7pnV/v3Pn9v9Fc=
X-Received: by 2002:a05:600c:c163:b0:486:5f71:5829 with SMTP id 5b1f17b1804b1-486f441bbe3mr128601165e9.5.1773928264534;
        Thu, 19 Mar 2026 06:51:04 -0700 (PDT)
Message-ID: <d5ec7548-3b5b-44d5-bebd-f18d33b4a7d6@suse.com>
Date: Thu, 19 Mar 2026 14:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v v3 6/7] x86: Remove x86 prefixed names from x86/cpu/
 files
To: Kevin Lampis <kevin.lampis@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260313163630.1073019-1-kevin.lampis@citrix.com>
 <20260313163630.1073019-7-kevin.lampis@citrix.com>
 <24885daa-5801-4e5b-9d16-bac70bab4f0a@suse.com>
 <BY1PR03MB7996677156E710EAD8E3E8E0F34FA@BY1PR03MB7996.namprd03.prod.outlook.com>
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
In-Reply-To: <BY1PR03MB7996677156E710EAD8E3E8E0F34FA@BY1PR03MB7996.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kevin.lampis@citrix.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 351562CC35D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19.03.2026 12:34, Kevin Lampis wrote:
>> With that - where did the ack go?
> 
> When I post a new revision should I add the `Acked-by: ` line under my `Signed-off-by:` line in the commit message? Is that the right procedure?

Yes - any tags you have collected you would accumulate in subsequent
submissions. Unless of course they have been invalidated by you making
non-obvious changes. (As "obvious" can be subjective, you may want to
err on the side of dropping tags, if in any doubt.)

More generally for formal things like this one: Please simply keep an
eye on how others do respective things.

Jan

