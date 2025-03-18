Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBDDA67842
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:48:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919450.1323893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZAX-0000uy-97; Tue, 18 Mar 2025 15:47:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919450.1323893; Tue, 18 Mar 2025 15:47:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuZAX-0000sU-6N; Tue, 18 Mar 2025 15:47:53 +0000
Received: by outflank-mailman (input) for mailman id 919450;
 Tue, 18 Mar 2025 15:47:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuZAV-0000sO-Gb
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:47:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5830397c-0410-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:47:49 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso4667729f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:47:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c888152dsm18203326f8f.48.2025.03.18.08.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 08:47:48 -0700 (PDT)
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
X-Inumbo-ID: 5830397c-0410-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742312869; x=1742917669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xvFP1VOQ0uJ3OoXJHEUvYPg0Uqb03b0gd96RBDNksgM=;
        b=aFJ3tVBrzxLZvjT70PA9NbLsFQPGvHK8qua7S15udTW4tt4djN6AEBqWMM6yCp6GaK
         uiDOcN1HuVWzwhaBJ03yl++q8xULavvKq6kXWbb7BqE0T7oTY+iyQa2zzNUTLxqnB/E9
         bS6PwUko4VvC7xloqO5NMveF5R3fAN3emmVMQt1BahWkjR5JcrhQ5iLFjuuGILa9RAYW
         WvO4CH0oFkiwmlU9UsRoY9xWXe0mV8dKFmfmvLHTs+rVwU37Tr3jPdQE9mkKKaCrZ6tF
         QUlASsfkqGc5sKG8GeINdKEJ3tWewH43HHHCTGldGo6rU5rBmGzZpNkFlZZBaKqEtGBO
         AGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742312869; x=1742917669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xvFP1VOQ0uJ3OoXJHEUvYPg0Uqb03b0gd96RBDNksgM=;
        b=LLg6jgH254umZLUv/3BIa32IBuJwB0DmEZhBV6tRCOvVLsiEkarvp9mZsNI6I/9VEN
         fr93rW7Yrq3uAf+3W6bVg6JlK/6E7bbvYR+wB+lxaT7YWWbexbYxFUEaRkx5KPVpd5WK
         IbqmNFbs4bwN/qfRz+4TvDxnvL9sTp7G85D82MkrGu9rJ2Weuo9F1qLD67rOtgBXyHDB
         +aCM8uS9VL4p68LD6uHBO0CCajF1Oknnvv/eJi0kYIhXkNX8rNABRoBVPg/rSqP+1z5r
         kndwhCbqrOjUUQUkNftHQA5oY0KFOlQol8OUDzOr6eEgW2HavPEPcD5H6Tklf3NyfLGk
         5W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcwnIr9dZvFzgVfC2oBu+o/E507JjHq7el57jYPs9uQLQCpg4JaqZO++BDapKcq19bBT0q625oU78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyY3YmsbzcevKp8XvbNRFFt/yApP7ILvLOeX2A5RS1Nede97m7p
	5/g0Qs5O+l0tyiPtp+gLZoorJKYBSf1wtqiWx3dCBCThj9YQ39q1YzUR0kfebQ==
X-Gm-Gg: ASbGncuPH8UvlDr6u8HZTGCIDUhC1ig7BxK3711O8HKTiGQHkWMJLaUUk8/bOpReNAD
	Es5Y4LxvNkdSb2LYoUy+mdk/Xot7Uz/JR53//agpFYDb0ZEuhmEbAh6Q+ddrHj4ov+zAOPOwyx5
	pOnVUI/SlurzHqL3ujss+fk9E2ylYJ36I9lbJoe/BTTYmroAWqpET7u/bL7WuQLJBI1O7O4JIiE
	CI7eYAHK2mDdrqAIIBUnlVHRlpABhWtvmcTMQ53dUfEru5TYaZDl3ZCNiVnhSCOhkWJPDvtN52F
	YL+wW61I/mjI1TAGNvOVBt/H9e9ccQrBuTqk3XlV4SKs5wAHzqrslRgqOAjWgljAmbKoOKuCbNv
	PVRh20LoHbG0CMFpHJaKMfuQvRCr0k8s57x14wh6a
X-Google-Smtp-Source: AGHT+IE2FsX+ai/N/HxGyKmS6yM/CfSX+9ICe0NwwGDvmKimh7Uei4qoXpnJxugOLnRiBYOTV0wwvA==
X-Received: by 2002:a05:6000:18ab:b0:38d:dc03:a3d6 with SMTP id ffacd0b85a97d-3996ba46aeemr3654770f8f.4.1742312869042;
        Tue, 18 Mar 2025 08:47:49 -0700 (PDT)
Message-ID: <699ce0e4-93bb-484a-8ffa-881adaa9ccd5@suse.com>
Date: Tue, 18 Mar 2025 16:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arinc653: move next_switch_time access under lock
To: Nathan Studer <Nathan.Studer@dornerworks.com>
Cc: Stewart Hildebrand <stewart@stew.dk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d8c08c22-ee70-4c06-8fcd-ad44fc0dc58f@suse.com>
 <SA1P110MB1629AA9DFAFE89C65248401DF4DEA@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
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
In-Reply-To: <SA1P110MB1629AA9DFAFE89C65248401DF4DEA@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 16:39, Nathan Studer wrote:
> 
> On 17/03/25 05:31, Jan Beulich wrote:
>> Even before its recent movement to the scheduler's private data structure it looks
>> to have been wrong to update the field under lock, but then read it with the lock
>> no longer held.
>>
>> Coverity-ID: 1644500
>> Fixes: 9f0c658baedc ("arinc: add cpu-pool support to scheduler")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> The Fixes: tag references where the locking was added; I can't exclude there was
>> an issue here already before that.
>>
>> --- a/xen/common/sched/arinc653.c
>> +++ b/xen/common/sched/arinc653.c
>> @@ -579,6 +579,9 @@ a653sched_do_schedule(
>>       */
>>      BUG_ON(now >= sched_priv->next_major_frame);
>>
>> +    prev->next_time = sched_priv->next_switch_time - now;
>> +
>> +    /* Return the amount of time the next domain has to run. */
> 
> This could be pushed up to immediately after next_switch_time is set, but here is
> good enough.  However, did you mean to put the comment after the assignment
> separated by whitespace?

Oops, no, certainly not. It was meant to go ahead of the assignment.
I must have been benighted ... Moved locally.

Jan


