Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S8z/JvbDH2qMpgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:04:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0992963480B
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 08:04:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b="fIm/QFTe";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325648.1590953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeiM-000559-50; Wed, 03 Jun 2026 06:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325648.1590953; Wed, 03 Jun 2026 06:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUeiM-00052w-24; Wed, 03 Jun 2026 06:04:30 +0000
Received: by outflank-mailman (input) for mailman id 1325648;
 Wed, 03 Jun 2026 06:04:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUeiK-00052q-8Z
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 06:04:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUeiJ-002Mfl-B9
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 08:04:27 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc3ea-5cb7-0a2a0a5109dd-0a2a45059032-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:04:27 +0200
Received: from [209.85.128.47] (helo=mail-wm1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fc3ea-aaa8-0a2a45050019-d155802fc164-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 08:04:27 +0200
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-490b2b037d2so12399415e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 23:04:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b61511c4sm37512675e9.1.2026.06.02.23.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2026 23:04:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1780466666; x=1781071466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JHKhXozwo0mKoQhB/RcEV4XI7F6rZNMOUWRh2vEVFrA=;
        b=fIm/QFTenrKSbVk1nNXhxB6rUVnFnHX91G6M7OTfwZ3KQM3U8sCDVya8pCGFLx9/BY
         Vwi1/aCnrmcIqk5J+uc1f56pPGcMSjatSIgoi//lgmKqiab1ul/pDUMA9kboT+aTSygP
         b6FEma4jFEG5x4uXsamDOBCaqx7pbH+Bk63adu9IzMFmwPV1XrEFfDzxglUlXMZMCUCX
         z3a7bcDVN7z1lHs+6twB4JfhNxOPO7EA6AWYKwLsxzwxBS80fZe9PRqoECz462x8CiU+
         7b2Qu/FXw0uSkmfziV7GXtJOOPmr7iTnCzXVQsxiBfcUPqn5/xPVmTzauqm6ATq35oYJ
         coUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780466666; x=1781071466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHKhXozwo0mKoQhB/RcEV4XI7F6rZNMOUWRh2vEVFrA=;
        b=QY0XFosW3vrBQJz4COvJaBzq9V9mekqoyRLGE4cJMQJR6DxCgXZ4J9p9C9HKA2jrzl
         /te3NSg+Ne/gtHiYoRuUdPh9Vl0pS/KI3BUN//N70wrK73X2EoK9PFvoxB/BJBwiFBJc
         /wAh4/5iGXVnB4gZ5+O+OmHf9Glhn79cbhTvUiBs+puWdg3Iym9BkNG3in2Ys5ghKaMe
         L+6uJaAFhBtW9joV7bjbshqPL/HbtSCg3x5BYqvq82v4YiZBCOhD8oJP1Lv45Mm8B9Au
         Atwo8ZHMleOqOwH0HRqXczPRUmtUrSFbCQO9LDCSaSaBATrjBX5J+xJM6hacvnOfa//9
         hZpA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZJs/XeltzDRhZs4fHVmrhS5g7Nv3IKxMAyW3IcV7utcv/wQ0ZI2wyVngO/nNT2bHVOLcQKtzxVrQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIifQZpY/d8+jO+k2+H5KPEZsdi2N0hYzzIxmmJHjI1lav2o6h
	vE4Q6pw0HrlvuZ02d35F4RB3CLhr2nNHobAOxsW/RNgiwvTA0Qwp19U0EKFGkoXjQg==
X-Gm-Gg: Acq92OFZGnuuhsyReQY0hz6tq6U9B8yXH+LA2iGuJcVQZI5rjKf0FANKsSNSjTk2vBT
	yNt7r7fyXOuy33g4MdPwxbwvHnr+nmZq1ibrzSNpEUuWYr/ClSZt+mXJKJgx3SG3o9Vglck+gBY
	laRT09gcysxAmjvsE9uCg31StoLW7IQ7I5y+oPtweUAKjwBoFvogdet21tPKeLG8eaVg2O4bYOz
	UOlNLyMU7PhzrjmokbDUZGcFL/5oYBe2YgfAmYRpqfN08/hn80zKXIrsOfs7gQHtzdY3yAcy4f4
	et7j3Q+/VvdLAzkz6UhgOTph2lXbvzA3BM4L/CkVzZYVJ1rC0DYxL6aOM7qXKe5zlRCnvQdLNIV
	7Vqr69rwahr34T4yF5m9LAUdDWfnAcDieqYIOA+5Cpd/KRDYCLR8Z05HjIARwr804ootOeTiQZy
	fk8yDmUTXDUjhTsm3D8BQGlPygL/4EVbjBnq8zC3KmgmHFK1mewjuSpkylpZylnOKen8p0g06WP
	fB9YsB6X351ywHzAmgO9a2AMw==
X-Received: by 2002:a05:600c:1d86:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-490b5fe95ebmr28190305e9.19.1780466666634;
        Tue, 02 Jun 2026 23:04:26 -0700 (PDT)
Message-ID: <b443469b-01fe-4196-a79f-811bfb6e17d8@suse.com>
Date: Wed, 3 Jun 2026 08:04:25 +0200
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
 <62abdafd-a49c-46e0-b529-0646a8d2425a@suse.com>
 <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2606021840110.550703@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1780466667-E1D9D443-A84DA9D7/0/0
X-purgate-type: clean
X-purgate-size: 3499
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:stewart.hildebrand@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:from_mime,suse.com:dkim];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0992963480B

