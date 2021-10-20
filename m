Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284664348ED
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 12:28:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213801.372134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8q0-00043U-La; Wed, 20 Oct 2021 10:28:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213801.372134; Wed, 20 Oct 2021 10:28:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md8q0-00040f-IA; Wed, 20 Oct 2021 10:28:48 +0000
Received: by outflank-mailman (input) for mailman id 213801;
 Wed, 20 Oct 2021 10:28:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md8py-00040V-MJ
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 10:28:46 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 80658df0-3190-11ec-833d-12813bfff9fa;
 Wed, 20 Oct 2021 10:28:44 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-3_Mi2KpOOaSyq7eVuczE-Q-1; Wed, 20 Oct 2021 12:28:42 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 10:28:40 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 10:28:40 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:20b:2e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.18 via Frontend Transport; Wed, 20 Oct 2021 10:28:39 +0000
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
X-Inumbo-ID: 80658df0-3190-11ec-833d-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634725723;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aaQclbOfoQtGYQAytwUkuyo6xuuvjSo3FjzBsYvMo8U=;
	b=lVNR44SQmAm07o4ZU5RVMwuRvsWkmch+yw7RecgLONHdBTjvHj+/wdbVgGxDT+WQKqRlps
	P/2RwIRYL5aLZEL4bpqCzKCjQI5QtVI5cBMs3ke7ILWv1N4j0DCZ+QcsLRCWmtID70AGu3
	w61MUdJJyHFC3tA5fVVm30ISNyxIWBE=
X-MC-Unique: 3_Mi2KpOOaSyq7eVuczE-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JHvVMQiS2CGeH1dlBTZ2zjEfCP5ey8W4c8uqJ66jvMcSmysMrPyozm+s7u+0+Zbw/Et/xiSFR8EH1OWh/gxF+xQ+zlb/roFwNyVNfRiymSXCxp+5t3BZ+UTEmtN5olEXj2qVq9QvVHBGU0HpmA6f4jBhvIAYHv+cfNHI3qiNA3X6SkFPAEVkydqWHG29pNyHXKq9k4TgADygaDb/FG6VIVfZau+b0HPgZYwli72iuAcTZ4fifZEaDH4OBZiIoFBGcvKJEN9RnjkIWgCmjaoi+2JiUmdAl1m+WgR1yY6sijKFhp7yCjYKZIzSg3psKi/uWrw5UnGm5Pr9f6ui8abqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaQclbOfoQtGYQAytwUkuyo6xuuvjSo3FjzBsYvMo8U=;
 b=k8bmdG1oah66Sa7oMndHTzbe+p7sLwUQZPiNtAAD49yUWymEMdM8xiGc086F17Kn16xAgDZmexa1JycJWHHeiYe50pxaReG1cjhV5GcABPTpGRGLLIZLh1nLBdjIDL/AV0FXv83C6+4vs8Kry1QpRCNI/zQ85TzH19yCmJR6mPSVH7cz2yo5oBZ7KXw/brEtPVZkuhCJsiiacnSLeQ+380q1XS58MHxURirosfg/0MqjXsH2wW1endrdWRttC+5+UZyqGQBitqWvEqYHcdSE9bS+ofe591KjCF0Qtt/C4HxgPrto3AH072RhRoiBW8KqVdX7hS3ebAE0auqi2YGeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v3 1/1] xen/pci: Install vpci handlers on x86 and fix
 error paths
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, Oleksandr_Andrushchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634723903.git.bertrand.marquis@arm.com>
 <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <75cfb240-7797-ca36-3d43-77ac977f6649@suse.com>
