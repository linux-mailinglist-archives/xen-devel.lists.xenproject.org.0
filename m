Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FvymBWAalGn0/wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 08:36:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE15149344
	for <lists+xen-devel@lfdr.de>; Tue, 17 Feb 2026 08:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234608.1537790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsFbd-0004Zn-MV; Tue, 17 Feb 2026 07:34:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234608.1537790; Tue, 17 Feb 2026 07:34:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsFbd-0004Wy-Jc; Tue, 17 Feb 2026 07:34:49 +0000
Received: by outflank-mailman (input) for mailman id 1234608;
 Tue, 17 Feb 2026 07:34:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RxGT=AV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vsFbc-0004Ws-JG
 for xen-devel@lists.xenproject.org; Tue, 17 Feb 2026 07:34:48 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1faac922-0bd3-11f1-9ccf-f158ae23cfc8;
 Tue, 17 Feb 2026 08:34:42 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-43638a33157so3766393f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 23:34:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5d156sm35521307f8f.5.2026.02.16.23.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 23:34:41 -0800 (PST)
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
X-Inumbo-ID: 1faac922-0bd3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771313682; x=1771918482; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0zMZwaW1v0S3BGtZLua8EiJA+CKX4LEOVBK0QDdRmjc=;
        b=PneX4hLnm4AgPJ83dkcQOvQONHxi2Q1jdyGK7eMqsbcqx6ILdK+dYXvKaBeuvzjWgg
         lTyn3kqn3dp6mKPvePH/gMQ+UW1ic9oqqloybId8FwzuTch6hSnvaX38fJYua/TmOblg
         b9hBMVIc/HZCynSPaSuPc6kf/jgz5KsYVWph0Df06yDsBXosq6QlZ51Kl6Ar5huh5VvE
         NkWxVSTkuXS5yVgbNtXRIoFxGPpxzxSKIrl7GLqlCqHpwZvc/bBVMu5N64edGfHRGKrd
         xPusSSdcJUInuwhaLGDtlesFIaU/d4iqYn3QI7IqZBaf3ZxTnQkdiaDv/qZObGIx8bCN
         Gxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771313682; x=1771918482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zMZwaW1v0S3BGtZLua8EiJA+CKX4LEOVBK0QDdRmjc=;
        b=XRf+hkPfBHHK/kohvc63sHHGNQ55EIoIYfaqPmKF++i+Lhy3DsmW/2REVg6i3elira
         l54D03Q1nbzyuKM4RBGxkOrqYGOhxBdC4batpkJMOwHpotx9wzY+8rt9vuu/hYKOReSU
         PhEd700f5t7eMlUOKBexITQZHAN1M+B/cq6fvPa3hk2Nuz2P7QBe5HLnl8/VvbjsUFt4
         70/1spKHKvup21njvxyxij7gpkLZ1wIQ/kC407ugxSjjnhaT2PQWyY7zJyiTMj3BuA16
         t9knW1zC3PcOx0ao7g1+P1jxv273i2qfPJQdhMAQK5Zr95zQhai7eRc/N8wuf2cOUUp1
         qyHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVagBswduxv5EKfZDTeir0GEBH4/carqQVMwN3hjIvGt+nFiMRPEX9lnpM/OwH2ciUoRS0I3N6DxnQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzPbGeOKYC/JOlqbGBcFh4QHOCeP76mLa9lVEbJMNfVzu08OskO
	nSPR5ruHKNcHkbt4HW+oRMCBCkYVBE31z5oXhS5m3ZFJBDDcMlza6lohuAtNb2ZNqmqHYlU8RvG
	GWdo=
