Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TXVoIFuuMmpC3gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 16:25:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99269A831
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 16:25:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=KDVHQPVy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340481.1601495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZrBw-0007Ca-2O; Wed, 17 Jun 2026 14:24:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340481.1601495; Wed, 17 Jun 2026 14:24:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZrBv-00079o-Un; Wed, 17 Jun 2026 14:24:31 +0000
Received: by outflank-mailman (input) for mailman id 1340481;
 Wed, 17 Jun 2026 14:24:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZrBu-00079h-OP
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 14:24:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZrBu-0012nZ-58
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 16:24:30 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32ae1b-bab6-0a2a0a5309dd-0a2a450b954c-6
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 16:24:29 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a32ae1d-212f-0a2a450b0019-d155dd2bf174-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 16:24:29 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-4629d80fa08so801054f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 07:24:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa47d1csm167546525e9.4.2026.06.17.07.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jun 2026 07:24:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1781706269; x=1782311069; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B8wLy3y5QhhNcyz1R2i9igihr3FKAWhfij49aahI9co=;
        b=KDVHQPVyFsqfWjMSPGUXqhqrEAubkvD28IYZiO4vuU3Qj3IDju7BeOXidNnSsDj6Ei
         knjCK2trh+NsC3Ef9CbDyVPTZui1kNX2y4gFxSOQIWkyNNyq/tOvbZuQgbqb/3eyoXLz
         2VD0ACE+XnKLN4veHu2RbduQY80MyVzgKqKXtmNH8wr0Z19YgypAL+iCrwZKenFQQdJn
         hTJXut4bp5lt2kijOOPtNkHqUMP2YsFohdJZt8PH3pbR2iiO5sxY0EQZR2LsghOTGbb/
         va78Ygx/wES88E8DbfXCufYDzVaZIR8XxGAlLWFK14ooA52Kv0ESWd4DUEKydwGdTey2
         YB4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781706269; x=1782311069;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8wLy3y5QhhNcyz1R2i9igihr3FKAWhfij49aahI9co=;
        b=bmbwmsmUWIEV7W2He8ksihIa3T08jjVzjNfjy3wIJ/2P6+3hzm6rkl4369z/IlTvGu
         RBJuYtTINGETzyn6VH3Ud7mtcRDBbhZGAzYP2Ie9hXNfMnQS9zScoK0MzC9eKBC1SR2e
         5iDgajeydxnrvp4ffDIuIooD9NB9R30dU2SXPI2tn1DcM2zOZlXunBuUdjTGzeOw98kr
         5lZpu0rkaJJmb7CqdMIrHSs4KOps69zvU3h6mtCl7pXU4hu47AU5dwkrkdoSizyF7ixH
         8upZhgW0TXPIQ8tMDEZ0momNCrshiFFfFOuA3m7mIKswXPi4QG3Kkqetbfgs3bX5TgCx
         c9EQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rUM0Ix9U5Jmj6dvVrrvdSW51I/9QlDq2ekjFg0RdLq45zr7IMzUunsbCV3Brz1uO2oVHh06V69I0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwyDmRAQcIm6/7SygMiTRARaXFQgGE8ey4wBY6wyANu4FcsnnNx
	+0SGSPgLrx2g16NB70CfmKIkBqlIJjy+kzedVbw4oDDFhM1DuDsu8nbFxcRusfrvcw==
X-Gm-Gg: Acq92OElAKVDdw+0s4LkpccZMiQvOraBm8dsCIjVp9nrvq8j/NXHTz/Oab1APmBW3vy
	DWRABX8OWc/vvTfS2St9NSK/SNUhEz5ZfPwwvp4kn76Sn9v9L+8PptYOHOV0nlwpdxLUVEkOCUj
	90oA9AkO+6g1aPDK32z+GQJzE2TMF0wMxH/sy1PFTgFKCJ26KA1Wo602Rm62gx8S5ybEqA/a6rE
	J5YUKxnzfOXaRyC0ipLkU+quu987YtnkABlfjoN83wGSSNMVAWBlHFaF+6pd3u8r/Tpo7h18/sb
	XhmFKjfzjvhksUR8hKf8/KI3W5tdEN6AmpSK0ZdDN8nCxFolHOx/wsbhda+ff0Q9Da4D+QCyx91
	R4dP+HywKZbXTedCskoKv5GYuluFHnhgakO06pdAHoPtrO5guMrUfM/tEuJSg88kYtqf6fo16KG
	yAaGrb4sR/b1Fab/IBc3I6QN853rHzLIEoScy7Zv4nzeJXURK8T2xUi6Zc9tn/62Ct9yZuCByjQ
	sZw
