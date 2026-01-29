Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBWyDlVGe2kdDQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:36:53 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAAAFAFC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 12:36:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216314.1526236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQJr-0006q6-NT; Thu, 29 Jan 2026 11:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216314.1526236; Thu, 29 Jan 2026 11:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlQJr-0006pB-K7; Thu, 29 Jan 2026 11:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1216314;
 Thu, 29 Jan 2026 11:36:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g1vo=AC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vlQJq-0006p5-Gm
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 11:36:14 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6af0962-fd06-11f0-b160-2bf370ae4941;
 Thu, 29 Jan 2026 12:36:12 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so844355f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 03:36:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e131cf16sm14828342f8f.22.2026.01.29.03.36.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jan 2026 03:36:11 -0800 (PST)
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
X-Inumbo-ID: b6af0962-fd06-11f0-b160-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769686572; x=1770291372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nuj794ShzjiwHINyLt/hygEwzI7bgxPdXtXs1zE2QFY=;
        b=WtCLGh14vSEPY9wNgtpqXH3u3LCz/Uv1M+pROapasavOhAKN+qvQ5odjEaxd0YyRPH
         iGNR6at2uUEkatU5Ru60vluGptTamTyyOB4WDHzBhjP8mPhkqQXnG5/lBNjLlsn1p9iW
         Hj/hIEPdrsoUroO3TW3qomv/+dEQfl/0wjxq4aNrxp9ZQEELb4DgjMjO7QVONHWTaElk
         /MUNRF6hIubvCJs5VHKi2hc4MCQVmp/DDL4uLuDN/92XlnF9ncwshQzAd+j6kGXOky2L
         ZJ/z7ymeqd9QakUNC9+8SLxW8x/TwB9vU09k3Rqz+zvFCfOqjzJfrGnXA1eHoXL/WlV2
         sU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686572; x=1770291372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuj794ShzjiwHINyLt/hygEwzI7bgxPdXtXs1zE2QFY=;
        b=I5mytzWkS08qnLsfJjqWvGn3fg9oh+W7Rik109gh3PhZ2vP5R5pjUUtKLtAcmIFNH+
         V0kZt+XFg08llRxV59uaGQ5Wef2HLNxl5VM/Q3oeM1DIHCv6BgBZNAx8khL/e5FsVnyR
         jiPaHbL+Q8XEcgmmaCngG+HQhVhhPA5CgInV1EafEhIpwOhy7IYJkjRgoDEOmqRackNV
         KGjqitWWLP0CjZ7wZ5f1sGYVf0bt6ATDiqFIKXKE4U+5E2wfMgISJOsLvQU12xY4o2/h
         uShAKT8sb6U/Vf5KPKR176namhGiK6I7PP32MDu0Vucp9uZfQum9Gl9B3P/FGavMnZWg
         LbFg==
X-Gm-Message-State: AOJu0Yx0+WHb4/cBnwamRY/MG1lVK6RtA9XjOP+oMw5LSx2gzzqhxPEJ
	ZGRFfKbB4fhKh3BCVwhyFpo4sdfS9JeTS83/f259PZOdRdnMeSHuvjBTwtC3bf2yV0bQB8Ln+BV
	xj/c=
X-Gm-Gg: AZuq6aJdSSh6ZAxpqWoKiPYlxNAZQRmpwn5/yhDtD3e1mVYnmyHW9SYR6Kg3aM3aAgQ
	CS66wFYW2FmQhfTz4ScJBLZJaN5+beWm14qB9XMyGIDP0dR9oqPnbY7BcBYEySyhu7NOIj0xg4n
	mQxXayOrlBUb6JSN84G8cf71axLSdDsnFXGNPieKVkkZqw+2olAje27SgfSkYoDnA1N4v1C0MTI
	m6V4M2p831trf9vK5Q1CnV3o3zru8bF5Ix2VxHXEigc4hT9KUMOqNqIx7l3D9q4dFDvzzVmd2Re
	ys25Ashjjs9YHGulDUZDOZlFXXLKHNbV5QgB3lTnRLNu9YYRgZOoJVzXfAUBc0rwXkkAS5fHnNL
	nbONnPh3Q0DO35YJKSU3eXPbjVI69YPVOZ5ypYjVsNzUiY+3Lhp69PzglVIZZMR6pkWZiTQdrsX
	MxKI7hMsOu5He+yGLlIJp7ND4EqMmh8nVF8dsYrTymwSH/NqwD42hJlZ839wH6n7jA1No9H1dD2
	/Y=
X-Received: by 2002:a05:6000:2c01:b0:435:95fb:a0f2 with SMTP id ffacd0b85a97d-435dd1bc76cmr12560474f8f.46.1769686572074;
        Thu, 29 Jan 2026 03:36:12 -0800 (PST)
Message-ID: <0b46ca9f-bac9-4868-8229-067ec98ad7c8@suse.com>
Date: Thu, 29 Jan 2026 12:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] vPCI/DomU: really no ext-caps without extended
 config space
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>
References: <58091dc1-7bda-4536-8200-2d0a5679d4d1@suse.com>
 <96e90685-3321-4884-8fe7-f083c25ba7ab@suse.com> <aXsmOEcSJaztURad@Mac.lan>
 <e1cd0c63-c19b-452a-b967-cc51a0aed0bf@suse.com> <aXs7mpUU0qA8tFBA@Mac.lan>
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
In-Reply-To: <aXs7mpUU0qA8tFBA@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:stewart.hildebrand@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A2CAAAFAFC
X-Rspamd-Action: no action

On 29.01.2026 11:51, Roger Pau Monné wrote:
> On Thu, Jan 29, 2026 at 11:08:22AM +0100, Jan Beulich wrote:
>> On 29.01.2026 10:19, Roger Pau Monné wrote:
>>> On Mon, Jan 19, 2026 at 03:48:01PM +0100, Jan Beulich wrote:
>>>> --- a/xen/drivers/vpci/header.c
>>>> +++ b/xen/drivers/vpci/header.c
>>>> @@ -830,9 +830,14 @@ static int vpci_init_ext_capability_list
>>>>      unsigned int pos = PCI_CFG_SPACE_SIZE;
>>>>  
>>>>      if ( !is_hardware_domain(pdev->domain) )
>>>> +    {
>>>> +        if ( !pdev->ext_cfg )
>>>> +            return 0;
>>>
>>> Don't you want to possibly put this as a top-level check, so if
>>> there's no extended config space we avoid doing the PCI_CFG_SPACE_SIZE
>>> read for dom0 also?
>>
>> Hmm, yes, didn't think about that. That'll mean dropping the
>> "if ( pos != PCI_CFG_SPACE_SIZE )" from the body of the
>> "if ( header == 0xffffffffU )" then, i.e. the printk() there becoming
>> unconditional. It may also mean dropping "DomU" from the subject.
> 
> I've also wondered whether we want to short-circuit vpci_{read,write}
> accesses if the device doesn't have extended cfg, for domUs to be on
> the safe side.

May make sense, yes. I don't think I'll add anything along these lines to
this series, though.

Jan

