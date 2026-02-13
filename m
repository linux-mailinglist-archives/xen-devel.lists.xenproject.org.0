Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIasFGAej2kwJQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 13:51:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FD8136279
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 13:51:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230847.1536256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsde-0001JW-2l; Fri, 13 Feb 2026 12:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230847.1536256; Fri, 13 Feb 2026 12:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqsdd-0001GP-Vz; Fri, 13 Feb 2026 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 1230847;
 Fri, 13 Feb 2026 12:51:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dTkW=AR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vqsdc-0001GJ-Uf
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 12:51:12 +0000
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [2a00:1450:4864:20::441])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac41563c-08da-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 13:51:11 +0100 (CET)
Received: by mail-wr1-x441.google.com with SMTP id
 ffacd0b85a97d-436317c80f7so1991143f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Feb 2026 04:51:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acffcesm5085713f8f.37.2026.02.13.04.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 04:51:10 -0800 (PST)
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
X-Inumbo-ID: ac41563c-08da-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770987071; x=1771591871; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+Q3zRln1tjMGdhMT5hVuaUWVh8GmXW6cPN+GJOwH+gc=;
        b=YShLGpiSaDGY4B9Md7dX7m9jnQrf5SFuqlGdZIjb99lPeZeB+bU5pNZ6fbiSyieuH7
         sALBJZJ8Ukr6nkRmRaji7oQ0NA/zSfOqcIBOIPMHecxBiK7AJzZx5M8bcknsfAatMJFO
         E3tuOWcE006tHiqgvw4IiLO8H+hZq3WoE2SKaXAOE3YDgcyw7/0EYCHvhhu7A+ekuBT0
         w3v47atUeuBG4XEWwm+GXkxYZsgug+WS4I8Ci40aXLjd4QK+qKNz67wb7/aHmrMgK5lo
         n7/V7RHBxzNK1D6WYMajX/BEQezaQnOg+JXBhkX38vEJMkyZSgIrjQGubk5QqDJFJH7R
         V2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770987071; x=1771591871;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q3zRln1tjMGdhMT5hVuaUWVh8GmXW6cPN+GJOwH+gc=;
        b=YR4+L6noLJV7H4s4HCieKyUvQ7NibOiEBlTYdC4JqXQzPFjJf/rL+w3FqdhfN2nQHO
         4F0ouELAoSAxPkVxNrcpKE33i2KegiMUWf2ZOxzkawjDq3XGw7yd592jO4pFWtwTbRe3
         Wir+ILCEM7OI6NkM7k3pL50NnGatiS/aUfwfUNJOUivZoXglMu1HLRxeGhKw5MF1WuSt
         Lsi/kL3UZ+M8QZ57IHbENsJOVAlWoPMMy1IvXBRSXldFhS0xq3qsUJO7psaPsf/VmsnX
         zC0PYJcv2MvXSWyiJ1B3kgUQuBe4dDPbasG67UPf245t0EcyaJT1C3kM8BhxR7+pdPCn
         JjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkgq7mueE1vtPWLod6yaV31JL742DMgLhQ/8PJXL3HCa7YSwfKZ3SsodRTnR8ItscM2w7dJsU4YtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPWhXoPY/EGnj35T42n+Scu2WZhP7UW5hgolNK+dk48oQBJoAH
	Ft2UVSImcUg+HwuKoPWDYd1YYc5cigIRoUqnQixhEhshgUTfBAkfmk3Vq9zd+L73/w==
