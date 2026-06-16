Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FeA5KlEZMWpqbgUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:37:21 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F6A68D9CA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 11:37:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=CVzQsxwg;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1338947.1600039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQE7-00083P-0D; Tue, 16 Jun 2026 09:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1338947.1600039; Tue, 16 Jun 2026 09:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQE6-00080s-Ta; Tue, 16 Jun 2026 09:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1338947;
 Tue, 16 Jun 2026 09:36:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQE5-00080m-Hw
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 09:36:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQE3-0042b9-VC
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 11:36:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311935-5cb7-0a2a0a5109dd-0a2a450789b6-8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:36:55 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311937-229c-0a2a45070019-d155dd2ac1db-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 11:36:55 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-461a15bb819so371299f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 02:36:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa5120esm64271085e9.8.2026.06.16.02.36.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 02:36:54 -0700 (PDT)
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
        d=suse.com; s=google; t=1781602615; x=1782207415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ixl2QPvesdsSa9Hvxx3d222jcQRF2OXSjWDKP61uu8A=;
        b=CVzQsxwgJR326hVFrdQfc7gnFbQGzYgX14XSzJQ8Np97DRi31VpqXrw6+pQbcxdcDE
         bCwtg1zXy+1zZqCJqLNr0RlihF6CbF9zTdkQR0Z7SCuXu66R4ncIBztCas2RYVcb3kqs
         /0rZfp5UmFDXRDLasPIewWHFE5Ph6bJHkVVTlhEvFeYt/prVqvGgVCnigpWDlEX9M/gj
         Oa8mZehHfUehw5Jd6wuR/3HqX1cmdz+JvaqKln0ggl2l+RUpnqYnfz7FqbPnvbybzgil
         AIfEDJRPkwnpqI60PA+ke6O2ep7AG1tyheXL64EcqDJ4SlUpzXMpDF2P9fvwg1WgqctU
         38bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781602615; x=1782207415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixl2QPvesdsSa9Hvxx3d222jcQRF2OXSjWDKP61uu8A=;
        b=LLqth73FO+Z6Kq8kB3p3n8lotFoS0azBiIZ8zsvabO51seBzCkkbO2opN3uaaPtmip
         1KUrgSvEyy/9ZynGlobF6Ki8QSxhDCsRqU9V8ChpHTwUJUlZfyEc2REVIJG7YTTz3UTJ
         gbFXWDFvrRLpJF+MYGRuZSlK+S8mpUSD3QpLpkk8UlEepe9ayLWOt5r5/qlPERujy+w7
         k60hhy4inGiigqgggpY7JYA8c7Pyo31ybRW1jMA4CCgIx0qPk7oMeCeRbDlMcCQoWp9t
         ZKUmdZ9GOldaiukzdjWsfUd/sus2Pn+eF72xPaCRxHCM1P9TXWRI/pT0ETNSxkGt3FpR
         0iMw==
X-Gm-Message-State: AOJu0YyknCGQMWZK3XhL4znFoP9ODatTz/T+ogY8WRVJTY/UblokY+qF
	jvNATS84dueIxjcuJ9V7iZ9N/d0xdgDsB9zGMa7v9IFRtHM5gWza5ZcRPNff/MKzQw==
X-Gm-Gg: Acq92OEa7mLfUyYEbFPeII+UgSfrBftMu2MC7IILKIj1XrTNVdB1kZhea4L9sZaCTKw
	Pye5K2AuPgLIA9UyTS/QBOmqr5QKsyPLPWO/twrH7XZLLvLgt/LbIU+cBBl78LbC3ta8txbXFCw
	X/W+UwuwTaYMB4q0YCznw5FoTWaadk5s6ycPSEWqvPn/n6FMsnufe4RjYN42RymHv+tT1HJrRI2
	p8WIiCgkqZHCfZIVDspwarMSYb5yRvnj6XfNMzTmOHdENcEPSjp+GNkHTSillAhXAA6IsdEZZS5
	ZYM+ELsuUMMumjUQfCK/UBFL/R8HluVV+9z2HW/FGoi8ievwoqUf102FuavRFEaJsBtYc81QBlq
	joPfDhv5RURQl8zY3/rqzL8tOquxMn+VTlSfY3zT7TgqL7TDPeBlwaxXxBwHKXnhzI2j7JebiER
	MGWjwj9FFwzlTnivormEUxzm/nZXmLx9ETjy1u/2N4aJGFbUw8HlG07aYAh5sBBhAoEor+hKTI8
	4otj1rEX96q/FY=
