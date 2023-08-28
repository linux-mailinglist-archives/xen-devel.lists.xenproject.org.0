Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B15578A5BA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 08:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591365.923746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaVhj-0008MD-Tc; Mon, 28 Aug 2023 06:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591365.923746; Mon, 28 Aug 2023 06:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaVhj-0008Ju-QP; Mon, 28 Aug 2023 06:26:27 +0000
Received: by outflank-mailman (input) for mailman id 591365;
 Mon, 28 Aug 2023 06:26:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UdW+=EN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qaVhi-0008Jo-Ft
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 06:26:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0622.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cebb937f-456b-11ee-9b0c-b553b5be7939;
 Mon, 28 Aug 2023 08:26:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB10062.eurprd04.prod.outlook.com (2603:10a6:10:4e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 06:26:21 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 06:26:21 +0000
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
X-Inumbo-ID: cebb937f-456b-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ/cJAeSqc0m2e2bOV+AVcxxVmsutllKlVdHdUZClD38BKEyZeqoVl0MZy77Oa8+wlIxeBi0VHVqdv3eKbiUSAipSYnbXfB4ZhLMOb6BN0m51qMKy3v4Mm/Z1GaDGarg3KctpA7G2TQI8TARLYaj/UY53TNMbdzr9ybCtCQm1LgXWUf33fcScaTCilX+PM/uMBG8XeJ4yL0643yI2Og9BEyhWI3kk4Stwq9J5PqBVDOoP9z4mQpBOMO79AjVCepC5KsEg4T45nHtYjbWJik31FHq2D/KhWLfYJxXq0cOpn8DEdeTm39incXH2OXcu/k3ShpwnZjF910jyQEh+8vKHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8UOidGIClrirOOYsmFd5eNCoEX1xONL/rumc0CnnaQ=;
 b=WsyAzYL9hi2K3wF+oOo4OOnPeifnmidIpCdWl8q0wnH2Ez5duYp0teHDwCwp2XgfnphMv6VFI3oDCeVOqxxf9Y8EVjOKZOy+g2rAbKxHQRWeSdGTEbK9eUoFqO7iOQF4QWfTTFgBGyFm1k9HOGV5w3r1WDOnq6zWiaX6eHHgdQq0iLavAy9D3jkVTfGuBSlyJG1tMOWOUq802ygcPRPVGJ4zKWFay34ja3QOVK56llHYsskIOY788iz+/X1/hSovlisaVzyT5GimsOT5VvpDkvBQBXXpcLIyvse4DOiLH5WB0kL/MSS9jSbKDdmOSRF5J2iaK3I1L5GV/zkztd08zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8UOidGIClrirOOYsmFd5eNCoEX1xONL/rumc0CnnaQ=;
 b=nEtLOYlQfNtV7D0JZ70xsFsFqPqhiidxPZRmWwLZGuUYshL4hpip4et3JbuREP2t9pLtKjTLyqZnuFGgfuZBg0lh5plExafFKLSNVDpHUwpQKE1ShkMRMfyuhbfH1yTZHmFiyULOoc+LQQQBMeYLyh5nKLpxNOgX04NB9qcRO50g0RRwnmHK3dnOWXNiVKhNHap/vvGCbKqHv8bMdSp7+1jvMv6mS9R1DZXtFJGBk99559msvD/GSH+0XIZcoVj8Qq9VOIjIuVK+ny0q9qWIx75BZweIZVc/osCbOGzELVib9+mGTqFRxdw3b7ipuQJ7DFsSsRSDCQAh6NY2b7smaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b775968-5dcb-eb14-04c1-93b65de9feb3@suse.com>
Date: Mon, 28 Aug 2023 08:26:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 8/9] xen/ppc: Add stub function and symbol definitions
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1691016993.git.sanastasio@raptorengineering.com>
 <2702cfa486aa92e82fccd6393519073f10f4c40c.1691016993.git.sanastasio@raptorengineering.com>
 <1866073f-9611-f5bb-9b5b-05ad463650e6@suse.com>
 <b24f0eb8-5dd3-8fba-fd05-e98bcf45c60a@raptorengineering.com>
 <f725b3a2-6de8-7612-9c51-cea42244ca89@suse.com>
 <a32ee18b-2a9c-5c68-ee65-3052e478b153@raptorengineering.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a32ee18b-2a9c-5c68-ee65-3052e478b153@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB10062:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e99abc-881c-4989-36b1-08dba78fb1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	exSdbXis6vqHnG+V6Jrv2AZUG2RTHz+/LzHMlLfWHp0J6xMmuJzNSqCLRmFo505ah2uUJK3BoTtbfAwf78j2Sw/ly3hkqB53GJPkouXdcEWt8+TSnAE28RawveezFrcXJzj3iGVpilsMritfaxnTQPGnQh6kybo5xfvoQqhIbGNZWKdh0NFhVKR/J4nLZdexjh7ljAryIDlBEEac5G4/iYfYWOleC/qnu1jRKGINHf93rQrZ/eo19PMhZrY+nNfJ3fTRLZlPOb7CBFj0oTCH8yxIokLq4R8TrL13ueJ2j4mUt+WYCffGb0AyN8CuQzhSnu/5PMICRVc0rWi7wHyL3fCOenW9csrKeBKFj2QHRGm8wGG3jtvHos7R+DcSQA0TuHdxqvVfArBK2J/jJhAenH9jxRlNseNhyTcajFXO+1Dvk4gVVLGmVwA3MYFGUIJtJFnurVe25Jy/ABLAQGwtoLYtIepeNZic6G+GuMEAmH90YZ28CTD6YfDYsDVu6wGKr/X1oakI2WDHevIzTzOUiYwNE9/4sxB5Qcqb8Xyy9rgCMkxLNgNYnzEqOf8vhXROw3OzOzysuar/w8Rk+7FBBHqtzJBNvCzeEDww2TKFL1VWDmCdwg0O2lxjt36iwJZS+3Wkuw20Ed71gi7isWaPhw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(346002)(396003)(376002)(186009)(451199024)(1800799009)(41300700001)(38100700002)(86362001)(31696002)(478600001)(2616005)(26005)(6512007)(53546011)(6506007)(6486002)(36756003)(316002)(54906003)(2906002)(6916009)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002)(4326008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eE5HckJmTy9DTGZncStwQlgvOXZuSFdLTSt4dDJ6QmlnODQyYS8wZGhCY250?=
 =?utf-8?B?Wi9PbWpld1o3eklKU1VjaGpUTHZhWWNqVEpranl4UDlHeXM1Ujcwa1RhREJ4?=
 =?utf-8?B?Qi9ZSVArWFZROUtVRVBuaTRMMFRma3N5ZGtXWUV4RWtMQmJ6ZWY5dFR4YkNs?=
 =?utf-8?B?YUsrWTYrbldaM0llY1B4S0hYZ1ZXVmEya2FqUlJMU1VpSEFUM3krSFh2bG9O?=
 =?utf-8?B?elB5aDlDL1FkZC9rbTcvWk4yc2hmRWMxUHdlYTJhMlF3dEVhbVlGQnlKVmQy?=
 =?utf-8?B?MVJidWYwTGZ1R01uRTNTUVlJZzd4ZVlxdmdBSkRWN2IxMTZuVldxQ0lRaXY5?=
 =?utf-8?B?dlk5c3poODkxSjRteG55aXZKRXhaZFp5ODdlVmdoQitUYzBiNm5lTzdoRjZS?=
 =?utf-8?B?ZmVCMmRUYVFQMnpIc25EajNDem10dG4zczFpcFllMEh5Y3phWVRYbGlaYmZM?=
 =?utf-8?B?d29UK1MzdVdXaEdrOWg3Q214MTM5WnVkOTNnSG0yMTBpRHJkTy9lSytxT1Vl?=
 =?utf-8?B?ZENEbld4ZWhiV0JFN2l0dlRIdFhRRjc4NnZqcDIxUFpZb0ZhQlp5UkxobDlm?=
 =?utf-8?B?S1RqdmErYnFJVE1RZ1ZZWDFOVVdSRTdpREhSbGJZK0Zxb2JESUo5ajd5aUYv?=
 =?utf-8?B?dmRkcGFnZFh1cjlBSVM4UU8rTXJ2aGYzNFBvQVRnd0pEY3VmVUNrV2xxb09n?=
 =?utf-8?B?WDYyTElUcC94N1drWW1HN3RDUkM0K0FXbjJ2L21seXV2SnBMRVQzVWdqWGtK?=
 =?utf-8?B?T2pEUHp6UjhoT3E2U3U0K1YyV0U1OXl1MlRBTlBCZnVCSktZRVVNZ3kxY29l?=
 =?utf-8?B?aHcyeElKQXpKdXVQN0dUVjM0ZXlYeWlJQ1ozdk1sZm91WEpUNnRiNW9EYnV6?=
 =?utf-8?B?ZVl4VVdZQmFRYTVPUEhlZlJZemFXaGVLdi9QUC9LUU5CWjRVNUVMWXo0OVYw?=
 =?utf-8?B?amFWT1NGNFVNTXZpays4eXBwMnNXU1FTQ3F3QWFRenVEMkZpR2hVeWl0aWt1?=
 =?utf-8?B?OXArUElkcWlDaGVhRVFVOThFQW1DeDVVbngxV3o0VVRQVXhYZHVIZysrWks5?=
 =?utf-8?B?ZTZ6aWxNeWNDaUE0M2xITlRxelhpemFkMHQyODNSQmtQNTNMWUFOcSt4Y1gv?=
 =?utf-8?B?Qkg3OHY4djZpM1J4eWJrUjRiVUtMSkVXanpQSXRJaXZFUXRCU1dPa0c0L0w2?=
 =?utf-8?B?SGk5T0JEOEMxc2RpSE8xSWRaZWkveGtjWERTbTFhV0RBM2xiU09pWW1OQk5U?=
 =?utf-8?B?YzdUOVllRDhHT0hiR0tFdEJTTUZnOVg4TU4rTmZiRGxLSzdIQWVKbG5FUFg0?=
 =?utf-8?B?emVMd2VjcHplMkduTHBQS1drUlBKV0pXcEwxTXI4emtxZWNxemU5VGFOb04y?=
 =?utf-8?B?dEQvNUpwclV4cXFqVURhSGNmVkFOS2ZUNDJOZlh2MlNmdXBEZHVjZ2I0bk5k?=
 =?utf-8?B?TTZrR3ovMkwyVmJFelhQemtqNDZwOWdhZ21Zc09PdHNmT21SUGlZUUtvcFdS?=
 =?utf-8?B?WHlGOEhLYTI2TFU1UjNUSUJlM3NvdEU3WTJxSjErWW5GVTlVVElXUHl3c2F4?=
 =?utf-8?B?TG9KREVjazQ3cm1mTTlsY2pyc1lBYnA4ZjNXajRqMVZpcHpmSzUrUTdYQUdI?=
 =?utf-8?B?RjQ2KzdiOUpiS3Q5bWJ2L1A2MFkydjVhTXdUZXFVUjNtYWgzZnhtUG5jbmVL?=
 =?utf-8?B?M1NXL29xb1A3Y2YrK3Ridms3VXQ5RTFuKy9VTENlYlFVelZ0TGVVSkRJSExS?=
 =?utf-8?B?L1VTZWkxcVJxVFBUQlZLMlk1SHF4dU9Tb1NYSWlVbm0xdHpMc0lvb2ZTNTdv?=
 =?utf-8?B?eUxwY3luTDRPdzdpTmtrbzB6TndQbzgzNXZ3RDdFWUNUb05ydStHOTBoM0tU?=
 =?utf-8?B?SUtsa3VGWEtaNlBoZTk0eGpYdEEwQmFIUytITndmcFIxTHJaYWFmeDlvS1lV?=
 =?utf-8?B?cWw3TElEQk1hL3RXeHMxRVU1Q0k0ZUt4WENNYUtUdzJ2UE5ZMDE1YlJQRU9o?=
 =?utf-8?B?cW1sejcvckhUUFNNWUZ4elZpZnlqWm9lM0JBRTQ1QTVvK3lhRzFnNXN6bU8z?=
 =?utf-8?B?Q3lhOXZ5R000SXh2N1F2anhuWDBIRTdUcUtvc291WkNtK1Y5MENXcHVPNkVW?=
 =?utf-8?Q?d102KxaVRYYHhmf/FvEKwLKKc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e99abc-881c-4989-36b1-08dba78fb1c8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 06:26:20.9599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mJZqksOyCg1efxvXvYagcR5rrVHibKjoWd4NGdle+r1zMyJkWKlIaRG9lCjfu4KfmToOxdoUeBzMExQW4epjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10062

On 25.08.2023 19:26, Shawn Anastasio wrote:
> On 8/25/23 4:10 AM, Jan Beulich wrote:
>> On 23.08.2023 20:39, Shawn Anastasio wrote:
>>> On 8/8/23 5:27 AM, Jan Beulich wrote:
>>>> On 03.08.2023 01:03, Shawn Anastasio wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/ppc/stubs.c
>>>>> @@ -0,0 +1,351 @@
>>>>> [...]
>>>>> +static void ack_none(struct irq_desc *irq)
>>>>> +{
>>>>> +    BUG();
>>>>> +}
>>>>> +
>>>>> +static void end_none(struct irq_desc *irq)
>>>>> +{
>>>>> +    BUG();
>>>>> +}
>>>>> +
>>>>> +hw_irq_controller no_irq_type = {
>>>>> +    .typename = "none",
>>>>> +    .startup = irq_startup_none,
>>>>> +    .shutdown = irq_shutdown_none,
>>>>> +    .enable = irq_enable_none,
>>>>> +    .disable = irq_disable_none,
>>>>> +    .ack = ack_none,
>>>>> +    .end = end_none
>>>>> +};
>>>>
>>>> I would recommend to avoid filling pointers (and hence having private
>>>> hook functions) where it's not clear whether they'll be required. "end",
>>>> for example, is an optional hook on x86. Iirc common code doesn't use
>>>> any of the hooks.
>>>
>>> Alright, I'll drop the `end_none` stub and leave the .end pointer as
>>> NULL.
>>
>> Yet my comment was about all the (presently dead) hook functions.
> 
> Sorry, I misunderstood. To clarify, by "hook functions" you're referring
> to all of the function pointer fields of hw_irq_controller? Are all
> users of this struct going to properly check for NULL before trying to
> call these function pointers?

If I'm not mistaken, all uses of these hooks are in arch-specific code
(we don't have a proper common layer, unlike Linux). Hence what checks
there are going to be is all up to you. But as long as none of the fields
are used, supplying (stub) hooks is pointless in the first place. IOW you
can leave the pointers at NULL now and still use them later without
checks, so long as at _that_ time you populate them (and then not just
pointing to stub functions).

My main point here is: This introduction of temporary stubs would better
be as little overhead and as little code churn as possible - minimum
number of new symbols/functions/objects, just enough for things to build.

Jan

