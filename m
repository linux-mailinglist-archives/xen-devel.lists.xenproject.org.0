Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHZrFB1dfGkYMAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 08:26:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC5EB7E6E
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jan 2026 08:26:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1217238.1526991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlise-0003Ws-BE; Fri, 30 Jan 2026 07:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1217238.1526991; Fri, 30 Jan 2026 07:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlise-0003UO-6w; Fri, 30 Jan 2026 07:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1217238;
 Fri, 30 Jan 2026 07:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlisc-0003UI-Ty
 for xen-devel@lists.xenproject.org; Fri, 30 Jan 2026 07:25:22 +0000
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [2a00:1450:4864:20::341])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5719009-fdac-11f0-b161-2bf370ae4941;
 Fri, 30 Jan 2026 08:25:20 +0100 (CET)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso15533025e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 23:25:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cdd78d3sm184204025e9.1.2026.01.29.23.25.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 23:25:19 -0800 (PST)
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
X-Inumbo-ID: d5719009-fdac-11f0-b161-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769757920; x=1770362720; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FLxaQfvYhPb6GtKPj8giu6ojgpmYWheD88uOj7YdUAA=;
        b=DgAHxStKYkxPYjew4H/ujWVoMWSYUvxjw7iA/MazA7KkmHOXLGlfjl/KERWxzI7jIC
         41SgdmS6FNcvMAHYUjMT5+Oal0b9zAzZqH6u+GGD5BZWRz4tFBrVYhAABrsSJJWTHeCL
         EDP8jSMoXeb8Y0mWTTd3R00ewRxA7i9L/Rv5EaOVCWRC2qwF76dg8lncMcuWhgfGaPWx
         t0JB2/6geN9IhklIyuHOUzKQ+UA6Bz4z/CSkai3jPSkMRi0B+CRx9sRgS/uCW/3MSGtS
         N45pNS+12IFz4Ill09468FwvgeN7Xpu9doP3lt30DKEv6VssGtUq4BkK/1gPJUq4Kwhh
         yiyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757920; x=1770362720;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLxaQfvYhPb6GtKPj8giu6ojgpmYWheD88uOj7YdUAA=;
        b=XCVwI/OWe5B60xy5Mq3ETdJnDUyX+0ld5m7mt9KFwjRXC8sYTfEnMYhZjN9pmrpIMJ
         hm5ztFP7uOCDAyyI8qhRtBBDgSgtEKARcMlQQoiOR5zwPT+IdH2fvphYkyDvEKMwrEyn
         qn+/1Fk90daKao3O821QGjP/xqVG3jpmSx0QjzPcH+0bGriB8NdrNa4AU8tHEK4BdeEe
         aWC5x8EjKQkvuRrDeZpNknar9YFEClxsYzjBOMULI0+O3twMsLU9xNLlpwmEXUjppHfI
         2DnOsDzYqbNZblMmZTVV80NvZ4SzHKU+KlY46RLCSjiUuEod7s96IVOXWJQuJc5Q7TJ6
         ZXVQ==
X-Gm-Message-State: AOJu0YxecVGGzYAID2TBy0G/6zTO+uYPel+e7rOXDmE0GC3b/2OCRwDt
	VLyn8uGjwzBYPQJamAvbotgQqhB8ZB62pgi/cFgrO6GQt6ndm5XB2MhJ21KR0sUK7Q==
X-Gm-Gg: AZuq6aI1LrOe0IuvijcGNvrVdjizwJs4GTh2IaQZm/EEqz99tzFePBtFtqez79C4JGn
	CiStpM4/aY+XhkqW2Z3INrYCJjX+onjM11BK1h13XghJMCr9HTmhdZ+NExLQpvW8HtdJ68uxOF7
	+lZCptnEdoTxfrCdVkpJO/qC4rBtqMhGInuO+Q4aVMySFmcvEpbUPYzEppiO9xWwP0WMqB//AWE
	nXg99YnmPaWFakrpnbITROx1TwfANkUpQQcaiE2NSC2IAIKueqRVDUMjIKTKoUKy2qpiXSOvW+6
	0dgBwAZluvmpawcHW7hViWCZ/8EbMnzpM9f2/BoZdhgdOt9Pw+TzEC3DKFkPmPMmA8/cLF0q8eb
	rdxRjYu9aACAgF1fb/2RPA7mtF/lszamHL2HTZA/JShGS+sx8MaCR7bGlo+BjaW3NZUpZnsYHNy
	HJwt4VV2WfKbSmPqo96ekGWoPgoAKybpTqfnEJrKGI81o4bTMjKA40Pkces6v9vKeUt5P1pF7o4
	nw=
X-Received: by 2002:a05:600d:4452:10b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-482db48b7acmr14751845e9.14.1769757920080;
        Thu, 29 Jan 2026 23:25:20 -0800 (PST)
Message-ID: <7bea7067-0d7d-4eaa-bd52-8735f90998c5@suse.com>
Date: Fri, 30 Jan 2026 08:25:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
References: <cover.1769696107.git.oleksii_moisieiev@epam.com>
 <69d32e2440b2ef194b4893e5dd29c2dd9d216a90.1769696107.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2601291510250.2238666@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2601291510250.2238666@ubuntu-linux-20-04-desktop>
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
	FORGED_RECIPIENTS(0.00)[m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:Oleksii_Moisieiev@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: ABC5EB7E6E
X-Rspamd-Action: no action

On 30.01.2026 00:14, Stefano Stabellini wrote:
> On Thu, 29 Jan 2026, Oleksii Moisieiev wrote:
>> --- a/xen/arch/arm/firmware/sci.c
>> +++ b/xen/arch/arm/firmware/sci.c
>> @@ -126,6 +126,42 @@ int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
>>      return 0;
>>  }
>>  
>> +int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>> +                  XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>> +{
>> +    struct dt_device_node *dev;
>> +    int ret = 0;
> 
> Should this be -ENXIO?

Not unless further changes are made. That error code being set ...

>> +    switch ( domctl->cmd )
>> +    {
>> +    case XEN_DOMCTL_assign_device:
>> +        ret = -ENXIO;

... here makes sure that other XEN_DOMCTL_* making it into this function
will ...

>> +        if ( domctl->u.assign_device.dev != XEN_DOMCTL_DEV_DT )
>> +            break;
>> +
>> +        if ( !cur_mediator )
>> +            break;
>> +
>> +        if ( !cur_mediator->assign_dt_device )
>> +            break;
>> +
>> +        ret = dt_find_node_by_gpath(domctl->u.assign_device.u.dt.path,
>> +                                    domctl->u.assign_device.u.dt.size, &dev);
>> +        if ( ret )
>> +            return ret;
>> +
>> +        ret = sci_assign_dt_device(d, dev);
>> +
>> +        break;
>> +
>> +    default:
>> +        /* do not fail here as call is chained with iommu handling */
>> +        break;

... succeed (by making it here). If you used -ENXIO as initializer, ret would
then need setting to 0 here. Which is functionally identical to what is there
now.

>> @@ -195,6 +203,12 @@ static inline int sci_assign_dt_device(struct domain *d,
>>      return 0;
>>  }
>>  
>> +static inline int sci_do_domctl(struct xen_domctl *domctl, struct domain *d,
>> +                                XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>> +{
>> +    return 0;
> 
> This should be -ENXIO?

Why? Then several other XEN_DOMCTL_* would break. Or wait, no, nothing would
break at all, as this stub looks to never come into play. It hence should be
dropped.

Jan

