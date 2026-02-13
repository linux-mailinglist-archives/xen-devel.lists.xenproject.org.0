Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEFuATXdjmlSFgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:13:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67518133D92
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 09:13:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230291.1535785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoIX-0001cQ-6H; Fri, 13 Feb 2026 08:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230291.1535785; Fri, 13 Feb 2026 08:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqoIX-0001a2-2I; Fri, 13 Feb 2026 08:13:09 +0000
Received: by outflank-mailman (input) for mailman id 1230291;
 Fri, 13 Feb 2026 08:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqoIW-0001Zw-BB
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 08:13:08 +0000
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [2a00:1450:4864:20::444])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d049906e-08b3-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 09:13:01 +0100 (CET)
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-4376acce52eso411949f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 00:13:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796abc85csm3571912f8f.22.2026.02.13.00.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 00:13:00 -0800 (PST)
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
X-Inumbo-ID: d049906e-08b3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770970381; x=1771575181; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WHInJoYDwFXDAhtMrIWkYTNDE5FguWhlNlUm2nYeOD0=;
        b=Wv8m8aHpGAEGnNR1qyB7Ero0jVgizknlOUl0xq0WODY0FLXtCJ9IYyVOlICc1VMTnD
         8kbLhQ9Wy4axHbQCbF2KJzuZJ5Qmg/UKe9uYSLoQJPZ9pBj8pW2fJQeYUWJen5VdMY9b
         tR65qd63BR9sqyMo33ave5HhXNLqjhy7hs5sTd8OKwzu0jb2/GFhXhUG35wdAbM+emYf
         BvZvG/7eca5s9CKSDj7FHCdp79HHDLCSiq0cKfPoSWP/GGTnU53A+CRPAqMSjmtceK1p
         lqitehsAilpd7yOU5BWdokgtFWsZBoQYuLs8B8k+KXp9xo+yjLr1315nq9z6zmUGrYNL
         418g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970381; x=1771575181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHInJoYDwFXDAhtMrIWkYTNDE5FguWhlNlUm2nYeOD0=;
        b=m8bPPIUzBk+EdLeuILH5BfN87GKVNCtwfbQq1cKm6+U//S10LxjyRVshRhWdF7Go1z
         xsUQEZbwHW3zvL9wncWQMgVEs+6Pa/rwsFT8iSIkdw7yf0ws8hXzvzvj2pP968a1posv
         t8w/ZsbkCw6XgmUbBnHyu3Fi1awqsiuWYfhK1aE7HaBf62M2T5/sn0hj5Gd247OMBIG6
         GzjnCDoZWoLOkWvb25P7PYi4zsQMZmhKyAgmY1xaOJuSX5OeX46nPNa6DPQ3ykwwg0Dg
         GkKbiP6d+2Vkkh/orTet9jCDH6kUtDvXvCOWC6RpLa5S6EdQH+wODPSJyYSsrfQeyCEd
         q7BA==
X-Forwarded-Encrypted: i=1; AJvYcCU+vryQuJHG1WKva3hRbQn2y5wNVipSlieG1X0gEchHMScucXUx2vqu2vhHB39X3+m0j8+Al7fKG28=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHn27FvDs65Bs2cDYlBXZ4GEjpabI32SdAiCePkbQJS1pk2Lp3
	0zKPG0b4AM6Cgrz6uFxGpjn0MaKcGgB1CbuR7BpBZwAMrFKuKePWxfcARmMyAX+vOg==
X-Gm-Gg: AZuq6aIlJ6bU4Hlp3tSZr4+ErSIbD9ZpnPTjkXEd/anRMC1F4lCp+8gu6O/V84suh0J
	pAlN8EgVcqKWPbXBsQYXBRYS0ZzHHFI0v5b5COo68UCPgwLQNX14P7XBSgDz2RUi2Nk88ymlKi3
	3xyzKWEid6MOAAs5fAc7G7D7gpguKCqBiz5LyVyEW3lIHFP+LiIPVnN/Sfr7qRDPOYMvSuyktH5
	nUj/POTxSepC6krAdLKmKTT52ZhxxMSzu/p78N5g/Kb7WxEq4+RPN84X1BfoAQvtOLK9C0GKbLm
	lQKuMk+AhhKtSMdgRYGYSi+4YawNFRSu6p0rN0awPGkq5wxj2p5O+EgUX+gviTRg6H/r2mAIgjP
	aFWAeN31Tuqdoiac+KlU22yl+7SKmYSpC84iSkHreFrbLRp7QVNEsANJlZjIHAr+xI2Yc09XUBm
	HiE/HGegPfIgnkBNXXrWOWNKoGWnWqhq5kldsi2nzbsDqQXWGB0tkQbaZduURwPZg7+gbs6H5fD
	QW8WBconOhe9jigpIwTIA2xOQ==
X-Received: by 2002:a05:6000:208a:b0:437:6c07:998f with SMTP id ffacd0b85a97d-43797918993mr2033731f8f.45.1770970380683;
        Fri, 13 Feb 2026 00:13:00 -0800 (PST)
Message-ID: <66d789ce-8a71-4115-a2f5-356dbcb4a82a@suse.com>
Date: Fri, 13 Feb 2026 09:12:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] common: honor CONFIG_CC_SPLIT_SECTIONS also for
 assembly functions
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel-bounces@lists.xenproject.org>,
 Jason Andryuk <jason.andryuk@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a11e692c-2bfe-440d-915b-818b133874c2@suse.com>
 <bd656991-59bf-4435-b6e2-554b9ef4725e@amd.com>
 <DGD73M12VYML.SNZI1JQAXHAQ@amd.com>
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
In-Reply-To: <DGD73M12VYML.SNZI1JQAXHAQ@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:bertrand.marquis@arm.com,m:volodymyr_babchuk@epam.com,m:oleksii.kurochko@gmail.com,m:xen-devel-bounces@lists.xenproject.org,m:jason.andryuk@amd.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,arm.com,epam.com,gmail.com,lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 67518133D92
X-Rspamd-Action: no action

On 12.02.2026 19:29, Alejandro Vallejo wrote:
> On Wed Jan 28, 2026 at 3:35 PM CET, Jason Andryuk wrote:
>> On 2025-04-01 06:58, Jan Beulich wrote:
>>> Leverage the new infrastructure in xen/linkage.h to also switch to per-
>>> function sections (when configured), deriving the specific name from the
>>> "base" section in use at the time FUNC() is invoked.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> Tested-by: Luca Fancellu <luca.fancellu@arm.com> # arm
> 
> I don't seem to have the original patch in my inbox, so I'll just answer here.
> 
> About the assembly modifications on the exception entry points:
> 
> With split sections the linker is free to reorder all of them as it sees fit,
> which probably means we want int3 after every jump to prevent straight-line
> speculation from allocating an XSA number for us. It's possible the linker might
> inject them, but it might also not. Better to err on the side of caution.

We're lacking such INT3 elsewhere, hence why this is the topic of separate
(existing) work. See how, for example, we're also not using -mharden-sls=all.
See e.g. [1] for a very old posting. Even in my outbox I can't find newer
postings covering more stuff. Intermediately some of this was posted to
security@ only, but there clearly was the plan to have all of this in public.

> Though more generally, I'd just keep all exception entry points in the same
> section. They'd never get GC'ed anyway and we're paying an extra branch in the
> #PF path for no reason.

Inserting a branch there was, iirc, asked for by someone independent of this
work. But yes, suppressing too fine grained section splits is an option.

Jan

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-11/msg01542.html

