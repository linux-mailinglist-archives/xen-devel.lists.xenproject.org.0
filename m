Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKraIzcAxGlXvQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:33:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F6B3280D5
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2026 16:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1262647.1555080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QEA-0005uR-Hq; Wed, 25 Mar 2026 15:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1262647.1555080; Wed, 25 Mar 2026 15:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5QEA-0005so-EA; Wed, 25 Mar 2026 15:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1262647;
 Wed, 25 Mar 2026 15:33:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5QE9-0005sG-Es
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 15:33:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5QE8-00EwGl-Qx
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2026 16:33:00 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c4001a-2eae-0a2a0a5409dd-0a2a450bada4-40
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:33:00 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c4002c-ef63-0a2a450b0019-d155802de9f5-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 16:33:00 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-486fba7ce4cso25829465e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Mar 2026 08:33:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487166064fasm24974355e9.7.2026.03.25.08.32.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Mar 2026 08:32:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1774452780; x=1775057580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HLYlgYBKLFRnwkXnkX7u1E2r2oZ3laV5P0pZmrN32dU=;
        b=BI7xP61plQHprZDXm8L9FMuTv519zs1tycxQ1Ge4utQCaXBnhAx5QtZxYT1fqQOI/E
         3SYFgw4NBpNQ9dLD37NsGpS74l0C/sBAn3DADt5cskITzumLkQtGQqP8h6NdqeSqE3Hs
         iooMIGQGLQYPRFRNmA4eJB9JowZT84wSl5e87u/btCPSKvShFdOoBHpRaX34v1B/AC9v
         xeA17THESxoEgEAiOqlb+qhHmguo98k85S5PKI5FA1+Ys+xer4MJFTr9IN4pHEkLz09w
         GX1YRR3kvnzmYLOBF9P4PA46zg2MWShh7itBaEIdJYkE5WafuHqBk9vc7b7e3YpliljC
         DKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452780; x=1775057580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLYlgYBKLFRnwkXnkX7u1E2r2oZ3laV5P0pZmrN32dU=;
        b=bZIUWChtqIVmvLbl+02kW0PZ5UHgNsQPLm/BEXW7kaaOBfH7JmUKmghCq7ajx5PYp6
         xcPJ79JtGbR/jJDaLNbE6OeK7iVojmS/BnMhJVJSYMuhKgLPTZay8h5+8YbRim7ZBhXx
         JWRhX5AqdvnJCpkwagkCEzZFrMFf9GprnzzOJTUMvz5FswhAIsbLvSCJzOMyCsws1CXm
         +OqsDGG8QXC1NeHiBO6GkXE4+NVcjnbpZ6aBmMTsk5EkAzcZW6WowMW471IvrMylfW/8
         By58Q0NI6B3NrjQSCzitYIj6oIFNt65i2613ryowqV7COBPueVcCIScgIfDkPajqknqP
         jrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwKiiuIsRpUKLO9mcVv878kHaQAjNIRcWX6Ryqhnq4f3a3EZIuYzHklTWEg53riKb698K0/guPhdA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyB9kZyTbzMZKw3LNrp0+TTNrAWXM9FUpCDrqjdEIncwptmUfwq
	/IoqAWcxMfOgZARxvJHXDlz3fJEd/M0JAZStbgz5OaUvsetRc1sorVaAFTfuJs44Ig==
X-Gm-Gg: ATEYQzzGmjTUlLSv2XQMUKaNOieDAn/Uri2i8ctxVzYmD7p5BaYYI2Dxe0M++eOoh/F
	lNFwMdbLoGjQAEfCTe2NroBXMHxIES1iu05kduQm/oe/JglbAPpWy55rivilSZxKCsqo6GTuYB8
	JRhUm77w75oBjYDpaFnvDa7bfNYk4H2JT8VCZ3msqO0sONQM44AHV3ZaL1sdC6QVcpR8SMyghNt
	YOWdcUoEURJMITXKdgsCOlJvXx+Ply339aRN1xCg12tGIv5B3oWEIKd2L+IkCOJcCUwcD+qN7rs
	aXpQuFyiOewvf8sTqRokh2t7MCOMjHXxP+3MJfwAGXdzDX+rkKIeJ6cUhZ8zMfH0pzSvYI7e2kS
	3lhr1uAncHXBP4C5BFaul3sNLLG7liu0uqPHhK2s9TvWQtY1u4XDZcd7GGQ6FwALLul4yobErcs
	5VHLbIbMhRaG8f1mqsyWkjTqM6iwvg2fCq9dfMFU3Z+u7hMTVHUUfVqdr5BTy5NE9Uz9DvidKZv
	p68Gg1RlPcOjI0NGjy6T8+AOQ==
X-Received: by 2002:a05:600c:154a:b0:485:3b00:f939 with SMTP id 5b1f17b1804b1-48715fd617dmr65148585e9.8.1774452779573;
        Wed, 25 Mar 2026 08:32:59 -0700 (PDT)
Message-ID: <48fb6a91-6515-4526-a46b-712325221a87@suse.com>
Date: Wed, 25 Mar 2026 16:32:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/efi: Add BGRT image preservation
 infrastructure
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, sarkarsoumyajyoti23@gmail.com,
 xen-devel@lists.xenproject.org
References: <20260324123312.11076-1-soumyajyotisarkar23@gmail.com>
 <20260324123312.11076-2-soumyajyotisarkar23@gmail.com>
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
In-Reply-To: <20260324123312.11076-2-soumyajyotisarkar23@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1774452780-986BE112-5BD0683F/0/0
X-purgate-type: clean
X-purgate-size: 1089
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,apertussolutions.com,invisiblethingslab.com,gmail.com,lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:andrew.cooper3@citrix.com,m:dpsmith@apertussolutions.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:sarkarsoumyajyoti23@gmail.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-0.996];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 08F6B3280D5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 24.03.2026 13:33, Soumyajyotii Ssarkar wrote:
> @@ -747,6 +751,133 @@ static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
>      efi_bs->FreePool(memory_map);
>  }
> 
> +typedef struct {
> +    UINT16 signature;
> +    UINT32 file_size;
> +    UINT16 reserved[2];
> +    UINT32 data_offset;
> +} __attribute__((packed)) BMP_HEADER;
> +
> +static __initdata struct {
> +    bool preserved;
> +    const void *old_addr;
> +    const void *new_addr;
> +    UINTN size;
> +    const char *failure_reason;
> +} bgrt_info = {
> +    /* We would prefer the failure_reason to print */
> +    .failure_reason = "",
> +};

Noticed only while looking at patch 3: With this initializer, ...

> +static void __init efi_preserve_bgrt_img(void)
> +{
> +    struct acpi_table_bgrt *bgrt;
> +    const BMP_HEADER *bmp;
> +    const void *old_image;
> +    void *new_image;
> +    UINTN image_size;
> +    EFI_STATUS status;
> +    UINT8 checksum;
> +    unsigned int i;
> +
> +    bgrt_info.preserved = false;

... why would this be needed?

Jan

