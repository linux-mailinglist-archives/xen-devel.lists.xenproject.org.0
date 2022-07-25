Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E096D58023C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 17:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374677.606812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0MU-0003MG-KP; Mon, 25 Jul 2022 15:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374677.606812; Mon, 25 Jul 2022 15:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oG0MU-0003Ji-HR; Mon, 25 Jul 2022 15:51:14 +0000
Received: by outflank-mailman (input) for mailman id 374677;
 Mon, 25 Jul 2022 15:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oG0MT-0003Jc-Nr
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 15:51:13 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80041.outbound.protection.outlook.com [40.107.8.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba90d2f-0c31-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 17:51:12 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8440.eurprd04.prod.outlook.com (2603:10a6:20b:413::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 15:51:10 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 15:51:10 +0000
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
X-Inumbo-ID: 9ba90d2f-0c31-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1kIGimLJ0RVj08ry9lciV+2tMKih4we+f4I9w5hMmjUJpFLrh+aVq9wzxHGBAUJEKIZmI0sHhgkvIaJxvCzjX8qb+fPTpSVapgw6lanMsWObK3sceLB4sM94Il6GKLLipDy1ikmU8nVXTPj9sruE2syS/5o5fL/Wqt9Cx2Aeze247wwJSa9dgW/fMez72U2OxZ6PbzE/Dt69sSSjwvhdkDqeBU4pM2b3X0nhTAcWX8t8sA2av8vTujhDKWTwrBoB7KrP7K1tRLHQQ5L5+w2Tl00+dGs9crHctIAyTT6cQXYiEXjJFS+uSDBLb3Pf+7Oh0dlnIdqKJ90/522zlTjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RY3QNhx7VpzFe+yo2jhRa4wL68B+R3JENc19j9hx+1M=;
 b=Xl65RQ/n9Wo70Ed13Cz02AJw1qZtbAIx6VAmnl5LSED0CqUAPZbQVTOUc3tZ3xasn+VwdNTi+d9mi5t76bHIEA5/MqZkMlVUEEpBHmObbA+GBfV/TfdfXD7uP1lPOLJLGnHsK1OyuSSL9Lpm1/RwCqwXBxM/VM+9lyJVLfTQsC1vpuuVgLV3dAvKEDSP6oG5PKvRIUxjlSBEbH5gIbjI/qL90lxOQLVjnmM6wOR+HVcAjdhEnpu6q11QPK0jHqU3X7JheGvchmvvkoGL7Q0DPB9QQ+P1mSj93SrSwh11BVDantFnmydOj/QuFPP0ptjg860pCanA/hCzeIg4o2IHUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY3QNhx7VpzFe+yo2jhRa4wL68B+R3JENc19j9hx+1M=;
 b=lWwRa+m17q+tgSYUT1abUdIs4A8mJBBZDH7e0F0piNHiKgTDZMVOIYUy9oZ71JHFvZB013aSZBlRIu35pyXeSXHFLYoF1XGYxcnEseoFH2SHrfby8DB4bwSIvk3iEoskUovpaj2DgzvkSMttfVhCygS9Yt/82pY80WuDzeONaXxXPPSJI33BJPcIOlgr4MvW8XQ+Mf1EAmfZ+p3ynqbKiUz6PzcP11iB79KRY2tpiaz4hHkk+2qhS4yp/MVAFAA9tKjXY0ubn8MzUKo1uIqh2Mr39K2XXfwIFSFsunWkLK+Iz9DxgSuxRUvFShAzq+F6caNl3X/sfwyQn5wRbSwwug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <414dcf57-b18f-8a88-b143-e275b5311079@suse.com>
Date: Mon, 25 Jul 2022 17:51:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/5] xen: Rename CONFIG_DOMAIN_PAGE to
 CONFIG_ARCH_MAP_DOMAIN_PAGE and...
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20220720184459.51582-1-julien@xen.org>
 <20220720184459.51582-4-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220720184459.51582-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d887ccd3-e3dd-46aa-4b18-08da6e557e77
X-MS-TrafficTypeDiagnostic: AM9PR04MB8440:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xm4O2oXN9bTj0wZhHy1X8CZvst0hPWzl+KWNgr/75p+4BOiCckwBtGLRnBgFpjjJ0wMi+SjsXHIN9q8dkoV2M2FjPsUvHkea9Og8d7gO2X4uh5zdIGWrqIWgTQrvsPdbFnbny30ZxPiG71+TVsoj6heM+lrDjh/ze0fOmker38vHJQhpsJyhLaLHwjOxpXJNUYJeAklGH077ImUqh6+nIbiDvzWefrQYUvIK6wosiO6+w7VGniRaq6INlgnLKgYdZiBGXgIde3Zo1ZVXYn+xvcBecKqjT3MH6XyMegFQnREvnMlzbp7BmGoqxReq1WqnpoR2FzwSIGUumDwTkOEmETGnSMn4A6C02+OgteCYJe5rOkIACLx+8Hq24ySRoiFRobD6T8C4cubozBS6hrmOhMDz21MJr/71mi5qThtjrmMmIMyrefviXNLANnJW4klYBXR7YUvQ29KNIAd79XRKKG5LmVLiS1LInQMGf5SQix8PNeGVUu9diknnoU4AKTO39ZuBIylFXtDZWdlF9bN3C4/ZQj7Jq8h3nPl45R7NX/TunNxKqOQUhhh49Y+VNClbB34qpohqZJFBca7K26yRauICraREQXky1dciTzWqSijgz9e/n6zhyAnQXMYrzp/aC8ibImgZ/20KIlNqFmk1JslzqTovpF98lOj/1sMMczw0T0FVnEiIOsTIs+qqWUeyJGGOyYTi4ZuXRft0QvtJ2MRr7sGAlODH+zskPDnBJ2VLrGOtLDWrED64MRWDqoSIy6Zu/BZj9+zxov7OP0KkkAFgWqjyeCWBRLyTTIsILqLzpqVFVFGa2eo1KO0mBIOWsQ3ab48P2ZIc/oqcCCvvVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(346002)(39860400002)(396003)(366004)(186003)(2906002)(6506007)(53546011)(8936002)(41300700001)(4744005)(7416002)(5660300002)(2616005)(86362001)(31696002)(26005)(6512007)(478600001)(6486002)(54906003)(6916009)(316002)(36756003)(38100700002)(66556008)(66476007)(31686004)(66946007)(8676002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUR4ajhjVGhkQks0SS9CSVRMYkRQK0dxUU1CalJFN1ZhTXJ1Q01USmdSTkJa?=
 =?utf-8?B?K2QzQU1RNFhYTEVzSGxGeGlscTAzekRuVk10Z3JlNTZGNFBXQlA2YXdYa1F6?=
 =?utf-8?B?L0xYZkdaRXpBNnlUU3d2UVhQVEVtVS8vb0FMZ0cyaGpYRFQvSXFGSDl5dzdS?=
 =?utf-8?B?MDRLa295Yk9jQkEveFJNUjRwYUtMS1BrVFdnRmZROGsyTlpZVlRQbzh3b3cr?=
 =?utf-8?B?OW9RcUY0eUtETEIzcTNqNVJmamljZElQQ2lnU0RvbmxkTVIwQWI5YWtxd0Rp?=
 =?utf-8?B?cHAzL3BDazNJSDN0SERqY0pGYVlQTWIzVnMxcDJQdHNCZjVYNXc5anA5Nmo0?=
 =?utf-8?B?ZkJDdGh3RFBjUmxuZ0RFeXd1V0JmN2gvS3FtcGo1UElrcEV2Vk9VdVJ5MnVS?=
 =?utf-8?B?aVN1WHd3cTVsK0dDTEdLbk1oZ1RMK2FzSm1MRnVPOHhDMjBWMSs2eDlHbXYy?=
 =?utf-8?B?TXA2d0Q3TnZFUmFkdGo0bEJiZTRsVWpJTWg3UE9ic05Ndjg1cUkwbTJHN0Fy?=
 =?utf-8?B?U1NnV2hkWnpvR3ZaYnNEWjk0Z0NnQkpSOU9SOEtpTXJ2WEw1ZDFUdDZqZHhu?=
 =?utf-8?B?bUU3eTEvTnUxRXBBOWRUblpEVHZER2t2UHVkRzUyRzJXU1Nya1gxUTlZb1J3?=
 =?utf-8?B?L1JFSVh6b002dk1lRCtmajhGdFZkMGV5aGcvRmdPQ2p6TzA1dzhaZGtqWEFS?=
 =?utf-8?B?RlRmZzJveHNXUzB6a3pmNHpjQmJzcXgwYVAvcWdLOTBKdlV0eHJXcFk4N3lh?=
 =?utf-8?B?c2NTd0tTMUM2ajBaTGluTTk2Yll5Yyt1WFFqd2t4aTBIUTM0blluZkNxdnVz?=
 =?utf-8?B?Q25SbzRVbndobVcyb0JuOWJhWmtlcEd4SmJKV1lxYjFXOWZjVmZtb25KMXlT?=
 =?utf-8?B?M1B0d1hRa2hzcVBYa3JUd1hER2dmajVHaWk5alFNMzlXWWx1OGtOUVFxR013?=
 =?utf-8?B?ZlNMQmVUb3JYVFJ6dUViSkF2Ly80SWpxWnlhWXQvY0VpczBsRmZ4c3g4MUhN?=
 =?utf-8?B?N1VCQ3p6eU1vakZaRDB6WmhZMU9QMSs4QnJFVXpHOXVjcDYySi96SUEwZ0Fj?=
 =?utf-8?B?YkJPdmZxVzFCQ013NVVsR2hIVVlJZlljYVBoZG9xL2tHNFBZVk1CUkh4empp?=
 =?utf-8?B?SXRrMXlFY0JZdE9DYi9kMUZGNXdVemwycVR2czBXVStOTkNaTzZ5RTA0MVRs?=
 =?utf-8?B?bEdPazdlN0w1MVJsYnJDdWt4U3ptREdDMGpsQzdndXdzNDNvNm5kUkpsMmpD?=
 =?utf-8?B?RDVrbEcwMm16NTgyaEg3S09zQXVvWk1zU3JLN3htWnZxcUlMOGt3S0NLN3NG?=
 =?utf-8?B?a2VDa21aNzdVOVU2M0VWdHEwM2ZjS1N1SjF6blp4Ry9XSzFZemFRT3VlaURM?=
 =?utf-8?B?d2dIaWpLVkYwVlRDOTY4WVFzME9xY25CSGpSQ2JHbzlpZjNpTUs3aXlFUjI1?=
 =?utf-8?B?SXFDVlVwZXJEaGhtc3ZUS0FJWFlIcksvaVdURVRURDNKbmh0VnVKbG1aSWJL?=
 =?utf-8?B?cnBpWXBlOFBQMW9vbjg4OFVWdVU3R2VlZktCSm5LYjd3UWYrUjhGeG1iWXBn?=
 =?utf-8?B?NTJjdHAvYVUyMFRyY2hoQW1DeDI4ZkVJZjRiVTFoY3NKTGZHNWwxc1FKb3ps?=
 =?utf-8?B?OVdaSlNHcUQvaGFKSzdSTnVaakFWTkt5eGcxOU1wVHRpUlpiSVFQdTZsQW1O?=
 =?utf-8?B?NmM4TE8vMjNDSHFvNlB3cGtNejlQUjhwbTQ2dFMvMlJwWEYva214bVFmMHRK?=
 =?utf-8?B?V2h3aDBxUUlZZFg5L29SUVY5dFZDelN0aUtaZ3QzQms0ckN3OEdrVEgzRnhK?=
 =?utf-8?B?SGxieENMczN4T0pZckVKR3ZjZy81b05RRFhFaUVROTZiK250U2g1YWZrZi9p?=
 =?utf-8?B?VHRVZDBTb3BZNkVYM1NUY0RaRGpoTlRYNml4YU1BWnlXVjFwc3NzVlM4K0o4?=
 =?utf-8?B?NDhzWmNUUE1rODV5MnUxdjE5c3BEMDlITzFLRlIyQUU3VytDelZ5SXZDQ0M1?=
 =?utf-8?B?aUE4SmwvdUg5QzhEdFRNUDNoajdnc2VabzVITTR3ZzFpQVoydDlGOVZqVE5X?=
 =?utf-8?B?LzJIZUU4Qm02eHM5eW96L2FIN3hhenFzeGtqK3NSUHo5NXdqOGQvZzZmOGNx?=
 =?utf-8?Q?W25QzQQ6m/qfFXS47A+WLX2V1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d887ccd3-e3dd-46aa-4b18-08da6e557e77
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 15:51:10.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3r0Dcu5LBSJ39c6/hTZ4N/WDJbljlocWLGNWXaNlMeOtxV6a5w6Fi33vGu0YkXSA/I17Cm2QeJGcFAQISQvigg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8440

On 20.07.2022 20:44, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> move it to Kconfig.
> 
> The define CONFIG_DOMAIN_PAGE indicates whether the architecture provide
> helpers to map/unmap a domain page. Rename it to the define to
> CONFIG_ARCH_MAP_DOMAIN_PAGE so it is clearer that this will not remove
> support for domain page (this is not a concept that Xen can't get
> away with).

Especially the part in parentheses reads odd, if not backwards.

> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -371,7 +371,7 @@ void clear_fixmap(unsigned int map)
>      BUG_ON(res != 0);
>  }
>  
> -#ifdef CONFIG_DOMAIN_PAGE
> +#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
>  /*
>   * Prepare the area that will be used to map domheap pages. They are
>   * mapped in 2MB chunks, so we need to allocate the page-tables up to

What about the other #ifdef in build_assertions()? With that also
converted (and preferably with the description adjusted)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