X-Gm-Gg: AZuq6aJXsISTkclaacpt3Q5biVUp1QzagXKOvjkwt3aunjJ0Gl9W/ylTeIn6NyRn9bm
	72MUjQOaRQX9rBXThuIvSW/i7Dh5rXp2e+TVjNFnuxROsDdw9i1WAH24invmiRAwgytzYe6S/5J
	MzLtjNfM9vaVs5Ap/lprvOUcnkn1TL1rTRxhUiAKsWhcaRRtHuDfIjxP2rO7tuL5GGw8YKtoNXs
	EbIJ+S04mlH1KeF2Ba0Nn1G8a+6/XYKHIjHuN0bFwfQneNZaW/O+lI+3ZCjbzx5KWLH/6y0o4iy
	RZvdd2PosP08jf1y50YNhkhkhxMBw9Lp3liOir+FQK5Lvk6Ne//j1bMZGqZGn/2f/fS4RFd/ktR
	kpSEewSqnmj5NyVawCB3Lg4iLZ6aiLn+9Uw7jqG2xovtBVaQaAsXf7fAiE9+2wAqVJzfm9Mgs8j
	hK7mof8JwLALQI+WTBymXUQYzeLqJZbQjmxGLrrBPPXBy0LXzuHX0C4RU5v2Z7tW6sqwkWlJYW7
	aHDQ9rcLYpNwXw=
X-Received: by 2002:a05:6000:2dc8:b0:437:6efe:94c0 with SMTP id ffacd0b85a97d-437978c7631mr20608055f8f.7.1771313681734;
        Mon, 16 Feb 2026 23:34:41 -0800 (PST)
Message-ID: <d9feffe4-c45e-4bed-bc5e-776e4547578a@suse.com>
Date: Tue, 17 Feb 2026 08:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/6] xen: move domain_use_host_layout() to common
 header
To: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1770821989.git.oleksii.kurochko@gmail.com>
 <678eb53c56bc4f6147feb0bbb6c1319197d0f0df.1770821989.git.oleksii.kurochko@gmail.com>
 <522a71ce-05da-4a66-956e-5581f0c49e0e@suse.com>
 <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2602161038120.359097@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5AE15149344
X-Rspamd-Action: no action

On 16.02.2026 19:42, Stefano Stabellini wrote:
> On Mon, 16 Feb 2026, Jan Beulich wrote:
>> On 12.02.2026 17:21, Oleksii Kurochko wrote:
>>> domain_use_host_layout() is generic enough to be moved to the
>>> common header xen/domain.h.
>>
>> Maybe, but then something DT-specific, not xen/domain.h. Specifically, ...
>>
>>> --- a/xen/include/xen/domain.h
>>> +++ b/xen/include/xen/domain.h
>>> @@ -62,6 +62,22 @@ void domid_free(domid_t domid);
>>>  #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
>>>  #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
>>>  
>>> +/*
>>> + * Is the domain using the host memory layout?
>>> + *
>>> + * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
>>> + * To avoid any trouble finding space, it is easier to force using the
>>> + * host memory layout.
>>> + *
>>> + * The hardware domain will use the host layout regardless of
>>> + * direct-mapped because some OS may rely on a specific address ranges
>>> + * for the devices.
>>> + */
>>> +#ifndef domain_use_host_layout
>>> +# define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
>>> +                                    is_hardware_domain(d))
>>
>> ... is_domain_direct_mapped() isn't something that I'd like to see further
>> proliferate in common (non-DT) code.
> 
> Hi Jan, we have a requirement for 1:1 mapped Dom0 (I should say hardware
> domain) on x86 as well. In fact, we already have a working prototype,
> although it is not suitable for upstream yet.
> 
> In addition to the PSP use case that we discussed a few months ago,
> where the PSP is not behind an IOMMU and therefore exchanged addresses
> must be 1:1 mapped, we also have a new use case. We are running the full
> Xen-based automotive stack on an Azure instance where SVM (vmentry and
> vmexit) is available, but an IOMMU is not present. All virtual machines
> are configured as PVH.

Hmm. Then adjustments need making, for commentary and macro to be correct
on x86. First and foremost none of what is there is true for PV.

Jan

