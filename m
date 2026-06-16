Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ac/hOuUNMWqcawUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:48:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FB368D4BD
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 10:48:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=S70ERyAs;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338805.1599859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPT5-0002Q6-GK; Tue, 16 Jun 2026 08:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338805.1599859; Tue, 16 Jun 2026 08:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZPT5-0002OW-DI; Tue, 16 Jun 2026 08:48:23 +0000
Received: by outflank-mailman (input) for mailman id 1338805;
 Tue, 16 Jun 2026 08:48:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZPT3-0002OQ-AE
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 08:48:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZPT2-008qfY-Jt
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:48:20 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a310dd0-2eae-0a2a0a5409dd-0a2a4503a558-8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:48:17 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a310dd1-672d-0a2a45030019-d155802eb872-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 10:48:17 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-490b7866869so44061745e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 01:48:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea95c51dsm287766585e9.1.2026.06.16.01.48.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 01:48:16 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781599697; x=1782204497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EGWs8/Im/BfYHBz/SictQyVMJADsVkv/l+1C7PXdQgM=;
        b=S70ERyAsJYjDzQE+VjJjUbeDIeo91zLKnqt3CMTECi6WKTMPZH09Nyx29y7g2ttqTJ
         8swe++c0lA9XH6hOiu8005irNR9/1nz7UxQmHMBDzDqgIa0VqULnkV6X/FL7K2VYLFEZ
         W5KNOoFM1iKvheyo3aDyb5boM7atFUgcdVObTxBKyMOSJtGpznu1pcWF5DXmMeVSNS68
         TEcVPf1geS6c2JsKgeq/NI507CDl0ncOhzBrf/f54VEl6c/srs7J8zFsVr8QBjNswOjF
         9DQ2jmE8LxnuWF8Dpv/+KYNGSEwwycGtJapfnXhq7XMCT+55NL7peKw7K1meJq9z4TdW
         nA1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781599697; x=1782204497;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGWs8/Im/BfYHBz/SictQyVMJADsVkv/l+1C7PXdQgM=;
        b=LSpXHB4WC/9ciHJIOH+zGU3ExXx+kWx5qYx3ZXlnmCGBuG6MUXOFZByoq5uIJiEWAs
         QE6e7pOBNaQrEY8h/1XsyA57Xy5nD/YqypzXtyBsMGeOhW1qerTNltdeUDCOnVboZYnJ
         wFc8Nt7mB3LQ7edVq4Q1BgTQPfKM5guyakd+At+atI68vLxrP2lJmm+6whDNeOm/LlkU
         3S/5Z2Dh1FPX6MSKochX8ujtpwKj2m99oN2+HyGeLcaD6Mjr0H3EEfhewpRmco/NjdpJ
         o7hGV4M1pDoFw+A2lJkcY8j/oVmOeLPfxNAACRlEOb/+caDmP7zOlmyqew+9GrCp/W6p
         ypVA==
X-Gm-Message-State: AOJu0YyEF4YfdUFIpu9EY5+uoS49DdrE+guLNMZg/WZPxh7f1daau/pq
	gU7WAvOOty2lDXbOj8vLPpfOkBWwN4roLdl8kYFxpXsIQxBcboRDSg0kYKHlPSquU6BKtdULCPX
	+6/c=
X-Gm-Gg: Acq92OGv8I/Y1ZQ2F4PpYSpmaOW16S7tW4Jk84IzOoAMdDdkeq+fJqFmbvC/8Pf8utX
	dWMLIKvgWRNAlMMZesUZo2koOnSmlsWBB9Coai6J0IqG9r7iyGLCAcTr4ZgyAeOfEER5n8wNeiw
	uorGSMqErbc7CZBMuW9AC8ja2CY31EoxT70eYZ9VQaW+5Vp2lWa9lepFstFqRPIklPmE1CXUkp/
	TihjmJ9BMu22XhzPg01fQ/oxSY2o9U2iTK34WBHp9cpEtHWGnswfi7FZrj5PFA/o1ZSGEbVG5dV
	byT1I1+/tQQCohXUCv1tWP7MLKiP3pSEmlCeyozjv/ljixCpOaAJiJPXcaywaUWetwvcD0fdT4S
	1u9Ma31yMGTP2arJEfJNcDTt0dgmm8Vpzakgy93Ltti9BRDJDsGm31qfJ/EG2TVWM+fqB/w8ZWg
	hmbt/v/c/QXCxG0AS6pR8uE2UV663EsMZ2lztiVZZnNwK3J5tzklzvQj3cJTk/g9LHih/Cax2Kp
	YJM0EeToKbExnk=
X-Received: by 2002:a05:600c:4fd6:b0:492:2f2e:e7e7 with SMTP id 5b1f17b1804b1-4922f2ee803mr53180495e9.17.1781599696942;
        Tue, 16 Jun 2026 01:48:16 -0700 (PDT)
Message-ID: <9eb03d4e-681d-4024-a382-90e837872962@suse.com>
Date: Tue, 16 Jun 2026 10:48:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 1/9] sched: introduce specialization of "running
 only" vcpu_runstate_get()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <67d1e638-a2ab-4d03-b9be-915a8c42e095@suse.com>
 <ajEMHBY6su6tPtZG@macbook.local>
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
In-Reply-To: <ajEMHBY6su6tPtZG@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1781599697-39B7C938-30215F7E/0/0
X-purgate-type: clean
X-purgate-size: 1850
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,xen.org,kernel.org,vates.tech,amd.com,gmail.com,suse.com,xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:oleksii.kurochko@gmail.com,m:dfaggioli@suse.com,m:jgross@suse.com,m:gwd@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FORWARDED(0.00)[mailman];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50FB368D4BD

On 16.06.2026 10:41, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 04:12:11PM +0200, Jan Beulich wrote:
>> About half the callers of vcpu_runstate_get() are solely after the
>> "running" time of a vCPU. Introduce a specialization with a smaller
>> read critical section and thus reduced risk of a need for retries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -325,15 +325,35 @@ void vcpu_runstate_get(const struct vcpu
>>      }
>>  }
>>  
>> -uint64_t get_cpu_idle_time(unsigned int cpu)
>> +uint64_t vcpu_runstate_get_running(const struct vcpu *v)
>>  {
>> -    struct vcpu_runstate_info state = { 0 };
>> -    const struct vcpu *v = idle_vcpu[cpu];
>> +    struct seqcount seq = SEQCNT_ZERO();
>> +    const struct seqcount *s = v == current ? &seq : &v->runstate_seq;
> 
> Does it make a difference to use a local fake sequence counter or the
> real one if the vCPU is the one currently running in this pCPU?  If
> it's the running vCPU then it won't get the counters updated, and
> hence using the real or a fake counter won't matter, as it will never
> be updated while carrying out the read.  IOW: the usage of a local
> sequence counter for that specific case just adds more logic without a
> real benefit?

While the counter wouldn't be updated, adjacent items in struct vcpu may
be touched from remote CPUs. By using a stack variable we avoid possible
cache line bouncing in that case.

In any event - what is done here follows what vcpu_runstate_get() does,
i.e. this is meant to strictly be a special case thereof. If we wanted
to omit this extra logic, it should also (either first, or subsequently
in both places) be dropped from there.

Jan

