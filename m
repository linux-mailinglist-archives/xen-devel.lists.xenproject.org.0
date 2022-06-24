Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B695596B2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:33:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355385.583018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fgx-0002ao-T6; Fri, 24 Jun 2022 09:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355385.583018; Fri, 24 Jun 2022 09:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fgx-0002Y0-Oj; Fri, 24 Jun 2022 09:33:31 +0000
Received: by outflank-mailman (input) for mailman id 355385;
 Fri, 24 Jun 2022 09:33:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tt/v=W7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1o4fgw-0002Xu-4I
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:33:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70054.outbound.protection.outlook.com [40.107.7.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b441a40f-f3a0-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 11:33:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7032.eurprd04.prod.outlook.com (2603:10a6:20b:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.22; Fri, 24 Jun
 2022 09:33:26 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 09:33:26 +0000
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
X-Inumbo-ID: b441a40f-f3a0-11ec-b725-ed86ccbb4733
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLnIQE+Hkcv0YmVP09qxZbjL9S9YarOzjq0Vr5LvY9c2TklhAIsYfxMX9yFqi8Jpq2xEBAGG5fSMW9srWTitm9sbtN9nOTxHpcDh6gwiWt+R2QLiNBfOEblLT8LN5XDhmCOub6FbAYc/vRFEx6jQ5V84RzAZ1lEm8htR5D0Su7ZLPNC3go2+96wHDnDPnBzTVwJR8kcAuUxQ+j1qTnjr9UCC09HSYSAhg8Oy5sM7uABzZ/OEWbMyqN9kigS+iZ0F+WYwMlOF97hRHGqKOXBLtbcmiLvdY3rmE4PdOyuuWAUMH/A0D5Uzofr20Cvh6QJTvAZqS2CTP98v51axBd2sjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84TV5Ut/v0xxlrRHQx2qSIfYTcRlFbg8oXXqt5D94M4=;
 b=f7Y46Louh3uv3OJPaV/awH9T0ep3eOMrktO6QwpnaJtgPPoJSTDh6i6fZiDXqEyxBCdx1PpNZs0JV/f4sXgCAglcBpHaydLhZohXbBBZ0R8XfJvtM/gyAJML5V9BmoZmb8u0lMdwkeNwERfUfNCvsKYBAn1nnsoT+itR2w2U1UP6XC59+m3wisxctWIx0NLMQ4k/n4AUlj0A10rGtWoOSvZ3yb0BjqQaf0NRMWSXqeh1/kllETVnFyYGT4ZkIcSlgy+JzQOFta6N9gfmoXURPUbiJPbtFkUpkaKyb30KPdN3f0ZYjDrtov5DlC5H7IXWuX1m9+7jD2BuZqjbPNjCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84TV5Ut/v0xxlrRHQx2qSIfYTcRlFbg8oXXqt5D94M4=;
 b=hP2lKUAaASCh2B9OAjhOL1KQTGtDiBKeXMUnCffE50R+69eKkdsK4j5MYf7EHt85Pf5RnDfxvk5ItQtijIqQXWyV856zwWLC0vboTGew4pr3HQR2iyGDdb/NpeksFmNflQKjphI3VKEme1TUMZQuof+kyemoU2LDSvHNJ0WgVX4F7rJSpLpQmlgjsI1SfjYvOBuzHaIsXjOJoocBf7xgSGwR7zbmWU+WYL+P8lItPL6omqiSonXMKjJn1w5oqupdFITE7BapHPPpZBWKhngNQ6h55QgURsZ3vJTEg8n8Vdxx07iga5DdnQoLa89oA4eoQMTaGUg0Pou9XXcB6xF/Nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <cd5d728c-a21e-780e-3b79-0cfb163eb824@suse.com>
Date: Fri, 24 Jun 2022 11:33:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <Jiamei.Xie@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>
References: <20220610055316.2197571-1-wei.chen@arm.com>
 <20220610055316.2197571-2-wei.chen@arm.com>
 <05dadcda-505d-d46a-776a-bb29b8915815@suse.com>
 <PAXPR08MB74205A192C0E6E2E4BDD64BB9EB49@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8e44e765-c47f-4480-ee44-704ea13a170d@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR02CA0013.eurprd02.prod.outlook.com
 (2603:10a6:20b:6e::26) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f197188-74fe-4d8a-3071-08da55c49715
X-MS-TrafficTypeDiagnostic: AM7PR04MB7032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zgls53alpNfKJkZykhD2smkEIeeKYWYuYeor9wwDvEHOCtntFTpHngWjVLO0pzclJCp4A5M/E4V8DPnPyf0kvopbGyTS52Urr1I1FWSUHSdj39K5LOQZ3d0Bw6kzh8LmF8F9iWucwVYwor8Ac+7nF2goU1tjZFk53noLbIvbqnK31aEsoP2iA6G8XIOZYqZ7qt0QJaX2CkCceSkiqhagi3Kvip3LvCY5BDO8dBNI8f+/cdIj6OAir/FAtzQiXuYVfbjJ77sKM3vbAPBUuF9JQ9xnWhtkwiKxAZdP202ajQXb0j80X9puLbLMgGW1Q72Xj2Xc+VojlPu2Cny6ftJ8TkU85AqzkvyP2uKNNalnAOd2Vvk33BCEHLaVJ1LzBkjU+dGtrnWyQxWkRqqOePUu5UOo3/ntVheuvpAdSTEwI7URkB5dpJngAkBxOUm6ogspaUI6SlQSgN7pvHPJVrHouoptVl7doMMHBDeOxFsb6nd6nhmQ96y7pJ9OgI2JUGVClz4qTyZB1LGm1KGmatMeQzkSzar8KrbeFxFqdH98J3Z3vZC0Ie/R8dJl3u/Fftny6U67htdJ5b+YXX+lbXf1LU3fV2NdTv+YtcbwnnSyFC7ozd5FbGE1DxSHoXOUCQN3gGC/5ZVTSz/dtk5j5a7fwfjn+znWKFZHCM2pP5Gc1G/jjweheRvvofqs4by30UlVklvh3eT73r3bT7TnHWoviQWwocWJm7T/eGJRwdiLDjW+mjT696MGHAe8YQiBw3FYwONX6Hy/T+bFri1MGhEv+VKNSg06TGFUVwyxfj+8sQ8iPtrgi4sB36XwCdmREg1oVaUOKIOP8o5Gi00iH5UIAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(396003)(39860400002)(366004)(136003)(66476007)(7416002)(5660300002)(8936002)(53546011)(36756003)(31686004)(66556008)(6916009)(8676002)(478600001)(2906002)(4326008)(54906003)(38100700002)(6486002)(31696002)(66946007)(41300700001)(6506007)(83380400001)(2616005)(26005)(6512007)(86362001)(186003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TGZ2N3BMV2dhZGd4cW9ETURiUWFmbHlvdmRyZFFvMWZ4aFc4UFVKbzVHOGdi?=
 =?utf-8?B?blZtd2hkekpvQ1pLMTRzVW04WWFiSkRjZzk2WGxGK3phWkxXSDRXazJEZTlj?=
 =?utf-8?B?TFdFZzZwWS9SS1hpUDNJUlVUN1oySE8yZHZHeTUwVitQckVUQmdEL01HRm1R?=
 =?utf-8?B?bHpHWVY0ZVlhV2ZLUTVTM1d1UmpnYi9hdXljRGRIeGluNCs3emZEck9nUkFq?=
 =?utf-8?B?a1B1dmRseENhaFJEaVp1RzI1VkdybVdURm5pUjRWTUxJdTN5TDF0R20xbGpi?=
 =?utf-8?B?czBPaGw1MWNyYzFweTVuVGVpL2xYbkE4MVdKcXE4aUVjMngyQVB0Ri82clo3?=
 =?utf-8?B?UkRra2JqbHkwT2dNeVZ4YitrS0QvNHQ5eFhjZ2pQTGx6dXpKNGtUajZISUFp?=
 =?utf-8?B?UGFid0U3WmNPY1ZZc2tvVU5mbDVzNGhVMFp1NDB4UzJKRmNXSGNRaWFxRmN1?=
 =?utf-8?B?bkpUQkRzRkwvL1hvZTdMMHozbkNOYlVWcEZxT1krbnlIMjZPYUxnSXYxMVlE?=
 =?utf-8?B?YSswS0hMVnZtakZqMEQ5U205cXpmcy9GYVZqQUMrakgxM2RQTUFXMkZBRmFw?=
 =?utf-8?B?OFFPcTQxemhXUzlTZUl1NWp1SnF6UXozZi9IbUlsbEsxZkpGZ01YUkxkQlNZ?=
 =?utf-8?B?NWNSckVXZyt2OC96MzVNR05YMzdoaG1IMUZNSTJYeHRad1ZiajFCZzlHNnhF?=
 =?utf-8?B?R2VqakRMUkN1OWtOSE9VT2pMbmc3b0hwdmFTUG5yRTVQL0V5c015b0FXdG53?=
 =?utf-8?B?QTVJYTg4WnJ0VEhXcFdzSS9Pd3BSWnpaMVN0VWpVa2RMY0dkeDlISTNpZzVY?=
 =?utf-8?B?b0N0VVh0eEZtMG81cENkbHJmMjJkZUVxdytSMTR5U0NvYUJabkc0TDJZZWZi?=
 =?utf-8?B?Z2J5Y0N2UzFLcUk3c1hFa1RxVWpFVkJNYzhUczkvbnRTZVNCa1lwcktBaEw0?=
 =?utf-8?B?ZFFrMmIwajV4ZHBtVXlpRmNBMlFUVTRQdHBQbk9UUzlyTjFVMHF3b04yNlR6?=
 =?utf-8?B?Z0VQN2FVaElDMTNFY0J1UEovV3dUb3VCbHAvMlg0ZXZkQXRYUjZtQ21kRmNa?=
 =?utf-8?B?R3Jybk9UQVB5b25TS2Zkdm8vbWZiaG0xTFo5RVJzTVRrS05xb1FRdG15Nmg4?=
 =?utf-8?B?NXZEd3YzTVlybWgwS2p4eFZwUURrcmE4VXNjUTNMRGxMWkM0S3Uyd0poeUdR?=
 =?utf-8?B?cUx3L20zaE9DS1BOeDBadkNWQ3JMUHVXRHZoNEc3OGcvLzlsaEJOTWhrRVFn?=
 =?utf-8?B?RUdia0hVQWVqQWJzUjVLZ09PWGhxTjlaeUFXM24rTGJpQnFlL1Z3OTdQMHJ6?=
 =?utf-8?B?VVJtVks5dXNxcEJJb0oxdnA2NllodktSM2gwanZPZFREbUVIMWxmdTJDVHhh?=
 =?utf-8?B?WkVLTm9TN2IrdFdpd2NncnYwYUhFYVJsWDRpOVdVWlhaeXU4TS92NFFBV3hF?=
 =?utf-8?B?ajdyZVhvMFdmR09tTGUwQjBQdnFVUW9oQUNXZm9IOU9jWUsxMHJuRXFiZHIx?=
 =?utf-8?B?Z242Wk1HZzd1b0IrUW53M0VDcGJHa2hoN1ByaXdSQzdER05xV0dRVHNRbVlu?=
 =?utf-8?B?VTdIZFhIYXFpTFRJYU1nR09hNkd0b25LdFRubDZqWjRkRVlSZklVK1FKSnov?=
 =?utf-8?B?TGdZT0N4THVOeURYcHJMMlVPVFhlRTlsUGdDaUxrb1BiNkVwNExFU3hYVGxB?=
 =?utf-8?B?cjFSK2ZRU05BbUEyVXlPeUw3bVBhMVVMajhqc0dyLzgxazZrVFRnWWxqRFly?=
 =?utf-8?B?RUdDRUptRjgwd1VYcWgxT2x4YU9ROE14Wmk5a3VEK3B0RnFTRWtUWHN2b3NW?=
 =?utf-8?B?L2hSSkhHV2VGVzF5M1k3SjdnN1lLY2NmT2JZWkNQajgwamdtN3ZhNEQ3Rnpj?=
 =?utf-8?B?OU43K0c1bk4vdGNLY3psSjIwV1J1cWJlVkc5alJFdmVsb01aRmFnN1lualRB?=
 =?utf-8?B?MVZSeXlwa2tFTXNKa05CNDFmcTU3S3BVeWd0ZGhKbkQ1TTk2Z2ppMGdPUk5a?=
 =?utf-8?B?Nkt3YmlaN2Zlck5ON09Tei9FL2FCRWYvTlJ4NFdEdXR1ZDJlOFlPc0RlTnNn?=
 =?utf-8?B?K2tVVmhlN1RCYWdMNWZPM2VNUk5ZUEo2SmYvaWk5NTZaWElndkVoYmpLaFdo?=
 =?utf-8?Q?goO+b6zSx8ugEB0BU70enaK4Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f197188-74fe-4d8a-3071-08da55c49715
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 09:33:26.4764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lwPF0g3kSojD4TO77P4KYkZ/3Wt3M/FXY7PrySQXiMyyj+RV8gQTMCqiZYvV6hZPm8lPvZFHDDNbdSIB0YXhpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7032

On 24.06.2022 10:35, Julien Grall wrote:
> On 24/06/2022 08:18, Wei Chen wrote:
>>> -----Original Message-----
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年6月23日 20:54
>>> To: Wei Chen <Wei.Chen@arm.com>
>>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Julien
>>> Grall <julien@xen.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Andrew Cooper
>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>; Wei
>>> Liu <wl@xen.org>; Jiamei Xie <Jiamei.Xie@arm.com>; xen-
>>> devel@lists.xenproject.org
>>> Subject: Re: [PATCH v6 1/8] xen: reuse x86 EFI stub functions for Arm
>>>
>>> On 10.06.2022 07:53, Wei Chen wrote:
>>>> --- a/xen/arch/arm/Makefile
>>>> +++ b/xen/arch/arm/Makefile
>>>> @@ -1,6 +1,5 @@
>>>>   obj-$(CONFIG_ARM_32) += arm32/
>>>>   obj-$(CONFIG_ARM_64) += arm64/
>>>> -obj-$(CONFIG_ARM_64) += efi/
>>>>   obj-$(CONFIG_ACPI) += acpi/
>>>>   obj-$(CONFIG_HAS_PCI) += pci/
>>>>   ifneq ($(CONFIG_NO_PLAT),y)
>>>> @@ -20,6 +19,7 @@ obj-y += domain.o
>>>>   obj-y += domain_build.init.o
>>>>   obj-y += domctl.o
>>>>   obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>>>> +obj-y += efi/
>>>>   obj-y += gic.o
>>>>   obj-y += gic-v2.o
>>>>   obj-$(CONFIG_GICV3) += gic-v3.o
>>>> --- a/xen/arch/arm/efi/Makefile
>>>> +++ b/xen/arch/arm/efi/Makefile
>>>> @@ -1,4 +1,12 @@
>>>>   include $(srctree)/common/efi/efi-common.mk
>>>>
>>>> +ifeq ($(CONFIG_ARM_EFI),y)
>>>>   obj-y += $(EFIOBJ-y)
>>>>   obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
>>>> +else
>>>> +# Add stub.o to EFIOBJ-y to re-use the clean-files in
>>>> +# efi-common.mk. Otherwise the link of stub.c in arm/efi
>>>> +# will not be cleaned in "make clean".
>>>> +EFIOBJ-y += stub.o
>>>> +obj-y += stub.o
>>>> +endif
>>>
>>> This has caused
>>>
>>> ld: warning: arch/arm/efi/built_in.o uses 2-byte wchar_t yet the output is
>>> to use 4-byte wchar_t; use of wchar_t values across objects may fail
>>>
>>> for the 32-bit Arm build that I keep doing every once in a while, with
>>> (if it matters) GNU ld 2.38. I guess you will want to consider building
>>> all of Xen with -fshort-wchar, or to avoid building stub.c with that
>>> option.
>>>
>>
>> Thanks for pointing this out. I will try to use -fshort-wchar for Arm32,
>> if Arm maintainers agree.
> 
> Looking at the code we don't seem to build Xen arm64 with -fshort-wchar 
> (aside the EFI files). So it is not entirely clear why we would want to 
> use -fshort-wchar for arm32.

We don't use wchar_t outside of EFI code afaict. Hence to all other code
it should be benign whether -fshort-wchar is in use. So the suggestion
to use the flag unilaterally on Arm32 is really just to silence the ld
warning; off the top of my head I can't see anything wrong with using
the option also for Arm64 or even globally. Yet otoh we typically try to
not make changes for environments where they aren't really needed.

Jan

