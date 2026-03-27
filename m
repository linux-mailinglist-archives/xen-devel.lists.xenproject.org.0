Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJzsJ7lsxmmkJwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:40:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0980D3439A9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Mar 2026 12:40:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1265454.1556367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65Y3-0004zY-J2; Fri, 27 Mar 2026 11:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1265454.1556367; Fri, 27 Mar 2026 11:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w65Y3-0004x2-G3; Fri, 27 Mar 2026 11:40:19 +0000
Received: by outflank-mailman (input) for mailman id 1265454;
 Fri, 27 Mar 2026 11:40:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w65Y2-0004ww-Fu
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 11:40:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w65Y1-006T14-Dw
 for xen-devel@lists.xenproject.org; Fri, 27 Mar 2026 12:40:17 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c66c93-e002-0a2a0a5209dd-0a2a4509bc4a-20
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:40:17 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c66ca1-e484-0a2a45090019-d155802cb938-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 12:40:17 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48374014a77so24323705e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Mar 2026 04:40:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48722c9f0afsm161243095e9.10.2026.03.27.04.40.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Mar 2026 04:40:16 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774611617; x=1775216417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+u2maqohZDYF43Fj9MdkMeddSKVNfy5U1xhezuVooVE=;
        b=ZhU1H5BJsNL5GkdFgyIosf5ChvlZiCLqv8IvUYttgr/kIoL12qRqcbxXVu0SIIi4QZ
         lo1RveW0tq38PEg7HYGPSA3SqDeqQbSxzZwvcpggpT2xwPgC9Y7ThLsiikgcIUTLWUqQ
         hFVesZMS5aV4pzzlh27pxX+vqZ0WjK8qBOFaqWzFBcV74M2SVWD8y030yhWW0UhDjFeK
         ZTNGr/rDtNrdpEE5Mvhw/ZSe6kZYQj4kuVUxBKaBYkXfRtrK7RbbDsfJP1uzqp1VikVN
         XN/7V182QFxNLpvuBC8Xs46ov5ZAs6sgJLWZIF2C/gMhlza7AlMMNuTFjpS2RHw3+L4i
         GnMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611617; x=1775216417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+u2maqohZDYF43Fj9MdkMeddSKVNfy5U1xhezuVooVE=;
        b=dKi3lNfhX9mANs0wRcRR1R5F5fz3cOFzeCfHwPo3yppOYyLsfuMvpXyeyGuwPPHz/T
         +6aNLsWRZ33hTb9xWVJMDepkpLFRSrEMx5q1p2Gaa0LypZrHz3FwGFzcPUwAmeS9bgZb
         1YNS9fJWUMR1IubGlc6wB/3bYfJdHM+gPGOJdbmFfntfFBE+PbTsHd/kKQz5SVVlWfbR
         JUXIvC6TOxCEMYc/W80nskx4hnhV5kBC5QT1rId8O1MpSk9ZFDHBAX6vseo+J2ketkm9
         NpXxQutHsNtyY00zrnaqXbR4ZsyXHOLaj8Y+RwX9zLOKkwcy2ey40jdkBvqGhGqvDWBB
         fXYg==
X-Forwarded-Encrypted: i=1; AJvYcCUoNCtGgZEzn056YMmch/wbFbAjoWLZ1/A1tf3HeJ6MlkJ9ZjI3ay9q0nuJR+0dRbQctAuGDCcJ6Go=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMIWoV0bK9qvB45LAB6hzFXCA+sfpyPaMe3OU2c9GjiOS2wfvJ
	Aa78fuGS+ONAaoxmsMABRFLq8Al7tAePzChhfSwhGMVRsZm7GkOVt7w8684nQ4uIBg==
X-Gm-Gg: ATEYQzyvQDCZ4Rqc8Ndok9mYKT3PsDyhk4Mx/+swNxs4SxB9PYkZSzHL6miF6BFr25j
	dGHQgIjvc0z4FEPGc1ddP7AkDJJcSvKQdnMTymJ0x3Xe469ALru4qM9kheT9ncyUNXlQaaGUkpz
	GOLjnf8MUaAt/eQw719ooAy5y6EPwDAt6t39khCgP0vB7FNoMQEpt6HBVXNARsMGQJm8yT+uwwc
	IUjhPfly+1kgohDFR+JP0XEVqZRX+9Z5ACcD/ZpYbar03w513QfZfWy2nDTnLodmVl+/EmLxAn1
	sr3sJzrQ3t4LMZyDvqOnin57vIwol8VqEa++inmu09L+YqtuU+UyWXw+wpmvim9vnJoRe7QlD9h
	oKiGw//DJ5qBnMew4PYPj1myqI+vLJjBVNqlu3+JxJ6kRkyEGQ7Qh5K48gbiEo+90RZIfMdEi1G
	WkoE3vfXq+lRo+LogmRfNwBV+brK6au8j2IDJyYhDTnsgEZ6zZDNFDh1IF4DcqcP0Nh8Bp5kG+Q
	G3//WTvidwQjQ4=
X-Received: by 2002:a05:600c:450a:b0:485:531d:28b9 with SMTP id 5b1f17b1804b1-48727d774e6mr33189135e9.14.1774611616538;
        Fri, 27 Mar 2026 04:40:16 -0700 (PDT)
