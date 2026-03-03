Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CN7DKPoSp2mfdQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:57:30 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5B1F4349
	for <lists+xen-devel@lfdr.de>; Tue, 03 Mar 2026 17:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244981.1544325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxT3Z-0002Ls-28; Tue, 03 Mar 2026 16:57:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244981.1544325; Tue, 03 Mar 2026 16:57:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxT3Y-0002Iy-VZ; Tue, 03 Mar 2026 16:57:12 +0000
Received: by outflank-mailman (input) for mailman id 1244981;
 Tue, 03 Mar 2026 16:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yKVY=BD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxT3W-0002Is-SC
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2026 16:57:10 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 041fdbe4-1722-11f1-b164-2bf370ae4941;
 Tue, 03 Mar 2026 17:57:09 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439b790af67so1442721f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Mar 2026 08:57:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439c4489279sm2993564f8f.20.2026.03.03.08.57.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Mar 2026 08:57:08 -0800 (PST)
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
X-Inumbo-ID: 041fdbe4-1722-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772557028; x=1773161828; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xS72+haNYWCevDvohxWWznv7pyLrld8FU80bvDuP3UY=;
        b=cpwbe2R0nbSeH5TFdK0I2TqA/85llbju5UnIQYbhLuVqoMhf7Ml6SU59IA14ImDqyz
         FhyYA/+zvvGyiIYz66adL4mjr5MqIY/u6M5aXhfQewDuMQO8UwpJJ44xTICMeZ2jM9XC
         gabmD+PYcRUfCCy79G+Ys1xTQvC1p4eYzUVcoRdXxvWTXkX1/FU4cI5QwgYQQTlaz0ym
         4dsmkISk1KQjatq73KSYOrrUdXJfyx+pa+V++gPV2ME5s4cFKO2hc5pjl0ZNZtdduaWR
         qaWJL+oxBuRAtxaNSrHfd5Y6ArlnMpNr66D+bqoX2jNqX86O+jlAbEc89ybx6vNF8YjR
         ky+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557028; x=1773161828;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xS72+haNYWCevDvohxWWznv7pyLrld8FU80bvDuP3UY=;
        b=wfV6RI8GndZ9FctSHgH19XusCVJYh8odIiODqmWLWLPRPPw35Xsti+MTvEV/fSN5I+
         fUDBz+lvzej9ERaeoBGZRVrMLyTJxgqwMLPcTlRmBamdbbwVmLqysqtMwuBk+ebfdMJA
         Pb8SrTDTt9lU+2rBQomlTfEGVzldz74XrHwNMuDmwQRkolO4yOVY8MqTchbXKMPHGSkQ
         zojW0eTz04H3Ym5WuZJNqtM2tXP2UFeOAn4tm+VtKwy1Ki4w1Nz6ZzcQJrAvuUGFSC0l
         QqPgeChNgjr2hqhtZCibPSdYa9sIfy5cYdIaS/5tUhxgA3lvdeawxchg9wfz5aYrJot7
         8mWA==
X-Forwarded-Encrypted: i=1; AJvYcCWQAWhLGXl9R5P5ozifuXRfv58yRXMLtlYMTVgX6ooZM6Z3JM1k747kum0sQmF0ncN1aLBOSB9JcfI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwOesPmfLcU1ItzYGLW2IiQIhriMklX/F82V9fQQG89jjpWIcpJ
	gncLiNdlsxkoU5jG9KY5iM15SJjFbmra1q9DNzguzVyQk6Tn4hZZmkIgLpbZguXYKg==
