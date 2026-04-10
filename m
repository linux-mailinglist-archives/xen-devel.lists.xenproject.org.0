Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAMJGT2Q2GlGfQgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 07:53:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB3A3D2798
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 07:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278306.1563179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB4mW-0005B5-5k; Fri, 10 Apr 2026 05:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278306.1563179; Fri, 10 Apr 2026 05:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB4mW-00059E-2s; Fri, 10 Apr 2026 05:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1278306;
 Fri, 10 Apr 2026 05:51:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wB4mU-000598-JZ
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 05:51:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB4mT-007Y9P-49
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 07:51:49 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d88fed-5cb7-0a2a0a5109dd-0a2a45069dbc-16
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 07:51:48 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d88ff4-0df0-0a2a45060019-d155802aa918-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 07:51:48 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso20463235e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 22:51:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d684b55fsm11900845e9.26.2026.04.09.22.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Apr 2026 22:51:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1775800308; x=1776405108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GCIIrjnoXTvZ/VJuU4w52WE3aRotI4x3NT2zZg8+K/o=;
        b=ed9vHD1tT8KEfBgZxevviMef1pqGSJQ0xolbXuqZoLsbTmmPwtp1U9FJXHrQONQbgS
         ykKJCKexq2hYkLBlx8UMmqJjSUg4R9FTX1VJxPIoQmw5O33WOXVcu+9dRHsj26x/pqXO
         XuGSLrjqkp534zVuq22+ocvhRZWhv5osQX9MWc1qBuUlIrFywlbocMjBXgV5Hz18f3aQ
         VpmSwZtQACusuqrlzcCkKydJDx6Y/ytgUz5KlcmEtm5OUd+ag1ffy0+jcyf9V7/qGRM4
         7jbxeTdbKL0NhsLyPg/SE/SwT1bpqEk6vbElQkxEBIG80VOon4JrcdlM6uJ6B5v24ske
         JUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800308; x=1776405108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCIIrjnoXTvZ/VJuU4w52WE3aRotI4x3NT2zZg8+K/o=;
        b=Vh+Qb+FO7dm6Jr06CcLCRxK75bxR6n9bZlzOd/1X4JhtylkN8URmZZGCAKG9u0w6L2
         87w27tr8JSj6x+g8/ttNcnuh0wJh4Bftj5oEYJxeuYtyuNDnuCkJstdmH1jb5Sckyxvj
         EjPNXMWpJIjhHlFZ/CmUHRGQFAnLvr6zsDXxTr36d9+ZuQ72jh3FYFEyA5D86E3nkGlh
         uZHBeVcK4Ool9NKB5s3v66xYcdeq9wBp2MlO9esWLZaIuqrvBrBy+KIMgJm9ceFE7A2+
         UD/MMz457fCxvn/52US3ArKrRpsilbeojPN52l2+hPWJN65YjP4fh/YnSDxfGkzl137E
         9zBQ==
X-Gm-Message-State: AOJu0Yyq3mGVV53NFMIZkp8hSvwiBk1dHJbYhwxJ+RYdqjQJTxSnsaWn
	A18NraKtunhanRzMb/uGzNcP5+BkQFeyzonefI7gT29PIss3wNg/TGj53Pfdnk7GSA==
X-Gm-Gg: AeBDietwOTPo/MGfc6VcOoHmTt+JomIRb9Haqr93vFv4W62domQEushSgvkPFIupS5v
	xiBcCUbSP0Tpmp3veUcLn2ZE+kgY9QvdPWhgfLtKratiWf0PE9s/MdOCON53esjxzGSIxwLutIJ
	palsUihO3wznlMpOqBLfdQ4LhOMM2vkhZ8Uz3CIGfn+wU+jhtlnbVqi1qdkYuxfgFIS91eRA02l
	vM2icWYjQPXqN34H4ZPG3+FmhOhPvlttcc0i3aGnaow1KTdKH7jnpHFbCI6rLcuCfUcscLdkcvL
	8Qbbx5UTN7zEEgaL2nLUL26OepAh8YOviEp3NqBsAyU22SQdoP1+OV4z/UskGj2kJIHIBfkgLS+
	FWa7mt9gQkG6KAMzQMhKkkKIWbA27U54NcQ9YNp6npFLHQzKu+C8e+ALEe32TdFok/YXKSEP3zc
	ciplxCKJVmYRvJ0jETttMRbYLAmxn0xtYdhLUvjgzYoSrH9+X4WGSXk7qg1KMa3/TA55vwvNYE5
	S2n8xfqbDj8oIJ0ZD804HswZg==
X-Received: by 2002:a05:600c:609a:b0:485:3e00:944a with SMTP id 5b1f17b1804b1-488d68ae78amr17176725e9.9.1775800308272;
        Thu, 09 Apr 2026 22:51:48 -0700 (PDT)
Message-ID: <c1b2ab3c-7d4e-4f1d-b830-dbf1c933178e@suse.com>
Date: Fri, 10 Apr 2026 07:51:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] VT-d: avoid multi-message-MSI check for HPET
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1903a57a-524e-4e6d-bd47-a87fadda4aa0@suse.com>
 <adfjn296dde_RQYE@macbook.local>
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
In-Reply-To: <adfjn296dde_RQYE@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1775800308-5FD3C3D8-20A2CC2D/0/0
X-purgate-type: clean
X-purgate-size: 1160
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AFB3A3D2798
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09.04.2026 19:36, Roger Pau Monné wrote:
> On Wed, Apr 01, 2026 at 02:47:48PM +0200, Jan Beulich wrote:
>> Having this immediately below a PCI-dev vs HPET conditional is (mildly)
>> confusing. Move that if() into the body of the earlier one.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/drivers/passthrough/vtd/intremap.c
>> +++ b/xen/drivers/passthrough/vtd/intremap.c
>> @@ -513,13 +513,13 @@ static int msi_msg_to_remap_entry(
>>  
>>          if ( rc )
>>              return rc;
>> +
>> +        if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>> +            nr = msi_desc->msi.nvec;
>>      }
>>      else
>>          set_hpet_source_id(msi_desc->hpet_id, &new_ire);
>>  
>> -    if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
>> -        nr = msi_desc->msi.nvec;
>> -
> 
> I'm not fully opposed to this, but maybe it would be good to add a
> small comment to note that HPET never use multi-vector MSI?

That aspect doesn't change - HPET code simply doesn't (and never should)
set .type to PCI_CAP_ID_MSI. That field should reflect reality (and HPET,
iirc, simply leaves it at 0).

Jan

