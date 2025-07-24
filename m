Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB3B109CB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 14:00:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055858.1424162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueucH-0007pg-Ma; Thu, 24 Jul 2025 12:00:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055858.1424162; Thu, 24 Jul 2025 12:00:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueucH-0007n6-J5; Thu, 24 Jul 2025 12:00:05 +0000
Received: by outflank-mailman (input) for mailman id 1055858;
 Thu, 24 Jul 2025 12:00:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueucG-0007W2-7u
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 12:00:04 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9cc6202-6885-11f0-a31e-13f23c93f187;
 Thu, 24 Jul 2025 14:00:00 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a4fb9c2436so471060f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 05:00:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458704aaf20sm18995615e9.0.2025.07.24.04.59.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 04:59:59 -0700 (PDT)
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
X-Inumbo-ID: b9cc6202-6885-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753358400; x=1753963200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CLcvusgpwJ3QnDbbnXsJQ3i/fwQRfb4k4yTPRjriUaY=;
        b=TQNsloQ/z+wo3tttnjQIKty2bNYVrDwMjA08w1D96LdWk5nMQk5ehZHtvUKORHmE3q
         6XDffEDZBP357wL4ihCs/23BBem8g6TbeAAnexNQt6Am1H4j+tehl25EGc8nbo8NGYJ5
         77U2fmorczbnciMEDrLOXw18nDnaWcLC7EqvIlEN0TGUEEiU/q/02/1p98r9v6qb+Tyr
         PTT6DmiB0/XBGdHMqDNT9RQKHSJEsAU1QayRbq5b6yPgQBiFhX138LZFgo0WTLCJVuEs
         T8pB9UpH32IUFCxLbo0/isC1SfHZyPDEa70+aTdcluBL9DlP3GgFb3m9oqejOjnTu/n3
         3YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358400; x=1753963200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CLcvusgpwJ3QnDbbnXsJQ3i/fwQRfb4k4yTPRjriUaY=;
        b=oMNXzoZo0dlKTXcAAi9Ncbk6Tx+K+Ps+KGW9rqtutNMHpCk+vYew1Suka8AXuk/iso
         ZI+K04U7KhDNGa3p00CO7pQKJrcj1NdtptmLwAU/NTneCQIL91S17opN6kxTx1D2nQxg
         rb1nI6BCt2MWAOhKeuNoj5V9R9DHPGQNa0Kxjecm5LSHgOg+nMx36RDwmPAyzw7U6oxn
         ynESx9y0pVIA+X4c0Pl6Oe9EAXHDYmUYn0LT+EIU2AoQvKDRKz5m2cT7O86+7Ao6ZVd6
         KginZ0Jrn/EN76rcpQl6EKdDOxtYqPqlUUhJbbpCWBBKt0jJek4B5XLh+i4gFr556ohV
         sh5w==
X-Forwarded-Encrypted: i=1; AJvYcCXzuV4dzXuRdVCDFTpYybl/Aa6U56zSeHYiK97eUi0Vgx0HYqY+/jBDB4xabOjuPZTuHUTJynTCgkw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0QFOlELEdKEbgTJ9R+mZVXgi5k+T0a8yh3RRM74qjVmZWWkuH
	HZ0PZh4H2wgbf5o4vSjc59JgHHmMIvTxMca7oz8ksT9eABoA6Q/e3fTsmRfMlcpUJQ==
X-Gm-Gg: ASbGncvdphCDrErt4HOj9eUTp2+89EkJYOIN9+dCvzb4Uttk7by5/XggxJXHaPsV5n/
	Rs/nNx40teyZ3a3gNbd4g5JRJRFY647RQquzRWEIB8Tyk3JjYxt+63UTn1UnyEeh5EAVjKYvrDd
	P7f+bTB4/us6kXF9FLd1N3SeEAwQD5GNe8FkVWONHOp/9tqIxwAKNc7JqWnWP49/FSSoCoh9aQb
	zOly6KTj/QBPAB7Y/aJXqpxVHyGfuxwhUemxJLONPsG3tmX9N/fASN0t2Fd9FzNHNGJ1/xWB3/Q
	ksJ3qtSjoSggyVDOdoX40CKn/H68ulic4OOJOXbmWa+Qb1jwY2QSuHFKACYhA0ImftFP5rGxooq
	3Al+aRVXiJtCjyBW/XVNo9g3EkM3ILrU1lg1PfidleElaDSs18X22ULutqvMW5RAc0iQn5lFcSr
	yHADNjQHM=
