Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KFZKTArxWnb7gQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:48:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C4335750
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 13:48:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1263982.1555737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k8d-0006oi-T4; Thu, 26 Mar 2026 12:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1263982.1555737; Thu, 26 Mar 2026 12:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5k8d-0006lq-QK; Thu, 26 Mar 2026 12:48:39 +0000
Received: by outflank-mailman (input) for mailman id 1263982;
 Thu, 26 Mar 2026 12:48:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w5k8c-0006li-MB
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 12:48:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5k8b-002uxV-UO
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 13:48:37 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69c52b25-5cb7-0a2a0a5109dd-0a2a450ca664-2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:48:37 +0100
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69c52b25-f93d-0a2a450c0019-d155802bf112-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 13:48:37 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso11596635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 05:48:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4871fbdd555sm26712725e9.2.2026.03.26.05.48.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2026 05:48:36 -0700 (PDT)
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
        d=suse.com; s=google; t=1774529317; x=1775134117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KGurtcmdLO5dh65wB+IVIywIhpmVvZR1XLsJ+8rkUl4=;
        b=f1QHF8VMI56qUF/KygJwZmotFDWOwbixtvZOy1xVfWU1nzccZJBz12zW5WKCQlYX2a
         1JgrNjic8H/qgl3RHW7qwkCvTmKxb2y3H7myrm4g3azDhA5JiINUWA/7/wapuqEY8ik9
         iowd47iKa9lrTWGXmYFN2NbdFVwGrGCQHqJ4vicxD2lwBDHB+byB9t+c0+tT/sItYf9t
         kcAtoXID3bWznCl2hYogfVrZUO7D6E8A0sgZt5+xQOEvx90M//l85rmBVMoDwdcRCc7e
         Hb9itVf+46+jvJPd9LVPyhbVHopFOEnMuuwA1+fFgGnYAVKHHv6QzkkSIzkPgym8SjqW
         Xjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529317; x=1775134117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KGurtcmdLO5dh65wB+IVIywIhpmVvZR1XLsJ+8rkUl4=;
        b=AmWfRzQAQjNFcdY7Cx2YolaMPKSMmuVwjM8NxHdlPuWFeLAlH/Gtgshd2v5aWYlyOM
         7yTpL1wFJxghW82D/ZndmYOhFAGITNAW0LCt0bsF2/tYHJt6SyXAOzxrMYisKRDqqxAt
         FItlwpGBHXO3WzWhhYlZC9rinbVW/8y6DjvkKSoW5IIbDQZZ/txA+E61Ibr59RJycITx
         5m6xDfP3CZ6GxQ4P64/Iw7HpVo3pcehSA//NnALiGqDcb3+FwLRFW8Rj9cOPPOntZiEc
         8hg8/lSDdqxY2F2dK3Jjpwll5XikSE4EXP2CTo0Y3++C+TykPXzuNvC2MCoG04HKADBu
         IT+g==
X-Forwarded-Encrypted: i=1; AJvYcCWEpYL6Epnjh8/Se7/SSiV6dm/SV5JbNDuQIuy7gKmlP3sW2gWayybBY3dLzn3acNnsYa1FX3YNBPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwC+iw+pe+SthTl3magI+UfqfV0uLdNdK35tLF6xJWsg9kT+4gl
	bUFdGuSKkMjMCK0KVCf7puA5QoR9DfcdJ5zqZdCWPLIj9EO6m37+98Y22wuhVYqyyw==
X-Gm-Gg: ATEYQzzfRVS2cmEnxv73ELbReFSEYWNqyTI2b4kfW9i5O4vuUPD0vTLnomVlUaPocAj
	+uVfLtS+c/gmS+/EIvjxR/Mpn9coutYXQffYkYuuXaO2+IJenu/yCigCjxz/GclC8LPw/6KQudh
	d0S69+xLchSaDOH38H5xy0tdtupcb2plHyxxjIMtLicJIcd6mHmeqJ6DLFUp6hXNvccs1KS9hLh
	d8yAxTGokhKWpgjMQVP3xoWZtxXHUWzbj/37F7OEf0jPiXhPMQ+aiHEEofjjU+QYj3VAGcpUuq1
	bOU1RXUaGlL7oEDql0GaBTSlB1DW6iqwYspIdggttheGfPORnotxSCWUUvkPJb7s4g/lRRjQbHF
	3g+neaHJhEPSTQC7IbzkQNgnCTxxE8ZfsETja/0qktzNa0qCiG0LRN4oWf5vhiWvAO0l7LBNOVw
	Yhmsu5uQPIBvok7SYq4NqQ9mH0fkSw5W2rCy4+bV1E9ErIbgNj4O4dGIJ80faDwcCOFCDa3cxU2
	wQfipcrrqgi74ejEe8enO7VCA==
X-Received: by 2002:a05:600c:4685:b0:486:5f71:5829 with SMTP id 5b1f17b1804b1-48715fc3870mr116803285e9.5.1774529317205;
        Thu, 26 Mar 2026 05:48:37 -0700 (PDT)
Message-ID: <67cffaf7-ef9c-4813-a829-ad5c962bc535@suse.com>
Date: Thu, 26 Mar 2026 13:48:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/uart: enable parsing ACPI SPCR on x86
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20260325145824.31601-1-roger.pau@citrix.com>
 <20260325145824.31601-5-roger.pau@citrix.com>
 <c930ee22-4cab-4bb4-b8fd-fa5e77f7505b@citrix.com>
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
In-Reply-To: <c930ee22-4cab-4bb4-b8fd-fa5e77f7505b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1774529317-F60B0734-7EE16C1F/0/0
X-purgate-type: clean
X-purgate-size: 1911
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 194C4335750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26.03.2026 13:11, Andrew Cooper wrote:
> On 25/03/2026 2:58 pm, Roger Pau Monne wrote:
>> Introduce extra logic to allow parsing ACPI tables extra early, and use it
>> to parse the ACPI SPCR table and obtain the serial configuration.
>>
>> This is gated to the "acpi" device type being set in "com1" on the Xen
>> command line.  Note that there can only be one serial device described in
>> the SPCR, so limit it's usage to com1 exclusively for the time being.
>>
>> I can't test the interrupt information parsing on my system, as the
>> interrupt is set to GSI with a value of 0xff, which is outside of the range
>> of GSIs available on the system.  I've also assumed that the interrupt
>> being 0xff is used to signal not interrupt setup (just like the Interrupt
>> Pin register on PCI headers).
>>
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> WIP/RFC, not sure whether there's interest in attempting to pursue this
>> further on x86.  So far the device I have is also exposed on the PCI bus
>> aside from SPCR, so using com1=device=amt also works to detect it.
>>
>> Posting it kind of early to know whether I should try to polish it for
>> submission or we are happy with not having this on x86.
> 
> I think we should be using SPCR/DBG2 when available.  Getting serial
> configuration right is always tricky, and we might as well use the help
> that Microsoft have forced the OEM/firmware world to provide.
> 
> But, I think it should be automatic when the user asked for any kind of
> serial.  e.g. console=com1 with no com1 configuration.  The point of
> these tables is to provide an enumeration mechanism where none
> previously existed.

Hmm. In the PC world COM<n> have well-known configurations unless anything
else is provided. With multiple serial ports in a system, which one SPCR
describes also would be (largely) unknown.

Jan

