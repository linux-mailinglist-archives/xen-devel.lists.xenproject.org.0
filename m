Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFbPAB35kmlx0gEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:01:49 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 628881429B8
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 12:01:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1233993.1537369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwLw-0007mn-Ep; Mon, 16 Feb 2026 11:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1233993.1537369; Mon, 16 Feb 2026 11:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrwLw-0007k6-Bk; Mon, 16 Feb 2026 11:01:20 +0000
Received: by outflank-mailman (input) for mailman id 1233993;
 Mon, 16 Feb 2026 11:01:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFbs=AU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vrwLv-0007k0-3P
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 11:01:19 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cff83740-0b26-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 12:01:15 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-483770e0b25so24729185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 03:01:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a298ebsm101322705e9.13.2026.02.16.03.01.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Feb 2026 03:01:13 -0800 (PST)
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
X-Inumbo-ID: cff83740-0b26-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771239675; x=1771844475; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ek+EySKSITx6BhiWGhmyohrKHJdppnj2tvPkcL14FGE=;
        b=UL9IdvARjpBvSIhHRglzSIqjS+QUS6X+fc/9Lb0Fr1QRDe1AVq7GNxUL2X9bhOwIkr
         Qm462jQifoGoDGlI88dyWxKuKF8Bio178TakTiPde2kJpj+Vgt0n5Zlrizfb1pRRi2eF
         u2TAljqMiOtD6BoAa/GyYaqxf3PIBaZQlK0rhWPnewPZ5aUYqz0iS4MiYlm6D4oBAB0q
         yGveg1v6JFedNPsrOA4WEFu5YAMtO1Bg9kLZ/vuKf97edgbXPRrgR7FmcL2nojo3TJgb
         TF6FnDQyJI+G5XCFdmnHtxFaBj+cSs3r80rjMa4S1rQDTtN38qDXFpN+NUgd/JGblidD
         TS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239675; x=1771844475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ek+EySKSITx6BhiWGhmyohrKHJdppnj2tvPkcL14FGE=;
        b=PenzHs9bgrGNNoA5G8OmS6AT9KJ047TqNYuuiferNAavo8W2TkL1JlTyv5vR6FYOwE
         Mufl5AK+IhHldHL76aiCapWbLRaFkg/taT1tlGQg806NsaVM8n8SlG2nWng9TMRHsZna
         7hwesgCAYKXzIdJSmkMP/oBtFCnBQQMPooQ1URuwgKdLJG9pvSyGAiA3bx/20RPAhFCB
         IQFRSmT5DOCp34T6PLsW0twKSyDZzTvhNO/r8lLxJJeRfsXeORF4lcLo9T2U87DVHDmE
         /RExMJQJLMiQHnUn26YzjfILuF5yTe1xrsr8aj5qc9j5umYfsUIiAxVoD8nLn4IjRIfU
         sK1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVuszUVkLNFxI0Xhyg5ZaIY5/T67QTcyPJo+NH8JUFXfOjyBq8az2EircF4wvS7GK9JlseblTpzCS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuXKEPzeKEvIq4rMJoO0UlU4NlqObC9wOLvaSmqLA6tJqEnWuP
	rxCFqWVcFiTd54dMghDPUQWcGri1JMiMSFb79C6ZMmL+ZhOvtMNMPlkcwvpsU04cdQ==
