Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jgXpI3abM2qyEAYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 09:17:10 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC40269E065
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2026 09:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VXlgxKvQ;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1340798.1601536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa6yT-0004uo-BV; Thu, 18 Jun 2026 07:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340798.1601536; Thu, 18 Jun 2026 07:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wa6yT-0004sN-8n; Thu, 18 Jun 2026 07:15:41 +0000
Received: by outflank-mailman (input) for mailman id 1340798;
 Thu, 18 Jun 2026 07:15:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wa6yR-0004sH-Of
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 07:15:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wa6yQ-00BG4D-Iy
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2026 09:15:38 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a339b13-bab6-0a2a0a5309dd-0a2a4509ce54-34
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 09:15:38 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a339b19-2497-0a2a45090019-d1558033dc38-3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 09:15:37 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4905529b933so4864755e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jun 2026 00:15:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2c3782sm55080138f8f.25.2026.06.18.00.15.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jun 2026 00:15:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1781766937; x=1782371737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iJBImAnfXL7aaelFuh07LdPrq4FQ+RaETJoOINH3lCg=;
        b=VXlgxKvQSMyb/6an4rAkqNJKYq4kO7IUHdlDt/JKjg21nGb9EO3IGPhzUHF93dH5n0
         KZGNTYOJbXC6fs/E92f2PgleikbDmQSg293k2JUdim8TvUWMHY6Ebx8yP+9zLce1RWuM
         /LYt95UMKbNc89EF8YXqkKTthcZbmXukRobsl+GLAOjGyT6KdTcP2bNrHXYdRP8KpPFX
         kP4aJ8nXgPTVVy4Jw20c3/nQNCzyITkEvaPxSAJtzE4lofFeJaw2xSct5C+ol+C0tfFF
         AG2Cp/6gmF+xppX+RqxTXGY3dTvvxA2mspT9/4S6O2iqoNC2vpJL0w8bkBpVGTfiowfU
         y4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766937; x=1782371737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJBImAnfXL7aaelFuh07LdPrq4FQ+RaETJoOINH3lCg=;
        b=AWUA19fCvoZcDSZxxa2H74Cunhclm4KT0hA6mFmzmkBuCXP3rX9qg7kdlWEIKc7IpB
         /m4L6/LZLmVDBixxafjR2IQcoQNzpdvAAnDURH3isuBI4HczctOaE+5/0wS02vR1Qzks
         OkQd5J1sMP2STCFuA0I3KETbGoXjlq5FptgX30F4TnYwWCTi1nNtOuOvV0KYwsp9iWlE
         9pKb8wJUqcCMx8b7KVzFgutoHV8jIlbngWOIzNzdtL5p1twetyUSZ8jgHcjCVII/TbxU
         KcGltn1o6VX6yUH8yz98JwL47Jb2Cq+UjxNVQoqBbLiikyDBOlY50xncDuPZL84V3ccx
         yW8A==
X-Gm-Message-State: AOJu0YwGgkP19iPbTDRY8zsbMaUlPvrefSlKa7tStETGeBq20SrU4I2I
	XFUpPQZptaLSyp4Jv4VfTkh4xTZmQbYPQ+Rvc/KZmOMDX7gEC2m7BgRwPVac+5gB8w==
X-Gm-Gg: Acq92OHB2aICuS38a6gA9iVAmmoBQ7PBfUFXsKAzAKad28FCZAGVBJFHq1f7fwj2mkY
	elsbYGGMdGahrIGIEXxi5QAfx+fG1RFeHH9XRoU4DFOwTYhs+LNCjzXdXo0X7Qr3lz9Syd+SqDg
	wOkbIeo5ikdV8KTfTO7wWzNJeMDlQRi0Ph95qv2UwFkYM6BaURgqacFFv0GDBg5nT+GZ8uOEPOC
	3E8KiVCI9+/u8KhEPFnsgn1/a/AZPBGN3AyX3y2wQ6W07bBhKmy+LA5CVSKC1HYmuIZGl0Z9epT
	J0AUpZfqmoQSjj9a189EqUTgrp0rJpWsw4tBg52DbIIAt75KN1htnqbJSBMo01SfWxTXORvBxz7
	SF46DRSJ5nKBTgnjGDmXmTv97SDcgP1hHzlMbr/pLamej3r6ccRHKF/Fh6kY/t9rEgUghhk/yG+
	B+miKAQDLnhLpio2XYr/rKD1YRFGuGZtWHu64b3jp9TcmIEBhVxeTaMYqWX24x6puUGyXSAP8TZ
	08g
