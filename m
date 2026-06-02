Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAbYI82WHmrPlAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:39:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D3F62AB44
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 10:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324569.1590093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKeo-0002zk-9Y; Tue, 02 Jun 2026 08:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324569.1590093; Tue, 02 Jun 2026 08:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUKeo-0002yG-65; Tue, 02 Jun 2026 08:39:30 +0000
Received: by outflank-mailman (input) for mailman id 1324569;
 Tue, 02 Jun 2026 08:39:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUKem-0002yA-QD
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 08:39:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUKem-00G9u8-6v
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 10:39:28 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1e96c0-2eae-0a2a0a5409dd-0a2a45058820-0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:39:28 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1e96bf-aaa8-0a2a45050019-d1558030a8ec-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 10:39:27 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-490686877a1so66099265e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 01:39:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b3530c43sm3235185e9.25.2026.06.02.01.39.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 01:39:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780389567; x=1780994367; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3UnrxXxuNwKcAqgGxARCtM/7ewsunIUDLATXdv+cMew=;
        b=WTHZlDDIJzWIXNBiWIqgR2HAZ4VNSqNO8ACKJYTqPdWwYcxJ2+EeW3/spNKCjyWvtP
         3WEh/0lvdPaMWeL3IANWrRrDDpSVHKeH7y0Ke+NQx8Mm15b403LCsGPi4bEzq9bR+ofn
         YveaHvGDzQrJcgGvvHB4854yoeRSxMc9N/Mn3H/rAmEJFMXKrStK08isluDppF+VdZLa
         K/lyKHqTqVpMQviMfJtXK7YpoZlyKv3AxQntGQs9XCv5iUb8Tiur+yWI0zSZ4HQ7JtmF
         VynLqgBLe6Zdzywrwk7C058WDZmsRbIbTP3n/mJe9yCCTVPwvpfOMsWZjHpMxaWItUME
         jiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389567; x=1780994367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UnrxXxuNwKcAqgGxARCtM/7ewsunIUDLATXdv+cMew=;
        b=drkiCVs60P81AD8T73tXxJPS2r7K4TWamnAowj9BC8J4170V9kG6Klqv+vCQyrzeat
         rtkWMCU7kntfmVvH23sFewyTMGroPrIZhHC7rG5xQmMFfRoA2i31nLuXfYlZlaItDcZI
         1C8zqBXqM5JkTuJBc7Zyejr6Pe1ZTsbMFusGrrJZy4eXxjIY93XuqW8z1fTc+70Ky7ho
         QO85oDdNisK81v5FCAPJplt9RQUrtrtRdzu7Ut7zdP2kXddjOoiGVN8zzvsOJeAr4caX
         9v8hVqLTAQj6+tOgdOhwvcCaVvkZ6NPVDl0AlrzZ05K87xs2jcv/oJCcQSJ1FXnvHT64
         90Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9CMN0dCXtbnry31obOUeIB62ft7qU5Jty++deVkoJQGZkK7rB90gS643/Qpo9yE1F8HDjPceD63OQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyereLXNANJyBx0sFuG63rlNwcfN1roQ7R0MDDV/bnSC6Dmdre8
	1k/p7tVYathnlyT6hQVBJde0qzTxUrZRa5Ntd86tABcyNHDqLmMwhJu/PkPmIDcLHQ==
X-Gm-Gg: Acq92OGct7TCEB/wAlIrdmq4/1nb5Z5rm3+ne/doA5/A6NCerGjmseUGrnqcfd8qvNo
	TE0rac4rvThyIWXmrai6ecAs6OJCymbjNJbZfyRT/jjMs+0bFBq9S+rugpo/CK4i1rdUYSOXZqr
	uxR+8QI+6j1pDlo4BtvVMI7v85mzpUUdFXJA7kM7upFPQ+imYu21zusx5Bg5AKeGWQwA+0btBo6
	W/ZG57YXpM+N5LbU7H+Gk8MxTUfiGQqHYfaONgqEMLDsoKeSYS3+vwtMGX5rHyE5mvuUUpoKfV0
	QbXqzt3ycqINpaayYBfLNZPGlqm7iSH9NiFf9G+68YaZ8A3B/dOlSwk9Nm4L/v7lGU/VH8Uyu7I
	lrjB2a2nOrYZhqpaloDtQCJL8TeLx0BfTwOjC9cuIwjDOaAamp2OcxdKESdBBOwBgsT9SjFkYPf
	doEzjK2Q64crXNz3D+hIHUb2ezrH5X93ryQANs1QcWSNq5xSuDhju9GGDCRZoOBK17JH5VzLMUy
	M6r9v8Cv6L6dYzyfAkpR8W02iQb7XoYIsAh
X-Received: by 2002:a05:600c:3b01:b0:490:b11e:e4be with SMTP id 5b1f17b1804b1-490b11eef57mr36617415e9.3.1780389567451;
        Tue, 02 Jun 2026 01:39:27 -0700 (PDT)
Message-ID: <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
Date: Tue, 2 Jun 2026 10:39:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vPCI: resolve MISRA R10.1 boolean arithmetic type
 violation
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e23266191a366abe66d8104783d97578aa8734a4.1779428826.git.dmytro_prokopchuk1@epam.com>
 <984c91b8-3d2c-4431-bdf1-4a333ac341d1@suse.com>
 <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2605261508390.182011@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780389568-E3788443-CD342EC1/0/0
X-purgate-type: clean
X-purgate-size: 2232
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 02D3F62AB44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.05.2026 00:12, Stefano Stabellini wrote:
> On Fri, 22 May 2026, Jan Beulich wrote:
>> (extending Cc list)
>>
>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>              gprintk(XENLOG_WARNING,
>>>                      "%pp: ignored BAR %zu write while mapped\n",
>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>          return;
>>>      }
>>>  
>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>>>          if ( guest_addr != bar->guest_addr )
>>>              gprintk(XENLOG_WARNING,
>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>          return;
>>>      }
>>>      bar->guest_addr = guest_addr;
>>
>> Well. If I'm not mistaken we had discussed situations like this (long ago).
>> Imo the added verbosity gets in the way of readability. If we absolutely
>> cannot or don't want to deviate such constructs (of which I expect we have
>> more), then we ought to consider alternatives (like changing the variables'
>> types in the case here).
>>
>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>> shifts would be okay to use with a bool operand. What's wrong with also
>> permitting this for other operators?
> 
> In my opinion, if we are going to treat bool as its own type, it makes
> sense not to silently mix bools into arithmetic with int types. I also
> do not find this patch less readable -- I actually find it more
> readable, since it makes it more obvious that hi is a bool.

Well, okay, we have different opinions there. This reply of yours applies
to the first paragraph of my earlier reply though, despite its placement.
What about the aspect mentioned in the second paragraph?

Jan

