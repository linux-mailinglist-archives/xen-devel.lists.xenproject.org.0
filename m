Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42C763998
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:52:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570524.892360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfrx-0003v6-6V; Wed, 26 Jul 2023 14:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570524.892360; Wed, 26 Jul 2023 14:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOfrx-0003rY-3e; Wed, 26 Jul 2023 14:52:05 +0000
Received: by outflank-mailman (input) for mailman id 570524;
 Wed, 26 Jul 2023 14:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOfrw-0003rO-AS
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 14:52:04 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb6bb467-2bc3-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 16:52:03 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 14:51:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 14:51:34 +0000
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
X-Inumbo-ID: fb6bb467-2bc3-11ee-b242-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oOJ0acIzN9cJ64JZ4NDRvxGWNhnG/9f51EDhSw12ETIaDkfJVfY5slV+cBzhtp68S7wC+6UPvqywpeyW/kLflBIDkQx9f1lTJuTDuOts7SSJe0HBv3ErDhgbaAtwbLLKa30Jkw+5dqa54L6jV4pDkDtJ6fPiajxnaEQ9PJdGoSR52nVxBsCwbWOZW4PnpQcQYvQJ5ES4ofU67fYz3meV8HhBG68pa2iaL/39t0ML73BuySdhlunewHDDg+Y3sXajl8ajCtMPhA+MGcg4vZ1VCUiRAleVrSNEFBjRUgmOWCNwzGXVNJW5/ej1Ie8rthCDftC3QVy6IWwFByzFC0NBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkR2/tc8X1DQ2RRfb7if8Eu/1sexbo3H5KgNsoAXpRQ=;
 b=LNr3+JqXt0RfSJvxsdyMfa87husKMr94/wx19tZAtQbndwEydpWb1jrshN+ybYKqM7+y8rqfD5DY0jZTZaRLUDD7m0k/O/T9MVoZzDADDbauKtH94krX1wXSYxbNjmMXGWkBgEW/vh/O0KNC2tksdxIDJuuYrKemI2fwikEnedtqFBpMxWVMoalHeCbulEH9fEtwyZHsbwxySAF+gFlubxRXEUTprxbiI04P7HjfsCRrrT99LXeiPAaZL0pbnF4OadkIiHAPMdmUNYUlerXVcdmJmBlDm7TbKut+UwkxkIZE5IpcBBuu6h7ofyQBuqV5hubqygjv48yj/1xhzWvI9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QkR2/tc8X1DQ2RRfb7if8Eu/1sexbo3H5KgNsoAXpRQ=;
 b=aoJsNCqvY5JTtBbx5gupt7+jjwTTC66cftD33TgZClHcnHJ8U1CESvFpSYXjhlrxfHURURQmGCkgYVV/KiDFChiemU3QW6IJco88vHyz6U5L4vZ2zt+1xlTJQJmE/wdiyUvOfeNceWVBkQ4Ua6rFVl3EkkrEzgt3mYAJL5Y7J+n9cL6Vcto0Jj5wqlm+XIAxPFA7kmqumiXLPoi0zoskXb6q1Oz9ZGfqDNGsodBr3tVwb+YQ7lYSCD6j7RY8gEilv/C99zzG8YyvTn76dpKU2AZHlKoq1GmmdradDOhoK0sTtzckX/k6o5vwiiKCj8Otml8bmZCN7d932wCR18KoAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8bfff663-4cfa-c5b3-8e8a-27204c417c60@suse.com>
