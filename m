Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH2XAB8NqGn2nQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:44:47 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9311FE83A
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 11:44:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245266.1544653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxji1-0007OE-2y; Wed, 04 Mar 2026 10:44:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245266.1544653; Wed, 04 Mar 2026 10:44:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxji0-0007M1-WF; Wed, 04 Mar 2026 10:44:05 +0000
Received: by outflank-mailman (input) for mailman id 1245266;
 Wed, 04 Mar 2026 10:44:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xh4z=BE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vxjhz-0007Lr-7u
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 10:44:03 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e5674f7-17b7-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 11:44:01 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4806f3fc50bso71249335e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 02:44:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851887fc54sm48841655e9.10.2026.03.04.02.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 02:44:00 -0800 (PST)
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
X-Inumbo-ID: 0e5674f7-17b7-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772621041; x=1773225841; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QYAuifAC8Um5lkP5nfFAspiUlL5BmUJFZgO7RjydX+o=;
        b=CiNOssJ1TbC8MSJmizdZ0Hur9HOqW9ImuLE8OwX3WdgRP0KhVI29jggepvrFEADLqH
         LYrpw3ljjUbkxEboqfnYc4HJ74yLe3EAyCMHxad6w+SMXDd9b9I28r0eAYZi5+4lKrhG
         E79u1Gkp1210H1WEqKj/U4Yt555gmByPNTKzcfetXd5LjL1Iie8FhTYXTQba+sknX3Hv
         z2F3VZ8hnlruMH91OUQP9fQyM6/1Dd9nO8/pNQ54Jfs/j7Lo3yAna1blB1wfrlZrRZQb
         W0r1jhD5w9ivQFptigTL7HBqAYmIgQpkxyoN0acoW+reyeV8hr2Lq/ybkL8NqeWMvANG
         G3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621041; x=1773225841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYAuifAC8Um5lkP5nfFAspiUlL5BmUJFZgO7RjydX+o=;
        b=u96xQG6/41fOo79wCcGIeebw2zYKrze0XxmZhUWukSMlOXDYWn+aIo6YRD0wkPurkv
         DrnEEBCYOCMGCdEosgxYHIa88NNKQO6IEPFRv7CK5Z0tDXKOkQQ5BuKshAS3Ct6Y9MK8
         FcJoeDxXjWqekdk2NzZS/6r2rm6o2XmF/L13Or0zXoKk0Z8oBDQ7yFpYUswy9v6TeQeL
         pmo2limMsDRvEjgk/SvWwF3FjevampSqYgS2/vnDT887OIknUPp+RVWdUyK4zeVS0N7l
         JFnVI7x68SKt1AiWTR6/qES7QPHyNJkuhRUmnfnK7tNppAi2sEZcq1GufqCtmL7nly7c
         QysQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt5W3N2X6OCxeigJyEw26Fwcnjx9uLU0AM5xqFz2GSvoZ0t7G34xXKIDcFHFwGpWNCX13KlTro+k4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzXY6EF8a2sh6dM0N+1KrBzWLE54zjOiKdX/dKtCzr/wmDwRJL
	UCyBefpPlDd4WujhoEtlSQE8QlIRBZL32t0Tu0b86p/Xv0ZZGD2D5IB6dpmWO6uTVA==
X-Gm-Gg: ATEYQzwZy7K3RaSVatVcy2ur+H/B9gkY9RzUTnwHN/qiUA4Z/3Bn/4vo3iOmAewIA6j
	yCQ/jZ0FraBBVrhGF6k6J7jfUXPJ8ek2usDRo48bWTzgREb346FnAtyPFeLN5wBMox50TRhZNSd
	6V7gUX0ysPOZzsBDtDoHsVt2fXg/aKIF5fHZczBQMnUjPvCumdY7+ipHh+Z2NQW8pDDQTYLj3Rr
	rcIYky3cwBaDKhfRivVr2lLkiqdAClRwyZg6Maka0iZad0zQ3li5xnrF8l9p997LTYi8AwPYEsG
	aIMW8y+hrIWPP8MuTtXC7m9a16KkXs5aLsv0bQXUnu9LLOptRrcRgX5154of/PPDXZwsnIK1rYF
	VXpEeM0oZIbekWXXzBHzIzcVJOtC6hrz6Nw35ghg6g6eDbhNAkRsHfP4SdwuFtPRaMdUuoXRFhj
	3BVwPJ6pz2RH+g5QA26fhpHAsDxStuWmuwAztvI4ssCk3jVXbCxgmc6pzuPcasXvwxafZhZaHAV
	82/xqYMaAsPhgY=
