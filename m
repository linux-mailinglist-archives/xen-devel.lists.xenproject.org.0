Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B77901B97
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 09:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736952.1143030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZFl-0001Mi-W2; Mon, 10 Jun 2024 07:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736952.1143030; Mon, 10 Jun 2024 07:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGZFl-0001Jq-TR; Mon, 10 Jun 2024 07:15:41 +0000
Received: by outflank-mailman (input) for mailman id 736952;
 Mon, 10 Jun 2024 07:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGZFk-0001Jk-MB
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 07:15:40 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d5903ea-26f9-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 09:15:39 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2eaae2a6dc1so80989701fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 00:15:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6c80581c1csm615294966b.17.2024.06.10.00.15.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 00:15:38 -0700 (PDT)
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
X-Inumbo-ID: 3d5903ea-26f9-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718003739; x=1718608539; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KxOqOh8UfBu2g09J9Z0iUbukC5LS8oAauWEWOrv76J0=;
        b=VzkIuvKcP1UdzrlhHtnHWkWwgMm7RFPS1X2bcvvOct4tYl51TU3qkpnG9e3KZOUgtk
         jLyd7Lhuh6Em8VIXB5SfbIsH+55ZmnjgO/g/i5xXLfSVJtQGKbVesr5z3kjIajlN4L1j
         YumsKGF7wm7ErQl1zO20K+QVcYzP62c1vw32alIiFOP1/nqiHdONsbrYkTnKa+41peGl
         VsLoUTjpiIXs3yzNOoBgI+rhSw4I0hR5EHjpHVxSpLwbMd1b79QQsrEjoNBNvZUi+Z/6
         NJBjt/dmpxXMgL66qPkr/dcKrnqdFFwBoMsr5+4eSUPlZOXAzmXTmzbdAL1SAAhd4J/4
         9FTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718003739; x=1718608539;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxOqOh8UfBu2g09J9Z0iUbukC5LS8oAauWEWOrv76J0=;
        b=LOlbAY/S/IxAMYiFiiq1IHlev5HSmtfNuFOFfglW+rc8c3CbReV+PoinH/pkGBXowf
         9xfkNuGhUPLIMsZmPLzFDU/BUx7VcoeYB+nI8nTPXt/Xq9eG0r3c6bHJrH/5C9rRufRn
         ELjjVFBF7ZSSEKeWW+wDQKKVyroeQ5+oeA6X2WGrtHYPCKLLqSC/ehncAHHuqnxtMebT
         tQDkNzHnvMCsBae3FyWIQHooNE9xyU0hg2zZxj4j8G6uMLlJd3w6O0gb+yovTrTpmMZj
         HmhUuE2Mb9OQg6xRuz9aIt/z07KOMEYpjsTue1oMAPXnCHwZlCsqLa4RkFv5mIuGr7j5
         WU8w==
X-Forwarded-Encrypted: i=1; AJvYcCU1Gdt5GlFvwbng6cNcIcXx8uRK8QUbY58lvPOJEzk/ITD2orX48zepGqxM7LMgiSwHsPDgxIwA6FbdExCWTHtVOiZ4FcaTQNP2tQibGxo=
X-Gm-Message-State: AOJu0YzDUfYFexy2wC/mn1t5POnrBqsZ+lmMxPg9rNzWEa4sLm/tYgxD
	5Hrh7N7fcvvpstPhOIcOtIfZyxolC89ncwqu0QcHXNC8BUVtIbKtSJekAze6/w==
X-Google-Smtp-Source: AGHT+IGPt0CYADzORpmApfrMzt0iCjrpewhgiiew/HUx1RM0IEzMThHfiIei/VXmKnn5sksxNFbJ2A==
X-Received: by 2002:a05:6512:3ca5:b0:52b:c296:9739 with SMTP id 2adb3069b0e04-52bc2969770mr6331782e87.41.1718003738710;
        Mon, 10 Jun 2024 00:15:38 -0700 (PDT)
Message-ID: <afc347c0-ca2f-4972-b895-71184b1074ea@suse.com>
Date: Mon, 10 Jun 2024 09:15:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vcpumask_to_pcpumask() case study
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
 <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
 <1745d84b-59b7-4f90-a0a8-5d459b83b0bc@citrix.com>
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
In-Reply-To: <1745d84b-59b7-4f90-a0a8-5d459b83b0bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.06.2024 14:35, Andrew Cooper wrote:
> On 03/06/2024 10:19 pm, Jan Beulich wrote:
>> On 01.06.2024 20:50, Andrew Cooper wrote:
>>> One of the followon items I had from the bitops clean-up is this:
>>>
>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>> index 648d6dd475ba..9c3a017606ed 100644
>>> --- a/xen/arch/x86/mm.c
>>> +++ b/xen/arch/x86/mm.c
>>> @@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
>>>              unsigned int cpu;
>>>  
>>>              vcpu_id = ffsl(vmask) - 1;
>>> -            vmask &= ~(1UL << vcpu_id);
>>> +            vmask &= vmask - 1;
>>>              vcpu_id += vcpu_bias;
>>>              if ( (vcpu_id >= d->max_vcpus) )
>>>                  return 0;
>>>
>>> which yields the following improvement:
>>>
>>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
>>>   Function                                     old     new   delta
>>>   vcpumask_to_pcpumask                         519     485     -34
>> Nice. At the risk of getting flamed again for raising dumb questions:
>> Considering that elsewhere "trickery" like the &= mask - 1 here were
>> deemed not nice to have (at least wanting to be hidden behind a
>> suitably named macro; see e.g. ISOLATE_LSB()), wouldn't __clear_bit()
>> be suitable here too, and less at risk of being considered "trickery"?
> 
> __clear_bit() is even worse, because it forces the bitmap to be spilled
> to memory.  It hopefully wont when I've given the test/set helpers the
> same treatment as ffs/fls.

Sorry, not directly related here: When you're saying "when I've given"
does that mean you'd like Oleksii's "xen: introduce generic non-atomic
test_*bit()" to not go in once at least an Arm ack has arrived?

Jan

