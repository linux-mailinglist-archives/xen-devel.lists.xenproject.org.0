Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48B17CF3A4
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:11:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619014.963471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtP3x-0007do-4w; Thu, 19 Oct 2023 09:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619014.963471; Thu, 19 Oct 2023 09:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtP3x-0007b5-1V; Thu, 19 Oct 2023 09:11:29 +0000
Received: by outflank-mailman (input) for mailman id 619014;
 Thu, 19 Oct 2023 09:11:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtP3v-0007az-Fu
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:11:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b57762d-6e5f-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:11:27 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9517.eurprd04.prod.outlook.com (2603:10a6:102:229::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 09:11:24 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 09:11:24 +0000
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
X-Inumbo-ID: 7b57762d-6e5f-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGUPnxqPVk3ZUvZdzwVxYYRTC1sG3lLdyBoNsoi53o2jUzezEfVQCUSRkVda1ZsVqzh07mnFPdOxwXx8+FDGuCf/PiDnJ3FwEU9tfC1NwPbPeF4t5o5G7zCwvwhd0oy7njhOsGwynv/IwyGQ3nmb+u5wrcG8m6gy3GXFtDYIEJF+NgehZV3oO3r2pDEFn/WAtdgwSPlAvcutnBQyOdzmRgoSAKOUrOac9DOqIQHAHUmRogqOZd/HE1Hy3CvGJpjWPH6vFEpSodZiF7NNvTYjYldFjEhyfPZcWUZhKXysCByGgsQVFNF2lr31N2JTVJZYcxDodM6Zwx2Loomj+DZ+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg5LAyald4FspBOeWCyfr7t3aqJ0toy2Pkdy7hNxpQ4=;
 b=P50uxc7IaxM/0XQBEx2oFML++G6NQ9GZOJjBBQ+RsQp/Wuj0jreFtDjtNzPUNpBG9iLM9NL7UBT/6Xv/ln6cw9KrvPHUbBrbujkiah7wTa01C5t0spnqL36w0QnoHHabh0G2QnfCxB2bZfHDoU9tEwiLQZTSFayjQY8gL5AgThbOzCOJcqdLAPK/W7yY1VDMSb211V0+ezgN/OvcwdlwwzE3WkCOCgyC8ctgAZmjp5NAB7gnNisS+M6GpkHMv08BFgs04ldPOTZDJh3qMlgIri2WlCJg90aCUAge3aoHoo3WOeaQyHIzfoX5wUCx1ZtPkxp0kZDJ5id4CL/cAlVhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rg5LAyald4FspBOeWCyfr7t3aqJ0toy2Pkdy7hNxpQ4=;
 b=xanLZDJ+p3g8+LlCiRCqQz4CVfFWEJsN5njNcTod60goPAFz0wH6znXCgKV/ohWe634nOxj+2RrbFbM/KaCgBd5VvURw7TIXDZz2FttPUCCoR2bBKntnVugtHGkwKpq0R7rj20GvbmctPZ0v5l5sPmbsj3FHf6chUJhlRvtpLtK5Uvi/MzLHFpaji14fNLL2uqw6ITZRIisyZaHeSZdaNftbULNeWYEoxgQXYr6iE2D32NcpDFe/06oLYgyPQAE6JRfU8cqmfodHdyEMyAITOFIoUcU+c5Bx168N5aahyoirn493NcEOBesXhQw4iVTE+wWFnaORD2bkmB8ORp7MCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dbc0e6fb-3f25-b4cb-83a2-d7c5f1a9e0a3@suse.com>
Date: Thu, 19 Oct 2023 11:11:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 03/29] xen/asm-generic: introduce stub header
 cpufeature.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <c89b1a60ee40576a2841c222a2cefc5ae2a301d3.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <c89b1a60ee40576a2841c222a2cefc5ae2a301d3.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: 8494ec19-41e9-4319-2bd1-08dbd0835dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rVWeLX+O4FfFnRABwqa6daHGqbeqgFxsBTP5s8LwGo946e/HNgkP0ro3POd8idmO7qeo0gvJGaqy3P9QLMF29hEbm4ZkE/dcJ4bchjf/DrLjrg/Un1uyYuwJ1woSIXn1QAgqjM9s5s7olWLczmbQBm6QKAccz6pipP9yyrsASmnuxWc/6voMomeHd0PDn/FTC4aCIwBlwEoFG7cHbYuD/uu780ZBtIIv2Xj8QHE2gkaZEJKAbd/sZxj1xsvzBQWpeFn3dWO2DuVWBMIoMnAKYnNg0iSmhvbS0wbhZLMtj/NwiO9Jbh3B/ey8wuDCnMr/yu9scjmkCmiwP3HAVeXZ9eJkQCXA2fhVdPOjdi51jB9z50dkT+oc2loHPT55e3tqcmSR1QKwdeok9dDrq02uwLZoCq+DnTdb5H6BaAmckoe8SE3eAFlzdTjvFiIdLRPDiUbnyPe52IDTT8mX8DFKOF+b76MOwo0YTzsKBDnIgMPOOc7oVWBx5Rh4ZNS3XrH1h2b848vDUvMZsyxQsMcDD7xRm+UMNtd7knUnV/BY2j7P7cCRirWNJ/Zf3+eoY++u02v3bSxLWpLa/vQzroXUB0Hk/6aN62hlHvzL4JUH4KOGN2JFmUfprtYVg6AFWRlEb0m0HqG75bRxTrRReVLgY7O+PlOrGXQf82WgbIkugno=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(66476007)(54906003)(31686004)(6486002)(478600001)(36756003)(38100700002)(66556008)(66946007)(26005)(41300700001)(316002)(2616005)(4744005)(53546011)(6916009)(6506007)(31696002)(86362001)(5660300002)(2906002)(4326008)(6666004)(6512007)(8676002)(8936002)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzhnZVJQVk9CV21TclBmYUdqdkIwdGdENmhVZmlPWEZlcHcyK1Q3STB5aCt0?=
 =?utf-8?B?RjViSm56NDhYYk9LRkdMd3MyZDVmSGw1NkFnSVNTZnJaN1ZUVTBDU0tEaElz?=
 =?utf-8?B?bGJtMWErOTYwVW5Sbm1hTmNXT2h6RnRhSHBTR0N3VmFvOEdpUEpwWU5DdkU0?=
 =?utf-8?B?TGVSZlM3ZEFjYUdWb214SGNVU2RXYXVjMTc2bTJQT0o5N1E0QmtqdGRseGc4?=
 =?utf-8?B?WUlhS3MzbXdVc2lIQi9BeUJyaDVra1ZwaG5LUGxYMkY3VXlPNktUNUo5Ylhi?=
 =?utf-8?B?ZUtDbXRiUk1SQXB0Vko4blZORlplOStIU09MMDhRNC93Ukc3VXNjeWVqc0V3?=
 =?utf-8?B?WG52aXdaZk1qRVR6UW1SZnVWcllVWU9DZmQyOFFJdkVLdUhGV0UzSkNXY0J6?=
 =?utf-8?B?NDZIRTA3V3M3dVVrTGNTWHZla1EyN2RlRmpGSmZIWnZUR2J6Wll1ODJ3S0pq?=
 =?utf-8?B?UytZODVaUW5XNmszVk9KZ1NtTEVHalpRRHJodnE0T2ZyOUZRdzV2b0s1SXlW?=
 =?utf-8?B?OUZIazNFSmpiNHpkd0FiUFd6a0ZMWUFRUHVndGQvdlhBb3l6Q0VxL0pVNnJF?=
 =?utf-8?B?eFNlbndnd1VGRS9vUTl6c3Q3NSszcWdOYWtQYVZkd293eElKWjBwbGFhM3ZE?=
 =?utf-8?B?QzNhZ2grNW5qdkhUaVVseGJ3R2o3N2pNSlhZd0JvM3pURnFkeHJvSTRocmk4?=
 =?utf-8?B?RHoxMWFSY2lBeWx4M3RDT2RqTUw2ZG9TeDh0ai9yMU03aXYyNHM0RDh2Rkd2?=
 =?utf-8?B?Q1NlWnZqQ01MQ3JZVUFWSFVQQjVNQnV0R0NwbHZDOVUyci9hMDdPTTE0R3Jt?=
 =?utf-8?B?SXhnQ2VvZ2xlVzU1OFZCRzZWNE5aUTlvdWxiYmF3a0Q1THNYMXc3dE5nTk9G?=
 =?utf-8?B?LzFzbTBnYlM2eElHdXJnVnp2ODNGOGtDcTg0WW00d01qU0RNQTMzaWJZSDlY?=
 =?utf-8?B?bGl6anV4TGFUWjl0dXBwWWEwOGFKOFZibnVxRDFXZFFFZ0EwR1QrZE51ckJN?=
 =?utf-8?B?dVdPbHdaejVodjM3czVzZnFSS2hBaEowUWlaam1VQm1HdnJPWFF4MkJxc0hI?=
 =?utf-8?B?WVNxQkVNWnBETnZ1TVNicG1lYzhxeThhNVVpRWI1bSs3djF1MjEwZVBOZ3hx?=
 =?utf-8?B?L2hXSFZQWDNDN05vNnArc3A0V1pjRVB1V2VzTHBLdDFTYlhjSk9vZHRaR0Fr?=
 =?utf-8?B?QVBlSkFJRk1GZTVwL1BidjNteFBTeEJ3dVVFSnhQdHhVOWdabEd6YXZWalUy?=
 =?utf-8?B?SUdrODFuWDBoeGRrVC9UZVRoeklSZjdDSzJQKy82My9KbWxwU05XdUR1MG83?=
 =?utf-8?B?ODhQUUVZSlZqUlNnVE1TTjR3T3dza0NsWnI0QnRJRm1BVjNyZjc3MEk4NlI3?=
 =?utf-8?B?WGRqS3htcTB5NHdNd3VnL0c2KzA3NHFYWitnL0k0WldoRmxqWmppcU03ek5Y?=
 =?utf-8?B?NC94c0RoUmFMZWROdnhZNk5Ycy9NWVorK0xSRWRiL2VCRXNhbWsva0dOZE1j?=
 =?utf-8?B?aDhSNi94dTBIR0pnZko1NGFIT05xa2RWdEVCT3RXbUYxN1VYejcyZUVTSWRD?=
 =?utf-8?B?QlpxSTVBbnp6alA5VFVZanNQQzNPdWI5UmFGSlNpSWo3S0dyZ2xheklLbUQ0?=
 =?utf-8?B?bjdkRmkxeUkzcTBxSHFSajQ4aVZoVGpyL1UwYmVTQkRtUEJtblVPY1BGWGoz?=
 =?utf-8?B?Y1pDa3VNWjR3dHF2S1llQU5TZUJ5NWk0dG5pQ3lnUWpKQ210R1hxRHkvY1N3?=
 =?utf-8?B?dC9WV3o1cFZZQkZWU1hROGR4Mlo1NFZKRE1udTlUajVVdGptVTA3ZDlUclF2?=
 =?utf-8?B?TStvMG1PeUpWUXNOOEg1NFFUSk1VaGMrSExqQlRkV0NESTZ4UktHRjU4RWI2?=
 =?utf-8?B?NnVIUHh2T3QyRWxWc2VLd3dKL1hJVDk2WVFTbVZ3RjVhLy8xaWVOd2tSMlNM?=
 =?utf-8?B?d2hqQnR1MjE1d1phcW9RWnFHWnhwd2IrTnNRaHgxQXRxTjE0TDdHMkl5emk1?=
 =?utf-8?B?QXNDWEg3bHhZVkMwRlNwellJU1RtQ3dRZHovWUpjUzFsMk15VCtOZUtma1Qz?=
 =?utf-8?B?TmRrc2dEVVBLN0gweUJlMWZHZ2duY1IvQjJiNXlOWmVSTWlKSDBhbjNBMllJ?=
 =?utf-8?Q?e3WXuW8ACkc5gaGvgAED6FYCS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8494ec19-41e9-4319-2bd1-08dbd0835dff
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 09:11:24.0537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9numKha/9rrmZEQXx1CZ6dc+VZL28a70+5IgierMhLbkZ4q1zrAW3x5JOtIEiRe1c8jrq9otIs6hZ2QMWaTJFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9517

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/cpufeature.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_CPUFEATURE_H__
> +#define __ASM_GENERIC_CPUFEATURE_H__
> +
> +#ifndef __ASSEMBLY__
> +
> +static inline int cpu_nr_siblings(unsigned int cpu)
> +{
> +    return 1;
> +}
> +
> +#endif
> +
> +#endif /* __ASM_GENERIC_CPUFEATURE_H__  */

I'm not convinced an arch can get away without such a header. Certainly
RISC-V and PPC can't, with all their ISA extensions that already exist
(part of which will want making use of, others may simply want exposing
to guests).

Jan

