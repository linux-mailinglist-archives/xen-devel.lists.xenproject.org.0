Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNcsNCxgg2mfmAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:05:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CCE7DE2
	for <lists+xen-devel@lfdr.de>; Wed, 04 Feb 2026 16:05:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1220878.1529291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneRD-0007I8-Su; Wed, 04 Feb 2026 15:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1220878.1529291; Wed, 04 Feb 2026 15:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vneRD-0007GC-Pu; Wed, 04 Feb 2026 15:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1220878;
 Wed, 04 Feb 2026 15:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vneRB-0007G6-PW
 for xen-devel@lists.xenproject.org; Wed, 04 Feb 2026 15:05:01 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dfb854c8-01da-11f1-9ccf-f158ae23cfc8;
 Wed, 04 Feb 2026 16:04:59 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48039fdc8aeso42334545e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Feb 2026 07:04:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830fc1744dsm42301315e9.2.2026.02.04.07.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 07:04:58 -0800 (PST)
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
X-Inumbo-ID: dfb854c8-01da-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770217499; x=1770822299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DnITYY/mzTHqwD9uGr4WYDZ6ONzyoTjVRZ+55ops4eg=;
        b=NziBa2wNAlrqasdAl7418+R2Rk7aPGqZ3wVvooedJ9l56SjJlXGo07nyOBWwAHbTxq
         LH9Xs/qTaFunne1wexb74AOGVPAOJeKLHGkK5N0xj9CKwj94js7ngJZgi2g9eFkDTFzh
         sZk1UhVH4PR0H35DNBuFjbpux7oJWU96YXCSj72WFk/hydRr/U0rWQ8U4E6U6VwQXFDf
         9rgydKtPNPIiu4DPAmhV74cntVgn8ouFMj6Ex/wA3dQjZ0cKiVKKgRP20lmtIV5owtTL
         horrM8034IaykI4Vs6zNDyVGSFTemHfaoUeaPEDFe5B2LgsvmbXnolr41ueU9vA1np6p
         wBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770217499; x=1770822299;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DnITYY/mzTHqwD9uGr4WYDZ6ONzyoTjVRZ+55ops4eg=;
        b=rn0d1w4tqt2cMdlgU9l0VB0X1VxDSiKNdJWiC5r/H8BmpMlvoBK1Wl7UBRVBRm2WTF
         S6vDDiwu2NYT9tN13pnMjzlLt2g/P1w0mcy5Ms7sSfHThz9riYQEk0qwSWbLkaudO7er
         QJZ++iRxUH7/J3D3MXmgx9VWSNq+W0j7oSjcPqyvLsLADbVESs+GRyWmMdRFRdHd0m6m
         jMa4KHudDgA9jjMDQzEvgC9nhF0jH3Obqu+2fALQEpkbYnyvK+gYQUji2qQP8KIfe8+z
         k3KN3jIJmQiqoCsQhqIJJPz4A4g671rKGR40J0sDt0FaYaoCNiRSedAgb/38iasUfCL1
         gHUQ==
X-Gm-Message-State: AOJu0YyixIPXZ7cTLPzn0sTP4BgVOPOU83ezcyUKLcI/AmminT9GHYvn
	zGzkvmkxlLZy/nCsggq4JwjaKGh8wE+rQI2oB8SOixL8MrYSnzeP95+FaAzpSz8nIAB6O69MfH3
	b4So=
X-Gm-Gg: AZuq6aJYZMPBoo9n9MDP4chMxFic8oBvtFn21AIuNt1w3/tftTKLmciaiCaT+fTpKY6
	2pDSPLbeQTY/ZxY+7x1AfQEL6usul7GawbHfmGQFuDsZnXRubJb+slmBQvcy4Fu5tt4/+vGL7e9
	F8mpl5koTbqMEFDNnXqlXmMe5BhTslfGxdn6i8h2nUZyPlooiEHLybxlxCC8Yz6cNmEIG1Dd+ls
	IKk736LCaDangXCU5iQFrDswoj5KZ/DP3vD+U6TJnBtUnY5rt42aqfXH1UTYX5W7Jux+efmW3g+
	AGCDkd6BCunV2Qh2X7EvBZUCCroCXLjermpqi/Jz6lJyGWrFyr72OuoIUcnqAVHuPWQ9Y3OvkBx
	FP4TCHWPYFbAcleCLKNXxiKMMQIz4Xe4FfhoH+hC78OH1fNAESInl7jh0BTsPyG9DVfKvB159dm
	Q4jro/cGHSwzEYuxYjcbjghsSsi7xDgPRmlbyJD0ZNfYEGeIX7bQK+x+zKAVb4Voa9i3oUQFhH7
	mU=
X-Received: by 2002:a05:600c:5491:b0:480:46c6:bf4b with SMTP id 5b1f17b1804b1-4830e92a73bmr40055215e9.5.1770217498831;
        Wed, 04 Feb 2026 07:04:58 -0800 (PST)
Message-ID: <87e824c4-0f24-4d3b-a261-7fe19d554f0c@suse.com>
Date: Wed, 4 Feb 2026 16:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/domain: adjust limitation on shared_info
 allocation below 4G
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD
 <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20260204122553.75711-1-roger.pau@citrix.com>
 <cc8f0f84-fd5e-401c-ad71-ab5a10f21fa8@citrix.com> <aYNfVDgSgKCYd929@Mac.lan>
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
In-Reply-To: <aYNfVDgSgKCYd929@Mac.lan>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 434CCE7DE2
X-Rspamd-Action: no action

On 04.02.2026 16:01, Roger Pau Monné wrote:
> On Wed, Feb 04, 2026 at 03:20:09PM +0100, Andrew Cooper wrote:
>> On 04/02/2026 12:25 pm, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -247,6 +247,26 @@ int switch_compat(struct domain *d)
>>>      d->arch.has_32bit_shinfo = 1;
>>>      d->arch.pv.is_32bit = true;
>>>  
>>> +    /* Check whether the shared_info page needs to be moved below 4G. */
>>
>> ... extending this one talking about the 32bit field.
> 
> Hm, yes, I've considered doing that.  Unless Jan objects I will move
> the comment then, seeing as you also think it's best.

Definitely no objection from me. My R-b stands with that movement.

Jan

