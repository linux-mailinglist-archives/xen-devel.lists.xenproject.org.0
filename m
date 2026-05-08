Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBOaLPR//WnnegAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:17:24 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281764F254D
	for <lists+xen-devel@lfdr.de>; Fri, 08 May 2026 08:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1303216.1576707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEWM-00069S-EZ; Fri, 08 May 2026 06:17:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1303216.1576707; Fri, 08 May 2026 06:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLEWM-00067u-Bz; Fri, 08 May 2026 06:17:10 +0000
Received: by outflank-mailman (input) for mailman id 1303216;
 Fri, 08 May 2026 06:17:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wLEWK-00067o-J7
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 06:17:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLEWJ-005u5p-Ss
 for xen-devel@lists.xenproject.org; Fri, 08 May 2026 08:17:07 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd7fe3-2eae-0a2a0a5409dd-0a2a4506e562-6
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:17:07 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fd7fe3-7371-0a2a45060019-d155dd2fd4aa-3
 for <xen-devel@lists.xenproject.org>; Fri, 08 May 2026 08:17:07 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-44985f4ab0fso907973f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 23:17:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454922715b9sm2052066f8f.36.2026.05.07.23.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 23:17:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1778221027; x=1778825827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=On8Mw8XOWmXd831TfiUBus8JrKQglGEO8H8VxqZYekU=;
        b=C7PD71c0uB/W+yuu3SOv+LcyOaUbVblI9zvDI+wdpTZ21pHr71Ta8Y4UFNMHFo7p5g
         wpfO0367Rw8ukYyAii5a423Ebahektm9jj1ZD9gNUfH3NGPqDtYm8D1yXU1/R3luoHlG
         TaLk164eyYWMSswSaWN2nfMzVKbmzVe0UK8nbMuiwZvC8xtyF78v+qEEsiiWDfJjBajR
         TrdrDuf+7J+fJTZ8C2asyhh8LLZzdz3+TlnloPvmiRrtgSQwJt/tmQpFeGRqepG2XFEq
         F4KVAv0FYS/cSponh457Oa7qOKfDyOLTJ1CrITZZeYSp44PrJDCafuR9sJ+2lfhhbZ9k
         tKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778221027; x=1778825827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=On8Mw8XOWmXd831TfiUBus8JrKQglGEO8H8VxqZYekU=;
        b=Pa9LqMBcc7Y/o30n3WA5ii8Vd6eEWULvRqtORtH4gHwbqm/e/aGmWQXdoj2tItqoEB
         Y7UEhvLYZR1uxffI5uKzRBsqSzk7BdCF5qrknF798vY/8HLyAsrbiWNAE9LwhfDzbwVD
         lJOCZf/6iLr/Y3biPjtEeevVcJ68cHcIAAWvuU49qk5CbW0w9Gl9mbCwn7zum1Oe1Uhv
         qpzKJn1/GHK/zxBocq5yHTUsK9FBZ0pYwat7EWDN8WoUrxVos5pJVHeSgqA2A+FHGChA
         iaIHC05D6J30NOmq4PS3n5h4b+shBfI7NVHIys0/n1S9ZHkF014tdRGGM0xNVhYGp8Jd
         Q4kA==
X-Forwarded-Encrypted: i=1; AFNElJ9sHVIuN+HRkSl9emes1N5iWpvKB4N4C0B/kvQer+hIbuW3LI0WSuVgA3VYC9rkvgWjr8vmDvtVjcI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyxynZ/fOlKth/eK982mCzMk0+PzGMn77gtGADONLaVCE4lDIFz
	ITxL6JEb+hpNKPhmaHliJAnz9dJwGWKe7seu9Z4xBT5kuJ0i03HhB4uxrC4GoMf1gA==
