Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7sUqJW1PR2q6VwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 07:58:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDAC6FEE26
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 07:58:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=del1suS9;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1352832.1609161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfWuQ-0001b1-3T; Fri, 03 Jul 2026 05:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352832.1609161; Fri, 03 Jul 2026 05:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfWuQ-0001ZG-08; Fri, 03 Jul 2026 05:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1352832;
 Fri, 03 Jul 2026 05:57:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfWuP-0001ZA-5x
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 05:57:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfWuO-00GO1b-Ij
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 07:57:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a474f4a-5cb7-0a2a0a5109dd-0a2a4509b3a2-34
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 07:57:52 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a474f60-97e6-0a2a45090019-d155dd2db488-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 07:57:52 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-476d8e647e9so165987f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 22:57:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477dd94ce4csm15725644f8f.17.2026.07.02.22.57.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
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
        d=suse.com; s=google; t=1783058272; x=1783663072; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Kx2Mq9CGUh/oNjMiYpEYd6BlsoDVRLUSWd/QFyojYHw=;
        b=del1suS9xsKQcofqpYrX0lMjWDS2KQM6FFVhJPo3I2c3C4FoSAq8LMMfgKy5TezMTf
         xQ6pM+ZIwqvu2tkLcxUTFPDenj/rZG3SJSmbs5m3UKJPtIpDtKob0tXXtNovGt6u3001
         jyFiN+Nc0Yhuvm2IqXYaWHIhd7SaEiz/Q9Mge0fQfOZyrlC4aj8Zqmd7bpiUUQB5JFKO
         WVAy+iw/HPpsUs94aP7yF8FhPDfbVDqPK/OKXNXUk4jsBPAiBl/RNm3Ba5EPg795w/MR
         ZGWTvNFv5Kx7CG5BSFoNpw/jCNlwasXncwVTafgiIxBBN2iwblfTWjHB/iKGpXL+JGU6
         bTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058272; x=1783663072;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kx2Mq9CGUh/oNjMiYpEYd6BlsoDVRLUSWd/QFyojYHw=;
        b=o4lcM2PFWwwWJEeIP07hsYiskzawQJDDUV91ATWod2i3ybGATZoA9Txp1UPXxpU4UF
         L4pqoqvmzx/kZuw79D8hVbC1wvg0o+3hjcbLmC1ojxlskp/wVz7zfsMsgTqlseBV+QHv
         kGYjXsuIWr143lrMQRB2/9Hrcc2zrQ6SkG1yk6uYUvpNPUuiggOt8h0HLqPhCUv6GvXe
         Lv7ys0RcPbx29v3wHKJnm/dYNgZXK562D8J3B8mdbkx2S1iEy6M08+JxBCNObQbMtVks
         C8+n5Lie06gzYqOxA5GZdjIBbbA0wuRRWFUH6R+DtRKNI8gCEJMQJ1eOHwVGgBuV++MO
         MYEw==
X-Forwarded-Encrypted: i=1; AHgh+Rqki7Ht0OrR5rZImQEERw21bYmVpO+kUBCo17xdpM2es29U3mcC51IKsb+FFVslggqbB+FUaj/B94w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzJy7YVARFIRX2tKhjI0ZJDT3WFpEAD90VKMMyHIyJSlFG8TzA6
	S1CEVVdjJ+zUmnMBTrPtJwo8HCSWclanx132gBT44QnD+XAJtJDXEoQeoc08z55T8Q==
X-Gm-Gg: AfdE7cn6sSQcJbHshf2tAUuUZ3lGckUPMt9lu/b0sv9LA9pji9RZOkrhq4eIymkd6QK
	IROC7MsAiu0BzgJ8hNqdjlkO3FZfF59sZbTVVIiqQun0IfpK+hYd4E2zORW9U9fIKxKNCXyw9Qv
	nN+mBDdC2h3Xbe9fhTck8z2IBgLNBFYoD3gQ3gwsNiHhi4Iu/okceglBTpaetZ1wfaB/78sAA+O
	QrPmAlpqmNn70tT5BVdJ/akQpdIZvZOQsXvempQzJkdp2tUnu9Icx+6dHPf5i3NLJwXdR73BGqP
	o/DAlc0ZEyK5wlbGjdipdRm0hwtPAtEMsGX4FuHNQmAJ8tgPFNGsZlflv0/nESxNC2mJrAFQcmI
	3VXaV8noywbjqwL/5jLzp9EquSnc+6kNLB8hRcE7oMI8MyCK+tl2+9p4sAU4SFGxX6p2qPaDkz0
	7WrzqZlSbripvXogMjE7nJTEoRmmgVCPexLa1PVNqI/epGSYVdOi43mV1MQyFhfxmERMRe0q0g3
	tR5
X-Received: by 2002:adf:e009:0:20b0:475:f0d1:eb6d with SMTP id ffacd0b85a97d-4775cf541b2mr10111727f8f.58.1783058271895;
        Thu, 02 Jul 2026 22:57:51 -0700 (PDT)
Message-ID: <9efb193c-8657-4046-b417-4cd7cdccd2eb@suse.com>
Date: Fri, 3 Jul 2026 07:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add myself as an Argo reviewer
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260604184413.788910-1-jason.andryuk@amd.com>
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
In-Reply-To: <20260604184413.788910-1-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783058272-4532F986-08FE423C/0/0
X-purgate-type: clean
X-purgate-size: 285
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,apertussolutions.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCDAC6FEE26

On 04.06.2026 20:44, Jason Andryuk wrote:
> I'd like to help with reviews of Argo.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

With reference to
https://lists.xen.org/archives/html/xen-devel/2026-07/msg00196.html
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

