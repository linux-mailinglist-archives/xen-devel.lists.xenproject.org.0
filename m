Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6D7839E5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 08:26:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588133.919599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKq8-00023v-VZ; Tue, 22 Aug 2023 06:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588133.919599; Tue, 22 Aug 2023 06:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYKq8-00022L-SF; Tue, 22 Aug 2023 06:26:08 +0000
Received: by outflank-mailman (input) for mailman id 588133;
 Tue, 22 Aug 2023 06:26:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MJFy=EH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qYKq7-00022F-Ds
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 06:26:07 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe12::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5c6be16-40b4-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 08:26:05 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS5PR04MB9769.eurprd04.prod.outlook.com (2603:10a6:20b:679::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 06:26:03 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::9d93:f481:7a9b:345d%5]) with mapi id 15.20.6678.031; Tue, 22 Aug 2023
 06:26:03 +0000
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
X-Inumbo-ID: c5c6be16-40b4-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDh26FaFC3HawwnhrwKKlWzhVX9bQbU/krVtE1zrZwZGGjZKbP1uUlZ02V6jwlfkM9pkJgtUQPi7rkz7/N8roBPyxtyT5B+kyjOKEw/KydKMnLjNw16EuuQzpMsAUeMJLo0V+rj7ZgEn3tF4Wi9BFe9qMhkGXqvtjQQF2VfGl2LV7Nmzi5vfasomy9tZ2zXhl93CDwSzLF/+iX1MpJjE10xiLxCUAUyvOQ6DTrvHSJScd4qtbZj2WwCQ8/ULocT9ZayWou2tMp9o5pVxsFuluBpai30Ib2AYveF7j71hLKRN9IPyCS9YvGDmSrYKulA7C1MRqSGmLXNd9wIMSlUNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fS0wcyaXjA0y9s1h5ERIA6nNU4ghccNYKKrmSC/oBw=;
 b=jmEg/hJiTJX/eGb+y1XJwWnZa5b/rnQQhk06Hqevi+PhyX4rIkhbgSnwtJj81Y1OG8eQCJkGRSrU2CWnxDq1W/fJwzhE1GI+mXPFP+xi1L43sqAcJLLvNGz5ZdI+SDGak8T3Fm3n824Y6APmPwzITcWv3pKNKFxi3T09SbHmLHKGRTHuAeVxMSTcGRbRij2299yQYAzuON6Ujf2PYKQ9JMt4eUMoiBG/SSW2MLB7F7xhAR3Qvvc6dTPrW6aThOSgKUWB9bEDwYotSZzWHsQ1vpg3BP+BQxftSo8GSq6GZCPMZt1H+/DO+PAEOTV14r9cv6P+GprZe2fajvekX2s0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3fS0wcyaXjA0y9s1h5ERIA6nNU4ghccNYKKrmSC/oBw=;
 b=FzdXbHcIDRQ3fAr3du63VEdQrmM65c47eb/SkvjbyAnWhXOfqGV1059C9FV+pZhtaXRpp29C/D2Us+Qo6IDMovHU1gzslZult1D7VBEDSIr1jwERpsrY9UOddtbL959pkeQBe4lnaa4Zb40Fgh2sW2i+kM27BqZAsjtj0YvXtm0taNOEgbKbJuemT8iuZOGi4lD84KQspXVq26/QK5e32EZqBrN7n2Mo5cGYxsnDMhrrfmzKtksz9xWoEi9UGXeZkfaP8wLCo8Ec8qNHgLvXTQlv6QNKBjUOQZ06XmXCutloDGNxzR83m494NwA2bOTOz2uxbaYbLb4XF4+yhZAvxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1fc9f792-142a-3868-57e8-e84e0858cf62@suse.com>
