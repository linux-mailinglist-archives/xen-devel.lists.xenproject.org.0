Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA4583A6C1
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 11:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670150.1043970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaTf-0002BG-2W; Wed, 24 Jan 2024 10:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670150.1043970; Wed, 24 Jan 2024 10:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSaTe-00029e-VX; Wed, 24 Jan 2024 10:27:26 +0000
Received: by outflank-mailman (input) for mailman id 670150;
 Mon, 22 Jan 2024 20:59:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bVzE=JA=amd.com=Mario.Limonciello@srs-se1.protection.inumbo.net>)
 id 1rS1OC-0002b9-3R
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 20:59:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20615.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fcc0145-b969-11ee-98f3-6d05b1d4d9a1;
 Mon, 22 Jan 2024 21:59:26 +0100 (CET)
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SN7PR12MB8001.namprd12.prod.outlook.com (2603:10b6:806:340::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Mon, 22 Jan
 2024 20:59:21 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::ce8d:7121:cb06:91ba%4]) with mapi id 15.20.7202.034; Mon, 22 Jan 2024
 20:59:21 +0000
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
X-Inumbo-ID: 1fcc0145-b969-11ee-98f3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iges5od8jLRyOpYXXPsAkBB4aGhemAeo+LhEaR/Sm1enCRHgIRCHRZXEEozwkdaY9wQ+P/hCgCHLaDxWF48Pbktr/E1YpwylJC2fPoIXO85p6/++ozS2b6VVKRYBG+PU2yU2GPp4vTVifjAOc6xltV+RuLz4eIZH2caUjpE/O0Ha2Zs8CLTSVNHGQacfbPZBfjbzVRJW6mLsn6Daz+yHElI7XPG6QYBdBkNqUeEAXS2omyQG4v+AKRFDRKAQlByx7pvG4IrXEqh1i96tBgmG6/VZns8kPSDrL+hZYc0QrnzsPepmqh96OXbG5X4VdboJZOb0wuJ0FeRz0DyCyod0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pP1qwKcJmkLgycbmU3ILh1EJRkrNlepdGndJ2gdfWIU=;
 b=CzzcRnid90m3sfs2dNwhqa7SPSf12MeO3iH9ziJnc2/a+MATVY30mv2fx2U75tTqXZadFV2uVwEDplcHNzAu+s2OZaIP+z6TinGVq6JEGUEse6ON2XnoGaX9qKMeC8DHG4Nnld+5N4xeB8uvSK5wmQMFUa7ecZ2m0yWwoNfCRNHpZ2Pw3upztX0J122exPU6uKh6poAbjRREXhHiJ8Dew+kz6/NT8YMtM5dUR34nXxKnWDIQnq2eCWpQOxThigJBmqG9i6z+7nJyH2Y9tqAxprG9/AGgK3esTTeTUKY2LHaAeUPtPmaqhVO+xfeirrAzBCK78DN9Rwhh23bEfebA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pP1qwKcJmkLgycbmU3ILh1EJRkrNlepdGndJ2gdfWIU=;
 b=MrmqsV6l2P99conRmTgYE8MneVBwudPL1z+JYynmBzzgxfIBAOu28KU5BR+XPYD/bjH7Vx9BNqgDW6OZooME6PfSg4BsIWzePYVU9uK+bbmgBlG0My0oqmYcaGBper76xc0Y5IQloTwIEk8VRQhL5oqBOpN4t9ZpCIRj1/U3BqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <214585d5-689d-4ba6-bd48-359428a7ed8f@amd.com>