X-Google-Smtp-Source: AGHT+IEmafDPdZsvm9CMnB3HTvF52f7Cn400+EAv/7a6bxZz0L3+nGN/q3g53vbmtjCg2SOPee33Bw==
X-Received: by 2002:a05:6000:4023:b0:3b3:e3f6:4a9b with SMTP id ffacd0b85a97d-3b768f2304amr5468659f8f.41.1753358399961;
        Thu, 24 Jul 2025 04:59:59 -0700 (PDT)
Message-ID: <e196d908-b0c5-4fe7-9ef2-ff9392835554@suse.com>
Date: Thu, 24 Jul 2025 13:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Mykola Kvach <xakep.amatop@gmail.com>
References: <cover.1753349108.git.mykola_kvach@epam.com>
 <180825d963133be069385472f569ecb1870989fb.1753349109.git.mykola_kvach@epam.com>
 <21a902ca-47ae-4243-a6f1-ee401c8bf4b4@suse.com>
 <e1f3b49e-da03-48a4-8fa1-be2e87542852@citrix.com>
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
In-Reply-To: <e1f3b49e-da03-48a4-8fa1-be2e87542852@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2025 12:40, Andrew Cooper wrote:
> On 24/07/2025 11:08 am, Jan Beulich wrote:
>> On 24.07.2025 11:40, Mykola Kvach wrote:
>>> --- a/xen/common/domain.c
>>> +++ b/xen/common/domain.c
>>> @@ -1326,16 +1326,10 @@ int domain_shutdown(struct domain *d, u8 reason)
>>>      return 0;
>>>  }
>>>  
>>> -void domain_resume(struct domain *d)
>>> +void domain_resume_nopause(struct domain *d)
>> This function not being static on (at least) non-Arm is, I think, in
>> conflict with some Misra rule.
>>
>>>  {
>>>      struct vcpu *v;
>>>  
>>> -    /*
>>> -     * Some code paths assume that shutdown status does not get reset under
>>> -     * their feet (e.g., some assertions make this assumption).
>>> -     */
>>> -    domain_pause(d);
>>> -
>>>      spin_lock(&d->shutdown_lock);
>>>  
>>>      d->is_shutting_down = d->is_shut_down = 0;
>>> @@ -1349,10 +1343,32 @@ void domain_resume(struct domain *d)
>>>      }
>>>  
>>>      spin_unlock(&d->shutdown_lock);
>>> +}
>>>  
>>> +void domain_resume(struct domain *d)
>>> +{
>>> +    /*
>>> +     * Some code paths assume that shutdown status does not get reset under
>>> +     * their feet (e.g., some assertions make this assumption).
>>> +     */
>>> +    domain_pause(d);
>>> +    domain_resume_nopause(d);
>>>      domain_unpause(d);
>>>  }
>>>  
>>> +bool vcpu_is_suspended(struct vcpu *v)
>> pointer-to-const please (and apparently also in do_psci_1_0_system_suspend()).
> 
> No.  This is not a predicate.  It takes a mutable pointer.

Predicate or not doesn't matter. (And it really is a predicate, as the "is" in
the name says, at least to me.)

> (And yes I am irritated that you continue to provide wrong feedback to
> contributors.  I'm in the middle of stripping another bogus const of
> yours from a different area that's hiding a MISRA violation.)

Well, all I know is that we disagree in where we think const is applicable. But
that disagreement was never resolved, and you can't expect me to silently jump
on your train of thinking.

> Also why is this email not on the list?

That I don't know. For sure it wasn't intentional for the list to be dropped.

Jan

