Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 399637E6493
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 08:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629484.981762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zhx-0008LP-Ro; Thu, 09 Nov 2023 07:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629484.981762; Thu, 09 Nov 2023 07:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0zhx-0008Iq-OO; Thu, 09 Nov 2023 07:44:09 +0000
Received: by outflank-mailman (input) for mailman id 629484;
 Thu, 09 Nov 2023 07:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r0zhw-0008Ig-6z
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 07:44:08 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c24bb506-7ed3-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 08:44:06 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8702.eurprd04.prod.outlook.com (2603:10a6:102:21d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 07:44:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 07:44:04 +0000
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
X-Inumbo-ID: c24bb506-7ed3-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwiuu4C9QORxCZ32o5o+nH64+CL2e3pCe7RHdQlCKwIX+uLTBg1uegqOL3jWA/mVkVWX1KCBUUOCQaoUnBhK9oTcBKvhSZbCYpRE/VCYkVVelHdZG7qDBxqgGQ9qs1AznMlgvdr+icPwnzKwOkqSSDRnMDAP92IE6ehu8d/fSKl+f5CkXxKnyca8W4ZJiBP7Ss+F1KCDbYlnIqckmZdjH0NE0GexcUAUUyPNoqfFbMsvVR+wI94gw9acJdY7N1tBJgfUnom+TlR2TVa26XqFg47lJUqZNguazLaCtlu/AXBdnWNI7/7/gIx3Q0wQKmhsnU0dQFWdgUOUvt9lCanTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+G92ePYY7mAP+szFxqnOO97Xd+p+ysQAh4hujfNBqPY=;
 b=oBo6hnMrhE8vfkAS9sX3UYW4Kjt+1mr+quesxftUe5C50JbolHq3PUbqAt9CqBlWXG5HRDRh0kBNAEgni5FFopHMVq00f7jLk5z/tYAuYk7ugYtil2MrWmqq3ZJCnkQnsSXmN87xBLO9u42eganp/VLlRqBRwMRMO02aTldCfdmyw80zAVYKPKJuzt1F8K5CHnUeFWrBgSql/kfufJP1DhF2TGuq3vzF8Iid9hiPAliNWNGlaJJ7NwuAGaarrNO8IN72FNKO9nqWjLBa/u2d0sA0FrNzB0+hkOgoSaUtgoNq4dbpaUBVSSMuiMYhRzXxiXraslZufcZNaclBFy5gIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+G92ePYY7mAP+szFxqnOO97Xd+p+ysQAh4hujfNBqPY=;
 b=NT49v1i+O+EQMq7GUYqkUUdYZNopn+tMOT4bMsh9/IE5XSPQpH1ctSGL6RLsCrY+fJf1fDOtDqlKz1ELE1lOPqoMhGbwk/uoqV4oRs2VCTN+EtRw6NTB3y8QHquARnJHUBbDVeH1UcwPERo49G03rfG92cVpm4/PQnNmRSnyzQYvCq3U1PCS6+H6MHJzhvkJ67wBUE9aD0Q4AZhn/UdJb9QM0jwCCh+/+B6xVNRThRr616ooJS1jc3h3sbn9AgMFhUunkGbwAj1Zy03KJ4pAclKVcFBk01UihpbLVDDyjwFrxzpVhWr27WElHh2E3M4um4HtvFHoxklwb/WIHei/dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9fe17b7b-7c21-633b-01ca-bc4b93a6526a@suse.com>
Date: Thu, 9 Nov 2023 08:44:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19] domain: add ASSERT to help static analysis
 tools
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3f163bb58993410183229e72eb1f227057f9b1c7.1699034273.git.nicola.vetrini@bugseng.com>
 <d67ec7e2-a606-ed62-150f-08e3c1c9aabe@suse.com>
 <44df74cb532bfb9642b1c8752ee8c0d6@bugseng.com>
 <2c8c246d-caea-5c8b-4a2a-83248422c48d@suse.com>
 <4a58abb52afed75a748440f1adf9a2ac@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4a58abb52afed75a748440f1adf9a2ac@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0398.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::16) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 303936af-d236-4828-7cf6-08dbe0f7a556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n82iWstZUhtkru4iOi8AtsF9Ly5nmjOherbfK/GU6po1kdMzaI+U79kccu7T1SgIJYf3mIu/JtUdI0AFGwAUZ+PaGmrH4nH6UOwB6yy0bATEFcPtmMv/uKCWI0BrWZz926y3DC0Usgn0JH44bQMkEHPdrKpmeIIJvovHwsbDqLQJwFl1GqgdKW3/b+anW9Xg1WcrTybYJUR+rhjtrfh7KThoAjs/xtZef/AXONbQfoG3VkUt/E3+oWsf70mSA+DMBs+Apqf219RKCCP4vkzg7d1MoLdiwDiPtJnmY/UOh2sqV+/VVzs9lRprNyM2s8/y0stNKpKSkT4Wjqg2Juhh+4ME2MmzGia+1OasJwQBTWjHAkUIIZbwrJUpRR0TNU9r487z9JYRfBcLa2p+Z9ZL77WfOtDCAv9DgMlQOi1YY0I92oG2Y8i4ONTnSoVoRp5gLda/DSXlTmpcd7pesTvnHiDkwU66Cvcd3zJxo3zdDqweTev3Z+GhnsKp6206fC70ofXVy8LpVGEqJo/huyMin9OZBr4Mh1LTF/0/pK02FEjC5VocXj40+Ykc9pzH/nLMsTxufDaef2qVLixUgZqZoOMHs3uJP2SLz58A54o1b20ngU2L7oPbYqQCt/mBuA+E2XLyUVIdmArYpJkq8+A30g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6512007)(6506007)(2616005)(6486002)(6666004)(478600001)(53546011)(83380400001)(26005)(2906002)(7416002)(5660300002)(66556008)(6916009)(66946007)(41300700001)(66476007)(54906003)(316002)(4326008)(8936002)(8676002)(38100700002)(36756003)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHJGWk9ldWMwbzVNUTVtOTNqa2lIYnhiWitJcG1NR0k1b2NaL3N6NDdEcEFp?=
 =?utf-8?B?MGY1Ris5QndLZE5vNFp1SFNnNVJzd3Q1YW92UjlkK2ZSSTVGZnZyUUw5U3RK?=
 =?utf-8?B?WXJla2xPY1NZSDhtNEZYYkxJQlFWK3JiK0V3TVNFMVIyR3dYdHVERlMrYUJ6?=
 =?utf-8?B?NlVlZi92U2huTXNoelh3RjJSdi9QZG0ydmU1YXJydUt0dEs3aDJiSU1IVjdw?=
 =?utf-8?B?K3h4d1I3c1dVTm9OL2ozWmNSMU9DcXc2MWVvUktsbGtNYzFObDNEamV1aFAz?=
 =?utf-8?B?Y3VGcU01czlEaUEzSnZKUU5udUdrV0V2Yi9MdU5Wa3JpQlUzeEZxWjU2Qk5j?=
 =?utf-8?B?MVVodEJicGpQc3lGRTlLSWlxNCtZMEU5RURGK1F3Y3dhWW5odnExTlF2dmh6?=
 =?utf-8?B?RURMeVZUWmYrK2NQMytWMkl4ZUV5Ung2MW8rSDBUL2FrU0NRamhQcE5OdU4w?=
 =?utf-8?B?YkY0RlM2cFNlUmpYUHp5cFlDc1c1RFhNY2VSWGFTR2xYeGZGLzZocTBlc0FB?=
 =?utf-8?B?K21IcEFEMUJpc05XZ1kweGx0ZHhpTFF2cHdrbEM0R04zditFK0dsWU9TMXVR?=
 =?utf-8?B?dTNvRWE4b3NVeldzWkYrYkJUdkM1SEJXbGhwMk1aUm5ucDdJVXdTTXZUVGpo?=
 =?utf-8?B?WEtJMUJDeXFhZy81OEJpU05FZWNWTkpqeWE3dnNXSkxpdWlhaGlKUXBNdk84?=
 =?utf-8?B?NVBPZ3Nockt0ZnlKeEdHOUEzaGl5MWswUEJOYlZ5NVRyTVhyMUpLMEx5YWh4?=
 =?utf-8?B?RlAvcktYMHVyZGx2ZTlhUGF1Wmh5eEoxWkg4cGlDbUUvWHBtUlNVdFZuL2Ex?=
 =?utf-8?B?UlJrVnBqVkdzOGozK1EwOVgrSk9VT0w1VG5OdlI5REpXMFF3ZStjRnhHcFVO?=
 =?utf-8?B?OUhybnQ1d3BYZjF1V2Y4cjVmeW9rSVRWL01kYm5Pd1hmV0lGRkxRVUw0Vmti?=
 =?utf-8?B?dGNhem9jbk5DaWYxWDdaaXFEaEZieG9jVFZMcCt2MUNQd1NWTHJST2dDVVJ1?=
 =?utf-8?B?MEJkRmJFaWZNSWl5a2lxZ3MyZHdLeStTQm1MWmtxODMwMmo3eHc5ZG5pNFQx?=
 =?utf-8?B?dXcvZWlCWkdsQytOblNkNWQ1bWYvNmtqVm5QN3UwMDZHRjVSOEpWRXpDaU1s?=
 =?utf-8?B?a3ZhSHd2UmQycEM3UlpsTGRXWFJXeWQ0eUlCL2hlOVFnNm9DVUVXV2haM1dY?=
 =?utf-8?B?Ym16b3dWMURRNzEzMEdEZ1MxMHhCcUU1SkdQQzJsY3lnVkVQYS9GK2NUZ3ZJ?=
 =?utf-8?B?a3JWTVpyQVNWTHVQYXIrUCs1NkliUFBHeW83ZTZuWjJmeloxWkQvUGY2R0Zt?=
 =?utf-8?B?enNrSEdoeXpwWnRjdW5MbTVVWFhLQ2k1dXV2L1N3THdXdnkzK04zSlhOWUlx?=
 =?utf-8?B?V0swamNvOTVzZTVjbFhhUGpOS3BKc1AwRTg1RlZYczJ4Nmk4TjBpTXdXWW9I?=
 =?utf-8?B?VlRjSmlqcFpnN0tQTlhnMGdzOElMc1VuN3BPcllEbEwwMDluemNDdHVtT25a?=
 =?utf-8?B?RVNONlVYakFlbWhiemZvaHpYWEk2OHZPMVBQc3A0eTJaODJSdEZ2YkxhVXVj?=
 =?utf-8?B?QVpiQU52NEhRWHIwUXppTWExcHdmNVlvVmtLNzFuQnpxWDBHSUVZcVUvQW96?=
 =?utf-8?B?ZDhtQkNsT1B5VlZsMXcxMlV1ejBVM3lBWndJYTYwcWN3Q056cGF3bVNGQjJk?=
 =?utf-8?B?MEZDU0xtSmczdGdRbzlZcDYySzJyNHpSdTlIREM5bFZ2MVU5cTVMOEV4emVn?=
 =?utf-8?B?ZzRUZUZMRU53WXVCOXpnaW85ZWxnWE9IbHY1NTZpLzUrMGoyVGNSa1ROdSto?=
 =?utf-8?B?ejFOQ1k4dEc0RmV0RHdNNUZZckZINCtVZGQ0MldGTVpLeWl0aXpWRjdCSlYz?=
 =?utf-8?B?d1pnejBIRVc3Rm1QcUpZbHFiYlNDbzVtU1FnZXFTRGxsT0RvanRqY0xRcEdF?=
 =?utf-8?B?L3JCMnpYYkpKL0xhZDZUbHRtUVprM2hoOHFLdWQ0ZVJmeTRuR2xzSURpaVlK?=
 =?utf-8?B?eEU3eVVtSzdhYTluQlp0WHFlZEUvNENCTGdnWnJOWDNRL0hlQXJzVVp2VlpG?=
 =?utf-8?B?Q0Eva1IrZzBQWC9VZzJydkJEcXp3SnJSU3ArSGQzeWU4Q2pRNyt1aDhoLzdD?=
 =?utf-8?Q?bFkbqxuHfetOOulV/JTVUqNZc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303936af-d236-4828-7cf6-08dbe0f7a556
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 07:44:04.0228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IuavgvUGeC+/G1ySW2M3MgvgxAAD3jh7pU+IUTe48LCntvFmentTc1FftblpfCrfswtHCI9KxhtZKyOGzTd05A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8702