Date: Tue, 22 Aug 2023 08:26:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 1/4] xen/pci: address a violation of MISRA C:2012 Rule
 8.3
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230822012955.312930-1-stewart.hildebrand@amd.com>
 <20230822012955.312930-2-stewart.hildebrand@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230822012955.312930-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0069.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::10) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS5PR04MB9769:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b0a99b-844b-4f4c-7f0e-08dba2d8a908
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V9r8VON6zBDpj+Iea2QCYMgHfRdLsAJ+bobwM1hZ3GF7y8ovSSFkxACAOs2Em3puyh5F3bHc09anXRDnlionf6EFi99a3UV4i5b3wLvLpd92R2EBKbSNYoZaWNwapT/x31hUA8cTyfzNif7xPNDH8A/Q9NXLqAhelxSar1h1Ifoc6pFg1uY2rCSS/TOkes/G1/M8mavuWblPj8IATYl0JmqdzCj0ZCErIoD9v/u5zjLwz8gdrGBM6EKRC2295tl9mQS2J3oA8uqyotZbwZfReh3G7ACC7gla9iq+nc83W3WO9tpG73LkFS/kEu5x9DGjxco03vVDPPoqL16IO6tQafhnIYyOKzHsKek15K6bk70Xb/oVjZ6ZshjJ9Ezf05MmO8GdsOXnzAYuinh2qZ7foVQ29+v5I9L9avUS5FTP36BQ4G2vIOVa19+SQoVFS1LjTRhH4XjDv8JoF2l0YE+p3wsv+dRnUkmOVy+qqsqM6zDhJTducDQr7cyj5eC54IwNJMD5SvU2Vo4FgoJr/ykhrjX56QTYgoklAptbaqaU5lcuIuy0ntXPDB55CWKPEpzFqU3NoQQfXKpmaDvwcrj93ySDIfJL6BiqE6lGgJT6Ze/KdgzqKxC8RtNorMsBg58cXCn8VuYlQmIHiMyeQxtIpQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(366004)(346002)(376002)(186009)(1800799009)(451199024)(54906003)(6916009)(66476007)(66556008)(316002)(6512007)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(38100700002)(53546011)(6506007)(6486002)(558084003)(2906002)(86362001)(31686004)(31696002)(5660300002)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MC9LZDM0Uk9sd0ZrUkd2TUtpdWVVTFlvNmR4azBWOVFGR01EMy9Kc3Q5dWNk?=
 =?utf-8?B?ZmlqL0FtSWhOcU13b1NBVW80TkYyODh6QStXQm9IQmRFQTdFWVcyWkZ4TTFP?=
 =?utf-8?B?L2dIRGJzNy81N2JZRGRVMkxJcWJ3T1hGb0NBOXhtNDUzSCtkZkhPR0o1U2JO?=
 =?utf-8?B?MlB4ZVVoaDZaaCttakdGakxxYTc1MGJhTmhnV1RZcmNQRkVEL2NoeVF6VlVn?=
 =?utf-8?B?SVVFdyt5bDRGeXErZzJKcmVTVmxPcExaeWdRdUxuem1LMjhRQnNxdDBFbWR0?=
 =?utf-8?B?cEROM2lkRHhFc2pHUTZWNUNkYlluZ0ZDeXF2T3ZqT3ZCUDYxZ08rMUUyOVNw?=
 =?utf-8?B?anZJQXRQUkp4Z1dzOHlnVmkvaTk2SGxPTzJvbTZDT2VwYUFjN2lOWUJYK2dT?=
 =?utf-8?B?N1pjQ1J0Wnd4N09EWW10YkpObCsrcnoxL1YzcmFTMWlycG0yUUZ1WVdOdHlr?=
 =?utf-8?B?Q2pBakJweE5neE95a2o1bHhGYkFCdFl0QnE4MXg1bEkya0E1TW9rRkk2OHRN?=
 =?utf-8?B?cXN2Qm9OVmtmL1RvUVRiVXdROXkxZmp2NTZtRFRqekY3UFBFNU9qTmlOWHBD?=
 =?utf-8?B?Nmo0Vmp5SDlqbEFyUFNpYUpLYklTVWJTd3VTeTVKbFZ2WVkvWkN5MmFzd2g4?=
 =?utf-8?B?ZldRa2M3N0trZy9EbDBqTytmeHZObUV4eWlzRFp1bUR5bGs5SjZUengxOFR6?=
 =?utf-8?B?aW80UWpTM2c3TXVVVktwQnEzNzQvQlEvNFdKVkZXaGdQWlIvZDk0bSs5d3R6?=
 =?utf-8?B?bGVRcnNwYXFDNHpxT21UbVJLaGF0eTdqc3B3MVpvWDAwNzA5ZG1QSEVDMjYw?=
 =?utf-8?B?OXhIOEpITmpwNEdQa2FYZStaQkNMM05JRnR3ZzV1QmwyYm1WYm9TdmY2bEJr?=
 =?utf-8?B?cHhWN05mNVkyZ0VNMWZPd1JIWEJxbWFPejdoYnIyOTVaVERmNTFKZ2dHcU9a?=
 =?utf-8?B?MzlOeHB5WDNHWHlEOC9wYWVwclFFbmY5aUFyNlltR2Q2bE5yUlJwUDNrczNh?=
 =?utf-8?B?YllYZngvbFAya1pUSHBmaGlKVGVhZXcwZm5pWG1mUGlLaWZRd3M3S2c4amIy?=
 =?utf-8?B?VERsMit2VmdlNDduMm0yZk9HSzEwOUZLRThJWGQ1UjdUcTlyYVFlVUl2aWlB?=
 =?utf-8?B?SXF5RnByZjgwbWVZS2NVUHc1TzVUS1dKR2pMcW00SDIvVzhWbXZFQ0I4R09k?=
 =?utf-8?B?ck9zb3ZWR253amZEMXVpODZCbWhYMkFNVmlQL0FIT0c4NHpBZjJOZEpOQXhK?=
 =?utf-8?B?emMwYng3RHVVemhwV1NQeEtRZ1NJZERHTDIvMTNPYWkva3JPNFVtM3hzMnFU?=
 =?utf-8?B?Q1Y0dVpZbE53ZmtmUENpT0lsaG5PcEwwOUNpNkRiMDBuRkpDZWRneVc4UzhE?=
 =?utf-8?B?TE9WSlZYL29Vam9QZlFYQnhxNkRJT29GRVVVcjhhY241bmtqY3pDdElLWHBL?=
 =?utf-8?B?RzdEMXlhQkV6YzJMMkpKSjdIMVlFeE5RV3RQOFErcmY3YkFod2lWYUlZelFO?=
 =?utf-8?B?VmNENHhlbWp5dkpCV3NYTDQ1OWpBN1lYeHVDSERYRnpRRHFmUHVVa0lZUWFz?=
 =?utf-8?B?Wmt6aWRwTkVYUG5Vd0dwcElKcWxONmtmclhDaklKZXhLVFlvdEpjY2NVc2Ez?=
 =?utf-8?B?bXB0blZaV1dFdlZzM0pwRkNMZmViUWUyV21KUXlaMjQwdDJaOGkvcVgwNy93?=
 =?utf-8?B?K05lOVVJRy91TUZ1a3BRR1YvWjVTbnl5Zk5KSjJUR2JoOVZFVndtRmJTV3dt?=
 =?utf-8?B?NXZCdGQ3VjhPT0hxcE56bTdWQzIvQUlDYlJReUxFVXRSdXdndkNMZjFiZ083?=
 =?utf-8?B?SERvWklTaUVDZXROUDFnMjZTSjY5L2VTd2RLUzU2TzZQUHJ5cUhIeXFQZGdJ?=
 =?utf-8?B?bmw2NUtoak1sMWhRY29KMVpuNFZ0ai9TaWFnWkFmOEdQMC9VYm5kN2FUZU1j?=
 =?utf-8?B?N1kwRWR5UDhOejI2TFJYODdJQ2ZvbExzc2w2eHpMVFVkZGxTYUp3ZjJQalRk?=
 =?utf-8?B?MXBKaTgyZ3B1RXozek5GN0Q0NERoOEVBRlV3OWl4a3Z4dk1HMElEZDN3Tm5m?=
 =?utf-8?B?MGlRdjNMV2JHNTViTDR0eExUc3RsYVBtTktZbHR3Qi9XOFIxRWJ3elgwZkFu?=
 =?utf-8?Q?1gkBgcLHHYEydH1TKnkBBwe5q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b0a99b-844b-4f4c-7f0e-08dba2d8a908
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 06:26:03.6804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T54Wo3VjKmj27Rc0JwGt+6KWljSN1FcvJnpNDqAKaU76RHC/M6swTPx0bjFUb8l5UfWRuCbj/9ffxra416+roA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9769

On 22.08.2023 03:29, Stewart Hildebrand wrote:
> Make the paramater names of the prototype match the definition. No functional
> change.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



