Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kOCbAuzM4GkdmAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:50:04 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8F940DAA5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2026 13:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1283270.1565555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLEA-0008AZ-RN; Thu, 16 Apr 2026 11:49:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283270.1565555; Thu, 16 Apr 2026 11:49:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDLEA-000899-O5; Thu, 16 Apr 2026 11:49:46 +0000
Received: by outflank-mailman (input) for mailman id 1283270;
 Thu, 16 Apr 2026 11:49:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wDLE9-000893-Hk
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 11:49:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDLE8-00D12u-Uf
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 13:49:44 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0ccd7-e002-0a2a0a5209dd-0a2a4504e8f6-4
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:49:44 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e0ccd8-1dec-0a2a45040019-d1558031b194-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 13:49:44 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4888375f735so78687545e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 04:49:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488f5818e51sm77362335e9.5.2026.04.16.04.49.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 04:49:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1776340184; x=1776944984; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QhOHlEhvv4HGcevTaThNTFIjZ2Z6EFJNbc7DpL7Dst8=;
        b=SklnUQZliS70G5Ib4pLcR6cAVTWlgzFWo7DjN4d1Tshmnu/cKkBazbiJO5lLtgveqd
         t2gnlXeaawBsS73T6uocTIwdaUJPojD2A0ukJU1tT3b4rd0JdF1pdtYgOEdBaAJumZQx
         l2yuzNiHGFKe0ocv21htWU9QbsaXYbmApYKELvcBGsbTYEmhVaTsaiAXMp0P+V9FmhR5
         zjk12Me8JQkGiNG8ITQk8XcOu1Ba+UbBafEED0QtZWSY2EtBEOt7ZXEA9yZQquG0281N
         Ty09MXZhFLURYSzE3Dgc3QGYNm7rW9pYt54BUoTGf8bU0w1wVp1bR0FcuxSz/G9DJfr1
         aUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776340184; x=1776944984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhOHlEhvv4HGcevTaThNTFIjZ2Z6EFJNbc7DpL7Dst8=;
        b=OjKJ8D9cNwrfzFRqxqNwZFq6hc7YRnm8emakZR/Jk8PSkWYyc1oWVs/vfAn1xTXlCh
         2FTZHWN6krIOZAzdyiVEWfHr4Gey57AMlrYIL3XlgpcNleKJlEICL3fOUeqz2wfMvj+J
         cwbE+O0vI/hQk+wkzoGqh/VQw1mftPm6DevW+LcyUDRyo3y1ZJRvUPsCZ9O5SQNXy1gW
         d4+8daKzZN+bfGo3Vl2KSl2InEXja3swQhOQW8fM73+HkK9hOpQp0UpwAzSI3wkrrqUD
         JBCwpVji7+RSUQdmBCVs0VIdN3FWigXhSisrkegcHuXsmTNpBvcboUeQxwh5X9Pi7JXt
         s3hA==
X-Forwarded-Encrypted: i=1; AFNElJ++tts3kVOTGS6YDc/sfvT6EttcxL6obzYcusSOJUIXiWOh6ioBkvujoqLhe/Iak8/P6CHTMJsuNa0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIbTRj4bZJig2ZkPVRapy4qeB66CjfQHU4wJ+NJUwf8ebEK4Bw
	IxFf/Hb/Ai9Sq1L0vZPEa0nqlrz1wqT6Eey8pm37DpfGtontX4PpxETi1+xJFnT71A==
X-Gm-Gg: AeBDiesCIZRTESR1hFyCpQaLIK5V7DzjjWXXdIA7KqTbMtUknpOeJBEuGm3byZr3x5T
	wHfJFVNnqKsm//v6OI0kg9Y6ZU8P8dF4liosBITuOrxW8tbJp6+OV0ok1TKaK0sXCB5f3zrexno
	enZ+ghDydG9vn5MvmdFChPRQjlFkr4EZT96zdoFSR2dD22t+Qc723UaIAj+oF2ZUcEA60kzVdle
	qHYqBculKNXcLurCa+/Fba8PaKKB9sMZWzSYNq5Ib5F1EElnHV9RgOW8VBYG8aef+fFhKc+3+Dv
	CkXAwKgAwc7Yp60OnLtO4oOlEz2h9MnBv8HfkJpqbo5b6llhtVdKz03yZtUGu7GovwBsg6XQa0K
	+O4cGD/sq/Ey5IGhTHMkBF3NyvXm3vNAr+TnmEslS3QewsJtBWxwFSQ/mRM4FQ6BAgHx2+oSqBo
	HfxSX9T/+24/gncGXFwdvHMgFB2Th5KxZ2Ot+BIDij011DGIQrL0dQn+0RL5vnVo7FiEiegJLnb
	JEc89Vej3I6Zdmq3320cUpBMQ==
