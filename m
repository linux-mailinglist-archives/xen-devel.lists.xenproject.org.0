Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFAE7DC796
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 08:50:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625484.974799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjVz-0003yY-8Y; Tue, 31 Oct 2023 07:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625484.974799; Tue, 31 Oct 2023 07:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxjVz-0003wP-5o; Tue, 31 Oct 2023 07:50:19 +0000
Received: by outflank-mailman (input) for mailman id 625484;
 Tue, 31 Oct 2023 07:50:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yzb5=GN=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qxjVx-0003wJ-8y
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 07:50:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2092978f-77c2-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 08:50:15 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB8068.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Tue, 31 Oct
 2023 07:50:12 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6954.016; Tue, 31 Oct 2023
 07:50:12 +0000
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
X-Inumbo-ID: 2092978f-77c2-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgjIG+3fGOPBbnWZS4GxmBP1JQHIUGddB5w5M0y9g3D/33OlNWkOlIlIS7n9vZNpVSJAv4W1HICqYxB2kNNA2YVukO0wusv2/CFY9X2i7QCxHS65CYIBR9RXUKiqKOZmFTTM7YbYZeSjDQtSTwiY+qAb5ZgOFA4MpXPFhYpLPzkNW0hlAY7SR3KagzHaehjw61kATUFaQwppfqK6l7uc80+0hkQURCNNOgY3C09CPr9WKF3fSvoCt68VvCdave7yo+FdJD6sGDiao8FVl3CEs5s70868L5GO7UzFi9S3Lc3ewRJC/a1FUSm4wCBMDyr/9xl9y95WOU+ixQMwPH0KnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzAsxgsE5+0VfgXqQ9RjpWl2mUnzvmQzPxCNezkDT5s=;
 b=eZsvWnJ86qphFRjSt0Ew38LqwojS2YMKfH9BxxY8vyH9FsgvF29MYP4y+D/43td2qiwqsBEdAoWZbb7U8mE3C947XxsbJdkk02eVqRoq8qgiG6GfkK8o+5z6RIIGaQ3x3/VlFvdGBSZ5ZsOcLUz4EY+q1R+nzyCJO2ok5k3kNJAiJiJTQAmmdEB2jldo64R/2Chgo3lUTrrLcDtMlLMU8bAYR1u1V3pTg5wpdLtQmX94/tRxxoFdUKa2vOvwf8QHnz9iiHqfkDgkhI7cX3zyyw4XQ1FKGjq4S7gT1Qj3VjafMb2HR/g0FBYa8Q5yKRmYfTEV+8N44fZDwHdIezpQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzAsxgsE5+0VfgXqQ9RjpWl2mUnzvmQzPxCNezkDT5s=;
 b=ovBj9yHvoCNe1V9tIdvS0ynYTHgqYg2CAXM6nwlMU8SO7dsxnt+dzo31ZD6hVVyh8lC3y3JuGdY2AXRcgkdlE/+x/FBGTKzDY/8q/KI5sMy3fRU/VPc4P6/uzwH1tBLB3img1PGHskj/rMf4J92rlFb+Kerdo7kx/fFn0rYGFYm/q9bceirHaqYFPZxwSK0IWiKzqTWpjJDuXnQ/3CNDa5mF4c7fusHO2KL9IGgf5/R5Aum6jytWhYMxgeuO7+zbPc7UQ/Z95pWy3FOnm5IqVqBxD/b+CGywZYPwZVOZXjWemVPpiTcTEq/RIw3X70RCNa9SPl5EeoOWTMuN22iA6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a91fbdc6-1307-dfce-4e5e-351138c49dc6@suse.com>
