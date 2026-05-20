Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBcQB8FWDWp4wQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:37:53 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 827815883C9
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 08:37:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1313598.1583730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaYk-0003f8-9I; Wed, 20 May 2026 06:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1313598.1583730; Wed, 20 May 2026 06:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPaYk-0003cI-6W; Wed, 20 May 2026 06:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1313598;
 Wed, 20 May 2026 06:37:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPaYi-0003c9-Pu
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 06:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPaYi-004QKv-5g
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 08:37:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d56af-e002-0a2a0a5209dd-0a2a4505a774-4
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:37:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0d56af-aaa8-0a2a45050019-d155802cd91f-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 08:37:35 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-48e82c23840so35782035e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 23:37:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48febe6b9efsm188750155e9.5.2026.05.19.23.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2026 23:37:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1779259055; x=1779863855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Zl5QevfXhi7Er0je9+mWVEjuKoO5f6FlDWf04AEBWQ=;
        b=BKwoT8LsSC/XhK9K/M9diqwwtFBA+z+5EU0M+Q5REe4dYthUnbcmp2JdLW9sOdkphD
         iwBPUp+jzNI/wHJzrmV9F60X3UIK3bDqoxYOCaP4luyuQjbztR20g5GLUlJEnqBEaLGI
         DJCAsPuIMAlXV8+oDYbwpv8ld0xGkJ0Fmg5N0BMTvf8qJBf7WUm3EihSraJGswumxUw3
         Uc2mo83zUG2g529R7mS97huUA2D6KnB5VRxBetx7/tJDMoygERWkOasqyO6lJ3qWyqYM
         8yK/ERvs6VpVbGU7Uz+kq9jKNMHen06OLANMJl2A+rua77xiKigH5eQbDzBDfdy6GL+5
         1Wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259055; x=1779863855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Zl5QevfXhi7Er0je9+mWVEjuKoO5f6FlDWf04AEBWQ=;
        b=XDK6g+xuW3WqXXJ7Nx1OWJY+VQUVUYxhaG3VZdDA8v8dzmyM0TeLe/rRYHsnj8wFCu
         KQjEMafJfGRzyUckbdxbzC9HxamDEbHembD+o5n8P4iMwW4Nt7wy9P3Ru86wMKZHACp2
         pqnlpnpbmbcVy/XGjzM/bpen3JidOxPoZIeFdyaHQbG0Pc39gpNNgHrjhqwZS3YP8dwU
         EPMBAHBk3FPF2OuCSan+IEptBTMTLQnO7wJU54czBrrq1qy7JRo3TpEsAbcUSt+sUvlJ
         APMOfKcU8rw8rtT4i3pQa3gVgm24XZNCYEzEFB/mqE+Zu64XJwJEMrCw8UfZhhgTVB80
         M9vw==
X-Gm-Message-State: AOJu0YxpBLgzgpCkAuWZlJZjg79qhQQ5Gzln16ksKEyC6pwpFJxPCw9m
	nBhEueZmY2SmC3neo8UcCYhFLmOFBUxCPPuKVhCVDYiZq1OuVKI7aCFBxUu/TYZ6eg==
X-Gm-Gg: Acq92OG9Dyw3qh2B8qOmTZn7VpXff/pT8VjavHAiCnaO9YXRKhXoxpX9kLL4+W5v8b1
	SxM3VryubUeoIZ8sX4d6MbvcIt5V8zMhZSeyxRQPItbcLMx/bITXNKBs02QKfc2t7gLvzGPBiP6
	W5nyfb62GOQh4oVawwTe2G/PuEmzeJiK+RVRbRjD9kumelYKppOvYJ2w9s5SiHDxH7XzjjMT8w1
	D+h/04SW8NzcFTFzTPlsdrGkTgLS9auoewAkOvOXcdHnvLulU3nKeEWrfkgB5vg/ZpXDWIopgbU
	OMl7keRtpzcBZun/rAgX1toWlwyIU31heMeMa50De9G/sex+azNWtt7kJLZNC6TkjJU+nN/PBq4
	UUV/smHhbzJCP9ufCUPLD11X4a4vgQ5b2E989whHWXl+ZkGb1A4l5UOiHcYsz+6q2XhvEq6PYKy
	Ip3N0K1jT9UvWSQ8LKYEmooiGcSSdmqHT01bG5JV9kHnK0kGzY+HCIFNvX4s6aBgDVjEXUgNLJE
	7fH7NhIXz8M14E=
X-Received: by 2002:a05:600c:8715:b0:490:b07:5f27 with SMTP id 5b1f17b1804b1-4900b07600fmr231818225e9.24.1779259055492;
        Tue, 19 May 2026 23:37:35 -0700 (PDT)
Message-ID: <194504fb-686c-49d4-a962-44c407e39a74@suse.com>
Date: Wed, 20 May 2026 08:37:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pci: Use pci_sbdf_t in pci_device_detect()
To: dmukhin@ford.com
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <cover.1779116255.git.teddy.astie@vates.tech>
 <1779117762.8631fc262581453bbf619ec5b2062170.19e3baea7d1000f373@vates.tech>
 <ag0oovFrGircUaut@kraken>
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
In-Reply-To: <ag0oovFrGircUaut@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1779259055-DBB60443-DBA2172D/0/0
X-purgate-type: clean
X-purgate-size: 761
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,ford.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@ford.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 827815883C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 20.05.2026 05:21, dmukhin@ford.com wrote:
> On Mon, May 18, 2026 at 05:21:27PM +0200, Teddy Astie wrote:
>> @@ -1510,25 +1508,24 @@ void __init ehci_dbgp_init(void)
>>      }
>>      else if ( strncmp(opt_dbgp + 4, "@pci", 4) == 0 )
>>      {
>> -        unsigned int bus, slot, func;
>> -
>> -        e = parse_pci(opt_dbgp + 8, NULL, &bus, &slot, &func);
>> +        pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0, 0);
>> +        
>> +        e = parse_pci_sbdf(opt_dbgp + 8, &sbdf);
> 
> The original logic was ignoring PCI segment,

Not quite - it was demanding it to be either absent or 0.

> now the full PCI address is allowed.

This behavioral change (if indeed intended) definitely needs mentioning /
justifying in the description.

Jan