Message-ID: <99938f35-bbca-4e68-a4ac-4a599e42eede@suse.com>
Date: Fri, 27 Mar 2026 12:40:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1773307749.git.mykyta_poturai@epam.com>
 <206261ba0b60ebcff25e083c22d9e9b885645199.1773307749.git.mykyta_poturai@epam.com>
 <be38f4ce-48f8-459c-9bfc-caa60794a652@suse.com>
 <eb459343-12a2-4fc1-b26c-efe4fa636aa9@epam.com>
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
In-Reply-To: <eb459343-12a2-4fc1-b26c-efe4fa636aa9@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1774611617-63AA4A73-0535FF38/0/0
X-purgate-type: clean
X-purgate-size: 4605
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.958];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0980D3439A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 27.03.2026 11:39, Mykyta Poturai wrote:
> On 3/23/26 13:09, Jan Beulich wrote:
>> On 12.03.2026 10:39, Mykyta Poturai wrote:
>>> --- a/xen/arch/x86/platform_hypercall.c
>>> +++ b/xen/arch/x86/platform_hypercall.c
>>> @@ -735,6 +735,12 @@ ret_t do_platform_op(
>>>       {
>>>           int cpu = op->u.cpu_ol.cpuid;
>>>   
>>> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>>> +        {
>>> +            ret = -EOPNOTSUPP;
>>> +            break;
>>> +        }
>>> +
>>>           ret = xsm_resource_plug_core(XSM_HOOK);
>>>           if ( ret )
>>>               break;
>>> @@ -761,6 +767,12 @@ ret_t do_platform_op(
>>>       {
>>>           int cpu = op->u.cpu_ol.cpuid;
>>>   
>>> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>>> +        {
>>> +            ret = -EOPNOTSUPP;
>>> +            break;
>>> +        }
>>> +
>>>           ret = xsm_resource_unplug_core(XSM_HOOK);
>>>           if ( ret )
>>>               break;
>>
>> I wonder whether on x86 this really should become an optional thing (and
>> if so, whether that wouldn't better be a separate change with proper
>> justification). See also the comment on common/Kconfig further down - by
>> the name of the option, and given the support status the change above may
>> be legitimate, but not some of the similar restrictions added elsewhere.
> 
> Maybe force it to be always on like x86 then? I don't really have a 
> justification for making it optional on x86, it just happened as side 
> effect of creating a config option.

Well, I would have asked for that if there wasn't a (presumed) use case for
making it optional - certification, where as much unused code as possible
(apparently) wants compiling out. You'll need to ask those doing prep work
for certification whether they'd be interested in it becoming optional.

>>> --- a/xen/common/sysctl.c
>>> +++ b/xen/common/sysctl.c
>>> @@ -483,6 +483,52 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>>>               copyback = 1;
>>>           break;
>>>   
>>> +    case XEN_SYSCTL_cpu_hotplug:
>>> +    {
>>> +        unsigned int cpu = op->u.cpu_hotplug.cpu;
>>
>> I don't think this variable is very useful to keep. Instead use ...
>>
>>> +        unsigned int hp_op = op->u.cpu_hotplug.op;
>>> +        bool plug;
>>> +        long (*fn)(void *data);
>>> +        void *hcpu;
>>
>>          void *hcpu = _p(op->u.cpu_hotplug.op);
>>
>> right here, dropping the assignments further down.
>>
>>> +        ret = -EOPNOTSUPP;
>>> +        if ( !IS_ENABLED(CONFIG_CPU_HOTPLUG) )
>>> +            break;
>>> +
>>> +        switch ( hp_op )
>>> +        {
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_ONLINE:
>>> +            plug = true;
>>> +            fn = cpu_up_helper;
>>> +            hcpu = _p(cpu);
>>> +            break;
>>> +
>>> +        case XEN_SYSCTL_CPU_HOTPLUG_OFFLINE:
>>> +            plug = false;
>>> +            fn = cpu_down_helper;
>>> +            hcpu = _p(cpu);
>>> +            break;
>>> +
>>> +        default:
>>> +            fn = NULL;
>>> +            break;
>>> +        }
>>> +
>>> +        if ( fn )
>>> +        {
>>> +            ret = plug ? xsm_resource_plug_core(XSM_HOOK)
>>> +                       : xsm_resource_unplug_core(XSM_HOOK);
>>> +
>>> +            if ( !ret )
>>> +                ret = continue_hypercall_on_cpu(0, fn, hcpu);
>>> +
>>> +            break;
>>> +        }
>>> +
>>> +        /* Use the arch handler for cases not handled here */
>>> +        fallthrough;
>>> +    }
>>> +
>>>       default:
>>>           ret = arch_do_sysctl(op, u_sysctl);
>>>           copyback = 0;
>>
>> This form of falling through may be a little risky, towards someone not
>> looking closely enough and inserting another case label immediately ahead
>> of the default one. While I don't think there's a really good solution to
>> this, please consider
>>
>>      }
>>          /* Use the arch handler for cases not handled above */
>>          fallthrough;
>>      default:
>>
>> instead.
>>
> 
> Just want to clarirfy if I got the idea. Is this what you meant?
> 
>      switch ( op->cmd )
>      {
>      ....
>      case XEN_SYSCTL_cpu_hotplug:
>      {
>      ....
>      }
> 
>          /* Use the arch handler for cases not handled here */
>          fallthrough;
>      default:
>          ret = arch_do_sysctl(op, u_sysctl);
>          copyback = 0;
>          break;
>      }

I can't spot anything different from what I wrote, so (presumably) yes.

Jan

