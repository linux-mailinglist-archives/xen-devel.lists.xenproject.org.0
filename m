Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A338A9063D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:24:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956337.1349783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53gy-0003BZ-Ow; Wed, 16 Apr 2025 14:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956337.1349783; Wed, 16 Apr 2025 14:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53gy-00039x-M3; Wed, 16 Apr 2025 14:24:44 +0000
Received: by outflank-mailman (input) for mailman id 956337;
 Wed, 16 Apr 2025 14:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u53gx-00039r-EV
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:24:43 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89a53427-1ace-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 16:24:42 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-39ac9aea656so7019054f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 07:24:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eaf43d046sm17670763f8f.63.2025.04.16.07.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 07:24:41 -0700 (PDT)
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
X-Inumbo-ID: 89a53427-1ace-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744813482; x=1745418282; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9I08MHo288zprjOCbkzZa4+2BtbydBvcXk6zt6MOMj4=;
        b=UTazrBbeS63RX8T8C+ufvwOqTQZE9ULJjlpgb+ROMf8DNKc3fpszJlYbIknDQHTNOK
         rZzKEJ7JxCKBSkcnRUGGAl21TRrFNh8iuUfC2cqE1DkHbV3yXDTXBihepaqsemC09654
         7OLMeVBJVJzwb40Qhpf9Qe73heyfFisRiRgTWPNrCW+uiZdBCqF835awbW2/fwtSqbMV
         7qA/Os/Q5DdgRAq6fnugkrKliLy6aCd8PkJ0NnKu15TxrbZH+olp3SDmexM5szoSL+7p
         jSXPf8ohsprNpKRqn+JxTjdYEAD08fpHajUFPXzlNv8emnz0p9ywSbips75hNqwAfM9y
         svPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744813482; x=1745418282;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I08MHo288zprjOCbkzZa4+2BtbydBvcXk6zt6MOMj4=;
        b=pmKvx/aIxWjRwFT/IKehqdANL87k/8NZN0R17nzT2vjyxfyAOHFntI07Q8zdHjp6Pb
         d3Cg/IRDQnUrdi48NAqja8wyy4NMLgPpzWt0O+uwjhDoWNDugsNDj21MOpIjcK6IZsAO
         kz+zvDwz0mv0I7Wqvp8g8PslyjEL3G9daHLmqq0LrK15Y2TrmoMH4J8/s2C8Ny4Tdy8S
         0xxkMRkg6tOKfwn/L/IkljemFfoQAv8t9OKbJaHbvrG0hJqrH2M+uVty+liHATkfgPBH
         LXhG6K1rQqAzquUnUM4Fiqqad0LSVa5XbxeFw2550kW/S+Rw3Y/i8DgzLNUjpnrJ/fKe
         SgzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSZJXSwvRLzWn8znT+xwdEG5JLIeMukW0dpluzZLPyTZ0UNCDDupGSrmQH1N3syxh8C5trFzAXj+Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzncmhES24OpQNxik4FGsnab1BlA3FTPBnoKE8mw1aRErYQ2U1J
	SOXwr69xjOj7uxlz0zViiGVo0pQ/gIQ61wqxyIQYpZLLzVyGmHaBQsO5hzWJlg==
X-Gm-Gg: ASbGncuM7keb9yzuy0FUR1BnoFk2heVhpRSyXAz2HkOfAKos8BYOv8vPlfXqURWn92P
	eZpnUR3q8HO7In5bXffxq/zaSDKAml0xbHdGrn6cI1De+NavGc36D1Z+qydRUYUroENDVEwUlBp
	ZrgVHCiiLvDN42LXB2JXcuO2sYesmA7mlJmbDGwjNSI5Uj+o5i0H063dIHZQ7QzxsP2nHDpkQmI
	aoqJPWMHJFWZ2+Rs1D7ykgleUGf/jIiJsCoNDmUJpoIeuWNClDLbrnX4rwTiQHhnyMlc/kmV1Ie
	hQMPHQY32BRmtqBA8rrFzH4fEg2TOqbIEP7sb5cIkblhaw28PKxU2ZAq56EJV87FV+lk/aMLPbk
	PNiT1yfoioczw4jzIW+5+LzLsEw==
X-Google-Smtp-Source: AGHT+IFRNNG09xXQnvShTTfii99I1t+gHFsuqFVLj5e8IBprBNTuXvBGfNy8d5CpX2FDq4Vdk9jKHw==
X-Received: by 2002:a5d:64ee:0:b0:399:737f:4e02 with SMTP id ffacd0b85a97d-39ee5b9d91bmr2121769f8f.39.1744813481938;
        Wed, 16 Apr 2025 07:24:41 -0700 (PDT)
Message-ID: <eee96b07-b927-4148-a586-1e9587e1beed@suse.com>
Date: Wed, 16 Apr 2025 16:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
 <82fe6290-ea16-4e4f-8be4-76b9b624e398@apertussolutions.com>
 <c9290102-d29d-4c54-9052-995e960e4ea0@suse.com>
 <e78a9dcd-3fa3-4c66-860d-3d2b8206b67c@apertussolutions.com>
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
In-Reply-To: <e78a9dcd-3fa3-4c66-860d-3d2b8206b67c@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 16:09, Daniel P. Smith wrote:
> On 4/16/25 09:38, Jan Beulich wrote:
>> On 16.04.2025 15:32, Daniel P. Smith wrote:
>>> On 4/10/25 07:57, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>>>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>>>>>                bd->domid = (domid_t)val;
>>>>>                printk("  domid: %d\n", bd->domid);
>>>>>            }
>>>>> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
>>>>> +        {
>>>>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>>>>> +            {
>>>>> +                printk("  failed processing mode for domain %s\n", name);
>>>>> +                return -EINVAL;
>>>>> +            }
>>>>> +
>>>>> +            printk("  mode: ");
>>>>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>>>>> +            {
>>>>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>>>> +                    printk("HVM\n");
>>>>> +                else
>>>>> +                    printk("PVH\n");
>>>>> +            }
>>>>> +            else
>>>>> +                printk("PV\n");
>>>>> +        }
>>>>
>>>> My prior questions here remain: What's the significance of
>>>> BUILD_MODE_ENABLE_DM when set alongside BUILD_MODE_PARAVIRT? What about
>>>> any of the other bits being set?
>>>
>>>   From boot-domain.h:
>>>                                             /* On     | Off    */
>>> #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
>>> #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
>>>
>>> The logic says, if BUILD_MODE_PARAVIRT bit is not set, thus an HVM
>>> domain, check if BUILD_MODE_ENABLE_DM has been set. This is determin if
>>> the domain is what the toolstack differentiates as either an HVM or PVH
>>> domain. As you should know, there is no case of a PV domain requiring a
>>> backing device mode (DM) domain. IOW, BUILD_MODE_ENABLE_DM is only
>>> relevant to an HVM domain.
>>
>> And hence should (my conclusion) never be set for a PV one.
> 
> Yes and?

And it being wrongly set should be rejected, rather than silently ignored.

Jan