Date: Wed, 20 Oct 2021 12:28:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR05CA0009.eurprd05.prod.outlook.com
 (2603:10a6:20b:2e::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80e6a3d1-34db-4994-0f33-08d993b4626f
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943D83EFBFDB9AAAEC01006B3BE9@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xGE2bIsXvtAkmd2L5nupo9eGmUJzXqc6sHffj1F9dbE0GcvstOjXb1JxFuFQSul0CjhcC5YBUpWx8n7PIC/qsejvfAlbXZAOG0OTBa6TCs8Hxzt37p+bSbMy6Ay9EKGSTJYSmLC/1921xeFLQRejWoDdcTk380+nKxr5QbCTLYqUqyT3dkSJD8eXsMLTdkO6YcL+Q5Nna/P2jd61QY8WmY9wEP+bxFkFFC40KA4K/pCSrRoJBFA7ZZW5g9OPQFyopG0fwpJYdx4fSNSW2SbGJjVu47bLrAlT83dcVJgNq+ODnqRFb7cMm77CFL7Xk1m1mYsvzp7q+8FYm36Nk1XrCp4BHomyZ6eA3Kut9nw8NYDoup0gOlxVQ9aFpAEugq5IrG3LfnSRjWGA1vm58dQobOfl+fdfSbk14DTz9zRjEOBCnVI3/jsCCIbpAFAp6HVjrp23qLYd5y+lcoZMZme6Mv//KSsiK0jnPqk4jcnQDN6VXsHVU7KocWxQbjQnnKoomU9p9cEwA5r6gazE7O9kf39LgRG2NowaOXaZzq8VpaTXpWbR+KwtPcwu/5siA+woqKbDDU4LWujCl12NolVJ+OPfP5GrtN5IZtHPgtwrxCUMI51fuLU1FLvilyCbtbjXGtpy6tD7op5T8OacivAP+dDB91F3pCq2iwClUSNmrwmgEzhIrpDpaDVtKtVAx8TicC5pIvQJ5Y7mOb+tWGMW2OKYkpFf/jPcEWfggXC/R28=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(4326008)(31686004)(5660300002)(186003)(2906002)(53546011)(66556008)(66476007)(86362001)(38100700002)(83380400001)(31696002)(36756003)(508600001)(2616005)(8676002)(956004)(66946007)(6486002)(8936002)(7416002)(16576012)(316002)(6916009)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3JFVWJkdkIyRXVjUXF4YUlYbklwZktIU1NHcm1wRW8rOVh2UCttem5kbTZ4?=
 =?utf-8?B?TDFTdmRNUDdJVzljbTM0a1BLd1dHbjhEZjZSU2xCWW1HOWdaa3RSTG14b2NN?=
 =?utf-8?B?TkI4TzgyZVlETDlEUXZFSmFHMVJyZ25wNzRwTVhoK2p4UnhPaVcxdFErWTVv?=
 =?utf-8?B?Y2F5ekhtTnRSUXJGNlRaUDlEUGhEV1NOZmpPTExZRHlyM3BDMTZNOFVJUG4z?=
 =?utf-8?B?M3MrNVp4NWpjMy9IN0RyUmpGQTFlaS9ORCtWTU14c29VVVlBU3ZqTU5PYU9j?=
 =?utf-8?B?bHgrZ3NlQWpFTG5BWkxlZHJPeENQRzlIbmdjM3FnQytTc053UU9tTGVOU2VV?=
 =?utf-8?B?bUJZMmNSUnBHUEg2ei81VGp2UHF6REdOMElKS3JSYTRTb0R1LzI2QUNBSkYw?=
 =?utf-8?B?NXBicHYzLys4eUVWaVlFRFlqU3hUZmFib3p6QWxIWXVFelZyWlI1T0kxQVF6?=
 =?utf-8?B?WmlhTWlHdEFwTmZiYU8yT1g5NGJQOUwvYkJRN0ZwdStxcDRjMkU5UitxRzAw?=
 =?utf-8?B?QUU1dWNoSThTMU5id01LOTdEWlRXbUlETXNvSjUycytzQ21XaU5Oalp1T1Jq?=
 =?utf-8?B?ek5vUTZpU0pXZ0V0N0xBOHRObFJVbDlSdHQzdDBqSnBqVXV6M0xObkZCbUFC?=
 =?utf-8?B?SXpSWEdubTI0ZnpZdnhFdWt3eHVxdGpjMmJHQU5iaTBCNmlZV2ZablpsdmJ5?=
 =?utf-8?B?ZDlnby9IdEVVb3JRZzRJa0dLaktnMm0yeHk1UXdETElER2JMUVoybDc2Nzhh?=
 =?utf-8?B?UEZ0RHp3THdJNHAveVk0b25ydkNYMDJpVkFYcHB0UXVOTXYxWEh6aDQ2VWNy?=
 =?utf-8?B?ZWtRZU5CU2tVblgreXo5dHhTTktxZ3JIVnd2WjgveHZyeFlNU2cxY1ZvSktk?=
 =?utf-8?B?QWt5MGdvVmMrdVFGMjc3MVhRVWFUQ0NPeE9qd0x2SzFkWmdoWTRLTGJHWXpD?=
 =?utf-8?B?SlljOTlMUi9WS3BUYm05NzNXZDh4V08zTURQU1FrME9GV0xxdm1RamE0LzVG?=
 =?utf-8?B?ckYzREQrQUxuTEl5S3ppQzcxdDBYRkkvTlF4Ync0SjBUMWZvTEFJZkQ5UUF4?=
 =?utf-8?B?WDU5NVRJU1ZwWmRmS3ZCWndqcUFVUDBQTVZZYk1zVDA0U2U3d294OEdjWjBU?=
 =?utf-8?B?bDNDei9XN2RwVE43MUcrL2kvc2t0OHZuUzFLUkVNUjIyM3RuRVBzZ2Y3dmw1?=
 =?utf-8?B?eE81Nm1JVWZtMGNvL1hNUkw4M3cySVpab1Y3Z01FZDdSV0xpWUxSRVdCblNH?=
 =?utf-8?B?cnhMdDVxTDNoWVpvdDk3WGZSaFR1anRBeEltc3pFT3paTEdlL0YrQ0o4OXNu?=
 =?utf-8?B?L0lZV01WeHhtU1VtQTY1eStlaXRZR3BNL0lwRmNFVnJIdFN5S1NLOGhGbERH?=
 =?utf-8?B?M3h5bENuajJwVTB1YVIzNE5NS1pkRDVSU0dGWTcrMlBpZzFZMGxGbDdCc0xC?=
 =?utf-8?B?U1N3ZnhIYkZRa3pycUkxeFJKcG1nZUtabm42c3dnQVZ4S21CYktWT0txcHJ1?=
 =?utf-8?B?b1d2eHpUSDI4dWM1cDhBUlZXTUV4eVlocDVHRVB6cndpQVNvNW82OFZhQkJT?=
 =?utf-8?B?Q1dGc1lPeW5CS1N1bFdMSnUwOUNTYURHK2NZak9ReW9WZndibVMrSEdBaGRB?=
 =?utf-8?B?eUF3WUU5c05zeUcyblkvUGpXNUs3V0RzLytuM3BOVEJiWlhKMVZlZ2lwQUkx?=
 =?utf-8?B?S3NIZmRzenBpQkxrR0p1YlNMeHlNekwyUUZiYU95eEorTGJFUHh3SmpoR2lx?=
 =?utf-8?Q?Bb34i7LSoPB0k2+anPuAwT/d53RLY7NkluQgEPT?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e6a3d1-34db-4994-0f33-08d993b4626f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 10:28:40.5427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 20.10.2021 12:05, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Move code adding the domain to the pdev domain_list as vpci_add_handlers
> needs this to be set and remove it from the list in the error path.
> 
> Exit early of vpci_remove_device if the domain has no vpci support.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Add an ASSERT in vpci_add_handlers to check that the function is not
> called twice for the same device.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

This looks to address all review comments, so
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks, Jan


