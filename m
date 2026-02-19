Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBAtESUQl2n7uAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:29:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB3415F127
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 14:29:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236271.1539004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt45Q-000674-Qh; Thu, 19 Feb 2026 13:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236271.1539004; Thu, 19 Feb 2026 13:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt45Q-00064l-NM; Thu, 19 Feb 2026 13:28:56 +0000
Received: by outflank-mailman (input) for mailman id 1236271;
 Thu, 19 Feb 2026 13:28:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt45P-00064f-1F
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 13:28:55 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef4324a2-0d96-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 14:28:53 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837584120eso6975755e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 05:28:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4839f99275esm20409615e9.32.2026.02.19.05.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 05:28:52 -0800 (PST)
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
X-Inumbo-ID: ef4324a2-0d96-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771507733; x=1772112533; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VTvhyrVSqQ8mGtDQnqZUA8Y2udFjKolmEo1CZMli84U=;
        b=VCFufQHDEg6NPKP4AINnA46ffPPiDbKLd/Mv67VV5HPtBtHgrhHsSnJHlt37n4jsJB
         QcwFDoSw6vTTLSoEhoLwHW3cDcjhWaZoR2W48cHZICb5CUaUusNBA7FqUskt/LIovURO
         RwsyutO2yuLeSk8VEc79+RxcFDyuDw4yXVNOYMh2YvC8heQwe0jbhSKQQFOwkJa9+X9H
         IGqGzLMUCnhe+vgKM6aEFEmu7A868FKsKbVLgbtb6/50t/wfgsoBlEV6qfRJ5EfTjxbI
         EnfezIIVMDmA2HHUbGNbHp3zjt8QX+dsDGMd1U4bSrxj24Vb9aBnObWjOMDSkdmtyQie
         3+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771507733; x=1772112533;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VTvhyrVSqQ8mGtDQnqZUA8Y2udFjKolmEo1CZMli84U=;
        b=ufRWDKzLrEkRSdsilh+0O1p5GYc+OzXguwhOWY1jeommtk+y+y6ILnv95rHU9p9BRW
         shOKC5YljCw55eq5hhI5aBjflxG3V+ZFHyD1gOo39dW0OG+TX1nbf8F38XzYTpvEzMWa
         SNpIDPWZF+yy/+yFrZu3NXNtI9yJspEkvSjYRTq9A+eDocNMkayzUPa0yylbT889njGF
         PwLM8WHy8bGQ5uFRXq4O7+pFnHGW4YbPcbrPLur03abo22dK4D2XSaIG/HTeqNLIzNEm
         UokCDkKy7knJGFbnpIcpk3hMi06mVNALzBInaixd2vjt4s2lhqAxXjxO88AdpydCgr4t
         kUkg==
X-Forwarded-Encrypted: i=1; AJvYcCV6K14yT8AnV50TrMcONO6eR2IyUzHmXQQJTlP8Ptl8n3/xB7AWVRVO+7O1MKa0o+uC8AWUjcYtgSo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyu6TA0zdwDRAHXXlgCCShVfIqu5w3GFzyXb3cgTQEdl+QQ7a/C
	DZ/0rHJniSwDEegvT+X1Vc4zBbvPWBU7VnXH1xkQUeK6iOc6Ic58UZzkxVtfxh++uQ==
X-Gm-Gg: AZuq6aK54e1aEZh/CrdfZO7kNMGERMCFpKMO/T8AXBNSKQ0CZkEvT+d20S1trBp2Pm0
	uEmg/rZj5nREJhXoT66WlfYzrHTiepzLVu1m4+CL5b++SlE6ggi2PEwwrPPJtf0DPH++BRJW3RX
	Xl0cFDIyzGvpfUbuTS9IJEVDEzBGxggipbfvfXh0c2Aio8Xvq9/1GXCOOnF8vh0XPRBkeI0o8Dg
	4fJGOJxQz1mMMzIXzo95Gvch5o3q1V1NHArH6mnUl/gqxPyV7rQ7Qs/tOM3lJG+1X+HzGiJ+W7t
	kalF/6MnwdKZ8ieWC/qyWrNB38NcNW6FW3R2UMmCKb+xtRpM4JzMeRXrbK1c8R/vXRCPiE9Sec2
	YIToo7tikdxUC8St/VG8cFqoVHN9AoFO+EncAuqA5Qvo8oEG6eBAYwu+bY0FDtoxKjlnW2SBU3B
	3Nu/zR7TEo2aT7HybPYoxEqMv9hvemvpU44p8VJJEta6JYp63Uj9slJNi8F8/EPuAVSMwB0YT+K
	YKXNeSkGljnnz8=
X-Received: by 2002:a05:600c:4eca:b0:483:6d4a:7e6d with SMTP id 5b1f17b1804b1-48379be60camr256555015e9.30.1771507733086;
        Thu, 19 Feb 2026 05:28:53 -0800 (PST)
Message-ID: <eb4363a6-9035-4922-9314-60f4c6ca9309@suse.com>
Date: Thu, 19 Feb 2026 14:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Advertise and support extended destination IDs
 for MSI/IO-APIC
To: Julian Vetter <julian.vetter@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
References: <20260209113412.2603088-1-julian.vetter@vates.tech>
 <87be26c1-52fe-438f-8aad-1d5ea0f0a325@vates.tech>
 <d3b71e9b-c026-4cda-99cc-a8037f302bd5@vates.tech>
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
In-Reply-To: <d3b71e9b-c026-4cda-99cc-a8037f302bd5@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julian.vetter@vates.tech,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9DB3415F127
X-Rspamd-Action: no action

On 19.02.2026 14:08, Julian Vetter wrote:
> On 2/9/26 14:40, Teddy Astie wrote:
>> Le 09/02/2026 à 12:36, Julian Vetter a écrit :
>>> --- a/xen/arch/x86/hvm/vioapic.c
>>> +++ b/xen/arch/x86/hvm/vioapic.c
>>> @@ -411,7 +411,7 @@ static void ioapic_inj_irq(
>>>    
>>>    static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>>>    {
>>> -    uint16_t dest = vioapic->redirtbl[pin].fields.dest_id;
>>> +    uint32_t dest = VIOAPIC_RTE_DEST(vioapic->redirtbl[pin].bits);
>>
>> I would rather introduce a new field in vioapic_redir_entry for the
>> extended dest part; and compute dest from that and dest_id.
> 
> Here I have a question. This struct is a public ABI struct. 
> vioapic_redir_entry is defined in 
> xen/include/public/arch-x86/hvm/save.h. It's part of XENs VM 
> save/restore operation. It is used by libxc and toolstacks to migrate 
> VMs between hosts. Changing the struct might be undesirable? Yes, it 
> would make the code cleaner. having a bit entry for the extended dest 
> bits. What's the general opinion on this? With the VIOAPIC_RTE_DEST 
> macro I avoided touching this struct...

Which in turn raises the question: How do you migrate those bits? It looks
like you're losing them.

Jan

