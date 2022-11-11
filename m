Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEF6625B04
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 14:11:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442519.696742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otToN-00035B-Sa; Fri, 11 Nov 2022 13:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442519.696742; Fri, 11 Nov 2022 13:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otToN-00031l-Pa; Fri, 11 Nov 2022 13:11:11 +0000
Received: by outflank-mailman (input) for mailman id 442519;
 Fri, 11 Nov 2022 13:11:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q9GK=3L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1otToM-00031f-Fb
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 13:11:10 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2041.outbound.protection.outlook.com [40.107.20.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4adb3221-61c2-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 14:11:03 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6790.eurprd04.prod.outlook.com (2603:10a6:20b:dd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.24; Fri, 11 Nov
 2022 13:11:00 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Fri, 11 Nov 2022
 13:11:00 +0000
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
X-Inumbo-ID: 4adb3221-61c2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwfDNt+f5JlEtUQdootiZnFJiXdur7Fz884/M30BFSNSX9/snCXMjMUlaE+t1XAq+tpPefu0q2UnQJw2xjBqD94yFUT176d+xiXkJXn/XmYvIujYTlMtNiqnONYikpGMWwml8DblOOzboBFpAvF04jBgdlSAkFxpuAvML28UnwKB0tJhtAeu8ekx2R8/+YXjA6SFqJKHubW/A1cTfBvzdJ1cqamhBj0a1xSvcY+Sv2242uH5pZIVKmH8vo/zSfH2q5qnCM0a0Y+RzOF1ddl0zTpKaatUTGHnybLyaiZaN/JDfPNToYfIj9Zisj4SITBFaOo0RKfPF5WsZI5s7Q1hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89qPfLStwqXJST/DW9eXDaWOqfPRcZ34IgPDI2WShGs=;
 b=l9wt+d6WaxED4BoaNpJpw2j78Y9SVev4Ihk9zjvD4MYsLQASGm7moO+I9r/GAW1tI0X7mUeerK6N4db+VuNDMmfg84dWwX96VZIV2PHLQQXTINroXFMysm7uYeM4cDBUMRwk03XpbKn27y5KeUSy1grX7nQ9O9gD420jd9Zw+Qqcpsd+2MjRmO7/qDis+zi3aqUCXn6TNdijCjafaOCdaiq6FZ1qEpKaNWXNl5/lp+/crOM10nfA8jzCpBGRX3F7M0sOQ2f36goh4ZbhTJn8PHLehRkc8Off8tI2Gm/ptFtgHlBCDpOuO3+9DyvSFX+BjYdMySJVtAOOoo0tlGWLdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89qPfLStwqXJST/DW9eXDaWOqfPRcZ34IgPDI2WShGs=;
 b=z7sVuaxkQqiwuq1ehfczxhChHLrX0ThGGR6TatKdu7eQan81H3ETUroUQPRygKHBUIsEHRqhPFE34RbXe3EuUulWYzz7P4jZLlHleao1nY0Jx5KsUN70xrFgtPqCMv9YvGlQ9raxVFubE/sRXb9Dg6C7T2LsaIf1GHsaoeqG6n+j08T7rGtrvwRPcAwDVY5V/idona5aMPSrFG+6y00hRrCx5mP2ZZvRidO/1dCs76OaewgVT5wMXvAEvA+EJQEGDS0OtGxvET/FlYhINxbleTlPVM/2YWBjJrHRYZqhLWv7lTpzwTsUq5JzJ+f1yakbila4wNLYcgpJOFTYjdHVzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <826eb0df-fb52-fa25-c908-977285a6ec8b@suse.com>
Date: Fri, 11 Nov 2022 14:10:58 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <E9975528-1600-4F93-8C6E-263FF2A4A7F0@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0016.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: fae1eae0-d5ee-4145-90f9-08dac3e62d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IXkDWlL+I0tFIt0AVwYMpPzrcDsUasK5Z6/j3LNFV3wX33EezsWn+m5aBq/LQiln+HOjSu/X2qxYKB+CLE/dplEEWPCmgix5xE2G8cW0UAMBWVdnVTLQ42DqNhkxTs0n7Mhz5BzoYBtlDD+rt7RSdZRN5Vso5Cn7SWDS7sgDd7uV8SW4eVGylQBjzWiCiIo8D4y36q5MNlfXmpfCiC7XtVtZOKqSHboYRv22buy2myZYVfaSbIRyWKs+fsi9qOxyNFTU9MSYGPkuROmhZ858abPwgv2c6RrDtJ9t56sS4lV6uVfzNU6Y9V72ZxufkXpKFOryUMS3CJcLlKmDoFWZwShD7w29x8p6saCZRHjPJz5Zz8Q53onPlJKJwUQB4DK62BNmWxtlixtpdmK974z7A4QMcHsgTsEdWy89/owAEPqgOFbS3IV0ru9Wdb/aBPhn1J0mRbyfeovBsEKaRc4bgCwJZnAjrULfjoWCYLSt4gCj0QkFrBh0XC4WLy8QvdQP3rmLvochFA8rUECn0mavdwZ5hZ8jXnALA3k8e6HQ8vmhyfJpOoOFufKxQlP4Aho48nx2V++T8iiJNZzVE2iaxzmm0T5O6B0j9sRrDGiw3fctcAmPRG7haMuNECIGfes07sHrHZEWD2AQMg/uFn4/3ssSlaaz1zp/M9FSknqOVnwf6pADWbNwIK6pWUVnN8Sy1szcSWG3SCBvj8uHZLwCFQxL7W39LPNQEd42vV/SJatuW2xC9WGWR2JNAXQdUoZxJ1x+/GfmcVovjslYUYOJ0X/yXwsUD1sPVUPlVKbY984=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(39860400002)(396003)(346002)(366004)(451199015)(31686004)(31696002)(6506007)(54906003)(36756003)(478600001)(86362001)(2906002)(6486002)(38100700002)(53546011)(83380400001)(66476007)(6916009)(6512007)(26005)(186003)(41300700001)(8676002)(4326008)(2616005)(66556008)(66946007)(5660300002)(8936002)(316002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGZtUlpTTDZYdFgyTGJTYVRnTWExREpJaE5vdit0dlIwMUJaL080WFROV2Q0?=
 =?utf-8?B?ZG5QSUE1SHJXaUJMczFIYTkyZm1hNGZ0THorRm9QcllCZ3VNTi9aOEZBc29x?=
 =?utf-8?B?cm9aZ3F0Z0ZpRU5GSGJ4bkhvQWlCZjFhNnJUUUM4Tll3dUVZcWNaV1dRNWF0?=
 =?utf-8?B?SGs1bnZ1bUdpRXlUeGNzajF0YnJOMEdSRXRuMmlZaENvcFM2clFnNmNxR3h6?=
 =?utf-8?B?aUJFK1ZzcklheEpiYlJPcU9Fc20weTRsUk1lUXhoRW5oWm9WNXQyd094RVdO?=
 =?utf-8?B?Q25QbHR3WGl5TXpBdHJLdFhNWmtlSjhvK1QyT216SzZ1TjFNbkk5d0xPK0xy?=
 =?utf-8?B?VlJUMXRPNUZXTUptaURYQ2pMYkNwOU5mdTdZZ29objlHM1ZNZFZzRVNrQU9K?=
 =?utf-8?B?ZVJjSlEzbTNsUFVsWDBhejVQR1VlbHVkMTJzMWxEWWVCL3dKZG1rakFkUU1q?=
 =?utf-8?B?WmRlZC8zbWR4azNvNXlpN1haSktZWkd2Z1c4R0IvYndjcEVEaHU0ZGM5Ny85?=
 =?utf-8?B?T3dYK2wxL2E1SGNpL0tYaW5abEN2NzJRY25QMGlzM2JhMHhkVktLN2w5UFVK?=
 =?utf-8?B?ZUUyU2pqWm5YeFJ3UzJpcWYra0txMGR4Ujh0Qlh6eTcrSkNGa3ZrdkhVeEcx?=
 =?utf-8?B?b3k4a1Zuc2FodUpnVXV2YXdxbHJ1OFBiRmRrUDRucHJxNDVxWlVKOG93RlFB?=
 =?utf-8?B?VmQ5Z08yYjl5ZnV5c0ZYS0lpQ2NBblR4YlF6RUtKZ2d1NHBVV0NTS2NyQWtl?=
 =?utf-8?B?Qk5kREE0bUNOUlZOMGFZTGV1aU1OQ20vUkxyRTZkeXVLVU1yR0RPc1ZkL2tr?=
 =?utf-8?B?cjJJK0poelovRmRzR3dXazNlRHc5OGFKK2R6VHE2KzZhODczZ1ppc21qWmRM?=
 =?utf-8?B?bFRHVWJHdEZ0eHJzT2x0c2YwVWg0Nm5GOEtrUGVqNUpzcVJmeEpYZGZRVjJh?=
 =?utf-8?B?R2IzdG5INmxVaTFlb0h3UlNybE5BaEpqanM0RkZhSEN0L0pXbnNncG5HcVBG?=
 =?utf-8?B?ZVVjT0Z5RjRZY0FzcFVHaUN6N0ordkYxZCtrdEVGMWJDM1VEWU1UTlVZY1p6?=
 =?utf-8?B?MUNraHhuclRUSzZpNm51QSszOEV5T09PWnYvclVTWWx6blhGdURYd1RyeUVo?=
 =?utf-8?B?d2ROcThMRmw3eDJ1MysveUZtZzNTMzZwZ01UZk8rUUc2OStRREhFOW1uYVR3?=
 =?utf-8?B?V3Q3MGJMSVdrdVdNcUJGeFdIY3ppUXpUejdqY3gyV29kUTZINWIxN1B4a3NJ?=
 =?utf-8?B?dHY4OUF2WTJ3ZWM5WXh2V1lpUlE0bHZwU2wrTjlpbEJXUGJHa1BRT0hqZGps?=
 =?utf-8?B?NDZGcTlGYW92V2RMVE1BUUl3UDcxSjdRSzdKc3IyL2tZWUttQ0NOdVd2UDlj?=
 =?utf-8?B?SEJOdlFNQkE0ZlduUTc1UzdZU2hHWWw4RXBKaUllcmxiSCs4RDBSZTBYZEM5?=
 =?utf-8?B?YSt6OFZpcXdQUXI3bFVDWFhwWjR4NWxJeXU0UFRwNUJVMTdiWFZoV2FFZisr?=
 =?utf-8?B?LzNNSTlHcUYxb1NpWUNscGttL0xkbVBnUm90Q09kY1B5bHVWSFNSSDVtR1ZC?=
 =?utf-8?B?Z3FId2Z2TEwvMnJMMzE2WlhyQVBMeXZkdExpSlBmME1TdFV3N3pwTS9pQm1i?=
 =?utf-8?B?WTdmQnU4dnBSQ2lYVGlNSDUrSi9VTFRDZ2pmNmNoNnZtanVVZVFmd29lME1Z?=
 =?utf-8?B?MDhUL1c1c1lhME44SHFCOUlnMHBaTTBWL0hVVDZZczlZQ3o3S3lycVdjd0oz?=
 =?utf-8?B?d3dEWTc4VUxwWGlGLy90Q2lrZHhpdW1BNHY1c09yWWg4VHBUNDltdzJuNFE4?=
 =?utf-8?B?OWc5RlA2Szk5K2NoSGFTNXBXZE5zYU92TVI3T2pTYlBOaGdUcldNd3VSNEtq?=
 =?utf-8?B?Q3lyQWc1b0JLVmdVK1hWNkthRmlOUXI2RjlxR24vayt6cjRyRmw3TkVCeVpN?=
 =?utf-8?B?a05PMHJDblo0ZXYxeVBKaXFCSWFmdWxQWXZhS1owU3ROWU1rdFNMcURUaFNl?=
 =?utf-8?B?S0lHaUNIUDY5V2dZZ2VQNUFzYkUyaENINmtQMHV0aytyYlJaQzMwZ2Roazd4?=
 =?utf-8?B?dVN0VWZYL2R5SkVoblhBSVk5UzBlODNDRlBUeTJRNXJVTkVRQllWdm9hU3Iw?=
 =?utf-8?Q?/z/8GWMmeeTKDfAZ/evPPKLK4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fae1eae0-d5ee-4145-90f9-08dac3e62d7e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 13:11:00.3416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QmnOA4mztcfYva0z/O3dzhzUbX/Psw01rlt/kcxOoOYgHf1ZYoI6fM0WZmgfQRvHrvYW7XOORQaEuJmNfWQEBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6790

On 11.11.2022 11:42, Luca Fancellu wrote:
>> On 9 Nov 2022, at 10:36, Jan Beulich <jbeulich@suse.com> wrote:
>> On 09.11.2022 11:08, Luca Fancellu wrote:
>>>>> On 07.11.2022 11:47, Luca Fancellu wrote:
>>>>> Now analysis-build-coverity will be called, the best match is analysis-build-%, so again the dependency
>>>>> which is analysis-parse-tags-%, will be translated to analysis-parse-tags-coverity.
>>>>>
>>>>> Now analysis-parse-tags-coverity will be called, the best match is analysis-parse-tags-%, so the % will
>>>>> Have the ‘coverity’ value and in the dependency we will have $(objtree)/%.sed -> $(objtree)/coverity.sed.
>>>>>
>>>>> Looking for $(objtree)/coverity.sed the best match is $(objtree)/%.sed, which will have $(JUSTIFICATION_FILES)
>>>>> and the python script in the dependency, here we will use the second expansion to solve
>>>>> $(XEN_ROOT)/docs/misra/false-positive-$$*.json in $(XEN_ROOT)/docs/misra/false-positive-coverity.json
>>>>>
>>>>> So now after analysis-parse-tags-coverity has ended its dependency it will start with its recipe, after it finishes,
>>>>> the recipe of analysis-build-coverity will start and it will call make to actually build Xen.
>>>>
>>>> Okay, I see now - this building of Xen really _is_ independent of the
>>>> checker chosen. I'm not sure though whether it is a good idea to
>>>> integrate all this, including ...
>>>>
>>>>> After the build finishes, if the status is good, the analysis-build-coverity has finished and the _analysis-coverity
>>>>> recipe can now run, it will call make with the analysis-clean target, restoring any <file>.{c,h}.safparse to <file>.{c,h}.
>>>>
>>>> ... the subsequent cleaning. The state of the _source_ tree after a
>>>> build failure would be different from that after a successful build.
>>>> Personally I consider this at best surprising.
>>>>
>>>> I wonder whether instead there could be a shell(?) script driving a
>>>> sequence of make invocations, leaving the new make goals all be self-
>>>> contained. Such a script could revert the source tree to its original
>>>> state even upon build failure by default, with an option allowing to
>>>> suppress this behavior.
>>>
>>> Instead of adding another tool, so another layer to the overall system, I would be more willing to add documentation
>>> about this process, explaining how to use the analysis-* build targets, what to expect after a successful run and what
>>> to expect after a failure.
>>>
>>> What do you think?
>>
>> Personally I'd prefer make goals to behave as such, with no surprises.
> 
> The analysis-* goal requires a build step, otherwise no analysis can be performed by the analysis tools, so I hope we agree
> we need to integrate that step as a dependency of the analysis-*.

No, I'm afraid we don't agree. But like said for another piece we didn't
initially agree on - if others think what you propose is fine, so be it.
I'm specifically adding Anthony to Cc, as he's been working on make rules
the most of all of us in the recent past.

> I understand that the analysis-clean might be a “surprise” if not well documented, this comes from the need to substitute the
> tags in the tree (to keep the real path in the report log) and to revert them back at the end of the analysis.
> 
> So, such script should just mask to the user the analysis-clean invocation in case of errors (with an option to don’t do that)?

Hmm, here you're saying "such script", which looks to not fit with the
earlier part of your reply above. (Just in case that's what I was to read
out of this: I wouldn't see value in a script which existed _solely_ to
make the cleaning conditional.)

Did you consider the alternative approach of copying the tree, altering
it (while or after copying), running the build there, pulling out the
result files, and delete the entire copy? Such a model would likely get
away without introducing surprising make rules.

Jan

