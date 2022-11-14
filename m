Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FC362849A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 17:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443423.697987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubxx-0007aP-GE; Mon, 14 Nov 2022 16:05:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443423.697987; Mon, 14 Nov 2022 16:05:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oubxx-0007YJ-DC; Mon, 14 Nov 2022 16:05:45 +0000
Received: by outflank-mailman (input) for mailman id 443423;
 Mon, 14 Nov 2022 16:05:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oubxv-0007YD-KB
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 16:05:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20617.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3021d7ac-6436-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 17:05:42 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 16:05:39 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 16:05:39 +0000
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
X-Inumbo-ID: 3021d7ac-6436-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxqbWpoGNwn7PxE2cKKZ1J9Y7BXT9Pogb6VoeZ1fxSM4vUKHC18aPtGmzJGfJNvPogYYr4Lx9B2KQAoUtpvJ+T65940KXAw0jKKhV+LIR+JDsO23WGro/buda8VUe5gjbv5Zscv5ujlzIqTpPLC7J2ooCzFu+BEEM9Nhl+lI6paME5tNeR9sO2VodC37bUurAkCCkaIjeDi2DikSwzqXZOCMxtp+/XrGPQ/15S3GFAZ77tcpVIatb0A0k9LQTvPc+b08WVdgdYLJ457qgMdp68xiPp3nQ00pUJTSC5XBF0Ts/6yeBxq+QUxKUAJV/n8FzNgIkxsMncY61422gppAYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQgseoSQVd1e05VTTeEWL0ZknjU3TTN/8sH+WnMVZHE=;
 b=F3ns03ZGBDtYF1x8r2Nc2wbvfCNDo9StUgWC4f2FpCiRQb8ShVailTmZGlS5f2TLr7Zjlua4Mzz946hHD2fxHFgaUrErNBTPr/gdq1qwSqMG8hrKhl6VrAzSVccrgmo0Kq3V5Qe0rmDRlSNz378Yq8jO4MoXbubtuYPcni2bbEiLCqmE88nM5lFni9OvFOBX0Yvfjf0VMAcx101FU7NLg2onOWCkWqRVTxJLxtevDUBIjQjXK+DucNn/kUsOkA5Yq/QfZtgP0e+SLEyZuNeZ1wZFLGyoOl6W3XGHzl0AGiEEQWI/ccoJMZV8SzXoBqQL05/OmkHRtOJGD+xJFO95+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQgseoSQVd1e05VTTeEWL0ZknjU3TTN/8sH+WnMVZHE=;
 b=rF3kSUgyZQYFOul2iRdMt20/1afDCmB1L6RCSuUntIZQB6TiTaDHO3GLCJxiRhfvro9b1s+IqmKIOPadbA2mCzpkUsLixBWyuu91ckqppQ/hck6mk5R2I+cksB5Fn4uacescs/RgSXSttbRDS6rxZsmchSUPOmsgTxjGk4qyjvqZbr5EScb4DMdf8aHDLamaHlqRW2liX7T/QY3wAPngpwulet/2cMiIg+I+XZS09/vnMbcp9Zl/uHXFH02a7jqxoCmwgNYEPLUo6arSgSD1LnROnhD8ALghjpHCnGyS9ZUnrnwYAwzhTgFtRerZmMUXST9/EiYwpdIoLKkzWtzWQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7a7a032a-9be7-b011-dc88-3c4e7f253ef6@suse.com>
