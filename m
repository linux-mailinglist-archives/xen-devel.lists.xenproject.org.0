Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ACF6C0C87
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511772.790999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBCj-0005r6-Ui; Mon, 20 Mar 2023 08:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511772.790999; Mon, 20 Mar 2023 08:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBCj-0005op-Ri; Mon, 20 Mar 2023 08:49:21 +0000
Received: by outflank-mailman (input) for mailman id 511772;
 Mon, 20 Mar 2023 08:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peBCi-0005oj-H4
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:49:20 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe12::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 197ac036-c6fc-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 09:49:18 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:49:15 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 08:49:11 +0000
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
X-Inumbo-ID: 197ac036-c6fc-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ek2ZqjFB2bVEYgPKrMmerTMld0DC5eENy2nuF2d662U9NmXZdHlY0xF59NEJ+pB8DEI+eNkb+NR4OWmariC7G2YrzyVx0Nll0UAAMMDJxpE8xkD9Cr15026g9BSUtX3gMZz8A+l4lZx/DD1gywFFvw7gHW/JoZaf/ttMam4m5EM5v+XlrAJeVlLfrzxbrADBxSf3a7OpEe9J5bRghb6QeOsYH1f28bOh9K0GQbSti1FWGDCsIPDZ4LsTV2FduKSWZlO6MzXAfhw+7t9Rw7fnTT4rjYKccyZYlRwWGucd0LgDPk90PDX1U8v2SLBNyuAw9Z1K3GZB0zjhopDxdOPjow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0qnECW3otFciX8FziyxkerSqu9QxmtNbM1VXdB8croM=;
 b=moUZSDEU+IAmt73Z03SvERabQq22JBYMaT1g8OFcFF4inmdmakxydb/1JJzJOS1I6bM9Ir5040FPd63F3Low1ew40MtMBa/tPevshbgv6GSKUIw3AXcoFEuXXXWhRmCp9nUqtRrKaYdlZbFcweuDv6wKVhhM7vM/JX2+8tHQe9SjbiWA6ltyv2tCfmO3c/Qmu2uRJMX+qIM0td4aMfj8pumEn6crbZZ+i4bDGnJsPGgUHBID/4rzOZWaPita8PNWhnyqbBoz9ZMSooXBoplmFt23CLlUhebwdMfFtj8zvAcoD1kkvRNLzz7oAqGu7HjCS+apeVTgoSFxOHd5lCKNWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0qnECW3otFciX8FziyxkerSqu9QxmtNbM1VXdB8croM=;
 b=Vp7zqR9Dtxv38gChzXUMqiIeTGLzyDq7fam/ZhUNOFTgQx2L20Y1q9fVgA1BhhPmCr3ZVeGdbODMKwPr/Cba6MJ/JnvYrY3bxg37i43twYjWO42rJlWdVBuw4vcSW1TU/dFfeNqkg0PMJAYT1pothOBccK4R9e6UlEQ/GHyzL5u9eYBlnJ+jKswYMxbwoWNTIq1rlkdMU35yksNq+hhIu2azJtnH0Xorx9Jgn0TYfINCdPdqtiFYHpkLbaG5Q+AUGt/4z8bOR4fY1Q/dyzxEIL6E2ps4lEQ7ur6grDdZQw79mfaHamBO0ffk4jP9JKgCZ9d/b+nboJc3j0TDdBJsyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50badf48-a0d0-8141-f409-42bf339bec36@suse.com>
Date: Mon, 20 Mar 2023 09:49:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] x86/APIC: include full string with
 error_interrupt() error messages
