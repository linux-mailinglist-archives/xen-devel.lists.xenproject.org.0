Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WFCJABY7xWn/8AQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:56:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5611B336625
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 14:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264186.1555883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5lCC-0006Mn-Cd; Thu, 26 Mar 2026 13:56:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264186.1555883; Thu, 26 Mar 2026 13:56:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5lCC-0006K9-9E; Thu, 26 Mar 2026 13:56:24 +0000
Received: by outflank-mailman (input) for mailman id 1264186;
 Thu, 26 Mar 2026 13:56:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5lCB-0006K3-3j
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:56:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5lCA-00GkHN-Fl
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 14:56:22 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c53b05-5cb7-0a2a0a5109dd-0a2a4508be06-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:56:22 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c53afd-1950-0a2a45080019-d155dd2cc16a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 14:56:13 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-439b611274bso523882f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 06:56:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b919cf069sm7946009f8f.22.2026.03.26.06.56.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 06:56:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1774533373; x=1775138173; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CShIXqWMoWDbuwpw2f5DtUXfSZFm4G9nJ3ghFUXlsOE=;
        b=g3LFnogEd8lXdeGUg6/RHF8/8fqgmTDwXp4mmqKpZnYnLI8r6FpuRGiSwxW3GyQXYY
         R5/imbUpr+1hQOZNFHxEwvAu5U+tjXUVx9IsDl50n4gyN+8PIAPRyTXkHJGIg78efDvR
         HFnlco/gCsHXY99HLN4Nl5Qm48wITTHkW8hjjAOYUzoDSx+HCaJbcGjAxh7AJsHTbf8T
         9b+DQTE82QwSIBNvQmKROtgbJmviSqV3DPwYR/GJk4Xwjm879mlCvh/ECywrWtm39FM6
         ubm5zSx2R7xzrDGEvLF4gaOlRpbwDgfFiEZO8M8N0vTKWOZn4QU5G1MKD/ctefYJAkG2
         DE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533373; x=1775138173;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CShIXqWMoWDbuwpw2f5DtUXfSZFm4G9nJ3ghFUXlsOE=;
        b=MeSgZgER5DqDhKK2quIxPXZ1AppdSpGfK2L5lInTbL6yYnD9dKceqDjSK8Ln68GXMh
         ESfBOba2Aw34IxDyq7QfpE5NHJUbDxTaDzKMX4fFKKaLVWgJdWK0jY/aLtmtn25LZNet
         zMNndp5s4rlJEg/LZpIvkUhEoRSlJaC9Ca1Ru109CSHgFPigpcCs8ecDSCg9zVAo/74O
         8Y5kHK7L9gzo7zMCiWd/89OWGTfh0ez0EETfjgUvtNS+2wbEDo5cxyrhQxTBBKxvRMb0
         zyBh73O+eEElTlsMqEfc1KBK3SjrDEZa/T9Ku3un3XjAiHX1CBp/Xk1K+IKxxOqWcyPs
         4oXw==
X-Forwarded-Encrypted: i=1; AJvYcCW0zYfXGJpquofHLM6MVN1pB8LN8TQ5607h6NeJVGb2bIasR9tjwUx5KwtXQfz5QLKqQCR6vUaFWNg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhipSDhjUQh/mbycHCzglVSp8YSuCaXLHUEdD1qe69TN+fKfG5
	RMDXBKlzPuTXff+fa64bkUjooSJYgmR47F+yM4gzgMmkr6lb+v6QpWdQT+JQz8lFXg==
X-Gm-Gg: ATEYQzxNzNVW+ncArFbrMpGl1LcUchVe9XCCMyGiBNA+mLSffF9AuMei1CP2JRqS7q6
	Tjwt3N4mJmuqhNnNMnNSvg/EMnSKjKx+NKk8WdH5IN6lyXbtZ5FyO2843vIrC7NqOT4HA8LTtCo
	SWrWgmvV8FaxMDU/GW+cIu8rTMQKAuaulkH+rsvZqGyYlgm1emcP9oZKCWoz3LoMUcB9FmT96Be
	izrK8KHkqy6gNh3Qcg2wR7q6Sqn/Xjlt9LhqSUb/KJTWA9RFntg6pan3gCVQPIet6wP034eGCPa
	d8JrXj7GG0VBg09mqpcy+J7UDmq06oQUrsTtx86palKf0O6UkOptECQJcJKad/pms5+GHswdPMB
	+Eaq8te/hPxxWRm1q/brc1GYZdiaD2w1aGQrDxaHOLbXYkb+XaQVWpurr1XgdecpYQs/zMxTshU
	/z05uESuE+1TdMqtATyyajI2FvFFYKCfKV9SaNR7EMvimjefJl6SzsbpQbfDGn/iEUFKiGiDy7J
	5Qv3FHXcBiDGmE=
X-Received: by 2002:a05:6000:200c:b0:43b:634a:8ee3 with SMTP id ffacd0b85a97d-43b889f5821mr12267751f8f.34.1774533373331;
        Thu, 26 Mar 2026 06:56:13 -0700 (PDT)
Message-ID: <5110de7f-da46-4043-8573-e131217c60f9@suse.com>
Date: Thu, 26 Mar 2026 14:56:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] xen: return proper type for guest access
 functions
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1774281309.git.oleksii.kurochko@gmail.com>
 <d990acbfe642a8c5c8d892e9dd43381c086e8c81.1774281309.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d990acbfe642a8c5c8d892e9dd43381c086e8c81.1774281309.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1774533373-F1AE1726-2C1FE221/0/0
X-purgate-type: clean
X-purgate-size: 1068
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5611B336625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 23.03.2026 17:29, Oleksii Kurochko wrote:
> --- a/xen/include/xen/fdt-domain-build.h
> +++ b/xen/include/xen/fdt-domain-build.h
> @@ -44,10 +44,10 @@ static inline int get_allocation_size(paddr_t size)
>      return get_order_from_bytes(size + 1) - 1;
>  }
>  
> -typedef unsigned long (*copy_to_guest_phys_cb)(struct domain *d,
> -                                               paddr_t gpa,
> -                                               void *buf,
> -                                               unsigned int len);
> +typedef unsigned int (*copy_to_guest_phys_cb)(struct domain *d,
> +                                              paddr_t gpa,
> +                                              void *buf,
> +                                              unsigned int len);

When making this change, did you look at the use sites of this type? If
so, did it not occur to you that initrd-s can be pretty much arbitrarily
large, i.e. in particular be larger than 4Gb? IOW I think there's a
truncation bug to be fixed in Arm / DT code.

Jan