Date: Mon, 14 Nov 2022 17:05:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20221107104739.10404-1-luca.fancellu@arm.com>
 <20221107104739.10404-2-luca.fancellu@arm.com>
 <aa989d27-45c2-6cb8-160a-b0368b1bb2a2@suse.com>
 <8632FA78-B316-4866-8E78-D4CD127C8602@arm.com>
 <d1d5ce85-0883-9217-ada9-71204e02239a@suse.com>
 <B26247E9-BD4A-4868-B977-CC451F7A095D@arm.com>
 <7d56c33d-4b03-9aa1-6abc-45a8ad41caca@suse.com>
 <2E0BFEFC-5BEE-4F8B-BD9E-94CB9A5B2BC9@arm.com>
 <aa05f64b-fdc1-ab4e-e751-e19309f88eb8@suse.com>
 <9CE2A214-2D64-4BEC-A78B-393BF7AEDD9D@arm.com>
 <e8cae5b4-82db-cdb0-eccd-36337bc8ae5a@suse.com>
 <E9975528-1600-4F93-8C6E-263FF2A4A7F0@arm.com>
 <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
 <alpine.DEB.2.22.394.2211111245540.50442@ubuntu-linux-20-04-desktop>
 <e6c5d690-4df9-ccc1-6f33-bce8cc742703@suse.com>
 <282F1A51-D143-4F23-BEF6-43648505E7D9@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <282F1A51-D143-4F23-BEF6-43648505E7D9@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::17) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 8474952d-8c59-44d7-53f8-08dac65a12af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uNoRIBZ3xtfpdTdMV5A0O5Zl54BSYReceVnp0qQ0j0tLQfJB20yxVDeAvXUHbxC5RiRrVFd56tTOheoZ4GsOm4cZ3PxlgmWNH+O7Prn0eiVUYpzOIVH+Te+S1SUnkqNoLxv1BAc9u1CT1m5og9vLO56bJcvGKGiYk+iWQu3U3z+ROjyaTRNUMOheDyMFK4mIX1Qv9yTUsNby6C43Xo/NqykwomZzxDfZxfEMauc06hbzocXoaK8ZZVYNhkllRXhQ0/Xibrk1pSWTSZfKjYOPeTdJ0h1HqSm+7kGBvQSxOnokpe/HiGI+W/8nCr+wESSgeFhr7U1N9zCOPqs5H2QPe59Me3pdPVFRyw+mmeLZ+sdVZZukIb49XRtcPvLa35ug2MvHxJhZBZgCqcSTY6Hw0U7tD13lQ+zfDT/meh4l+FEJoOwZyZajvNyQJjyuNrCkCUt6vpyy3hkZd29jJV/2BbhyMiqiwJT14cYwUih3KPtrWDoETrjB5BlLXx6M1Ig+M9AuBtmC64JVavQcwEbBHmanw7rqCie/vD6+u337vieSHtMPHiKJSqfc7WT3/5HA0zzoIBWViylbTXBzzx6eEiBNlbhsuz43aAg13Klo5AJAdy8l6NvO0iePuRqQb71ryh9gUyus1U7MwHE41S90sTa9wN3FyFctiDlE8LzD+gzx0R6xUv9hngvSoLm3z9QF5j3mAGMBCkEfsLU2GGVufFxq1Tk+kYGl7F9DbvmMRAQM3MbD/DAqvpEpPLwT1DKykmvsDLwXUL+Ztl1S9+jlYv6Gt6FSgOcRCTDRN9bxm9A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199015)(66899015)(36756003)(31686004)(31696002)(86362001)(2906002)(7416002)(8936002)(38100700002)(83380400001)(2616005)(186003)(6916009)(54906003)(316002)(478600001)(6486002)(8676002)(53546011)(5660300002)(66556008)(66476007)(66946007)(41300700001)(4326008)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTBDQzdTUEx6UUlBT1FwVDkvdWpvZVRYU2NyK2ZtUXRld0l4MEp3UlVCb3l5?=
 =?utf-8?B?WVJpQlZNRTFSbGVpLzRLRklPMnZaRm1XTmJDcWNzRG1XS3pFQ1dmSTV6Lzlp?=
 =?utf-8?B?d0RLM3ZOS2tlVUYyaG5mQzNPYmlZeFhkdUR1UkFlQUx5YXZGRysrVS9sbFJt?=
 =?utf-8?B?OHB5c1VEbXNvem95TGN2dU5oMWptSmdReGRRK0laN2NESzNManBtYjVScGFw?=
 =?utf-8?B?aGpsZy9XdlZaN2Y2OWRTZ3FjdWxMdmpYMWF2NEVVVytLWGRHTzQrbS9QNi9n?=
 =?utf-8?B?Z1hkcGlNeWJUS0cyYW5rRnFkTTNiWkVmMGg1alIxWDdFN1p3Mm1rWHgycDRw?=
 =?utf-8?B?RGpVWW5nV3pmNS9jZWdjMUwzM3M1bjBwRUtzZmtBMmRmK1kvTTVWQkFRVlNW?=
 =?utf-8?B?N0lFNGMrR2lLRVltc0krSjFHcTExS3NpSnRocUZ5eU5pU2NiK3pZK2gvRFF4?=
 =?utf-8?B?RDlYOTU2a24xNHc1bHVBL3ArU1FIbmdDK25VL3J0bHFkUW1JRWpZQ2JhaG1q?=
 =?utf-8?B?ZkY4NlVCUU1NV2FEUmpmN1VnWlp2cmcwVGtJVlQ5dS81Rys1dDlVNEs1VXRn?=
 =?utf-8?B?dTlZQWtjUGczZlcyOTgxYUJuUVhrOTVVMVRMZ1dRNzBaTzlmQi9halJwVlRO?=
 =?utf-8?B?eEhpdWc2dGkyK2NoeFBFS1dWMmQwdGZtTWFDbjdLZ3RVcnpucFp2djlKcUY4?=
 =?utf-8?B?V3NrSG12c1RpOGk5bVhPQkJPakRUZm1DSFhKZitMd01MM0luMUZYVTcrbWRV?=
 =?utf-8?B?RCtkSFV0ZURHL01vTzJ3ZndFUk1FMVpLclJEcTlMVzI2clhLYnk1cG5OUExE?=
 =?utf-8?B?UnY1NGkyRmVEV0lKUWdRR2htbFNnRmVDajdoUmhoTmNMcUd6aG9VZE40bXlr?=
 =?utf-8?B?MUJQek5yREdmK0k4bVdBVm91eHBWSHAra1I4T2Y2QUNSU3J2SC9tUkFNUnZB?=
 =?utf-8?B?d1FzOGJ6Y3dwOG5TWVArcjVjRWFQVVJ1NTBBQlRScGx0b1QzcVJmRmhKVXZj?=
 =?utf-8?B?OVd0L1ZveGlEeG1lTG53STFlN2JtdmVDUkgwS09XSkRWS2lhVWhzYjlwWmI4?=
 =?utf-8?B?RXZ4ME1zRGFMVlJhOTBqNEU5Y01xMTVjM2l4ZnZsUUk2alJnZXlXVUtLMlpN?=
 =?utf-8?B?RldDT1BoOVBGenBmdkxoeXhRMWFRSlVxZXJ2U1FQUk5HQy9SNlZLUnRqcnVh?=
 =?utf-8?B?Z3cvMlE3a2VGcXZmS0JMaThmT3RkOStIcE1Dam1rdjhzTzZtVXJ0cFV4aEhz?=
 =?utf-8?B?WFFVTGFzeFljSmlxSXR5azFUVHBaN1hnS1FqK0ZCNFh2T0RFeGQ5U1FQOWVi?=
 =?utf-8?B?NlRHYVJERndqVTZ3bWxxMVpnc3J2T0IxMDBQYVFuWkZ2eXphOTQ2MVpWaU5N?=
 =?utf-8?B?OFl5MEh5dXEvTVM0RXE4U3dGV3VPQXFNVGNyNmVIclR2VloxQWxXcWxIWGZI?=
 =?utf-8?B?bjNPWWt2RDJBcSt5QnlHdUdkZHVGUHgyUU1rVjltWTRma1I1eENiWTF0Qk4y?=
 =?utf-8?B?ZzlPbVNrWDc0blFId1BpV1JXcEdzbS9lbUdCMVdpVDJVc1lEd3gwUTNYTGd1?=
 =?utf-8?B?RnRxWWkvaHBuN213cVIya2gxTWozTlEwNHpBNTZiSklGWm4rd3hIRThhK28w?=
 =?utf-8?B?NWQ5aTB2R3JJZThjOTVlLzZnUGFKSG55QVBMNi9DVldjU2N6aHkxYTlFMmRz?=
 =?utf-8?B?bEV0K0pTNnJWR01FbFcrZzhLWTNaVW9ITnBIcmhBaFJTdE9Bb3VHcHllVUxh?=
 =?utf-8?B?RUZjWlN1MjUyWk0xeFkxS1V2QWNSNWNTbzZQVk9penlGYXdFY2RaajlXako1?=
 =?utf-8?B?MVNycjBRYXVwS3NNcjlCNzVvdmMwMVBCT1k3NlhiSGEyd3dXKytyVzlzaTZp?=
 =?utf-8?B?eUFldGJMMVozbTRwbXpLcTh4M1lZaHZWd0VCVU11emdONmFnbHlRYnpLTnNm?=
 =?utf-8?B?cXhKN2FsVlB5Z1JJYVNRK0ttZXEyUWpJbFlFMGFLeTVLODRCZTkySndrRHdP?=
 =?utf-8?B?eTdiYzJjYVVVWmRsVEo0MVFMQTBuM2dXWXRiVm1Ca3RLc2hGeDBscWRMQ2d0?=
 =?utf-8?B?YlNlTmk4N0hsUXR6ZjFmMnpRSGxSN1haUXM4UHZ4L0c2cCszVmhvdWZzbm8x?=
 =?utf-8?Q?oM9+AQgrY9PhD22Mgvl8ttkgq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8474952d-8c59-44d7-53f8-08dac65a12af
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 16:05:39.0120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/BnQXlh2QPA043YsW0VRp6/f0/tSja43QkwrpQKHC3Ug8SC2YivcVsfO13gTq5k6mQ42llfDNgdfhCfHA3uTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On 14.11.2022 13:30, Luca Fancellu wrote:
>> On 14 Nov 2022, at 07:30, Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.11.2022 21:52, Stefano Stabellini wrote:
>>> On Fri, 11 Nov 2022, Jan Beulich wrote:
>>>> Did you consider the alternative approach of copying the tree, altering
>>>> it (while or after copying), running the build there, pulling out the
>>>> result files, and delete the entire copy? Such a model would likely get
>>>> away without introducing surprising make rules.
> 
> This approach does not work because the report will contain a path that is different from the source path and
> some web based tools won’t be able to track back the origin of the finding.
> 
> e.g. /path/to/xen/arch/arm/<file> is the original file, we run the analysis on /path/to2/xen/arch/arm/<file>,
> the finding is in /path/to2/xen/arch/arm/<file> but the source repository contains only /path/to/xen/arch/arm/<file>

