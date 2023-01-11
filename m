Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080B665C85
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jan 2023 14:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.475295.736935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbBC-0007up-Go; Wed, 11 Jan 2023 13:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 475295.736935; Wed, 11 Jan 2023 13:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFbBC-0007rL-DC; Wed, 11 Jan 2023 13:30:10 +0000
Received: by outflank-mailman (input) for mailman id 475295;
 Wed, 11 Jan 2023 13:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1UMm=5I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pFbBB-0007rB-KZ
 for xen-devel@lists.xenproject.org; Wed, 11 Jan 2023 13:30:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2045.outbound.protection.outlook.com [40.107.21.45])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 103d15a8-91b4-11ed-b8d0-410ff93cb8f0;
 Wed, 11 Jan 2023 14:30:07 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8209.eurprd04.prod.outlook.com (2603:10a6:20b:3e4::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 13:30:05 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.012; Wed, 11 Jan 2023
 13:30:05 +0000
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
X-Inumbo-ID: 103d15a8-91b4-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mFIy+QvfbTeOv3/reyp9xdENLhPruCS2CAq4iDulJs/Py44UBJ8IfJN6jXIDw4iaQzn5JOX2y7FUeigS1yVeSY2+6jVprV4DLEqj+cMnDEYGJsUFo4yOy+0zHndShbG6FKos6VGil2JOnVeh/2U/dkET0feYV+UxGAB9yheRB3QA9ncUfpifeVADu9DcQaFTanigGtyir11GNTW8IXXc5eZCEZS48UGQZHglIO7HHtLhtQ0WahqhGNUSyezkkku2hX66c92JmjE/d/A5pxWpPQ/rFUenUvb+sx6UVEpdiWcM40KtlHdXZMjkGHYThHvLIYjawUdHpxPFwvi4dUPUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TX1CqU2wGeQ3+EII8UKIjdIZad4JftlhHN3FtONqdI=;
 b=M03ZLfKZZGG6vFBANJwOjMoK3aY9aX/EDpw6rikctdsPd5+rXLPZtuxT2npVkVLJcCspCBwV/MjFelW5X8u6pC/6A9KrpXZzoCp40kz0zqATN3M85aEkUkR6kvRAiWd8cP01VSGyovJxK5JbMdr43FkKmyBOwK1kUo4t1Mw4Ke886NOdEuMHIgPxn8h8pTg1X1v5MlZFiwHjsaqTYGh25cHED0iWJaJYXQPYvQfbHzID55l3VVi8GCcmShpKBBIgUxSRD+aAsA8lQUYpeBuK3+MLjNKAToIACzLsR6vC0LFgicesiyXaVsNdaSfoEzgt6cxxIf7hpSpQLLBtK6QrTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TX1CqU2wGeQ3+EII8UKIjdIZad4JftlhHN3FtONqdI=;
 b=jU1cqnh5cEsEYvAv+3zrIGHI1UlKcTDAcNBNmDy24aZKjtWGf5ssUoHn/wuZErLhwgrqOOantorv+Jf9cnxdPrcQqKZ6aewG2AZZNP+RScqrc8tvRpGbFJlYMOa3aV6Lcl++7n4EfemNKljNGBlXaq09tdZYAA2/CiaKEQPI/hMBP8ncmna/Y5UAt7tCetBpkw4VnHwCSSbz4gFvE0yexmwWfEac5hfAnZQdK1m2mCGwFjTYDUL7Xf6ilZhb7dEOrTboQo6YNg0H9D/d+5j14NGjSphIg29hZs/DlKGNo17d3gii7D+yFW36nHQ7WX5biWzqBf/0SxhkIjJP6b830w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <306563b1-c040-6e28-c50e-0d742c59cb7c@suse.com>
Date: Wed, 11 Jan 2023 14:30:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen: Remove the arch specific header init.h
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20230111114409.7495-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230111114409.7495-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: f59bd13b-b996-4e8e-7f70-08daf3d7f319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvttihokEJKvUeQebd7F0I7hmHf1wK2+LYMdN+RAVqQ/Qicy/JggHbJCPKeQjB7pfb4D4qyB8cXriNJ3RVZoEsIg92U2OH8GGKSFWf5i1S6kSUnXPC2ojw5Vfv/Rs1oIlgofgAA8HlgEXh26vdO5UJJFiiCfMLfjadE5wybfV7lJa/34Nao1cvI4zjsIU0KAYEL0rvDSKxr1jTN171EVkgFFZasMA3E+rvg0B6xx7GbRb8LHsoOknkYcKRBxCPQYvTIzFy55VXv4wUJoqpswPMKH37twfO4T70F2ylCXAE/S87fkLteH/eXPlqzoJTOwJIa/qJcf87IWXBC0U8CwcdVQKCLezUOs0NwHMo2D+CkP0cRmefk6xt1aZki0cxirgng3c+JigJUp1C6+2IDCab/x8YgGzh2fwDNRPnjkNhk9RX5ICRdi6W7z1XIlHzJ9nrg0gKwo1Y/eDPomUYGkshMLlTGveYFqY87ahqndSglK1Lkluv6WUeK8T9EVvr5cFS04RtvJfTfDEO3QZAYNSBd9pvNgt2K8izD3Eb0KsfTHvwDUWJv4niDTvgBbtNh6bMUr3YWcIjwyG8duCitxPzbwRlaJK/sqOPg7yMqRp6bHO7YifTDj5K9OD/8v8UlkDtXh0N355jDxK/4OnKYZq5NjgRZVCv0jJzNvwxs0N1eZdTgLJgYU1/Vdhrmoy8J8haxR0cpX9EvZsvdYI83mBUX/v30bBf3cvVNAwUMr14g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199015)(8936002)(2906002)(5660300002)(41300700001)(7416002)(316002)(4326008)(66556008)(8676002)(6916009)(66476007)(66946007)(54906003)(26005)(6512007)(38100700002)(2616005)(31686004)(86362001)(186003)(31696002)(53546011)(36756003)(6506007)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFRnVFhzQ0ZSdGh4NjJCSXExTjF1VmJVVE1BYWxMeVRFMUJrZ2o4UXdMK3By?=
 =?utf-8?B?V09qSUJHSlJGOTNBYnovYXJJRVZ3dlJiUEVES1pGdjYwZzZIMnRubDN3OVg3?=
 =?utf-8?B?eHV3WjVramV1RFByZVdUTnplSHZzd2tDS3ZJcFFEL004SWdRK2xURkZVdXRW?=
 =?utf-8?B?YjhHZWprWXpGdU81bTRkODYraW05MzR6YXNmVDJhYVJhZDZuQ3c3RWhXaGFC?=
 =?utf-8?B?aWZiTzkyWmVOUjV5QVZsM1FwZHl6bjZFaXgzeVlBeFFoVVJiRVZLR2E4aUlP?=
 =?utf-8?B?SHdYQVRiVHVvLyttMUJjM0pTblJ0Qkt3R3pXczZKRzVUbWdtM2lyUjlPYzMx?=
 =?utf-8?B?WU15WnQ5dU1EU3R6YXpaVldNZlE4ZlU0dGJuSmZDa0RPWTZsMmtkMjJTZzcz?=
 =?utf-8?B?NUFOM3dJNy93UkovWGlrSE9VRVFuRWcwcHpnSmltNWRMeStya2tRNFVWcVRL?=
 =?utf-8?B?OFdrbFhaNHhFQVQydUk3Z3l6UFkzdzFwZVVrQTJqS2NHaU4wVlFaNVA5TE5U?=
 =?utf-8?B?MWF5clhwcHBwb0NQdENXOUdHQ245WkJBa3lFSzd3ZHR1cWpvWk4yVUtDaXY1?=
 =?utf-8?B?SUpMZ1V1TE5KcTQvd2V6ZlZmU1J5dmU4RnB5MjNXWXJDLzg0N2NZWGtnS21z?=
 =?utf-8?B?cFZMZEJIRWhLbUU4UGVmd0lpYjJmUmhsNHRGejlGZDR6OWY3SzhNaXNoUjNI?=
 =?utf-8?B?VFRsVlZUY3pybFNRTUx1OEZqQUs3QUw3SlJQYWMvVThKMzB3Vld5VUpERnFO?=
 =?utf-8?B?NFYyUkZrdDJVa2JIOUFzVHgwbUQzNWhVUHFWcGNCT2Y4RDdUUUZGM1U5ZXd3?=
 =?utf-8?B?N1dFbER3RUFnbmFvM3BHaHJCV1BEaEo3djNUUEZib3NwcGt3TmxLeGN4S21n?=
 =?utf-8?B?cTRTZ1RodTk3OXM2VndHYldtdFA0UkRNMFhMeU81MHYydXNYUXExWUxTRGkw?=
 =?utf-8?B?RHYzVFFnZk52dzU0OEtZM05WV2ZQWWNCQmpYTGVRZTJVenEvSXVTOEd0QVpE?=
 =?utf-8?B?eVhudEduNDJtbUxkdERabU5vV2llaHltU1pMb3BPc1MveE5iRVlpa2Ezem5E?=
 =?utf-8?B?b3lSTktVWjBhNXlrUVBBUjZPbzVwVGdBTCtod3ZkOGlQaUk3RVRGRmw3dHly?=
 =?utf-8?B?VTAvbDNQRHRRZHJPTFZzaUVQU0tVOEw2Q1VsRm9LYzZib0tjWTNrRlNSZTFN?=
 =?utf-8?B?emFBNzltUVpxWGoydG44bVdpKyt1eC9wRll1c1dNbGYvbVRqb1dDMW5tMGN6?=
 =?utf-8?B?amRWa1RPdlVZTUhWUElCNlNNY2lvRS9zSmgveG9nYWZVTU5SaWxnenRBZmNu?=
 =?utf-8?B?Mi83UGF6ZTM4SlkzS0JHMS9iY01ZbmNQUkhZRGM3UDRxRnNwM3RzZHFNdFd1?=
 =?utf-8?B?NGF4Mi95citFa1JscEpvYjc1ZXhQbFI5Q3BqVTdmRGNXRXJKM25HU3FrOFJI?=
 =?utf-8?B?WkptanBMcUt4SVI3MlUyOUZLU0lHTGJaR2lpU1hhMFQ3MDdJTktxcnVKYmph?=
 =?utf-8?B?TTl6Vm40enU5amJ0c1lDMlBLaUNxa0tBWktzb2YzM1Z4WUpLWnE5blBMY3Jj?=
 =?utf-8?B?c1lpMzBXWGFqTEx5aHZvRXJMWURIMWVOU0NBS05xazQ1SnVQbGVpSzA0NTQw?=
 =?utf-8?B?ZWZTRFI3YjdsUHFkaTRrUmVuYjIrQk1HUkdKRU4rcEpaaW0zWUx5Rm91MEsz?=
 =?utf-8?B?MHhRcFJ4UjVyMU1DREp0QklZa2ZNWE9WQ25ZODA1bTNydGZVOHc5a2tjZmNr?=
 =?utf-8?B?OFhpT3V3MDdMWGQrWmVYUWRnSVljMUlpSjBhamhGR0pnaStkWEM2VEJlNUp4?=
 =?utf-8?B?THhGVWFDWENFdWFZUUJlYnVSNDViZ1phOVFhdDhRNDhoWTU4U21McDdRVUVT?=
 =?utf-8?B?dVBZUmFrcXMrM1YzWndrcVBPeHgrS3ZTcXVma21XTDcvT1ZCdnMzV2Jqa1hP?=
 =?utf-8?B?S2NXZFJxOEVraEJBL3JqSmlnUDF2WlRrV3pqMlZsaE5CeGpOTkNpclFMOTcz?=
 =?utf-8?B?WUR5UGFWc0JBTnFLNXFMK2NESFNCUldpT2d1bmpzT1RFK0wwMGtWZDlRZHpE?=
 =?utf-8?B?MTdXQThXejIzMU1idkRjU1Z6ZFRzVDJLbEhreHJnam1sZm5JOUlFTksyL0o2?=
 =?utf-8?Q?ym3fMi3k5IyGKagTVdLYCgT08?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f59bd13b-b996-4e8e-7f70-08daf3d7f319
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 13:30:04.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OcbW7KA4WD4T3pi9QjJrf6WslnpNqJtvNqSoVJCRKwDK4vlYknMLPhYJnUZNY/YpvJpl3hHSBU3CivH7lePUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8209

On 11.01.2023 12:44, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Both x86 and (soon) RISC-V version of init.h are empty. On Arm, it contains
> a structure that should not be used by any common code.
> 
> The structure init_info is used to store information to setup the CPU
> currently being brought-up. setup.h seems to be more suitable even though
> the header is getting quite crowded.
> 
> Looking through the history, <asm/init.h> was introduced at the same
> time as the ia64 port because for some reasons most of the macros
> where duplicated. This was changed in 72c07f413879 and I don't
> foresee any reason to require arch specific definition for init.h
> in the near future.
> 
> Therefore remove asm/init.h for both x86 and arm (the only definition
> is moved in setup.h). With that RISC-V will not need to introduce
> an empty header.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