On 08.11.2023 14:28, Nicola Vetrini wrote:
> On 2023-11-08 12:19, Jan Beulich wrote:
>> On 08.11.2023 12:03, Nicola Vetrini wrote:
>>> On 2023-11-08 09:24, Jan Beulich wrote:
>>>> On 03.11.2023 18:58, Nicola Vetrini wrote:
>>>>> Static analysis tools may detect a possible null
>>>>> pointer dereference at line 760 (the memcpy call)
>>>>> of xen/common/domain.c. This ASSERT helps them in
>>>>> detecting that such a condition is not possible
>>>>> and also provides a basic sanity check.
>>>>
>>>> I disagree with this being a possible justification for adding such a
>>>> redundant assertion. More detail is needed on what is actually
>>>> (suspected to be) confusing the tool. Plus it also needs explaining
>>>> why (a) adding such an assertion helps and (b) how that's going to
>>>> cover release builds.
>>>>
>>>
>>> How about:
>>> "Static analysis tools may detect a possible null pointer dereference
>>> at line 760 (config->handle) due to config possibly being NULL.
>>>
>>> However, given that all system domains, including IDLE, have a NULL
>>> config and in the code path leading to the assertion only real domains
>>> (which have a non-NULL config) can be present."
>>>
>>> On point b): this finding is a false positive, therefore even if the
>>> ASSERT is
>>> expanded to effectively a no-op, there is no inherent problem with 
>>> Xen's
>>> code.
>>> The context in which the patch was suggested [1] hinted at avoiding
>>> inserting in
>>> the codebase false positive comments.
>>
>> Which I largely agree with. What I don't agree with is adding an
>> assertion which is only papering over the issue, and only in debug
>> builds. So perhaps instead we need a different way of tracking
>> false positives (which need to be tied to specific checker versions
>> anyway).
>>
> 
> Hmm. Is it better in your opinion to write something like:
> 
> if (config == NULL)
>     return ERR_PTR(<some error code>); // or die() or something 
> appropriate
> 
> this would be a rudimentary handling of the error with some messages 
> detailing that something
> is wrong if a domain has a null config at that point.

No. This is no better than a redundant assertion. It's even slightly
worse, as it'll likely leave a trace in generated code for release
builds.

Jan

