Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNk5G9h7+GkUwAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:58:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB2A4BC087
	for <lists+xen-devel@lfdr.de>; Mon, 04 May 2026 12:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1299684.1574236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJr06-0000zq-CR; Mon, 04 May 2026 10:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1299684.1574236; Mon, 04 May 2026 10:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wJr06-0000xq-9G; Mon, 04 May 2026 10:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1299684;
 Mon, 04 May 2026 10:58:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wJr04-0000xh-Bj
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 10:58:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wJr03-00166t-9G
 for xen-devel@lists.xenproject.org; Mon, 04 May 2026 12:58:07 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87bb1-e002-0a2a0a5209dd-0a2a4507b824-20
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:58:07 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69f87bbe-229c-0a2a45070019-d155802bb52a-3
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 12:58:07 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-488b150559bso26431175e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 May 2026 03:58:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8ff04927sm91439065e9.36.2026.05.04.03.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2026 03:58:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1777892286; x=1778497086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LKIQ3agNmn+xFm+fXKIGvWBnaZMUiberlBJm7WNgPCI=;
        b=ObIGMd24PjD8SXfC5mIPtsSomvTYrEBKVQm51GUhL+AtiCg7VvZEufKWYCnWNyWFST
         CnknArXTsYCKlF/OkK9YrlMvBF1HTsaUE1wvtAmtpQB6gj3JEK9aYwNAjm/NGiDzIzhi
         ov75MTk9bz9S011QWgP2ZQGzz9s4kOCHYWIoFraRFa1Qxj+PspN25yITKBF44KvyVJSi
         RB6HkpVv+LHOUKTICXoYJPjeDmig5Z6d2ZHEHtifSyQPyYwErFIh2Coz/vEuG3VOG4R3
         eKO2eqUJ71KaOETtK4Yw+f95gKT1Zq7iUNHX/tJ0tBwRDBS9JOJukhS+Pj+30Vw2IjDZ
         /VIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892286; x=1778497086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKIQ3agNmn+xFm+fXKIGvWBnaZMUiberlBJm7WNgPCI=;
        b=WvQ14JFp7ULTkaVuQz+1JasAKtk/qEO5OJnM0MzJw7hgAMp0amuzkmd+YIZ7vMsgH4
         dhxdipZ446k3rBldtRcpdiy/UqkTyp4y45q813mIGiQJ05fXBYonDYIdRr5+1dhLFpe+
         hPGOg8y/Hpc9msqipcNEbC/8prj/iT7vQmxjuX+vmuTwiHG/gjzBibb4L0AxwN0ClmtM
         ulNBnX6tlEYL0b/egu+Cfo5wKKYHqVWurttGd6vMTjo8sJ/QGLPLyEm0aXZpa8meAdCz
         9trZip9MvVNRhxHVYjNcdfGDwafK7Qudt6kHNXip4kcmIQsy/bQDTk7vFB0i70BfqkeS
         z4wQ==
X-Gm-Message-State: AOJu0YysNq4/n/Odbz/kEaTWDfXR6WbNXZ8x12Ziyx4EDkSUPghBZRTB
	Z8otkW2t4+47dZbXh7h/BTunZtlF2nylc2CXK+rtI36Gg2eK8sZ4vRmOJ86BXbfGCg==
X-Gm-Gg: AeBDietO1OVTRqmLaRQ0Dq0mGyWtUCedaaRnwPwigbSuntTGVeRPC0TQ4iOJdgPvXf8
	2gKXOwA3qVvHQBM0V6hzjbsCz10/3urxYE78ng425CkXjbzbtsszd0+Gnp/pXYPLNLIN58vLJ46
	D3VfMV/E51dGhNdZo6M9Si26adhJhaMJAxgtLigCsPgIBTqKcy4wpjoYstEYxy+JnMzt3c1A63R
	ccpRoLdrTUzDLSb7rFswJp0vlIIzoYtP4qSifNXF/SC2O2U/Sa7jGhdTOl2BnsHKxOvoko1B/ik
	RzRaCxRKVCaYGVvPsGj1xzpmSWkrvKJel9VaEmUIFwLWzV5AOk4Frb4psIPLpF1za5KSCtdkgBP
	KG7gEJCmvQ+JNqY/8gM9Svh3ZUimr08Fz2tbzKPeadt/umTbMAcX9EJy/b9HZOBUtk4SQjSKZk/
	D6kFlwnwk4rn9jXsXB5W3/Wf2d2aufUCMPnvGViCVTRoLYddv0j0MDqUTwKItxn47aYNjg7SYtN
	+Xz20XikSnYo3UjWIu2l095+Q==
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr106922375e9.27.1777892286525;
        Mon, 04 May 2026 03:58:06 -0700 (PDT)
