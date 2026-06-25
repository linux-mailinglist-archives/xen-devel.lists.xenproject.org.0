Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /ULwAVvDPGozrggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 07:57:47 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D56C2DE2
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jun 2026 07:57:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=DkkjSoYk;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1345248.1604160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcd4o-0000GE-CM; Thu, 25 Jun 2026 05:56:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1345248.1604160; Thu, 25 Jun 2026 05:56:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wcd4o-0000D7-5C; Thu, 25 Jun 2026 05:56:38 +0000
Received: by outflank-mailman (input) for mailman id 1345248;
 Thu, 25 Jun 2026 05:56:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wcd4m-0000D1-Kr
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 05:56:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wcd4j-004b7r-Jy
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2026 07:56:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc305-bab6-0a2a0a5309dd-0a2a4506c706-26
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 07:56:33 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3cc311-08de-0a2a45060019-d155802cd433-3
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jun 2026 07:56:33 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-49249072f03so10065435e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2026 22:56:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4926417f0c7sm44793225e9.14.2026.06.24.22.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 22:56:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1782366993; x=1782971793; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6oPpsWMV6uUB1sMYbM5+qpNnZgsoLiynBAJlgm9Lpik=;
        b=DkkjSoYk0s+COygHuKPr7YnW82IgYlSS9hf9vV80e9PgoeJRG+ZIyFKdD9wn36eSiL
         QFrIw2NUoll9zOc+tTLo9GTzsyBG7B7KPVQH9hyuDCAod5g95voqk1/ll0bEyOnSo2K5
         R78dyDViMTYk6kuPk4E5mlZxc7OvaeEyIOOsIpGpkqdGAm6TCkglRy/Q9LfACAFix0YW
         oJ1MlkfQKSOSqY3Nze4PJLGCLjPWV2Ud6232jvI49HD2Qb2SwZoL3+uDRqNpqZ+HyVqu
         1MYG4QYCyGlKQqHXOP1HKAAbSoE7SPYntTtywIEHIqXe+qcpLBOVfJqqD1WfDWm/vKiA
         7TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782366993; x=1782971793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oPpsWMV6uUB1sMYbM5+qpNnZgsoLiynBAJlgm9Lpik=;
        b=ewal5cyI1zijSj1DNAnnkwelXSYRB0fEZYvL6E7UfoxXrsQBRC2asSMiKrZwMjVYSr
         XKXA7Y8TRm7Nr0kYze6zUa1d8VSf+Vh0EhBVf/xiFZMUDnsQHTgfZUwT5teexJ4WZ/qm
         BPdjHZ+Ei4LVKmMKAoqO8Vp/tLAM/GiDq+NHopNcJWuXIbKUIt4USRaZ7SCSwNcILMvD
         MmGAMeHWLK7PG4uporWiZDtMWV0djRttbLZ0zu2VzM3CvrZg2EKaHIZRF5b0zkzhm/cq
         +DWNbG89lk5NhzbHEtSYEdu2N3tnInzbIOTcIdcDjVXvXTHf/WBdcGNzVEe8urvpsyxS
         P7gQ==
X-Forwarded-Encrypted: i=1; AFNElJ+dJaYsWdDFvHAFOYWpJL9ZgPS7X0Cq7pBrEz5fc34vbqQahc5vkkfAsdbBYeEWIx7EQbsZpjl+w0k=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwM0xa7YtLQJ/9JcDBzvFqlxzzce8OOz//ptEYRUAjj0UXARdYR
	DrmckWprv3i7pCHRPtel+7KY9prg+SBqO5/T8q8Kmqf4wKkuFW2C1kmvKpM+NO2pVw==
