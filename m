Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LRpAgM6qWka3QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6578020D34B
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 09:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246243.1545451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3ka-00026y-B0; Thu, 05 Mar 2026 08:08:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246243.1545451; Thu, 05 Mar 2026 08:08:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy3ka-00024L-7W; Thu, 05 Mar 2026 08:08:04 +0000
Received: by outflank-mailman (input) for mailman id 1246243;
 Thu, 05 Mar 2026 08:08:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vy3kY-00024F-DY
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 08:08:02 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ccb5f44-186a-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 09:07:59 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so90745145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Mar 2026 00:07:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fae02a8sm39359085e9.5.2026.03.05.00.07.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:07:57 -0800 (PST)
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
X-Inumbo-ID: 6ccb5f44-186a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772698079; x=1773302879; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ll9oBLATbnRIzMJVChV4eHyxGWZ6bdG7yEjwsKUccM4=;
        b=aZTmXXczQtfPnc7xGMybMS+9ZcZBZnx2r8PPI9uAbB+xT5JjNSPHk/gtHFH0Vi2bbz
         NzLQU4aOVzY3XaRMh6ip4Slxtgm44X6z9AS7vjc2KRp2yvTjbhFw7l43bFkxaJ41jPIa
         pi/DmKSL9jo1b8IV9+7X8bbMgol68Q95aMHonA98jbEL4dMTvXfZRGJMOkZACDvGlzoc
         AVNGFvUKhWvortwJvEv+XQo6seuqyiuKu+9Xf+yB3hj8gkouqp7UoIqEEyPjLQQDWLBU
         CSXa5XYsYK+ki0tqiDyP+54KSVCEfNAr5ITnud2jHVukCzgQaQ9jLNBFsmrOWWu2k13j
         G/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772698079; x=1773302879;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ll9oBLATbnRIzMJVChV4eHyxGWZ6bdG7yEjwsKUccM4=;
        b=b+VCmg9taLDnDv4nUGueuIuTuy1UYV20vKSI80VcZe+kdQLLCctJ0NcE44w6op/heQ
         vmMlKVJAOvaqDYmsu/mynGSmoDYMrw5d+f4wGga/skXFl3rNuCIiacJ08watIIjIHFM+
         0AuTHy/Ckul8mBtqogz4ic0tK7fQx3mMhDK9k0Wl5N3aKpU/tuVGigph1IoWMjZ4vpyH
         f3gL7KC7/GDsnsypN+CcWcuhCjdKlW+hywtQO97IAozAkGhv5D4DvoTl2/P4ZnANkFj5
         WWyYfMN26Z+5m2Jc4IqZ+3ts1zKmU/BjCSKaqJs0moEJKXzQFMyPmjTOpYHaBJL7mY6P
         xcmA==
X-Gm-Message-State: AOJu0YyEjXGcEDQI1sljuhm4jQvoWevadX6gUAEcU+PnOSH1/jnSQF/v
	ybP2Yu65VraQyt1qZmlypqhCa/Xjg+yUvubf11qH9DhtPhq9btceEQPvOgJ2NmO7Lg==
X-Gm-Gg: ATEYQzzFSqG53UbIuWL77udaHA1y7cZ6baDysRVuehEOr/hMbgYKBH97VK5Fmw4R8Pj
	a46+XEnx8BrJwwf9WCb1Ir3Oyrl1O8Eg5QGVoNyP0d+AQZIMKxfISS/zbkKlmPVAdaOWLSpTKww
	mwIL/loMnT5dON7nfxLIUdn5knACoHOcGUil5BggVIW6If+3eIhdSY6NusUG43apte4xU54VRnv
	FBmMx/z0jcgldjJTlIkFWh9ucJ2/HxvjUydoG+9peBVGz5HZ/9QTK/NWMtwhOPod+C5B1cUjodk
	Fd6ZZ/hX+UlSIeJTAALizaWi21s84reLfOVVw/sHYF+T2nIoAI7NHiorEX4lC6OWnjBeidywbJX
	1WGJXF0sk47+SvDj0V+PVHg/GVj3d4VrlG+Xdix4pcAbZg6+tj6D8LrskIt0zMnFBRBeebOskEU
	rn+WMrYvAaLtRfQ3u4S+ihr/yUVPmWebE/haEM/RzfU0BtIecBKc3cx7Mdah+qLFOsnPTs3jDIZ
	P5eaXFB2kzg1oA=
X-Received: by 2002:a05:600c:c4a5:b0:477:b0b9:3129 with SMTP id 5b1f17b1804b1-48519831168mr73337455e9.3.1772698079120;
        Thu, 05 Mar 2026 00:07:59 -0800 (PST)
Message-ID: <1f80f87e-8e58-45de-8785-1efec5169176@suse.com>
Date: Thu, 5 Mar 2026 09:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] domain: use unsigned loop induction variable in
 complete_domain_destroy()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <7af56fa6-4254-4704-9843-a0d099e6bb0b@suse.com>
 <aahSBk--J_xqEzOq@macbook.local>
 <80129c3a-77cb-4cb1-b3fd-128454e3db0b@suse.com>
 <aahtt0zo0nCb1eSt@macbook.local>
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
In-Reply-To: <aahtt0zo0nCb1eSt@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6578020D34B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 18:36, Roger Pau Monné wrote:
> On Wed, Mar 04, 2026 at 04:48:07PM +0100, Jan Beulich wrote:
>> On 04.03.2026 16:38, Roger Pau Monné wrote:
>>> On Thu, Feb 26, 2026 at 10:01:45AM +0100, Jan Beulich wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -1475,7 +1475,7 @@ static void cf_check complete_domain_des
>>>>  {
>>>>      struct domain *d = container_of(head, struct domain, rcu);
>>>>      struct vcpu *v;
>>>> -    int i;
>>>> +    unsigned int i;
>>>>  
>>>>      /*
>>>>       * Flush all state for the vCPU previously having run on the current CPU.
>>>> @@ -1485,7 +1485,7 @@ static void cf_check complete_domain_des
>>>>       */
>>>>      sync_local_execstate();
>>>>  
>>>> -    for ( i = d->max_vcpus - 1; i >= 0; i-- )
>>>> +    for ( i = d->max_vcpus; i-- > 0; )
>>>
>>> Is there any reason we need to do those loops backwards?
>>>
>>> I would rather do:
>>>
>>> for ( i = 0; i < d->max_vcpus; i++ )
>>>
>>> ?
>>
>> I think it's better to keep like this. The latter of the loops would better
>> clear d->vcpu[i] (to not leave a dangling pointer), and there may be code
>> which assumes that for ordinary domains d->vcpu[] is populated contiguously.
>> Hardly any code should touch the vCPU-s of a domain destructed this far, but
>> still better safe than sorry, I guess.
> 
> Yes, you are right.  sched_destroy_vcpu() relies on this specific
> top-down calling.
> 
> Since you are adjusting the code anyway, it might be worth writing
> down that some functions (like sched_destroy_vcpu()) expect to be
> called with a top-down order of vCPUs.

I've added

    /*
     * Iterating downwards is a requirement here, as e.g. sched_destroy_vcpu()
     * relies on this.
     */

ahead of the first of the two loops.

> For the change itself:
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

Jan

