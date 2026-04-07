Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMCTEioL1WlQzwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:48:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A66AD3AF724
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 15:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1275026.1561001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6mo-0006zk-CI; Tue, 07 Apr 2026 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275026.1561001; Tue, 07 Apr 2026 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA6mo-0006wj-9h; Tue, 07 Apr 2026 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1275026;
 Tue, 07 Apr 2026 13:48:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <olekstysh@gmail.com>) id 1wA6mm-0006wd-LL
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 13:48:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA6mm-002iRk-0l
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 15:48:08 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <olekstysh@gmail.com>)
 id 69d50af4-e002-0a2a0a5209dd-0a2a450bae48-42
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:48:07 +0200
Received: from [209.85.167.42] (helo=mail-lf1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <olekstysh@gmail.com>)
 id 69d50b17-bca8-0a2a450b0019-d155a72aa513-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 15:48:07 +0200
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5a2bd236adbso5816466e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 06:48:07 -0700 (PDT)
Received: from [192.168.0.112] ([91.123.151.140])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a2c6c9518asm4201506e87.4.2026.04.07.06.48.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2026 06:48:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775569687; x=1776174487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2V1OT6EvEKlAkZcbsu51l10ucovUMTueOlbyR/zAAzo=;
        b=pw6F/3QWfqgf9voWax9CGmyvRxIBc3SLwrYH/REP63MozVucyLJ66PHqiqrIz62zy1
         N7PirMFwNnMecefPExLtBWHogwjqwSnGtcWz8HjFFjbrb3pk6v3DR4QTA98gcZhuNz1y
         fBKKTNPVh90dcMwMUCnMp3Flb8i5itqI0YgrUDuUBVd43us+0kWzBSMhXxR8rqw/j6xY
         9+tf9HTK0a6vwJgTwvlnH/slrMgS5HzTOrUL61imDO/TzJbqUzA6e+Haj+ONx4rNTAiM
         GwGktG36YDSqzFVAJ8IF36uZv1PZO4K8h2NymOSDK1x15S+HvvkCdPDnIOjv0XyCtDpZ
         bvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775569687; x=1776174487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V1OT6EvEKlAkZcbsu51l10ucovUMTueOlbyR/zAAzo=;
        b=k1rnJWeIRT+tLrHtLa95BmV+5ln//iypve2Gf7YFef1sEOK7soNEBxmL/UsrjZB7eh
         QTtqOORXSyrbKtQwwvucgmlTaD5GzDoNYK2XOZ7W0TwmyQS0WQYnXh2r1S7ieOaBPSso
         VeApSsHYygljB2kpR7Ac/F5JtBzl4MVVQOjuYgBv6Jx4fgVM783ps7WSLa8+7ERaLDkF
         BR2toXvpssZTr9FoMmFjHi8JueI4p+eNEYplmcTwyPu83k2yil/+DoihtYZg7tLqsRrs
         Dx03oI4FpQ8JJd4lPUSUg0pFcROjrfcnve34gm8BC8XJ6gvmPAx6ApSSn5tPWLtsrPjj
         1J0A==
X-Forwarded-Encrypted: i=1; AJvYcCUKAt8OUaa1dgx5vfg1tSmsKLiLeK0CD23kZALSWVJOJQU4mpvO2T3dmRD+YHQmVN8Arczqt+vvwog=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYj2eyrFqYt7+CsqZeObLRKn5eTtIVe3ITH34dU0Sij3xOuCet
	2p2GVbhKXB35KvxjErSKuiS9tMn86kIMppiPiQpDqKPDMfXp/VujN24d
X-Gm-Gg: AeBDieuARk3n7yIWRpI6EZgQ8PFt7nlAyozDG7Ao4F/qMtnPab2Zr8dBqeRgTo1oH05
	nTv4rRrVo+y6dG4u25QBx8+rhIs3iCCXqTvFcLDlYqjK+2bJPmKxMxgItIiPEoH4RiRWFJ0ZU8y
	qlgulSn1CbuWOJzOV4JLOhx3RqfnspJJw0LleYNsrSxvMBSHVX8//IPQJdeNFOtDON7sXV2+njc
	EN/+yloTRBrI/JpqDdipOjGf27sreloh+dVvLvhJc3njm+GSEfIV9jCOvi0QRSG42o2+jOHWQtP
	RW6SlRO6bbsK7oDsCF5B1xJaqeUsH1jkBlaUpEaSuHswP/9rG8VT+fC7WTMMTAUG87n+KeY3HCY
	LyrSR8CUzICLElunYjxK7qnirKJW+ugmMEnMEQ9YP+OE0pgErkO2Lp1tPxzzcJkc6Z890k0id2+
	NWQ/xgZKm7mA6OLGU4DPEyfuRbPhA=
X-Received: by 2002:a05:6512:3ca2:b0:5a2:c66a:d6d1 with SMTP id 2adb3069b0e04-5a32f6c6089mr4811428e87.6.1775569686630;
        Tue, 07 Apr 2026 06:48:06 -0700 (PDT)
Message-ID: <93e606cd-a30e-4367-b4e0-05812512ac03@gmail.com>
Date: Tue, 7 Apr 2026 16:48:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] iommu/arm: ipmmu-vmsa: Fix variable shadowing
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260407103434.90838-1-michal.orzel@amd.com>
 <20260407103434.90838-3-michal.orzel@amd.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <20260407103434.90838-3-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1775569687-EF14D2A1-2564C7DF/0/0
X-purgate-type: clean
X-purgate-size: 1944
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:michal.orzel@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[olekstysh@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A66AD3AF724
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/7/26 13:34, Michal Orzel wrote:

Hello Michal

> Rename 'pdev' to 'pci_dev' in the dev_print_pci() macro to avoid

NIT: The macro is named dev_print, not dev_print_pci.

> shadowing local 'pdev' variables at call sites.
> 
> Remove the unused 'ret' declaration from ipmmu_assign_device() where
> the function-scope 'ret' is sufficient.
> 
> This fixes MISRA C R5.3.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

> ---
>   xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> index ea9fa9ddf3ce..fa9ab9cb1330 100644
> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
> @@ -65,8 +65,8 @@
>           printk(lvl "ipmmu: %s: " fmt, dev_name((dev)), ## __VA_ARGS__);  \
>       else                                                                \
>       {                                                                   \
> -        struct pci_dev *pdev = dev_to_pci((dev));                       \
> -        printk(lvl "ipmmu: %pp: " fmt, &pdev->sbdf, ## __VA_ARGS__);     \
> +        struct pci_dev *pci_dev = dev_to_pci((dev));                       \
> +        printk(lvl "ipmmu: %pp: " fmt, &pci_dev->sbdf, ## __VA_ARGS__);     \
>       }                                                                   \
>   })
>   #endif
> @@ -1171,8 +1171,6 @@ static int ipmmu_assign_device(struct domain *d, u8 devfn, struct device *dev,
>           /* dom_io is used as a sentinel for quarantined devices */
>           if ( d == dom_io )
>           {
> -            int ret;
> -
>               /*
>                * Try to de-assign: do not return error if it was already
>                * de-assigned.