On 03.06.2026 03:41, Stefano Stabellini wrote:
> On Tue, 2 Jun 2026, Jan Beulich wrote:
>> On 27.05.2026 00:12, Stefano Stabellini wrote:
>>> On Fri, 22 May 2026, Jan Beulich wrote:
>>>> (extending Cc list)
>>>>
>>>> On 22.05.2026 08:13, Dmytro Prokopchuk1 wrote:
>>>>> --- a/xen/drivers/vpci/header.c
>>>>> +++ b/xen/drivers/vpci/header.c
>>>>> @@ -586,7 +586,7 @@ static void cf_check bar_write(
>>>>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>>>>>              gprintk(XENLOG_WARNING,
>>>>>                      "%pp: ignored BAR %zu write while mapped\n",
>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>          return;
>>>>>      }
>>>>>  
>>>>> @@ -647,7 +647,7 @@ static void cf_check guest_mem_bar_write(const struct pci_dev *pdev,
>>>>>          if ( guest_addr != bar->guest_addr )
>>>>>              gprintk(XENLOG_WARNING,
>>>>>                      "%pp: ignored guest BAR %zu write while mapped\n",
>>>>> -                    &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
>>>>> +                    &pdev->sbdf, bar - pdev->vpci->header.bars + (hi ? 1 : 0));
>>>>>          return;
>>>>>      }
>>>>>      bar->guest_addr = guest_addr;
>>>>
>>>> Well. If I'm not mistaken we had discussed situations like this (long ago).
>>>> Imo the added verbosity gets in the way of readability. If we absolutely
>>>> cannot or don't want to deviate such constructs (of which I expect we have
>>>> more), then we ought to consider alternatives (like changing the variables'
>>>> types in the case here).
>>>>
>>>> As to deviating: rules.rst, according to my reading, says that &, |, ^, or
>>>> shifts would be okay to use with a bool operand. What's wrong with also
>>>> permitting this for other operators?
>>>
>>> In my opinion, if we are going to treat bool as its own type, it makes
>>> sense not to silently mix bools into arithmetic with int types. I also
>>> do not find this patch less readable -- I actually find it more
>>> readable, since it makes it more obvious that hi is a bool.
>>
>> Well, okay, we have different opinions there. This reply of yours applies
>> to the first paragraph of my earlier reply though, despite its placement.
>> What about the aspect mentioned in the second paragraph?
> 
> You mean "then we ought to consider alternatives (like changing the
> variables' types in the case here)" ?

That's another option, but not what I meant. I simply don't understand why
some operators are okay to use with booleans while others aren't. Adding
(for example) booleans can be quite helpful. Take this example from gas
sources as example:

      if (overlap.bitfield.imm8
	  + overlap.bitfield.imm8s
	  + overlap.bitfield.imm16
	  + overlap.bitfield.imm32
	  + overlap.bitfield.imm32s
	  + overlap.bitfield.imm64 != 1)

And then see how the added verbosity would hamper readability:

      if ((overlap.bitfield.imm8 ? 1 : 0)
	  + (overlap.bitfield.imm8s ? 1 : 0)
	  + (overlap.bitfield.imm16 ? 1 : 0)
	  + (overlap.bitfield.imm32 ? 1 : 0)
	  + (overlap.bitfield.imm32s ? 1 : 0)
	  + (overlap.bitfield.imm64 ? 1 : 0) != 1)

> Other alternatives could be OK, but also this patch as-is is OK to me.

I'm not going to veto it (not being a maintainer of the code I really
can't), but as per above the transformation imo is setting a bad example.

Jan

