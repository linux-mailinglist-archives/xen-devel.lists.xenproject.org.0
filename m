Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NFlxCk5DOmrt4wcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:26:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA866B5445
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2026 10:26:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=WWAjVmOj;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1344153.1603280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwSn-0000TH-Dy; Tue, 23 Jun 2026 08:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1344153.1603280; Tue, 23 Jun 2026 08:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbwSn-0000Ql-BL; Tue, 23 Jun 2026 08:26:33 +0000
Received: by outflank-mailman (input) for mailman id 1344153;
 Tue, 23 Jun 2026 08:26:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wbwSl-0000Qf-SR
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 08:26:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbwSk-00ArpN-Jp
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2026 10:26:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a4335-bab6-0a2a0a5309dd-0a2a4507943a-2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:26:30 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <jbeulich@suse.com>)
 id 6a3a4336-4766-0a2a45070019-d1558030c9d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 10:26:30 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-49241896317so19970325e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jun 2026 01:26:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4923fd21dbdsm327494585e9.6.2026.06.23.01.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jun 2026 01:26:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1782203190; x=1782807990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gbnv1qJBpBNRLbIqY6A+yfQLZHD7CDM9RcyeQ5Xuevo=;
        b=WWAjVmOjx2kVo3mtP27o/+/+WRyOEr3KwwdYwtFAiN4gtallSi8c2O7x5lTAJHr0qo
         SARh+MsbJsyUiHVq0BTmw+6P9BnJgyop05E7D9mXFLQKAqRVawlae9pE04oenNJ1eG8n
         sOtX2xUQC5l58QgD8l5OsGENqBbXk9FYwa4rDLPSG3d874e1yBDYDcJmeiw4deeRtgBT
         fquC/ys21NKiKAMjJ1y7Jtv0851Ea5ZSHVFEVA6xsUopb7yxFDlb08iCHcGAr9OMx3no
         wVbNcwR9GLNApjMaQ4rdn+2EYRNJINlvFRLQNdjCa6V+CDU87fkUhLdmc4+rQvks68ZN
         RQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782203190; x=1782807990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbnv1qJBpBNRLbIqY6A+yfQLZHD7CDM9RcyeQ5Xuevo=;
        b=rEMjbNOkoaannMsZ+MfXkmSM9rcV0pQRLpkyeBxx9XbTOux6qcObQzrgY8TjXx+O4j
         0k7DEdiHzgvxXi1P7WV+GLbTHL666Hg+3MNvdp4gW0pQumQO9RckUCO7k99k9gWgw6nS
         gG0n4oZsKqcbtvmmiNHu9Kekx0rF6PvLTPyYV9lTRmFM7sMQ1D5AxhwSRDlKQSOFaw3r
         +ApzPiBv+lp63b0d1EsyI3fw5CTv1/Q54pWLrfri2L+5JwF+OSWHElAKiRXZ5ofh7Se0
         l5wUJ8UwkjzBb11Gvf/247Ocsdp9pf2f5K0nUTGUUJ+yTo+Y+3lQ8A2d9PjxKkiK8ktl
         4irw==
X-Forwarded-Encrypted: i=1; AFNElJ8OEz7Fdjg5wsfRLD6GwpAQUrImQzU/mlXJ51eV9M12MvVOb769lkG/H3a6X/Q1m8LYjVgSQiGwCMk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUgYGBCbLTF3kiis0DzN2AdvelGyZ0M84rSBERaZkYDKhbjOl1
	ueDOIviKZcMIAkIFnhfzAUr+0TSUE5/FDHfJ2lN/jK83RCHup7jR5+TvoHBgk+dk4A==
X-Gm-Gg: AfdE7cm8gf/v1cC/SfRFX1SvKnV3qno7+4oIo1e37fQUlkWcRfDJhGsn1tH8acPQpT9
	MNWqF8u+5l4aLHf2OCHS2HgSRtpnzM+NPZaEB1u06OkIZpEYbCPibUvtwYrsnZz8c/nJLWNZm5W
	XsR40Hq7RKMJTiJBh8VeeGsVFY5zwl5rlsw3E31av0zXaFfe3wcl0ELaHFN/+gQKx1dIpoT8Pd8
	nsi+rkRE4hmh8rqBK/KfqFPug4QMJad9yukpEF42xZtnJCdjKn1vsjxgTNq6dBXJIhqz8eV0qCq
	P6nohJDjW1p3hqEAVe4cZLpb5r96Fv6uyJ0eoFohB2SWoxrSm0M667bkOOkQWzKx3/FkCduMWKO
	TW1lu58LfX91IKZVdrD3PDG9ZvxtmYNY4gGrNt5t8xFXpGM6lT+J7ofsJrLYz6nCJoCgqePERUs
	hcWOCNaf5EIH66QyUPs2XagQPjGWtfzHIK5CDVsnzm1P5szrjs35yXkAab66xKRTYzXO5D2wW+c
	fMG
X-Received: by 2002:a05:600c:a08c:b0:492:4cce:53e2 with SMTP id 5b1f17b1804b1-4925b3867c6mr25162345e9.3.1782203189823;
        Tue, 23 Jun 2026 01:26:29 -0700 (PDT)
Message-ID: <2e9683f6-25d3-442b-9661-d32f979ca43b@suse.com>
Date: Tue, 23 Jun 2026 10:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] xen/Kconfig: introduce HAS_STATIC_MEMORY
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1781693963.git.oleksii.kurochko@gmail.com>
 <22c02e188a0b38806f08b7a87f00f03c14aad742.1781693963.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <22c02e188a0b38806f08b7a87f00f03c14aad742.1781693963.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1782203190-913D3979-DC67597B/0/0
X-purgate-type: clean
X-purgate-size: 1530
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:oleksii.kurochko@gmail.com,m:Romain.Caritey@microchip.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,suse.com:from_mime];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6AA866B5445

On 17.06.2026 13:17, Oleksii Kurochko wrote:
> Architectures that implement guest_physmap_add_pages() select
> HAS_STATIC_MEMORY; STATIC_MEMORY then depends on it.  ARM selects the
> new flag; RISC-V does not, so CONFIG_STATIC_MEMORY is unavailable there
> and randconfig builds no longer require an explicit STATIC_MEMORY=n
> override to avoid a compilation error.

How did you come up with the connection to guest_physmap_add_pages()?
That's a close sibling of guest_physmap_add_page(), and they all should
fall in the same group. The fact that right now static-mem is the only
caller of guest_physmap_add_pages() is secondary. New callers could
appear. guest_physmap_add_page() could likely (in principle) be
implemented in terms of guest_physmap_add_pages().

What you're after is a way to {en,dis}able STATIC_MEMORY on a per-arch
basis. That's all what matters here.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -161,6 +161,9 @@ config HAS_SCHED_GRANULARITY
>  config HAS_SHARED_INFO
>  	bool
>  
> +config HAS_STATIC_MEMORY
> +	bool
> +
>  config HAS_SOFT_RESET
>  	bool
>  
> @@ -196,7 +199,7 @@ config NUMA
>  
>  config STATIC_MEMORY
>  	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
> -	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY
> +	depends on HAS_STATIC_MEMORY && DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY

This may end up slightly neater as

	depends on HAS_STATIC_MEMORY
	depends on DOM0LESS_BOOT && HAS_DEVICE_TREE_DISCOVERY

Jan

