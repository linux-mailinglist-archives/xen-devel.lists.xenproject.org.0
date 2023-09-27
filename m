Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CFC7B08BC
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 17:37:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609114.947990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWad-0001fX-5V; Wed, 27 Sep 2023 15:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609114.947990; Wed, 27 Sep 2023 15:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlWad-0001dR-2l; Wed, 27 Sep 2023 15:36:39 +0000
Received: by outflank-mailman (input) for mailman id 609114;
 Wed, 27 Sep 2023 15:36:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3bhA=FL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlWab-0001dL-0q
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 15:36:37 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ca808c-5d4b-11ee-9b0d-b553b5be7939;
 Wed, 27 Sep 2023 17:36:34 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by PA4PR04MB7759.eurprd04.prod.outlook.com (2603:10a6:102:c6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Wed, 27 Sep
 2023 15:36:33 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::afae:3fda:c84d:bcdc%7]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 15:36:33 +0000
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
X-Inumbo-ID: a3ca808c-5d4b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iln8dcra1KkEXb98bsB/MlwBIv+tX95c/deYzHQB04h/wXOm3+slwhxe5aMFdnRZFcso/itanwIsSpHD7fqDp1dgHjmbDMYD+M+uOAN35noYmZRUnNM1WuViok0K3xAJGoqk+ssePGSrfkpj80VDrSfj8ESlyd4bTH5TVZ7wiulq2xNHvWOge4t7k0x1y+XWrxWGct3abDUBZcrz3jVtBEuOTitSjV7F5nSK7Ra7E1qMxIYWugcXJVMM8QdejPbu9QvtCTDUV32iq1RhcAQUhhgXCG29HLIpohujrKYyteqhKWMRSLh9u4UL1qPqmEtiD/GSftCY4V1f1A/8F+lQAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDlIW4+9R8qB2gIkr00WQPjqJi8hTClh1ZuYhgzVzAU=;
 b=VHRcuixFYUI52vUG9ffs4XPtvmNd791gBgHG5Y0oh/DslUEtTZMvrzmMggQ3kbu1YHGnNj/rI7TSkhSw9KYf6c4q6IHoppwmQWXM6eGFaH69dp5DBxLopx4itnYcPROQapEyp9rLMLBszHFdI+alOYyS7Z+MUMcANA7qkcqde+RzSswDO5gMJwhj9mA/fG3+40BGf+Cdplo5WtEAoJxeReyi0zKR/Hr5f9ILRrmXTYRQr9Hss/wfndUD0U+XZAcbWA1yo6Ayf4BiC1JQlq3HsNUFLWiHDPcx9aCpHS8/Mt/+vzZvjoHja4PuEFfi0h+bLyrEbsyJ04nkCZZpio5H0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDlIW4+9R8qB2gIkr00WQPjqJi8hTClh1ZuYhgzVzAU=;
 b=fC7szqXQCvyLaMsIl0qgg66k2cTmruRDdKZ4a1xguGSNn/HUk42M6p4uhUlkrCLdbqc9tqtwAv+xOmuvuhEqzGZyaeCIZpnBh6AYqBaXtavMWnLVxIOovRn8VWmf+DfJ+dJk5evygE8jHHQr6wMsvpP5efDUqtwP74Ybkx7QBJa+cgdvnksAoSxrmpLIkPUSIOSvHLg0ZsiPqeN1D8l2X+OZzY8+SmFOem5h610Uzg2eroC/Scz8w6ZuZDuhNFrPVRppFcmMRqPPMEJqnaB5w3wEMMk3pR60PhNSG2j2lgNZCFMKvJDANzZJc4HeuLCS+YwPExfwToHgO0fSba/mVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ac87fd15-838f-e292-ba5b-9818ed4745c4@suse.com>