Date: Mon, 22 Jan 2024 14:59:19 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG]i2c_hid_acpi broken with 4.17.2 on Framework Laptop 13 AMD
To: =?UTF-8?Q?S=C3=A9bastien_Chaumat?= <euidzero@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <CAKm-Umas=5=JzooRzPHxUDigKpFK3Ze7cQcG8eR5kWgn-d_7fQ@mail.gmail.com>
 <CAKm-UmaUZ=rj-F3RvMoR7H3OvBHm1iy4PTRZAjyi=MQUVTuYVg@mail.gmail.com>
 <CAKm-Umat77MTh6=GEuH+bf1WRX+_B4-N5hY4xwADALfhj4QCPA@mail.gmail.com>
 <6ba9568a-ff8e-48ad-907f-74303e04d3a2@suse.com>
 <CAKm-UmZVoUhidEV15Xk+J_XN5a2GsBqMbXL9wqdFdoAFf_u5AA@mail.gmail.com>
 <bcbceba7-42ac-45be-80ab-e3dfe7741ec6@suse.com>
 <2eafe45b-fd97-472c-a173-459d6ff0b957@suse.com>
 <CAKm-Umbs2D7NHFE+NW2xKOu7-AZhFpH4uzE5QTuQusnGA_eNWA@mail.gmail.com>
 <f539144c-885a-461c-a506-bdb73e626a65@suse.com>
 <CAKm-UmY126AfdGhWcZ3s9vwN9+ksVRRFEhOu0ZFMoDvxrqOibw@mail.gmail.com>
 <CAKm-UmYt3iV8zOhSmtqMGhi_8T93c_nCbnefs4m3UC+3UABqeQ@mail.gmail.com>
 <CAKm-UmY-KXEAtBagikW4Jvp=SFXtmEg8P62pHfSo3Hr2s-0_-A@mail.gmail.com>
 <CAKm-UmYbMCfXc1Ny0=qfB+UaLSXV9oEHZiSgS=mwKMwmOFGVrQ@mail.gmail.com>
 <77c1c05d-a0a0-4292-9257-9b7fbebee0e3@suse.com>
 <2859ad22-8714-4628-8142-fc77fc2072c3@amd.com>
 <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CAKm-UmZpyGkWXugYTJqU+qqVDyCFEKghtd=NTr2wK5EMCeL9Ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DS0PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:8:191::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SN7PR12MB8001:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c7d922-88bd-40df-ec89-08dc1b8d01b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0VyKvwbX3UrZ/gc1kvUnNePYX2yrLcT2yBbDLNsspo/qJAosp9tG1430ZGyE9QXXgQYcImC8KESzQvRb+SAgbMQ/iO8oKO8bQrS4NZS3kl89gsmzui3WOoxyn2PvOErwZknk4av4b6MEZHxZ4cZagi6qRJJCEczHMW6DkkBlJe43ZRPeNZr0HGYt+ya+BHhWzZ6kHLmBoiMF6JimlaPKwNsX6YWKZw4gXqI5mbjgoIUsO4I35EJahXi8WdInavYqHqYptSb+LEiRQqjucuBB65i+QvBcsELzTqBSU6efzg2coYu6EYy1hxeSIFlNJ0ZuSPhJjLDYnCdTGbS6dUmXFdh64dQTFG71wVBHU3vo93fr6gZjG4G8tQTk5Ky13bnj8bG9AMRvx1Gal+chPdvQ/We7JBNsBaI7Ktlmnwah4ZQP7mvVji2QLSWrBYSnz82NxUKPlTT0MZVm4WiiNuGx5vjcud3n/frkyYJINCJr9/PrnobrNgw74fb7DAm0inFz3/GMvR5uzQ4S8dHm7cIyzbcQh5yNFgvj1Acr59DlUojq2Wfqxmdm740f58g0eNx2fk4vRZpptKIrUxesn6It5oPorflxM03l94CTqhKrQc73NIefssAqr17B0mcjCM/M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(31686004)(38100700002)(31696002)(478600001)(2906002)(316002)(54906003)(966005)(6486002)(66946007)(66556008)(6916009)(4326008)(44832011)(26005)(83380400001)(86362001)(66476007)(8676002)(8936002)(6506007)(66574015)(5660300002)(6512007)(41300700001)(2616005)(36756003)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eXVhbnUwUXZSV3lxb08yM01oelhKSE51cHdQQnpBdnU4Z3UrL3Y1ZVdyV3o5?=
 =?utf-8?B?alNHWkFTWXdzaUdVSFlFT01KTnNHdEU4L1pMT3NqcTkzVkxaWFpFWmp1ZHk1?=
 =?utf-8?B?U3l6RC9STEZHN0dtZ2hCMzYwRDdCUmVCTGR3UDRWNGZZOU9FaGZlTXlKdUkr?=
 =?utf-8?B?TStyVmZXTU5lLzN5aTdwRWl2OTZVdU5Edk53ckVrYkJlYjZWWmFkSWhCYWVa?=
 =?utf-8?B?WktwYzVSQnp6UGZzTlBZYTJTdGVsTkZtZWdtUGFpNWpaZ0tKZzJsWkhWR2h5?=
 =?utf-8?B?YzlEam05Z2EwbzMyUU00UWdpc0lNNFlzTXdvQWpOSGpoNlVRNWJqbVF4Rlp2?=
 =?utf-8?B?TkhZZFRuSXJ5ak8rSlVFbHozcER2WTYzQTFZVkRjUkdzV1kyYktKbHBjdlU3?=
 =?utf-8?B?UGxLaXdXQ3pUOGFYZU1idkFTQTlMTlAwYUNvcWVWdVh4djBMeExZZ2oyU0w0?=
 =?utf-8?B?dkliMzhOOGtDRW9pR0h5OU5DQ05iSHFvSGREYnJoNVR6ZFhjMFNtYldlY05p?=
 =?utf-8?B?YXlES0xuVFNDRk94SkFiTXBpajZWMExzcTd2VVFleXg1SHlES0taNmJLU0Q4?=
 =?utf-8?B?TWFMVG1uRDJpVzBma2ppZjZwL3l1T1pVNndqbituK0Z6VzhQbTcvVndEaGxv?=
 =?utf-8?B?Tys0V2dPK0EvcFJyMG9uSnhYQ25temFoY3llTUJpRWl0alZIdWxVSHRzajVQ?=
 =?utf-8?B?TWRCNXRTSm1JS0Y5VTA5Wkhja0NxVjNNUWdnNmI0MVlhamxVSHNkRVlndXd3?=
 =?utf-8?B?WjJPY1RaVko2cXlsR1YxMkU3eWhhbjU3SXNFZXBDazdkdlhrckU0Vk5HMS9X?=
 =?utf-8?B?MEczRnYzMHU1QWNDT2U2eFV3ZERIb1QvTnNMRG1QR05PSS9samRrcmdOOUE2?=
 =?utf-8?B?YnFySHBCSUErUHF4bGYwYWpVWFBrWlBUVEdvY09hVnk4ZGx3Y2Vxcy92cDNC?=
 =?utf-8?B?eDRpYW1qTGM4KzVaNzBuUEd1czI1T2QxTDEyRUpJRktqaytYSTFFR1JBY01i?=
 =?utf-8?B?WTA1VHdUamcwdFNhaFBhdjF4MmhDYWlESkl4WjB1QmF5NFE4Z2F1azVHdlVo?=
 =?utf-8?B?NVN6VytXeExhdy9PalZ2KzBIWHVLQ0RuZHZ4eUxsVEZuazBObVJnbVE4cngx?=
 =?utf-8?B?YTlKQUk1eU9PYzBrSXBRTUVFUFZpajFpQ09TbFI3SHFUTndYckl0cWtjcW9N?=
 =?utf-8?B?QTVxVUhCeHE2c2I2a09BWGI2NE9QK3VhZFJ4MjBTUDdNUGRhZG44RU9aSklQ?=
 =?utf-8?B?L3QrYXB6UEJmNElodXl0U1k0RlNpVjJuWkRQcGhFS1ZzYXdKdDRpb1N0azVK?=
 =?utf-8?B?Mzdma05XM1B5THRYdnJPVDBodjgzb1VpdjBJOFhDdlkvL0hHcXZ1bFR4QVVj?=
 =?utf-8?B?RWx3ZmlhVy9WTUZDeS94ZHM3ZS9RZm1pUkFSTjB5RWZHU0FFL3p5bk9RRFpw?=
 =?utf-8?B?b3E3aGhSV2R5SFdXaDVxbXlvRkVNbUtUeHJpRkFqcjZPZk8wdm5kMmZjcDVz?=
 =?utf-8?B?cFF5OFNuSUxkcSt1UGExdVFjMlhOU21uaXNyWHMrTWpCZFU1TFEwY3JEMFlK?=
 =?utf-8?B?akYyaEp1WHNzVlVKWS82bnd5b1cxVm1wVjRsS1VkU1FtQzZ4WEpjZ1NCWTMy?=
 =?utf-8?B?cmNyVWpaRVAzdXpCR29lZ3dqQllIM2ErZHNuOVZrb1UrRmxUMVk1bDljMi9m?=
 =?utf-8?B?QitUakN0TU9HNGNQeWh6UHdzVVNVR1BSeHJRNXRZSm1XcDBHS3ZpNkxLU2tm?=
 =?utf-8?B?aEprNXR6TTRxL0JUV244cVNYck80VGdOb0x2VWoyNUplU1cvMDYveFR0Z21F?=
 =?utf-8?B?VTdyL3ZVY01KS3BWZnZ6SnRNbUdzN0MvV3FVY0orN3NvSW9Jd0JiUFlLaUk3?=
 =?utf-8?B?S0xKRzduZVVQZ2ZEcnVPSVVzcHFoTGUyaEEzUjhEL05Mei9KYkNXNkpCb2NK?=
 =?utf-8?B?dVNDWmE2NGxZMTJCOXV4NkZEYVNhL2QzbkUrUms1cnM2aDRBVDZNTTRKeXRC?=
 =?utf-8?B?RE9uTXZIalJYVXlzNGJRak0vK1pNVGpMSGdCK1cvTVlyc21kUFV6bE1sQ2U5?=
 =?utf-8?B?cjNySzVwN09XUTVhWkhGa05iN0J5Umh6THlkd2xnVkx4eFZmZ25waS9tZkdT?=
 =?utf-8?Q?VCj5sm4AmD2pJACjzX6HUUnUl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c7d922-88bd-40df-ec89-08dc1b8d01b7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 20:59:21.4481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V49VGfPpVz6Sug6E8Ybs3ZqgheeFGnUkyiZSlIB+15LH9U1Up4H1HbYbXiCmdX1KIpL4mwE/BjzltX4Re/m3Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8001