Date: Wed, 26 Jul 2023 16:51:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [XEN PATCH] xen/kernel: change parameter name in add_taint()
 definition
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <5692c7c51de63d67865208be2be7bf011f171540.1690378948.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5692c7c51de63d67865208be2be7bf011f171540.1690378948.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0238.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 6081d922-c742-4e2a-0ac0-08db8de7ce3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vCai8iFJgO0Qn0EyrfodboTgU69AWchQywF4A3R2PqSc4HR94eZd+wwNsT4xa/gvV4StdO93aSR2i/ALQm6i0LLWCrXF8iiuxo76FPSbTVhVumnnVmGBxAgBMcnNxSZVDaiOIvdUw0xptg35glTxXh+UMfwtrtiQ7gAHsAYneRZkQODVKUGI5jWr+E2o4mTVUGCp2KNPi5Ye9TpZ4RClIqUDX4ibiEqH/b3LLsM3YHkuotseVGDONzBcFpvUJyg13eTlKfAuNPSuP8RraqX7HjMHy8JRllJ4XrHEHJZWlyDXjDKC1c3+bL/TVTuv+V+rEQkWqhvNloebvWxtQ9EiP2aFRAJcF0bkYhm+jg2GbDhBQen2uBHIyVOoZnBl82nzUeunRnW6hq85hBeWKqnZCtl0CgPS+YXkIQ8QfUh2RV2ssKeF/iceQc2N0hu9V9NwFsUMrxmuCLpFjQ74KlBXnXc5WBLWNjNU1fqi7q1/P7FLWL02CVd1ng8wHGHrMu8XWJyk2gNqLT0MSp2clMRg9pymf/xae8aFRtHpxN6maql47j0g01wbm33p/tqeG6qMeRQZYSikLvljESMyZM5KYuFt42q3MACRureNIZBhsGvswfdwmbu04mVrK0nroiFtmGtaDuTr66U9fPVJdvghdQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(366004)(136003)(376002)(451199021)(2906002)(6486002)(2616005)(38100700002)(36756003)(4744005)(186003)(5660300002)(86362001)(31686004)(31696002)(41300700001)(8676002)(316002)(6506007)(26005)(8936002)(53546011)(66556008)(6916009)(478600001)(6512007)(66476007)(4326008)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejhNdVd6U3hRSGdIODN2dC82RldNZGpDZjVIclpldDVIeGh6VVBFcnFXSVpK?=
 =?utf-8?B?eVFkb0VLeEdEb213UCtVdTdHYUZEaDRLa2h0OHlvL0NNTjUxSkxJcGRoN3Vn?=
 =?utf-8?B?OFN4UnpYcUtlZmNrTWV5TUJOUHlaQis0R3VSbHh4Z2RoTGZxUnd0cnY2dyt2?=
 =?utf-8?B?MkVvMy9TLzdiN3ZyTExzUjVpZEJLRnpLeUlTZ2hKNm40SElwOHV4bEdmb3Bu?=
 =?utf-8?B?SWZrWlZGcllrNUpSQXdkV3ozWE1NUW44dkZkYkRmeFhxRU1qVnJyWWVBMU10?=
 =?utf-8?B?SCtVVWZFQ0NBOTVhY3h0MWRJa1lNaEI5MitYQ2FiK0xYdFRUajFoL3d2WmZ1?=
 =?utf-8?B?NHhpV29hU2ZpWHFTc2tObk9YMUZFK0JWSCtBZFJzdFE5RTBmR3lWazl6bTdG?=
 =?utf-8?B?NklRdDZJR0tYNDMyTWRMalJ1d201Z1ByWjlURU9XcERQU01NTkRZSVhqRVdW?=
 =?utf-8?B?VWc3QkM3dWRGUjdiM0JkL28xZ0RrQTFkckZlVEhHQmlXZGgvUGpCZ25QSjR1?=
 =?utf-8?B?dVVhTi90MTBkQ2U3NTV6Z0xSblJTdEhCa3Uvem50Und3ODAzWU1raUFZTy9T?=
 =?utf-8?B?MEFNRUJjM2tsMlpPK2wxL1k5ZGZXWE9aUHNaNXd1ZnpkaklCclpoODduMUli?=
 =?utf-8?B?S1ZWd1JGTGs1TnZjQU9kSksycU90YXRuQ2hPeGovSzhyNHJWR1FkNi8xVUtr?=
 =?utf-8?B?UGprQXAycVA2ZnBsMUdESDh2VC8rc1ZYR25sb2pPbVpCTTd3MUplTDZoOE9V?=
 =?utf-8?B?NEh2UG56MEZZUDhRcHlLNi82WUY3UWJhV1paTWdsRzVrSjN1VTZpTklDcHlo?=
 =?utf-8?B?bXp4RExvUnZZbGFsVUhtSW9RNHR4T2M2WmpzQTBFL0NjVnV6eGF5L2NxbGRy?=
 =?utf-8?B?dy8valIvUzAyNFFWQWt5Vk1mZE00dlc4QW1HdnB1MTg4YW9KUjZvbDFaaFpD?=
 =?utf-8?B?R1lMSG5KNjJOMHdSeENNS2dSR0NaRjYwTGpmTlU5NHpZekttckU3TFVXZWky?=
 =?utf-8?B?bWpxR1Bpb1RPWTN5YklwRC9JNjlLRUlDRkd4a1doU2FXT1BBNFAybVZGOXBM?=
 =?utf-8?B?L2dWWGNURG4yUmhCN2FPWDhTNlM1N0tNcjlid05JeStpSHJ5M3B0Qzh1MnB5?=
 =?utf-8?B?MzFCSzRrRVRqS2NVaWZHRlpLM1gxWVBoNHBobi9CNFVha2NGWXY5QXd0aXlZ?=
 =?utf-8?B?L2NVSVJ4aWdJbmZVVzRQdkp1V05zUmxxdW9RUVkyc2ltb3p4anpoM3VkeGpu?=
 =?utf-8?B?K0ZIMUl1Qk1EQ2VEQUp3UkxOcm1BMnFlV050cU9ETFZZOTF2ei80QTE4VjdZ?=
 =?utf-8?B?ZkQ3L1VYWjM2VHpwaVJIZ25sR1Z1SCtoVzY1aDRlckZVYzF3MzFhUWVjL1Zv?=
 =?utf-8?B?a2QzRDFWS1MxemlYL3ZaenVzSGNpV29iUEhKYlZpOHVCVXdPQ0ZwTFhKZmJy?=
 =?utf-8?B?OTRVV3N5aGhYUlIzV1ZoSWNPN2UreHFxRmdtQWJXSk8xVnZ3ZUF0UXNLSVNP?=
 =?utf-8?B?KzJZUFVuNjBGdTZoZUNISXgwa09wMmluSUcyYkhXRDMzdUtjeFQ4clVTT0lw?=
 =?utf-8?B?UkxJTkVLZ3BSbVp5U1Q3a1BYeHJ5dXlIVG5MMHZSUXFwMTJuNEtNZ0lTVTF3?=
 =?utf-8?B?aVI1S2RUUGdTSDhCU2E0MmVZVUVOSmZOVW9JSktDcEZBSTh2Rk96aW9USmRS?=
 =?utf-8?B?RURjQWlxZHRKc25kdXRqamk4Yys5WS8xN25hMzhTbFJmSjBnN0pTT0I4Z1Yw?=
 =?utf-8?B?bU1GZGdvT2hxS0RtNUtKSitSTkxVN21jRE9aR1VzOEwzRWdxcGhIeEVML05D?=
 =?utf-8?B?Q2dVQ0oyVDdYSFMvYXJFRXgzZjhqdHFncVhhSXkwc0lJNVRwUW5sRXRySTdn?=
 =?utf-8?B?TE8xeGdPYitVdm8zenluaG5PMTc3Ymk4V21GSGY1THVaL3BNYlJsUjNLNlM5?=
 =?utf-8?B?engxV3N5UUlpM3RyVnJoZWg5V2MxUXBaWnhtc3ZtVWFaZDU0Z2ZVc3lxQ1ZQ?=
 =?utf-8?B?SUZGVW05ME9LS0NCazN3SlR2R3pzWkN0ZEREeXVJRUpHSmJVRUNCaDc1cG9r?=
 =?utf-8?B?Um9PeXlNSzNQekJhcWJmQkF0V2ZxbGpmZE1EZmFEUHZiQmg0ank5a21oZk9K?=
 =?utf-8?Q?cRNBZAmIDSnPsu9ddbXXv6Ava?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6081d922-c742-4e2a-0ac0-08db8de7ce3b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 14:51:34.1857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VYYc2JnzKFstaxVl6yeVcCYITiMZ9n5ZVgGhOBsuN0V4LeU8wUBkt1wH8uqkPdA2dlhlof3xSOtPdNIulPq5KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441

On 26.07.2023 15:58, Federico Serafini wrote:
> Change parameter name from 'flag' to 'taint' for consistency with
> the corresponding declaration.
> This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
> of an object or function shall use the same names and type qualifiers".
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



