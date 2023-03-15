Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2056BAC23
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 10:28:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509995.786853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNQV-0007Fs-AT; Wed, 15 Mar 2023 09:28:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509995.786853; Wed, 15 Mar 2023 09:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcNQV-0007Ck-7g; Wed, 15 Mar 2023 09:28:07 +0000
Received: by outflank-mailman (input) for mailman id 509995;
 Wed, 15 Mar 2023 09:28:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MLe6=7H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcNQT-0007Ce-Kn
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 09:28:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af50492c-c313-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 10:28:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8826.eurprd04.prod.outlook.com (2603:10a6:20b:409::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 09:28:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 09:28:01 +0000
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
X-Inumbo-ID: af50492c-c313-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lirrlNmoCsQ2blAeGu8ioUg8dXe/c5qcok1VsTcAlpZYrmTq/hZg9/FMpHpFFu8bige6e5tsLt3xqFq6ILIdGUDxUt0LQxVn6euGsMCoG0ZVw4J6u6Dl3nkiglXkbxszEy6VzA9CRe4jooyCruao3fI8j4ix91bJyuRw1zSLvqtin0kb6e4daNQSNhBcB83r7wOdJrpvDE7sin2uOy+LWIWJVEdKdcZgaeUdTeVJYj0iJbQoSRVT6OsxFrbs4HFsRwBl0eoSbgHdMIBjQr4qybqJ3lcj8qhe06SYEyvyANgXTGY+CXYqXiB7+BJBLtdr31gH2qywQhRQOy8BbnSCoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2Ucg/+mQcDQ4ZiVLFmbIT0n/29YpY/asPhDnanPAmc=;
 b=Ng2LhteRfp3JUERZVyZ75q0h28ElFbjg3oUXvtCyCtYmOOdAc62LLFSXIyYnoKQMlFTrpk1kwOlV4v5lHpgVf43x4lDZEfa0zNV0weKMfwRg73CT+3dItDabXEwgKvkio8OWdTF67vA1t2e+AILuZK+kzK3sLWznGlAq4kRbY7SvpcF02brE5SAv9FNqd0oiQvdZQv+Mou/d67DL8WLm/W6gZJoEqN47i7Aae6LWPW2TlzXqFx3H2XQjHGQEXc0qui3m6fBbP9mvmbF7lGfQYHokZntsAt2EcLMTjQRfE9GMkXBjPjIefr1Oxt89N+WQn4gpi4fGeE8o+3hft5WhIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2Ucg/+mQcDQ4ZiVLFmbIT0n/29YpY/asPhDnanPAmc=;
 b=WXJ56j1hu3zwQVUN8cyVuNFaY98Ah+qxM34HV0c7Hl73wJY7347ifveN6zHVe/eJ7YuTXQTTHOXbITzereKcGGVh7zFYXFybXOk66TCwyTs8H/EwlcmzgRlb8SkTzx8b5CuN4VLaUdOpgGJGupkxKxfRVilomVuWSJuxl+eDzMcXJhxLcnnwu1LqAtvvDNqUo0OYT9Xn6Ze7++yGEoPYAPkIRN0zlgAars//sWeTsqbVubR+cFnzjpKlZEttGYNr+vFGA73YYXevRvXj2GoqD1AInkJvCIbZlp7ma/NqxyptBmkF9Vpjj+8CihbC1F21juD2ZzXr6glpy5SMH9sDPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a8dabea2-0903-6d3c-350f-127dd9f726ca@suse.com>
Date: Wed, 15 Mar 2023 10:27:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 02/10] xen/arm: add sve_vl_bits field to domain
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230315090558.731029-1-luca.fancellu@arm.com>
 <20230315090558.731029-3-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230315090558.731029-3-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0037.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: c328c8be-824d-4a7f-1b2e-08db25379270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TRjOPASTaVvA8FghtpcZZi1U5h0AUsztGj0JtEAjExW8Mb1xwb+4GjMHt3oXX5r3kGeu2OyYgMwXKBKyW8gVOi74f5h0YH6I51NzohsqJvB84Yplv4BHWQ18eiaxTOtHHF6iSil3QYaIn6qRUrfwxUvOXQuz1/+kxoJ2vDIUu7oCbY4g7HDFQvMdsvF5oRIp5BKlNslNBk3l4X8QAaYZfkRsDuvICnTOe+JQgzgscHMGCnWt8OwXOka/iwqdRY5xCKSIhI46p9jUDp9N/1d+frr3t4WhCIO0tTpsZx2bFMEKxn78/4MZ6DTF7hKOETa2RQSBkJOASZtrN/CG3jnLPR6CteI37Uo9FBJ1Phbv8HvBsH2jj8dPDQ4/CTY/CEd/VmTIbp5SM3nC2U9DEdHkdEAXT4CY9AH+Co1XCadVzYvS0ePSrZYI6FypFswwi4cXDjZT2A6AXLkK7sKl6pe/HH3gd4BwQOEIc87ldKFxaW5x4s1YJ4CgP2C3wfWdwcVXtxHNIsFhU0y+zjoRRv7qllPS5yEzUXSr+0FH7zRn4Zz2bHnkji4neiEyWo4kf38JkXhhYCCJm/j3GI0/ftGl1ZQciVNggB6DtvAjtTmMFbVvQHSnumdSrB21g9oTmajmphvdElDH6qFfuz8Px9UaLOgZ2S+WnKIGDtgmAuo6KXAjqZe4KjQAq7+oIaR89lkdKF85i8xR+Dnd1KydhCZm/stM3w/FKfZ5KD3U4EhywBo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199018)(36756003)(316002)(54906003)(478600001)(6486002)(5660300002)(7416002)(2906002)(8936002)(66476007)(4744005)(4326008)(66946007)(6916009)(66556008)(8676002)(41300700001)(86362001)(31696002)(38100700002)(186003)(2616005)(6506007)(26005)(6512007)(53546011)(6666004)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWxwZDZaalA5aHIvVVZtMFN1V3F5TEQvTUE4VkZybDBkSEtzT29Ec09tTkRH?=
 =?utf-8?B?TmZGSEc3ZG5keXpEYWdGbUhCU0psMHlDZU1pYXFUSmhvMlFZeGV3d0p6ZFV2?=
 =?utf-8?B?UGVUNFhNT0hYVFZqcnlaNDlBamNBVmh1dFBoc1Y0NTA3VVdlK0RCa2Z4RGlK?=
 =?utf-8?B?bGlKTnpvL0wxZXAycll6dSt2UW1udnRTVzlyZU92OCtOV3duQTBZNGlMOHoy?=
 =?utf-8?B?RjZBMWZvalVrVDhneXVTdlliSlNZWkNwc2FtdXNkcEo0a2ZGTnd3RGQrS1Bq?=
 =?utf-8?B?cStlODc2aVZVUW13Y1cwSDZpY0hXcVJWK2Z6MVUybUlRYVpzYTNwYXgzdCtz?=
 =?utf-8?B?OGU0RkVDaXlCTHJYNlNMSWR2djNvSDdsVjc4NVVHTHMzaytCa0RoOEdlOFVL?=
 =?utf-8?B?eWRkd2dJUVZzemNyYkxFd2RqTGtwR20rTnh4Z0h6UHZuNlFneitvcFZWTGl0?=
 =?utf-8?B?UXI1aElWclJEVXFDZFVZNUxuclQrVEd4QXpyWFR5RVB1ZDN6ZXhOaFRzTXlk?=
 =?utf-8?B?aitSN0l0M0FYYVNNVlJ1cU9nZ1ZTSHRRQVBadThhbWk4VjJUV2F6cXl6T1Fp?=
 =?utf-8?B?cENjN3JQTElIVDZuRXRLZnpQeGtycGk1bm1RK2lBYUNWL1FBN3pKUlFaT1hT?=
 =?utf-8?B?VE1LSEFMc0kzU2swK3F6bFRlUndCQ0Y3NHJ4NVZkNEF2ZEN1ajRFbEdtOFpj?=
 =?utf-8?B?YjhkOGxoMUs0Q0U3dWRCYUQ4QkVyY3hPa3I3NlJkT01ZN0RRUUpJSzlFTlEw?=
 =?utf-8?B?aXVwZXYwLzBMTmMrenlpdU9wSFBodGhQT0FUZHZKbTRCY0lkb1h5M1ZVbkxM?=
 =?utf-8?B?QWt6T2daM21TemJIRDhnNnZZb2lMelppbndtdjFQb3NpL2tJdDM5NXVMWkJr?=
 =?utf-8?B?MmxMbTdlSXEzdExGcGdQSEJjakRPVE9LZENzK05YYWFKaHk4UjUrVU04bVlt?=
 =?utf-8?B?Y0puelFRWDQ4M0plNDA0bTdOWkU2UWJUUWduRXFvNEp2dmVpb3BjOXVhZ1Fy?=
 =?utf-8?B?eTVIRXFnU09YRTVBOVhNcXM1UzArNHluZnVITWVWY3FRVjhFd3hza1RYclJj?=
 =?utf-8?B?bGZEV0FMa29yZWlPRjZ1d05uMDNWNnl3dXdnczRFbVJVQ0tCMG1WdHNBNU1k?=
 =?utf-8?B?SU8wdUtVVHEwOWRRd3ZGdVFCZlZPYXloU1h2ZmFlK2s2T2FwNE5qNndDY2k3?=
 =?utf-8?B?VDEvWkF2VGh2emhuSVlaYWdGajM3bjZSUlc5S1JOMzhmMnl1dkc4eXpxRjEy?=
 =?utf-8?B?ZnZqcENYcUlWdFQxWlZpdjlsR3h6SlRLdmdHQlBVL0ZTODkvMlRGWlB4bGhy?=
 =?utf-8?B?WTNjQzF0QW1ndGgrejNpMEtCUDNqcVBhSlkyN1JwNURVWGVzRTBhSURjYUYx?=
 =?utf-8?B?cU1DVDQzbS9LK1lSZkdQd3ZJRmkxRlM4MFhGdUkyNmlkcHd4d08xaEx1dEJ5?=
 =?utf-8?B?R1d4Sy9vdGJzQXRZYW1IblE3dy9GaGRkMEtWcEJ1NFdKaFNWOHJKTWU1WS9I?=
 =?utf-8?B?RXp6WkZFMExzM0xSQXF3QUJJbUVFNVZzWG1ubmdyS052ZXBNamYvV0JCNWJK?=
 =?utf-8?B?cXcxUnppOXdSWHduK0k2UUdjTlpDWlJoWlpzSUtHOVk5Ym4rU0hMZlpFWVF3?=
 =?utf-8?B?amVmTDJhbUJGd3lVQVJncTZKUkJDZVVqZG8vM1BnSUdIcDhEVENockc4UWo4?=
 =?utf-8?B?Sm9FNlZHZHpiQnZRTitkTlVnYVdDK2xuRGRReUxQUndlTzM3NXdzd1pyak9i?=
 =?utf-8?B?c09GM0hwZFc1cWFvZ0hpV1UxMFB0b0NYYmdjYkdzVHRuc3lkWXFhRS9VWWIx?=
 =?utf-8?B?NEdyaUtFcWVzTkxLUDBvZWpsdVJ5bGRQSWpRenIxS3ZpMDR2T05LZEhsWlNF?=
 =?utf-8?B?ajFUTnovREhTSk5wb01LaDV3b3hrWkNCRGdCYlc3eUVlNndsMFVSbFR5Umpu?=
 =?utf-8?B?Q3d3V2IxcUpqR3YzOUtSeVBPZEo2eXRENGx0N1Z1UlpFaUh0b09RVjRzVUZx?=
 =?utf-8?B?bDk2dmhNVWZkTTRLcDFTQytBcmd4NnFDck9OUGFVY1R4VC95TDRLMk5UZTRm?=
 =?utf-8?B?WitPc3NYdDhFNXRZS21hbHdYMm1hdkh3WlcrYnhVbUNBK2VjemZhRVdRQkJo?=
 =?utf-8?Q?svJTMjwSLGyN5T/Baqw1B4frC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c328c8be-824d-4a7f-1b2e-08db25379270
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 09:28:01.5181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phhtYcz12Ze6RLDaE1wJv7D0W3xWgS4GVLTPW4U7OxQdD5NedCrYRbpBE66YnbIgC5d1WF8uZkCAqKV+iLSrIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8826

On 15.03.2023 10:05, Luca Fancellu wrote:
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -304,6 +304,9 @@ struct xen_arch_domainconfig {
>      uint16_t tee_type;
>      /* IN */
>      uint32_t nr_spis;
> +    /* IN */
> +    uint16_t sve_vl_bits;
> +    uint16_t _pad1;

Can register sizes be a non-power-of-2 in size? If not, by representing
the value here as log2(bits) the existing 8-bit padding field could be
used instead. Sadly, because of it not having been checked to be zero,
that wouldn't avoid ...

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -21,7 +21,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016

... the need for the bump here. Yet you want to avoid repeating that
mistake and hence check that the new padding field you introduce (if
the value needs to remain 16 bits wide) is zero on input.

Jan

