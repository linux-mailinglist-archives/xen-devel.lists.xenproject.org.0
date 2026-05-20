Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAMCJatVDWr9wAUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:33:15 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E535882D1
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313585.1583712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaUI-0002Q1-EF; Wed, 20 May 2026 06:33:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313585.1583712; Wed, 20 May 2026 06:33:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaUI-0002N7-B2; Wed, 20 May 2026 06:33:02 +0000
Received: by outflank-mailman (input) for mailman id 1313585;
 Wed, 20 May 2026 06:33:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPaUH-0002N1-Ce
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 06:33:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPaUG-00Bfqv-P9
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:33:00 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d5597-2eae-0a2a0a5409dd-0a2a4505a62e-8
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:33:00 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d559c-aaa8-0a2a45050019-d1558036d132-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:33:00 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so48881635e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:33:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4902ea3d876sm4063645e9.30.2026.05.19.23.32.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 23:32:59 -0700 (PDT)
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
        d=suse.com; s=google; t=1779258780; x=1779863580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H4uoct5i8SKm/46ae8IMjvR9emVUQCNhrW9pVwxf598=;
        b=OUbTnoZzI+4kPSF3tnAIs0xdgnem8MYcgWlAAoXbNpaf5vLKQ2GNAU9sN5pJhjtmfI
         eQIs+rmKipQvq3Mr1fB62cigC5UJFY3MlGE34XRGUrN4mTt0OM/Y23lL37peQTX4Mwjl
         WsnekxpTzV1Ie3gomU/a2RXrKFdt/yeFox1rqgr3cOgz0UFIRiD3aolCscMH/zrqM+uo
         oytu6bA77TSJo6Dwnh4Z/Zyktgs6vhGZlxBe5j7Oko9fgNtEgLhFe+pEASAph9rxg9c0
         EWCqBAHLmVrz5L2JalCqdbbXmYy2QbUF8jEf2fSThKHfYnnbblbslZTOpBYqIlHaPMyu
         Mozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779258780; x=1779863580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4uoct5i8SKm/46ae8IMjvR9emVUQCNhrW9pVwxf598=;
        b=fT84O4fNqCF/kr0juEhOdmbZeEAnbuQONDq7NCe+s4QW/bdEVHIcBizbHhZXE0pnZr
         zgeh/zDa6LsS79n36BtWfD49HxRXcgIcrsQ6yjsW2Pb09Ts7FkRHXwkSDk9WQc7SO/Vr
         Y4kvIK8TtWeTb0kkyVxYmVDJQez/ZnF3mCee+FVRF/4n1FmLj9WlNbs6XfMX6Lt6o+Si
         5rtmo2w2f05CC9QHiN/eZUqlsK+PTcPMNoi1p36HKb7uilI/du1F0YoAzs9PwfY6OX8H
         MVkxVMwk1hcHGL4VdaNEYLNSzQiEdB+/FKLnfnznuxwZ9TfZKAP1jjxko45GJqYAVLnT
         QjgQ==
X-Gm-Message-State: AOJu0YwXuLLqSa6F8HEdvHSmEoOcw/Ue4Pjq+dfRT8jtiLDN9D5JVfe9
	0BmLblcHaoiCBFWqUHfj7naUXn145tAlJedzrbw4vMTjfexxoU1z6jWxuEGYqGe2Og==
X-Gm-Gg: Acq92OHpaRgVZ2o7e+sAByj5S4R46lo+n7anXDtVT1yS9gjwVMS06vr8Dc28pW7LNtl
	vazZ+pP0ILH4AROZoYpoAzr0QnpQMjfzv3TwoIPJxnym1H4WkmMY2RxA7uzn4IgZVB5rEjduY1E
	oL3qckcoLhYux6aYSXIaQblv/vTiMRd1xzJi5F/yMRKB0B8cJ/Lsf9jrAUgncZn8OZBmC2I9z/T
	8Pshgdkv2lZsIj7bCBtm9TZTXpMre2bwD6KDvkih362m6QmM2T1GvOJQwJWU8a9Z5CvnKjFYvCg
	egVd3jnQHgenYfQsSkvVRjOfgUaAloLd23YBx5bZ/NjXHj+Crg0DkIT5GPHIlcpCKxCZMCVYxw6
	JhMY+rNNlq1YJF0DAIPcLwL9kE4E+tfa4OtCwaIpElIw64E/y/6qa9/PwpzwS68Hj8PRocixMyY
	i37FW/sPHbTLFscfm0RzOuCgIddfnMSlcWecBuMaqQlWA5vmQN4xcrMh+qqDv4CZpIxD/qA84Rs
	A0k2/PmNGitb2M=
X-Received: by 2002:a05:600c:4692:b0:48a:906b:14ca with SMTP id 5b1f17b1804b1-48fe632579dmr353703805e9.20.1779258780244;
        Tue, 19 May 2026 23:33:00 -0700 (PDT)
Message-ID: <a477f883-b1ea-4db5-a073-8a136bcb8387@suse.com>
Date: Wed, 20 May 2026 08:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
To: dmukhin@ford.com, Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117761.8631fc262581453bbf619ec5b2062170.19e3baea399000f373@vates.tech>
 <ag0jtx6yNpPI3ZTD@kraken> <ag0pOByehq3/KGkd@kraken>
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
In-Reply-To: <ag0pOByehq3/KGkd@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779258780-E2392443-D66771FA/0/0
X-purgate-type: clean
X-purgate-size: 1018
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo,ford.com:email];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:teddy.astie@vates.tech,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
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
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 05E535882D1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 05:23, dmukhin@ford.com wrote:
> On Tue, May 19, 2026 at 08:00:07PM -0700, dmukhin@ford.com wrote:
>> On Mon, May 18, 2026 at 05:21:26PM +0200, Teddy Astie wrote:
>>> @@ -386,16 +380,15 @@ static int __init acpi_parse_dev_scope(
>>>  
>>>          case ACPI_DMAR_SCOPE_TYPE_ENDPOINT:
>>>              if ( iommu_verbose )
>>> -                printk(VTDPREFIX " endpoint: %pp\n",
>>> -                       &PCI_SBDF(seg, bus, path->dev, path->fn));
>>> +                printk(VTDPREFIX " endpoint: %pp\n", &dev_sbdf);
>>>  
>>> -            if ( drhd && pci_device_detect(seg, bus, path->dev, path->fn) )
>>> +            if ( drhd && pci_device_detect(seg, dev_sbdf.bus, dev_sbdf.dev, dev_sbdf.fn) )
>>
>> Looks like `pci_device_detect()` also needs some refactoring...
>> (Probably out of scope for this series, though)
> 
> Oh, cool, that is exactly patch 3/5

Might better be done the other way around. At least then there wouldn't be a
line length issue here, afaict.

Jan

