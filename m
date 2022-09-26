Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98345E9A8D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 09:38:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411437.654366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocih6-0004u9-OE; Mon, 26 Sep 2022 07:38:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411437.654366; Mon, 26 Sep 2022 07:38:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocih6-0004rT-LI; Mon, 26 Sep 2022 07:38:24 +0000
Received: by outflank-mailman (input) for mailman id 411437;
 Mon, 26 Sep 2022 07:38:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ocih5-0004rN-Se
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 07:38:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 325576e1-3d6e-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 09:38:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8137.eurprd04.prod.outlook.com (2603:10a6:10:244::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 07:38:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::358f:58dc:c0c2:1155%7]) with mapi id 15.20.5654.016; Mon, 26 Sep 2022
 07:38:20 +0000
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
X-Inumbo-ID: 325576e1-3d6e-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mb4DuymP5xSxAyNZouH16gzyZKhvFmTf15jYnuEhQd2IRQs5Ub+l85DVgqSw2IGRaoLJch56tp+33XK2uwv83UgQS/iPl9TGR97JxoLCNzDxxY29v2VIKF9LrfyIfmtmGYietXjuZRz/1E5HbTOdrQDFyThlcqS+8rgRy2IrIdUQGer5L7kp1DjAocXkJcQVQi74o0yo62ZSZjjzX/LoegMRbIV9ELDpc+rEkU3p8gJaiiDaATTKoNTnJXkJK5MxwhMNxXqZNL6OooP2WNcuZLQx8sRb2H5sYIBpHuUauVYXq+mj96B4kfT4mVwOKyGhQz0OKKN8yQc3iNV/pq0qIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+sPYd1N0tcc6nXClerFhbPKDko76+vUqNtqyBEH4eU=;
 b=A5xreRt9WYCrRhca0ztN42GvJBAIJzUCWuadzyFcE6AL8wiklPIU3X4rAX78Cstse9jDL+Rjcr+bQgNL6mwKHVnfGAY6z6jzwae1hyPDG399Svzpo/82T0kP+VMAHbe75e4IlzcB/bVmqkdNy1CIVT59J4y4ovsNZ8cqZ4KzNWMO/75wXZ5niuGldXE5qO8n0jlXEbh5IHE6m6wE7E4Z6F91Kva9rsCPanwDyNT/4BBuaR536n22GIQd2bXqLyb+TMpxp6GmYNxVlSm15ffxeTofJgjtCFjjGi5lTPg/PzBCZvPmVB2hDjBQR2fQT1lJukb9kxcSztuT2Onoynxsmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+sPYd1N0tcc6nXClerFhbPKDko76+vUqNtqyBEH4eU=;
 b=z0JOe/SGcplidqymniDbHExcalBf73HemSaNjl94OfXqpIOvr+aTdRY0rcKWzWkYTcPsdgesitoyxPfI5C+BdgBwTaEHWdhXVBBZhOs2PERAf62pbKn/Oovp9sOGuo/Dbj7PkVLHENJn7yE0/FoCtftpCfZlAgaqqbQpgeVDDG3n2omIPxlHbDJtsIxTxjOL2rv0Zo0ekbrU6cPKOq49uejbK5iz8w55tW8IX55iaNBqtZIPTfWv1nCgQDGPl9rlCcEorybTwrxkCTpQNxu1XE11yFMK2NwvZaDEGSRduaIkd3rIb/KFpBCjUrpcf/n8pRmIU2LP8wSx0SrZw/t4Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <63b9a66f-6ee5-819a-5e37-33eaa8418986@suse.com>
