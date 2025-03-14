Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B57EA60AB9
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 09:05:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913887.1319742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt02N-0006eX-Cz; Fri, 14 Mar 2025 08:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913887.1319742; Fri, 14 Mar 2025 08:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt02N-0006d5-9u; Fri, 14 Mar 2025 08:04:59 +0000
Received: by outflank-mailman (input) for mailman id 913887;
 Fri, 14 Mar 2025 08:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt02L-0006cz-OZ
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 08:04:57 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a5d35e-00ab-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 09:04:56 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so1073949f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 01:04:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df413esm4655981f8f.20.2025.03.14.01.04.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 01:04:55 -0700 (PDT)
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
X-Inumbo-ID: 04a5d35e-00ab-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741939496; x=1742544296; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=INYQTWrjJ0JckLejatxi8JK3cDGPUBzR74YDyrZfyhQ=;
        b=aIgVtyusa4/0yhSJs4+DBYcU1I8E0kNEqe59tV8w66pnjCjvfQEUin557AVd0P1FRN
         +91/yDbXSYkTd+zrL1vKZdrz3I42J//LXAE4ubQrKouIVXQWq7fLGD4uBxWWDhzBcvJV
         aqVTPT9R/EWglAOl15QCkVK6QTc6BfZCEp3Ros5C+5k8AgpwTJfVENdbXGZgfNeOWMh/
         AZ1CcLpQqHIhfMYWFczUKULD8LN1yMnEkRD76kF3WdfyYh+ChdcPAeN8/sIR8gycrMcy
         gWQXhX9PVi+RgLLPHhjdbjMJdVA/bC0Lk+FsNUmlyLTBn8TrNMrlPlvhgQ+wgOq7pmDQ
         y0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939496; x=1742544296;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INYQTWrjJ0JckLejatxi8JK3cDGPUBzR74YDyrZfyhQ=;
        b=nMbvdEo+rJuQJKfTD+iIMwaHe4Lx4xCNqHZptC5eS8pSJMgvR7VpKQwW8rX+myo7Y3
         BiQdZ2EM+4kxEKE6kJ70jL6qEbVQpKPzr/7Qy30iTwAr+ox0pkxBgqj9YM52r6+tUEl9
         He718sn0Ug6y8J7v0r1crb2iYEVWxUiedGlQ29+wOtmZKLUg1SQXBkh7pQ8cT3yYx9Xj
         ob3LPUd3GUGl4JTXPEI3fQDJJX1gzP/fNgScnXIPNPHzEavZ8Ab0koUG9ntT9yznCNDP
         U8ia86Wxt/9aLH2iD6o8NHkhJnckRPva9ZTRcOpdNpbh7u/4MuIeIdhKUWR6QKPa8Npk
         IDcA==
X-Gm-Message-State: AOJu0Yw/31jCHPwJ9i8Hy+2IaFnOSTb/7o6/3RsGea5lmmfk+kcYpBI6
	ExvrgkFxw2szvStbvOk0ymaXZbr3jgpW+5XEOYovcpxsevX4VdfoGRqSEClc8g==
X-Gm-Gg: ASbGncuKTQFmruZfUvCWUBpVO3lsMvPts2DzMUeYZNAuV3unDdzG1Z6viBCynWtgJ2I
	2e9JCItnTbG+Uc+X7JoTXjpiHdn20d0ronn/ftmy66S7eBPqTXp158ACLbDtxsssUZAv0IQdxK9
	ZFCGmjtPV5qYG2R6NOZgU0iwGfybf6uq+7sH0B0pO62Bw0LqglCoVktBv6ZBaLNX2X11ivLVZ+j
	LD8vWN7xBC9RrE9HXziYLh+j2v43Z5p2WPBSDnG5sqoFjJ0R6+0WmfaHIkk9HjcDYvliisUIvix
	/yqmj5Qkl8uDwbiWupc78JQgLEA/K5xRSJYku83i2h4KjQNbvR5nOkOHURsD1zM6T6tdfjoO52n
	CRzKM0yyqe21T8Q9e1SVrSFqeWSXxPw==
X-Google-Smtp-Source: AGHT+IEwjUGAbMdpvSfiE9eIYFDYIKEXUlxSzTPm5R1WHd+ZIMbs3NoQQcfsBNKlhIfknRGztefYoQ==
X-Received: by 2002:a05:6000:154d:b0:390:e655:f998 with SMTP id ffacd0b85a97d-3971ded3330mr1636691f8f.26.1741939496115;
        Fri, 14 Mar 2025 01:04:56 -0700 (PDT)
Message-ID: <9e619631-a7f7-4f69-aff8-13202d61b79a@suse.com>
Date: Fri, 14 Mar 2025 09:04:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] vpci: allow BAR write while mapped
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <20250312195019.382926-1-stewart.hildebrand@amd.com>
 <Z9MaZVMtI86eAmDJ@macbook.local>
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
In-Reply-To: <Z9MaZVMtI86eAmDJ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.03.2025 18:48, Roger Pau Monné wrote:
> On Wed, Mar 12, 2025 at 03:50:17PM -0400, Stewart Hildebrand wrote:
>> @@ -585,10 +601,31 @@ static void cf_check bar_write(
>>      {
>>          /* If the value written is the current one avoid printing a warning. */
>>          if ( val != (uint32_t)(bar->addr >> (hi ? 32 : 0)) )
>> +        {
>>              gprintk(XENLOG_WARNING,
>> -                    "%pp: ignored BAR %zu write while mapped\n",
>> +                    "%pp: allowing BAR %zu write while mapped\n",
>>                      &pdev->sbdf, bar - pdev->vpci->header.bars + hi);
> 
> If Xen now handles BARs writes with memory decoding enabled the
> message can be removed.  It's only purpose was to signal this missing
> handling.
> 
>> -        return;
>> +            ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>> +            ASSERT(spin_is_locked(&pdev->vpci->lock));
>> +            reenable = true;
>> +            cmd = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
>> +            /*
>> +             * Write-while-mapped: unmap the old BAR in p2m. We want this to
>> +             * finish right away since the deferral machinery only supports
>> +             * unmap OR map, not unmap-then-remap. Ultimately, it probably would
>> +             * be better to defer the write-while-mapped case just like regular
>> +             * BAR writes (but still only allow it for 32-bit BAR writes).
>> +             */
>> +            /* Disable memory decoding */
>> +            modify_bars(pdev, cmd & ~PCI_COMMAND_MEMORY, false);
> 
> I think if the guest explicitly avoids toggling memory decoding Xen
> should also to the same, and not touch the bit.

For Dom0 I'm inclined to agree, but for DomU-s it may be unsafe to do so.
(You may have meant it like this, but you said "guest".)

Jan

