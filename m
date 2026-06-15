Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id f4MMMEyiL2ooDwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 08:57:16 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AE8683F8F
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2026 08:57:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=f7RATeBX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338010.1599037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1Fp-0002HY-Sq; Mon, 15 Jun 2026 06:57:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338010.1599037; Mon, 15 Jun 2026 06:57:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZ1Fp-0002FG-Pu; Mon, 15 Jun 2026 06:57:05 +0000
Received: by outflank-mailman (input) for mailman id 1338010;
 Mon, 15 Jun 2026 06:57:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZ1Fp-0002FA-9Z
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 06:57:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZ1Fo-000iF5-LH
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2026 08:57:04 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa233-5cb7-0a2a0a5109dd-0a2a4501e71a-20
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:57:04 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a2fa240-c1f2-0a2a45010019-d1558029c0e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2026 08:57:04 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-490c1915793so25857195e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2026 23:57:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea4a128csm316467785e9.0.2026.06.14.23.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 23:57:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1781506624; x=1782111424; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lRMPquG8sI7O8264Y7stKa/vThWcl/lWu+nInSfPIGI=;
        b=f7RATeBXELwNR69nUPs50thoy6fi62KPXyp8ooLg7Nkq/QCPphkLFWQdB1hHsA3pgs
         BDwuioCOdL1PvBIZ+10XZHNpvk+1XuUOBSYHZqmQ7cJ5VUbuP8kVII7h9xDphtE4HG0S
         46sPENrsGr3DHBrJ2eih6f/7JQw9U6PyayenRqQt3SpXyBKfXFgdhyworKqmwg4SYOAP
         RFkilS1shIuIdPH3yml4q5eU5E2zlu+5wqv1S/tjKc5/ceCNqKRVVvWsumGMFNn6dpGP
         kpG6M/LP4vxKkG514nn6aDgu9Kw9uYCNLp2fLLzIkMXpG9BPpTDh+nf5/U7YjX96laYz
         Delg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506624; x=1782111424;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRMPquG8sI7O8264Y7stKa/vThWcl/lWu+nInSfPIGI=;
        b=H6tZidUB1STWyon9//wqj4Eyv6KFaBWgA2yln1meoDWdfagbgA8zxl0rPQ4hgYWJB2
         AVhb/gl166HqnA+9aaJBoE8Wxhm6hxy4vBRD5CsVHPPwKi+4uLwUKUd9QcbpeGmT1koC
         o3Enn1EchpiiXRWzYExlCyqj6mEYVWJb4qVGbt/7AzEE4jSwyqe41PSp9In4PkDDTM24
         fIvR43STRit+czI1HlA3sD4ja7JNgbUPPGygiFmvGmyL5Li6GGt4MtKnGNLvLEWuxeur
         J5IpKOq3hTseDjhaLxluNah3bmfQLoyUlfgMc/pHOZt6ENH+GRVpuecITw8OUz1laHaj
         3pDg==
X-Forwarded-Encrypted: i=1; AFNElJ+0fuLyvqXoMY1WEjt+uysKl6i58eAdavMHDwjTxDbC3T9uPsqMSR0Nw8Y+9dfaMLIoIkER9Q3zAo0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyk2J3n7+Z14GJMi8Xou+tZCGKMv4va2lLDkU4X+mTNbElCOnfi
	iWAjiY8ikWiThKP66jziQGS4U+CEvNMxLiKZABLw+EPo2rQtU0D5xs1mUl501KEPPw==
X-Gm-Gg: Acq92OHFfMGLePnEzY621RaNwCKvPS4EN7k4OSuD9XSJZO51fNhSFhj4pcwC1EP/xrE
	Cm9FZfNNwKoN4BvU4w+qP0/7O63W8/w7lI5NBWONBHMClpA83KdUoHZbKqnUCp5XhftF6gIFMmz
	2p1tcUm+rnlQcgSkpJP9cgn+Kh2VV91T4o5aHyAYQcnQyWQlDNcTfFwD8G55s5nicAwIeXLoNTm
	7wEFO+zNl7BIV15Ctq7gdOkiccY9+Fxno/GaTSYb8NwcIM+UNafsQUyEKyVnwXO8GAOg+t6IWGL
	fu3h75PkWwKCKNCKv9527k1jzt9KIddOiCQX6SeZbHLTXbS+W7g/5avW5j3IUpmGsPCgt+Gy7H9
	W1ro6eiIX7TnnZhtcaXEN5HmbYUjFffkJMZfng2qMhzbiEVsxPCqA583SyFfnKRKQ0414U4TDRa
	2RH0Cf5NsZ1yHJyywWpdhSjQeAjZ4DvFg8ic51pjdHVfzurUp8FWmgomlMagqCMjWLyZIl7gGvh
	Cv4xADJHo/HcLk=
X-Received: by 2002:a05:600c:4f83:b0:492:2c87:3d34 with SMTP id 5b1f17b1804b1-4922c874027mr10516065e9.15.1781506623872;
        Sun, 14 Jun 2026 23:57:03 -0700 (PDT)
Message-ID: <24399462-e83c-40fa-ae90-e66b09b1a461@suse.com>
Date: Mon, 15 Jun 2026 08:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] xen/sched: Link CPU topology to scheduler
To: Hirokazu Takahashi <taka@valinux.co.jp>
Cc: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20260610111320.133784-1-taka@valinux.co.jp>
 <20260610111320.133784-3-taka@valinux.co.jp>
 <4ad6cce2-c15d-4614-9d73-5ed1354047b8@suse.com>
 <OS9P286MB72224A75554691CDC5F82D0E82182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
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
In-Reply-To: <OS9P286MB72224A75554691CDC5F82D0E82182@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1781506624-AF555FF4-4765A661/0/0
X-purgate-type: clean
X-purgate-size: 912
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29AE8683F8F

On 12.06.2026 21:53, Hirokazu Takahashi wrote:
>> On 10.06.2026 13:13, Hirokazu Takahashi wrote:
>>> @@ -19,11 +23,17 @@ extern struct cpu_topology *cpu_topology;
>>>  void map_cpuid_to_node(unsigned int cpuid, struct dt_device_node
>> *cpu_node);
>>>  void dt_init_cpu_topology(void);
>>>
>>> +#define cpu_to_core(_cpu)   (cpu_topology[_cpu].phys_core_id)
>>> +#define cpu_to_socket(_cpu)   (cpu_topology[_cpu].phys_socket_id)
>>
>> Please can you avoid introducing new name space violations (identifiers
>> with leading underscores should name file scope entities); also again
>> below.
> 
> Ok, I will remove the leading underscores from the macro, which were
> originally defined in xen/arch/arm/include/asm/processor.h.
> Is it okay to leave the macro definitions in x86's 
> `xen/arch/x86/include/asm/processor.h` untouched?

If you have no other need to touch them - of course.

Jan

