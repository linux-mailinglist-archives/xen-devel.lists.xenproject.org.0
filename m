Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B0651C40
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:21:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466558.725452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7XsW-00051v-FW; Tue, 20 Dec 2022 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466558.725452; Tue, 20 Dec 2022 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7XsW-0004yp-CM; Tue, 20 Dec 2022 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 466558;
 Tue, 20 Dec 2022 08:21:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7XsV-0004yh-4r
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:21:35 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2074.outbound.protection.outlook.com [40.107.8.74])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 504fed9c-803f-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:21:34 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 08:21:32 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 08:21:32 +0000
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
X-Inumbo-ID: 504fed9c-803f-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RW2zbu2YPEY4LrgWl5edc0DDmGDSP/i3dZhidpY8PljDaphnUPiVjbbLZXC6wWMg6nVI710BUez4ZBKAb+4HCej9ufloh8pjD2jEcRanEk15asKTSEuWnim1q6vahAVwUC9VWmmJSaXtF/8NmCpJN2hskpxhmjQ35oWSkKUht67NCg0ocSBrixSVftZnkLkqd0B5x7w2GuZ4FR3qFWs79uuh9hB3vNq4raoGg8BkgSnMNSFikfdyOy7g33nYYEfxco+KXfn4gaYV1GqeGBS1DsDlr28zaDj0cHW6Jw7WNaUfGUaWI+3anWbZiowdW43elraH9kulTgDPPGMaIn8Y0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pi9VGS7s4NIxT8qaknmJrskqXWDWJZzaqJmKN3pSUY=;
 b=TvNOPhDKFTWTvR9o08aUu3WUjCtY4UptuKVOkbj/Mzfk6Pvcw4mgDM04AZlxLUGh9reEQFFGy5msIIJOZi+2Vu3KqeudFnRNzJU+lsf2zn6Co6blVcFgEkGruHk571eGbHPEt9jA2sJqOFE4bINkUs4i/j1Ve2teiSuJK4bf1arogUlMbz6tZyg/M2I7BfC+GePalshsYrHHgPS8i8MPJplSILl7EQ/GhCrZSud65Hdt/k4whZlJIbshWHxp4q87uvaBke6MDYjM8E3m15I40qc6JCvkScZO5Yqfkc1Q32jCQKerPSzdal0NQDh7yH/VE34vtkT93paSpkCmsiZj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pi9VGS7s4NIxT8qaknmJrskqXWDWJZzaqJmKN3pSUY=;
 b=y1bJj61sSusHMB+heV5ZRkkcfDcBO7BnK7m81w9jQSn9B8o3nKHGUueGzFH9zIDeX7MxWhFjmTPB1fOiE52aV2VjHRL/cGg91Bd/zWsslCWSlyPZY1IrS41ybJm/Rycbk5swxEMfOpAVe1ay72SHWex8nl1Nu5gwBtMwQg6LeYKmYzfkoeR7lXTfnIMqAVB2PELGf8uIlM0UvNX57boPAPznrstPsToofF16laLXJrdQnvZh2yq4UvUdTA/UVLzbYuDXTTvxCNzrLMNrAIQH0o48aAB2OyrqTODr78WtInJNWjDv4EGZuvc17i7OssDTSLHTI2gd26QwprihR979cg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f2780958-26e7-ad23-8e9d-ee09ef2da73a@suse.com>
