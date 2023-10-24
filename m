Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490817D543D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 16:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622069.969211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIe9-0006Bk-IN; Tue, 24 Oct 2023 14:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622069.969211; Tue, 24 Oct 2023 14:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvIe9-000698-FO; Tue, 24 Oct 2023 14:44:41 +0000
Received: by outflank-mailman (input) for mailman id 622069;
 Tue, 24 Oct 2023 14:44:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvIe8-000692-Aq
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 14:44:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbe18bca-727b-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 16:44:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DBBPR04MB7594.eurprd04.prod.outlook.com (2603:10a6:10:203::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.16; Tue, 24 Oct
 2023 14:44:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 14:44:37 +0000
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
X-Inumbo-ID: dbe18bca-727b-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H3WVIYPsUhligDOou2TOgrueHEkDNzS0sBMzRMfrbt9oootWQzpzhWEX9wgmNSHUGyy1tRnKosAbQxG3NFc3Z1PG4jeJyaeKs8j4ocOxNLDXmnC9dW+9hYfkyPaDQwS5M/GkZz3s8jvliLuNDuStAkp5waMEYaiaKLjmf6IXAESoH4gA/Ga/a2vBGlWAUJzeZKEtVp9KT5YFbLDXTkIiwIgoZtzxO5eV44BXzDEguZH+lEwzMZ/49jQVd3HlQi+2pVg3Bo43pZWI2yXuP7W+/UjUvGyamhJX1YQwtK/zvJFSA5cHIf4W74/aBqQFD9/jZgwMM5HCH/djzsvmDQJUXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hJXjalN24Q7+66gwZSmLp+kTa06SRjUpzk4wy4bVfs=;
 b=UTTOK61Mvrna8+RncM6X2PkpJjlGmt6Inx0+PFinC22tVViPHmLQudYU4fppfPTEQxk5zybu8FDoce5sRkgdRGvZ2S/jYYB4HfSvtJy1N0LwWKhOcuY7nL67qiMFbtp6/91INpcKdnHFKg4VYdSgUDLRHWyslJ/fBTUJESRUVOzNA+wENWYxmdaij5Id+emvwK9xh4bAZ/sGYempZBfBTJRvsX3yboZZgTQVb3ENw7XVhR7MqmmqXO/7wnc9RMHwbuNR9SKUTUG7EzBqH+0/wQZIg5Mwzs7uoublgjG7+apL/dSjP3Q0pbdAhtzk8A767SegeA8mJR0epEBhedYu7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+hJXjalN24Q7+66gwZSmLp+kTa06SRjUpzk4wy4bVfs=;
 b=zy11CWzJwxAVFvLO2/FEJ/t5aYwAWNmbQxDuEMu0JhkzQDSuSviOu9DbqBHAzEiZxV/A3WLkD579P33G4hUvn/p8UssVYpR7zDM2Ko0XTcuolkkCmZFK09H//L7TO3DGpd2ARweHEETtvHX0v0EXHP4cMH7C/xLXpqZb+wLDm8i/gVHKfCCcFcDzJlDH6pIV+eDzEBaKYh76UgviqioaYJRLLSBh0ERHT8u7PA4C14LPWbkXh5YdfUI66nMKQgcApdzyex+VNcQdsqtMc8m9ucXTAWbsc+LdqylLluNhk7GjyjAmHXQuN2vozb+OvxsSsq/xoYPtqeJSk84BoJmTbw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <511b93eb-acee-21cf-9377-5150c2e610dd@suse.com>
Date: Tue, 24 Oct 2023 16:44:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/iommu_init: address a violation of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cfd803a27efaa529b4e972acc1fa6a8f0e20c9c0.1698155675.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cfd803a27efaa529b4e972acc1fa6a8f0e20c9c0.1698155675.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DBBPR04MB7594:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f41f37-ccb5-4f2d-c577-08dbd49fbf34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HWzbsQH5ENJjrkiBfjkYP8tWQthzmzJuiCca+cfZRtiQ39ebSMKeljWTJu3iLueIGuko9mTEvpftk0WF9A14/v++okidNIiQq6rjkaZBvJCeokcxyjAChK6LUQHwpJpi7IgE22eQxp5o2EPvcZz6EyPTAzK5suI5LwQKDtDLLTvh2+xtyadpaDSY8NHxcu1FkAk2Kno1TnQ5URZ8HbJ7M8oyyj8tDBnYT92Vr6ndqet7zsKTds8EXtN/bf/CdS6N7g+vJQhaYYtu3pCxGkqr7tBWl7jalzMnUcWyxnztp6KD1pkEDahPCxQ2QskyZDaSr0cmAZP9HcDunHwSej142vJ1fFZBamtjXz0JPeyGvvxEnbj938ZmIVZIccb13fxDHm6DUw4Hje9Z4LPX5VxO5cx8cjkpswRUJzssgoVFFH0H7LKf5wNXu2LDRg5vYmW0k8qVR8cI0oE3UqzTMGwNkykiBlNvuHH6tsI9V2nM5RHQGqmSuErTXbCuM5KvrQOyDE76EPLCgSKhtlVXrDm7UuNrnxGaL4AeLfUUqP0pp0e5JLtZqy8jdqDga7vV/ypYJ4HlcXPrhSNJ9ahJ4sxl20gu3kh6yMKN5KVDI3Lhd+dYXuX0Uh15Ga52JQSU3No4r7h9j0w4NpANl/J9obJ/Ig==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(366004)(136003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(31686004)(6512007)(6506007)(2616005)(53546011)(478600001)(38100700002)(86362001)(31696002)(36756003)(41300700001)(26005)(4744005)(2906002)(6486002)(83380400001)(8936002)(4326008)(8676002)(5660300002)(66476007)(66556008)(6916009)(66946007)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TytnOEY2ZlhmZ3VnQ0p4N0J5emwrYXoyUGorWmp5NERWdnJtR3RuT2NvQkVC?=
 =?utf-8?B?RURIcTJybmZKeHZqYWpaemxDcFlXaFQzemZPMWR5QUt3Zm5kUVlaUjhhNmw2?=
 =?utf-8?B?Mkp2LzBHVjYyRnlOK3ZMZVpPNWFvbmwraVB1SEJuTVhZT1MzQll3VHl6clJ2?=
 =?utf-8?B?Rk9FcWg2Szk1UHRxKzVhcWx5VjEveUd5bXB6T01vNVFRZXZ3eHRYbnBnUmtv?=
 =?utf-8?B?VlA3K0h5aDQvMXVmTGpDcnRZeS9pem5PbVN1YXJBNGxIWC9tRDRUcWQrd0dY?=
 =?utf-8?B?QjhkaktFZEc3c2Z2RzJyT3RzMjI2TjkwbkZ3Tnp4MWswNUw0eU41WTFTYzIy?=
 =?utf-8?B?TzgyemRCWW1yZXc4T1o2WmJPdGgxdjZwcGlOR1k4R0tPcW1pdDFySlp4S0lJ?=
 =?utf-8?B?MGd5cHE3Rnh6Ry9IMGJSMzY4aHZGSnd1YVhLMXU0dUZGd0JTSkphK3BHTkdK?=
 =?utf-8?B?bUxQRGRFWDcyTjNaNGdpM0kvelRaaUwzVDNlNkJoWGpVZGRCSFBCUFBxZ1dQ?=
 =?utf-8?B?MGRIS1dLd3ZUdlhyeW5ySzI4ZHFSOEtLZStnaUs4bDR0OTR3d0VBL1g3dnBP?=
 =?utf-8?B?QVpwS1YyUmN3WXBzQkQ0Wm96aEJ6a2Z5UC9VYnRYbDlJTUVVWUlvU3ZVT2lu?=
 =?utf-8?B?elNYeHhUMXJYQzJlc2tLellMVW9veWJrSjBkMGhLQW5oa1Z0bklkY2pYMzFS?=
 =?utf-8?B?cmpwUUQ1RUg3d3RQdmRIbmZzRzNhclI3bjd0YThDMkljeEpsVmx3NS9DSGZQ?=
 =?utf-8?B?NmNpcUFxR2ZyUHNCQzFsZFBDQjFEMnVWTkx4by9hRlBLeUZDT3JYYUJUMVVs?=
 =?utf-8?B?RXRsZkM1d1g2SDVJMWV2Z1IwTXJaVStEdWNhbHZ5NnY0TFlQRDBWSGV2SFZs?=
 =?utf-8?B?dkFsc3VzcEtiaHBFYURMUWx3c1dQUFVtNXZFZVVOVWRyL1NBTlRoN3Q1bUg2?=
 =?utf-8?B?MnJHTGNJTTFnQzZzbzMxK1JHbG8yS2lMWkE3WWpQYzRPNGVxZ3Z2T1V0RWJh?=
 =?utf-8?B?dWZpclBkbUJUaTdkVFlJWmtoY1AvUFVPSVpqQjRPMzdLL3ozRHExZjQxakhw?=
 =?utf-8?B?VzVNRkhFNHBNQlFYM3YwNHBPTFpzV1owSk55NEw3OUFndzFtRTFLek1Gdngz?=
 =?utf-8?B?U0c0TVplQU52VGN6aEdhcVZjdTdrczQ5MUVKbVl4enVPRkVzYzNGdkFtbDd4?=
 =?utf-8?B?dEZ2djdNRVRNRHhGV3p6Nk1KbnA5ZExWbHpuellXLzRLUDFzb3kycmVWamxI?=
 =?utf-8?B?UE42a3FJWk5mOVdqc2tmcnFSd0xTZk9YSU1yTUhZNlIyNytDT3V3ZEtEUmtD?=
 =?utf-8?B?ak1OYTc5ZEdlMFNIVE4vd29WdWllMUtTTVZCNmZzTFNXTXc2MTllcGZWMlpE?=
 =?utf-8?B?cndqNHNGOFVISDlFYXFwblJLZ054N3NtbmUwZ3VDak9DcUhRdncwcmlZMDF3?=
 =?utf-8?B?UWhva3hvblQ0bXBXcys0SW9PTGlEVWpjNzI0OEZ2aW1QS1ozZ0ZEU3hZNUpm?=
 =?utf-8?B?TjQ2eXVoaTFuUjdBUUFvWE1pVlQremxXekZQU3BFc0w4bzhSczllQ0QxNUMv?=
 =?utf-8?B?YkRHWVF2WDFUWGljYTlES2JjenFJVUhvMVVOenM3Z1dKcFF6N1hGSjE5N01R?=
 =?utf-8?B?Rm8vYitGcjNoRG9HTXNxUWMxSVhlbTA2aVdEbGtJa00zc2k4ZmdpMkpsa1Nx?=
 =?utf-8?B?WHVaQjlYcFhGcStBbFdXNnpHMFJaNDl0VHZncEtYMHBVOVBwYWNoVGYrRTgy?=
 =?utf-8?B?aWlLWmlSd2dHc1BLcFBJdFE3MlJrQnVvdlo2emUwY2dGeFE5c1Q2ZkdYRVZx?=
 =?utf-8?B?YWQ3aXpwZkZid0NYOUlFc016N0FuMlJKdGpnaTJGMjlhdSt0QkE3NUUwTGk0?=
 =?utf-8?B?cFhYT1NRRnBVd3VWV2VIVnJ3azNua1J4eEJMaUtvUis0S25SWlhUN2l5bXhV?=
 =?utf-8?B?YWZld2dHV0Z4VHRQRnpqeGdQZ291bFloa1k4Nm5rbkgxRHFjVVZ0UjBlWUdi?=
 =?utf-8?B?QXlubVZyZVZDMmFETG1ZRGdmNkNoNk1IU0lDQWlxdVJSbXB0alNKZTQ2aXla?=
 =?utf-8?B?UXBYZ3d0T25RMDNKTHA3MGhHOURrQmIxZlQ0ZW9rL1YwMVdNT0xPOEw0Z0JN?=
 =?utf-8?Q?dLPOorTTkg9IC1EaFU89PVj8Y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f41f37-ccb5-4f2d-c577-08dbd49fbf34
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 14:44:37.6914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fop0vhqyZRvz2COxCKSWyaEybOcT4xeAQc+KB8SjWPHYU3yBs7fIGXs4E8I1p6LdcYBEuVCcn9WE6x/VvzP+YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7594

On 24.10.2023 16:01, Federico Serafini wrote:
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -692,7 +692,7 @@ static void iommu_check_ppr_log(struct amd_iommu *iommu)
>      spin_unlock_irqrestore(&iommu->lock, flags);
>  }
>  
> -static void cf_check do_amd_iommu_irq(void *unused)
> +static void cf_check do_amd_iommu_irq(void *data)
>  {
>      struct amd_iommu *iommu;
>  
> @@ -702,6 +702,11 @@ static void cf_check do_amd_iommu_irq(void *unused)
>          return;
>      }
>  
> +    /*
> +     * Formal parameter is deliberately unused.
> +     */
> +    (void) data;

Besides me thinking that the original way of expressing things was more
clear (and still even machine-recognizable), there are (nit) also style
issues here: The comment is malformed and there shouldn't be a blank
between the cast operator and the expression it applies to.

Jan

