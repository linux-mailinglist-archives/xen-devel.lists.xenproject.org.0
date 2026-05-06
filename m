Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PmKnL/Ir+2mrXAMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:54:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D2D4D9E26
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 13:54:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301639.1575879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKapS-0002Sh-4f; Wed, 06 May 2026 11:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301639.1575879; Wed, 06 May 2026 11:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKapS-0002QF-26; Wed, 06 May 2026 11:54:14 +0000
Received: by outflank-mailman (input) for mailman id 1301639;
 Wed, 06 May 2026 11:54:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKapQ-0002Q9-KU
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 11:54:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKapQ-0005pt-0k
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 13:54:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb2be1-2eae-0a2a0a5409dd-0a2a4507e754-14
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:54:11 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fb2be3-229c-0a2a45070019-d155802fa5cb-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 13:54:11 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so6049135e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 04:54:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e530c4ebesm24808155e9.2.2026.05.06.04.54.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2026 04:54:10 -0700 (PDT)
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
        d=suse.com; s=google; t=1778068451; x=1778673251; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K6jir9ct90Ib0uuXX1U82Lz6qZles3Pb6Dxcvt6FjHs=;
        b=VqXohRDFa62jZpNETiXQTqmV0BQrYM5BlxE4/S3D6SSydlLm9tsT/txKKggDiJ8fLE
         qC1CTc32Qn3LVZ7Awy6yJUJw52HmKBrv70pq51wDmavFPiIkaGfn8b0YH3dN+o5YLlzi
         bZC1UJRC0OSqJ+i1j7Xp25OkGbTLlYVWX3Z1fW3bZ63oKlxpl4emZOvbL7TlxaCGbpa5
         AnFI+DKWmSX2ctDXkWUwlvHMSjCubRe/n+gDO/ibZ6tSbVTCCzbdqsQac2lDhiKD2HCI
         pJKSPbUuWjp0aPs24WgCO/FMv8AVJEOd6pb0DbNu25ggmeWr7GypeBlsJvb07u3HRQ2p
         JEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068451; x=1778673251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6jir9ct90Ib0uuXX1U82Lz6qZles3Pb6Dxcvt6FjHs=;
        b=qTq+neevJ/k/Vx2gvaihPFYGMp9IG9yQJ5ZLxa4lxj6cN9coEo7AJzaXSuU+BzhSGn
         ti8MaXEdke/KQ96MfGkAAsPN3kGWW5SvqkxaWMlacxvRq99mxvR7FXimF+vzlsNRZdZF
         5qq0prjIjZJbk8YmUxYRG4z/8RYSqSm7jn5WQYBuoL3l27kPwLMEi94qA082ekNhJUwR
         9jIE8pYLioyaJCWOvdAEDZijoXbGsiVa7ibh03wZPapyGHM7eb+GZo0bJgPrALY4NK3Q
         7dGd/g4fPNAdg29h+1xnWC4Mt+DUehuq1qwb9HGXuE6l+4Kgvvnjl4rZOoJsnTnzN3xY
         9a0g==
X-Forwarded-Encrypted: i=1; AFNElJ/DzrCLCxL6B0h/reDsl8+qMvsvwXEKM8YkgcvenHejnLD/MMVo8htDA45s6Z/JMS0bi3eZsLb47jw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd3CtyxrKMPHMr/gifNMXleDhqWj1o+1qh+yXfQB/AsvKwvzXR
	twWlOmbs5/aANT7L+Y0mPCh7zUkpp1hXY3eM7fTdbYoqPJB5FtoTYbbdSSlXeojF3w==
X-Gm-Gg: AeBDietCoTLgfoz+WuJXWjn5MKjKxyNS1ueIO4QXsaWizenwoX3pyqldJD1qST2ARyD
	TnQxdxIX3IQ+/5ukv2LOCBxVROiK1cPgXiAgfY+5rz9KMtxbzFMSqXr3WVXe0I3Z5Uymv/jSSz3
	NYywhFNAH8QreECVGWuFnDlC8UWVFD6pJBqQmoSYGrLnduhODurqZt3dGXH+YgTZOMzzywNEuo7
	hroD7EM2qpjIxJP0aX4ZkA9IcKOmMtaU1vGWQP55uPWN5UP+Cw0sPUonl+Kb8yUUiZPiAj9f5ig
	RxGEqc8x0aCAVklJtxbaKKk5glhn3rWjuzydkaXoi5nca6nCP62OkS3n/vQ9iCkvbTcfjYKT5tq
	/iWvTrsFr0FrrupyxZRVgoKoXJwsMuBlrOuc7s0gAd8cBN/bj0f17k4zIV7HJmytHFM75vv99Wi
	nk2DBVWuL5Z3Kzs+VRO2Ien/acC1BHFmcN3RjGhd62rFqBgBaoOQMhU6n62uil9nBAFl+gdfR2u
	n33W7M2n7JurLkSW36b6ff9cA==