On 1/22/2024 11:06, Sébastien Chaumat wrote:
> 
> 
> Le mer. 17 janv. 2024 à 03:20, Mario Limonciello 
> <mario.limonciello@amd.com <mailto:mario.limonciello@amd.com>> a écrit :
> 
>     On 1/16/2024 10:18, Jan Beulich wrote:
>      > On 16.01.2024 16:52, Sébastien Chaumat wrote:
>      >> Le mar. 2 janv. 2024 à 21:23, Sébastien Chaumat
>     <euidzero@gmail.com <mailto:euidzero@gmail.com>> a
>      >> écrit :
>      >>
>      >>>
>      >>>   output of gpioinfo
>      >>>>
>      >>>> kernel alone :
>      >>>>
>      >>>>          line   5: unnamed         input active-low
>     consumer=interrupt
>      >>>>          line  84: unnamed         input active-low
>     consumer=interrupt
>      >>>>
>      >>>> xen:
>      >>>>
>      >>>>          line   5: unnamed         input active-low
>      >>>>          line  84: unnamed         input active-low
>      >>>>
>      >>>> xen with skipping IRQ7 double init :
>      >>>>
>      >>>>          line   5: unnamed         input active-low
>     consumer=interrupt
>      >>>>          line  84: unnamed         input active-low
>      >>>>
>      >>>>
>      >>>> So definitely progressing.
>      >>>>
>      >>>
>      >>> Checking /sys/kernel/irq/7
>      >>>
>      >>> kernel alone :
>      >>>   actions: pinctrl_amd
>      >>>   chip_name: IR-IO-APIC
>      >>>   hwirq: 7
>      >>>   name: fasteoi
>      >>>   per_cpu_count: 0,0,0,0,0,20,0,0,0,0,0,0,0,0,0,0
>      >>>   type: level
>      >>>   wakeup: enabled
>      >>>
>      >>> xen skipping IRQ7 double init :
>      >>>
>      >>> actions: pinctrl_amd
>      >>>   chip_name: xen-pirq
>      >>>   hwirq:
>      >>>   name: ioapic-level
>      >>>   per_cpu_count: 0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0
>      >>>   type: edge
>      >>>   wakeup: disabled
>      >>>
>      >>> So the skip of IRQ7 in pci_xen_initial_domain() sets the
>     correct handler
>      >>>   (IIUC xen uses the ioapic-level and handles the eoi
>     separately), but not
>      >>> the correct type (still edge).
>      >>> I guess this may explains the results above.
>      >>>
>      >>>
>      >>   Mario (in CC) patched the pinctrl_amd to flush pending
>     interrupt before
>      >> starting the driver for the GPIO.
>      >>
>      >> This helped in  the sense of there's no more pending interrupt
>     on IRQ7
>      >> (whatever the handler is, level or edge) but then the touchpad
>     is not
>      >> detected by i2c-hid.
>      >>
>      >> Is there any work in progress related to the incorrect IRQ
>     configuration ?
>      >
>      > I'm not aware of any. As per my recollection it's still not entirely
>      > clear where in the kernel things go astray. And to be honest I don't
>      > feel comfortable trying to half-blindly address this, e.g. by trying
>      > to circumvent / defer the early setting up of the low 16 IRQs.
>      >
>      > Jan
> 
>     Shot in the dark - but could this be a problem where PCAT_COMPAT from
>     the MADT is being ignored causing PIC not to be setup properly in the
>     Xen case?
> 
>     See https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/
>     <https://lore.kernel.org/all/875y2u5s8g.ffs@tglx/> for some context.
> 
> At least we know that no MADT override is found by xen for INT7 as no 
> INT_SRC_OVR message is printed.
> 
> Do we expect one @Mario Limonciello <mailto:mario.limonciello@amd.com>  ?

No; the INT_SRV_OVR you'll see on Framework 13 AMD is on IRQ 2 and IRQ 9.