Date: Tue, 20 Dec 2022 09:21:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 05/10] x86: Replace EPT_EMT_* constants with X86_MT_*
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <4b5f6b6bcc4ed00db6b5f4c6def68606c190a74e.1671497984.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4b5f6b6bcc4ed00db6b5f4c6def68606c190a74e.1671497984.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0081.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6291f0-3073-4fff-4fcd-08dae263337b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bpBtnv1/nSefpgJ+gFeoAkDhk+A1mdJ8B68+IEiS60VuoRVbxQXQZHBSIDxaqffV1dnbMx8+E5SEJ1UNEyOXwiEBNUwXXewu2zKFaHon0qSwCrn8N+3qZ7FU18ruoy0C5nZa1Y2dQTOuaYHUwdaTfqUhkq6UM1ptCA4X6g7Yh4Za1td15wkPNBdbV0XGF1ck/mOR9dgExtvFHLQyvfV5qPTOoSKjvC1UjlpQXKNLE/x/wo12pZjoI4BuXiaMegdujnzOuHsKjclZt0uc8BkD3UbRV5cNTbx137st5PlDniG5H5wGAlUmB5P4vxN/X4iCygUOwdNwQazVtppjFR7MIvrKsb5bSQTJFTlN62AC++hFfF/EDDZme3TTRFRpbMIvSRF1Nbg/THeFN/c1XlmMS+/zSBC/hlyA0QmN+iaAPT4zMWu9Cyv46iO6KejbVJeQyhLqYL6mOZ+CtyL4D22qxjlkdAZowIR4sMfVhwWDJDHhkvbnj/HtzGXzQJe/BWRyIjpPyPPI+UpvFFkc5TFIcUDSx7zCzGVOMBs/3IaMqelBA+APlIn3IQ9PWc15+6zcp3/g9HGEbznUG+/I6WKkS3fMg1Z6i5Wul+zARZ1AIEEAd7mWfYoTminDKiD53ut8gvJRHSDQDgj3sUaIBsbesD4PCuJ2gJriCC+KRZHc+NnQX90GQXuf82OeDB5gNqjJX+OelfwXCPsorBfsJzril/OKnOw0kv9X8Z+ePtrv4Ss=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199015)(66946007)(66556008)(31696002)(86362001)(8676002)(4326008)(316002)(5660300002)(66476007)(36756003)(8936002)(2616005)(41300700001)(558084003)(26005)(6506007)(186003)(6512007)(53546011)(54906003)(6916009)(2906002)(6486002)(38100700002)(478600001)(31686004)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1JGQzBnRmlWZ1VGbk1LOVlvT1VwOC9iTGwvYm5XRG1kcmtFTnVFcUU3Wk5r?=
 =?utf-8?B?cnM1TVlLdzBDZ2VPc1RiLzJIUi9wVUJMOXJEdDZSN0VwakVJblBDNHd6VTNJ?=
 =?utf-8?B?NzU2dVROK1QwNm5PV2hkTkdWdkd3aW1yVnlCendXa1B1bkxZLzBtdlc3OEhy?=
 =?utf-8?B?OTdlRHBIeFIxVnF4UCtvL1JoUUVkVjM5dkU2L2wrRGtMS2lFRWJXaDd2eUlM?=
 =?utf-8?B?TFBYWTZiMHNYcEZabW5ySnl3ZTZqSnlDbDRERFBvd2k4YklTV0QrMSt6MThM?=
 =?utf-8?B?SzRzL3NEZXJwOGNMUzdSRjFyV1NuSWFaRDJKN01sV2hqRGJLL3YzSHB6OXZw?=
 =?utf-8?B?ZTRUYUtTMUJpS1EvR0hWMUpFbjRnNFM5UmgrRC95ejN5TWtVR3NGVG5HWS9h?=
 =?utf-8?B?MW1JM1VqUFFWVXZQTWNRU0N0S2xsT21wakxvRVkrTlZyZXY5OGJmRndyRzYr?=
 =?utf-8?B?aUFWQ29rSnVjTjlpekhsZGV5ZDBwVGs3bGtlOVVaU2pESUFJUjlpTEJtbmJ4?=
 =?utf-8?B?NFNicncvMU4wRms4cFp5L1lXRnRZQkFYK3Q0QmhsbGVzOVNsVk5LNG1yOTUx?=
 =?utf-8?B?dTZLWW9MSzg5OVk0SEtOOGRQQmhFTzhzaUtDbG9mTmFINmRscXp1R0VURlY3?=
 =?utf-8?B?aUY1TkI1dGZ5b0ZCZ0FVV0JNMmdxOERUVGoyOWQ3ZyswQlc2b1Z6bE85dnpy?=
 =?utf-8?B?czFsK1l2ZmZuMmVOZ1B2MUxHZHB3dDlLSjJ5a1d6eEJjMndNK0lFMGx2S1hJ?=
 =?utf-8?B?N3k2TVdZOVJnWWpTR1lxYlBhb3VOVUdsVmlBcFcyMTlDdDJzc2VaaHVNdVhP?=
 =?utf-8?B?OVY0bkhEU3h6ZE1lMTR2YmorM25Xbko2TVEyV0craWtMSUJKWXNnbjFydlhG?=
 =?utf-8?B?eWNDZjJ1aEVoZ2MydmtBdXRlM2c3blBDNkdXWklBUEFVdTZTdEpwZnRDc1VZ?=
 =?utf-8?B?K1BaSGdhWkF6cDBFSm5XandZOWRETS93UFg0bkZKTXoxbk9CYWcycUh0d25o?=
 =?utf-8?B?UUg3SWZSWWtZTDdCMWZ5ZS9CSVZvVjdPTVJTczBhYmFKTGZGck5xbkltUkdi?=
 =?utf-8?B?bHF5bWgwMUdXcmVFL0poOVVsMjlaYmc3N2tFUnBNSTdyVzlvNnFsa2pYdUg5?=
 =?utf-8?B?ZHJDc0xuSGtYYWw0dm9kQUNzY1dMb29yYk8yaDVSb2lTWGlFMXZaZ3pQaC9h?=
 =?utf-8?B?cElNL3FnL1gvQnpkekFzalhIbldSY2c4SWh3KzV2bGtnMWRQQjVJa3hXb0hl?=
 =?utf-8?B?RGQ4Vk5kTTVBYVdMSXowK1ZkdThmOGVpMXNEdHNSRWM0K1dGZHRxQ29Rc2JY?=
 =?utf-8?B?ZWdEcER0NnZ1YTNYRExCeVBxY05vZWlkbWp0Y2xrREFzT1p1TFAzZGpiWU01?=
 =?utf-8?B?SFpUaXFhbjRVSFUwUCtiQXVhbHMvVkZyMGNzaHJCL3NBU0VVZ3ltUlV1QURh?=
 =?utf-8?B?d0wwRUxsUTMwRlpibVIxV0FmVmJ3WnhxK2lFdzBMd3RqazFKV0hhYjZvejZk?=
 =?utf-8?B?bE5NTDVtOGsrcDNiUml2ZHROK2huY1lpMXp5Uy94eFJic2xHdzNkdlBYU1Qy?=
 =?utf-8?B?YzN6MG1hTmNiZGNWZUl2WWYwQ0RGSlJFR1ErVVEzamNaUEJBckxQamM1K2Jv?=
 =?utf-8?B?SmFqSmRxK3h6YzRjR0xNWDlLTXZEdG5oMkxOZ1g1RHlaTFltV3lyMFNFNFQx?=
 =?utf-8?B?czkwSHQ5WjlIYmhsZlAwTFV0cVF1Q0hUMGlvTEhidExpai9kODVySEJZWGhy?=
 =?utf-8?B?dkF3eFlWZnZzUzR4dndsWWloR29YRFZzT2RnV3dudjVSSEZYWXBneVZWMDBV?=
 =?utf-8?B?WlVZenlZN3FrK1Brb29PQzN4RnNzdGlQQU52c1dyVnBud3ZHTWNJeEVLNTNi?=
 =?utf-8?B?Tk5rSTJRczVlbUhMRFlxSlhrM3UxdU1XRGtTRFJwS09yMjNCbEt0dEVIUm9o?=
 =?utf-8?B?U0hZS2tya3QvQVhzTm5FQ0lKRldYZnN1czRoRlVWT005Zk5TN0pTd0R1Rk5X?=
 =?utf-8?B?d0t3UnlFWnF2STBtZHhnUStJdEhSQW1GZGh4WWhHVWFJMGtZYS9XZy9uKzdq?=
 =?utf-8?B?OTQwNTNEWHZGRXE3b24zSngvcjh4a2RrQVcxZ0FVZFBPTW5aZlVFL3ZTb1lG?=
 =?utf-8?Q?FieiZNIc5T5+gxlDJeEd3xZ0q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6291f0-3073-4fff-4fcd-08dae263337b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 08:21:32.0799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANs5CFO03q3dFPAKlzrF2E+jCOZqwihMQWNpQ/sJ67F5WxYQeF2pYGQY0K1imG3vrD8lttwLlMtpRvKta9HmVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800

On 20.12.2022 02:07, Demi Marie Obenour wrote:
> This allows eliminating the former.  No functional change intended.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



