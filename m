Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9008C7998
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 17:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723466.1128333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dAt-0005yM-7g; Thu, 16 May 2024 15:37:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723466.1128333; Thu, 16 May 2024 15:37:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7dAt-0005wL-4x; Thu, 16 May 2024 15:37:43 +0000
Received: by outflank-mailman (input) for mailman id 723466;
 Thu, 16 May 2024 15:37:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O3ow=MT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s7dAs-0005wF-EJ
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 15:37:42 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b50c8b8-139a-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 17:37:41 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a5a89787ea4so329887566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 08:37:41 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015f7sm1011801766b.146.2024.05.16.08.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 08:37:40 -0700 (PDT)
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
X-Inumbo-ID: 3b50c8b8-139a-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715873861; x=1716478661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26bFaUae7TNhu5UW1vOw6adqNZFB5Qaki6RPRXQQBPA=;
        b=EGMys0x30O/2Zyn/sNOoTB2ufSJ3uV5fK4oayL5f5ZAq6XQpH+3EEI/ZAeRLPZeRMM
         QhrmBWxfBJfJkKhsYisCUmHqMgfrcmLSnmzHut7OPIp04WfeMtW2HFaQQQd7kGsQQXZA
         gQiA7k7eJaqn81f+RxuO3/hx3tEbjNP4mLblk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715873861; x=1716478661;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26bFaUae7TNhu5UW1vOw6adqNZFB5Qaki6RPRXQQBPA=;
        b=Qw+DFWvqYNMd28RN+JZ7sdhkqfExHmjkhdU/7r9UooduyUCzyOQ10I1Z7ScxS7X1fO
         SQL7I5T56/H8mEEx3m6+P+PvPMtmilNNaKRZdJn6tey4wL9rQaCXtsoUne3pHRL+7Bqc
         YzVsexRFlSWTUKL+1q1VPiEgsJ+kwhyH9i33kWUMDEfiuUdR2kLLgsfzs8URQ0ffHbDc
         lah9LkiKsBOuhXXi18pRcsqlRMCprLleUrxy2ZLd4SdP3PeskW0uLOx95gvW/y084B0c
         POZWuOfHIruHWTwftally/hPfagfYfchrFVGxcs8r2DpUARVn96y280WNMvjIF+QRk+T
         aplw==
X-Gm-Message-State: AOJu0YzmAeUP+FPmPwnKeep0oIuAn52L9NOPVRG+8sr221PceARBXxm3
	EV898LMgQ5MnsRU+1LSwMmHM9VHh5Gb1x69tf8Cyulyu+BEdSk/2BMRukz35hb0=
X-Google-Smtp-Source: AGHT+IFDhaYurIZFhAK7+Eyp/XaFNz3itMwvfVT6n9EppRrHo3MobI8PzBuABkP8NGHHQRt7VyMYzw==
X-Received: by 2002:a17:906:f111:b0:a5a:28cc:ff85 with SMTP id a640c23a62f3a-a5a2d58545amr1244604566b.28.1715873860899;
        Thu, 16 May 2024 08:37:40 -0700 (PDT)
Message-ID: <dc37751e-cf68-42af-909a-ad9a9ec3833f@cloud.com>
Date: Thu, 16 May 2024 16:37:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tools/xg: Clean up xend-style overrides for CPU
 policies
To: Anthony PERARD <anthony.perard@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>
References: <20240207173957.19811-1-alejandro.vallejo@cloud.com>
 <20240207173957.19811-4-alejandro.vallejo@cloud.com>
 <2b4b05d1-154d-43b8-a29b-aa99332a8eeb@perard>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <2b4b05d1-154d-43b8-a29b-aa99332a8eeb@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/04/2024 15:42, Anthony PERARD wrote:
> On Wed, Feb 07, 2024 at 05:39:57PM +0000, Alejandro Vallejo wrote:
>> diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
>> index 5699a26b946e..cee0be80ba5b 100644
>> --- a/tools/libs/guest/xg_cpuid_x86.c
>> +++ b/tools/libs/guest/xg_cpuid_x86.c
>> @@ -772,49 +616,45 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
>>               * apic_id_size values greater than 7.  Limit the value to
>>               * 7 for now.
>>               */
>> -            if ( p->policy.extd.nc < 0x7f )
>> +            if ( cur->policy.extd.nc < 0x7f )
>>              {
>> -                if ( p->policy.extd.apic_id_size != 0 && p->policy.extd.apic_id_size < 0x7 )
>> -                    p->policy.extd.apic_id_size++;
>> +                if ( cur->policy.extd.apic_id_size != 0 && cur->policy.extd.apic_id_size < 0x7 )
>> +                    cur->policy.extd.apic_id_size++;
>>  
>> -                p->policy.extd.nc = (p->policy.extd.nc << 1) | 1;
>> +                cur->policy.extd.nc = (cur->policy.extd.nc << 1) | 1;
>>              }
>>              break;
>>          }
>>      }
>>  
>> -    nr_leaves = ARRAY_SIZE(p->leaves);
>> -    rc = x86_cpuid_copy_to_buffer(&p->policy, p->leaves, &nr_leaves);
>> -    if ( rc )
>> +    if ( xend || msr )
>>      {
>> -        ERROR("Failed to serialise CPUID (%d = %s)", -rc, strerror(-rc));
>> -        goto out;
>> +        // The overrides are over the serialised form of the policy
> 
> Comments should use /* */

Ugh, yes.

> 
>> +        if ( (rc = xc_cpu_policy_serialise(xch, cur)) )
>> +            goto out;
>> +
>> +        if ( (rc = xc_cpuid_xend_policy(xch, domid, xend, host, def, cur)) )
>> +            goto out;
>> +        if ( (rc = xc_msr_policy(xch, domid, msr, host, def, cur)) )
>> +            goto out;
> 
> What if `xend` is set, but `msr` isn't? Looks like there's going to be a
> segv in xc_msr_policy() because it doesn't check that `msr` is actually
> set.
> 
> 
> Thanks,
> 

OOPS! Yes, msrs was meant to have the same check I added for
xc_cpuid_xend_policy. Will do.

Cheers,
Alejandro

