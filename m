Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F6F622899
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:37:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440839.695058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiS3-00007A-Bl; Wed, 09 Nov 2022 10:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440839.695058; Wed, 09 Nov 2022 10:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osiS3-0008VG-7s; Wed, 09 Nov 2022 10:36:59 +0000
Received: by outflank-mailman (input) for mailman id 440839;
 Wed, 09 Nov 2022 10:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osiS1-0008V8-Lf
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:36:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60043.outbound.protection.outlook.com [40.107.6.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c866452-601a-11ed-8fd2-01056ac49cbb;
 Wed, 09 Nov 2022 11:35:59 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6796.eurprd04.prod.outlook.com (2603:10a6:10:11e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Wed, 9 Nov
 2022 10:36:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Wed, 9 Nov 2022
 10:36:54 +0000
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
X-Inumbo-ID: 4c866452-601a-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Scww013+5jR8FY/qM1WH70RA6J8D9J7We/yIkggbJOGysLDSim+zkMsXd2apwM+HAISG3eAhyOooRAWMeAjc6iK/Oi1mBNroT/gu6FNeJdpyQNToUcNbWkupQHKe9niVJ9VmcRUASvG4N3ItG3B6XJu6erh0mJJWyIh914Qdy/eR5TYhUJphxIqiUnxaM0ZsmptgUCuBaSamU1VLh5VkZpLXdAeL6PHZ6BvrEO04R+ybDaLgv3HwC8hk6MOVeS7fXQL34UK78wRzm3TXCGHuUVJg5i+45IcURThDC2n+D7bJe7Ps1IDnLJu+Vq43rcPfJRvLbhloYuEYbGELGr7TQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k3CciVVFxvhaE4JiL1O/jcQmnq5eVGuRo4g7hgbIJoM=;
 b=CARrygpLgXOd00ckXkqZaeYgJjhMY/spP/GafGEwqxVZ3v/OlIYaFpAG+V3v08kBA3fsRslOHLSDe6fGNCBFfolYJ9hwfw0syzuTii0NKcHs3Xee11elA7Fpcd1XTR7vQk14DZtrQIRj6a9yJBs58JRPrT+Bzd1joBH16fN9N1nYKRdWwXsA2ApRo8O2nxWxfaDYj3YeJE7+UHBhsxuOLF3gSg8Qn0e+PENFWJ6/SG9NPkM4zszg36bT3uNh2LkkKMLKoNgdud1X7PzI2hX8lGyAF4lATJquHhak6HFtDBjotR1VAFqlBeBBZFqUtpu9ucIOwe0DJUT17An8doWzxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k3CciVVFxvhaE4JiL1O/jcQmnq5eVGuRo4g7hgbIJoM=;
 b=Q6/bWO5/EyQt9tfXNBPULevukaSc3/FituOz860+BKa7l5yG3/rBv0/GTfxlAoWIMTK8HXai0NPM2DELjsFgVQMG+r6js6w3G6Z4Q4Tr3oyO2ZfnHBeJ2ML0jbp20YXydA0uA9hrXZHShjFTz1wrgQZbwxLMJ1w1U1hKecbVzn9P7GTYjks9VuIUDQeP0j7ajJsgHXEzPLIsFHQw753CxFSL1Knxt8XyOaP8ua7bEyh2pdJ5+07RGkCjEU4/wQp48sCLclAi1NX8OIbL2E5vn5UWVadxm36GSkaC7Bds7B7v4qVcpI46rUxdbRBw10R3c43fke6mr07u7CSCrEobAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e8cae5b4-82db-cdb0-eccd-36337bc8ae5a@suse.com>
Date: Wed, 9 Nov 2022 11:36:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [RFC PATCH 1/4] xen/Makefile: add analysis-coverity and
 analysis-eclair
Content-Language: en-US
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9CE2A214-2D64-4BEC-A78B-393BF7AEDD9D@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 0db5a978-348a-4450-5490-08dac23e5190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	blgLiwlpBb+6PAx45RVMHZUaYK63j5n+KPcWFhef9usUP6TSdTfsrsnR8gL2jM+e9fZduu4cP6bGLSa8rSaBf5WC96OABYrh9MleG8fy/vlC6RtUF7dQvu/Wsi5e9FlBjqUsi9h05hrrD3KECS4jxQbRJa8PlZLngp3LFpRSpYDqCmRzLAjkd39gqp4WGEQWYomOUFXC8SwE7R+cap7Bd1NQtsjjgchVsvpRLpuvhgYYobXpGGTeS1+rIORKzqgRnQN6CZaifLgvVipC765jBQY85tpTIT4KkPQe4H/gZvVeB0LYJR2MqcXrMo7Y/EXPnjiNKPsl/wssi/z/xqg4VzKrRDP0sIEVlAR5ouSHRuAZSI3907huqnIP9m20ZGZoXxvb2V4s62A95HJFypvAByf7NvzvOeREmx6kppLN0wOEifcjAMvxgdp0ttFO8hzwMuOzqyzc9JWcBHr04WCJn5cfYYhL4UwI+4stjf6ptR/rZN/2mUmqJpx+xKGQHrcJbWARHXfKadCqsKMElA7+QaCtmS9YKhVAeJE9pmOXOlLmfxi0d5e7rcReM3XBzgDaD7EZEIMnrpJUlvR/9KSrWVb88SoLVWd3bg+VOknYKK2Ahkh/ZeQnWMMKaFMPD167EYVYJfSCNUHU//Fzgb0LcdTLLHM05Zhwtz2h1xeNL2tMFlj/CoobjHBo/nJaYZgEIdGDyIgHE1CmXSU+PxJ9BxhI4hANQK4Jeh/GB4rylNpVkn7ziVB/4Dxg77nh8X/797leoFYk0iHS7eUVX8EoxQrDP3Idbru7v4fFkIO6tD0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(396003)(346002)(366004)(376002)(451199015)(36756003)(31686004)(38100700002)(31696002)(86362001)(5660300002)(2906002)(53546011)(186003)(6506007)(83380400001)(6512007)(2616005)(26005)(478600001)(66476007)(66946007)(66556008)(54906003)(4326008)(6916009)(6486002)(316002)(8676002)(41300700001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3cvdDlra0N6R3UycUtZMjlFOGNjK2F1RXhOS1h0R3M0QlgvTXc2ays1V1gv?=
 =?utf-8?B?bkxPdS9OcFIwbmlpQXFwMER6MDVmVnVKVXJMOUh4SFJXcFhESE9CanlwMUJI?=
 =?utf-8?B?cnoxNyt3cUtVWE9hMXE2WDc2VGlGT2VpN1YwU3BjdnlWMEpBWUxEeHdYMU1w?=
 =?utf-8?B?RE1oRXo0eDdXMXA3NDRCUWdJbnFLZHBkbmMxa21sQ1UrZ2tzRE9xSS9lc0ZQ?=
 =?utf-8?B?MVR0ZFFOQnl1UUZEMUo2MzdVTVNibW1lWkQ2VkJwU2twV2sxUjd5OVYzVzQy?=
 =?utf-8?B?d2xYVmxVM2VkVFJFZFFUY0FZY3JYT291YVdMdWRoT2o4YUNFd0J6TUx5UGhi?=
 =?utf-8?B?bGQyVzAwcW5Qd3c4WUwrTzJnNk4zMHRma015Y0x4NGNhMExkU2hvamN3aVNr?=
 =?utf-8?B?Q2lZMlVUQW4wNVFML3JNbzN5aVBGaUpObEdIbDk4cnNyU1ZzRUZSTTV3SjZB?=
 =?utf-8?B?LzVhYW51dlhnT1lmNFc0anI4MW5DQjdvY2FRK3VaK0NPenE5c29lWWd4clVt?=
 =?utf-8?B?R3pUZmwrL2lJYVlDQ3BmM2VGUGkveEhpMk04Nmh3ZC9lUTlubnZWU3Uvblkv?=
 =?utf-8?B?d2pFT2lqbG0zaEVYV1JmNG9rVk1Lc09jQ3VLSDMvN0N4U1c3c00yaGN4dGJ5?=
 =?utf-8?B?ZUI4YksvdW9YT285dEREakVZOUtiTzB4ampzOUUvOWFOcys5MFUwT0RONXBS?=
 =?utf-8?B?aHJoL0NZRDNQbWQ1Y1Fib3dMT0NUSVRqblA0RW1CcDQ1V1NWTEp3dmdCV0lW?=
 =?utf-8?B?cjArWUNiWktCWDdNMElVTUZOWmEzMjFIZVA4ZnNpVTJkak9XbEVNYjVFWW5T?=
 =?utf-8?B?TlVoUkVobDN5TFFUTXo4UWdkTlJRdlVmM1p6NUdtbTNnaVlodWdaTlpPUHBu?=
 =?utf-8?B?VXJtZ3NybmhSOHRPYk5qMTFvODVjWmo1d1FNN1FobEVjODVJVXY4SUE2RVZs?=
 =?utf-8?B?UEhSaitTd2p3VUhJWVBCZFkvOTRIOWo2KytsWC80ZDdzYVFueWxOdnBKTTlZ?=
 =?utf-8?B?U3c4OU93RzAzVURnRldEUHoxVng3cnk1YlFod05HWFc2eVI0NXR1VG5SQUg0?=
 =?utf-8?B?UmprcVB6WGxRaDdsVFV2Y2JPZkJQV0VVWEVNYlF0U1JOSEZDUGVUY2ZlRnFv?=
 =?utf-8?B?Zm4zanUyODJ1S0FVRms2QkI2NStmeE5lUURwc0VnZ2VVaGtSaWg3ZitSelZt?=
 =?utf-8?B?Q0hEaDA2RmtSbzk1QzEzazNLbWxyMzFpRTVnZ3lPeEpWUmJ5SUh0aUIyUUJz?=
 =?utf-8?B?a0k4eUtHdmhPM1VuTCt6aHhrc2cxbFZPWWs2RXVHL0kySk9JUHNBeFNueFR2?=
 =?utf-8?B?MXR2eEdCaWwyT0RTcnI0TmVJYUdmQjNWZHdWZTVnYnhsdnM0QzI1NnpscERi?=
 =?utf-8?B?TzlDVFRiSWp0VVRyQXVRUUFlT1hSRlZvalFtQVlFbWx6azdTVXlMRlhXbzNF?=
 =?utf-8?B?RXlYNDVVcHM1WVNmTFJ1cG12T0hTQlRaZEdyaTgzeTVIWkFJOWQ5MmFlR2N5?=
 =?utf-8?B?ZXNVRFhQS0JsRDhCaWo0eHRwNVJOWVh2M0hENjQwQkNoSXVnVGJCT3FpeDR5?=
 =?utf-8?B?c2YzdGp3eXNzQVpvUllFWGhqQStabk5sa3RFQ0dsU2U1bytjV0tES0taUkd5?=
 =?utf-8?B?RXcxMkpvZmZJeEpQMVdiQnAzYWVGb2xVeUJFdUZ1Vm9lVGpKMVczc1Y3RmNY?=
 =?utf-8?B?QldrUnVlVHVjV3FUaVhwbGlYZnJ2UGE4cEJzby9oaVhwVURabStXM01GSVox?=
 =?utf-8?B?OVp2YnBiQi9jWHN3czIwM2pLK3lnUWdlbDJEY3pnSUpwN3prdzRRQjlUaWxr?=
 =?utf-8?B?UTZLbGJuVnZUblExeWtJRXhDZlozWkk0ZEh2MDVETlFCbXN4bTlib2pvanlw?=
 =?utf-8?B?WlU2YWFwNnZ3Sm5abXpNM3kxbzYyVHRQcWNYVnFzWWtmZWswcmNrTUZpOW1q?=
 =?utf-8?B?NjVGQll2TGFyeG16eUJnbUdBaHppV1l4cHNpczFrRkhVSG0rUEdvNTU1TnFX?=
 =?utf-8?B?TG9OYmNaTGJpZmJndW1hYTVVS2kwakxoZDFXVW1GK2F2Y1ZrdDRkSEhwdWJ5?=
 =?utf-8?B?STB1QjFtYjlIME0ySWU2TmJoQzByVTBnSEc0R0M0NElEWXBIc1JudXZJcHd4?=
 =?utf-8?Q?04Nq4ra4OnmGP0BV17cory1t+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0db5a978-348a-4450-5490-08dac23e5190
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 10:36:54.0083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qAGqDkJ1TyUwt/B2yiHzUlQhtBFJutW3IVekEss733gQMYJ5TAL+o01QJrxvx8cWT7k3HxfkGSKM1rDpSRDG0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6796

On 09.11.2022 11:08, Luca Fancellu wrote:
>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>> +Here is an example to add a new justification in false-positive-<tool>.json::
>>>
>>> With <tool> already present in the name, ...
>>>
>>>> +|{
>>>> +|    "version": "1.0",
>>>> +|    "content": [
>>>> +|        {
>>>> +|            "id": "SAF-0-false-positive-<tool>",
>>>> +|            "analyser": {
>>>> +|                "<tool>": "<proprietary-id>"
>>>
>>> ... can we avoid the redundancy here? Perhaps ...
>>>
>>>> +|            },
>>>> +|            "tool-version": "<version>",
>>>
>>> ... it could be
>>>
>>>           "analyser": {
>>>               "<version>": "<proprietary-id>"
>>>           },
> 
> About this, I’ve investigated a bit and I don’t think this is the right solution, it wouldn't make
> much sense to have a schema where in one file the analyser dictionary key is the tool name
> and in another it is a version (or range of versions).
> 
> However I can remove the analyser dictionary and use this schema for the false-positive, which is
> more compact:
> 
> |{
> |    "version": "1.0",
> |    "content": [
> |        {
> |            "id": "SAF-0-false-positive-<tool>",
> |            “tool-proprietary-id”: "<proprietary-id>”,
> |            "tool-version": "<version>",
> |            "name": "R20.7 [...]",
> |            "text": "[...]"
> |        },
> |        {
> |            "id": "SAF-1-false-positive-<tool>",
> |            “tool-proprietary-id”: "",
> |            "tool-version": "",
> |            "name": "Sentinel",
> |            "text": "Next ID to be used"
> |        }
> |    ]
> |}
> 
> This needs however a change in the initial design and more documentation on the different handlings
> of the safe.json schema and the false-positive-<tool>.json schema. Is it worth?

I think it is, but of others disagree, so be it.

>> On 9 Nov 2022, at 08:31, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 08.11.2022 18:13, Luca Fancellu wrote:
>>>> On 8 Nov 2022, at 15:49, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 08.11.2022 15:00, Luca Fancellu wrote:
>>>>>> On 8 Nov 2022, at 11:48, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> On 08.11.2022 11:59, Luca Fancellu wrote:
>>>>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>>>>>> @@ -757,6 +758,51 @@ cppcheck-version:
>>>>>>>>> $(objtree)/include/generated/compiler-def.h:
>>>>>>>>> 	$(Q)$(CC) -dM -E -o $@ - < /dev/null
>>>>>>>>>
>>>>>>>>> +JUSTIFICATION_FILES := $(XEN_ROOT)/docs/misra/safe.json \
>>>>>>>>> +                       $(XEN_ROOT)/docs/misra/false-positive-$$*.json
>>>>>>>>> +
>>>>>>>>> +# The following command is using grep to find all files that contains a comment
>>>>>>>>> +# containing "SAF-<anything>" on a single line.
>>>>>>>>> +# %.safparse will be the original files saved from the build system, these files
>>>>>>>>> +# will be restored at the end of the analysis step
>>>>>>>>> +PARSE_FILE_LIST := $(addsuffix .safparse,$(filter-out %.safparse,\
>>>>>>>>> +$(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>>>>>>>
>>>>>>>> Please indent such line continuations. And then isn't this going to risk
>>>>>>>> matching non-source files as well? Perhaps you want to restrict this to
>>>>>>>> *.c and *.h?
>>>>>>>
>>>>>>> Yes, how about this, it will filter out *.safparse files while keeping in only .h and .c:
>>>>>>>
>>>>>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(filter %.c %.h,\
>>>>>>>  $(shell grep -ERl '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree))))
>>>>>>
>>>>>> That's better, but still means touching all files by grep despite now
>>>>>> only a subset really looked for. If I was to use the new goals on a
>>>>>> more or less regular basis, I'd expect that this enumeration of files
>>>>>> doesn't read _much_ more stuff from disk than is actually necessary.
>>>>>
>>>>> Ok would it be ok?
>>>>>
>>>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell grep -ERl --include=\*.h \
>>>>>   --include=\*.c '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' $(srctree)))
>>>>
>>>> Hmm, not sure: --include isn't a standard option to grep, and we
>>>> generally try to be portable. Actually -R (or -r) isn't either. It
>>>> may still be okay that way if properly documented where the involved
>>>> goals will work and where not.
>>>
>>> Is a comment before the line ok as documentation? To state that —include and
>>> -R are not standard options so analysis-{coverity,eclair} will not work without a
>>> grep that takes those parameters?
>>
>> A comment _might_ be okay. Is there no other documentation on how these
>> goals are to be used? The main question here is how impacting this might
>> be to the various environments we allow Xen to be built in: Would at
>> least modern versions of all Linux distros we care about allow using
>> these rules? What about non-Linux?
>>
>> And could you at least bail when PARSE_FILE_LIST ends up empty, with a
>> clear error message augmenting the one grep would have issued?
> 
> An empty PARSE_FILE_LIST should not generate an error, it just means there are no
> justifications, but I see it can be problematic in case grep does not work.
> 
> What about this? They should be standard options right?
> 
> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell find $(srctree) -type f \
>     -name '*.c' -o -name '*.h' -exec \
>     grep -El '^[[:blank:]]*\/\*[[:space:]]+SAF-.*\*\/$$' {} + ))

Coming closer to being generally usable. You now have the problem of
potentially exceeding command line limits (iirc there were issues in
find and/or kernels), but I agree it looks standard-conforming now.

>>>> And then - why do you escape slashes in the ERE?
>>>>
>>>> Talking of escaping - personally I find backslash escapes harder to
>>>> read / grok than quotation, so I'd like to recommend using quotes
>>>> around each of the two --include (if they remain in the first place)
>>>> instead of the \* construct.
>>>
>>> Ok I’ve removed the escape from the * and also from slashes:
>>>
>>> PARSE_FILE_LIST := $(addsuffix .safparse,$(shell grep -ERl --include='*.h' \
>>>    --include='*.c' '^[[:blank:]]*/\*[[:space:]]+SAF-.*\*/$$' $(srctree)))
>>
>> Good - seeing things more clearly now my next question is: Isn't
>> matching just "/* SAF-...*/" a little too lax? And is there really a
>> need to permit leading blanks?
> 
> I’m permitting blanks to allow spaces or tabs, zero or more times before the start of
> the comment, I think it shall be like that.

Hmm, I withdraw my question realizing that you want these comments
indented the same as the line they relate to.

> About matching, maybe I can match also the number after SAF-, this should be enough,
> 
> […] grep -El '^[[:blank:]]*\/\*[[:space:]]+SAF-[0-9]+.*\*\/$$’ […]

I'd like to suggest to go one tiny step further (and once again to
drop the escaping of slashes):

'^[[:blank:]]*/\*[[:space:]]+SAF-[0-9]+-.*\*/$$'

>>> Now analysis-build-coverity will be called, the best match is analysis-build-%, so again the dependency
>>> which is analysis-parse-tags-%, will be translated to analysis-parse-tags-coverity.
>>>
>>> Now analysis-parse-tags-coverity will be called, the best match is analysis-parse-tags-%, so the % will
>>> Have the ‘coverity’ value and in the dependency we will have $(objtree)/%.sed -> $(objtree)/coverity.sed.
>>>
>>> Looking for $(objtree)/coverity.sed the best match is $(objtree)/%.sed, which will have $(JUSTIFICATION_FILES)
>>> and the python script in the dependency, here we will use the second expansion to solve
>>> $(XEN_ROOT)/docs/misra/false-positive-$$*.json in $(XEN_ROOT)/docs/misra/false-positive-coverity.json
>>>
>>> So now after analysis-parse-tags-coverity has ended its dependency it will start with its recipe, after it finishes,
>>> the recipe of analysis-build-coverity will start and it will call make to actually build Xen.
>>
>> Okay, I see now - this building of Xen really _is_ independent of the
>> checker chosen. I'm not sure though whether it is a good idea to
>> integrate all this, including ...
>>
>>> After the build finishes, if the status is good, the analysis-build-coverity has finished and the _analysis-coverity
>>> recipe can now run, it will call make with the analysis-clean target, restoring any <file>.{c,h}.safparse to <file>.{c,h}.
>>
>> ... the subsequent cleaning. The state of the _source_ tree after a
>> build failure would be different from that after a successful build.
>> Personally I consider this at best surprising.
>>
>> I wonder whether instead there could be a shell(?) script driving a
>> sequence of make invocations, leaving the new make goals all be self-
>> contained. Such a script could revert the source tree to its original
>> state even upon build failure by default, with an option allowing to
>> suppress this behavior.
> 
> Instead of adding another tool, so another layer to the overall system, I would be more willing to add documentation
> about this process, explaining how to use the analysis-* build targets, what to expect after a successful run and what
> to expect after a failure.
> 
> What do you think?

Personally I'd prefer make goals to behave as such, with no surprises.

Jan

