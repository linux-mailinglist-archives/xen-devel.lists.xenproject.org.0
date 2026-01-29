Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLxAEFYce2msBQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:37:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5F8AD968
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 09:37:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216160.1526118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNWh-0004hu-3b; Thu, 29 Jan 2026 08:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216160.1526118; Thu, 29 Jan 2026 08:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlNWg-0004fh-W8; Thu, 29 Jan 2026 08:37:18 +0000
Received: by outflank-mailman (input) for mailman id 1216160;
 Thu, 29 Jan 2026 08:37:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlNWf-0004fb-Ey
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 08:37:17 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af80f317-fced-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 09:37:03 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4805ef35864so5201465e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 00:37:03 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c40e04sm180192905e9.13.2026.01.29.00.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 00:37:02 -0800 (PST)
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
X-Inumbo-ID: af80f317-fced-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769675822; x=1770280622; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3Rdxq4eZQ3TL4NfBjYo2hXdXYnnWKoWGHKhH4Ncw/3g=;
        b=Auc3KWnQ5VbBEF48in2em5mEt5Nv23+vJETKniqmCwEUSskhBRbotimnUyXis6RZvy
         +dHPCDhHoWm+eHWxExOt0kff+jb06b7CTrw01HYCdefCmIas+QfqTJAnDJT7rC/cP9mU
         gzq6DLaqMx2FPveuTC/eN9Hqc2/rbUox3t7HMTxI8QJulmosiYemxQnW5rmaAnu3IWYg
         D7A2nea2a/x/h8MbK0V2dJ85oQ/rFd8JZFSBplCWQZYwJBM0VCUPbZNqyms1XzCOhrJp
         lDKsXbYUwqP2P6U7hAmYepuFPs3X+QztIaD/aQguIsNY0JoiT616xvhDDD2A5sE1WtAU
         aSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769675822; x=1770280622;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Rdxq4eZQ3TL4NfBjYo2hXdXYnnWKoWGHKhH4Ncw/3g=;
        b=ZJb9nVrxq89Gg9AKrzHg53R2Lxq3yCXtWoFbFhNQPiEmDOB+NDv5BBOwuA1IM7/NNC
         EL6vBZAV4oly2tlJs9iMOq2x2nBoVkwl//U2tIStI0NsE5VAnEmx5IgJOQeBBfD2o/iR
         +qlxxGMmLFxvJqpN/kY2KS3Xmh39Msbb077nP1Q9XWfbdli+RIA5dATYExVicam9cbXd
         W1WL9D49N6rVxfSai/XjOOl1tUHINbtsQyBne9C1so/WNW1n3dwusj5eDaqGJpGlPXbB
         zycLWY14qIFkJo/wvYN5yuOre1zP2LQPzN9Da0ypiHlzmk0tMZR8mdRL47DsNUCW+Nfc
         IchA==
X-Forwarded-Encrypted: i=1; AJvYcCULMSKYXWg2u9uE1c5lnHT3zBfENSV/0zObWUwoukJrw9HH0qE751+ge6mGWNAQjBwSqLdpUXUCv+U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBjPhVIL1QnpQrAijYAWDlW8Qyg0fSPmG2uBPdtEk3LD3QxDOj
	31/xiZiawEhmsu2OstCP5ur50a2Od2Gi26ucO+8Ku9VMncioCHBONzkVY3rlA8RO5g==
X-Gm-Gg: AZuq6aJkqKF4uniZQRTx2HXFULjJKqrU9Li11U8raDSjuXlzAyZMQ3ee0k8wPfiChWn
	8R/pFagXz5hKvFEGuTeo93Jwj38+gviSju4Wjaye0HSHXxK4ine3fsW8fxg7/iGJAkbjclqb4GG
	Geb7FAwzBS5xDHLBPrcHlfuoBUvmTnqi2/hMRxuYeIfCa+9tIKQptUfBYaRGBFJGDRIP0qhUZKD
	Qh9wD8uGAA/VGeP1kC+LynW2X1r/r31k6oUKJIUNCuMQXZ3sgGG7LDI2en771Ezd9F9mTVrpPHM
	+jiPUI93PXpfV6Vb+lH27wz0uhcFCCSVPWVBwkfbTy0YMdzeyO3SwC2Zifo1LDkpGdhMI67J3D5
	loGtsUWUaFO192aJWCgslflZ2G5B/W2qHtltrntz3GMntj/KSD8/8LJ0ci3U4W1vzAnXgIa2SZQ
	HW2sX/4XVoSc8nlifwpFPJg0e70CLXKikExDEBoeFeXLwdYyPi3XMKXDZhNW7c3lk3GbpNA5ZDE
	Yw=
X-Received: by 2002:a05:600c:8b2b:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-48069c73ce1mr99344375e9.36.1769675822480;
        Thu, 29 Jan 2026 00:37:02 -0800 (PST)
Message-ID: <72d36ddb-22c7-4b32-af8a-f4920b75ca7c@suse.com>
Date: Thu, 29 Jan 2026 09:36:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] xen: enable dom0less guests to use console_io
 hypercalls
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 grygorii_strashko@epam.com, anthony.perard@vates.tech, michal.orzel@amd.com,
 julien@xen.org, roger.pau@citrix.com, jason.andryuk@amd.com,
 victorm.lira@amd.com, andrew.cooper3@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2601221704110.7192@ubuntu-linux-20-04-desktop>
 <20260123010640.1194863-2-stefano.stabellini@amd.com>
 <91c71a0c-4345-4fae-912b-ae7c9d2160e7@suse.com>
 <alpine.DEB.2.22.394.2601281823460.2238666@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2601281844370.2238666@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601281844370.2238666@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,m:grygorii_strashko@epam.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:victorm.lira@amd.com,m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 8A5F8AD968
X-Rspamd-Action: no action

On 29.01.2026 03:46, Stefano Stabellini wrote:
> On Wed, 28 Jan 2026, Stefano Stabellini wrote:
>> On Wed, 28 Jan 2026, Jan Beulich wrote:
>>>> --- a/xen/drivers/char/console.c
>>>> +++ b/xen/drivers/char/console.c
>>>> @@ -612,10 +612,18 @@ static void __serial_rx(char c)
>>>>      if ( !d )
>>>>          return;
>>>>  
>>>> -    if ( is_hardware_domain(d) )
>>>
>>> This check is fully lost; shouldn't it be replaced by ...
>>>
>>>> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>>>> +    /* Prioritize vpl011 if enabled for this domain */
>>>> +    if ( d->arch.vpl011.base_addr )
>>>> +    {
>>>> +        /* Deliver input to the emulated UART. */
>>>> +        rc = vpl011_rx_char_xen(d, c);
>>>> +    }
>>>> +    else
>>>> +#endif
>>>
>>> ...
>>>
>>>     if ( d->input_allowed )
>>>
>>> the latest here (not sure about the vpl011 intentions in this regard)?
>>
>> No because vuart has already input_allowed
> 
> Sorry, let me rephrase this. You are right we need a d->input_allowed
> check. The check is already done as part of 
> 
>     d = console_get_domain();
>     if ( !d )
>         return;

Can this be said explicitly in the description then?

Jan

