Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBwNDeManGkZ/wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:16:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D25A173AD8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:16:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238575.1540185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuS2p-0007QV-8b; Mon, 23 Feb 2026 09:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238575.1540185; Mon, 23 Feb 2026 09:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuS2p-0007OJ-61; Mon, 23 Feb 2026 09:15:59 +0000
Received: by outflank-mailman (input) for mailman id 1238575;
 Mon, 23 Feb 2026 09:15:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vuS2m-0007OD-WF
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:15:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 421d4c3e-1098-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 10:15:55 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4377174e1ebso3077164f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 01:15:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970c00db8sm17618744f8f.12.2026.02.23.01.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Feb 2026 01:15:54 -0800 (PST)
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
X-Inumbo-ID: 421d4c3e-1098-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771838155; x=1772442955; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AryWjovBpM3X9xg2oKuQbNVxztMg6n+XInojlx7jBbI=;
        b=WIRrZ6Jo9kZyc97pR8tEmDWAyYyscnS5ziyphUHZ+oW0kCogdJS2102Z7rbNJNUEND
         xSRh1MDY+wdiKvD4A/XFKoXHhQQRhJ56jEo3ScHlFkUWDDuj0jIbJPWWH5XnVdwBDOE+
         3/mMvpnfzTn4X9p9sP6pjxZ0u3bZZTYGZ4ZyVh8rI6mm95+t+x7nv/V2yI8VEWfNnffw
         qD6pZqonCa4u4BI35D0Zf4ESF2YiFOO4uykNk55l/ICHCmVKEO2QC5Cd6Ozq5m4NQmUE
         yGCiFni3bunhaDAJBCMAnieAH0XfAp5+aV84rUDo6iyvee2CBew7golZgGdR3DWg/EbG
         dQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771838155; x=1772442955;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AryWjovBpM3X9xg2oKuQbNVxztMg6n+XInojlx7jBbI=;
        b=SBzfoo6G6GgDaTiFXeK1yjGghBuH7k54YyB7Lar/JA2paURR7hrjmeVC23ibTfK/HK
         lC0f0uAMQXtL47CGLiaJ9FDrxnOTUqi7VNCzTx0JKp9HFGBV4bgK7ZMDM0Qbx4bHIGgG
         LiHS9l3qmA2HjxypJAJugG1tIz7HUWH91ZBsw9zaobyUgnu40J0cih1n9xJiYQ7vZRaU
         nZyMHe2Xe5ZgL8a6ZmVhhrkIAPphYg5dv9yxaY+DVSdSBSdDvSpD5+Lv5lwbl/QCQgQB
         HVLShDeXdoQ+uO+68M3gMViaJvcbEIxkOtgenCqIPhLF2sVI3iXOS4KDmqmCDs7j4tyU
         QgJg==
X-Forwarded-Encrypted: i=1; AJvYcCVkkhMKmApzV8556nfqCf76eZn7ffEE7/AxitfCx+p2hmChNP8hMKIGKXvKcndZNhZw/0QCjKIoxgo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztZkisp/KUzWAivt2B8/nV2690zsnfw7wIlc/nCU59siIogTyO
	V5HjQ6NTfp7jkSbRNWS/3GCutEcqVzSf3fJwETScB0nnckhwV2WFQInzruTb+bbdaA==
X-Gm-Gg: ATEYQzwA4j3eFoJm0Egv6eF9lN7IHvTRKiec246E115Q6IIsG3LLhpn+VqS5BRx+mBU
	E6n0pkE77k0vFXr1q42mO4uWJlS+JsM92RQFbGx46urhc/V13ZKPqPy766kirUBGMGwnhH45cvV
	9fymB0dfX/Uj2nmhVQIaMqAkYCGvcoJ61r3jyVP1kvgoVwaN8oTuPC9W8oyTeZs8Gi7RX8ZpaJ8
	BGF6TcDAjITVmReBnIdvIF6xxeG97vLppnTdo3L36zqK9HVyP26zwhOKPlAYUh2LOai0IxWyLBh
	HrTJsh6wC/0CBUouFB8O8395rmIE4+o4Yo2tdPlz1ALkLn4A7rlyXwzUaL3N6VfmTYBmbc+BzxK
	GuqvQpIs9IxVTMvk3hX93pd8hz7gv7aPTb0PRwRfa0axzFJ7O5QsZE4wCksMOdd+fJWqtkCQnxz
	Um351tOAlcdGvJX64TGCTFlBzyOZD1ADROxGy1h9joDE/dAJSDoP7eppk2DM39cSU/sC/0bZceH
	x4It2TiIl3dF9Y=
X-Received: by 2002:a05:6000:615:b0:432:8504:8d5b with SMTP id ffacd0b85a97d-4396f194345mr13869111f8f.50.1771838155040;
        Mon, 23 Feb 2026 01:15:55 -0800 (PST)
Message-ID: <aad02d36-5b26-4a59-ac67-99757fe13679@suse.com>
Date: Mon, 23 Feb 2026 10:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] xen/argo: Fix MISRA violations around function
 parameters
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20260220214653.3497384-1-andrew.cooper3@citrix.com>
 <20260220214653.3497384-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20260220214653.3497384-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[citrix.com,kernel.org,xen.org,epam.com,arm.com,amd.com,bugseng.com,lists.xenproject.org,gmail.com,apertussolutions.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:julien@xen.org,m:Volodymyr_Babchuk@epam.com,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:consulting@bugseng.com,m:nicola.vetrini@bugseng.com,m:xen-devel@lists.xenproject.org,m:christopher.w.clark@gmail.com,m:dpsmith@apertussolutions.com,m:christopherwclark@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,citrix.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,bugseng.com:email,xen.org:email,epam.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 5D25A173AD8
X-Rspamd-Action: no action

On 20.02.2026 22:46, Andrew Cooper wrote:
> For the ARM build only, Eclair reports a R8.4 violation because do_argo_op()
> cannot see its declaration.  This means that x86 is picking hypercall-defs.h
> up transitively while ARM is not.  Include xen/hypercall.h explicitly.
> 
> Eclair also reports a R8.3 violation because of arg3 and arg4 differing in
> name with a raw_ prefix.  Because hypercall-defs.h generates both do_argo_op()
> and compat_argo_op() from a single description, it's not possible to simply
> rename to raw_ in the declaration, as that would force doing the same rename
> in compat_argo_op().
> 
> In do_argo_op(), drop the split parameter handling, and perform the 32bit
> range check via an explicit cast.  While adjusting the surrounding logic, drop
> unnecessary casts to void * for already pointer arguments in argo_printk().
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

Further Cc-ing Argo maintainer / reviewer.

Jan

