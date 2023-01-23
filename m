Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E311367808A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483057.749021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz7L-0007te-8x; Mon, 23 Jan 2023 15:52:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483057.749021; Mon, 23 Jan 2023 15:52:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz7L-0007rt-6C; Mon, 23 Jan 2023 15:52:19 +0000
Received: by outflank-mailman (input) for mailman id 483057;
 Mon, 23 Jan 2023 15:52:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJz7J-0007rG-6e
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:52:17 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2047.outbound.protection.outlook.com [40.107.14.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8975095-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:52:16 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8932.eurprd04.prod.outlook.com (2603:10a6:20b:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 15:52:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 15:52:14 +0000
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
X-Inumbo-ID: e8975095-9b35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUsbq+jxzMqtESt2kdk1hJ4+vt7pnSC79ONOsp4xQ3S2QEfLk9OGVgwccl49fmnvul+UBkrAPOG5plUX6ShhP041l7hefA5ndSNnktvPvMckKhf47Im4J1M+JHVR7afD0UuqDAG8JoeJUOi7Jkg6/nVkSxsiRTkpg2FeHgfhGC9Y762/1yLD7N+lsEGAILciO5nHsqsqZGHF0rAVNiFgqBjgqOn1XSPD+oRfakp2o3xWzQaYvFMj9iYG39ystK1rVALyM3i8CcLjZRB7CWKiam3/w62eBMsj5BoQTKGk8STM1U3UEL19tIgG+hVWAPknBsIeyflAy8BWm8jHc/5C0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMrIkdY/8YnvQDKF/6QTAJDxwfaruzwGCLdEnVrHwMI=;
 b=HdSMLzjvVPU95gUKp5d+xbptMc2TTeBf3OVMAJIzd3xSUXMPHp0vmwANBUVIhZMc8wIa+mwU94Hl38LICp3sccWLh/NHHOyw3c9EM8i/DYay+MztFrwU8/OlRrEH3Zr7iwI6R2hYG1a06H8cSMM7y8djsOd/tujw3fMjRr86CM3aTwvJ9yrs6fyPPFSbLk15IL/i3Zbv0dVXXmo0ENynm2PrJyRAfd35We93Fke3VvwTAlj1qR23WEmKQG2c9amS278Zg5tSDCcWvyYk9lHK+G8N5OiKlAcJXnZ149x5O+YoSDQIunYshRb5HFQpIOCerty+eq+IfiaGak34HLt+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMrIkdY/8YnvQDKF/6QTAJDxwfaruzwGCLdEnVrHwMI=;
 b=nlZJpJsFwg2rwlKMtWcHwVpqToZtXG8s/8d5jOfNr4MPN1f7o0xlG0qXF/uJcW2K3n1xuWONmmzXK0nXyAAch926+IdeRJ+GVOXbPHSMF/QOOwIlpEqX425Btb8ZOSICovA1dDRZytcvvPyZq5C05ynqkU0c/uEutfqrbGaVGfi5kmdXRCIF+8+bFIOww2wtbIeZJ9CdEGTYjlCbsnOiavimz6N/+P6ARqqzSAO1/gJpfDw5MevwnGNRVXHysxm3e7cT58vZx+szMHmx6Z8WM2SQl3mnkHhOu1ihOk89+E7jFYpcg0D6q1VRUm+tdAqWwzRGvUP11niE5Dqz5Q2d0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8fc9366a-3a1b-6c40-499d-b16bce681c64@suse.com>
Date: Mon, 23 Jan 2023 16:52:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 00/11] Arm cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: e64b95d0-1307-4fef-5ed4-08dafd59cba8
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4yXgd4wNmbq9jy0wQ8K/4rle38/G6aPLPoah5HaAn+GnPR/ld+uaZvKuSstKjfnWsbQxpz1Gao/Cl+HqaM6jbty3lhmgec/5SIW6lhppClynoKQ4hJFlnCJJzCLM6kPV/Ev5A+WLvKt0qiz1leDoK9YqFlKDmSQNWwEB7BRwNJLu6pH0/GZ5e2yZG5VeNoJub9Q9OejRmKtOCWAOekuy0MRzxxaITvoH192QZyFvMWAgZaWPFXSAST1ie7tE79GpVzkxXCMFOEsTEHMKcJqHOUcEy3bZXClVJAakezzLvsVDHF1TfTeRNa74aJjGZTaudLhHMoGeT/poOQa2M68o2YYroty22Cwrv1ltkn8FG2Xxh2E5jlrjznKkHXVWs7ovpGZ3FkuGZHR357FU6CdLP4UBJklqY+uxiLLPD23ubOOF8Un2Ddze+ai6IdrxhRdEAQXa+oNW2rvufFMIN/vU4WH/v9dLUY5/oo6U6P//knLbiurCNqGKjT/6SPxvLA5KYtast5atZvB8ofCLPdxcxSZhj2vJnop6SCSDRvrqxxAQG6wcG1bWXgjpg/3TKrwydfhpk2UH+HCZuIJ+wO3DQyg9qr3hGF3cMoJ96RUE/sk7g6JouhWSZxjiPkwLoCmnR9o9v7b0ECwL+5aQBjcSTBv/fFsWEo8FAEhtOvc5fnHBnd3nrWjOxSykSt9Z96Bf2XG+kABnabxmfKGfvss7RiZ71fsT8DMcVJId2CsGpj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(316002)(6506007)(36756003)(6666004)(38100700002)(54906003)(41300700001)(2616005)(83380400001)(2906002)(6512007)(26005)(186003)(53546011)(31696002)(66946007)(66556008)(8676002)(7416002)(86362001)(4326008)(8936002)(5660300002)(66476007)(31686004)(6916009)(478600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVp3aUxsZzJudXJnMFJLVDlZNUMxSWZJNHpnMlUxdzIyZ2FJSnZXcmtTd1RD?=
 =?utf-8?B?cUs3R1hldUx0a21Qb0dKdFhyMTBPeVludzRaYlJCT3F6bUZZdk5xWVE4RWZ6?=
 =?utf-8?B?dGZMcUZqd1FvSFlvOUF5aGhsdGRlYmVOQlFRUm5ySWlKaGxkck14ZWpqTk5M?=
 =?utf-8?B?ZFJpUUYvdTl2c21KeVdzUWJqY1Q4WjZwS2dsbm4vU1FRNU54ajRwTVFjNWJE?=
 =?utf-8?B?UVVuQVB6K1N0RTQzVXpWVzNWekxzaURXNFRaNXlpNk84d29MS3hNZ3ZuOEQv?=
 =?utf-8?B?WHpBQTFWUXZwTTJpelRHanVTS3JJd0JoQWtFRVVnZFJyS2pBLzNNaFlIN2Ri?=
 =?utf-8?B?SWZONjZ5UTBFTGNQb3NWNktuL3BpSk1SNXlBZ0JtRi9Ha21LZ0pVQU1ISXVB?=
 =?utf-8?B?SnJlUGpDUEhiY0prRXA3RkV3YWJ0M2d0R3B1THowSDB2UUVMMS9MdEhzUW9N?=
 =?utf-8?B?K0MwMnVwdllJQzRxcmVvWjRrbEdJTFVIaDRWbUJ2Mit3NjJJTlRaNWo3blZx?=
 =?utf-8?B?b2NZWXNqa21DWVFqVk9JMWZLOVlzTjVoRnBIamRBR2tBQ29JZFBWdG9pWURk?=
 =?utf-8?B?cjN6azVkTnFpOTVhWTF3aEdZbmpwWDM5Q2Q1Y0xpVHlrLzlMWE9YQVVFdGRi?=
 =?utf-8?B?eitObWpNbEtIcG5xZTUrVmUvcjFienBYVC9hMmZCYmxSV09ZaDUyR0Z0K3VU?=
 =?utf-8?B?MCt6d3FjRm9LU1poZ3B3MkRuM2hNTjJTQWxEVGgzdW1DNU5qa1lDNFZ3cXl3?=
 =?utf-8?B?TGw3R1l2QXgvUGdORmpBdmpFTWZHb3dtNTdUMVhrUUVCUGc0TUU0N1M5WFZp?=
 =?utf-8?B?bDYxTjgrZ2tScWdxY3pPQitLLzVoUUFPVXllOGFGc09SNW5PRlhvREZyYlRI?=
 =?utf-8?B?aTdlREd6TmZsUTJ2WEdvNHRFKzk3c2U4QjJ1enJIUUZjL0ViUktGWlN0VWlY?=
 =?utf-8?B?cURZUGFlUjFuZnhSWWxoOFRvVXNHQys0VTllSHgyRUJXYllQNVdDaFVlaDFo?=
 =?utf-8?B?NTBPSzd0OEQ5TFVsZVRhSG5YSElKVVF3ZHNhQ1hnWHZtV0s1STBSQVZwb2sr?=
 =?utf-8?B?WEt0Y2VydExhN3JVb3QwbFZINy9mMkozVCtFZjhTYnJNYkhtNVNxN3lJZkJP?=
 =?utf-8?B?VzhzdmtZRURKOUk5S0RHY2ptQ3o3VnZOVnJReEhUNEVOWERCVXFTV2YvOS81?=
 =?utf-8?B?dUhieDRnZElVT1A0azBGT3YxajJLR3RjOGtmNUNBL28xbGhYK1RUNjNOSDlR?=
 =?utf-8?B?by9WdVB2eExLWnNxTU95R0JhQXE3bTBpSGRYQmsreFZqWk9XUEVzbVF1bWNt?=
 =?utf-8?B?RnZOTUYydlJKQ1JJNWhQeHl1TVdKa2ZWTE40aG5IRU5adGlrcVBockZhY0FE?=
 =?utf-8?B?cEcyayt1S2cwZktYMnE4b2Z1R1pjUU5iZytCdHo0NC9CSmRrN3hXd1ZIdFYx?=
 =?utf-8?B?M08rd1JWNCtQL2ZrdXlEL2pFWjdjMDFlRk9ORXI3TS9rVDM3bWd3bDlaQjZT?=
 =?utf-8?B?ZytmZDh5MjhHSThwVFEzcU9XekFoeUFJbGFDS0ZnUVBOSENKMXhZNjdoT3d2?=
 =?utf-8?B?YTdoUFBzQ29QS0E4bmIwSmxJZ05rNW9OSDE2ajhwYmlFZ0pGK01ZS2tMUHFz?=
 =?utf-8?B?KzgvNTROVzJRS1VKR1R6dGc2UFJXcTVCcXRVY2JaWG52c0ZOeVhJcExtcHJU?=
 =?utf-8?B?YmJicFF3SkUvWW04VUFKTldZT25GeW03bEFWMlhzNEhPZEVYMCtPMHZEM2VW?=
 =?utf-8?B?ZG5DMEFXWjBERFplZVRNVWxVMGZzQlErSURuMWlNQlFuQXlEKy93dDFvUWdm?=
 =?utf-8?B?VDI0NFJZc3ZjMkVEemg0b0Nrem1XcEJMUkN3TlJnRlBSUUxjdDF4Y3dBbHZ6?=
 =?utf-8?B?dnNiUktyWWw0emlCSFJhc2hCOFQyTjJISHZobkZsOXBza29LRXQ3Ym1nbldK?=
 =?utf-8?B?dlAxT2tSdmp1ZjErVldvTjJVTVNzYkEzY0ZncmtybUtSU2xHL29rang3WXdM?=
 =?utf-8?B?SWcvb1VqbzU2VVEzbldaQVVtL2k1NnM4VGZpeldjeUdkUzA3QlRVTGNwRzFS?=
 =?utf-8?B?VGxnOGk1L3g2MlVoQUo2YmhmMzJ5RzBJbndBQ1RyNjA3T3lqelB0LzRYM25n?=
 =?utf-8?Q?KSnEE0FbsTMK9krC+TfBqRfEd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e64b95d0-1307-4fef-5ed4-08dafd59cba8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 15:52:13.8478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: exhMQf91ChY0UydwkJT4Yj69XbLfppa0WJp9DGpO+dMaqS+oX4I1QZM7uz+Q6G9tkvOv2CwM4wz7gFqq1JmLPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8932

On 23.01.2023 16:47, Carlo Nonato wrote:
> Shared caches in multi-core CPU architectures represent a problem for
> predictability of memory access latency. This jeopardizes applicability
> of many Arm platform in real-time critical and mixed-criticality
> scenarios. We introduce support for cache partitioning with page
> coloring, a transparent software technique that enables isolation
> between domains and Xen, and thus avoids cache interference.
> 
> When creating a domain, a simple syntax (e.g. `0-3` or `4-11`) allows
> the user to define assignments of cache partitions ids, called colors,
> where assigning different colors guarantees no mutual eviction on cache
> will ever happen. This instructs the Xen memory allocator to provide
> the i-th color assignee only with pages that maps to color i, i.e. that
> are indexed in the i-th cache partition.
> 
> The proposed implementation supports the dom0less feature.
> The proposed implementation doesn't support the static-mem feature.
> The solution has been tested in several scenarios, including Xilinx Zynq
> MPSoCs.
> 
> v4 global changes:
> - added "llc" acronym (Last Level Cache) in multiple places in code
>   (e.g. coloring.{c|h} -> llc_coloring.{c|h}) to better describe the

Please can you use dashes in favor of underscores in the names of new
files?

Jan