Date: Tue, 31 Oct 2023 08:50:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v5 2/8] x86: add deviation for asm-only
 functions
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
 <79091a4e450b522aedfdd903ad671e705a933c49.1698655374.git.nicola.vetrini@bugseng.com>
 <20677a35-37ee-d959-78d5-d8f95f443912@suse.com>
 <alpine.DEB.2.22.394.2310301557300.1625118@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2310301557300.1625118@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0252.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab9af20-c8c9-4bc6-ac5a-08dbd9e60338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lbgj8mox85QeGRqiI4oFXIk/ToXPg+hfu6aYFijwxBhW+s67fymMuHRUkynTuFXclngzmUqAhodVZQIuTkSXJZQFKG/E7HqlzRSye9RBkUDVWngKy0iEQjE7nqnpWuEuWswkchel/Eye/jF6PfEyV8un2+hxacAJF+Okfc5wnQoKesj4iH36fTWzyukqn4MocQlvJknEpBtGvXnQ8kvrDocdR4GVnYHO5A9TnecUe1752lYFCE4c6C6Bday9wyAJehECU2JFBNXx04PQTSbWMUF5RKF9mghS16IAZ5JLGNDDXNg6+6voTL4Ts8COjXPpNpDLsrs0x5HuJDb4bfzt7L9TljYH6WQtRnOqCuYGA7O6/SLEdUkHJfFlIYNs1RLMkHUW6L0x0xK5m8K09+r9kpvIlxlxthQNzFhjuAXeRVpk0zwBkr5bvQ4eiydGGCNkIN+tQIna+mIEAjxgxQPghuQoA9Xb3MNHx19GSZkF/YNx3cxYGAu4mON1WiSjig8XupPdFNLRG63OmitYNFDfWvjAOLHQcoPhi9cnFJz0Dm/7LBDjQINDY6uhk7bmm1L8YMRsMc6NNsAIR3+KSPwUpwHD5jftHfNbX8uigok2rSd+xkI3kCRNQtMvLw5QCLYji/jICR2GqqYDKG9rnmQC+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(366004)(396003)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(83380400001)(6506007)(6512007)(86362001)(53546011)(6486002)(66946007)(26005)(66556008)(478600001)(54906003)(6916009)(66476007)(36756003)(31686004)(38100700002)(2616005)(31696002)(4326008)(8936002)(41300700001)(2906002)(7416002)(316002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmVBWTl1MU5reVQrS3VIZWs3c3Q4U2FiSHJMS1l3cTlRNU5XbmdaM1FEYXVO?=
 =?utf-8?B?dU45TEE4VnhKL1RPblBoMyt1a3VteWZzMGxlSHRwRXpzYzRpemZaYkdTanI0?=
 =?utf-8?B?RmNaSFlSR3dsOUhHMnlDYWVWSTRPRVNBc2FhZG4wb05aSXZNN2JTUnQrSjRs?=
 =?utf-8?B?NWFHUmowcjBEZ3FxclhIMkFpV0hFdXFhMnNFS3dFWG5uQjFETjZGMzlEd2do?=
 =?utf-8?B?blh2WTMwa1orejhFVVlKekVQbWR3U0N5ZFVJeVZoaFk2aEdSQlUzTUVkMzZl?=
 =?utf-8?B?c1gzVDNnaUZJaW1GYnpVb0MwY3FEa0JhY2FYV3VWR2JTOEsxQmQ4cHVXM3Bm?=
 =?utf-8?B?c0w5SGw4c041V3lSZUxEVzdzd2YyeEVOWTlXSUZBcml6M1MrNVFWMmFJRmlt?=
 =?utf-8?B?SkN4WFdlNE9lU1VXc3JxdWdYQXpiZlRaMGEwRzRoVXdsdHdCNjFBZk9iTlZG?=
 =?utf-8?B?a3R0RFZib2FpaERLTGFrS1lENVJGWlJTZnlPL2NROUFoVGRJUDU1UHJpNU5k?=
 =?utf-8?B?VThza1VRcVhEbzV3OW1VaTFHbDEremIxSEJCMzZHWGwxWFBlQ3l3OHM1ODRF?=
 =?utf-8?B?ODlac2lBSGtEODFqNnoyeXYzMHRDbDlxdnJQU3lwRzRieXlxRGxtTDNFMndV?=
 =?utf-8?B?VkUrR1R2ZWtQYVRYdjQvUFE2MEcxbFJGSWpYY2FhRU9KZklWRVk3QkNVU0s2?=
 =?utf-8?B?Y1ZINHRMR1VTVXNabTBFcHZnMVBDTDlPbHJubW03eTFSTjIvTE9JZlJYSk5L?=
 =?utf-8?B?R3pidjVPZ2xKQ01lOHhKR1pHdW1TSkVEbm9vNVluaUswa0Q2OUlvRnF2cllN?=
 =?utf-8?B?OU80MFVZMlc2WWtkNlNqN3RLdXNTb01uRlMrU0Vwc2JqY3FIUzNZeTI3dlBs?=
 =?utf-8?B?RXhObkYySkZ6ZkhwbkhYL0xuOHVpY0hNOTBsZDBVVmZMYVpRZ21MYWRoaXR1?=
 =?utf-8?B?T1F3QUdqb2JBUXJ4VWtIRUlXUmZCSG5VRXlseW5HcnZ6ZHE5d0pPQXRzWldo?=
 =?utf-8?B?ZndXRlFWV0d1R2tFUFVkSytQdjg2V1BmNkJmM3U3MzdVTkcyVFMzdC9nZUls?=
 =?utf-8?B?K1MwNHpBUjhXL1VJVTZ4YzlOTXBMN2Z4SytldTFrSFhnNHBPaVFTaGRCeU40?=
 =?utf-8?B?SVJKdXkzK1BYYldrUW9ZTlh3enF5MFRjVEptRnNFRFBIR3NzL0FxOWxkaUFV?=
 =?utf-8?B?OXNRbUg5SUpnRTVIdENtUGplRzY0QzNoK2w4ZktNZGd0N2F6NFQrUHBkMDkz?=
 =?utf-8?B?TVllT0NvYXpXWlB1QVRiWTRPb0sraFJsY2hiN2QzS0U4MHY2OHMxODhFY0Er?=
 =?utf-8?B?bFJaL0pyRHJNclg5V1F6TFhLNWt3K2VLM3VKYmEyUmN3UmYxZlRXR3R5MkNF?=
 =?utf-8?B?QnoyNmdMTE94VUU3MDRDaWFoRmhGUkhYR3lTWW95emk0bXM0emxHa2s2Z2F2?=
 =?utf-8?B?MDdHSTB5Zk92cC92Njg4c2h1b0I4UjFYVWRzVVpoa2VaMnBvaUVTVFpIUjZO?=
 =?utf-8?B?QXFueDkwNnpiZDd2TDJMcnBkbTcraU0vL3JXNXpzaDhxcGlZMjBMMmtJQ3dt?=
 =?utf-8?B?cnR2V243a0pab3JZcksxK0dlWXd6eGdDZnBWa3BNRGpwcVZCMDZ6TEVzT3Mz?=
 =?utf-8?B?cmhQRUVKaVlhdGVETGNnTUFSenA5TGR6Y1FKZCtUNGR6QjZmY3hPbXJkMWtR?=
 =?utf-8?B?VzdqS2FYVU9oSXErYXZOOGRiSEN6cFhLejN5SFdEV2hFMTZJNS9VWlcxMjNK?=
 =?utf-8?B?eGJkRURXeGlpRlkvYk96NFZFTEE0ZDg0OE1oaldvTEN0MWJmTnFqMldYeW1y?=
 =?utf-8?B?RU1mZTRuTk5vN1BVT3BLc3dKSUtaNUFmczUybFcvcUYxMU1MK3dNU3lpVVVO?=
 =?utf-8?B?aG5nWXYwRE9DSE51N1I0RzZySjZFSXNvSjRpZWFzZVFHUktMQy9URWhuekk5?=
 =?utf-8?B?NVVuMWppVnNRZ3lVYWVPVlNMWXBhSUZBRjNybllGRXJVMTZVZmtEWWxJaldm?=
 =?utf-8?B?ZXdPbmJPTEl1amNSdGJTZ0g1VWEzdWh5YjFkNHcvbHU1SDltamVmcUVGWWVs?=
 =?utf-8?B?aW9MT05UYXkwY0NoOFpBU2VVWE5GcDZ3dHlIWlhVU1pZbEE4b0dqZkFmUnpS?=
 =?utf-8?Q?qrt/q3Cg9WgoGlJSMTh5A+IzU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab9af20-c8c9-4bc6-ac5a-08dbd9e60338
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 07:50:12.4334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LiXlYyv/BYS7oAEP6ZdtzxkphAzwqXdq+MvNKDRrfv+F5Jwp1EGnCdKSqRR6LqvmfYCa7nBrFyUWCJZ59WHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8068

On 31.10.2023 00:02, Stefano Stabellini wrote:
> On Mon, 30 Oct 2023, Jan Beulich wrote:
>> On 30.10.2023 10:11, Nicola Vetrini wrote:
>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>> @@ -163,6 +163,15 @@ Therefore the absence of prior declarations is safe."
>>>  -config=MC3R1.R8.4,reports+={safe, "first_area(any_loc(file(gcov)))"}
>>>  -doc_end
>>>  
>>> +-doc_begin="Recognize the occurrence of current_stack_pointer as a declaration."
>>> +-file_tag+={asm_defns, "^xen/arch/x86/include/asm/asm_defns\\.h$"}
>>> +-config=MC3R1.R8.4,declarations+={safe, "loc(file(asm_defns))&&^current_stack_pointer$"}
>>> +-doc_end
>>> +
>>> +-doc_begin="asmlinkage is a marker to indicate that the function is only used from asm modules."
>>> +-config=MC3R1.R8.4,declarations+={safe,"loc(text(^.*asmlinkage.*$, -1..0))"}
>>> +-doc_end
>>
>> In the longer run asmlinkage will want using for functions used either way
>> between C and assembly (i.e. C->asm calls as well as asm->C ones). I'd like
>> to ask that the text please allow for that (e.g. s/from/to interface with/).
>>
>>> --- a/xen/arch/x86/hvm/svm/intr.c
>>> +++ b/xen/arch/x86/hvm/svm/intr.c
>>> @@ -123,7 +123,7 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
>>>          vmcb, general1_intercepts | GENERAL1_INTERCEPT_VINTR);
>>>  }
>>>  
>>> -void svm_intr_assist(void)
>>> +asmlinkage void svm_intr_assist(void)
>>
>> Nit (here and below): Attributes, unless impossible for some specific
>> reason, should always go between type and identifier. Not all our code
>> is conforming to that, but I think a majority is, and hence you should
>> be able to find ample examples (taking e.g. __init).
> 
> Hi Jan, in general I agree with this principle but I noticed that this
> is not the way Linux uses asmlinkage, a couple of examples:
> 
> asmlinkage void do_page_fault(struct pt_regs *regs);
> asmlinkage const sys_call_ptr_t sys_call_table[];
> 
> Should we go our way or follow Linux on this in terms of code style?

Linux isn't very consistent in attribute placement anyway, and doing it
"randomly" relies on the compiler guys never going to tighten what
attributes mean dependent on their placement (iirc gcc doc has text to
the effect of this possibly changing at any time). Aiui part of the
reason why parsing is more relaxed than it should be is that certain
attributes cannot be placed unambiguously at their nominally dedicated
place.

So my personal view on your question is that we should go our more
consistent way.

Jan