Date: Wed, 27 Sep 2023 17:36:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/8] domain: introduce GADDR based runstate area
 registration alternative
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <472f8314-9ad7-523a-32dc-d5c2138c2c8c@suse.com>
 <bb902943-c139-ec6c-66f9-284ceff3995d@suse.com>
 <ZRRJNw-B5iT_TGJo@MacBookPdeRoger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZRRJNw-B5iT_TGJo@MacBookPdeRoger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|PA4PR04MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: e72be2bc-285c-4b1a-cd86-08dbbf6f86ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YlPngFh0vXIU4DJyvm2/SRmMDg4XT0LhoPjUR3ZH2UcGY+ETgmaczqcBwYHXRE+2lZl4FFbEXX6QhDy7KQ/C6sd7WzpWxssw31nY6Kwn0PkJKOBINcqPFnn39hhUw2Xi1OCZ2sb0lO/dbCBE95bWM7iA5nSuf76jAX+iGiZSX6XE+WqQ0vW5CYukHchAvUnxAATCGmVqX/Jtv1OSdedDGsgBJfkTsX9thQkpV8JKFO2Vse7t/3DFg2QBwnOQgV/fNTK4f9idcxdFaHJJP/GQs7T9AIcI2Vhx7OuuPhGUWwXUR3KEZegKffvebv20m1sQxbjA2NdPuWGQ4RNHap6eouvh90jFt1MO20kbfbS6ElLHFItGNM1Ko/8/2rs4NvJSwWL+fkHbEBdiwm3BDdrVXj/wn6M+CAoYhQ6NZyhLkvNz/qRPDiLV03glPNMTKQEwnsuFt9+QrDxp6sMROSJrRvIUw31Hwzc+5rrZl72H7R88FN+N/dPEDglUaKyuBVh5EMcgeMybxO+FANOkA2nY1LtYe/0tI124JOiuHVy032e92ytv/Fzcy+3xOsiUtrN4dwxrpZGpu88RR5t1npfkYMJi2WPIws0fqd4rFVigZWqSspbwQTgDkzkTzQIHWDojT6OR176Snq3rNxVlfjQ8FA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(186009)(1800799009)(451199024)(6512007)(6506007)(53546011)(6486002)(86362001)(83380400001)(31696002)(38100700002)(36756003)(2616005)(26005)(2906002)(4326008)(8676002)(8936002)(31686004)(41300700001)(66946007)(54906003)(66556008)(5660300002)(6916009)(316002)(66476007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnBXUVRoVkNHTGRFKzJRREVKSkZodlEzUXVFVSswTHZmYjd6VHBJQkltR0VU?=
 =?utf-8?B?aVRhRDIxeGlwaEVKS0RTd1JrM0xsN2pPNEhHKzdIMFYvdGNVb0VXMDJqSldk?=
 =?utf-8?B?U1B1YnJTb2JlNnlVZmUzemo0SjVDSXk0ZEsxS2gybXl0K2ZsRDlBbG5NUlg0?=
 =?utf-8?B?VEs3c2tDSjE3bnZQcEt6SWRjaDZLcm1HVGhRd2NCbDIrT3dlaGRVU3ZaMzl2?=
 =?utf-8?B?aWhHaTBTV3FuRkhFcU5uTHBvTk9wWVgrY3BYRHprKzNiejZCMDcyVThFMExO?=
 =?utf-8?B?cDZzeVF5TWdOeXZwK2dBUk5IRWdRY2FXcDhORkZhd0QxUk1oT0ZRSmhlc3JR?=
 =?utf-8?B?RUJkSlRKODdaVEd5Q0EyQ2lUdmp5Q0N1TGxNekhJR0FTR3NWY29QMjdqdVVT?=
 =?utf-8?B?SXhBS3BNZVR2bU1aU0hpeFZzSHBzNVNpa2FsRjFnc28wOFN2MHJMMit6cVNx?=
 =?utf-8?B?dGZsWUhZdFpEL2JNT0NOaStUaUlKRmtickYyajNJVDRPQndoQiswZDFjYnZu?=
 =?utf-8?B?L1YxWU1xRmlKYXVpbkdISXAzZHBBZ0FXSlJVaytvUkxIRzBGUGxucnJIVUdO?=
 =?utf-8?B?Y3o1ZUhuWFhTYU12Tm5OaExVYWpEK0F1STY1VEozTFpRWUNtdTllZzh5c05P?=
 =?utf-8?B?TmVaZWkxQmNjaGt5TVdNQlpTdE1jd0kwMzBUZm9YSUtIODVYMTlVbS9ZTVE1?=
 =?utf-8?B?YWhWYVJyY2tXTnB4eVYzQ1RSTUc0N2NaL3d6Zk1zbkpLOVg0ZHF3TDZYc1ov?=
 =?utf-8?B?QlcrV2FCS3RIVE53QmtDbDF2OTU1MHQwdE9pZzJUaGJGdDNmNG5MQUkzcFdl?=
 =?utf-8?B?NnUremNmSGNKUWhvYU9zWDBkNTRDM203N0JmaHU1QThIS0pkc2V2QlFHVEtw?=
 =?utf-8?B?RDk4MG5xSXllckZvblA1cExSSTI4eFB0dUdQRjJDVDBhYXZvTVZFNHVLWmhX?=
 =?utf-8?B?NUkzQjMzZnJrR1dZbmxSNGllMStGQm1FWmdhQ1BaQXVCbU9MWlAvN1BURWFy?=
 =?utf-8?B?VkZKbFJkeGhIdTZkVDBlb3BsdnB6dDBPV2lVaXRrN3o0SmtwaU9LZWJUK2sy?=
 =?utf-8?B?SC8yQlpub3JyODlQUk05Z25ZclRPWlZWNWR2L2ZyVlhuK0ppVHJFaDN3cThR?=
 =?utf-8?B?a0ptbGdJRkpwTlF5T3k2S0hteFVNUzJoakVvb0w3SVVadWpYSllPQ01NUG5T?=
 =?utf-8?B?MnJWOVlVaDd0OFFacWZGYytnRHVydW5SNHVmZW1zSktMY2ZGWlA0Y3ZNNkN4?=
 =?utf-8?B?eWVYNmpSbytmL3A2L2srZlpuZ1EySnFZeVBCSE1TTlZMNEM5czVNRnpHa0JO?=
 =?utf-8?B?RWhPZktQbjdBNVlYNFdCa0pyR01CWkVvOEh4SGliejJaUWFMM1FHMzB5T25G?=
 =?utf-8?B?YzdyZ0ViS2NqT2JpWWd2Um5sQmVRbklxSXFmcW5PY2MreCtZRWhWdzI5R0h5?=
 =?utf-8?B?UUJ2eG1kZW1oVTFJZEdJVmVLZXZOVHh4b080QVZVbjg1aStFbVo4UEUrQW1t?=
 =?utf-8?B?RGtCUnZWVU1abHdneGJIam9OaUVqTmRwRnZ5cWRaYmx6QkUrcDBja0tYVDh5?=
 =?utf-8?B?YmZDQjc1MmRDeGttWVlnL2ZaZkdsWDR2UXJpMHBudGt3VmJySWtiQVZuNnFw?=
 =?utf-8?B?aVNJNFc2QUI3d0VPQWFCRWxiVklDdnRnWDBySWdieDg4UUpVK1pzRzlmYkVr?=
 =?utf-8?B?NVhCdkV3dzV4T0RvaWh6UFQ4eDlJczhEemNKSnI5bkhBTkZURTFVdzBOQzNZ?=
 =?utf-8?B?aGhXOCt5bkFWcGF5NkNVcVZoaFc5RldDbFJSRnNkeXlTZWViNjlxQXp3VTF1?=
 =?utf-8?B?eGdYUTZ3Y0RQcWhjT1VhbTgyQldvb2V0cUR0bDZxQy9mdUhhMWVsZ0RobEN0?=
 =?utf-8?B?QW1md0Q1clJsc2lKVHVCYm9xVE5MSFc1VURQQisrbzNkMlVVRmIvV2dXaXN5?=
 =?utf-8?B?MGN1TWI5TmJ1dVJVVnpYT2tOVDRVUHY2QmFDdUdLbkpWL2UzYTJZVVZPS0VG?=
 =?utf-8?B?aEo3L2lWc2twbVd0SzgxRnpjMW1XcFNzU3JybGVUc2R5amdrOWp5MTZ2NFoy?=
 =?utf-8?B?Ym9odWtrMGYrNzlzbWFoRzJoMERxUnpCRE5mV0ttRlRqcTFXMndlbkVsUTBv?=
 =?utf-8?Q?RHfe8xNCQ/2J/qupIgjveyEEb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72be2bc-285c-4b1a-cd86-08dbbf6f86ef
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 15:36:33.0220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRnk5YHKw9R2W6I7VU3HlcZSloAGMwQT9J02h3wqn/Ii468P85+GojPZ/NUCmCD60q2B3HExcNVOm6ldLL+z2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7759

On 27.09.2023 17:24, Roger Pau Monné wrote:
> On Wed, May 03, 2023 at 05:57:40PM +0200, Jan Beulich wrote:
>> The registration by virtual/linear address has downsides: At least on
>> x86 the access is expensive for HVM/PVH domains. Furthermore for 64-bit
>> PV domains the area is inaccessible (and hence cannot be updated by Xen)
>> when in guest-user mode.
>>
>> Introduce a new vCPU operation allowing to register the runstate area by
>> guest-physical address.
>>
>> An at least theoretical downside to using physically registered areas is
>> that PV then won't see dirty (and perhaps also accessed) bits set in its
>> respective page table entries.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> One comment below.
> 
>> --- a/xen/include/public/vcpu.h
>> +++ b/xen/include/public/vcpu.h
>> @@ -221,6 +221,19 @@ struct vcpu_register_time_memory_area {
>>  typedef struct vcpu_register_time_memory_area vcpu_register_time_memory_area_t;
>>  DEFINE_XEN_GUEST_HANDLE(vcpu_register_time_memory_area_t);
>>  
>> +/*
>> + * Like the respective VCPUOP_register_*_memory_area, just using the "addr.p"
>> + * field of the supplied struct as a guest physical address (i.e. in GFN space).
>> + * The respective area may not cross a page boundary.  Pass ~0 to unregister an
>> + * area.  Note that as long as an area is registered by physical address, the
>> + * linear address based area will not be serviced (updated) by the hypervisor.
>> + *
>> + * Note that the area registered via VCPUOP_register_runstate_memory_area will
>> + * be updated in the same manner as the one registered via virtual address PLUS
>> + * VMASST_TYPE_runstate_update_flag engaged by the domain.
>> + */
>> +#define VCPUOP_register_runstate_phys_area      14
> 
> Just to make it more obvious, it might be nice to add a note in the
> comment on VCPUOP_register_runstate_memory_area that `p` can also be
> used with the `VCPUOP_register_runstate_phys_area` hypercall.

I can add a reference there (and then in the later patch also for the
time area), but I don't think it wants or needs to emphasize p. It
merely needs to point to the alternative sub-function imo.

Jan

