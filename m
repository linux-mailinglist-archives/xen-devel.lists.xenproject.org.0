Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DD364435C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 13:43:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454814.712363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XHq-0000KX-7X; Tue, 06 Dec 2022 12:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454814.712363; Tue, 06 Dec 2022 12:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2XHq-0000IY-4K; Tue, 06 Dec 2022 12:43:02 +0000
Received: by outflank-mailman (input) for mailman id 454814;
 Tue, 06 Dec 2022 12:43:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2XHo-0000IR-IJ
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 12:43:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8340a1d1-7563-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 13:42:58 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU0PR04MB9693.eurprd04.prod.outlook.com (2603:10a6:10:322::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Tue, 6 Dec
 2022 12:42:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 12:42:56 +0000
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
X-Inumbo-ID: 8340a1d1-7563-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbYznsmAC4Inor1X1CigEQUFrc/rvrc33HnAoVb0M22tWNxRMTTXM2HmNYIJoFsW4Ze5mmR7qQEP4buAdNxLLQORAxYfjCwx8BdQvTUiqn2wVkolx8H8GjhilsZIRBEflGrTD0rw+ua9E6ChQmWJtZtC4hubkfmB1zFg7NOQEsKeU+Vy9XGXiVrFpfBbgHZdb7D8DrjBsAsuDBseSV20KJZNR3Nm64b1xVKM07pD5jVvDgGdLihy2OZEsCO28YNgJewxo4k4MhlVTk6Ms97nY/Z6/9ihbtwYxqqxJr5Te1huefrAZD+WdbQ+8sF4Guz7X7VzcZ1JBIbB7iPawwb47A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cq+3cPuAIh6ha3JvbHeSayWTcEfl07kbwc/ma9eUPNM=;
 b=O1BaHBKlnYAfqVkpK5f3zzxHYr7OYCGO12fZt7i+gbjCs13nxRW3B76IPE4SJDKqbtMzrSRqUCQsW/fuhmt4MT9r2Ah4VzjAx9ekNhHu3DW05g2KY9R9i4N4lDf6rASxPiwUqFLYOAUVl9lt2OvmdYNuPx3/4VmaLPncXgO67gKh4Hr5CTgjyh3QlWu05vBNFUn0Cv2Npluhq5PyFUX8TsY8hrBNnCJSs904LufdNh4Gv1WoqlD0p0RmktxmTzBe6f6OWzogVLJ2v3ITEjbVHKohKhe2FIQnmCuZx++A2LHKM1N7rLq3hoxixImn1xs87KrcEbgOJGnTt03OjnNtcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cq+3cPuAIh6ha3JvbHeSayWTcEfl07kbwc/ma9eUPNM=;
 b=KpO3oK+R54zzCPuypIj+vOSq3/A3I62CnMuC+I0QD+hMj/q60FNEXmjPa+wTeBTfktYwpRwYHO6sJtKzjQncSdGwv7WSGMuPA2G2taUfdiEKKP1pxpbp/rmvPOvq6XAVyR7UOGgc6ZCSKBgqxGYMThH6Umk3KwNS/hiG39ncX2nUJ8u7CbuWE3XWZNN5zlN1dOToE69z76Uoc/k6+WhNm/+l6nfwubONRPL3U7fpJ1yMbzNv95HjfH2wXaadBo6AZHgaNG3lbRpyuNO8fEQaDuVBZ9lD+r67Ucb/062w4KloWRIbHheTIY2LZBhNaHo3di0VTbgvZckMvC6/Y6H+Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0bfa1b1b-7ae0-03c9-0291-5ce3f6877693@suse.com>
Date: Tue, 6 Dec 2022 13:42:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen: Remove trigraphs from comments
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221206105932.11855-1-michal.orzel@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221206105932.11855-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU0PR04MB9693:EE_
X-MS-Office365-Filtering-Correlation-Id: 498430e3-177b-4c53-b49b-08dad787663d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WKeceRssAs+jTbocch3v7/XgU6YB6IHPiTPmyPMTc/7eMGHAIE7Cjnc/BsIoz3gKh3IyEzq6h/sKGrf2CP84jMYgXWzbfuSgksiEAFiU8XRSV63ch9DBnNx0n31YKyypzN9bKmgwy4UXKzSt+GnQMy8PmmlljrKNDOzCoQQ+LIyYYIXgDUtxKql5QY/ISeDVtETdsiaU0C6ggT1jZjI6Ag5ArtL9Hjxu5VXUapoB/uafEm8SSV2RD7LSgZ08HDbEiVgVJ5jJFCzvVUDyM8kYT0o13+Q0uFa4YGXdOHqqVVwuKTjonOPq+3UJXHGs3GvWztt6vzpR7HXLe3OPnOdx1OqzYTdCkA9DxQFlYhqOx5LqbYIf7vXks+43vylyPqpp7RcyzHDP8bfCXjCstvsQZ25Dl9VYVuXwbzUlidSgyiBsSTLVLHZvbuBhV8LPlFh1ivowtJEfbwOp/F6cG7O2/2ZeQtzFiXC1TMghZ4sD2CVqe1IDZ+jxqiSRcQj7YOVgt9tBjWTa8ONfWhvldYwZY1Wy+Kovbav0clWrgK5Uw/hSfLGnYu7Spn70vHx9QYbvJdtHMgJ34+uLarhK2lzru/zozSjn9hiCiJYVWelW7QGR5JoZqZ027KRZiksXJVlkZ0jbBHF3uD0x7B6CvNpMsYqnwZfnQkHqOvR77xmtIC4jeITgeUGnbFNx7rRY9jxQT63obB4CHjC2ryozcaOEHeOtIixjF7I/oiVEjqrcQdg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(6506007)(8936002)(83380400001)(5660300002)(4326008)(8676002)(66476007)(66946007)(2616005)(41300700001)(66556008)(6512007)(36756003)(38100700002)(2906002)(26005)(53546011)(31696002)(86362001)(31686004)(66899015)(54906003)(316002)(6486002)(478600001)(186003)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWllRXUwRE8rdWlTOXIxaFcvby84YnhHcVlKTUVWeHZrK2pLWVBrbGJvNGlM?=
 =?utf-8?B?ajRPZU03QXZZSCt6N01BbU9Kd3Y4eEdSZ2ZXRXZCQytxbkh3cDBuQi9lNWM5?=
 =?utf-8?B?QysxazJDMVhiaXhaSXVyWVpHVGxEVTFxNmZPSEpvSnNLYUczTkVVMlMxVEpU?=
 =?utf-8?B?eEh2cktWc1RGM3p0MVZZaU12NTlqeXZndVFWU3VPRmFHNkdLZURsSnliTXZ2?=
 =?utf-8?B?TEZSa2xRRHNrb2VxNENLc25JNE5rcWRtSitPY2lPQjBVdDJQSVExRWhRSjRw?=
 =?utf-8?B?dGdGZ2FLNHVwbEo1V2paeDB0WWx1b21CK0NnVkJVb3dUcVg5ZFNrak9UbFV6?=
 =?utf-8?B?Qnc1dXdWSzh3N1cxTFZaOFhFWGwxT0txdFljTW1LeTM1WUljV3M2MzR6a1ZX?=
 =?utf-8?B?bWdJc3ExNHhoWDJ6L1dTdHgxdEFBbmFRQ2dhc1kvYTVBUXNRaVg2MEt0dGFL?=
 =?utf-8?B?R2JOdGJicVN0ZmFsYXM3NkJOdzYwYXMyQlZ0VXdxWUVIQ3pPWUl0ZnQ2cmd4?=
 =?utf-8?B?NFp0dFEwVHNSQ091bGhMLy9ZbmxBeDluOXo3RXpHeFUyYnZlRi9zWXMwc1hV?=
 =?utf-8?B?QVAyTngrMmhQNy80ODFmeUlMNFlwMWhvMXR2QlZGZmNoUkhRN0FqYVFPb0Ju?=
 =?utf-8?B?c2I1bTBMTExSK2dzYjJWMHRTdGtidVlvY2JUdXJSSjI5REo1di8yQXZNRGdl?=
 =?utf-8?B?SnBMV0xrSkFlckpxbEtaNnZmRi9SVnFDVjRNczYxYmJZcytiTExzbnpBT2dk?=
 =?utf-8?B?VXo0TWUySVJkSjVyUzhwTHBxSERJVjNUNHBhd3BJVWFZSGd3T1R0b2kzZk5S?=
 =?utf-8?B?ejdOM1VKWlN2dS90Qm1ZNTFnWG1qOE8vQ09uUXdxSzBVbFc3WDcrRit2N0RZ?=
 =?utf-8?B?eE1BZHBUejBlMDFXMFdicHIyc0N2VGJjb2E0QUpKWWZTTjJQT1RqaURXM2pT?=
 =?utf-8?B?cERBTGUya1lpRDAwSi9UMjh4MG54MmgwZU54ZVB4WDh3WnV4bTA1THowSUlH?=
 =?utf-8?B?cllQVVJ2Uk1QKzNrdTdRSmhMR0diL0cyYjQ3WTBJRU5WR2JqSE1icGJrS2k3?=
 =?utf-8?B?SnI0UXIrL25FV0dKaFgzbGtheXEzOU40QUpDdlRlbnFwZ0hxamFEOHk5QUJk?=
 =?utf-8?B?MkNzTXBVYW5ja01sS2xTZXRVQkN0NGNhRjlKK2VjdjdrRXUwMjE1TzN0aS9O?=
 =?utf-8?B?emhMMUxOV2drbnhwZWhBLzV2YVJlWWE1MzUzNDlrYjFRRnBqWXpIWTBpNzZU?=
 =?utf-8?B?cW1wV05WREFJbk5kZFo5Vm1rNUpBeHZyQWpIcHpXbGREalFFWXo4YjkvazNF?=
 =?utf-8?B?YzMwYkpJNzQ5YWpUV1VsZ3hGVkpHbG9IaExzVDFJbHFwSHFuRU9ZOFVlclh1?=
 =?utf-8?B?bVJWRjBkWUZXbCtRWHZ6WXNQeXNpMSs2TTN6WjlYZXFZZlR3VDZROHZCdzBY?=
 =?utf-8?B?ZlVXTGNydGJhSjR5bHpaY3FNTnFma0xsb3NiN3FKMDVtQm8wWFJiS1JGK2ZD?=
 =?utf-8?B?OW55YkptcnBxQ2UvbFRKRXMrTG5EaTRKWTVpQTVJK2RrLzBkemtqMUJsL3FR?=
 =?utf-8?B?RHhWTWFJaWxQNm9BQ244WUFXNFBrNXRGVEVZbTd3aTFxaGZQMGRuZTN6WWgx?=
 =?utf-8?B?aVNSNmVCaU5WRVlTS2U4UXgveStsQXFBU1g1bG5yTnRIcEFNODdBMDg1dWJj?=
 =?utf-8?B?N1c4WlhwWGZLbjJWLzFFVHhWMWxpS2IyaXhYaG5PNVdwblFNVHZ0NHFhK2ZE?=
 =?utf-8?B?WXp5elFscHp1ZXY1UktNQ01qUk5PU2VESUFyeCtsaUYzbkRHZCtRak1hZ1BQ?=
 =?utf-8?B?dDMzN1dBNzBpWmQ2M0o5OWc5SC9ySldheDcrdXZ1T0VBcGUwNE50QVU1UmlN?=
 =?utf-8?B?WktmVlNyUE90K0U1UEpiUFpXUlY5OEpwZngxVXpxaWRqNXQvVzdSRmxlWkE1?=
 =?utf-8?B?Qm80RlhzZ2NkSm9JcXlPTnJVdGdkb0htSVhzMy9ibXdIREd1bTBaV2FkbzVZ?=
 =?utf-8?B?c0FLb0dUSys3MXgvRnBoaGU2Q2tUQUhIejNMV29RSEVQT0s4N202ODg0UjlT?=
 =?utf-8?B?Q2NPcEgwRDFCRlpISFRtSnJFbkkzZ0dOL0tFY0NmaU1YaDZoZWJ5MWxKTENN?=
 =?utf-8?Q?vSrDbmNPaBdT3L02llNnhju8y?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 498430e3-177b-4c53-b49b-08dad787663d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 12:42:56.3473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LveIj5hqTlnOG9ra2tS78FEZ45S/ZitksKphH9yPzslDKM2uFswiiLQq7YxOn0v6jdslhY3miBTETpqyXZoVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9693

On 06.12.2022 11:59, Michal Orzel wrote:
> --- a/xen/include/public/arch-x86_64.h
> +++ b/xen/include/public/arch-x86_64.h
> @@ -22,5 +22,5 @@
>   * A similar callback occurs if the segment selectors are invalid.
>   * failsafe_address is used as the value of eip.
>   *
> - * On x86_64, event_selector and failsafe_selector are ignored (???).
> + * On x86_64, event_selector and failsafe_selector are ignored (?).

May I ask that this become (?!?) instead?

> --- a/xen/include/xen/pci_regs.h
> +++ b/xen/include/xen/pci_regs.h
> @@ -246,13 +246,13 @@
>  #define  PCI_PM_CTRL_STATE_MASK	0x0003	/* Current power state (D0 to D3) */
>  #define  PCI_PM_CTRL_NO_SOFT_RESET	0x0008	/* No reset for D3hot->D0 */
>  #define  PCI_PM_CTRL_PME_ENABLE	0x0100	/* PME pin enable */
> -#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (??) */
> -#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (??) */
> +#define  PCI_PM_CTRL_DATA_SEL_MASK	0x1e00	/* Data select (?) */
> +#define  PCI_PM_CTRL_DATA_SCALE_MASK	0x6000	/* Data scale (?) */
>  #define  PCI_PM_CTRL_PME_STATUS	0x8000	/* PME pin status */
> -#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (??) */
> -#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (??) */
> -#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (??) */
> -#define PCI_PM_DATA_REGISTER	7	/* (??) */
> +#define PCI_PM_PPB_EXTENSIONS	6	/* PPB support extensions (?) */
> +#define  PCI_PM_PPB_B2_B3	0x40	/* Stop clock when in D3hot (?) */
> +#define  PCI_PM_BPCC_ENABLE	0x80	/* Bus power/clock control enable (?) */
> +#define PCI_PM_DATA_REGISTER	7	/* (?) */
>  #define PCI_PM_SIZEOF		8

We've inherited all of these from Linux, and I notice Linux still has it
this same way. Ideally Linux would change first, but I'd be okay with a
sentence added to the description clarifying that we knowingly accept
the divergence.

With the adjustments:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

