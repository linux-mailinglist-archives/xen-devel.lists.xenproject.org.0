Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IxTNYk+/GnfNQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:26:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 401624E406E
	for <lists+xen-devel@lfdr.de>; Thu, 07 May 2026 09:26:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1302184.1576163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKt6v-0007n8-Bz; Thu, 07 May 2026 07:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1302184.1576163; Thu, 07 May 2026 07:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKt6v-0007kM-88; Thu, 07 May 2026 07:25:29 +0000
Received: by outflank-mailman (input) for mailman id 1302184;
 Thu, 07 May 2026 07:25:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wKt6t-0007kE-7H
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 07:25:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKt6s-00C5hR-1r
 for xen-devel@lists.xenproject.org; Thu, 07 May 2026 09:25:26 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc3e63-2eae-0a2a0a5409dd-0a2a4507c6dc-14
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:25:25 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69fc3e65-229c-0a2a45070019-d155dd2ba9e6-3
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 09:25:25 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43d75312379so1110829f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 May 2026 00:25:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538b6e9bsm180170415e9.10.2026.05.07.00.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2026 00:25:24 -0700 (PDT)
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
        d=suse.com; s=google; t=1778138725; x=1778743525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XxOj/PNWVogKIWj0rp4Nkf0us5db/70YadxrR6nFcd0=;
        b=Yhwt6hRzRaKJdEN4CVnMt2Lpw6TAFC78DuSzTO4fQSaiVc0iVRWzfgGIqreysmyJvn
         9/EKV5Cr+v2w7WGuEoZa6n2cpt9H61CTzL95fVWWEr/LVgPzbif3z3QoUZzHBFgZK3ZZ
         ld146efHKs9BqjAQAsSG3Wb7cxJ0Yw72KEQjbvMGa197bJrjgGk8Cw7j/VRiRvy4plzr
         4JAsBioSuzxBDbFg6aDEM9nTKWnrLNOPHf4yepmRktodBmWUbFA5gTJUdQE9DzAH426D
         QHMsEeFu4K81Mh+QcJd2fQomB8B1/DuMHJh3oe4srSHCUmqL6yFSQvB9JArQ++Nd9A+Y
         wbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778138725; x=1778743525;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XxOj/PNWVogKIWj0rp4Nkf0us5db/70YadxrR6nFcd0=;
        b=qO8JtqcOvFSgoEE70HJAwF+iXbtx99gZSVkV7wb0JdY1ayc27u+F4wUpxsQQPRMI3V
         Oo+ALLVqLiAN0HFuA0x8czWOQ3d1JNCRpcXjE3UkyQP3hL1CIpmWrOMZ9WqMcIIRuiBh
         XN+kJbVLdDkezu110yFD8ljOoBrCULi1rOg/vbgaAg+KyBrjUPRT3/GDfd69mWT8ApAX
         mUm+H0ezKoJ/SAUOgE29Ur5NHwtpaJZmLrO1htIclvF9SoYmyCOYEV1X/WGqZeDpex61
         7c/1HSbtvJKNKqP7oqZ32pOFHTdqucCsWtCJwpa3aDo/2nl8r6njIjGEkeJRuq8Loxib
         Qwwg==
X-Forwarded-Encrypted: i=1; AFNElJ8QUig+mschjoPPvH1giaciB8maQtVeNZwZYJMoa55+GMXQEacPMf54yEjpctg+dj79KCFT6wPCRX4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxedbQDSY6tBqqaKJwWpeCFDj4F1r/5gktQd5X09s1kFR4A2mhy
	9RW+aEgQBGvnuH1I4yTU+kzGBMSQbU4PETCylzCpF81urIHpjMH+Pz2+gp9Xyo3xDA==
X-Gm-Gg: AeBDieugJd8Q2zdu7yQ0UkGLLHIRENkeV/1oZ8uCdg0rvnzBHiRZoojOrdTsEKBR8+U
	NWtlufUn0zakqDgTIURw4j3sD2RBJ1w2fdhvOVJ3LyhsnI3RbzEZFsfleJSwffhlqkI1W8egMSg
	hmyDumkN8DZXxjq0VdRIzSDGAE/WCahDtGuXvWqjoJXQNeFPtada0c/GozTkFFIzLfB585cWhXJ
	VtE6bbuZIhFhi6GsNikkIuLbHxwUcciN+YmubNzvIhMEooCRsFf3TwuGLijQxCMDK9zJ4BBQfxc
	aMyczZGHvybOH7rjjHBe+vnF3MAcWOp/OaEc+r7S2BqfsC2dAhCX/1yKwbyp1kef46c4e0r7zS7
	hwehMzVE4I3eokKMJv5OgXNIUiVvPvjdqS4q6S8A+PwZVMmLjlhm5vsNg8l1uP9xPDDNqNaqr0J
	AX0KAzF1KGjS6e/Op4AG9EkwVugxNrtYAtMKMp14GWoNoU4eVEMWGKxVYyo82Dkbau5s9/yGuin
	C+/GYEI6oTwjT9G0q1dMB1dn+ORPOjUTrca
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr25386825e9.2.1778138725123;
        Thu, 07 May 2026 00:25:25 -0700 (PDT)
Message-ID: <b0b02d0c-ff4c-45e8-9928-d0a52e081b3b@suse.com>
Date: Thu, 7 May 2026 09:25:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] xen: introduce domain-layout.h with common
 domain_use_host_layout()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1777303844.git.oleksii.kurochko@gmail.com>
 <2577e757d32f85fb8b3308863e6d7a53d70636dc.1777303844.git.oleksii.kurochko@gmail.com>
 <80f67b9a-2b42-409f-90d8-587a07d57d26@suse.com>
 <764aac8e-b200-410e-99a2-cab65a274ef4@gmail.com>
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
In-Reply-To: <764aac8e-b200-410e-99a2-cab65a274ef4@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1778138725-2176AC48-F8C6D1BC/0/0
X-purgate-type: clean
X-purgate-size: 1253
X-Rspamd-Queue-Id: 401624E406E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 06.05.2026 17:47, Oleksii Kurochko wrote:
> On 5/4/26 2:59 PM, Jan Beulich wrote:
>> On 28.04.2026 16:33, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/include/xen/domain-layout.h
>>> @@ -0,0 +1,27 @@
>>> +#ifndef __XEN_DOMAIN_LAYOUT_H__
>>> +#define __XEN_DOMAIN_LAYOUT_H__
>>> +
>>> +#include <xen/domain.h>
>>
>> This isn't really needed. It is ...
>>
>>> +#include <xen/paging.h>
>>> +#include <xen/sched.h>
>>
>> ... included by this one anyway (pretty much unavoidably right now, I
>> guess).
> 
> Then it will be needed to re-order them.
> 
> Do you want to put the comment above xen/sched.h:
> 
> /*
>   * Ensure xen/sched.h is included before xen/paging.h, since paging.h 
> depends
>   * on xen/domain.h, which is pulled in via sched.h.
>   */
> #include <xen/sched.h>
> #include <xen/paging.h>
> 
> or just add this to commit message instead?

No. xen/paging.h only includes two asm/*.h, so doesn't itself require anything.
If there's anything missing for that header to be included first, I would assume
it's then RISC-V's asm/paging.h or asm/p2m.h which lack a necessary #include?
Yet without you indicating what exactly the missing piece is, this is somewhat
guesswork on my part.

Jan

