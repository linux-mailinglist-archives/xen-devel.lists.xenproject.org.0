Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIhEKLE8qWmW3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:20:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F220D5FF
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:20:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246275.1545481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3vS-0004pm-Oy; Thu, 05 Mar 2026 08:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246275.1545481; Thu, 05 Mar 2026 08:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3vS-0004n4-M1; Thu, 05 Mar 2026 08:19:18 +0000
Received: by outflank-mailman (input) for mailman id 1246275;
 Thu, 05 Mar 2026 08:19:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy3vR-0004mh-Hh
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:19:17 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 001bf376-186c-11f1-b164-2bf370ae4941;
 Thu, 05 Mar 2026 09:19:16 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4836d4c26d3so59982355e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 00:19:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851faf089csm20814995e9.12.2026.03.05.00.19.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:19:15 -0800 (PST)
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
X-Inumbo-ID: 001bf376-186c-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772698756; x=1773303556; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RT5LRfOTjxi11ExpjXBqs4bzGkA0Zt33gMWSQGL1UJE=;
        b=Ap5k6W8xVDDj2jEkcjk9pgfnq1BJ0QZxcfx6r7awHSbBFkQqB97OHZJwKdTdvr82Tp
         S4NJlrSG0Axya114mUiZ1BKSotKvrxxw9gp+aKNP8jcUsPVqFE08H9dd1Z5VfKlL6vbh
         +FOwJemMkKp03+/lRSxTZP6bQfhvreeEOYv3yXmWsI1aKsisnTrQgYqBFM79Lgeasn4e
         5PmwTUsgcjNMmiU0HG1C12shPoZsRkqRtfaaD2TSmPEYb9TguF/9fs2yl9zA7QAEzHIn
         SUPeXbM08mrLclJ8MppEQ38C983CXE6tj2hlH2YqskWVmVICZw/DK/vCeu7zmHFIy8tz
         JQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698756; x=1773303556;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RT5LRfOTjxi11ExpjXBqs4bzGkA0Zt33gMWSQGL1UJE=;
        b=kHo0JRegUDpHgQG+coYfTQzQGjNGzsNEiyswA32mD79ifeuGJcelIcJTVuUX8DX0cP
         BMITnrzHYJPp0VPC8QeNbpXukDOJCcYhD1hoTx3BbjKsxgOcHuhf+yMIInWB/IU2a9yM
         9r6jbARoBDPD7bt0Y95KcUmH5KtKHgwnxD/oAYGA07RmUwvn9ZVZ1pQFLkBIwOA+sdTg
         Pzh1RBchEdY+Wj+5adMoE5yuLOzDPuYMOzwZBkDgOltwY3Q50WPtNoQkox45xuru3Y/E
         nEomBxJsFqigpqdUc5Tp1SY3fnQtRZqVDZXbLivExWM6xiM/+GPrni5xsxehgCnUxBse
         1rtg==
X-Gm-Message-State: AOJu0YzZLxfDhDUw45Pq0tgDOgwpMSCcPNDwvERKo4aE4hhDScKlh6Rr
	XWlY8tih8vnpZa4tyPsviV5FOM855Hb0zIIXmL1w+RrftkXJqWSIRAs0tcPWxhI1Pg==
X-Gm-Gg: ATEYQzwNsxivuLKNfd5yrdmuU1Sdc2k7AW1tPAKJmTZIH83R6lB5PZeQCIJVkcu3Pl7
	jjg9pnKVpjWWdaxmyGh5A8HDWbB1P7CoKTcn2yeaDzxQUQ17MOfcJl49M/G+zDQ8MRcaLKMAwHu
	O6tJP492xchwlhxH5JsdRyqWcvLGopUNteYTsfUpqFwxNJrg4K3ArzIIJ8c01BdTfXt8u/THHRB
	R55WnqTINissQ5AP2WuLZkjW30Yp5rcxoCDIyQpOMWaLe4ir8MjQVFUdHAlXqUDPbQC7PmgaT5A
	vbkhQS3sNbknSc8baWW2IrUh+acutaAm8e+RHiDipcBiM21diLfyx6pQlzuX54mvss8xwNWKmBv
	wWC09E4A2uHfVNFuoks0o8v31mZsgMizJ2st+xO2rzkwZAh0J8CPzINSBBDdCCO6JnazcEc8pyV
	nnHslC+QSkL0xbOqVlEPRMk8m5EM385Wp18lDIRWmbHIvDLzU8/8C3+eL5w8w1XFAzWPzlTVXP/
	OLMDou4VPfK3fZxpcGAGvA2BA==
X-Received: by 2002:a05:600c:6098:b0:471:1717:411 with SMTP id 5b1f17b1804b1-48519888e49mr80752505e9.24.1772698755702;
        Thu, 05 Mar 2026 00:19:15 -0800 (PST)
Message-ID: <a0d1d51a-4819-421a-8947-a8271609cc9a@suse.com>
Date: Thu, 5 Mar 2026 09:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] vpci/msix: check for BARs enabled in
 vpci_make_msix_hole
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: xen-devel@lists.xenproject.org
References: <20260226025740.71673-1-stewart.hildebrand@amd.com>
 <aahOeefbhHq7IZZx@macbook.local>
 <1e62a5ad-f865-4477-a899-0182dec38901@amd.com>
 <aahjwTA0LLm7JISA@macbook.local>
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
In-Reply-To: <aahjwTA0LLm7JISA@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0E9F220D5FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 17:54, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 10:39:56AM -0500, Stewart Hildebrand wrote:
>> On 3/4/26 10:23, Roger Pau Monné wrote:
>>> On Wed, Feb 25, 2026 at 09:57:38PM -0500, Stewart Hildebrand wrote:
>>>> A hotplugged PCI device may be added uninitialized. In particular,
>>>> memory decoding might be disabled and the BARs might be zeroed. In this
>>>> case, the BARs will not be mapped in p2m. However, vpci_make_msix_hole()
>>>> unconditionally attempts to punch holes in p2m, leading to init_msix()
>>>> failing:
>>>>
>>>> (XEN) d0v0 0000:01:00.0: existing mapping (mfn: 1c1880 type: 0) at 0 clobbers MSIX MMIO area
>>>> (XEN) d0 0000:01:00.0: init legacy cap 17 fail rc=-17, mask it
>>>>
>>>> vpci_make_msix_hole() should only attempt to punch holes if the BARs
>>>> containing the MSI-X/PBA tables are mapped in p2m. Introduce a helper
>>>> for checking if a BAR is enabled, and add a check for the situation
>>>> inside vpci_make_msix_hole().
>>>>
>>>> As a result of the newly introduced checks in vpci_make_msix_hole(),
>>>> move the call to vpci_make_msix_hole() within modify_decoding() to after
>>>> setting ->enabled.
>>>>
>>>> Fixes: ee2eb6849d50 ("vpci: Refactor REGISTER_VPCI_INIT")
>>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>
>>> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
>>>
>>> Thanks.
>>
>> Thanks!
>>
>> I would like to point out that this now needs a rebase:
>> The helper vmsix_table_bar_valid() should be moved to the new private.h.
>> I'd be happy to send v4, assuming I can retain your R-b.
> 
> Sure, please keep the RB.

I was actually going to see about doing the rebasing when doing my next sweep
(pretty soon, i.e. after finishing going through email).

Jan

