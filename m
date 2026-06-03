Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id U1zbJ/TbH2otrQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:47:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9AC6355D1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Jun 2026 09:46:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=ElIDhSpI;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1325813.1591158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgJD-0005M6-0g; Wed, 03 Jun 2026 07:46:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325813.1591158; Wed, 03 Jun 2026 07:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUgJC-0005Jb-To; Wed, 03 Jun 2026 07:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1325813;
 Wed, 03 Jun 2026 07:46:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wUgJB-0005JV-5g
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 07:46:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUgJA-0062G3-7j
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2026 09:46:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdbda-e002-0a2a0a5209dd-0a2a450adc0c-8
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:46:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a1fdbdb-56b3-0a2a450a0019-d155802cb541-3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 09:46:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso118761085e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2026 00:46:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490b6d16f0csm36369975e9.15.2026.06.03.00.46.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2026 00:46:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1780472795; x=1781077595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H7o35ExRERVB7jzT3LSNLMX4epZ2DHPw6hlupjxS4QU=;
        b=ElIDhSpICihb4hj76UCbiHCGf49SK7U6JXdfH72xOzrwvBqNJ4l7rqSfcucjqqZXpE
         Pl3+0r1n6AtgJQ3gqxYmcMkPYlChWoIutl2W+v5Un4cBhQi6sfy92vTSQ+4HSb2Q4pQ6
         AqZFQJmY2JhVbN6La416DVpIZcR2FqRgg7ae6T52xu5VCTaZ/2Kw/7sXCli1AEBEc0iU
         ZAO20m6zgWCWVeNxTxUe9DaBAkifVI3SBr6GNhOJ/RHWRehjxwXVBD34457sSlU5JQwv
         4atthyvEIvjd6d56ZwiOFjl3yzjXVbNopfNtm7JOY4WsLW4L0HrJenRD6HMiWSkZKz1Q
         S19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472795; x=1781077595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7o35ExRERVB7jzT3LSNLMX4epZ2DHPw6hlupjxS4QU=;
        b=ClkHtYILTVXGLMs5hlJaXqslabBGRJLmQ6zNdUPVVxcsTrQpExr0A6e+WzNu9souZI
         r/rD4QJe+mW37b9GLTGu5wM4Lde2Nc1RJ7vAqEQS1Gd4jAkHn8fHMQSlyTPLXuc5C1P+
         /6Tg/uOKTGeg6vqEkcu0MpdjJSdY/tKru8CYBttpXOTZzchz3jYOwlNrNq4Cik7xO/P8
         IT+lP6cTnFvhudUYiJkxnoiWdrd7AymM4d2BI0dCgtjV0MYRInaGB2b5EJ4eNTWitfkj
         F/IOZMdpf1GzKqHZDaUMvJBnpX/zkRoxCU5nqHTKh+OgOZIBaRsDAdZMpQ9KB38hQXxm
         3ycw==
X-Forwarded-Encrypted: i=1; AFNElJ9HNrSA93QKuy1ccAZnozcsxj3lF19rCVed0T2gY6yI/GQ+gbZVbOgrNEOwIPpzQyQ8b7fiZxgd/hk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxpu6haN+n97KlGMayGBQvsCwx5mOgfu7pQhUo9R9RkYXxlq5ue
	dEEKoiVg0Qi6rZHyQOsEjr6fZK3s2yp4GMn29LKJSKfG2ZGY47MoSP/rMa5tW2hl3A==
