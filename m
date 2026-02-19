Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id bBrXOXvwlmlwrQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:14:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3D15E33A
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 12:14:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236139.1538904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1yg-0001Ky-8s; Thu, 19 Feb 2026 11:13:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236139.1538904; Thu, 19 Feb 2026 11:13:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vt1yg-0001Ij-5v; Thu, 19 Feb 2026 11:13:50 +0000
Received: by outflank-mailman (input) for mailman id 1236139;
 Thu, 19 Feb 2026 11:13:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fQfQ=AX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vt1ye-0001Ib-B5
 for xen-devel@lists.xenproject.org; Thu, 19 Feb 2026 11:13:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f72a12b-0d84-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 12:13:47 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so4860985e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Feb 2026 03:13:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d7e50casm622033975e9.8.2026.02.19.03.13.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Feb 2026 03:13:46 -0800 (PST)
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
X-Inumbo-ID: 0f72a12b-0d84-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771499626; x=1772104426; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2zjmkeenOnTzZdB9+l7zlTYFzmKJ9MuEK0T+RpYIzJA=;
        b=DDzKyrD4uirJmSt//qCrZZCDLl2rVMMgi7j0ftTpajYcZbiZtISmqGaTw8C9P4JTFh
         aHoTczX0nL1tx8yrz5sq9As9HrGyrV++d9uYx3GpSuL4oEPnlRHYKXssKRdLnTbS0ZK4
         gxJprez72zP1qqEqdWvxlr6dZXprWcUIiFkvb74qdKQcn5MXnNhUHcE87qlPr2JpEO3K
         2u1nwkZpe3r/y4vUd4RpShPD9Z9quOb17W6dD/et1o1MTGoWNnpXCF6KnI+1lhJxqn46
         4qPDj/q7RqMyqqvsKL87qxSREkShuCv4HsyvCuqmWmL9qlU2gdO1H8YPoiVM5dOFxBKd
         qEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771499626; x=1772104426;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2zjmkeenOnTzZdB9+l7zlTYFzmKJ9MuEK0T+RpYIzJA=;
        b=SWX1/napdHd5AESCq4YO8yHROxiTUKFRvKESPcnv8ZmAW/kchAscWl2Epv1AdLSWiG
         eUgcuVLt7n7Av6Zbpo7/PAYs7qIRRD7jeDfGjjSaO5UNlrZjQ4Ppr/g0Jj/rgIxrdQfO
         YeJMjlhWAeHOw0igpQJH1VOlHiY7h3yUIHsrXipQuQAkGvDmUjqwS+5SI6KJB/3H4Jvi
         9ws6FHcHQ4xGJVfpbIDE/Z3GBhY4ZYMICJg6wdNq14/Qwh+ixOsuNAmUXgubCuUs7KN8
         rvIR7mQWxGFHLHRkh/tZSnGSocHyvr0lUZP/KNG5EYGFEYGxsFXkZEaRtB9Vw32Kolhq
         jxFw==
X-Forwarded-Encrypted: i=1; AJvYcCWDx7p8/NFOFdSGY3xflSGoV9pgL74CPG6K6j+5kJG0YX0zuJpuCsEdqy4TJg7wU4bPocxUE8iztsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykV1JiLV/BuIwAAg3dH+v03ZMD/Gh9eGlhWQkkuOoCcwiweIGd
	6WxIYFsxTornvoCrH2zbpvJED8vMoBw6pgAu0iw8qx5h42atZ/1NIy8HmDmVqeiusw==
X-Gm-Gg: AZuq6aJGUGOSMwnEcMF0YKKfX3Hs8nZBzsB648N+3blzsCYxQkpuTxDVFvyKgfTynsc
	aGL57V6r2V6E4isclHSXHR3BWj1kASJc1pQ7qyCxmn/t+1+yt6gsK+gVqdtDtMwI/u9nNrY+URF
	VdeB98uwobSZHmzDh8EqzeezMGPAHj+5/yQ4gDQKSMLIOAvn0OXh1MhzcOovxhu+0GGvGK1GMLY
	HIv6jK9MyZuhJI/QhK+yoRE1tqwVvs+2q9T7wwNNRTAQKNKXwQhELqQ0C7794kfLBgh9bv53sxu
	JcOETf4k/zve/KRe7MpWVX3LQU+yupRHgJdsOqqCEp5Q8Hcd3cVovYkbSbRAdb5TbZWNv/2cTxp
	E4tjROuargj+VT753jArRy8CuhXNOGriRKuG3t4hYokkYs8eLs/ThSXGLKBtiSS1uBcTafZFhk+
	4cOp6jg/bMSguefD6PGskc83fhgJikZFcdoSl23/Ts5A26aYu1Mcbqg6PL5mdNk2tJvBxub6gBY
	pHj4l9mKXcmD0g=
