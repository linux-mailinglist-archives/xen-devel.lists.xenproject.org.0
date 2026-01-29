Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHlDF74xe2kVCQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:09:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AECA1AE671
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 11:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216226.1526167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlOwv-0001MV-E9; Thu, 29 Jan 2026 10:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216226.1526167; Thu, 29 Jan 2026 10:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlOwv-0001Ja-BP; Thu, 29 Jan 2026 10:08:29 +0000
Received: by outflank-mailman (input) for mailman id 1216226;
 Thu, 29 Jan 2026 10:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlOwu-0001JU-28
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 10:08:28 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7356dd5f-fcfa-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 11:08:25 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-432da746749so542795f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 02:08:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e135422csm13731802f8f.40.2026.01.29.02.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 02:08:24 -0800 (PST)
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
X-Inumbo-ID: 7356dd5f-fcfa-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769681305; x=1770286105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aFTTiD59NBy3aFazyOutc0ksXRirFfJCu85Xhvjw/Vw=;
        b=OyFXK/1USokC7I99QCLvsPbShaAVxyj2r2WVKA+mEbrw7xm1aWeHVAJTD05Gwma9lE
         EOssl2zCOql2cQ1BDjRTlBNmBefRnxxM7j/xCamFqp6bjGDEyR+E2DDdzE5u1JsHRwZH
         0fpn12ZJH7i2OXEQAAkxpU/4zLkLAzig5rp2/5jUWuBqZKF7HjKK0ZIBMoAMjKsTZwaL
         tm5kGg1Nr8mWuqTugA5A5GR2iNzRrIFLTbhSevrf6JHw5KiU2b2dqU2sHLXEqzpr8W2s
         wCCVDXgoGgMy1FnbLWU2uqVuJgXcHQcFL2kZZ9STskqGmrk0WpXzzETl4dMqGvugGFab
         QrDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681305; x=1770286105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFTTiD59NBy3aFazyOutc0ksXRirFfJCu85Xhvjw/Vw=;
        b=EUg8Iq06BLyqQOwkYTKgLnhns5yGV//zvrNM6eOqsVLokrnWqcEg6Ey28glEQrb+xV
         9LEmzus0ZxNvutwvsZpuRnVF0Q+i1P6vlsUb5VvY0TUDsjYjZb0P8uLdx99wsXxP3GfY
         Mi6nRfBZjbhhewbHB+AhtBVJraD6r0DpEVPaICwlfbzxZ65LPSXqtuCEWyJeA0fupxu6
         BlPb8mSA837VnnDL9+kjvsEUoG3SNRUuieZqeX7pXgWo/exSjyay0oC/oYQLKMDHxEzp
         1hpoUw00WFeGhWMxbNEQCjTrVmSDPrzz400BRcW8wZjB7G8EyKc8CsEPueFyhr7tiqP1
         0rtQ==
X-Gm-Message-State: AOJu0YxSs+dAMwdtzf36QchN89OwcecG9YltfA39dD66rijCeFLAX3u9
	MmMDml1+9OVXrM7CCowlKq6yTymdSrqNwF3DgxnCrFzojXFXh7QGq3412RzKpmkOCg==
X-Gm-Gg: AZuq6aLWBG7qijnzfOyxPHtz6+KjDNF+h0pVgJ/uAkDk/tzNP52S+kKpMDJnD7NniOr
	5QVvqFpVBPARs/Xw7fgTes6KLaqdtSQwuN4IcvkOC3UJtkmERjBsLgf1gcbH/z6U3ToUp2N3T+Y
	vNLuBJg+FLxrWY2xfsPHnELxlpsySwQfmG2LkJU0DmL/KD9THRoMvH/tp0EF5rqVcT9n/+WjKJ6
	8LRvfTl2pN7XukpKjPZjH+QWAbMtcJyqVSRxE9suiVRw6plx60uGEXWYfqFpuYOb+kE+nCwJYur
	ep10VbqrFoSIYFcIZggFAYyh3R691a7Z4XXoNB642c0prOvzhn6hLtjuJdeZoEiHtHHcgg+Qcnt
	D02bqnetqBxF7wQw0xU0mw6nRxGT8oWDQet24mmzgBXwMr41eGjX/zujFX88fEjCKjJrhSjjx1s
	eQeGkBIQyJd/Kh/Dr0Dii+MQPJm+Q3c8Elw4OuFHuV/IxWFvHpwBPj+TPBtBQq3qYahVFzcxdaw
	8uwGx7CvzJDEQ==
X-Received: by 2002:a5d:5d0a:0:b0:435:94c1:3713 with SMTP id ffacd0b85a97d-435dd0a39b1mr11715799f8f.37.1769681305111;
        Thu, 29 Jan 2026 02:08:25 -0800 (PST)
Message-ID: <e1cd0c63-c19b-452a-b967-cc51a0aed0bf@suse.com>
Date: Thu, 29 Jan 2026 11:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended
 config space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com> <aXsmOEcSJaztURad@Mac.lan>
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
In-Reply-To: <aXsmOEcSJaztURad@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AECA1AE671
X-Rspamd-Action: no action

On 29.01.2026 10:19, Roger Pau Monné wrote:
> On Mon, Jan 19, 2026 at 03:48:01PM +0100, Jan Beulich wrote:
>> --- a/xen/drivers/vpci/header.c
>> +++ b/xen/drivers/vpci/header.c
>> @@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
>>      unsigned int pos = PCI_CFG_SPACE_SIZE;
>>  
>>      if ( !is_hardware_domain(pdev->domain) )
>> +    {
>> +        if ( !pdev->ext_cfg )
>> +            return 0;
> 
> Don't you want to possibly put this as a top-level check, so if
> there's no extended config space we avoid doing the PCI_CFG_SPACE_SIZE
> read for dom0 also?

Hmm, yes, didn't think about that. That'll mean dropping the
"if ( pos != PCI_CFG_SPACE_SIZE )" from the body of the
"if ( header == 0xffffffffU )" then, i.e. the printk() there becoming
unconditional. It may also mean dropping "DomU" from the subject.

Jan

