Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMrYB83aiWnMCgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:02:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD0A10F542
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 14:02:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225333.1531811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQtc-00064M-Dw; Mon, 09 Feb 2026 13:01:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225333.1531811; Mon, 09 Feb 2026 13:01:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQtc-00062Y-B3; Mon, 09 Feb 2026 13:01:44 +0000
Received: by outflank-mailman (input) for mailman id 1225333;
 Mon, 09 Feb 2026 13:01:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bBDp=AN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpQta-000629-Ub
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 13:01:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 793076d1-05b7-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Feb 2026 14:01:39 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-47ee3a63300so49767065e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 05:01:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d2bab2sm558239595e9.3.2026.02.09.05.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 05:01:38 -0800 (PST)
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
X-Inumbo-ID: 793076d1-05b7-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770642099; x=1771246899; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WMomWoEsj2ex4pGPs0lBqhq27v3hvNP3Old7JGYgpcs=;
        b=NaGgmRAKxf5prPa3jZ/ixn1mzOc1qM5sYA5eSB6WPYDc19IHYwfR19QzVW+jsjCMtr
         0F3Jjd38Zm9zDN91ylN/lxtlARFGFtv+DljOj3Kijo0ZjVNY/nqF8on+o5TAiUaFGZd2
         2A9Sf7Wt7cKrgQlP9NYbgFt9TlSfFZ7INBlpizYpwRJzXeUpt1bSsfI9/29MTAqSRMmn
         fWpa689gM30f1EccsK36niNMf8WuJjXgxFif4YNGvxTNcCIb73CDbeetkYopkQd/MFwH
         X8YGQPN+3PYdqv/hXrhNdcC3rUn8sZlHJh52JUfK59GCkFqXWZvv638A7ABLxYWnqj3o
         b+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642099; x=1771246899;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WMomWoEsj2ex4pGPs0lBqhq27v3hvNP3Old7JGYgpcs=;
        b=Z78FqJWuPpUepHp0r3wxE1WisANxpol0FwXztIcgwXVmP3V6koTWZAPJODaEgM5V3I
         ZVOAlIzOc8slW3wQ8Prp1pzRQiejQ4KcGReBPHhIhOSkiH/oO7skOhhOWCv1Ca73EiLH
         4S0EtOHrRUqgrjHUO2Iu60BpbDxV7682GLaXvr0EeX9+0xrdQV26Rxce4FbMJd/rv06l
         Yn/i7arpsUOxfHF7DSbjnSWKqJK8as7MWN0jPXD9TJX7Wl0qD8oYnPsqYFWMUsRrPndQ
         kuWwJyvFOU3j85WGM+I2v0kZxDdcaV0M7B8C7Gxuq1Nq3b54GKI4I0qr0K+5UQYIGgEL
         7bjw==
X-Forwarded-Encrypted: i=1; AJvYcCVrOfuWBIWElp0i2XcfHof2nPITJ1L3oZgmuWRrcBfxIctUU0FZh+Zi/d9yhopR6kRyJLYQHZmDuK4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtaN8cZeKhNMzY5sxNedIvfDn5Sqq7va4RmKs7ROe/J+R4fZDX
	IcZyU9SJWHl/0PuqnwaXm+M7EO7TNQssmbJ1oCb7y/5gvJRFYkCjso6kC0lGWhAt1w==
X-Gm-Gg: AZuq6aKbq7u34eURpG3YPQ99UGng3xuJsidzm0ETU+VBCo8qrwA2KqU1Zfw+hSNgF/h
	Zb+N3YBxqkMDjdSiymCVThOGmvXmw8vyfwotzLX7tztbU2tpki8i6dYgVgFbNsEqKfAMevEulii
	kUzQQICL1P6proh/qDVM6LTpV85h/0mkItuSQ+EM+Gu3gTZhGv6r3KV9x3HPbalmMxWflBX64SA
	5InKHE3nZP9bgWAOkNJiqgHznprHl40lzVh/o1Ad182FUIud24V9+HFQriN/97f3415Y4HkdNjp
	vEyUdBUIojsAmW5dks30odJrufzmn29C+0nyk0Xb26yKiASOOZYxWnY99dD40OAR8Vc54BQOGJQ
	CtAw8ImInIudPAZIdRDYm2TQGtNfGbtTUyDRTwuF2z7QUXN5P4Tzn9Wa6zfCzxiY6mXMMeCH+lf
	nxlC4bLh4WimLej1xZ+lgYgyCkMrZbJSXOG+/Mr8FqRSzXB/dttGQ48KnF+hxIr4LsJWtfokKu0
	dM=
X-Received: by 2002:a05:600c:8b82:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-4832020f040mr176487535e9.16.1770642098978;
        Mon, 09 Feb 2026 05:01:38 -0800 (PST)
Message-ID: <15680dd6-e554-4503-8964-e8801aa31e79@suse.com>
Date: Mon, 9 Feb 2026 14:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen: Add Darwin.mk
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
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
In-Reply-To: <49c0bd388d45b6936bd852d99fbbc262fb078253.1770633598.git.bertrand.marquis@arm.com>
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3AD0A10F542
X-Rspamd-Action: no action

On 09.02.2026 11:46, Bertrand Marquis wrote:
> Xen does not provide a Darwin build configuration useable on Mac OS.
> It is possible to build Xen Hypervisor (tools are not supported) with a
> toolchain able to produce ELF binaries (GCC or others).
> 
> Add config/Darwin.mk to include StdGNU.mk and force
> XEN_COMPILE_ARCH=unknown, ensuring Darwin builds always follow
> the cross-compile path so compiling on Mac OS is always handled as a
> cross compilation case.
> 
> Only compiling the hypervisor has been tested !
> 
> An example of how to build the hypervisor for arm64 on Mac OS
> (tools cannot be build for now) using a compiler from brew:
> - brew install aarch64-elf-gcc aarch64-elf-binutils
> - make XEN_TARGET_ARCH=arm64 CROSS_COMPILE=aarch64-elf- HOSTCC=clang
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> Change-Id: Iba91634afbaab58767bb8744b4b722ce5732a6dd

This wants removing, I suppose.

> --- /dev/null
> +++ b/config/Darwin.mk
> @@ -0,0 +1,6 @@
> +# Use GNU tool definitions as the tools we are using are either GNU compatible
> +# or we only use features which are supported on Mac OS.
> +include $(XEN_ROOT)/config/StdGNU.mk
> +
> +# Cross compile on Mac OS, only hypervisor build has been tested, no tools
> +XEN_COMPILE_ARCH = unknow

There was an 'n' lost, as the reason for forcing cross-compilation also
isn't stated. I'll take the liberty to add both back in.

Jan

