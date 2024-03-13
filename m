Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE2E87A8CF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 14:56:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692443.1079583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP5g-00069a-M2; Wed, 13 Mar 2024 13:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692443.1079583; Wed, 13 Mar 2024 13:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkP5g-00066j-JG; Wed, 13 Mar 2024 13:56:20 +0000
Received: by outflank-mailman (input) for mailman id 692443;
 Wed, 13 Mar 2024 13:56:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bR7k=KT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rkP5f-00066b-AZ
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 13:56:19 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7672833a-e141-11ee-a1ee-f123f15fe8a2;
 Wed, 13 Mar 2024 14:56:17 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-568107a9ff2so1212088a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 06:56:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ef9-20020a05640228c900b00566a461e1ecsm4971924edb.73.2024.03.13.06.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 06:56:16 -0700 (PDT)
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
X-Inumbo-ID: 7672833a-e141-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710338177; x=1710942977; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EsHsFym6fkccRe/hxHv3bP5aNLujxgCmX+9+DffSdb4=;
        b=PfSC5f2pYT+C996lJpLFU6Heo8GaGATzit3M4Ev20PbVss8TQsyhRo7RP24U3Jd7fO
         m9nyA9Q4FTvBkfhPV9ciWYnoUXAFROJrQMyDOLID1ofFfXZn3py50D1sbAyvpFSV3F2r
         OEPLHqCpf+AkcFXHmT8TWAzZQSQUxV8gM9HleYX998RQAZHcSFHGsBPjtADu09+MOYH9
         mXuuhzW5ih1Vr6siet/bFyR9D0K9UiQrCmajQFvM2px0wgJtJyIibkxJB/+Cebk+YXiV
         7BbmSx7MxWAQt+Jw5Dn4YQLpiRwnInx+76WF+i+hFtvNMgtGsu449ix/UzqLF0EvXz27
         2AaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710338177; x=1710942977;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EsHsFym6fkccRe/hxHv3bP5aNLujxgCmX+9+DffSdb4=;
        b=N5bZkgUH8lZHrFem5clOutuTOfW21InDvX2s6WcalU6lwBCa3hAjsMQWvafoKMk5/C
         tftvtV5Go5wex+NvCnbi6o8NyRGbPAIMNlDhMNi2AFGrg/llVSlCVk0+fQcGcRnHAbSa
         oDOL5AnjTYwfF8gUi0rlkFUa5+H9ksx+LJfg5OUkJRvNUz5kILOiycKi0dlB++D40+kR
         YW3ImAXYjbb0P7MlrqleX5jUF0tK8dq5TUtFBoN1vOcXOqU2VjymI6aVT1CUBLsQ1eP9
         hb01LI87+xvHlbm8cyLApgnaCd5iCKr23IKs7p27ycHbWUpSWyqAxqTxUTknE/akUHw+
         ZQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCXXW30UfHI9vQp8sDyMJ9Pl+zzpeoCPEHMvmdEKku+8FWHlIyAiEeoUqfIWUoPxG9G/q3ilu9/B03wGX/0CWfbpEBA/FGYQTZbXfULc4uE=
X-Gm-Message-State: AOJu0YypTJlwpp6nroSspJtgxez4kfjL9GFgnZ80Lb2SAOpGETcp8IBl
	MlJR1MaAMMId4uE8UBVDxwkm+7iJE0DwtxA6fcMWQr39E4rfE0aLJ6Q2no1zC/aw1Y64Eocvulc
	=
X-Google-Smtp-Source: AGHT+IFCvPH9+bvQH/5BsXvw+GeVsbVJ+omncdx+lQFMJuRZhdF+DstzC+zfbU6frmuFANkWw3j8RA==
X-Received: by 2002:a50:a457:0:b0:566:47dc:47e3 with SMTP id v23-20020a50a457000000b0056647dc47e3mr2263545edb.15.1710338176694;
        Wed, 13 Mar 2024 06:56:16 -0700 (PDT)
Message-ID: <02ff2b83-524c-497d-8042-afddaf684401@suse.com>
Date: Wed, 13 Mar 2024 14:56:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/svmdebug: Print sev and sev_es vmcb bits
Content-Language: en-US
To: Vaishali Thakkar <vaishali.thakkar@vates.tech>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <cover.1710149462.git.vaishali.thakkar@vates.tech>
 <0e688a18a97e495352e2b08cb7634abbc238da1b.1710149462.git.vaishali.thakkar@vates.tech>
 <708aad8c-cf06-4a1d-b2d2-d4405cc19213@suse.com>
 <04e6cbd2-4235-4972-9f14-dd96ca3a3515@vates.tech>
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
In-Reply-To: <04e6cbd2-4235-4972-9f14-dd96ca3a3515@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 14:54, Vaishali Thakkar wrote:
> On 3/12/24 09:05, Jan Beulich wrote:
>> On 11.03.2024 13:40, Vaishali Thakkar wrote:
>>> While sev and sev_es bits are not yet enabled in xen,
>>> including their status in the VMCB dump could be
>>> informational.Therefore, print it via svmdebug.
>>
>> Yet there are more bits there. I'm okay with leaving off printing of
>> them here, but it wants clarifying why some are printed and some are
>> not.
> 
> Well, the idea is to print the bits that are either enabled or has WIP
> to enable them. (e.g. sev and sev_es) I didn't include other bits as
> I'm not sure if there is any WIP to enable them. Particularly including
> sev and sev_es is useful for us while working on the enablement of it.
> 
> Does a commit log like the following makes it clear for you?
> 
> " Currently only raw _np_ctrl is being printed. It can
>    be informational to know about which particular bits
>    are enabled. So, this commit adds the bit-by-bit decode
>    for np, sev and sev_es bits.
> 
>    Note that while only np is enabled in certain scenarios
>    at the moment, work for enabling sev and sev_es is in
>    progress. And it's useful to have this information as
>    part of svmdebug. "

I think that's sufficient, yes.

Jan

