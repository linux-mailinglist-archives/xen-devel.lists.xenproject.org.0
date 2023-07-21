Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55575BE13
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 07:58:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567341.886249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMj9I-0004xn-6C; Fri, 21 Jul 2023 05:57:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567341.886249; Fri, 21 Jul 2023 05:57:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMj9I-0004vV-2g; Fri, 21 Jul 2023 05:57:56 +0000
Received: by outflank-mailman (input) for mailman id 567341;
 Fri, 21 Jul 2023 05:57:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBlW=DH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMj9G-0004vP-NE
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 05:57:54 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe16::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87a9e9b0-278b-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 07:57:53 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8682.eurprd04.prod.outlook.com (2603:10a6:20b:43d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 05:57:50 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 05:57:50 +0000
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
X-Inumbo-ID: 87a9e9b0-278b-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbVlv1r75S+DpECCnV/Ou0jNmTPE1fhUGSx9FaBzZ3BT2bhPkDyWEiw/21RjW4L6r9oWTos9jzdoRsmMhl+J73kbNU+LOCdQLEyDK0muyV6zN8h8dP4gDI0cOmUHdDuhT/Mcnu8TSzw+g5ky9F2VTY1bPBPnyA4KsKLdEVCacrtCXc2LrYEXbXGHd7Fd5lRRMGFkWDzXDhUhT0TcHpCKSctuaa8mW9A/X6sUrI4UoQ0+x87p+OUUG1hYcYeP0jjWnDu6C8Hozr6+u3EcpeYlLgTMXtQckCrXFObUWGuO5hAviu1L0hERlfw9csdKaUHDA6exvnn7wRSjnwRO31NGWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RKzNKUcgt5uxUNRKvjbWiQ3/p8Fq2It+DQgky1Xi4k=;
 b=f9t7dQj8e0OoThm3TWbFLK3wH9REUe+Q5ke1wOvjOMsjVIfujC7+XPIVFIW6nEChSM17BO9MExd3He3nr2yPB2OLKMdumqI8fYRpTcD1U9NNPAgiAeRiuodqqqMBzsaF+ARjDG4wVuwEx4Y7Yyio3qN8sfA9zWyFXxgh+lcqpClPzjlAckNgcuLpzNEC0KBJb+oLpPso1+lKR96/0fLgEgkGVbbh/33bdWgCgVfcIEiLlZpdDNkcKslPpdSkmcXSZEaMzy3whGMFgZiBZ768GmI5WX01a5Xd24IMnQ6HsjAs6ZeL7yDdlklU9aBObZxjcdjMygUOiH/C1oJ4O1IRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RKzNKUcgt5uxUNRKvjbWiQ3/p8Fq2It+DQgky1Xi4k=;
 b=i1hC8tJy/KDoBH8BS36/eB/QXBleM7Pj33l3Rs8VDIbhexd90cD+R0CU1vJZY8WxsFV5uwmWs0VbZbRmRB+4upH01MYQbrogSYzP04DRtzcIP4YqOxnDbk7BSFyScA0IWquGVc+WI0ylJV50Xzbu/Dl5tq2b62as9EVYl2wR0GXaNZxgkVHB7Zpr3MXoNwofFvAJrRLyuKmc9a2H3XeJN6nSNN2QiTxwJ3ghKBNrN20ydYtuoeNOphp9kRwkDSZ+TgbsFhEaXRhuntLgRsZnIEXbpscKA0fKqFGRcE0SAwfqvWyhzTBDMOXKYYXevBmjREqSL0LL8bab4o1FwYSZoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d93c3c89-3332-da3b-9a0d-3ecc4742ba02@suse.com>
Date: Fri, 21 Jul 2023 07:57:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 3/4] xen/ppc: Implement early serial printk on pseries
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1689710519.git.sanastasio@raptorengineering.com>
 <7c416ff843ea359bb24b8c954cc079fe1bbaf75f.1689710519.git.sanastasio@raptorengineering.com>
 <6d3b7cd6-7d6a-8d28-f1e7-7e939e393445@suse.com>
 <596297da-a335-6463-a9db-982f649f7183@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <596297da-a335-6463-a9db-982f649f7183@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8682:EE_