X-Gm-Gg: AZuq6aIXOaz+1awMJgtvnMuyl3AtqG7Umc18+sX1sncc1AgZRdzp7xmjyEAdURaeyXi
	SQEyNHBlITqPBHm6/a/LE2qxlZ+uUf/TUT+0g+nYIAKMK1tSjiOfgONiWHCipiwQk/ILfVHSYw7
	oJ5nyE6L523+KVJtPZjd6hGBJVo8QAp84NeKwbb8XEUs/71zZyyK+fzKrwUU+Z2Wr5epK4bTx5x
	aHFYYXCFua7qJAlSbGSs+Xqv9p07wFWDkCTLgTszzSDJFW1ESLdEA5QtBMAGu1ktlSCbHjtEAz7
	4i6HShfVazkrnHJv92cSxZxYNj7vhM/Ev2spH0wBXSUrTNg7aL/74t0O7dG7my+PXZmaOu7GTXR
	6IkMX+gB8NuDvSI/rIBSQk7LtRa2t0+81WMfxNOgrNpPvO9smAkznxHnKsedUhhJZGMG7fSF/nZ
	jPqKVNESVFfaxfJhOyIm33tkMVoId+J28/53OpF9pphTH1Q4PumST2aIFFUWrXBTby5/M1zb1gB
	97NEuiB3H2KhP0=
X-Received: by 2002:a05:600c:8b82:b0:479:35e7:a0e3 with SMTP id 5b1f17b1804b1-48371093bdbmr151091225e9.30.1771239674511;
        Mon, 16 Feb 2026 03:01:14 -0800 (PST)
Message-ID: <c0635184-6422-498b-87de-e6c3fa016a4d@suse.com>
Date: Mon, 16 Feb 2026 12:01:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add Kconfig option to disable nested
 virtualization
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: roger.pau@citrix.com, andrew.cooper3@citrix.com, jason.andryuk@amd.com,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260213220205.196179-1-stefano.stabellini@amd.com>
 <DGGBHY9HHXIA.C7GM5MX7ODLG@amd.com>
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
In-Reply-To: <DGGBHY9HHXIA.C7GM5MX7ODLG@amd.com>
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
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alejandro.garciavallejo@amd.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 628881429B8
X-Rspamd-Action: no action

On 16.02.2026 11:34, Alejandro Vallejo wrote:
> On Fri Feb 13, 2026 at 11:02 PM CET, Stefano Stabellini wrote:
>> --- a/xen/arch/x86/hvm/Kconfig
>> +++ b/xen/arch/x86/hvm/Kconfig
>> @@ -92,4 +92,11 @@ config MEM_SHARING
>>  	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
>>  	depends on INTEL_VMX
>>  
>> +config NESTED_VIRT
>> +	bool "Nested virtualization support"
>> +	depends on HVM
>> +	help
>> +	  Enable nested virtualization, allowing guests to run their own
>> +	  hypervisors. This requires hardware support.
> 
> nit: If we state above "allowing HVM guests..." rather than plain "guests" we can
> then get rid of the "This requires hardware support line". What you probably
> meant is that this is HVM-only and we don't allow PV nesting.
> 
> "This requires hardware support" makes me (the user) think my hardware needs
> something special to support nesting, when in reality I just need HVM support.

When replying, I also initially meant to make this broad a statement, but then
went to check: While indeed it ought to be possible to implement nested without
further hw support, both demands HAP and SVM demands a few more advanced
features (see start_nested_svm()).

>> --- a/xen/arch/x86/mm/hap/Makefile
>> +++ b/xen/arch/x86/mm/hap/Makefile
>> @@ -2,5 +2,6 @@ obj-y += hap.o
>>  obj-y += guest_walk_2.o
>>  obj-y += guest_walk_3.o
>>  obj-y += guest_walk_4.o
>> -obj-y += nested_hap.o
>> -obj-$(CONFIG_INTEL_VMX) += nested_ept.o
>> +nested-y := nested_hap.o
>> +nested-$(CONFIG_INTEL_VMX) += nested_ept.o
>> +obj-$(CONFIG_NESTED_VIRT) += $(nested-y)
> 
> Why not use plain filter?
> 
> 	-obj-y += nested_hap.o
> 	+obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
> 	-obj-$(CONFIG_INTEL_VMX) += nested_ept.o
> 	+obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) += nested_ept.o

It may have been like this in v1. Problem being that this leads to long lines,
which doesn't scale very well (and is - imo - harder to read). Especially when
you consider what happens when it's more than two settings that need checking.
The list approach easily scales to about anything (by using as many separate
lists as you need).

Jan

