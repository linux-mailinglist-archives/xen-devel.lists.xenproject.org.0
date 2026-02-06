Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBZHJnCKhWkWDQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 07:30:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0881DFAAE2
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 07:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222813.1530508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voFLo-0007fE-MZ; Fri, 06 Feb 2026 06:29:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222813.1530508; Fri, 06 Feb 2026 06:29:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voFLo-0007c7-Jo; Fri, 06 Feb 2026 06:29:56 +0000
Received: by outflank-mailman (input) for mailman id 1222813;
 Fri, 06 Feb 2026 06:29:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1voFLm-0007bz-Te
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 06:29:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e1a9713-0325-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 07:29:52 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4801ea9bafdso10201045e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Feb 2026 22:29:51 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a68:95b1:80b8:e2ec:fafe?
 (p200300cab70c6a6895b180b8e2ecfafe.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a68:95b1:80b8:e2ec:fafe])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d835f0sm104113245e9.14.2026.02.05.22.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 22:29:50 -0800 (PST)
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
X-Inumbo-ID: 3e1a9713-0325-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770359391; x=1770964191; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l7I3grGE0i9bClpF/I10K1YRr3J6btGMAkpgptDyg/o=;
        b=FSRpkeEs1GoBZ6j0abLeYzJ76QTzmVCRV58hrc+rITwJPztbnc6xDX1W6OwowCYBSw
         AMfBgw3kX1bak8uGeZSFeMw6ef2JSu39RKW1dGQzjE9BcfaS2SqKg8Ef8Pynl8VD/cfW
         JtTYm6DXbIhREqoCyFxzfJEi5oNU1CvF9U823b8T7hPf902W5oPmVw0puCATgN9NEK/r
         V0Jm1YwN0fbTIfSydcfICMnibryg6eUAZxUNcoiyFbevX1p6YLCGIUAO7obmEnFUcnkr
         2MzQ8GpBZZ/T3bXRloUOfFxZNpbS1PxcsgHYG1KCudaJq6M5pqvE1EMcCLtGESYQExlo
         h1mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770359391; x=1770964191;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7I3grGE0i9bClpF/I10K1YRr3J6btGMAkpgptDyg/o=;
        b=O+AvC0mWUzmKcaUO6HiTnN3rC5I2G48A2X/8aF35u3GEyzQGC7vESXNx1rEf46qMx3
         e7XNIC0G6ACWT2VDsyS4WYSXXxTB24cnwxZk4kTdYEeDDc54ARhH0UEMDJTgYGUEyJJk
         u6Z50dqgCryKEBpYeNA22G23xY7p4c+P0gOYkMDgqBFE5v+4Wb+nnwHhw6uNn/DeyObF
         gQ+WZ4kkbPVD9UVAcC5XIRtwF+KSOeZOm9pCqtCijLtUesWfMriS9toTgYidTiAysY9D
         ldG2sLYuY5cP6zaFtyQ8o5qRA0M6XmCIZvIxJE2zN+ddKz8jOBrrEj3U85jA50pObGb2
         K4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWptZ+Eg103aAghMxvBTFIbwje1yOqrkkay3bi5a1+FG+5eE/uF7zqQdXOlHxau3/E/fev/HLwh8DQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy8M5QCbT/eybkIBHKgu0yMayCkb384mGQL52c7jLzGMC865YoR
	nG4s+s6Yg2dFqCElfHIaPp2AjsjouzC5UcQrZ6s9Qm5KTUOQgHO+1RDwX1wY4upimg==
X-Gm-Gg: AZuq6aLwRr6dJLT2KNMuOn2llA/YpdngEfH0sZXmlirz+5fPp5MxVB20/ANCo2IJLZA
	8YJMOf6KRu2GcVqe5JNv5HQnimrsmHZNVZpe9MCOjsNtQHUtxCdcMO9aarA1T8AYi8sH3dn3ew4
	qgsDOrWI1OXLOfQql9lFhTBID/18LOE5j2W7Y3MdVhbOKeIkjo8iHEZWJoAMeY57R3ImOsi+xa1
	vkgmRaEeITrhyV9jZLKoxocna23zXV00p6Od0CVild7dRfoFXFEMNK5s34fsHTxdxY4rcK86V+m
	qROdpOXcOWafOA6DRbD7gCwG3j8Bz6h13RzrcEQAj9Ue18u6gOwuBUY2QekNk3s7OgzXnCNOoES
	MHQy23KV1pmA11N9G6GGRrLzp9TwBkV3AXzXlME3oVMURNP4/Vs1bQkeNi186tlTIlAD8tgHHcZ
	UrfPHMgZmeaFCx5ys2wLogple+8qEnrHWaMxFvSzu2r7A81C7JhraHFz7B3xGl4mqiaYGMOIVfz
	BJyUrGSiB2kvOlA8LweQ3kS6WIVR0b17bp1VmRMbAiga+Fu
X-Received: by 2002:a05:600c:8215:b0:480:4c20:6a06 with SMTP id 5b1f17b1804b1-48320966792mr20244075e9.17.1770359391131;
        Thu, 05 Feb 2026 22:29:51 -0800 (PST)
Message-ID: <be09e51c-5201-4837-9921-5ac0d8cae582@suse.com>
Date: Fri, 6 Feb 2026 07:29:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] efi: Enable EFI_SET_VIRTUAL_ADDRESS_MAP by default
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <82dfede43d81c2072f90b01d12fe5ef18c80fc24.1770312308.git.teddy.astie@vates.tech>
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
In-Reply-To: <82dfede43d81c2072f90b01d12fe5ef18c80fc24.1770312308.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0881DFAAE2
X-Rspamd-Action: no action

On 05.02.2026 18:27, Teddy Astie wrote:
> Many machines fail to boot if this option is disabled, as
> there are no known drawback toggling this option, enable it
> by default.

"no known drawback" ignores why it wasn't enabled originally. Imo this
wants at least mentioning, if not discussing.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -363,13 +363,14 @@ config KEXEC
>  
>  config EFI_SET_VIRTUAL_ADDRESS_MAP
>      bool "EFI: call SetVirtualAddressMap()" if EXPERT
> +    default y
>      help
>        Call EFI SetVirtualAddressMap() runtime service to setup memory map for
>        further runtime services. According to UEFI spec, it isn't strictly
>        necessary, but many UEFI implementations misbehave when this call is
>        missing.
>  
> -      If unsure, say N.
> +      If unsure, say Y.

When this was added, it was actually hacked in with the aim of minimal
intrusiveness. When we now default it to on, I wonder if other changes
shouldn't be made (maybe not right in this patch, but perhaps in a
single series). For example, identity mapping (with its implied
restrictions) ought to be possible to do away with when the option is
enabled. Whether the separate EFI page tables would still be needed
also is questionable.

I further wonder whether the EXPERT dependency of the prompt wouldn't
better be dropped when flipping the default.

Jan

