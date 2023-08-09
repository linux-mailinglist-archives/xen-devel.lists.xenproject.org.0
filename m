Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E842C7763F8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 17:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581200.909791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlDB-0007mz-JQ; Wed, 09 Aug 2023 15:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581200.909791; Wed, 09 Aug 2023 15:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTlDB-0007l5-Ex; Wed, 09 Aug 2023 15:35:01 +0000
Received: by outflank-mailman (input) for mailman id 581200;
 Wed, 09 Aug 2023 15:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTlDA-0007kz-7U
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 15:35:00 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20608.outbound.protection.outlook.com
 [2a01:111:f400:fe12::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4afb8afc-36ca-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 17:34:57 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8594.eurprd04.prod.outlook.com (2603:10a6:20b:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Wed, 9 Aug
 2023 15:34:55 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Wed, 9 Aug 2023
 15:34:54 +0000
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
X-Inumbo-ID: 4afb8afc-36ca-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3/KpqNa0tUfeLLfnImUJaI4iVzB6j/65zQ3vK/LrSpl1+Frzur3/mXIRFB/QuenS0L+nQvMOlx6lnZFVORgTQsBZZLNAZK0YDxAHsVzxzGfXy7zZa8epmUgr7tcvHk8orIkH0fyemYXA2HURQhSp4kSgDRnxkVscMYRw1CVG3yq39XPw6+HtW4eKskE2xowDi9PHJvbX0LC0IU2MjaY6QOGpPpFENuLFE7M8+py7s+XQE9DaYfwFM0BIeUihBqc0As/uhILLkTPvOmLcOrK5+fn5Hh/DGPTuP6c0dGhE6Eh+5iWCcrWPWYlNLKVZtfEZ7JGFt/RKoqeL8hUrvWaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGfDexlnaZ5wJJzQVskvQuhXLBE07gOBI96wbwnjhd4=;
 b=P0vR5gwCysMUXFr9IwCP9dthy6Z6Shc6tcyXwlfwg3az5ivjzoiy678dP7DaUASHFn48vGBod0ItM/84wpzkcUMPilhqjEXBzxAOyIDeXBLZTCZGP09UzN8Ep76ByqRuH7DOgwSbyoeNmbwcAzzpYJqf9GlyE/SZz97eYc6DV/8Hrg5VbM9ToOiV9w4hrtYQy8XXCQq1/Ewid4qeUYMvWveV6mIqTxHhqZaEPDSaO07hD0WfyrbHOVcR1tas/lQpISynOe9yIED+8iP4QfzD48EesBY11reepBpA9ForxSZHIINKPxpbMJYu7kackJiW9gC5ZEU8xGDT8sjCMYQ79w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WGfDexlnaZ5wJJzQVskvQuhXLBE07gOBI96wbwnjhd4=;
 b=dUjQybJc28uGNKfMQgTIFP/Hfb1CMRL9MUYiMknNTmgRMtJfHqkZ3bE5UlKK1gapQSZATCK2Zd/pGnbVUfauiS730I0Tq/b64MhF1MmGq7DtRxbMRwnjoAFFwSc3bRFQ9fkQOywINu/opPAyJxuPmixfKLAlY47ToIk3OjlC9kmkXQl5bF1ehCuMiErGzeXh+Fbneejio0/5lNmovHLfL2FSWHgIMFJJpfMLklxbmxsuPj9WBOJGs5yAXHv9qqkBbExv+aM0lxh6rhnrVmSa+QdxMeI43oNsIDmrdOyxV6c8EH7zHwwp5iqz3J4buTVa6pPtN6u1pxOCh1eEx4Yz/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eaeea21b-5d83-131f-e074-b18263db8159@suse.com>
Date: Wed, 9 Aug 2023 17:34:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] x86/spec-ctrl: Add SRSO whitepaper URL
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230809150854.66849-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230809150854.66849-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 6796d4a1-a26b-4d49-36c8-08db98ee2e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eIqwWREAtWCCgBZ+sQ/sXf7sQpBFeFFb7PqT7dRllTHJ/UbIdW/n7hmJ8Q8y0AniUnon8APzUCKGWU5nZ2qbEYqD604rK/TO99jrKELkZkco+32YSTiVNDCuga5oZWzVUZQ2lLiiwdlfu+3pJz7hy9iDw0A6cXUIuVlrEuf+cBYuRubjeVXQQkZ3jGQTMbF0PFfa8pviGzlWaMlWkDrSMM9nIOny86SjcKouLWJX3t1fCQimcXXILuA8Ej+3T4yn6Abns1ZZBmgrgau8ws0bEEEstWQYV0hcCreMYpKPaFBtNdIyCpmZDklhUPENf3+s3KENr3d9dzRsC3c4Uff/HkkDGqpC7QloQM2XOHKFm/VOewj/XQI8Njgkge5Bflz3ZO8RReD3+KdzZmyHXlm58pmf5+YY2aU/VQNgrBNdsk4FQbrU3UyC3hXdVoBUh3amO1TW1kIvoaqpnAugBrCuHqhjyMFWinnmZ+qaaVmM/CxPQ2f8EL/XzTi7yrg8xAo0LbLwUd7FJ25CaaTKEDiFnLzqmr0hPZVOVWGl8QrvD/mcXTB2zpmynyhmMYOErrRWbNsmDIQ1ufKbTvBaKjRcjtQYHb9m13MMp5i5+POpsGg3TIRvnjyG45NmVLjakhAxlXfczPssYVX8n3Ny2d2S6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199021)(186006)(1800799006)(54906003)(26005)(6506007)(53546011)(6512007)(2616005)(6486002)(478600001)(38100700002)(2906002)(5660300002)(8676002)(8936002)(36756003)(66946007)(316002)(41300700001)(66476007)(31696002)(86362001)(4326008)(558084003)(66556008)(31686004)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWVQdWZaVVNpMEkxYTJWSkZsQTR0bkxpWmR0Y1dyVnpmeXRQd0F1RUZQdXNt?=
 =?utf-8?B?K0lscTVFdjdzbHV4Ri9aRWs2UWU0c3EyK2p2MGJpU21PbzdsdC96eUFpUGIy?=
 =?utf-8?B?SlhvcWJQSWt3bWR0LzFCQVcwRm00enFsV2x5WlovUU5WMVNiU0RyQXU4YUJD?=
 =?utf-8?B?ZXo4SEswSGJMdXhTN1dSUGR2M1crbVZuc3kwWG5FVmFWclc0T2t5Nm5idUFl?=
 =?utf-8?B?Nk5zcDNsWjMzdERxekRESWxBSWE1VDVlU3BiQVBENWVLRmlPbjBrOG5qZDN3?=
 =?utf-8?B?aU1Vb0JkU1JKTmNvVUdQZ3ZJOGxmdVo5RDlDekhxWlcrRWIrUDRacUU3blVr?=
 =?utf-8?B?bzNrK09FUzltUFByZ2MzaEJFejNSMXV2UVVFb2g2WU1ZeEs0YnI5czhoNklM?=
 =?utf-8?B?S0tSTXZlUkRtY1JwMDJ6WFJiVnFyTGVzaVJqMk03VnZQS2kwTUNmSURWVHk2?=
 =?utf-8?B?cGh2UlNBbWhyUVJFSFUwcTRiV3ROWHgzQ1piSVIzSklLQVQ2aVd1VDJKTzIw?=
 =?utf-8?B?MFJkY09IbFM1QkExNU92WlFYQU5CZmloUzFObkxCbk44VHdxa0k1YVFlZy9o?=
 =?utf-8?B?YzZ0anJES1hxVlAzTlM2N1JNdHVScXVaQWRCRXlWaHMzTk5YaC9tUGNrUkx3?=
 =?utf-8?B?VEE3Uk1kNUp5Z2ZabjhPMWRNVUxLUjFobXBPT0U5dDBsLzdPUUcxNnQvRDd4?=
 =?utf-8?B?VitieWMzazVkSldzS25IS1VZYXZxbCt5RSs3VjlKT1g1a01wRm05U0VjVFhX?=
 =?utf-8?B?MlpnQllGQ3psS29IdHl2dkdrbSs3SEdldjFoOGpWOWFLM21qRlpHZ1plZ2xu?=
 =?utf-8?B?OUo4Y3pvSjdtbC94aFhxLzRrSHFBdk5EY3l3b3p1MWs0RllIWVdia3hpZ2E3?=
 =?utf-8?B?L2VldWJpTkYrR1dVQ0NYSkw0QmJTR1F3NElkanFlTFQ3ZDNma0NoZU45MXo5?=
 =?utf-8?B?eE1JeEdORktVWm5mYjJ3Q2lTYkJIazBQZVE3TlY4dEFtbXhwWDN0Y3NnR1FC?=
 =?utf-8?B?S1drUi80K0RwTVJucWJ1TForc0RDQnBEUWpONFQ2dWxDcWtOa0d2RHRyeDFi?=
 =?utf-8?B?WVZUamRVRnA1QjZJMGltTDgvWlhYdFJhU0dBbDNpdXYyUnVKUDh0QjYwbHNs?=
 =?utf-8?B?a3FGbHUwbDNQYk51ZHFuUTMvamtIK3VMS0dFdDZIb1ovNm1jeXUxWERsQWVE?=
 =?utf-8?B?Mm8rL1dTaGg3WVBqdEZxTjZHYTRmK3M4K2M0WWdDU1owOVlsREV5RkV3UDgv?=
 =?utf-8?B?OUxjLy85Tm02cEpTYWZpdjNRWWhoOVpLSURRWTJuV082ZU5NTFN3K1dIcGti?=
 =?utf-8?B?cXBnQlIxSkRzaExzVFpBczZzcTBsaDdVWjNxQXZoTkdYQ3c4VldQbDZGSjRy?=
 =?utf-8?B?eUVRbFlKb1RWbEN1NGh4ODBxakhsOXNnUUtBQm80M0xaT0p3dHVBSE90NU1r?=
 =?utf-8?B?VklnNEhoU2R5RHVXL0o0amZwTkQ3R0NDL3JydUgvRCt3L2lwYWNJUUhheXl4?=
 =?utf-8?B?bEdzKzUxN0xkUk13UCtwSXA1TC9FV3h3VU1FQlBEMlhnTnl0TU1uMzF6YVJi?=
 =?utf-8?B?My9LaCs5bEsrdDVhQVVMemZ1MjNlVjZIYjkwWGd2WXllL2NJcmZOSGU2Z21t?=
 =?utf-8?B?WVVhVkExMm16ejV0NXNZQ1Q4dVU2b3dWb24vM0pHSEU3QkZwQmRodTBBRWx6?=
 =?utf-8?B?dVhkUWUyQjhUcXpwNXp0OTJDZ211QkxLdW1qczh0KzhQbERsTVZNM25kVWhi?=
 =?utf-8?B?VWFudmVoMTkxS3RVNmI4bFpDZExMcHRpbDlOblJqWkVqR3ZHU0J6QXVXdnRx?=
 =?utf-8?B?Yk9saEN4Q1F0Mm1NU2lLblRMUVhlbDBFbmh1cjBidWJUZVI3Z3RheFcwZE5a?=
 =?utf-8?B?aGkrZWc0MXpIUXN5dW54ZkIrZFlrYkRCNWZWMVg5MVdwUDl2YTEvOVJML0sv?=
 =?utf-8?B?OW4wMWdRMHN2Qmg4OWFFbkhZaHRhUG1QVXRwWGlTaTF0L3Z5VnJXdXN6VnNB?=
 =?utf-8?B?Rk1ibmlXTU5HS003SGg2dWJmbnNyT28rK1dJdW04ejdQZjFRMHl4RmEwWlZ0?=
 =?utf-8?B?ZlNBemxqc1Y1ZnRZWXk4Slc3ZG1DaW4zRDFIeDVYNXhVb1h6VEhlOHVFcXh5?=
 =?utf-8?Q?hmEMOxgInwJjU4ZulU8Ks/8rr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6796d4a1-a26b-4d49-36c8-08db98ee2e22
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2023 15:34:54.8615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XfUcTJBhDtstV/M7eb7g3roEpOhUWBlv1TzUR8xFGmv2moQsdurDnEHm+1u9sONEVieneS7Z6P39MOJsNDQjwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8594

On 09.08.2023 17:08, Andrew Cooper wrote:
> ... now that it exists in public.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