X-Received: by 2002:a05:600c:1e24:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48e5229bd92mr42849035e9.8.1778068451215;
        Wed, 06 May 2026 04:54:11 -0700 (PDT)
Message-ID: <e5844c28-aa68-4bf6-8287-a4ceeda3a1d2@suse.com>
Date: Wed, 6 May 2026 13:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
 <a0abd984989237d2f36e1628db577fb25af1cdbe.1775742115.git.mykyta_poturai@epam.com>
 <5efddecc-3665-4a53-9eaa-b117370cc0e4@suse.com>
 <5168207f-33ed-4fc4-918e-6c3b454b0efa@epam.com>
 <efb254c2-f52a-408d-b225-e4e03935d05e@suse.com>
 <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
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
In-Reply-To: <d0916f22-b5c0-4c93-935c-4cbe17e626d4@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778068451-09B68C48-499F5830/0/0
X-purgate-type: clean
X-purgate-size: 3165
X-Rspamd-Queue-Id: 27D2D4D9E26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	RCVD_COUNT_SEVEN(0.00)[10]

On 06.05.2026 11:39, Mykyta Poturai wrote:
> On 5/4/26 08:37, Jan Beulich wrote:
>> On 23.04.2026 12:12, Mykyta Poturai wrote:
>>> On 4/21/26 17:43, Jan Beulich wrote:
>>>> On 09.04.2026 16:01, Mykyta Poturai wrote:
>>>>> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>>>>
>>>>> This code is expected to only be used by privileged domains,
>>>>> unprivileged domains should not get access to the SR-IOV capability.
>>>>>
>>>>> Implement RW handlers for PCI_SRIOV_CTRL register to dynamically
>>>>> map/unmap VF BARS. Recalculate BAR sizes before mapping VFs to account
>>>>> for possible changes in the system page size register. Also force VFs to
>>>>> always use emulated reads for command register, this is needed to
>>>>> prevent some drivers accidentally unmapping BARs.
>>>>
>>>> This apparently refers to the change to vpci_init_header(). Writes are
>>>> already intercepted. How would a read lead to accidental BAR unmap? Even
>>>> for writes I don't see how a VF driver could accidentally unmap BARs, as
>>>> the memory decode bit there is hardwired to 0.
>>>>
>>>>> Discovery of VFs is
>>>>> done by Dom0, which must register them with Xen.
>>>>
>>>> If we intercept control register writes, why would we still require
>>>> Dom0 to report the VFs that appear?
>>>>
>>>
>>> Sorry, I don't understand this question. You specifically requested this
>>> to be done this way in V2. Quoting your reply from V2 below.
>>>
>>>   > Aren't you effectively busy-waiting for these 100ms, by simply
>>> returning "true"
>>>   > from vpci_process_pending() until the time has passed? This imo is a
>>> no-go. You
>>>   > want to set a timer and put the vCPU to sleep, to wake it up again
>>> when the
>>>   > timer has expired. That'll then eliminate the need for the
>>> not-so-nice patch 4.
>>>
>>>   > Question is whether we need to actually go this far (right away). I
>>> expect you
>>>   > don't mean to hand PFs to DomU-s. As long as we keep them in the hardware
>>>   > domain, can't we trust it to set things up correctly, just like we
>>> trust it in
>>>   > a number of other aspects?
>>
>> How's any of this related to the question I raised here, or your reply
>> thereto? If we intercept PCI_SRIOV_CTRL, we know when VFs are created.
>> Why still demand Dom0 to report them then?
>>
> 
> The spec states that VFs can take up to 100ms after the VF_ENABLE bit is 
> set to become alive. We discussed in the V2 that it is not acceptable to 
> do a required 100ms wait in Xen while blocking a domain. And not doing 
> that blocking would require some mechanism to only allow a domain to run 
> for precisely 99(or more?)ms. You yourself suggested that we can trust 
> the hardware domain with registering VFs if we already trust it with 
> other PCI-related stuff. Did you change your mind, or am I completely 
> misunderstanding this question?

No, I still think that we can trust hwdom enough. Nevertheless we should
aim at being independent of it where possible. And I seem to recall that
I had also outlined an approach how to avoid spin-waiting for 100ms in
the hypervisor.

Jan