Simply run "sed" over the result?

>>> Another, maybe simpler idea: what if the build step is not a dependency
>>> of the analysis-* goals?
>>>
>>> Basically, the user is supposed to:
>>>
>>> 1) call analysis-parse-tags-*
>>> 2) build Xen (in any way they like)
>>> 3) call analysis-clean
>>
>> Well, that's exactly what I've been proposing, with the (optional)
>> addition of a small (shell) script doing all of the three for ...
>>
>>> Making steps 1-3 into a single step is slightly more convenient for the
>>> user but the downside is that dealing with build errors becomes
>>> problematic.
>>>
>>> On the other hand, if we let the user call steps 1-3 by hand
>>> individually, it is slightly less convenient for the user but they can
>>> more easily deal with any build error and sophisticated build
>>> configurations.
>>
>> ... convenience.
> 
> For coverity and eclair, it makes sense, these tools doesn’t require much effort to be integrated,
> they are built to intercept files, compilers, environment variables during the make run in a
> transparent way.
> 
> So the workflow is:
> 
> 1) call analysis-parse-tags-*
> 2) build Xen (in any way they like)
> 3) call analysis-clean
> 
> 
> If we think about cppcheck however, here the story changes, as it requires all these information
> to be given as inputs, we have to do all the work the commercial tools do under the hood.
> 
> The cppcheck workflow instead is:
> 
> 1) call analysis-parse-tags-cppcheck
> 2) generate cppcheck suppression list
> 3) build Xen (and run cppcheck on built source files)
> 4) collect and generate report
> 5) call analysis-clean