X-Received: by 2002:a05:600c:1387:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-4839e661cd7mr36339045e9.24.1771499626518;
        Thu, 19 Feb 2026 03:13:46 -0800 (PST)
Message-ID: <7a334660-95db-4f6e-beb5-9115372567bb@suse.com>
Date: Thu, 19 Feb 2026 12:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: Juergen Gross <jgross@suse.com>
Cc: Chris Rogers <rogersc@ainfosec.com>,
 Dmytro Firsov <dmytro_firsov@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
 <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
 <fd69b278-6e7d-46b0-95ac-fff3926b1c4f@suse.com>
 <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
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
In-Reply-To: <a13a45a1-9da4-4fab-9d5d-59ac06ea7b23@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jgross@suse.com,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 54D3D15E33A
X-Rspamd-Action: no action

On 19.02.2026 12:03, Juergen Gross wrote:
> On 19.02.26 11:52, Jan Beulich wrote:
>> On 19.02.2026 00:04, Jason Andryuk wrote:
>>> On 2026-02-18 14:08, Daniel P. Smith wrote:
>>>> --- a/xen/common/domain.c
>>>> +++ b/xen/common/domain.c
>>>> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>>>>    int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>                         domid_t *domid)
>>>>    {
>>>> -    unsigned int dom;
>>>> +    unsigned int dom = -1;
>>>>        int rc = -ENOENT;
>>>>        struct domain *hdl;
>>>>    
>>>> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>>    
>>>>        if ( d )
>>>>        {
>>>> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
>>>> +        if ( rc )
>>>> +            return rc;
>>>> +
>>>>            set_domain_state_info(info, d);
>>>>    
>>>>            return 0;
>>>> @@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>>>
>>> Between the two hunks is this:
>>>
>>>       hdl = lock_dom_exc_handler();
>>>
>>>       /*
>>>        * Only domain registered for VIRQ_DOM_EXC event is allowed to query
>>>        * domains having changed state.
>>>        */
>>>       if ( current->domain != hdl )
>>>       {
>>>           rc = -EACCES;
>>>           goto out;
>>>       }
>>>
>>> So it is only the domain with VIRQ_DOM_EXC that can enter the while loop:
>>>
>>>>    
>>>>        while ( dom_state_changed )
>>>>        {
>>>> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
>>>> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>>>>            if ( dom >= DOMID_FIRST_RESERVED )
>>>>                break;
>>>> +
>>>> +        d = rcu_lock_domain_by_id(dom);
>>>> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )
>>>
>>> ... if the VIRQ_DOM_EXC owner is denied for domain d ...
>>>
>>>> +        {
>>>> +            rcu_unlock_domain(d);
>>>> +            d = NULL;
>>>> +            continue;
>>>
>>> ... the caller would continue ...
>>>
>>>> +        }
>>>> +
>>>>            if ( test_and_clear_bit(dom, dom_state_changed) )
>>>
>>> ... and this bit would never be cleared.  Should the VIRQ_DOM_EXC owner
>>> always get to clear the bit even if it cannot see the result?
>>
>> I don't think so, no. Whenever a legitimate consumer occurs (the owner of
>> VIRQ_DOM_EXC can change, after all), it'll then consume the bits as needed.
>> More generally, I think we're better off not making the code here depend
>> too much on that special VIRQ_DOM_EXC property.
> 
> OTOH a new VIRQ_DOM_EXC owner will result in a complete reset of the bitmap
> anyway (that is: the bits for all existing domains will be set, while all
> others will be cleared).

Yes, while writing my reply I wondered whether I should mention that. To keep
things a little more simple, I didn't. Plus for this aspect the last sentence
of my earlier reply also applies.

Jan

