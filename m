Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG85F8bi4GlhnAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:23:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C191140EBF2
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 15:23:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283476.1565698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMgS-0003oD-27; Thu, 16 Apr 2026 13:23:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283476.1565698; Thu, 16 Apr 2026 13:23:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDMgR-0003la-Ut; Thu, 16 Apr 2026 13:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1283476;
 Thu, 16 Apr 2026 13:23:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDMgQ-0003lU-EY
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:23:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDMgP-0068ym-RH
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 15:23:01 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e2b4-e002-0a2a0a5209dd-0a2a4504c3f2-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:23:01 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0e2b5-1dec-0a2a45040019-d155dd2fc855-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 15:23:01 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-43d77f6092eso3197659f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 06:23:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead401ca0sm11926954f8f.36.2026.04.16.06.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 06:23:00 -0700 (PDT)
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
        d=suse.com; s=google; t=1776345781; x=1776950581; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6pf3671NTwEiOWiYjLsnWF/6efG9p8gClwjWZsuq4Qo=;
        b=UgPjwFc3p+ot4PSAsUo346TFuuKkjoBus3b6/TpfQrDfKBgRy0Nxiv62mYb0NI+dlG
         Kle0Tw+D2s2N5MAThjZc6e+13a2NlLu8yDxDla4HPIgr9TXOFEIcQdey00GBdh/k5osi
         Mz5o2H8JSFAeGvEDr9AgSjRgGImZrXQ5dE/ydLg0OjqDHJ8GiD2PBuHDl1s7auoOkYvL
         CdhyP+PEpDr8HMe2Ar7Uh/W+FbbivUlwnjIrfq4ktBLKJmU5ohEsQp4JLnJAVJ74dPt+
         RuXhveBsaIhatbB1H7+k2Z6GMTwCLGKEh5LjVmouwLDh+gfJKNGwjIgRsQOCDkT1IGUP
         9oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776345781; x=1776950581;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pf3671NTwEiOWiYjLsnWF/6efG9p8gClwjWZsuq4Qo=;
        b=ZAsfGI0UmCT27zWvH68cShiqbjNf2ecUE9njUHihpVK/GLd27Thyr+ou3QGqPHD83R
         hWK4Xs5H1rW88NN8u5obQuU+YvO4aCN8XHGQBuHsXyp8knvgPQ/yT78VVhBmNGqas2c/
         nBeCVN7wC9GDbWxqLEBAEBltjt+83rc38f+sYpIeQEtU3XWVs45DabU1y8fE7HHyg4/I
         mf8c/nROoRKZovQfPB+jcWsD/0YkugvRxngpGcYuui79kEmQ+yf6BAW075l/14MRLEh8
         9ShvmYhzJyvcsm7//yCu+fWERYi1xCldMDXEC/ClG3LHXgx1gGErCB7zu1USMdEt4Bgs
         4BJw==
X-Forwarded-Encrypted: i=1; AFNElJ8391NNsVu5VNO6L7xVx0Jyup1xkF5gDkr23xZ3pYXk6QlT25m7gNkTeye3Tv5hdbF4C1pBDLl6E9Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzV5entDxPq+ilzqtBoUpocNNO6F5u2uiTmWCULb1jxKlKGslTh
	BSKekzqFHEgSoBpWzivElZuwC16oZKmMmCwaZWiUeuSdTclvVacfl/NAMpt+nfpyWg==
X-Gm-Gg: AeBDiesRfpPC23rCZTTVAg2XpP4YieRzsGwmHPBrqjEYbHwA0ItUS5Q9AVFKEeaa3wo
	hFziIf1KxXSTLVukgqnrmP51ovxDMEETI9Ur7GyJR28z/xNWXCOcJ75rjqDmQdVCjBT3pF4yQ7s
	ObRKfaRqYNfipeMBcUADHRjlw0gLTCl9p1+zkEGiWw4hGyKgcylO/7kfSkauo9tcDAUlNBgwORd
	wDl5Ojon+7DNE6qxQJO27Hks9M6FqKMCU0XVbK/aFmRy/gfWm/ZbCcYJLGl8lQfor/VsF5JtQbP
	iNHZrxmOO8RDgxKurGUApxFRzkK37Vs9nsIb0qJ3vyWi5Thv3j4YTA13dX5hY2x8GkJX61U2pzA
	KP/5hdmYVZNKZG2UCy7EC0XH5YK85d85FqoGN1VduAVUoNqB0s4tXEBA6Bo1+QWMSsdKCWc6CYK
	RastEnYXIp184MCZ8inW5JRV2zmdoVBPsYYWVr9pW2vwVkR09LWCTTfNeC9NVFutGY4TSj2VUFs
	q81JrgXy2r49OlW23r1t9ry2A==
X-Received: by 2002:a05:6000:1ac5:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-43d6429c737mr39995638f8f.22.1776345781157;
        Thu, 16 Apr 2026 06:23:01 -0700 (PDT)
Message-ID: <db7a0b75-d854-43ed-a345-243603a3631a@suse.com>
Date: Thu, 16 Apr 2026 15:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 21/27] xen/riscv: introduce (de)initialization helpers
 for vINTC
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1773157782.git.oleksii.kurochko@gmail.com>
 <61311834fef7cf8a736a8fa972b6461bbfd46e6d.1773157782.git.oleksii.kurochko@gmail.com>
 <cf20ebc8-ff58-456d-a7f6-c844cb427306@suse.com>
 <6f4b3a0b-8c13-4c54-afa1-2893aa967254@gmail.com>
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
In-Reply-To: <6f4b3a0b-8c13-4c54-afa1-2893aa967254@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1776345781-291763FF-7BF149C4/0/0
X-purgate-type: clean
X-purgate-size: 872
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-0.998];
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
X-Rspamd-Queue-Id: C191140EBF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 15.04.2026 09:50, Oleksii Kurochko wrote:
> On 4/2/26 4:58 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> @@ -87,3 +88,42 @@ int map_device_irqs_to_domain(struct domain *d, struct dt_device_node *dev,
>>>       return d->arch.vintc->ops->map_device_irqs_to_domain(d, dev, need_mapping,
>>>                                                            irq_ranges);
>>>   }
>>> +
>>> +int __init domain_vintc_init(struct domain *d)
>>
>> The __init here and below is questionable again.
> 
> This function is called during construction domain only, what happen 
> when __init section exists. So it is okay to have __init here.
> 
> Any use cases where it isn't true?

See my earlier reply. Imo it is wrong for you to tailor the code to 
dom0less-only operation, with no domains ever created (or destroyed)
at runtime.

Jan