X-MS-Office365-Filtering-Correlation-Id: 857411e1-e08a-4445-10a0-08db89af6a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5hAR0JmzloMoeLmxfmtAZSnAlEMHzpIVX0dBijUJAXQai2FliKY2n5QuS7M89QmAdNAGVeZ3lvfnV+YIh5nb7uBuVn7OD+ZRuehy4oBcyVAdFJt6S7Pjc/PatAN/6FYrUqJa2ox6GosxdfKbjvvC2RXzBjiDWcMwqk57OPl3DMupYbSOVmqnPBSrpfJbPNyVIlGFF3accrVgmbtfxbRKpUH4WhLq5k43IOV899BlGzizGTXexxo/2MecqbE0zwK7VU94HdbO7AfeCq47IZ18LgR93avGuZbBgHGRoowPQK+pchRQjKi8lTzV/mSb+L9ulD0dYf2kkCmfqWKz/JrZJshMpniElmUpmSVo48NmgRmjx909E5dkhmNyw4PYQoipnSN9yfuYwNQQsTbFbrw3Fp+KdtjThMF4dOpdMu9h6HjyltM9nM74+Iz6CDgEDmn6H9bxfV7jsWNjn5uVEpuG2Yj/e0tUp4kPBViO6BmiW89qF6KduuV3LakjN5U7ZrRC4jbPZB/mL9t0vziRe1R1+CB6VH84/p6wA7CJZva2bpywn5YcjsoFKV1VBfHGa4GWemB2zG0NnykMhLWyOHencVVwDzXiqszFUdNRfaXZIIRhW7xmiTohLwBnzLMUMEnfCM/pSwHM25xoNU1e/1mGMg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(6666004)(6486002)(36756003)(2616005)(83380400001)(6506007)(26005)(53546011)(186003)(6512007)(316002)(2906002)(41300700001)(66946007)(6916009)(66556008)(66476007)(5660300002)(86362001)(31696002)(8936002)(8676002)(31686004)(4326008)(54906003)(38100700002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXhmeWVWSWlVUC9RVGlBNUNzWHo5QkdTSlJub0ZhdzQrcmt6aDgvMjA4KzNj?=
 =?utf-8?B?RTRCUS9qNXluQTd2ejZuamJlOWpuV2Y5R0thT0pHQ2IxUnRIODJFMC9wYnpj?=
 =?utf-8?B?dVJsSURMOVZSK3RPVERkeWFaQ2VFSFFpTEhYeS9IRHQ3SVpkVEo4TGNqRnFw?=
 =?utf-8?B?QWNKeU5uK2JzV0d1d1AwK1FpNW9VOGE1bURmbGRSa2g4c0FySUxMSjNOOEdl?=
 =?utf-8?B?UVcvSUw2ZS90SWhsVDVwMkRacnRUSFE0QXorTUZSWE83YW01dTN0aG9yaGtE?=
 =?utf-8?B?dTU0OXcycFplSzM1ZnBrVytOMlF1eXpMZisvVGtFaVNFQklUdE9hT1JCYWJ6?=
 =?utf-8?B?RGFLd3FvV1c3VHl4ck16SE1pbUNRM01QZ2gyKzlLbFFCS1lSTU1DSGIyaEJ5?=
 =?utf-8?B?Qk1PaUxoS3RxMzNORWx0NW55MTBTNUZsdkRZN1JPU3pvbVJORUdMUzN5emRv?=
 =?utf-8?B?TC9vRXFyK3ZwTW1lTFRWeFF6SGJPc2ZIakFZUEx5TlJETVZ0VXJQSEtGc1du?=
 =?utf-8?B?RnVvK0hkZmQ4STZ6czYxNkxkQUgxcjF3UFpLTzBBSUV4RklSVGYxT1dUQkJv?=
 =?utf-8?B?clZIMHBlOTRRdTBTZS80VWlrM2lsbnZrZTJmdWV2MlBiU3RVUzlPbUIzdFhw?=
 =?utf-8?B?bFNmakRMM2NZZktMUVZiaHgvRlQzdGNWL25PMk1XQ0QrMGJzNnhSV3UwdmV5?=
 =?utf-8?B?U1J4TEdnelNhV0RBNXU1YjVmMUx2aUk0ZldaODhqbDFHbnM1aU1zSXl4Smcr?=
 =?utf-8?B?K2tGMFBhSE5seEYyRW5Nc1Q2UnBCa1FXZVpQbVA5UWFMc2V4S3hUd0tnSU01?=
 =?utf-8?B?enhjdmpEam14L0FPMTl4Y0ZGeVN1L0JIYXk3RVJqMmRhYXBTUjRkaDVnY3ZH?=
 =?utf-8?B?WkREVisyOEZxcHdPRjEvSitWWERrQUp0UkFGNUdQTUZmeXRJaWFwM3VOYlhF?=
 =?utf-8?B?cnJpTXFjNms0K2ZiVytMaE90SHdtOThqZFZpWFVPTytrYWEwSm8xZlk5Rnl2?=
 =?utf-8?B?REl3QzUyYzZ2T3BUbTRjbHJoTVR4enVNeTRFVU9CWXlYTUdvUlY5WFZ1ZHd4?=
 =?utf-8?B?WkFTUmNpRzA5YXRmcXlvSzlxRDcrZ1N4MUVvaDZ2R0JFeW1PenhlRW1BOHpT?=
 =?utf-8?B?c054SXBJbmxybDN1Yk1qZkdJTkNFNUU0NmJKK2RCNnZQa3Q1ODg3NGJoZUVD?=
 =?utf-8?B?RnkvRklTcE5rNVFnNWkwVzcyczZSSVBBNmZBYXhDSisyR00rL0JWb3pHby9k?=
 =?utf-8?B?RDl5RmJ4UlMwZjFVTUNnNkVJSnYraThDV1dSSGJ3ZTZaczhVNGc4ME1DcG83?=
 =?utf-8?B?UDV0dlpnS2srbXgrZnUraVI2aXV4dGh2eldKcFh6ek1CQzl4cXUrTVFqYVZP?=
 =?utf-8?B?czdQVU9Hb0VHblRnUWp0d0JPV2FTV1Q0ZlE3UkxxNWtVUVhiR3hMM04xQStS?=
 =?utf-8?B?T0VoTk9EL0ZldThINVRUd0E2Tjd2OGxaTTVJYjlGd2E4eXg3NThwSGdQOXQy?=
 =?utf-8?B?V1lhSG9BOUR5czNSRHZlNnc2RnRkZjE0YS9oQU1aTlJ5enloWVRYdUxteFFP?=
 =?utf-8?B?b00xbFRvQnlaNUNvdS84eTZHZExlNjhnKy8xMlB3SGV1MnRWT28wWkFFcGtu?=
 =?utf-8?B?WjVyOG5HVklhYkJJcnppSGc1TS85SmlYMlVXUEJ5dDA5TmkrWnF2L3FwNHI0?=
 =?utf-8?B?Q1NRdjltQnVNdG5XbFdIZVoxOU44OG9HeGNZMmVrSHozYUlUdDdxU2JjOGFz?=
 =?utf-8?B?V1N2MGlIb0ZFU2xOUzZnc0tFdDFRSUZENldjT3NmTGtVc1NtSDFtdncwOE81?=
 =?utf-8?B?VXorSzNybmdSQjdDSEZ2YkFVSmt0Ykpac1E2ODlVcEUwQms3eWptbTBadS9X?=
 =?utf-8?B?K1dJMXV0NmU0dHg3TFJNcHhzaUFPVkp5cG1FOTdELzMwMExtUE9GR2FkRE41?=
 =?utf-8?B?dm8rV0tRa01reEZGNWRtQXIwMVdwOG1INWE5WmNEbTc4eHAwcDljVHc0TnNU?=
 =?utf-8?B?ZXlsdU9mbWJRNnlUaHd4NUdOTmN5Z0dFQnBkZnZRckxyZzd3b1V5VjhKOU9s?=
 =?utf-8?B?aGRycDR0cHJTZXdPRkRqU0plVnZ1WUFxMEpnUW1YUk4zTnJkRGVMZDU3QUVV?=
 =?utf-8?Q?0MZTEsUjeyQVGIPqcCWL8aWNd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 857411e1-e08a-4445-10a0-08db89af6a55
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 05:57:50.0848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zCKVbIwJVx6GKnITPnYf1pwuwPp1vuOwzULOeFgcIK+AN94NElZQLhRmtkboxtZlkwUn1hOpAYbc9F4wgH1Maw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8682

On 20.07.2023 23:01, Shawn Anastasio wrote:
> On 7/19/23 9:05 AM, Jan Beulich wrote:
>> Before you/we grow more assembly code, may I re-raise a request regarding
>> readability: I think it would be nice if operands started at a fixed column,
>> unless the insn mnemonic is unusually long. Where exactly to draw the line
>> is up to each archtecture; on x86 we use 8 positions from the start of the
>> mnemonic.
> 
> There is quite a large variance in mnemonic length on ppc -- many common
> mnemonics only use 2 characters (e.g. ld, mr) while other common ones
> use 6+ (e.g. rldicr, the mtspr family, etc.). Enforcing a column size
> that's too short would make the longer mnemonics look misaligned and out
> of place, but using a longer column length (like 8) that can accommodate
> most common mnemonics adds too much space between short mnemonics and
> their arguments.

Common length is 3 on x86, and as said we use 8.

> That said if you still feel strongly about this then I am not strongly
> opposed to adding an 8-space column alignment.

I certainly think it helps readability a lot. 8 also matches the common
use (fair parts of gas'es testsuite, Linux) of hard tabs.

Jan

