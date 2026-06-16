Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZqsSLLAfMWr+bwUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:04:32 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1937368DD9E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2026 12:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=SyfsTbZn;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1339000.1600102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQed-0007jW-K8; Tue, 16 Jun 2026 10:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1339000.1600102; Tue, 16 Jun 2026 10:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZQed-0007gk-GQ; Tue, 16 Jun 2026 10:04:23 +0000
Received: by outflank-mailman (input) for mailman id 1339000;
 Tue, 16 Jun 2026 10:04:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wZQeb-0007gZ-Jd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 10:04:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZQea-0098VK-Vt
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2026 12:04:21 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311f9a-5cb7-0a2a0a5109dd-0a2a450b8e60-24
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:04:20 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a311fa4-212f-0a2a450b0019-d1558036f165-3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 12:04:20 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-490b64c8311so43085525e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2026 03:04:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa97227sm67387885e9.13.2026.06.16.03.04.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2026 03:04:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1781604260; x=1782209060; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GiAlp9BCZwkE6bxzN8gqGAcwGypgSkYPFaot6kRB0bQ=;
        b=SyfsTbZnIoe1FGDN9hqI1XUJS8x3B0qrcVHPFz8kouLInC4mt7j2+j5Ou23BcQXo/s
         3Q5aEMY392wi/ZoWzJFZT7ASAuLbZ1QPheiumc5sXsP/t6w9VDRR0X/f+fWkHHG8KDow
         4xqE05fDBNoGQFkrDSwPkhpENjgPKeJ5jZuvJK9OeG/MOoORIbO9DiSlz0ROHtTbyeBf
         Tk5f4IP0jh1goy905wDph95+QY8O7UmmN2deJnJ6aolw7O+tALLH3M6ZQvBTJiHu4Xa7
         jmBXRk9xYHcW1SLKW4ahG8OpWk24bMLh5JGezBurnBIhQ8ljFBSadyP66qIvw25WwO1P
         8VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604260; x=1782209060;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiAlp9BCZwkE6bxzN8gqGAcwGypgSkYPFaot6kRB0bQ=;
        b=PhevLJxZ+WlxwvH5E0X7cqBUnqicDJvEOAe0S/DT3coePl7IHcFtFJqhiL/DmRLPQ9
         67q6ivZ/iTh/ms4sYlaXxKpshGzI3KnSF751bS6fAAttXG6yElxVj+ZlOHQRgtVkHVrM
         ujvwUO/CT+NZi5jR/NTlExmAxIcM+z2Q/daZ4V9RY04MYxLmAEz3YXhHCvmJqzBZUuU5
         9xWwgoY35reqh86zQQ58kDlVkZiz34nxG20FtM3qhW7U1Lha4q/riBQHBONWEbSV5tez
         QfQoneVSmxPI24WjBsTXUDoSSa+VH1H63ONKgd7+Uc7PqWpN4VgNnTI/nxNHFVh6QpH+
         7CoQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Fx/+0BbsznQ7doGJ02gj9f/O0NK1j+z5M5KPvxPHxC7hxrLENUi4yIVJt9kbQnt2SQ427BITOXs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzOCdTM8quvjofZgz9wJJ+4gbqmIolw/hZaQ3ePftGjUKjFxMVu
	eJMlXc/CwbgQmqzMIIOQlgvWQKcVljiXOQugCBsIjKeFtTK7jxhudGEJmDjTWt6Frw==
X-Gm-Gg: Acq92OEjEY75PQcD8bcWAduNr0wOnp5GUEXl1m3qhq+bH61wiAyEIpN6/AxHDqZ94gG
	cu4XQp1E291mqsO4vIm8KQIJYFExc4kA68Ed6hkCH9C2seTboxr8kX3mlqarsCADgCvVhrOCuDj
	NPsyB5bM2ZdY+vVi0w6tZ9vMG+l7cOkGFiCGWRi57DjECX0RHjfOk68eRQ/HLuFcS2wYkvCTFLy
	fsqX6fBU9iT4+XW6lY/0FDRUBZi3B9vRtHJTCQAvWUxR4TSZgg5ViIin6dxcRZxapv2v6XQMMx1
	A9OYFqQ9QMzHW0xktBs/ATZ4G5NzVQNmdfcae0TVcmybLaz3TX47UpeO0CgHjEuXzR8zI6Vu+l9
	dRTFASJFj19nZ7WjyEioazSGSHcihwgssfmeAgDUMDFLLXoNMMTVxc+RnUNhA5NTfqfgSwNWSkg
	xxkjJGDAtNA++j4E8Jf5vW0uOcghNChATHRSVplEwEW18ZDaLf+LBhVkaxgFzWeqS/qduWlngNe
	E5SC/v9r/1R2HE=
X-Received: by 2002:a05:600d:f:b0:490:c2a3:23cf with SMTP id 5b1f17b1804b1-4922ffbed65mr36017655e9.34.1781604260054;
        Tue, 16 Jun 2026 03:04:20 -0700 (PDT)
Message-ID: <e69be05a-410a-4843-bc31-7b4979634137@suse.com>
Date: Tue, 16 Jun 2026 12:04:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] lib: make safe_copy_string_from_guest() validate
 input
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Daniel Smith <dpsmith@apertussolutions.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <7e492b98-26d5-4d90-a703-ee25beae7e23@suse.com>
 <1781603736.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@vates.tech>
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
In-Reply-To: <1781603736.8631fc262581453bbf619ec5b2062170.19ecfdb9b7d000701b@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1781604260-19969F3B-5FFA18E0/0/0
X-purgate-type: clean
X-purgate-size: 1299
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp];
	FREEMAIL_CC(0.00)[citrix.com,xen.org,kernel.org,vates.tech,amd.com,apertussolutions.com,gmail.com,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:dpsmith@apertussolutions.com,m:oleksii.kurochko@gmail.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1937368DD9E

On 16.06.2026 11:55, Teddy Astie wrote:
> Le 16/06/2026 à 11:05, Jan Beulich a écrit :
>> ... rather than papering over guest flaws: Strings passed ought to be nul-
>> terminated (yet sadly libxc hasn't been doing so thus far). This way we
>> also avoid order-1 allocations, seeing that all present callers pass
>> PAGE_SIZE for max_size.
> 
> I'm not sure to fully understand the commit message, is it more about 
> possible PAGE_SIZE+1 allocations (hence 2 pages required) or something 
> else ?

The last sentence is about exactly that, yes.

>> @@ -24,7 +23,12 @@ char *safe_copy_string_from_guest(XEN_GU
>>           xfree(tmp);
>>           return ERR_PTR(-EFAULT);
>>       }
>> -    tmp[size] = '\0';
>> +
>> +    if ( !memchr(tmp, 0, size) )
>> +    {
>> +        xfree(tmp);
>> +        return ERR_PTR(-EMSGSIZE);
>> +    }
> 
> EMSGSIZE feels a bit odd as the issue here is that there is no NUL 
> terminator rather than the message being too large.

We don't know whether there's a nul somewhere beyond the maximum buffer
size the caller has indicated to us. So to me indeed the message
(string) is too large.

> What about EILSEQ as we encountered a malformed string ?

There's nothing wrong (byte) sequence wise, so this feels worse to me.

Jan