X-Received: by 2002:a05:600c:524b:b0:492:1f06:ec9b with SMTP id 5b1f17b1804b1-4921f06ee55mr201284265e9.24.1781602615032;
        Tue, 16 Jun 2026 02:36:55 -0700 (PDT)
Message-ID: <532152af-30fe-4a70-afbd-b0b5c1d1382b@suse.com>
Date: Tue, 16 Jun 2026 11:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22? 8/9] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <e2f2cd28-a8f9-4455-8a3b-f55f8c08e1dd@suse.com>
 <a88eb54a-f0ff-4ad6-971f-ae526297a15d@suse.com>
 <ajEVgN9h78QFh6mZ@macbook.local>
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
In-Reply-To: <ajEVgN9h78QFh6mZ@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1781602615-22D77C48-D080FD25/0/0
X-purgate-type: clean
X-purgate-size: 3944
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,gmail.com,vates.tech];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:oleksii.kurochko@gmail.com,m:anthony.perard@vates.tech,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1F6A68D9CA

On 16.06.2026 11:21, Roger Pau Monné wrote:
> On Mon, Jun 15, 2026 at 04:16:11PM +0200, Jan Beulich wrote:
>> Rather than granting permissions when mapping (an operation that DM-s are
>> allowed to carry out, while they can't invoke ioport-permission), check
>> whether permissions actually were granted when adding a mapping. This then
>> also allows relaxing the necessary locking.
>>
>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
>> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
>> I/O ports look to be treated equally.
>>
>> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
>> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
>> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
>> region special in any way? Clearly this can't work from a stubdom.

Both of these remarks are relevant to your response below. I realize I should
have Cc-ed Anthony, for him to comment on them.

>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -714,9 +714,14 @@ long arch_do_domctl(
>>              break;
>>  
>>          hvm = &d->arch.hvm;
>> -        iocaps_double_lock(d, true);
>> +        /*
>> +         * NB: The double lock isn't really needed when !add, but is used anyway
>> +         * to keep things simple.
>> +         */
>> +        iocaps_double_lock(d, false);
>>  
>> -        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
>> +        if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) ||
>> +             (add && !ioports_access_permitted(d, fmp, fmp + np - 1)) )
>>              ret = -EPERM;
>>          else if ( add )
>>          {
>> @@ -747,15 +752,6 @@ long arch_do_domctl(
>>                  list_add_tail(&g2m_ioport->list, &hvm->g2m_ioport_list);
>>              }
>>              write_unlock(&hvm->g2m_ioport_lock);
>> -            if ( !ret )
>> -                ret = ioports_permit_access(d, fmp, fmp + np - 1);
>> -            if ( ret && !found && g2m_ioport )
>> -            {
>> -                write_lock(&hvm->g2m_ioport_lock);
>> -                list_del(&g2m_ioport->list);
>> -                write_unlock(&hvm->g2m_ioport_lock);
>> -                xfree(g2m_ioport);
>> -            }
>>          }
>>          else
>>          {
>> @@ -772,15 +768,9 @@ long arch_do_domctl(
>>                      break;
>>                  }
>>              write_unlock(&hvm->g2m_ioport_lock);
>> -
>> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
>> -            if ( ret && is_hardware_domain(currd) )
>> -                printk(XENLOG_ERR
>> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
>> -                       ret, d->domain_id, fmp, fmp + np - 1);
>>          }
>>  
>> -        iocaps_double_unlock(d, true);
>> +        iocaps_double_unlock(d, false);
> 
> I think the new behavior is more sane, however the problematic aspect
> of this change is the removal case IMO: we cannot be sure whether
> existing callers rely on XEN_DOMCTL_ioport_mapping also removing the
> permissions, and hence Xen no longer removing the permissions might
> lead to leaks.
> 
> This is a risk we might be willing to take, but it must be stated in
> the commit message.

I've added

"While no longer granting permissions upon mapping is "only" at risk of
 breaking guests, no longer revoking permissions upon unmapping strictly
 requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
 else a security issue would arise. In-tree code already does so."

>  And likely in a CHANGELOG entry so that external
> consumers are aware of this change and can adjust as necessary.

Will do.

Jan