X-Received: by 2002:a05:600c:4e90:b0:490:cb90:3e13 with SMTP id 5b1f17b1804b1-492333e298cmr118032145e9.21.1781766937186;
        Thu, 18 Jun 2026 00:15:37 -0700 (PDT)
Message-ID: <5379dace-04d4-40ad-ab87-7043a5b24ee4@suse.com>
Date: Thu, 18 Jun 2026 09:15:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.22? 6/7] x86/domctl: don't imply I/O port
 permissions from I/O port mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <ad1eb834-b2f2-4db2-b2fd-9d7f5bb857a9@suse.com>
 <e88a6015-8867-41a8-907d-b6749b1d2549@suse.com>
 <ajK644guPV3lfJde@macbook.local>
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
In-Reply-To: <ajK644guPV3lfJde@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1781766937-42971A53-D66070EB/0/0
X-purgate-type: clean
X-purgate-size: 4674
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
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
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC40269E065

On 17.06.2026 17:18, Roger Pau Monné wrote:
> Overall I would defer this change to the start of the 4.23 development
> window, and commit it then.  It's IMO a bit risky to change the
> interface behavior so late in the development process.

I share the concern, yet the Fixes: tags suggest this (and the subsequent
change) wants backporting. Which means we'll "gain" the behavioral change
in minor releases then anyway. IOW - I'm of two minds here.

> On Wed, Jun 17, 2026 at 11:30:04AM +0200, Jan Beulich wrote:
>> ---
>> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
>> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
>> I/O ports look to be treated equally.
>>
>> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
>> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
>> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
>> region special in any way? Clearly this can't work from a stubdom.
> 
> Hm, I'm unsure that code will work correctly after the change here, as
> xen_pt_register_vga_regions() doesn't grant access to the IO/memory
> regions to the remote domain ahead of assigning them?


Hence the remark, and the desire to get input from Anthony. Aiui there
either already is an issue there as of 0561e1f01e87 ("xen/common: do not
implicitly permit access to mapped I/O memory"), from over 10 years ago.
Or there is none here either.

>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -14,6 +14,9 @@ The format is based on [Keep a Changelog
>>   - On x86:
>>     - Enable pf-fixup option by default for PVH dom0.
>>     - The libxenguest bzImage loader now uses the system liblz4 library.
>> +   - XEN_DOMCTL_ioport_mapping no longer implicitly grants permissions for the
> 
> I would explicitly mention access revocation also, FTAOD:
> 
> "XEN_DOMCTL_ioport_mapping no longer implicitly grants or revokes
> permissions ..."

Sure, and then also ...

>> +     port range in question.  XEN_DOMCTL_ioport_permission now needs invoking
>> +     up front.

... "up front / afterwards."

>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -714,15 +714,35 @@ long arch_do_domctl(
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
>>          if ( !ioports_access_permitted(currd, fmp, fmp + np - 1) )
>>              ret = -EPERM;

For the comment below, note that there hasn't been any log message here.
Hence ...

>> @@ -747,40 +767,11 @@ long arch_do_domctl(
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
>> -        {
>> -            printk(XENLOG_G_INFO
>> -                   "ioport_map:remove: dom%d gport=%x mport=%x nr=%x\n",
>> -                   d->domain_id, fgp, fmp, np);
>> -
>> -            write_lock(&hvm->g2m_ioport_lock);
>> -            list_for_each_entry(g2m_ioport, &hvm->g2m_ioport_list, list)
>> -                if ( g2m_ioport->mport == fmp )
>> -                {
>> -                    list_del(&g2m_ioport->list);
>> -                    xfree(g2m_ioport);
>> -                    break;
>> -                }
>> -            write_unlock(&hvm->g2m_ioport_lock);
>> -
>> -            ret = ioports_deny_access(d, fmp, fmp + np - 1);
>> -            if ( ret && is_hardware_domain(currd) )
>> -                printk(XENLOG_ERR
>> -                       "ioport_map: error %ld denying dom%d access to [%x,%x]\n",
>> -                       ret, d->domain_id, fmp, fmp + np - 1);
>> -        }
>> +            ret = -EPERM;
> 
> Should we add a dprintk here at least, to make it easy to identify
> what has gone wrong from just looking at the dmesg?

... I'm pretty uncertain towards emitting one here. Similarly
XEN_DOMCTL_memory_mapping doesn't emit a log message if either of the
two iomem_access_permitted() fail.

Jan