X-Received: by 2002:a05:600c:a104:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-492333ab197mr61390535e9.13.1781706269245;
        Wed, 17 Jun 2026 07:24:29 -0700 (PDT)
Message-ID: <f561a2ad-83aa-4692-9e96-148e688c806b@suse.com>
Date: Wed, 17 Jun 2026 16:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <cover.1780494838.git.oleksii.kurochko@gmail.com>
 <7ed7b888e203b7cc6c3a3a82b3bcc89d90b3fb48.1780494838.git.oleksii.kurochko@gmail.com>
 <d63a3877-286a-43fe-97fa-301985c3a0ac@suse.com>
 <5ca82079-4f94-4f2c-87ea-0ba54236ff72@gmail.com>
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
In-Reply-To: <5ca82079-4f94-4f2c-87ea-0ba54236ff72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1781706269-20E7CF3B-FE6F09FC/0/0
X-purgate-type: clean
X-purgate-size: 2610
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DF99269A831

On 17.06.2026 16:02, Oleksii Kurochko wrote:
> On 6/17/26 3:26 PM, Jan Beulich wrote:
>> On 03.06.2026 16:25, Oleksii Kurochko wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -320,9 +320,9 @@ void vcpu_info_reset(struct vcpu *v)
>>>       struct domain *d = v->domain;
>>>   
>>>       v->vcpu_info_area.map =
>>> -        ((v->vcpu_id < XEN_LEGACY_MAX_VCPUS)
>>> -         ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>> -         : &dummy_vcpu_info);
>>> +        IS_ENABLED(CONFIG_HAS_SHARED_INFO) && v->vcpu_id < XEN_LEGACY_MAX_VCPUS
>>> +        ? (vcpu_info_t *)&shared_info(d, vcpu_info[v->vcpu_id])
>>> +        : &dummy_vcpu_info;
>>>   }
>>
>> While the change here is likely okay, it points at possible further omissions.
>> You've dealt with all uses of shared_info(), but you've left alone all uses of
>> vcpu_info() (and __vcpu_info()). Reads are presumably okay, but writes to
>> dummy_vcpu_info open a side channel for possible info leaks. Looking over uses
>> in common code, no code changes may be needed; extending the description may
>> be all that's wanted here.
> 
> Isn't there already a side channel that could allow leaks, even without 
> this change?

There are multiple aspects here. First, for PV secondary vCPU-s cannot be
launched when their vcpu-info still points at dummy_vcpu_info. HVM vCPU-s
make very limited use of vcpu-info fields. Writes look to be limited to
the evtchn_upcall_{mask,pending} fields, which isn't really an info leak.

My main point here is: None of this goes without making clear that the
necessary auditing was properly done.

> The change here just made it worsen because now info leak 
> will happen for all vCPUs when  CONFIG_HAS_SHARED_INFO=n.
> 
> I will add to the description the following:
> ```
> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
> dummy_vcpu_info, so writes through vcpu_info() could leak data between
> vCPUs.  Reviewing the write paths in common code: the write in
> map_guest_area() stores the constant ~0 so nothing serious will happen 
> if it will be leaked; the event_2l.c paths are unreachable because the 
> preceding shared_info() call would trap first; the write in 
> vcpu_info_populate() targets the new mapping buffer, not 
> dummy_vcpu_info; all remaining writes are x86 PV-specific for which 
> CONFIG_HAS_SHARED_INFO=y.  No code changes are needed.
> ```

As you start with "common code", how come the "x86 PV-specific" part is
still there (i.e. relevant)? Isn't all PV stuff in x86-specific code?

Jan

