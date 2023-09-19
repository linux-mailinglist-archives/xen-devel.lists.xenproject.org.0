Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C63C7A5EEC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 11:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604535.941967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXVt-000081-CN; Tue, 19 Sep 2023 09:59:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604535.941967; Tue, 19 Sep 2023 09:59:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiXVt-0008WG-9a; Tue, 19 Sep 2023 09:59:25 +0000
Received: by outflank-mailman (input) for mailman id 604535;
 Tue, 19 Sep 2023 09:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiXVr-0008WA-PX
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 09:59:23 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe02::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 34773a55-56d3-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 11:59:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9094.eurprd04.prod.outlook.com (2603:10a6:20b:445::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 19 Sep
 2023 09:59:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 09:59:18 +0000
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
X-Inumbo-ID: 34773a55-56d3-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0PRb5luLvuQHbvpS72RulqydZJWftmySC5GeythAssdaoQcBX4mX9gynzUN6KFUFwSe5v6I0T2vwrXs0bP9cWCAfVCoknVnOgDwys0TXL0Yf3ULbaY5Eoz0gO+9FaiuJ6x7QM5HnT9oKLRQnmweX9q76ZlW/Nc1IT8sbXM9Z1FKoO1xp3K6L4oVrnPO5wg3DpSNKj65flvODpRYVoav5H2XpiHVVmjLAuYh0d5t31nnme0gDOHJTXnBYNjX9aoL2xpoGQQYOi0sAYiMKM1kcPMxInIFfeQ0tZ0x2rTn/FzjsaBANt0tTkOaRC2hq5YH47ThLOLW12Lsf7EfIOjnLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7vkPfv6tHqwQP+MdMC7c82HnAW22ZJ7qxNfGeLESBNU=;
 b=cX0056dh/yaOG4HKsNQh9ISoN08hh5spUq6FRlGAmFMmkDgwlZoGRSPGWJw3YmFn/bt4lvySXkOKajnejuzmmQspKyR8rXRNmr0Oc1Y/c8bKvF9BjTAOAEe7K2uLpQbjGvwfVz764H2xGQfO0I84rGRvxkBmOKuZt58SZM2JW2T+NwNDseLzhd8UA36nMkIubViCEmXxSlWWSG6fuH1KUDdFEAR/r12Aenax0BnoebK81FD2wQTxXLLL6UpiTh2ADSOdciC0MgrobogQzFJxo4LXKICtX9EHauxyFhS5PfiDvx2lpKGwsqP0rHYRVcCXFq9dfMehztvSkK30imXPPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vkPfv6tHqwQP+MdMC7c82HnAW22ZJ7qxNfGeLESBNU=;
 b=MYfnMgaYkuMzo3psLmwOUbDnQhPqZxHzzP5xwNovkklVw8Z0784x8b8aouQxycXqpF+44LbJk9TYOx76cE05TSMI0yHvv8lylkRjU/3YeRSVNvPypQbFqYhEYqMuZBSyo1+38ZZzE9nY9BkG6vBZLPFG6uZIRGbQKM12wenyXlDoxsUFWLioRLmch3/rh80RomltP06uEVXzcugljSJ79AGTg+VxjPX9kmsTto7Sa9I80yrcoeWSFq3rqYnOfsov5zedzDkauLOrLgW9tJ/83JbwFYS/I9/lTvLUvlflkKhioAxr+3ks2MR5oKsbIciY6YVZCxiErKbmvZNaJvUMVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <07144878-5850-d15f-97ba-85b1ec6dc095@suse.com>
Date: Tue, 19 Sep 2023 11:59:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
 <540ae128-a934-8c4c-6fec-e475dd072c3e@suse.com>
 <aa2084eb925ade9caa4e1dfbfb425537@bugseng.com>
 <9b673dec-f391-9948-3ce9-25ddff8c9d7b@suse.com>
 <948c3c6c0b9dff859df58eab419d01f6@bugseng.com>
 <7937ae31-e511-8e41-9cbb-98d8666e66b8@suse.com>
 <alpine.DEB.2.22.394.2309061828360.6458@ubuntu-linux-20-04-desktop>
 <6818e3ac47edca6ba107b8eeff95955a@bugseng.com>
 <a52733a0-ec5a-3b49-ccec-7a7e8e775c4c@suse.com>
 <7d07fc38-14e8-6cc7-2b0c-816bc68c7317@suse.com>
 <3d44b3b0b185418482ab60a693d930a9@bugseng.com>
 <alpine.DEB.2.22.394.2309081236360.6458@ubuntu-linux-20-04-desktop>
 <ed1f468463841e7f3f5bb90de4d9a227@bugseng.com>
 <9c43273a-cf20-73bf-96fb-f3095ce3a122@suse.com>
 <efe4e781aeefb63b9ac3e1ceecb54f97@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <efe4e781aeefb63b9ac3e1ceecb54f97@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9094:EE_
X-MS-Office365-Filtering-Correlation-Id: a8176816-1f71-4700-9ab5-08dbb8f71719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JkqKFviLQA4Ew9ctOrdMPKZn2hCZW/ZslJSur87DOByzi4333SuSZjewr2GMfcz04APodt7HBqnPLktRfKhVUh6pGoXlMK9AwRWAEoW1tEjVjnBp9lyKGQ43B2WKRpCI+7oBEnx6hnQxTUAQ0aU2P6FSGlDYRigl28Cr2gxnTQBAtWu6m4e1XrueicjX4igz5Ya/DbIjp+38gwaf/Xz6gnb1WTHyxwmi5xpmhHjzhMIOaVFoS2OSsLk1Og4tTDed306pQF07JX3htmVCZjls7xHEgiJWWwxwthKivsUuqs0Fsopm9b0PVCRdWZ2RyssRpVlgyVR83RGECClBaKdD/k09q6WW4HDASbaLH47tp8BQdMlWld0A7jhN6uu8L7KOMAho+7vFfwPoQlIOWDippeUJZIN4YI39y6aHZs6ZCtPv1PusYW9p3xR1Q82s76i7wj9JW/knOkrDUt9yNJgC6W7PDrRuz9NxZOrdsD3dWHjPcefepZORFeQYqPeK1yPUUAa1ug1cKfIQo6v67GX8SOfErWmjy0T+PBC/AES5O2TIkUTY5D40uGaJdtlGqPwS0h0bnyqW+PQ3OravdDZB9kjuSF5GjbFZIfFkcFu1DjMQ5Q7X+PhwF5WHvBP7JFNl5lI5ei7ut9wU3ngrxkQ5SA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(396003)(136003)(346002)(1800799009)(186009)(451199024)(316002)(4326008)(54906003)(6916009)(8676002)(8936002)(41300700001)(2616005)(26005)(83380400001)(6512007)(478600001)(36756003)(53546011)(6486002)(6506007)(86362001)(31696002)(38100700002)(66476007)(66946007)(66556008)(31686004)(2906002)(7416002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?KzNicGhtSFpaT0J0bG5qWldoQkJ3WVIyUmRyOXk2OGJHSTVHNUFJMFVxTVhP?=
 =?utf-8?B?elBBakh0VnROQ0xRRmpUNHpnOSt2VzRIWEtEUjV0VFozZzJ0MUR5S0RMVzFa?=
 =?utf-8?B?QmliN2VzbndKM3pMZWFzZXM0ZG5RL3JoL0laZUc0RWxZLzg4NG4yWU1PSWlm?=
 =?utf-8?B?TlZ5cnFKejBKOVNiekUzazdYb1M5eUZGVUMvTis5eStndVROQldMb0gxWTF6?=
 =?utf-8?B?bXVFVDFFbmRHSWpTUER2V1FLM0JCNkpKVlJRNlFoRWZaUDU4TUZ0Q1llRkJx?=
 =?utf-8?B?ZmkrY0ZKWDRYV3Q2TXpEd0J0ek9lYWk5R0ZQQTBuRjJxTkJhazRGUkpEeUN5?=
 =?utf-8?B?Rlo4dDkyOVpXcmFCcThnWDVnWlVhQVhpU2pNZElJSzZiNThzUi93K3BaQU01?=
 =?utf-8?B?MTBaOUxHSk93T2p2bUE1R2ZRQURwU3Y0bENRN1NuSHlXM1BpZzhYdHYwWHZO?=
 =?utf-8?B?NHZtL1NOMlZJRlJkMTJmcDZ1bFF5aHJNU3hWZW5LWmtYNlNuWmlJQ0o5elkv?=
 =?utf-8?B?OVhhTWk2ekdBQVpEYnBUUWZNUUhZY28vQ0lIVnd5T1Q3dGNHS1ZhNWNLb3hN?=
 =?utf-8?B?NDNPYjd4OG16RkF0Rzc0V1ZLSTFXNVdtTkhaclg5MWZkU04yU003RE9TcVp1?=
 =?utf-8?B?YXpBZjZXaitwdTNMeDJIU25vNnFucS9lNXVWOXU5dXVzZ3c4TjZWaFJLWU5R?=
 =?utf-8?B?Y0ptZDlvNnJBbHFiZEVQZVR4UE54SHVlM3lSYUVBblpmaFJQV3RSZ2ltMXdx?=
 =?utf-8?B?M1NNeWhyRGlXSkE4NWNKZTdSUXVkMVZRcm9tZU1vTXVrbVZQTHo2blhpQ0lO?=
 =?utf-8?B?YVBxSkJXMEdCOEVFSXE3cWNPSlJQaHpaSEdIUk9aQmdIeHJXVGN3d3dWVEpk?=
 =?utf-8?B?RnN2YVJ3a0h1dTFaYm5XOXpIc043dUpqVHhzVWFQZXRYSUNOSlBzRzMwb21w?=
 =?utf-8?B?eFdKYWllazBNY1l5TEFyL3lFczhPaWU1QVR1MG1SU1VsV0cwbXR4QnVJMElx?=
 =?utf-8?B?RWVRZ0lESkdNVzJPa3NzZUUvT0FjajduM0xSamVNS3h5U0wvTy9uQzV0ekVE?=
 =?utf-8?B?K0NyRFFDREJ3YWk1Y1VxY0RIcFVvVy8zeXhTWUFIYlpwMGsycGlSRG4wNS9L?=
 =?utf-8?B?Y0k5dXdTOEhNenBESk1tRWR3RWcvSVJHRDk4ZGhueWxUVE5EYVl6anRIczF5?=
 =?utf-8?B?YzJsa0wyQ0I4VVc2TnlIcWd4M1pmdjlzNWRnSFVRRThvQnRxSDl2S2o4VEht?=
 =?utf-8?B?MzUzVVc2RzBzL3R6aTVIU0J5bkJsYUowU1g2aHBQOVdNMlU5T1ExNXBHS08x?=
 =?utf-8?B?WG82V0VDNWpqeHNZMWZ1Zjk2V3dMWkxpZ3AzSU1qd09kVUZJSzg4WnYxNllS?=
 =?utf-8?B?TkxBdThaSWRLaEFZWG1LdEVjWmludW1qRVZodXZhM3BpTDNBM285ZkNBUmpl?=
 =?utf-8?B?SWNSdFd5RllZcjU1Njd2bUoyN3JYWktTTUpZbmdueWlGQXlpMHlXeFM2Qms4?=
 =?utf-8?B?ZnNSdW5CNEFZMkVVTDR5Q2xaQXFkUFNWNHJHL3REMG5jSnFaR21Kd2NCWFBu?=
 =?utf-8?B?TkVXcisvdVhjanlzSmNFaUNCcmlkREZIQnJkZjV6aFQ1RjVubTNOMmUzQmF5?=
 =?utf-8?B?aWZtRHFTRWhHcnZDYkk2RUJDbDlXN1ZZV3RyQ1VuUEZDaU94OGhIVVM4aVNL?=
 =?utf-8?B?UWhRU2xlZnN0Y0x4aXV6OUZsbmh2dGxyRklmc2FkZDFvM3J5VzRMR0F1cVVz?=
 =?utf-8?B?RVlod29hTlVrRWVMYVBGbXpYVStnblB3eW9NMVVMOGpSOVRoT2FOK2VpSVpz?=
 =?utf-8?B?N2dTcUZab3graWNjM0NleGVrN0ZCZWFKOXN3Y3l6SjlOUUtWUUVodjlIVGg3?=
 =?utf-8?B?eEdqM2tzREtlRlNDRXNiREoydnZ3NzdvTHVRMzE1QmdrUUZaVkNvSjdCNlg1?=
 =?utf-8?B?VXl2WWZNSFp6T2VpVkNpWFloTjFHQ3hPTzY4dUxLMEw3aTByV1k5V3BzWkx6?=
 =?utf-8?B?TllRTWV5bEoxKzVqeDVxUGExcGRGb2c3ZnJEVmdmSTJWMjRoTUpMczJzeENR?=
 =?utf-8?B?Z0hOTUVsSzMwNUx3REZSb3ZOczFXVy9NZXVzakJtRnpHYklObmh2bFpKKzJs?=
 =?utf-8?Q?rqnRVNDY+XAuZN1XJ4ZvrHZvY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8176816-1f71-4700-9ab5-08dbb8f71719
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 09:59:18.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CYDSd3YbjZSLGyzYwVXL9dFx7FaSpHj+OSDkZj6uVKtQOWtSkXJbjpVwsX/f30xdxr02x2cg4C6leNjhPOQ5vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9094

On 19.09.2023 11:54, Nicola Vetrini wrote:
> On 19/09/2023 11:33, Jan Beulich wrote:
>> On 19.09.2023 11:19, Nicola Vetrini wrote:
>>> I just noticed one further issue with making BYTES_PER_LONG unsigned, 
>>> in
>>> that causes
>>> several instances of (1U << 3) to appear inside the file
>>> xen/arch/x86/xen.lds
>>> produced by the build, which in turn causes ld to fail on that 'U'.
>>
>> That should be avoidable if _AC() is used in the #define.
>>
> 
> I think all instances on x86 are caused  by
> . = ALIGN(POINTER_ALIGN);
> where, for all arches in xen/arch/<arch>/include/asm/config.h there is
> #define POINTER_ALIGN BYTES_PER_LONG
> 
> $ grep -B 1 -A 1 "1U" xen.lds
>         *(.data.rel.ro.*)
>         . = ALIGN((1U << 3)); __start_vpci_array = .; 
> *(SORT(.data.vpci.*)) __end_vpci_array = .;
>    } :text
> --
>         *(.init.bss.stack_aligned)
>         . = ALIGN((1U << 3));
>         __initdata_cf_clobber_start = .;
> --
>         *(.init.rodata.*)
>         . = ALIGN((1U << 3));
>         __setup_start = .;
> --
>         *(.bss .bss.*)
>         . = ALIGN((1U << 3));
>         __bss_end = .;
> 
> 
> Do you think changing the definition of POINTER_ALIGN will break 
> something?

Why (and in which way) would you mean to change POINTER_ALIGN?

Jan

