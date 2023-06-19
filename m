Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F27351F4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 12:25:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550978.860234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC4j-00067D-Ts; Mon, 19 Jun 2023 10:25:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550978.860234; Mon, 19 Jun 2023 10:25:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBC4j-00063s-Qv; Mon, 19 Jun 2023 10:25:33 +0000
Received: by outflank-mailman (input) for mailman id 550978;
 Mon, 19 Jun 2023 10:25:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qBC4i-00063j-7u
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 10:25:32 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e240df8-0e8b-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 12:25:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7179.eurprd04.prod.outlook.com (2603:10a6:10:124::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 10:25:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 10:25:28 +0000
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
X-Inumbo-ID: 9e240df8-0e8b-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyiZ+pXtZHqUChCNqxPtpkks2p7+H/djIzeAAlNEnqGxIzCQ2siJfC8dkgutzpGAOvYwFzRLsYTnarA6sDXg9qeqtCEQQb7cU44jww277qIzYxq0pmVTFJt9DxGmB1XFWtX2+WszxpckT+mnvfD2CpdVFhPSmGnvjArdiliBYx0kZh8bLqJRCKskpp3ekCApCpyUVU3AOxvlwKosIVN+ZjSbborVZWZSgp9rWndhDw0xdhHgqTNOQkskQ4NAj9cv42ruqoSnj4RkoXrh5LZ+Z1zBTiA66LgRZ8AWpIDxfalKj3iSfUZjWyhw2ShZNDoCqQnPGHMXVAsf7OqZmW3lLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RZiue4tyCz/IuwJ3bezgBtWcpA0yXae1luhd1RcdwU=;
 b=DHyFeCiN/OFJ8XdNHxb0Ke4Ive3sZgj3Ea4fs+evB6ROoze23CLLxCp45pMlestt9UENqlRj4DRV6CdwCsmMhe3ev188MUJZbbGPizdBJ5bQ+fjy7HMKvVs7pNGfBzKMQDs09o3jFyXRNyqjqfhQku+68FAsQyk+Hk9hS5yTMEutNenBbS23ek6KbSZ4MXUX3VlMpVYxxXsqkz8W3YOPKdOSshFdC5xI8TJ0KcheXH3ln83kMPVX494WuFxIaQjQnPjjuh64JjOkcF2hZpozi8QEeZr9waHmnAQTwiHYrnwRTqQkspgPrcKuT8m/S5bmAax4tDWan7OQLRRwJw05aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RZiue4tyCz/IuwJ3bezgBtWcpA0yXae1luhd1RcdwU=;
 b=4xev8gEivYN2NC0l9/TcRjm2f9Thg/qgHJKCFCbLYkUQzchAktX8ZveDXRlDGIOS79sdPetOpwcPLk69uiiJxzSMeyFUw9CgPstotLB4v6lS1AGUXWpxBwoXfGjxz3vZWqO0eFoPF15fK7If8ZIH3VSaGnK8Q4OCCQo0NCZaAyODbbo/0u24gtx0UlnD5lUzbmuqZ9o7fXqi7S4sPcfxa+JFgvICqpx6/12/XCQcNTaAla9kgEuAI+dB7agEMVrqa6n3j7I9US2NcwtRoG/RpbUzofp+zNy4HOMAtyRmcq13QEr+cytUK5MkTjxOgFwgXn5rPfRh/TK9dJJfZvhUoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e6cf2ec6-070d-1c8a-9273-478cf5587d9c@suse.com>
Date: Mon, 19 Jun 2023 12:25:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <cover.1687167502.git.nicola.vetrini@bugseng.com>
 <e2b7f377d1467833d9ae2cd897c962561e54fb02.1687167502.git.nicola.vetrini@bugseng.com>
 <51501199-80e6-e33f-e70a-7a36d26c1894@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <51501199-80e6-e33f-e70a-7a36d26c1894@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e2bbdf-1e4f-4be7-f90b-08db70af80ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lv/3BO9lgJmJUckxUzwLu4FM+yR+Lb532IuuQ9V/DLE5T0xMltbuG+dCV6BedtP5S6jjml1edWZcSqocIhcsA7KFuw9uRQbR/Lu9nFLqnAGrirbfiFfWChK0nLBuH3cHAKnBp9i7IR8a8dqI+SUbq1m/J9XWhNbmfx1FYoN34RBUxg2YFd2dwp94zLTkSbv5mvvA/U39cYCShhsfxrWCf8HOnt5TSqUF8TkdQ25YsixRl+amXY8+u8777JHwMx0Xwky5M3ogmOQsTK5enRc0gvuBBlmASyYat5gopik8C1EtE1uDoBBTnO6u6DBztf/JVNtTjWFTvm/JenJ0zhA1ruOwbyT5PPluMpKQAUVgrpceKRkBtEWi/KJZTOdqg4Y/bmtPiSqQ3K+49Bp8n8dXB9rTlDYvJkZaCM9LQTwk3F9SIskwdtCCkgqEnlgiTYOC1sFTA/DeHQLUY9HDsghgH06qO4O6uOVd3UCqLPqJc21vi5/3cEptMt9i10SS3zWYVtb/3cVa3fa2STRk90h9VQBZVoaMLUojAHHUk7QiaCEp8ssTTWQKLuvO8gCfeuJReBazGs4f6RWufMMSNPPq2qKT8lQdKfAIzRHlQyuFqq9qhLFj2/k4HXCSQc6XdzWTAtCQyAZocjC5BMXaqPSncA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199021)(31696002)(7416002)(31686004)(83380400001)(38100700002)(86362001)(8936002)(41300700001)(8676002)(5660300002)(6916009)(66556008)(66476007)(66946007)(316002)(2616005)(6506007)(53546011)(6512007)(26005)(966005)(6666004)(186003)(6486002)(478600001)(4326008)(54906003)(2906002)(36756003)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHZacjVOd3FONTRRdDVlMlhSRVhxSjd5VzFTa2VsZEtmdFM3N2ZDcG9yRkhG?=
 =?utf-8?B?YlRYLy9JYTJGd3BiS0pVZFY1d0xSS2d1TEY4VjY3L1FtTjc4UHdPMytMMXl3?=
 =?utf-8?B?eFNtZE1nV0pJRGpyeVZRaG11Z2hWY256ZkNvaGUzOXVKSStHYkgwZDluWHlR?=
 =?utf-8?B?Z3Bka2UxRy8zdVhyZklHdWo3ZDBMQWJXeFB0R3c4Y1BiU1JzR1JXRDdtRjN0?=
 =?utf-8?B?M3IrVGE0SWpnZUo4NXpwSDRVQjUzQWorMGRub3RnRTJ0NHQvUlVwQ0dEVXJp?=
 =?utf-8?B?bjN4aTVNL1FXUEVESVZIMUE3VXd6T1ZtdnJ3VjZrRGNVeG5DN1VpWHBtUlIv?=
 =?utf-8?B?WE9kdVBINTlmVVRta21KaXl2Tkd3NHhFS2VNS1dRcWQvT0VmL3JhZ25OS2Fl?=
 =?utf-8?B?TEJha3JYbEhaOW1aSTFyaGtwVnlFU25NUVQzc3huKzFEVFpJMEU3bVRLaWRq?=
 =?utf-8?B?b2pmMWtISWtnMFZrREJlU2FmUzloS2I3RTB1ZWl5aE1BN3VtampTSDRPMVp6?=
 =?utf-8?B?R014WXRQSmRWaGU4V0I4YWp0b0ZkWWsza2ZmeWtHR0plYTVjNEppN3dXSUcy?=
 =?utf-8?B?MTljSTh4WVRLKzdZR1E4TE5Ibm41bk9zVmRSL2V3dW9qL0orMjRqTW1VN1ZB?=
 =?utf-8?B?UWY4cUdFQ1ZVWENmcGdlS2FNYzFicU9Za2YrNUZlWmMwWkx1S2tvbUxzNHhj?=
 =?utf-8?B?cEdnOFc3OFBHMkVkcTNpN3JDU2RzMndXUGt4OTdMWFVNcWN1aU44TnJVY1E4?=
 =?utf-8?B?UC9PSDlieEk1WE9tZXUxcld6a3poZHR0bjAvaXBRU2g4SDlaOWZxOUpSTmkx?=
 =?utf-8?B?TkhNSG9QSGY3MHdWNWhGeWtFV0dLYURRRi81a3AzRk1CMU9FNkYrTml4aEJn?=
 =?utf-8?B?NFVLT1BXTmZ5RVVBVVkwc04rRTExcEVGa2EzTzIvU2NVVFE1N3ZzamJxcmtM?=
 =?utf-8?B?cWIzNVdxUnFkOFhZMllIS1B1VDB1TndmS2k5bGpmQXRaaFkyRFh5b0VJVHBF?=
 =?utf-8?B?N1lTeXllWGV6Z3lMTkZtY3oxMjNtdS9uSUFLcUQ0RzFYenduOXIvT2xEV0Mx?=
 =?utf-8?B?eDgxWXgwY1V3TGpPSUsxbXc5LzMzVDJMZGdSTlhCWmNpcE9hc2lqQ21EK2po?=
 =?utf-8?B?VGs0ZENTOUdlQzV2ZzdxQ0RobVJ4cC9qNVVLd2oxemJQWXEzQm5vcjhYQk1O?=
 =?utf-8?B?UG1CbHNid3FJRitraW9QZlVTcnZJcXQwRUdHczl4ejlFWjVVZXZhNUdLYTVS?=
 =?utf-8?B?T3dQQmZhcExGZVNsQStlYTI0bUZwdXQ2eHZjWXNNVVVqWEdUOFc4V0dWZU0y?=
 =?utf-8?B?WXEybit5aDdCSGFSODRMWjZWZG9Ya1VxclBUYUluV0RSSmI4K0FTSFlBdEhx?=
 =?utf-8?B?UlFjcFA2R0lCckVrQzNodnpRblN2cE5tZWJNUzJlVkJXQjVPY00zbThCWG5l?=
 =?utf-8?B?WnhaZ1Q0bDRlT1J0TU56WmZpOWZ4TzFCREZMTkVVWk1xMlB5YVlrTCtjU2dk?=
 =?utf-8?B?QnY2aHhNUUVOZFo2cXVSdjFXMVRHZmlCd3BHclRZNE52eVp4UVdwVUtBU0Ji?=
 =?utf-8?B?UHlwaXN5dVRPSHB6eW5LRXJrNzEzV1VNRFFFWDBjdVNVY0lJdmJ2aTFFNFR2?=
 =?utf-8?B?eTdMa0IzY3pDOUNqOUtwZW9TZVNyc1BHLzMxMDRyenErc01Wd01mQ0x5UVdl?=
 =?utf-8?B?YTNrYUd0ZzViT1dtNzFLUWNxaGxUQTFmZlRZUkNNUHVjSk15a0w5ajhUeWQr?=
 =?utf-8?B?S3dKVllmbkFvazBoT0h4L09ScmpGYXZFcWFHQ1lydVJIQ2dzZ2E1K1ZXWDVW?=
 =?utf-8?B?SGU4Smo3c1pLSU82bi9kZ1NaSnhJK2g4YUFEcjZvSWo1MDdxOGdQMmpQaUFh?=
 =?utf-8?B?TXk1bThHdGVVOEhXRTlaK2pra1Bxc2RUdTJWTUhTRlA2clY3R2V6N01mRFVD?=
 =?utf-8?B?RGVaUERSRlJJNk1EcE50UHAwamZOdVRrZnowMXRJZE1TQ3V2MnVXbFphNHl5?=
 =?utf-8?B?cTNPd2MwbkVRVGRjSng4YUFvcUpxMm90c2VSYjcvcUpXQTIxay94SGZpRXdF?=
 =?utf-8?B?TzFobU9iNjRXLzlBblE2WndaS2JrL2Nud3RWbGUzeUdtc0xwWE8xODdLMkx3?=
 =?utf-8?Q?7YvzOFszPqTdgO24y1qJriUPe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e2bbdf-1e4f-4be7-f90b-08db70af80ae
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 10:25:28.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz6u4h38vaKCWHgZE+vJBSuxOiPeRGVKTdfRvnlugaN9S6LoUqE5UXdV7iv82CX9nGgrQosFIIHxQ09d9sPreg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7179

On 19.06.2023 12:01, Julien Grall wrote:
> On 19/06/2023 10:56, Nicola Vetrini wrote:
>> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
>> few occurrences of nested '//' character sequences inside C-style comment
>> blocks, which violate Rule 3.1. The patch aims to resolve those by removing
>> the nested comments.
> 
> As I wrote in 
> https://lore.kernel.org/xen-devel/f3fc1848-68ca-37a1-add2-e100b4773190@xen.org/, 
> I am against replacing '//' with nothing. I have proposed to use ';' 
> because this is also a valid way to comment in assembly.

Are you sure about this? For gas most targets use ; as a statement separator,
not as a comment character. Afaics arm-* and aarch64-* are no exception there.

Jan

