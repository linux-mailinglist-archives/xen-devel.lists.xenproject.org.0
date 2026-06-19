Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hRU2Kv8LNWp8mQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:29:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E72B6A4F4D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2026 11:29:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="d/C9T2LN";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1341969.1602263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVXJ-0005DN-1S; Fri, 19 Jun 2026 09:29:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1341969.1602263; Fri, 19 Jun 2026 09:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1waVXI-0005At-UG; Fri, 19 Jun 2026 09:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1341969;
 Fri, 19 Jun 2026 09:29:15 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1waVXH-0005Ai-IF
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 09:29:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1waVXG-0051en-Rz
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2026 11:29:14 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a350bd9-e002-0a2a0a5209dd-0a2a4508c958-36
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:29:14 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a350bea-9ee7-0a2a45080019-d155dd2cb97f-3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 11:29:14 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-4602e2a0372so1519147f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 19 Jun 2026 02:29:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd21dbdsm51947655e9.6.2026.06.19.02.29.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2026 02:29:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1781861354; x=1782466154; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2IEhq+Jyerg+gWVfdrFYGvL3a97IkaxgMb9y8YNlNM=;
        b=d/C9T2LNMpOgRLdrK8+SJPDm96CF6b65dqyluJZmzJ3Jr4GhVj95oE4BsVGrPApDLI
         v164/crmin79TTmhHZoAhoiKHeqjiXQahhfIhY+BCCjwT/RfOZiiPR3aWyOtUrGOvbhc
         voaz/nYroVoZnuCGr1lH03l5+NBdFFHXQ74K6EIp+wDr2FFz5fPOehGT1E7viV7fxhkF
         PFo+KYbPiK6ACrigTitIcKIJO1kOBOqVsUhyiPUTyBzlYxdpI6TcA4w4bmtAhNxCBmGX
         S2m7/Vtht7O5v2XCCIoEUQx5pw96wpFPogHRkXmkqWAgIA5pr2w82oYPSSGLhXU1fJkz
         1muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781861354; x=1782466154;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2IEhq+Jyerg+gWVfdrFYGvL3a97IkaxgMb9y8YNlNM=;
        b=DURaViNKZQycAYvy8w7odPQ609kUuQHTFcYB6UjiW4jKKFeN1rGC4Hgw8XdlDuiW9g
         VY02rF1gBJw4hhgv4LF/pFNA5dHFzBYxzUcaXNKZRypAG0OSle/d7yvKEmWCqJ1Ex3VV
         ffFj386JJGNmIca/E2DEqXQaYSOEyiZON+Tm5A20R3boyFualp1JVgL7TYaXnqIH32v5
         pLLDRArp/4QcG7sVEXpBOZuBCbMgqpYtRDQ4Da6N8p11TewdMu8gDtCgqOhakCnU98KW
         n1k4AWOUgckMWtX1VsNgnt0ex5bvzEUBN23uLELEJaFQg5OstJ+xz79/6dyV/acYIF5z
         jxHA==
X-Forwarded-Encrypted: i=1; AFNElJ+FTahfwv1FgMhiSUgKGqvOGuuBdoXecXyjtTtyxN+N/CSEkV4c4FKqcj2Rsw4/c1e4/DCymJuTQjY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuWLx1gm4GcKLTQE8Z5Y4iHAoWHYPOH0VSiJMMOeRdR/NOnuPn
	i8yr81bL3V0a8vzWPaPsbeitxIIQ71F5SQv9bME2KLSNis6gjFGdrortK8+IyZeL4pGxuykCpAL
	tuDzkQg==
X-Gm-Gg: AfdE7cntMankSkFlv9Hq3XFPkcUI9q42NEiRlgJx1kO5Ib4U7yrWloRV9bm5n8Aiduo
	9y8a7P8oR/xm6hsemqaJhSWqVoKI7Sbianh9KNARb5HxzKW3Y/nvibfOQ/WbhxdTHFl2of6ALS8
	6cvAAUE6Qy4qrtjH3jjHrtf++5SB8KEKwUYfnAl3hbupsX2LUtfbQ3A537QNmvGjSKybI/sK6HF
	RF+4ISOv/c4awo6rE9CUk5TxQOO/dDTgKNb9uC3AtT/r5+YwKwvx3c5GbhND5cInOLLTByVEwsF
	TFyGVLWuGEqQSn4G2sIB02QLwkKrKrVoj3hCcMpWYkZzIPrxCtFnYN2n/mWlpYeeHnXX7vxs/0j
	pSQ0ApKKxXT/ZTWX+9Q6FQQ55sybXXeEJv7pXoiLYNRNM06NqvgsgV9/D6tC/Oq91XX102skioA
	8ORo2lNJxwUQzfYYn273UyNZeWS7YSEd2vZevKmomZVhvfYuqrPUfMvBMLgdFlb6InPtUnSoM78
	60b
X-Received: by 2002:a05:600c:3b10:b0:490:44eb:c1dd with SMTP id 5b1f17b1804b1-4924257c817mr27767985e9.29.1781861354229;
        Fri, 19 Jun 2026 02:29:14 -0700 (PDT)
Message-ID: <3525bfca-bdfc-45b7-b27a-62639bcd0749@suse.com>
Date: Fri, 19 Jun 2026 11:29:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/15] pci: Introduce parse_pci_sbdf{_seg}()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Teddy Astie <teddy.astie@vates.tech>
References: <cover.1781790171.git.teddy.astie@vates.tech>
 <1781794550.8631fc262581453bbf619ec5b2062170.19edb3b3411000701b@vates.tech>
 <b7e19be5-5326-475d-8c58-68673ea159f6@suse.com>
 <ecb9c38e-6375-4f49-b413-631d583a7afc@citrix.com>
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
In-Reply-To: <ecb9c38e-6375-4f49-b413-631d583a7afc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1781861354-6685A0FA-44FC3F6F/0/0
X-purgate-type: clean
X-purgate-size: 1423
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,vates.tech:email,suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E72B6A4F4D

On 19.06.2026 11:17, Andrew Cooper wrote:
> On 19/06/2026 7:14 am, Jan Beulich wrote:
>> On 18.06.2026 16:50, Teddy Astie wrote:
>>> In many places, we're parsing a PCI string into individual
>>> parts (seg, bus, dev, fn) and then transform it into a pci_sbdf_t
>>> using PCI_SBDF macro. Rather than converting from parts to pci_sbdf_t
>>> and vice versa, introduce a new function that parses a PCI string
>>> into a pci_sbdf_t structure directly.
>>>
>>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> You introduce two functions without callers, hence two new violations of
>> Misra rule 2.1. I understand there will be callers by the end of the series,
>> but I think we want to remain Misra-unregressed at every patch boundary.
>> Even for rules which aren't marked as clean (and hence blocking) yet.
> 
> I'm going to firmly object to this request.
> 
> 2.1 is not checked and has no viable plan to be.

Okay, then we need to discuss this on, perhaps, the next committers' call.
Yes, the rule isn't among the clean ones. But it is among the ones checked
(because it is among the ones we accepted). As per the most recent staging
pipeline, at least in the -amd jobs it also doesn't have many remaining
violations.

Jan

> This patch series is nicely structured for easy review, and I'm not
> happy forcing it to be worse just to satisfy a check that is firmly off.
> 
> ~Andrew