X-Received: by 2002:a05:600c:608c:b0:483:bcff:7948 with SMTP id 5b1f17b1804b1-48519847972mr24952405e9.10.1772621040831;
        Wed, 04 Mar 2026 02:44:00 -0800 (PST)
Message-ID: <639231a2-c8c4-43c8-84a2-b4797e88d9fb@suse.com>
Date: Wed, 4 Mar 2026 11:43:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm/mm: Fix resource handling in
 xenmem_add_to_physmap_one
To: Michal Orzel <michal.orzel@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20260304093923.14293-1-michal.orzel@amd.com>
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
In-Reply-To: <20260304093923.14293-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8E9311FE83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

On 04.03.2026 10:39, Michal Orzel wrote:
> @@ -237,13 +239,73 @@ int xenmem_add_to_physmap_one(
>          break;
>      }
>      case XENMAPSPACE_dev_mmio:
> -        rc = map_dev_mmio_page(d, gfn, _mfn(idx));
> -        return rc;
> +        if ( !iomem_access_permitted(d, idx, idx) )
> +            return 0;
> +
> +        mfn = _mfn(idx);
> +        t = p2m_mmio_direct_c;
> +        break;
>  
>      default:
>          return -ENOSYS;
>      }
>  
> +    /*
> +     * Release the old page reference if it was present.
> +     *
> +     * TODO: There are race conditions in this code due to multiple lock/unlock
> +     * cycles:
> +     *
> +     * Race #1: Between checking the old mapping and removing it, another CPU
> +     * could replace the mapping. We would then remove the wrong mapping.
> +     *
> +     * Race #2: Between removing the old mapping and inserting the new one,
> +     * another CPU could insert a different mapping. We would then silently
> +     * overwrite it.

Can't such races be abused in a security relevant way, e.g. causing leaks of
some sort?

> +     * For now, we accept these races as they require concurrent
> +     * xenmem_add_to_physmap_one operations on the same GFN, which is not a
> +     * normal usage pattern.
> +     */
> +    p2m_read_lock(p2m);
> +    mfn_old = p2m_get_entry(p2m, gfn, &p2mt_old, NULL, NULL, NULL);
> +    p2m_read_unlock(p2m);
> +
> +    if ( mfn_valid(mfn_old) && !mfn_eq(mfn, mfn_old) )
> +    {
> +        if ( is_special_page(mfn_to_page(mfn_old)) )
> +        {
> +            /* Just unmap, don't free */
> +            p2m_write_lock(p2m);
> +            rc = p2m_set_entry(p2m, gfn, 1, INVALID_MFN,
> +                               p2m_invalid, p2m->default_access);
> +            p2m_write_unlock(p2m);
> +            if ( rc )
> +                goto out;
> +        }
> +        else if ( p2m_is_mmio(p2mt_old) || p2m_is_grant(p2mt_old) )
> +        {
> +            /* Reject MMIO and grant replacements */
> +            rc = -EPERM;
> +            goto out;
> +        }
> +        else
> +        {
> +            /* Allow RAM and foreign - both have proper cleanup */
> +            rc = guest_remove_page(d, gfn_x(gfn));
> +            if ( rc )
> +                goto out;
> +        }
> +    }
> +    else if ( mfn_valid(mfn_old) )
> +    {
> +        /* Mapping already exists. Drop the references taken above */
> +        if ( page != NULL )
> +            put_page(page);
> +
> +        return 0;

Is this correct regardless of p2mt_old?

> +    }

!mfn_valid(mfn_old) doesn't imply there was no valid mapping. It could be an
MMIO one with an MFN which simply has no associated struct page_info.

Jan