X-Gm-Gg: AfdE7cm7s3yXr86W0WOwLd5aWFje/yi+zu8O4+3t5zHa1fZ9bQvDVMf38t/Pp3R2lOQ
	0idUoE+ADwXJX+MCPHO0eBobcNf24oyW/D0HcWRhcRIKCBNepDYZf6FWqyMSsyBGSSIT+h7WUvu
	YPwTFdi/fFsroLooVKa2UyukXQgIYzmNCQJuj4UAOsWp10LvObDDzu6f7MoG+RTjdm6V5Ahc8zn
	LgbqXUhsVDJAPCWg06/+XjO+waEBb/T2IuB2SZNMkCgX5Jg+L/s1sE7+j4Ioz8auWmhNrB+GB7o
	eBFouwrC2TfLbBRV4SI4BsgRTjM/TQ+vai9W6IvBIOud0MFafyoF4oUnT22HxY41tfnmmpPdXTl
	/DoJ/U2k9fN9NCf/KzpYHLyP/iZlvdX55/75pgy7VjCVQHX+5EdrSVf+5VrsWKjhBwENZ2EVhv5
	4ZRZEVREM8GWesimdYy30uxLxYwbmMlPrgV11wd4cpDsJFjdTkgQMeFWjl+lv4hhEWNN1TEGogo
	Kuq
X-Received: by 2002:a05:600c:c4a5:b0:492:2e48:81e6 with SMTP id 5b1f17b1804b1-4926684a6b7mr11453825e9.4.1782366992788;
        Wed, 24 Jun 2026 22:56:32 -0700 (PDT)
Message-ID: <edae2a76-661e-4f61-ac6f-4cae80e89b88@suse.com>
Date: Thu, 25 Jun 2026 07:56:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6a3bce99e5494_767442bc3001679a440720@prd-scan-dashboard-0.mail>
 <ee48e27a-049f-43b9-87dd-c9188db26f30@suse.com>
 <eb5a3c83-c470-4c81-b64f-09eaef4131e9@amd.com>
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
In-Reply-To: <eb5a3c83-c470-4c81-b64f-09eaef4131e9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1782366993-C573868D-5CB49EDE/0/0
X-purgate-type: clean
X-purgate-size: 1935
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:jgross@suse.com,m:julien@xen.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F2D56C2DE2

On 24.06.2026 23:53, Jason Andryuk wrote:
> On 2026-06-24 09:04, Jan Beulich wrote:
>> On 24.06.2026 14:33, scan-admin@coverity.com wrote:
>>> ** CID 1695359:       Insecure data handling  (INTEGER_OVERFLOW)
>>> /tools/xenstored/domain.c: 601           in domain_tree_remove_sub()
>>>
>>>
>>> _____________________________________________________________________________________________
>>> *** CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
>>> /tools/xenstored/domain.c: 601             in domain_tree_remove_sub()
>>> 595     		node_changed = true;
>>> 596     	}
>>> 597
>>> 598     	for (i = 1; i < node->hdr.num_perms; i++) {
>>> 599     		if (node->perms[i].id != domain->domid)
>>> 600     			continue;
>>>>>>      CID 1695359:         Insecure data handling  (INTEGER_OVERFLOW)
>>>>>>      "8UL * (node->hdr.num_perms - i - 1U)", which might have underflowed, is passed to "memmove(node->perms + i, node->perms + i + 1, 8UL * (node->hdr.num_perms - i - 1U))". [Note: The source code implementation of the function has been overridden by a builtin model.]
>>> 601     		memmove(node->perms + i, node->perms + i + 1,
>>> 602     			sizeof(*node->perms) * (node->hdr.num_perms - i - 1));
>>
>> I'm struggling with this one: As i < node->hdr.num_perms, the last argument
>> passed to memmove() can be 0, but I can't see potential for underflow.
> 
> This gave me pause on my initial review.  On the final iteration,
> node->perms + i + 1 will point past the end of the allocation,

To be precise, it may point _at_ the end of the allocation (i.e. immediately
past the last element), and hence still not UB.

> but as 
> you say the size would be 0.  I originally considered suggesting a check 
> and then decided it was unnecessary because of the 0.

If Coverity's wording is to be trusted, such a check also wouldn't have
helped here because 0 still is "no underflow".

Jan

