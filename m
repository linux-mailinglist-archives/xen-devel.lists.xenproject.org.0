Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAxzK4ZsymnG8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:28:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2560035B0A0
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2026 14:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1267560.1557025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BjZ-0001sz-Fx; Mon, 30 Mar 2026 12:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1267560.1557025; Mon, 30 Mar 2026 12:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w7BjZ-0001qx-Ca; Mon, 30 Mar 2026 12:28:45 +0000
Received: by outflank-mailman (input) for mailman id 1267560;
 Mon, 30 Mar 2026 12:28:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1w7BjX-0001qr-V8
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 12:28:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w7BjX-00B5Hj-BE
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2026 14:28:43 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6c71-bab6-0a2a0a5309dd-0a2a45029c74-36
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:28:43 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <jbeulich@suse.com>)
 id 69ca6c7b-63bb-0a2a45020019-d155dd2be45f-3
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 14:28:43 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-43cf906b007so799167f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2026 05:28:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43cf21e9e18sm17913406f8f.9.2026.03.30.05.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 05:28:42 -0700 (PDT)
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
        d=suse.com; s=google; t=1774873723; x=1775478523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gBIUal41bkGn052vURwam2vvsH0vs17Vri8jDNMqMJE=;
        b=BCDSW4yTtts3+LqYKgCiSlpr3rDyHpCMA1jyga95BpyBsrD6sP2P+JG5JMRMyk5lIC
         FCYeNdJSUKsnETh8pvqSCUfnqKXdXbzbUFTLgSX1xZOpVjwAjulIGxJBT987tDbvhZ0b
         GNNWrm7SPdkxI9b12vvsFpGhrgcn0SNSkyK9x5ulir0YVMo495CLjUGqRF7awz1qmZ+W
         olKZLXWIgcZGET6iqPM+H9V1JVIMm6k3NRcSeseD6Nx1IwVNwRAy3/B98LBfpSonY/iI
         dtJl7fMmkzL/Zqv1tUduYuS0LQ+3kgOLMbehwo3vfHy5OVA/CdKtFG+dI54HAnultgIm
         e/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873723; x=1775478523;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBIUal41bkGn052vURwam2vvsH0vs17Vri8jDNMqMJE=;
        b=oQWQtrweTW79E+bTRS0UYsMlXUoCA8BJ/ERqzvFsltkZu4IpHmgrpWu2x6J35ZIyH+
         UMwr6z4HKa/z0JqvaEW6w1ZUOnFEjchn9MTdFlGkAj5OLUrX3y0ny4THNMmYxeRg4t+g
         R5NWIZuhZ2txkkGW8aZJt+DExeBmMUmiMPAKn1Ji2rDrlU0/ctYWadkUWAJM1mJUj/VH
         qemB4Qu1ikPbIgDFfoZLcA2fhYVJWxZvJhNw9PFS3u9mbXrMRyIsIAKRJ8OZOn6wK07H
         YeKa3LlEGsTnsqs83Rm91eXkQDg1wGJ5gsCdcOMiuZuya9fSC/5Kb7fiABQ8yjnOud6d
         QRcA==
X-Forwarded-Encrypted: i=1; AJvYcCV+5S+MzCwOKYnfdxVDwrezPbWOTXSNEyKh76t7CmkmN7wUm528UL7hJOymnmCzsmctp9iUrFvVM6w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNon5OyZjGo43D1U0VJU9I1zqaVd+sUzFkWp5hjmyupBfDwNPY
	24fDZZZNswB9JpcLqd1QunJSoGgU1xIUH4P6Flv6PATu60H+HA6vp7POS5IgKKLb4A==
X-Gm-Gg: ATEYQzx9NV7AxHC/Rkh2Hpc051F/DeZ9/29b3tNyDRjjJjAzNiRCXkwaX+FEQgFPP3R
	g2Aj8inju6tv4SpCPvPQrw0Kel2r2hByGNFTop8SPUxt03uuayZQV6Q7aOA/K2GVP1uCRIYzk/n
	OwhZbGGdbGxt9AAw0YvFZkVSHJf2vpYNFSlINQ+OD7VRxLiK4PpOr7UyIW+QE6axTRo+s58QLVM
	BZgnz7hZj6Pw0VY86aDFOEI3fa/Kzs0EOaEpfX9fnEXKsjGBFkIhLI7EApM41yYB5AdCdYwqt2v
	HaTf0KRZm1pedPx2Eka+8sel5DSxI/tktJEQy1fHbdx5fM8p6kZbzerjymgfMP7ioKDOW+JlypS
	F0wOy5KFrzAfKke5b3lRLgN/sDkNRXmUXXdoIvLrWb5RRjJoBPfcWnMG6nedPm9ad+evF8PXLGj
	UoeNITJFsCFC2R22OVp6ifxOfSBdi0pY8QbCHN02uWgtN+kGLYERkTe29KBT0U2YTq/G5aBarCN
	3T5F5pU7ROBGwk=
X-Received: by 2002:a05:6000:220c:b0:43c:fbfa:20a0 with SMTP id ffacd0b85a97d-43cfbfa22a2mr8567554f8f.25.1774873722653;
        Mon, 30 Mar 2026 05:28:42 -0700 (PDT)
Message-ID: <d8622bdf-9ccf-488d-af9a-3eccf6fd3226@suse.com>
Date: Mon, 30 Mar 2026 14:28:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] arm/sysctl: Implement cpu hotplug ops
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1774871881.git.mykyta_poturai@epam.com>
 <9ac96559ed00257f347bd61b1e074fc3f6ce8a32.1774871881.git.mykyta_poturai@epam.com>
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
In-Reply-To: <9ac96559ed00257f347bd61b1e074fc3f6ce8a32.1774871881.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1774873723-40497DB8-2E70716A/0/0
X-purgate-type: clean
X-purgate-size: 701
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:tpearson@raptorengineering.com,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:oleksii.kurochko@gmail.com,m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,amd.com,epam.com,citrix.com,vates.tech,raptorengineering.com,wdc.com,gmail.com,apertussolutions.com,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	NEURAL_HAM(-0.00)[-0.977];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2560035B0A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.2026 13:59, Mykyta Poturai wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -638,9 +638,9 @@ config SYSTEM_SUSPEND
>  	  If unsure, say N.
>  
>  config CPU_HOTPLUG
> -	bool "CPU online/offline support"
> -	depends on X86
> -	default y
> +	bool "CPU online/offline support" if EXPERT || X86

Why not just EXPERT?

> +	depends on X86 || (ARM_64 && !HAS_ITS)

The !HAS_ITS is puzzling, and it doesn't help that that option looks
misnamed (HAS_* shouldn't have prompts imo). The description says
something there, yes, but then also mentions FFA and TEE. Yet for
those the option remains available.

> +	default y if X86

Shorter as "default X86".

Jan

