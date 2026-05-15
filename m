Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDSGLekPB2qirAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:22:01 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1931E54F606
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2026 14:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1309970.1580978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrXx-0005tJ-Pc; Fri, 15 May 2026 12:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1309970.1580978; Fri, 15 May 2026 12:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wNrXx-0005r4-M0; Fri, 15 May 2026 12:21:41 +0000
Received: by outflank-mailman (input) for mailman id 1309970;
 Fri, 15 May 2026 12:21:40 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wNrXw-0005qy-0Z
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 12:21:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wNrXv-00D45C-9Q
 for xen-devel@lists.xenproject.org; Fri, 15 May 2026 14:21:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a070fb9-e002-0a2a0a5209dd-0a2a45058ea2-48
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:21:39 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a070fd3-aaa8-0a2a45050019-d1558030d849-3
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 14:21:39 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso74780905e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 May 2026 05:21:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e768acesm14930558f8f.7.2026.05.15.05.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 05:21:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1778847699; x=1779452499; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VCT61lBqPxYurSH4eqKs2jTrLx2aBdDfFDBHea+4VwU=;
        b=KIOJUVBRf1X9gv4YJv4MgdLo7BqcknPmy+gmAIm+EXQoHHN2w0bm8Z4WgGFuYkp/8B
         nH2pAc1j5zBLXBmp9YnTNtS5kjs85lv0c6TtacgUFDC85FzMFtlUPwU9oOqo1eblSN4O
         lBJwR9U7qycaZh/v3itaW4ftUHxqm+TSDQfr9yoUNXLHzVUDDRh/xHXX5cwumGUew7nA
         cw3D1ACIYXtgeXX7ignClXu58qImwkNUtIrmF0LKa6Kqxjxe3/g+uVzMu1VOiCV8y7tm
         bRofCXUsLpTpfIptzmdo0JKoC8YbSRpgMsQTt4s3HtYEUzq4pEalxZe9xHaHcgl3lcjy
         9u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847699; x=1779452499;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VCT61lBqPxYurSH4eqKs2jTrLx2aBdDfFDBHea+4VwU=;
        b=X9/kmU2a0jZ4YLAnUDORizxFq8+/pswLEEgkw95YfHMOIh1JBUnyvhXH4cskrcuEZ+
         bhqkZpiJ5LsY6NFvgxIlnB1D4ado6a5SPYocfMa9EfZEBt3yUlH1bD058XI2FNp41eDh
         FqIwgPrB9wvGx7ny7MUobDUg/N/GFu+iYLh3xIz2BDgxBhQNGONG4UrQbrnvNSrIoEmd
         Iowo+b9kEf52E8Nn69c/06gcCcfrdLj2EFtxRQPlPmbF5B0b4uyVXS50HA4nrYb8Ueew
         wZLLId6wRAFbaqUX+2AWZUywQC7YzcvG3lfSA1ilH7ZH5Mft0MAg1BOyVyRznIGeumwE
         G7BA==
X-Forwarded-Encrypted: i=1; AFNElJ/39c64giDTm6DMHNYbZfKC+PqZW8qv8qvNWPCNl/g+eZJyTYRD1aE/sNtWY3rVK04wMEZgQP+FndQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyljnc6h+x442FmxbQ0vsYeNg47hYH104A/faAp/2iemRsePhLJ
	MafJKN9zNIriK7ga0P7JcoJYnCrlk2f2hoEfdzRe5Bf7QB+gCp0bYg9VBABl9yxCmw==
X-Gm-Gg: Acq92OGeg69eqKyvnBAGqE646bcRZAeFtx1CYOGPbyv5PXZO7r58D0O02E/vTWoFamU
	RWJ5aKlZwDn0YeIH5z9r2ud694NKyaHyFLs38U9erEJ0LqnRvsyCZpfb+u6XDJwKC5kZO2RX9kj
	vU1pagI+XFTTV9LEpbM3naPY36LaCFSWlkObtq4WYaetJkBYLkzzD1dsWj66KG47B5z/A3ZBqpv
	9f52o7sPE70riduQAhbEqgfUvaaKTgj7ddbDA9KplnhY54kSNhKU8nrOrTAzVwlqj7QfsEfV7rM
	UvPSXkKvIrAp+t98+Gb6PmiQ3SDnw+/WzLF0gHgGJosld7b9rhAAHmyFe4VfUl+IdcZu+RXVIbS
	Vh8DQ6BweXyueCk6SpTOIXEHIRaANE/GH14Vx4lDefpCOKCNOZ9/504KTsg4dxhIEAmxbfyA/XK
	bkeHF0sVqpCrvOp7ou+7FTLAze6TX3gPJgdH7uUUxYx9wnAmNbndqC6AnYh0GlD3d6DW0ooJf9V
	mYhkzWijG8c6jNTrsZxnXADQg==
X-Received: by 2002:a05:600c:6211:b0:48f:e230:72fc with SMTP id 5b1f17b1804b1-48fe663152cmr50662135e9.33.1778847698705;
        Fri, 15 May 2026 05:21:38 -0700 (PDT)
Message-ID: <ff29493d-e855-40b7-9a0d-d2e43dbe7aff@suse.com>
Date: Fri, 15 May 2026 14:21:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] Kconfig: Make cpu hotplug configurable
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1778845596.git.mykyta_poturai@epam.com>
 <c32ac85498cd4dd4c1654e81b8880ce3c5149c01.1778845596.git.mykyta_poturai@epam.com>
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
In-Reply-To: <c32ac85498cd4dd4c1654e81b8880ce3c5149c01.1778845596.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1778847699-D8D7F443-852CF885/0/0
X-purgate-type: clean
X-purgate-size: 370
X-Rspamd-Queue-Id: 1931E54F606
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On 15.05.2026 13:54, Mykyta Poturai wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -636,6 +636,14 @@ config SYSTEM_SUSPEND
>  
>  	  If unsure, say N.
>  
> +config CPU_ONLINE_OFFLINE
> +	bool "CPU online/offline support"

The "if EXPERT" that the next patch adds wants to move here. Then:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