X-Gm-Gg: Acq92OGMDan9VV0zHqvnmpviQ25fSv+ZDCk1y5eeaYJJVRrnigfcTi6N44KrlwUvnuL
	1UP+H45227FQJMLOqomyT9T1cVfRguvNiiHk+MySIb3ZMM3o1fOa7yOBT2YeLHO9EfjoqhzWH2e
	wW/sgB31ulc+4RxVsq1wXo5BZESgbwvGrdD8LiWXDZz8IV7pJ9lmbyId1/DzoMyDfYjKUIW10J9
	+TIsabxor7CrekVOyRTENoRYU3WW77rtQhz3iKXkevqrbyG2bxixr5dSuqxMXrBJcNPq+XEAJNy
	9bx2BFwA92tR+P+6Dm63nKTMWayi9bbvTkly/Qh7476AL10+2ZRJ5+9wO3TrcH/MWM1ojsgho+n
	z8R8biDnpyYe+QtE4RjbFkvOviQ1spM+Tweboc4B5UPSIOd6vIFUHZYNroEjNSxTxSQMjik9N6T
	b3+rkY6aJcooqBQ1VlREifIYpRs+GMUaruLuk/iwmcLYYkv1xJCTPelM05MS8ylUgayYVVLj5n3
	VU5pDyciGxWIJkKYUQca3HY8nTI4oT4rO0b
X-Received: by 2002:a05:600c:1d86:b0:48a:9428:5522 with SMTP id 5b1f17b1804b1-490b60de617mr31013235e9.16.1780472795577;
        Wed, 03 Jun 2026 00:46:35 -0700 (PDT)
Message-ID: <3bb5d37d-13a4-4cf7-9fd0-c11cb2441300@suse.com>
Date: Wed, 3 Jun 2026 09:46:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/decompress: resolve MISRA R5.5 identifier/macro
 name conflicts
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <025bc771fe1339dfae476037af86c6bfa1048382.1779654114.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <025bc771fe1339dfae476037af86c6bfa1048382.1779654114.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780472796-73D788B7-4082D7FF/0/0
X-purgate-type: clean
X-purgate-size: 2172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:mid,suse.com:dkim,suse.com:from_mime,suse.com:email];
	FORGED_RECIPIENTS(0.00)[m:dmytro_prokopchuk1@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB9AC6355D1

On 24.05.2026 22:25, Dmytro Prokopchuk1 wrote:
> Convert 'free' macro in 'decompress.h' from object-like to function-like
> form.
> 
> The object-like macro '#define free xfree' performs unconditional text
> replacement, causing conflicts with identifiers named 'free', such as
> struct fields in 'page_info' unions defined in 'xen/arch/arm/include/asm/mm.h'.
> Function-like macros only match when followed by parentheses, allowing
> 'free' to be used both as a macro and as a struct field without conflicts.
> 
> Applying function-like form to 'malloc', 'large_malloc' and 'large_free'
> ensures consistent macro style.

Hmm, are you sure things are consistent now? (See bottom.)

> Function-like macros also intentionally prevent uses where the underlying
> function identifier is needed directly, such as taking a function pointer.

Why "intentionally"? I rather view this as a generally unwanted effect,
merely acceptable here due to ...

> No such uses exist in the current Xen codebase.

... this. IOW I'd suggest to re-word the paragraph to

"While function-like macros prevent uses where the underlying function
 identifier is needed directly, such as taking a function pointer, no
 such uses exist in the current Xen codebase."

> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- a/xen/common/decompress.h
> +++ b/xen/common/decompress.h
> @@ -9,11 +9,11 @@
>  #include <xen/types.h>
>  #include <xen/xmalloc.h>
>  
> -#define malloc xmalloc_bytes
> -#define free xfree
> +#define malloc(a) xmalloc_bytes(a)
> +#define free(a) xfree(a)
>  
> -#define large_malloc xmalloc_bytes
> -#define large_free xfree
> +#define large_malloc(a) xmalloc_bytes(a)
> +#define large_free(a) xfree(a)
>  
>  #else

... the two macros down from here also adjusted accordingly. Or
alternatively (maybe even better, as that's reducing redundancy) with
large_{malloc,free}() moved past the #endif.

Could I additionally talk you into naming the macro parameters closer to
what they actually represent (e.g. "s" for malloc() and "p" for free())?

Jan

