Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHWMIEig12kUQQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:49:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27D63CA9C9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 14:49:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1277275.1562489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAooi-0001wj-M6; Thu, 09 Apr 2026 12:49:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1277275.1562489; Thu, 09 Apr 2026 12:49:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAooi-0001uD-Ir; Thu, 09 Apr 2026 12:49:04 +0000
Received: by outflank-mailman (input) for mailman id 1277275;
 Thu, 09 Apr 2026 12:49:03 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wAoog-0001u7-V8
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:49:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAoog-00BF10-AS
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 14:49:02 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d7a03d-bab6-0a2a0a5309dd-0a2a4507ccc4-2
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:49:02 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d7a03d-ba2d-0a2a45070019-d155dd2ac4b0-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 14:49:02 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-43cfac48bc7so552635f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 05:49:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d282esm67104293f8f.18.2026.04.09.05.49.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 05:49:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1775738941; x=1776343741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M85EwwZSVZDHWsXDJvP5LmzsNWgJJUq00bY/hrd70ic=;
        b=CF+BYlwOZ3A6Q3ec6GNJdjAP6rwZCQFPaWHZDS0NU43Z1uRD9L0wrAPPQnL8Y4PDw8
         fUWrykr/gxIpZl3o+6C6aRNi28bKgQOXWNV3IknF89RPRqOAM1RvPh3jcqqz9xn9SHs3
         D5pWs01aOq/pw4PJrv5reG+47SwtGY2ai7z9vVHL48guL8XMY1PS6Co0zWP6EkRgvFWk
         90iB7uAyxOkfMDFFn/UXYjnngs+oFr87BFFtzsg3wdXUIx8jBF/Dn6csm0nshCtG0uPa
         4Jwh5OXCogExB85905TGEmYrjjGZvzxIxONT4Nt6SjEibSG+JZ5NWzbtAQM/CxxQsFR4
         W46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738941; x=1776343741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M85EwwZSVZDHWsXDJvP5LmzsNWgJJUq00bY/hrd70ic=;
        b=ry16MEjnJPLZScRLkeeEgrCUe0R/uLjuUUtgesXCZk+zHbXzjaMqtUcDxC2eNCs4Qs
         MfCic9R90ZstrYEXK/gYIFeoD3/Oj3Kc55nYifGZCgmcIkJHOvGykYVZ/S1jBso2PaNc
         tRJUvLZCV6+tENxGwbdaLqh+M69+5don6kofbMYaBgtn+prPA9DJjvgPNQ759N7+7O0J
         +R+xeo1ILs2KNu/9zJUTYpQxq0wqg7DTZnZLfXUvnY4mVbN+JcniJaF4T7IhpEF7XCCz
         KRUoPqNuKuNrygi9QndMpT01+IkZbKApR0PmkF0SkkGnYXbbQdkqquXpPN17ZsifQmNm
         LIsA==
X-Gm-Message-State: AOJu0Yxs+nVpZV7WSUQNDaTEDHrmfRFymW4N21Nu1pKS79uAEX5ws0Za
	0bes36YJt1+X539qaZ/i2+37GiEvD9TSnhepFWlbqLJTcyVOvEj5oOIC1i8b5gCmLQ==
X-Gm-Gg: AeBDietlNhLp0lCFPWE5JbNHadDk3GxckUjQdGsXSd0CvQj42TZEvqcMG+nd/rU/4xG
	YS5VP5gyTQZrxbGF94uurrrjgtN/kon+LMjIxF57LHM0q4NCYGOawnBvksviuUSlbEbVGswMxtX
	sBEckZQG2VrATuK36m+PUyNtrqUgBJLdCWMa0YvORZc0wW7PdJ/Hhn59RtWhu1neb+CS6JBqnil
	j40kAYeQHgQFBeG7srC0ij/mTu+5tzxaqIpfj7l59xaUaEP0vhIcYiGSLHyGR8H35uveZOVH2hh
	A/iboiShEx43otkzIjf+Je9yByXNRSCDdWWBJIqGLz3uMapXWpTEj0NsBOM5IZQNbPEtB/iDUqu
	kEISiMMyb+vymY4mDTUMseKDeMfUMGABORcJAJX8Sq3cX/C+kev5PSHMT7LlEziYzY2c5bshMf3
	h/g6OurkzhBnlSJHLKvRjy/Sd5Eb4Vf2CCsm04o52jBX43/OP63FEhA0xSuI9CC0fc0OaGCpKER
	IEn7hKJwyk4yFs=
X-Received: by 2002:a05:6000:22c8:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-43d5a14bbdcmr4670286f8f.22.1775738941468;
        Thu, 09 Apr 2026 05:49:01 -0700 (PDT)
Message-ID: <db87a55a-5bd2-44ab-8814-1ffec91d1b40@suse.com>
Date: Thu, 9 Apr 2026 14:48:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/common: llc-coloring: Fix off-by-one in
 parse_color_config()
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>
References: <20260409113934.197619-1-michal.orzel@amd.com>
 <20260409113934.197619-3-michal.orzel@amd.com>
 <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
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
In-Reply-To: <EEF7C308-F25C-46BA-9663-BA789B49429C@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1775738942-1195141E-ACA91884/0/0
X-purgate-type: clean
X-purgate-size: 1038
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Luca.Fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email,arm.com:email];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E27D63CA9C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 14:22, Luca Fancellu wrote:
>> On 9 Apr 2026, at 12:39, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> The check uses >= to compare the total number of colors against
>> max_num_colors (which is ARRAY_SIZE of the colors array).  This
>> incorrectly rejects input that would exactly fill the array.
>>
>> For example, with NR_LLC_COLORS=16, specifying 1 color for Xen and 15
>> for dom0 would fail.
>>
>> Change >= to > so that exactly filling the array is permitted.
>>
>> Fixes: 95ef5ddf8a ("xen/arm: add Dom0 cache coloring support")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Did you see Andrew's reply? If that earlier (recent) commit was wrong, I
think a 2nd Fixes: tag may be needed here. For now I can't help the
impression though that there might have been a re-basing mistake, where
that re-base may have wanted to result in this patch dissolving into
nothing. Yet of course I'm all ears to learn otherwise.

Jan