Message-ID: <40c2ea90-e3ab-4d4d-b8a9-8d8efb2869ff@suse.com>
Date: Mon, 4 May 2026 12:58:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] hvmloader: add function to set the emulated machine
 type (i440/Q35)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Alexey Gerasimenko <x1917x@gmail.com>,
 Thierry Escande <thierry.escande@vates.tech>
References: <20260313163455.790692-1-thierry.escande@vates.tech>
 <20260313163455.790692-4-thierry.escande@vates.tech>
 <afCOS0Ufbk790t8J@macbook.local>
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
In-Reply-To: <afCOS0Ufbk790t8J@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1777892287-16C64C48-961970F4/0/0
X-purgate-type: clean
X-purgate-size: 2888
X-Rspamd-Queue-Id: CCB2A4BC087
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:x1917x@gmail.com,m:thierry.escande@vates.tech,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.xenproject.org,citrix.com,vates.tech,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]

On 28.04.2026 12:39, Roger Pau Monné wrote:
> On Fri, Mar 13, 2026 at 04:35:01PM +0000, Thierry Escande wrote:
>> --- a/tools/firmware/hvmloader/pci_regs.h
>> +++ b/tools/firmware/hvmloader/pci_regs.h
>> @@ -107,6 +107,10 @@
>>  
>>  #define PCI_INTEL_OPREGION 0xfc /* 4 bits */
>>  
>> +#define PCI_VENDOR_ID_INTEL              0x8086
>> +#define PCI_DEVICE_ID_INTEL_82441        0x1237
>> +#define PCI_DEVICE_ID_INTEL_Q35_MCH      0x29c0
> 
> In Xen we have a separate file for vendor and device IDs, called
> pci_ids.h.  Maybe it would be better to use a similar approach in
> hvmloader, and keep pci_regs.h only containing PCI register offsets.

Can't hvmloader simply re-use Xen's header(s)?

>> --- a/tools/firmware/hvmloader/util.c
>> +++ b/tools/firmware/hvmloader/util.c
>> @@ -22,6 +22,7 @@
>>  #include "hypercall.h"
>>  #include "ctype.h"
>>  #include "vnuma.h"
>> +#include "pci_regs.h"
>>  #include <acpi2_0.h>
>>  #include <libacpi.h>
>>  #include <stdint.h>
>> @@ -648,6 +649,47 @@ void __bug(const char *file, int line)
>>      crash();
>>  }
>>  
>> +machine_type_t machine_type;
>> +
>> +void init_pc_machine_type(void)
> 
> Since detection is done based on PCI device IDs, it might be better
> placed in pci.c, and so you don't need to include pci_regs.h in
> util.c.
> 
>> +{
>> +    uint16_t vendor_id;
>> +    uint16_t device_id;
>> +
>> +    if ( machine_type != MACHINE_TYPE_UNDEFINED )
>> +        return;
>> +
>> +    vendor_id = pci_readw(0, PCI_VENDOR_ID);
>> +    device_id = pci_readw(0, PCI_DEVICE_ID);
>> +
>> +    /* only Intel platforms are emulated currently */
>> +    if ( vendor_id != PCI_VENDOR_ID_INTEL )
>> +        goto error;
>> +
>> +    switch ( device_id )
>> +    {
>> +    case PCI_DEVICE_ID_INTEL_82441:
>> +        machine_type = MACHINE_TYPE_I440;
>> +        printf("Detected i440 chipset\n");
>> +        break;
>> +
>> +    case PCI_DEVICE_ID_INTEL_Q35_MCH:
>> +        machine_type = MACHINE_TYPE_Q35;
>> +        printf("Detected Q35 chipset\n");
>> +        break;
>> +
>> +    default:
>> +        goto error;
>> +    }
>> +
>> +    return;
>> +
>> +error:
>> +    printf("Unknown emulated chipset encountered, VID=%04Xh, DID=%04Xh\n",
> 
> We don't usually use the h suffix in hex numbers in hvmloader, it's
> more common to prefix them with 0x, so I would recommend to use the %#06x
> formatter instead.

I'd generally advise against use of # with a width specifier, as that ends
up awkward for 0. That is, %#x is fine and generally to be preferred, but
for a specific with it might better be 0x%0<n>x (with n=4 here). Arguably
here we don't really expect either of the values to be 0, so the suggested
use may indeed be okay in this case (while still introducing an example
which later may be copied elsewhere without much thought).

Jan