X-Gm-Gg: AZuq6aLB5lOFitUuOOPkAPJ8xWEoE0hgL9bV6gbmidj9H8CdjnK6oEhtTiIv49HZClN
	2vGE0BaHFZf0XEeGiXOFlAaMdaj1ZHuS8kPic9uRzJ0748rgBbE8O+xZmBWVJtPzXWJut4yeXZ+
	AiQj/Ppzv8+n42W5Ixp9J9BngmFxFCoOCAiv021RX115MszJB8rN0li7k54e5N+6J8KPXXoK9SG
	OAZevNcj0vKL0JXItsrKneKplzMSQGxq2CGS/NvuJKn+Bs/7E/w4sdmBvdycKfyTDMiYv3t9H+2
	qJU3RxRFCpOIB5h9HYvbH6qnw121bP0c1mTzDegu4UiwR5v9HFArcLXVQL/dUOEl4fhHj4cauX2
	133kVhx2NU8weTMFR33x9meHrmSLLqT7hfYl2IvjcHQhUbLwv7sOOd18WThMPI/HQCfh90jYVjO
	w1Un9bFbcEPEo1XwQOdGNOcQL3gXVr0GOBgiBJfgEkQUEzM2WqjEYgTEYl95Bv9En72uspVNDSd
	GH87Vvpba2WdT0=
X-Received: by 2002:a05:6000:18a6:b0:430:fdc8:8bd6 with SMTP id ffacd0b85a97d-437980642e8mr3570921f8f.31.1770987070528;
        Fri, 13 Feb 2026 04:51:10 -0800 (PST)
Message-ID: <37cb7d83-9651-4bb8-833f-4d85f8231c6b@suse.com>
Date: Fri, 13 Feb 2026 13:51:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/6] xen/domctl: chain SCI handling before IOMMU in
 assign_device domctl
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Juergen Gross
 <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1770982468.git.oleksii_moisieiev@epam.com>
 <53251361b05028f4875d4fccec7270749786c54b.1770982468.git.oleksii_moisieiev@epam.com>
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
In-Reply-To: <53251361b05028f4875d4fccec7270749786c54b.1770982468.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:Oleksii_Moisieiev@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:bertrand.marquis@arm.com,m:jgross@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Volodymyr_Babchuk@epam.com,m:grygorii_strashko@epam.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,epam.com:email,e6ef0000:email];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A6FD8136279
X-Rspamd-Action: no action

On 13.02.2026 12:37, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Add chained handling of assigned DT devices to support access-controller
> functionality through SCI framework, so a DT device assign request can be
> passed to firmware for processing and enabling VM access to the requested
> device (for example, device power management through SCMI).
> 
> The SCI access-controller DT device processing is called before the IOMMU
> path. It runs for any DT-described device (protected or not, and even when
> the IOMMU is disabled). The IOMMU path remains unchanged for PCI devices;
> only the DT path is relaxed to permit non-IOMMU devices.
> 
> This lets xl.cfg:"dtdev" list both IOMMU-protected and non-protected DT
> devices:
> 
> dtdev = [
>     "/soc/video@e6ef0000", <- IOMMU protected device
>     "/soc/i2c@e6508000", <- not IOMMU protected device
> ]
> 
> The change is done in two parts:
> 1) call sci_do_domctl() in do_domctl() before IOMMU processing. If
> sci_do_domctl() reports an error other than -ENXIO, treat it as
> authoritative and skip the IOMMU path. A return of -ENXIO indicates
> that SCI did not handle the request and is ignored, allowing the
> existing IOMMU handling to run unchanged;
> 2) update iommu_do_dt_domctl() to check for dt_device_is_protected() and
> not fail if DT device is not protected by IOMMU. iommu_do_pci_domctl
> doesn't need to be updated because iommu_do_domctl first tries
> iommu_do_pci_domctl (when CONFIG_HAS_PCI) and falls back to
> iommu_do_dt_domctl only if PCI returns -ENODEV.
> 
> The new dt_device_is_protected() bypass in iommu_do_dt_domctl only
> applies to DT-described devices; SCI parameters are carried via DT
> nodes. PCI devices handled by iommu_do_pci_domctl do not carry DT/SCI
> metadata in this path, so there is no notion of “SCI parameters on a
> non-IOMMU-protected PCI device” for it to interpret or to skip. The PCI
> path should continue to report errors if assignment cannot be performed
> by the IOMMU layer. So we should leave iommu_do_pci_domctl unchanged; the
> SCI/DT-specific relaxations belong only in the DT path. Also SCI handling
> only exists when DT is present.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Mind me asking where my A-b went?

Jan

