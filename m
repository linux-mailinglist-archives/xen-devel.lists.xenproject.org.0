Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DEA86AFCD
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 14:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686597.1068801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJbo-0004mj-GN; Wed, 28 Feb 2024 13:04:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686597.1068801; Wed, 28 Feb 2024 13:04:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJbo-0004l8-Ct; Wed, 28 Feb 2024 13:04:28 +0000
Received: by outflank-mailman (input) for mailman id 686597;
 Wed, 28 Feb 2024 13:04:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfJbn-0004l2-Fz
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 13:04:27 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5ddefb1-d639-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 14:04:25 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5655c7dd3b1so1590576a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 05:04:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jx11-20020a170906ca4b00b00a3f480154a3sm1828200ejb.65.2024.02.28.05.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 05:04:24 -0800 (PST)
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
X-Inumbo-ID: e5ddefb1-d639-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709125465; x=1709730265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F4c1l7EwRkTAAhcVJbRO5x9wRcKnN4wAaQmkchFWJoQ=;
        b=IUWM8bN8myae8/2B1LLExvev0bgEpagLqxLr7HEAdUnhY4YpYX7+Ec2s808gnlFd/I
         BOOU/NI19UtgYVc4r+K9MRnTHj/sOQ77YBs8QU3XNRKDCLtzLqhkUSxgffc05KkWNZ82
         HVPViJfOrB/JnPaAijAogHtpgSlJrpgPzuesKJt4QdG5nYjk4jcjKAtqYP0pmnfvyMrD
         sdP8N/bnGveihHwdW64af1LU5eAjHDKVjiDN3M5n0PEawCer12Zyv3BndAjAWghsr4CX
         M7B8I3/RM1c8DtAsDROeXsw5kMUGQ1EVDPxKNYrBpyGzgo9bHUYgPAa5LNpjPoZ9X6S1
         394Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125465; x=1709730265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F4c1l7EwRkTAAhcVJbRO5x9wRcKnN4wAaQmkchFWJoQ=;
        b=WEEE3cHt1Ob8FSotDLGZ1hy7Kfb118NSeWxBaZ4XiTeMAs/yck4u8LVPEcuE3EHtJR
         Ci/H1OzCVX4qXW7N5qKFrAcUU/aNDiYrUD4G+3g8fuRTudv2ngTNolATzTru+dry4bqV
         X1kC8NW9P35OB85RoBZPTgkGSL8HDcPEZbBdjdwfUyhDOU6O0esb2u6KkGT/JQpTwoAr
         gG0qxeofK1hIkE1XieHgxZnGeco7Ak0DMvUJ8iEyKYPuWJKUzIm/gku+4oh6ekTcL1Lq
         tmkr+LcD1SE/EhOmKOv+WVJNc8rDKQupKY5pTQUz4ZVCMDMx1Ntozxh+4LSvzbog0g+V
         ejig==
X-Gm-Message-State: AOJu0YygD8TBpNxmSgYp71NbnMkkobMOdfnDIL3b/WvGO8B42KV0FiSi
	rom9HYkxYJE+Awr6cBagKY+eR7jcfPxKdWhh7grHxD9a64g/nNEAVrZitzFSGQ==
X-Google-Smtp-Source: AGHT+IFJ5qXRpw9LURj7SzE9CzWlF5Db2zX+HB/mIyRJvu85ptcaDkmOUAEoF5LAyypvRjqlQ4buBg==
X-Received: by 2002:a17:906:a05a:b0:a3e:69ff:141f with SMTP id bg26-20020a170906a05a00b00a3e69ff141fmr2127953ejb.33.1709125464856;
        Wed, 28 Feb 2024 05:04:24 -0800 (PST)
Message-ID: <b174757c-8463-4561-ae95-a5791d33080b@suse.com>
Date: Wed, 28 Feb 2024 14:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: New Defects reported by Coverity Scan for XenProject
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <65df054dd791_2895d52c84469bd9989838e@prd-scan-dashboard-0.mail>
 <27fad7c4-905b-4181-9882-f383eb194032@citrix.com>
 <d81f78a8-3e04-4fba-95fc-3b602ee3a740@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>
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
In-Reply-To: <d81f78a8-3e04-4fba-95fc-3b602ee3a740@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 13:19, Andrew Cooper wrote:
> Take 2, hopefully with Stewart's correct email address this time.
> 
> ~Andrew
> 
> On 28/02/2024 12:17 pm, Andrew Cooper wrote:
>> Not sure how well this is going to be formatted, but there's one new and
>> potentially interesting issue found by Coverity.

To be honest I didn't consider this interesting at all, but instead a false
positive due to limited insight that the tool has. But maybe I was wrong
and you see something I didn't see? vpci_process_pending() is vCPU-local
(run from the guest resume path), and hence there simply are no two threads
who want to look at the field. Storing NULL into it is merely a kind of
progress indicator, relevant to the given vCPU only.

Jan

>> ----8<----
>>
>> New defect(s) Reported-by: Coverity Scan
>> Showing 1 of 1 defect(s)
>>
>>
>> ** CID 1592633: (LOCK_EVASION)
>> /xen/drivers/vpci/header.c: 229 in vpci_process_pending()
>> /xen/drivers/vpci/header.c: 189 in vpci_process_pending()
>> /xen/drivers/vpci/header.c: 239 in vpci_process_pending()
>>
>>
>> ________________________________________________________________________________________________________
>> *** CID 1592633: (LOCK_EVASION)
>> /xen/drivers/vpci/header.c: 229 in vpci_process_pending()
>> 223 224 /* Clean all the rangesets */
>> 225 for ( i = 0; i < ARRAY_SIZE(header->bars); i++ )
>> 226 if ( !rangeset_is_empty(header->bars[i].mem) )
>> 227 rangeset_purge(header->bars[i].mem);
>> 228
>>>>> CID 1592633: (LOCK_EVASION)
>>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>>> fields correlated with "pdev" may be lost.
>> 229 v->vpci.pdev = NULL;
>> 230 231 read_unlock(&v->domain->pci_lock);
>> 232 233 if ( !is_hardware_domain(v->domain) )
>> 234 domain_crash(v->domain);
>> /xen/drivers/vpci/header.c: 189 in vpci_process_pending()
>> 183 return false;
>> 184 185 read_lock(&v->domain->pci_lock);
>> 186 187 if ( !pdev->vpci || (v->domain != pdev->domain) )
>> 188 {
>>>>> CID 1592633: (LOCK_EVASION)
>>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>>> fields correlated with "pdev" may be lost.
>> 189 v->vpci.pdev = NULL;
>> 190 read_unlock(&v->domain->pci_lock);
>> 191 return false;
>> 192 }
>> 193 194 header = &pdev->vpci->header;
>> /xen/drivers/vpci/header.c: 239 in vpci_process_pending()
>> 233 if ( !is_hardware_domain(v->domain) )
>> 234 domain_crash(v->domain);
>> 235 236 return false;
>> 237 }
>> 238 }
>>>>> CID 1592633: (LOCK_EVASION)
>>>>> Thread1 sets "pdev" to a new value. Now the two threads have an
>>>>> inconsistent view of "pdev" and updates to fields of "pdev" or
>>>>> fields correlated with "pdev" may be lost.
>> 239 v->vpci.pdev = NULL;
>> 240 241 spin_lock(&pdev->vpci->lock);
>> 242 modify_decoding(pdev, v->vpci.cmd, v->vpci.rom_only);
>> 243 spin_unlock(&pdev->vpci->lock);
>> 244
>>
> 