Date: Mon, 26 Sep 2022 09:38:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1663928523.git.rahul.singh@arm.com>
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
 <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5P194CA0007.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:203:8f::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 4930464d-6555-435c-5581-08da9f9215e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9dyPjSk5kBFnQj4FAFEF9nNeUZHF7H/CCEoo6vI19MeSjBxIsChwkEpb/9HoYy5YirUCldoONYNy/d5mKA6hihzgqE1HU/TBsjYZPYhVxVND+4r3kg/3aPm2RKhO+wJhBYUg5wRzBfQmdLqZ3eGZ/CfwztocuPOI997+Ly5awJpnkeEsv032mwQwtLTIj9KvpL40eIkmFgb352MLUSUf+9TyYbK3NMXTeYIV5fHAttw3AN3QCV576pFLGS5a9769YpfNbd36XhrjAhDzujZBzXXqHhFxAsb2bPM0gdGrDv1USmoKDIkmHvFA99JtVQ2xWmsc0jTan5Duc6gVrfOS2E8wYfyQ8g44+5CxSOajTHpC+0f5BHYQhYYTvqizPdeogOvo04Z4+ZQawMJcZPWWauyrdJnqq7VCl75Io/IUEZUN3y45hW76BDNNGwlKU/DRqkY5BK2pw6Jlna90X1dRghtjmxHZtUzxAVbjioQMpXe4rcHdhYOAgHIfiQTes92LdCsGGnAyswgxvjHO6UHqzRkr2ZD3SUlj5dZDV7bRw4yFCWy3o/gHtDNrnqrmyLHdhjtLs8uYNsqtAKbU3c00CFi09XmVnHthkSyh39yA3loJdrseYbzGZU2YS1ajJd2jE0t0w361XQoloXgz6XWr7FMh9sZ4VTjxA4KeVFm+mLNyMH6IAWxY+sj3jjkXgVcL0zR1wNK/bcolXbGsmB3M5LBhkWEyAzVNb9Cf2UtNmT5pT7aHo0JYdQLlxIWNOzC3CM0yyRhfUAPhafEBGexOTsX8cV0dIWLk33EvLV+qY0Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199015)(316002)(6486002)(478600001)(66476007)(4326008)(31686004)(66556008)(66946007)(8676002)(26005)(5660300002)(6512007)(6506007)(8936002)(53546011)(186003)(2616005)(36756003)(2906002)(41300700001)(54906003)(6916009)(31696002)(4744005)(38100700002)(83380400001)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUN4eGJZTVhQQktpb0JEL0d3dEhFLzhKMXRPMG5LRVhxd1JDNk83Ukh1T09u?=
 =?utf-8?B?TXJVeWhQYUJEMVA0LzUxcWw0WHcvaGw3Z0VkMGR3QUFmbjFSTG4weWlkN0RP?=
 =?utf-8?B?dkFTYUlQaWZRdXRqVDdzRU1lOFk1U0M5TzFXTkpOYzl0bXdKYWkwMDhPaHI1?=
 =?utf-8?B?NDR4c3ZESVRpYkFsQU1hU0Z0T3VNZVRZMGdRQ21ZYnh0bE9DbXEvUmo0YnFW?=
 =?utf-8?B?ZFZmU2szd1pjVzFJa1FTRlBCWXZ2UUQ2MVlrUUozNnI1SklsRFVjNzBZOVE3?=
 =?utf-8?B?QmlNVHJGVlFRUkIvVUdYUzg3TzRneFVUVlAvT0x1ZVVBeFZINld4TzVaRzBC?=
 =?utf-8?B?eDIwT0VxV0FCWU5ENXFYMFA0elVLQmJSbVh1RldPVGFMdU1lQkpscEw3LzlI?=
 =?utf-8?B?eWZDaFNsdXhXaVBUNEhkU3NQMzVmR2xkQi9WN0I5M095VEN1cnp6UlFZWU1n?=
 =?utf-8?B?VkN5SlVWQXU0TFZNZW1IKzRVL29BWDV1MzZ2UCs5cUt0V0kyNmlCV0tJK3A2?=
 =?utf-8?B?bHcrRjBlUjU5WUV2emkrdVlFSkI5NXNzK2hOb2hNUS9FODd2Si9ZdW1XRXcr?=
 =?utf-8?B?SjhFbTNuTExLWGdFRlY1dFB3N0d6eDJuRVRVaFI2ODlJMWNvYnkwR3FKdjM5?=
 =?utf-8?B?ZnlBU0NXbHF5dFMxNEpPTklwZUF1QmlpS1dyZHFRQUsyVVVQOUc5YlAzN0dW?=
 =?utf-8?B?bEhtbk9iemZmeE93SzN1WGdWOW1qZ3E3QlNMUk9oelk2YktUNnhEMGplcGRn?=
 =?utf-8?B?YWJDbUJvUkI0UVVJcS9NTEFnQ0l0Ty9lOUd3VU5QcTFPZnNMaHV5U0RiY2dB?=
 =?utf-8?B?WVo3L0JpT2NXaGtBUjlwOFZVbDdCblZubGEvSi9lVU9CODZVWHR4NnRDNVlo?=
 =?utf-8?B?cWw3L3o1K3NYL05tUUVRMEkzd1JpeTNJbWZ6anNxSVlMR3BreTcxakdQU3Ny?=
 =?utf-8?B?WmJHQWV4djdTM3BUZWFENEhQbXNuT0xYSDBoT3ZUanJVMlhMaXR5TU1nQ0V2?=
 =?utf-8?B?OUVxZTlPczJMTlhLcVhpRGNWZUlqMFc1K2EyVHpaVWdJclZXdThNb1A3OElK?=
 =?utf-8?B?MHVYak1KY0FORDIyNWpVU2FCekRNTXNCWnRuRnVWM2N2UENiZTRoRksrbE5j?=
 =?utf-8?B?WCtFZ2tMZHl3OG5MZHoxN1d1L216MUhFeVZiUWxkanpVZWFJV2I0bzNmbGI5?=
 =?utf-8?B?WDdRTnJvTTJLNXptNnN2Q2RVdDJQa0hOTXUveFU5VDdFU0dYTEtaOExOMGtW?=
 =?utf-8?B?V1ZrTVRhN2tCTUZRMTBqUG9LVkVGUG02N0p1QjFwemlpdmVIWGVXOHV6eXps?=
 =?utf-8?B?eWhoMU5qc01TNXlDQlFWUkVUOERwU0RXQWpVV3A3Z0QydEFBb0VGR1VhMVdK?=
 =?utf-8?B?K1ZRR1c5WjROTHhFeTFuZGlsNGtPSWF6Q1h2ZkxoR0JqcjRIeGF0c2dFTmJn?=
 =?utf-8?B?c1NUNWx0SE05Qi9STkM0OXVIV0VnY01hU2tBa3ZNMUd3bkk3THJvakhHS2Q5?=
 =?utf-8?B?VVdXWFhUdm8ra1RTakpUU2RObm9EeE1ZM052L0tEQzg2Ums4MjE2VG9VYTY4?=
 =?utf-8?B?QnR6QW8wWnBJdjBLdnRiS1I3aFhSeDJJY09VOU1YQ24yTS90cXdXbGRIdVFr?=
 =?utf-8?B?NW91VHVuN1dMcE81Y3FGUmlkUVVNUWhVZUZNWHVOVWdFS3R4bkdJZ0ZieFBi?=
 =?utf-8?B?dnd6OFd5UHQwUlAxK3U2cjZta09rdDgxRnd4dHJzTzQ1Z3ZrN2xYNmRhNGpC?=
 =?utf-8?B?bFpFT3dFc1hmL0Ywck1FRU5MQU5ZeklyL3hjQndsaWVpcTVkOTg2L2hMWldC?=
 =?utf-8?B?RHdCUzRVRElNZkpSQmZQUGlvYSs5dXFOSTNMZzg3QWFNd0htVUNMOVpKdzl2?=
 =?utf-8?B?bi9NRndZTHp0QzFTREV5aHZ2VVVuTjZSUUxtcy8rcGx0dG9MakluMmt4YUdi?=
 =?utf-8?B?TVdlNXFkODQxWHlaRlJrZElIekVGWjMwT0RBQTZQUlFyR1Y1L01PcW1mQnd0?=
 =?utf-8?B?ZWIxZlBnQ2RwUkdhTWpGem5zbERmbkdhQjF5UGFoeWFKSStITkNHY1V2S0la?=
 =?utf-8?B?bTNtWkJXa3FBSEZsS29LYjBTNkNzL0hJUDUwZ0E1Mis2Nk5wS0N5VFpFOHl6?=
 =?utf-8?Q?OvtFJTmXcyF4/kok7zWsaRPee?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4930464d-6555-435c-5581-08da9f9215e8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 07:38:20.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvwIhSxjp29KN7+3ehIfXjoDd5tgA9PKRYbRoCrZNmcMs8wmI/rios+rJEzy83tef9Mv6eBneFKlVtvXm4YO5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8137

On 23.09.2022 14:10, Ayan Kumar Halder wrote:
> On 23/09/2022 12:02, Rahul Singh wrote:
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>>           printk(XENLOG_INFO "Xen dom0less mode detected\n");
>>
>>       if ( acpi_disabled )
>> +    {
>>           create_domUs();
>> -
>> -    alloc_static_evtchn();
>> +        alloc_static_evtchn();
> 
> Can the code in alloc_static_evtchn() be guarded with "#ifndef 
> CONFIG_ACPI ... endif" ?

This wouldn't help the issue, but at best code size when !CONFIG_ACPI. When
CONFIG_ACPI=y, acpi_disabled might still be true, and hence the function
may still need skipping. Apart from this I'd also consider it odd to have
a non-ACPI function have such an #ifdef ...

Jan