Content-Language: en-US
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1679084101.git.ehem+xen@m5p.com>
 <b03e331fc242b4c46e2adab124c7657bc3bb1340.1679084101.git.ehem+xen@m5p.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b03e331fc242b4c46e2adab124c7657bc3bb1340.1679084101.git.ehem+xen@m5p.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 771bd705-6fd6-414c-e809-08db291ff9a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BtHMcSE0UBFyyKulBwhhs4hRISJDf7UYFT9oDU1mXV/wWAgv4UFCvkwRPVzEShBy4rRnr/t3fyb+M1YbOrJOk5GPmj9w8aHgucbqofMxqIaacpCEi/K5veoeNopE7TT1vBLoTqTvr7WiRkvtEgI9H+qTQDfUWKC5JbvHpghXLER2vp3grXOrS489HFyTpcr1FzUdlZzaMzUt8B8wPdKq9puxpHmriEjhVJJgpo6h7KWP4tGCNswcK82Dn8A5rVD2O5NBBOc2RheZo/T6GJEEpkQSGg7V6FNlpmWfRkTWdV1ff34cVY0itYHhZpEL4lTAIoXDuYqwTn6oJf4eaPnO7+D2VPmncbKQ1dfs+4nIyHfY1SYGeYWfGCaCt9TZhvy3K9dBS1tY5Qohii2UmfiBVyGcV54LxDe+QUHHLTxuY97KrOKojqWdZlwbdTQIPo0PrskBslHCfMqOVwHd9xluje6gmARg/jP4KzXmNecsbfWonvhl//ez44YFQu/eRKry5TyeTPEJRCJihjE7r/Bx9Q7Lojpv4MCJGbxOhNzbwqoV9fnBHzaXL2B+AddzHurI0VbjoB46nMS3EK/b5/js2R5PZwgIDQgbiM0qw0HI2AE/2elhryIT96lriDs4xcjx+0JhMMJoZjIYg8nsPejww1EdRY55mLEwvb0O2v4WrAnraMZni6bB/SP/vuEtsz5jadfjH7xkvUqh3kqODmtXahj9aQ+qLDTUr2Wyw/upiQw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199018)(6486002)(31686004)(5660300002)(26005)(6512007)(6506007)(53546011)(478600001)(316002)(31696002)(54906003)(2616005)(186003)(86362001)(8676002)(4326008)(38100700002)(66556008)(66476007)(66946007)(41300700001)(8936002)(4744005)(36756003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlBOTXVYTVlwS3h2bW9ybkNnMHZGb0dLSmNkQkNJbDkwcE1vNmVGaG54b2tx?=
 =?utf-8?B?c1EyRlhpMklhRmU2Mi9uamFPRXZKTDhrU0ZVcTF1SXVRSldDNEUyT2ZRREhD?=
 =?utf-8?B?YXpBSWRWVHZwbkh4YnBkTGhrTlAxTENvMGVEdWZDRXpwY2lPS0hXWkY0RENv?=
 =?utf-8?B?TUNZL2ZYSVNPay9EWWFUZWl1cElxc3hmeWxNOVRWMlhGSnhQZCtBajQ1YzVl?=
 =?utf-8?B?WWdPelFzVFN4RERidFlJR2J6M0xhckNIelUvTEprQ2g0ajRvdkpmamtqYzdm?=
 =?utf-8?B?VlVLTXVzTi9Da3VmbE95c0hzSkhuZ3ZVQXJGMXdFNlo4MHdBMVdGaTBNMU5i?=
 =?utf-8?B?dUM4ZHo5c3lRNHZZTWxSTWtISzlBU2grWTAyckhIb0NxaUl5TUluV0NKdmhN?=
 =?utf-8?B?cm5sblRPSHJndThkRFhOdC9lajU3Wng3SGNQWHYzaTZVeDFya1cwcEpEeUlU?=
 =?utf-8?B?anloRStnaHpxc2RzSlR5WWlVV2FnMy9CaE04Wkg2V3M5aUlHR2MyemlacnJx?=
 =?utf-8?B?OCtreFo3YnNHUU9TV3Z1TllIUS9KYTdnY3czdjlVQUJUM0sxQzhhM21zcVl3?=
 =?utf-8?B?WWNreVpQdzFieWhmUkNTZElFbHdLYllIN3cweDFNbElkVmRiQk9QRUc4Ullu?=
 =?utf-8?B?cWJGWEpGY3NPNUkza29HL040aHUxam9yT0l5SlpLRGc4STZOd005NlQvZ2dR?=
 =?utf-8?B?dXNqUWY5bGFNZDFjbHFWOGJ5TXpHVEdNb05WN2prYWdsQmlMQVgwVXlOYXQ2?=
 =?utf-8?B?VjdwZDhnbWh6dkZqdUYvMDN4K3J3UmdmdlkzMWc3Y2ZWdUt3cGVTaDNTcy9E?=
 =?utf-8?B?bVRJaEJZb0R1eVU1aC9YSXlBZUdJRERXMFhxUU9NUzdnU2VtY0ExWWxvaUUv?=
 =?utf-8?B?YlVLUnVHYXAvSUN6cTYzOWF0SHR5Zm9peGFuWUN1MGxZM20vcldqa3hjYVhJ?=
 =?utf-8?B?UFFLQXlmQ2cwT0ZlVDVHQXZaQWVIOXJLV081SEIxZVF4WXVhZmxJWDRVK010?=
 =?utf-8?B?UmlndzEvRTdIRm40QzJCcWlnYlI4WjRrVjQ4Zitiai91SXk2aHg3cjlzc1Fv?=
 =?utf-8?B?TWZTczE4a1BlVDkwSllEREZ2ZDk1VHI4czB3ZlJQMVFSUXFab0FuTDNJVTZE?=
 =?utf-8?B?ZmpiTlNxa2pmZk9XNkZJbXZvbE5WRmZFeVl4Zzd6bmJVTk9aUjZZaFlYa3d3?=
 =?utf-8?B?WGo1R1Jab3QxeWpkTU9OcE1tbU1yeCtFR0tTQk5Nbjd5SnViOWtjTzlvKzhq?=
 =?utf-8?B?TFdxaytKeGErNmxHWmN3NkpkaVh1b0tUVFFTdU85dXM3Q3FmNWNFSUgyVmZR?=
 =?utf-8?B?a1VmYVZRVDVlVmMvM0plVTJpR1lxVkNPa0ZTVTRIVUhxczlJZXpXQVphayty?=
 =?utf-8?B?RlBwVW8wTlU1V3BUNHdGdE9sM281c1VpeGtoRTRYS1czQ3Q4TUhhVGg0eHhN?=
 =?utf-8?B?VVdFVVRwWTcyWWJLU3VGdXU0MEJXRENzK0lEQXVBTHNUVDFnci9PdXlYekM1?=
 =?utf-8?B?V2NoNUlrbjNtWnVXQ0ptamhmamZGa0RtdjVCVjMxR1VUY1RTR0lhUGF0N1JH?=
 =?utf-8?B?Y2hPUzJaUFBBK1VkOC9GcnZKY1E0d0xPYjJOcU1iUkZRbW9PeC83WVRRTzR0?=
 =?utf-8?B?UUphT3EzOWJiMDJGOGhSTFFLS09YZmgzR0VMTVhNWmwveVdHME9GU25OVG53?=
 =?utf-8?B?dVprcUp4YnM2YkRaYUNvMjFGeUFnaEg5M21ITXBRVG1rU1g2SENmZTk1M1Jj?=
 =?utf-8?B?U2pqRFJHeEp6akpYRkFaV1BxK2cyNFRzUHVDZjRMaTIvNzBFNDJYMDdIVm53?=
 =?utf-8?B?R2NVRGRXNlJhYnRDc3ByUFN4cTcxZEhFOE1EellveFNPc1FnNXUrNGFqQ3B6?=
 =?utf-8?B?UGxXWUovMEo1RGtvS24vbjZ4QU9mM0dkZkQ2dGN6ZXVNeHF5NVpNYU45MU9R?=
 =?utf-8?B?TVpDSzJqMUpHT3p0aHVqU1ZZeVN6TVZjOVJrZi9kRkJaeXZGNEY0RElmTUp0?=
 =?utf-8?B?UTlIRlpZZlVJTXFLOEZUY0RmbkpFWGVhY3ZGK2FWRDg5dDRBQng4SFZyYWZw?=
 =?utf-8?B?U2VCSDUzWk1RVWlGdnJEL0I2Z0k5T3k5UzBlWVh6TFRrNlBkbE9LR1Q4QXNn?=
 =?utf-8?Q?6hggU5FMyALyZVdjUtfeRLbKS?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771bd705-6fd6-414c-e809-08db291ff9a7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:49:11.5125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcsJkMuXTTX+5BriykMs3XfyvfJIQ628UAThuBS/yzfDuQnOdMrtfO4FCdAy9leCAnDl8B27frxdIJWeFLV5JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9498

On 17.03.2023 20:45, Elliott Mitchell wrote:
> Rather than adding ", " with each printf(), simply include them in the
> string initially.

Why is this better? You're now using more space in .rodata. (I haven't
looked at patch 2 yet to see whether there's a possible reason there
for the change here, but if there was it would need saying here.)

Jan