X-Gm-Gg: Acq92OFDaz0QU2NOl+FH4fnL3VpCEw/R1X8PMA/8IbxmoMSo096wg6W/PkAfGxz9yDG
	NPEZLcV0HvokHM9Tfg+WveBLNMiB9/3hExWUQEY23fft/PcYbmMalZXfBsxBt4B0zTSMiMT6ANo
	uYLkbb60pwZ02vY6u+ryZGbWwnZNLR/xfkVx8zEpEFEoR2CFlVbLmLD0WO+3v4yqPTM/4n6HJL5
	LR4X16Goe+y7raXFGxEzIDNbpylNV7yqH3zVP7JHtgeThlOqqsuUCVXAZ9SKwP6eI8nN8uRy4I0
	yDdLRWMi6KrkGwYPKUf68w4SLhbmRk6NlwYvKeItX0F3l66wv8iftJljUfonIK2yPpd55yiGARk
	7i1YLkepenAlQhcDYp/qAaSwFWv2wVrUag6TKBxP3ia6stQHJ211ghkxvLBU5wj9Q0dMfYGY3at
	qz0egfMm+pjJLovSvK510hFMvWKlEAYGV9cEudVPhudvq1sVB4h+I+hQx6SMk9oAkD7ZCd8QSI7
	mFVT/S0JAS98mE=
X-Received: by 2002:a05:6000:24ca:b0:449:a07a:967f with SMTP id ffacd0b85a97d-4515cf127cemr18129182f8f.28.1778221027193;
        Thu, 07 May 2026 23:17:07 -0700 (PDT)
Message-ID: <cdb49070-df93-45fb-b0e1-26dbfd532507@suse.com>
Date: Fri, 8 May 2026 08:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gnttab: simplify (replace) gnttab_set_frame_gfn()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c4ceaab7-3d5d-4923-bc27-f67d1510048c@suse.com>
 <d7e4d96a-ae5c-4438-9481-09ca1aa50402@citrix.com>
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
In-Reply-To: <d7e4d96a-ae5c-4438-9481-09ca1aa50402@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1778221027-8C47CD75-8A5280A1/0/0
X-purgate-type: clean
X-purgate-size: 2023
X-Rspamd-Queue-Id: 281764F254D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:volodymyr_babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:rafal.wojtczuk@7bulls.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 07.05.2026 19:49, Andrew Cooper wrote:
> On 07/05/2026 12:41 pm, Jan Beulich wrote:
>> It's not really doing anything for valid GFNs, which renders its one use
>> site pretty pointless. The other isn't so much about setting anything, but
>> rather about clearing. Rename the macro accordingly.
>>
>> The main point here, however, is about Rafal spotting the double
>> fetching of the GFN (first in gnttab_unpopulate_status_frames(), then
>> again in gnttab_set_frame_gfn()). Re-purpose the macro parameter to pass
>> in the already fetched GFN, while dropping the no longer used parameters.
>>
>> Suggested-by: Rafal Wojtczuk <rafal.wojtczuk@7bulls.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Do we even need the hook anymore? It has been expanding the same for Arm
>> and x86.
> 
> At this point, I'd say no.
> 
> The macro has changed contents several times since it's introduction. 
> The grant table macros especially demonstrate how poor the common/arch
> interfaces are.

Okay, unless I hear otherwise (pretty soon) I'll drop it altogether in v2.

>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1844,8 +1844,7 @@ gnttab_unpopulate_status_frames(struct d
>>          {
>>              int rc = gfn_eq(gfn, INVALID_GFN)
>>                       ? 0
>> -                     : gnttab_set_frame_gfn(gt, true, i, INVALID_GFN,
>> -                                            page_to_mfn(pg));
>> +                     : gnttab_clear_frame_gfn(gt, gfn, page_to_mfn(pg));
>>  
> 
> This is just a more complex way of writing
> 
>     if ( !gfn_eq(gfn, INVALID_GFN) )
>         rc = gnttab_clear_frame_gfn(gt, gfn, page_to_mfn(pg));

With up-front

    int rc = 0;

yes. As in many other cases I'm trying to keep churn low when there's no
pretty much objectively better way of writing things. Personally I prefer
the "just an initializer" form (iirc it was also me who introduced the
above code in that shape).

Jan