X-Gm-Gg: ATEYQzyrU8UZV0GdARh4mSmtIHvF9Ysb1biu8mrWCAFezA/4TaAh/NFJFvmdSUJcTDi
	LvfhtaSJMXoXn/RtJE5CTKQh6FH5CdtJrLwev2G5L1DuZRSt5v/pFmaSlkN14YRdyAk2ZDd3K3f
	slQ+pDqLG0MNe19wWFXGMvyim0U/dtmHe7p3R09w6QWtfY0mSpWHu65C8VI9GDWg/D0jghMLUhW
	9tZUPUKmdYzORi5zR2wNB+03+kTOz555HOueR3V4udiQZYw1sld3XP/B8lBUW1nBd/Fh+pE//oN
	yWUatslXe2v4gFbL9fziXZzJLioNsIu2vYOFsVsOTgcg+X1oikt9Tlq2xuMCV6GaHxyfVX8BWaH
	z1VtFX824p8dSqAS/YjZfkmVlq1jW0R4fXTyUOzHz53uEpkGMmgwujbb0V1KokR7xf+QuyB9YA6
	qJN1aSEsMn6S5yenXT2wwKRdQeScgw6v/Y67QRDDNV9hHGJ1wdvhjeDEIeWaQYPT90cBUaUbuuC
	rQ58Msq3g+kLSI=
X-Received: by 2002:adf:e788:0:b0:439:b775:fca2 with SMTP id ffacd0b85a97d-439c10dfa1amr4629127f8f.24.1772557028366;
        Tue, 03 Mar 2026 08:57:08 -0800 (PST)
Message-ID: <79729d02-65ae-4eeb-a66b-e05cdcfe9166@suse.com>
Date: Tue, 3 Mar 2026 17:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] x86/ioreq: Extend ioreq server to support multiple
 ioreq pages
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260223093831.475769-1-julian.vetter@vates.tech>
 <20260223093831.475769-2-julian.vetter@vates.tech>
 <c9126823-7c90-40bb-9fd1-c5649ffdb5cd@suse.com>
 <151c64e9-a605-410a-b3b0-2c86cdf6fd2c@vates.tech>
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
In-Reply-To: <151c64e9-a605-410a-b3b0-2c86cdf6fd2c@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 19E5B1F4349
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 03.03.2026 17:48, Julian Vetter wrote:
> On 2/26/26 16:54, Jan Beulich wrote:
>> On 23.02.2026 10:38, Julian Vetter wrote:
>>> A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
>>> slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
>>> the ioreq server to use xvzalloc_array() for allocating a contiguous
>>> virtual array of ioreq_t slots sized to d->max_vcpus, backed by
>>> potentially non-contiguous physical pages.
>>>
>>> For the GFN-mapped path (x86), page and writable type references are
>>> obtained directly via check_get_page_from_gfn() and get_page_type() for
>>> each GFN. The pages are then combined into a single contiguous VA using
>>> vmap(). The number of ioreq pages is computed at runtime via
>>> nr_ioreq_pages(d) = DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE), so
>>> small VMs only allocate one page. All existing single-page paths
>>> (bufioreq, legacy clients) remain unchanged.
>>>
>>> Mark the now-unused shared_iopage_t in the public header as deprecated.
>>
>> For this I think we need to settle on one of two options: Either it was a
>> mistake that this was used in the hypervisor (and added to the public
>> interface), in which case the removal of the use may want to be separate
>> (without, imo, any need to mark the item deprecated in the public header,
>> as the property remains). Or we deem it legitimate / useful, in which case
>> you would want to continue using it (in struct ioreq_server).
> 
> Thank you Jan for you feedback! It's very appreciated! You're right. But 
> I'm wondering how would dropping the struct work? I looked into QEMU and 
> varstored, and they both use this struct at the moment. But 
> modifications to both of them would be minimal if we decide to drop the 
> struct. And if they want to support multiple ioreq pages we would need 
> to modify this struct anyway to not contain a single struct ioreq, but a 
> pointer or [].

There may be a misunderstanding here: I said "drop the use" (in the hypervisor,
that is), not "drop the struct". There's also no strong need for a pointer or
[], as it looks: It being [1] right now is, aiui, a poor man's flexible array.
For one, for general use the public headers need to be C89 compatible, i.e. no
flexibly arrays unconditionally. While we do have some conditional uses (see
XEN_FLEX_ARRAY_DIM), that may not be usable here, as the array is the sole
field of the struct.

Jan

