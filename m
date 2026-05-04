Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJtxDB0x+GlBrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:39:41 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0C04B8950
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 07:39:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299467.1574002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm1k-0008Rd-98; Mon, 04 May 2026 05:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299467.1574002; Mon, 04 May 2026 05:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJm1k-0008Of-6G; Mon, 04 May 2026 05:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1299467;
 Mon, 04 May 2026 05:39:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wJm1i-0008OZ-Qk
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 05:39:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJm1i-008Z8S-6X
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 07:39:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f830ff-5cb7-0a2a0a5109dd-0a2a450ad1ea-12
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:39:30 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f83111-56b3-0a2a450a0019-d155802be025-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 07:39:29 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so59199975e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 03 May 2026 22:39:29 -0700 (PDT)
Received: from ?IPV6:2003:ca:b72b:870a:8d83:125f:d0c4:4383?
 (p200300cab72b870a8d83125fd0c44383.dip0.t-ipconnect.de.
 [2003:ca:b72b:870a:8d83:125f:d0c4:4383])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8fede418sm87724495e9.6.2026.05.03.22.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 May 2026 22:39:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1777873169; x=1778477969; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+drOKvTOt2K36rAMHWDvB1x2sJqP6GEdY2GVV39dNcQ=;
        b=BMIi10WwdBV6ZtqUBulUY+iX8NknGD9uWBqD4gycvhAzwgfxeMmGvOHBIaMExipjts
         6pz9pVujpGuqrZjNGkO66IFdbeuI2hTlwce6vCkKEWExebMXGD4q4wUXo5wXTQ8ytwv4
         XkwA/7UimEk47/EwloUfnoZU7/e3QjRtABqb6uYMwpTKLHXy2sLBZVd7+qSsNdKPmQ1X
         yf/5MFJFQk9DT+93ErKb6LvkGwpX/Z15qha2VVHeTF+3ftaQpIpq6vboUKLSnMWdDVcw
         d6WxOEZpJoJev8cxqRHqOrn4HAzLpCie/KSENvGfwyvK9SzCKLfAPoyV7Rni+UbftOnw
         /NSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873169; x=1778477969;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+drOKvTOt2K36rAMHWDvB1x2sJqP6GEdY2GVV39dNcQ=;
        b=X7DdkYiBWWIeS+KQVz9SlR9Gp9z8qWOenYw7dsRjEZv+JYvd1pWrErLcbqMP2URTqW
         tzGdGpb3S66oNCSurRbSd5CMfcag4Kaz/Xs2NA9ovN+mrmbAqIbSeg5oRTXILdW4PIhD
         vxWr+sKzuDfeSA721ZVNEeYr6WpylMB/FWHOHbZZ39XyHVk22Mg5bWLLIESWn1noDjOl
         1fASbQYo1/QyKOMx5KkMMr9wCqA9/SbLHHMRcABO0XFAp4LmzCcQZUYzCp0AU9iq00zc
         uFTk8ksOiwlX1KBXtK0iieAKta352gFnxsQMQJyf0swmWIckbNlDNT5F2E0dAlQLELny
         nMqA==
X-Forwarded-Encrypted: i=1; AFNElJ+MXyV6IN2gsK02EOzE9rJDQo68ZijfV2/CXsImLpfpbOvMY63vTIebOrVtDlIj4Jf5cRAcrR8R8X0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7IVUk35z/gAUHq6zMSW9By5M8V6Ki+mVWsYmo2ArJlI8lnlXh
	t6QPu4H4vnQH6yD1NrKLypcBcQhdSYySdYXMZwQMioHLB4Zt+xmitcN+hLjZwjwbxg==
X-Gm-Gg: AeBDietWwZSobhrCws2ZPw65Qxg+yJR2UqxPBjSTs9ddRdKgCX4NWgkz7UmA//vikby
	RMo5pa5d99S/2ptxKbkeZiHOfzrh/2DrQjgwJR53p3drB3qHopQa2IqcW6PrZHHpk6L7FZ4c3Og
	azXOJN+SP5EKmOY1phyvMbpq37uluUtM1PV2SvpG31pkqRyUJgCmOaqg1Mb47i3KgF1sfMHbquv
	ZM4SsvJhOqoA+fGySTUetWC7MddYi+RufPDkgygkxG0JmDQEAtYC176nV1eTnl/fJ2y2fhaa5EX
	zR370UFYtQMW+p9CalJHpQhnH7EOsWhgPhnzhg5AL9+IKPWtRgj31h9Sdj6PFqODjaNJPKYEU1/
	/0LrSXuntD7KFpNvzNVEpqVFsRKPAfTcCMBBFlgzAuHps8WYymstVLylfBL46ep0nsMFSL83lQN
	3oGUy2pOvP3fI71SIEBK7FC2u+UOOdQFy54wIUkB8A57s0DrIDgGP817wamBYCnijyWFjEO7U8F
	RVFvT48T2fuVPf2ngRsMmJIv3tkHeuvUEZeJqpAtL0vruU7hK+sXiYy0Ahp+BQNScObmtbyRrL4
	NnxTYQ==
X-Received: by 2002:a05:600c:6389:b0:48a:5501:7995 with SMTP id 5b1f17b1804b1-48a9865d1femr128330705e9.18.1777873169384;
        Sun, 03 May 2026 22:39:29 -0700 (PDT)
Message-ID: <6bad1f16-5b9f-4358-b4a2-6b5edafd0bb3@suse.com>
Date: Mon, 4 May 2026 07:39:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] xen/riscv: introduce p2m_gpa_bits
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1775836193.git.oleksii.kurochko@gmail.com>
 <87d8050f252fb76e241a40809763e60d9874e902.1775836193.git.oleksii.kurochko@gmail.com>
 <14ae97df-cb9b-4b43-bb39-6b9395ad918b@suse.com>
 <cde7a080-4501-4641-8848-2035e2370ab3@gmail.com>
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
In-Reply-To: <cde7a080-4501-4641-8848-2035e2370ab3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1777873169-4576D8B7-FED8BDD7/10/73395122804
X-purgate-type: spam
X-purgate-size: 1127
X-Rspamd-Queue-Id: 8D0C04B8950
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 23.04.2026 15:47, Oleksii Kurochko wrote:
> On 4/21/26 11:46 AM, Jan Beulich wrote:
>> On 10.04.2026 17:54, Oleksii Kurochko wrote:
>>> common/device-tree/domain-build.c uses p2m_gpa_bits to determine the
>>> upper bound of the GPA space when searching for unused regions, so it
>>> must be defined when CONFIG_DOMAIN_BUILD_HELPERS=y.
>>>
>>> The variable is initialised to PADDR_BITS and narrowed in p2m_init() to
>>> the GPA width of the selected G-stage mode, allowing an external entity
>>> (e.g. an IOMMU) to restrict it further if needed.
>>>
>>> p2m_gpa_bits is a global rather than a per-domain value, which is
>>> acceptable for now because all domains are required to use the same
>>> G-stage MMU mode, as dom0less common code allocates it per all
>>> domains.
>>>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> Pretty hesitantly:
> 
> Could you please clarify what specifically you don't like here?

As per earlier comments, this not being per-guest, and implications thereof.

Jan

>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks.
> 
> ~ Oleksii


