Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP0JFMjrlmkzrAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 11:54:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E9315E025
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 11:53:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236111.1538873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1eO-0005su-7v; Thu, 19 Feb 2026 10:52:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236111.1538873; Thu, 19 Feb 2026 10:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1eO-0005qA-1e; Thu, 19 Feb 2026 10:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1236111;
 Thu, 19 Feb 2026 10:52:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt1eL-0005q4-Oo
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 10:52:49 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fde8954-0d81-11f1-9ccf-f158ae23cfc8;
 Thu, 19 Feb 2026 11:52:47 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-4359108fd24so484985f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 02:52:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ad015bsm49347844f8f.38.2026.02.19.02.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 02:52:45 -0800 (PST)
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
X-Inumbo-ID: 1fde8954-0d81-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771498366; x=1772103166; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i9e6pUsOj1TWzM4YsrWtMY3o71wx4EcnQVp9hKtLOXk=;
        b=F+f3i9z9PxGXl4H3/jopOw2bqXMUe9B2ab9O5Prq54ASTG8GaPVh3XsygNwoRdHJ57
         1c3Ff2DOIvsPYK0NEIXC/lx+hkydyTR7fNYM/xoRSGSS5cCJvG1/eeYissiLWHO0g4XA
         5CW0a9IlffmLlywdiIYHtJZ+so5J39Z98BryXCnwPAlwxcvNwyymRmYzIdW14fwVzwgy
         9iUbuw8zl3EaE/TRiYeH70c59Y7NGkmGf6b3Za9cz+l2yuwJW5n2p05aDS4bkkx+qJPA
         B9irTLGQkbakYarleLxCh1BMsfwYdayRcVrDLA8C0BVhgAOrQAYelm7BhUdHRQX9/OTA
         gwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771498366; x=1772103166;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9e6pUsOj1TWzM4YsrWtMY3o71wx4EcnQVp9hKtLOXk=;
        b=igH6pLFe/1akoFJ6pr2gDEqVLGf7SyR6yr0OjxLLgmXMWNjUumRHi+HZtu+CddFmIV
         0lKWEJMR3yowiGDb/ruH/ZMZU8ZWnvhYS3vFxrv8nLrocCdrp5sbEbSLL4s0s7WgBwXA
         KiEZMg6nDHEm7i94EXp5Kwy/jfqJpczbbVJacQbkBVSWEMcBoq43sttj69eXEishP7ec
         GsKTWaqZd+UMbbIZq8uIgEGh1SCWcLeyDm0UaoPIRMuDy01G02CzAHk6YyR/Uyd4uZGa
         TXXRdd2rHnfVFJ/OAGNWxz6nqO6u/hjaoH6L+sn55+3hVD500XkNEk/wAhn0jzJUq504
         LDCg==
X-Forwarded-Encrypted: i=1; AJvYcCWyQhTXHQPkAvMdefkSWo8W9QTflCLuD/Y7FAN6dUQQMb1mhIlXGYHYDJINsRjYqttkfVjl4vJv9bU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZX7vLm4vteT7KqEOJXAF1Fnt6B23Z6X8Qw5gKjkQ3iLJFuiW5
	8z8SpqdzswAZiCGrqmEXZKUzkXVvExnFIW3qPjPgHduSxLP4cDc3A7Hor553kZPmbQ==
X-Gm-Gg: AZuq6aIYm49ufDL19WVdek6D3eyL0rqSN6lDIwbBZ6HDe3AA0zy92yHWh6P6RQcuRki
	/Ar+AJKYO3oT6hBp5Qwd/v2s4/+I4yXOPxwGgnm3Ia4AwSyKXIQS23tP2LL6baIqtj3Qx0CLAlb
	MqxXnad2tCn3qZYn6xtmYXk41RdvZ5ZvQYxWh/KLxVBBhFVxsxYDML5xmk5Iz5fAHu3RZR/lGQ/
	BwQQf40GjgkAplgCQT3dBSLms2ZDvZMkPw4QMVEnBIoj5cPxVFYadK5B1cHURVYhInrQMeuo6VX
	ZRWF2aOxtqV0UG0i287hnal4W3GtoXHJow8bfF0hjxb6APWDVcIWkCTrnsIhjs0mZXlbwutIWlf
	DmE0tfnVIjTx3B3L494CZO+TSvIBkEYyN3lWVfhXgp7sAMxEUP7eo03fAuMAaxIl17P5mmY0k7f
	2cOZiRGafAbEScuXuOu4kMAsxgVhf6MBoFN3bJGnV2+pieiZDH3EbirUlQbqsQC+4tnUSIN5vBs
	VqzHNazC5+zflo=
X-Received: by 2002:a05:6000:26cc:b0:435:97b4:b699 with SMTP id ffacd0b85a97d-4395fd5c362mr3813338f8f.51.1771498365640;
        Thu, 19 Feb 2026 02:52:45 -0800 (PST)
Message-ID: <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
Date: Thu, 19 Feb 2026 11:52:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
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
In-Reply-To: <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A7E9315E025
X-Rspamd-Action: no action

On 19.02.2026 00:04, Jason Andryuk wrote:
> On 2026-02-18 14:08, Daniel P. Smith wrote:
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>   int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>                        domid_t *domid)
>>   {
>> -    unsigned int dom;
>> +    unsigned int dom = -1;
>>       int rc = -ENOENT;
>>       struct domain *hdl;
>>   
>> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>   
>>       if ( d )
>>       {
>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>> +        if ( rc )
>> +            return rc;
>> +
>>           set_domain_state_info(info, d);
>>   
>>           return 0;
>> @@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
> 
> Between the two hunks is this:
> 
>      hdl = lock_dom_exc_handler();
> 
>      /*
>       * Only domain registered for VIRQ_DOM_EXC event is allowed to query
>       * domains having changed state.
>       */
>      if ( current->domain != hdl )
>      {
>          rc = -EACCES;
>          goto out;
>      }
> 
> So it is only the domain with VIRQ_DOM_EXC that can enter the while loop:
> 
>>   
>>       while ( dom_state_changed )
>>       {
>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>>           if ( dom >= DOMID_FIRST_RESERVED )
>>               break;
>> +
>> +        d = rcu_lock_domain_by_id(dom);
>> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
> 
> ... if the VIRQ_DOM_EXC owner is denied for domain d ...
> 
>> +        {
>> +            rcu_unlock_domain(d);
>> +            d = NULL;
>> +            continue;
> 
> ... the caller would continue ...
> 
>> +        }
>> +
>>           if ( test_and_clear_bit(dom, dom_state_changed) )
> 
> ... and this bit would never be cleared.  Should the VIRQ_DOM_EXC owner 
> always get to clear the bit even if it cannot see the result?

I don't think so, no. Whenever a legitimate consumer occurs (the owner of
VIRQ_DOM_EXC can change, after all), it'll then consume the bits as needed.
More generally, I think we're better off not making the code here depend
too much on that special VIRQ_DOM_EXC property.

Jan

