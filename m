Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 300AC917F6E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 13:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748757.1156573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQeF-0002ML-ER; Wed, 26 Jun 2024 11:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748757.1156573; Wed, 26 Jun 2024 11:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMQeF-0002JZ-BB; Wed, 26 Jun 2024 11:17:11 +0000
Received: by outflank-mailman (input) for mailman id 748757;
 Wed, 26 Jun 2024 11:17:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sMQeE-0002JT-72
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 11:17:10 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0164f47-33ad-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 13:17:08 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4217926991fso55972765e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 04:17:08 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424c824eef1sm21468545e9.14.2024.06.26.04.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jun 2024 04:17:07 -0700 (PDT)
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
X-Inumbo-ID: a0164f47-33ad-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719400627; x=1720005427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jirmK4baIZ++d+1+5zn7DaxAv+wTxURz/bjD2mn5TdE=;
        b=NOtP8cqYWnDf4fVugvgSFaAplsgB1LIw/D1OQXym9y0eHd1GUR1oTRqa1jChHm+YN2
         Fpopx6pDkb8nvW773DUfHG4rSh/pQM3pDDRF8SUEsU3m8ZmZpCeOdPoKHbcxpwxX6oDU
         sExU7Os3lyKWUTA/q+nRcFFBjdf6L2ElL8UATnCbTi1kH8ZHhGQRBeeaWC9kR688aW5P
         noTTgFVpHg5O/iWoyRNvU2cej1QhSRYgYjNUgo3O3q7o3DLBCMXyHcRizKbZPbzuEiD4
         T3Wtss3c+h5PDlxrcHV4hLIagh7c6w2+IQeU4O4j//uTA7ubyuNocavjm+Ig34kgYJNM
         46xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719400627; x=1720005427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jirmK4baIZ++d+1+5zn7DaxAv+wTxURz/bjD2mn5TdE=;
        b=fYWGP7hgD10VMtt0u5+9uthFlR9plLaEe6o75Gqii4u4TKkMJ/q2SeDiLKywyKj36g
         VRze/S2PbHQ310FtfcsAudS/g35O6dObiT8+46UEkBQUiMDT7oX4qpjWw6DjvXpu35qO
         NuFnfIkYRPpYtvrcJpSsejOSXTwK5F2lSne32W8tqGXY5yna5+v7p9auZKxRsUUYj22i
         BmZ2bwjH6c1Uten/9y8dkUKNipagR/DXXArgLMZQh/7Idw5P41roUULr/9lpDMfKqmV9
         eS2jweDsk39PKvFnoNYSX2PBNEezAhUFhqwsSoVcc3VbqfN8Em/5KHPO9Pbl+OL6X8H0
         N9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFOOFAzPQ0FH5Y0wuzcUY8VYViJOqS9Zj8ax2VzmaEvuAFV+yaLBAo10gobDiM+6+kDxFJTjTOFZq6b19Tnv0qBQv03f0dpReaDoDaPGs=
X-Gm-Message-State: AOJu0Yyb1F+za/QGxsAlRdtTAIbeBxCyIlxVx2wd4y7xDgkQz3mZxoj9
	iUHes5d+2SR+mYlI5nDIcaO6osMWPKBTiUqcIgb15LLFd797dMDzInnBjTeJHxs=
X-Google-Smtp-Source: AGHT+IG11Pm/5VIV+typWr36t19hsEj+wM6CKEMbUyV7mflR3wnoTfqDDdw844eu8S0gEuSZiLPl3w==
X-Received: by 2002:a05:600c:5699:b0:422:384e:4365 with SMTP id 5b1f17b1804b1-4248b936414mr74443695e9.2.1719400627478;
        Wed, 26 Jun 2024 04:17:07 -0700 (PDT)
Message-ID: <174c3e25-5d4c-4874-b2c0-a4f962557c19@suse.com>
Date: Wed, 26 Jun 2024 13:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/sched: fix error handling in cpu_schedule_up()
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20240626055425.3622-1-jgross@suse.com>
 <e740e1be-7890-4e8f-879a-87043ac109c5@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <e740e1be-7890-4e8f-879a-87043ac109c5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.24 11:02, Jan Beulich wrote:
> On 26.06.2024 07:54, Juergen Gross wrote:
>> In case cpu_schedule_up() is failing, it needs to undo all externally
>> visible changes it has done before.
>>
>> Reason is that cpu_schedule_callback() won't be called with the
>> CPU_UP_CANCELED notifier in case cpu_schedule_up() did fail.
>>
>> Reported-by: Jan Beulich <jbeulich@suse.com>
>> Fixes: 207589dbacd4 ("xen/sched: move per cpu scheduler private data into struct sched_resource")
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with two questions, just for my own reassurance:
> 
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -2755,6 +2755,36 @@ static struct sched_resource *sched_alloc_res(void)
>>       return sr;
>>   }
>>   
>> +static void cf_check sched_res_free(struct rcu_head *head)
>> +{
>> +    struct sched_resource *sr = container_of(head, struct sched_resource, rcu);
>> +
>> +    free_cpumask_var(sr->cpus);
>> +    if ( sr->sched_unit_idle )
>> +        sched_free_unit_mem(sr->sched_unit_idle);
>> +    xfree(sr);
>> +}
>> +
>> +static void cpu_schedule_down(unsigned int cpu)
>> +{
>> +    struct sched_resource *sr;
>> +
>> +    rcu_read_lock(&sched_res_rculock);
>> +
>> +    sr = get_sched_res(cpu);
>> +
>> +    kill_timer(&sr->s_timer);
>> +
>> +    cpumask_clear_cpu(cpu, &sched_res_mask);
>> +    set_sched_res(cpu, NULL);
>> +
>> +    /* Keep idle unit. */
>> +    sr->sched_unit_idle = NULL;
>> +    call_rcu(&sr->rcu, sched_res_free);
>> +
>> +    rcu_read_unlock(&sched_res_rculock);
>> +}
> 
> Eyeballing suggests these two functions don't change at all; they're solely
> being moved up?

Correct.

> Also, for the purpose here, use of RCU to effect the freeing isn't strictly
> necessary. It's just that it also doesn't hurt doing it that way, and it
> would be more code to directly free when coming from cpu_schedule_up()?

Yes.


Juergen