Which merely makes for a more involved (shell) script.

> So let’s think about detaching the build stage from the previous stages, I think it is not very convenient
> for the user, as during cppcheck analysis we build $(objtree)/include/generated/compiler-def.h, we build 
> $(objtree)/suppression-list.txt, so the user needs to build Xen where those files are created
> (in-tree or out-of-tree) otherwise the analysis won’t work and that’s the first user requirement (stage #3).
> 
> The most critical input to cppcheck is Xen’s $(CC), it comes from the build system in this serie, the user would
> need to pass the correct one to cppcheck wrapper, together with cppcheck flags, and pass to Xen build stage #3
> the wrapper as CC, second user requirement.
> 
> After the analysis, the user needs to run some scripts to put together the cppcheck report fragments
> after its analysis, this step requires also the knowledge of were Xen is built, in-tree or out-of-tree, so
> here the third user requirement (similar to the first one, but the stage is #4).
> 
> In the end, we can see the user would not be able to call individually the targets if it is not mastering
> the system, it’s too complex to have something working, we could create a script to handle these requirements,
> but it would be complex as it would do the job of the make system, plus it needs to forward additional make arguments
> to it as well (CROSS_COMPILE, XEN_TARGET_ARCH, in-tree or Out-of-tree build, ... for example).
> 
> In this thread the message is that in case of errors, there will be some artifacts (<file>.safparse, modified <file>)
> and this is unexpected or surprising, but we are going to add a lot of complexity to handle something that needs
> just documentation (in my opinion).
> 
> If the community don’t agree that documentation is enough, a solution could be to provide a script that in case of
> errors, calls automatically the analysis-clean target, analysis-<tool> will call also the build step in this case,
> here some pseudocode:
> 
> 	#!/bin/bash
> 	set -e
> 
> 	trap [call analysis-clean] EXIT
> 
> 	[call analysis-<tool>]
> 
> 
> This script needs however all the make arguments that we would have passed to make instead:
> 
> ./script.sh --tool=<tool> [--dont-clean-on-err] -- CROSS_COMPILE=“[...]“ XEN_TARGET_ARCH=“[...]” [others...]

Well, of course the suggested script would need to be passed overrides you'd
otherwise pass with "make build" or alike.

Jan