X-Received: by 2002:a05:600c:64c4:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-488d686892emr314937105e9.25.1776340184266;
        Thu, 16 Apr 2026 04:49:44 -0700 (PDT)
Message-ID: <7d022fea-0836-43b0-983d-5f7cb26a2e62@suse.com>
Date: Thu, 16 Apr 2026 13:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 11/27] xen/riscv: create APLIC DT node for guest
 domains
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
 <462b5f7dbe4e5084a35fb869b59327c6c92d1fbf.1773157782.git.oleksii.kurochko@gmail.com>
 <362d1e3a-409c-40ab-8d2c-36dc30a04b88@suse.com>
 <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
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
In-Reply-To: <9fd04b0f-3b04-4f1e-ac63-de0fca57d466@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1776340184-2A17E3FF-EF4555FE/0/0
X-purgate-type: clean
X-purgate-size: 2712
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
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,wdc.com,gmail.com,citrix.com,vates.tech,amd.com,xen.org,kernel.org,lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: 6D8F940DAA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 13.04.2026 10:43, Oleksii Kurochko wrote:
> On 4/1/26 5:16 PM, Jan Beulich wrote:
>> On 10.03.2026 18:08, Oleksii Kurochko wrote:
>>> +    res = fdt_property(fdt, "#interrupt-cells", data, len);
>>> +    if ( res )
>>> +        return res;
>>
>> So host properties are again directly handed through to the guest?
> 
> I am not sure that it can be different from what host has.
> 
>> Shouldn't the number of interrupts (aiui that's the "number of cells"
>> here) a guest gets be independent from the host it runs one?
> 
> The #interrupt-cells property specifies how many 32-bit values (cells) 
> are used to encode a single interrupt specifier when referencing this 
> interrupt controller from another device node.
> In this APLIC schema, it's fixed at const: 2, meaning every interrupt 
> reference requires exactly two cells — typically:
> 
> Cell 1 — the interrupt source number (which of the riscv,num-sources 
> wired inputs)
> Cell 2 — the interrupt type/trigger flags (e.g. edge vs. level, active 
> high/low)

So what if #interrupt-cells is 3 in the DT Xen is handed? If Xen can
cope, should that value really also be handed through to guests?

>>> +    regs = dt_get_property(aplic_node, "reg", &len);
>>> +    if ( !regs )
>>> +    {
>>> +        printk("%s: Can't find 'reg' property\n", aplic_node->full_name);
>>> +        return -FDT_ERR_XEN(ENOENT);
>>> +    }
>>> +
>>> +    res = fdt_property(fdt, "reg", regs, len);
>>> +    if ( res )
>>> +        return res;
>>> +
>>> +    data = dt_get_property(aplic_node, "riscv,num-sources", &len);
>>> +    if ( !data )
>>> +    {
>>> +        printk("%s: Can't find 'riscv,num-sources' property\n",
>>> +                aplic_node->full_name);
>>> +        return -FDT_ERR_XEN(ENOENT);
>>> +    }
>>> +
>>> +    res = fdt_property(fdt, "riscv,num-sources", data, len);
>>> +    if ( res )
>>> +        return res;
>>
>> Or maybe this is the number of interrupts?
> 
> This is the total count of hardware interrupt lines wired into this 
> APLIC domain.
> 
> It could be independent from the host it runs one but looking at the 
> possible range [1,1023] for this property if we will put for a guest 
> lets say 22 but new host support only 20 when we will be in a trouble 
> anyway.

Correct. But if you had some hosts with 1024 and some with 256, how
would you bring up a guest on the former to later be able to migrate
it to one of the latter when guests inherit the count from the host?

> It seems like it is another one thing where it will be needed to check 
> that new host has enough number of interrupts and then just deny 
> migration to such host.

Yes.

Jan

