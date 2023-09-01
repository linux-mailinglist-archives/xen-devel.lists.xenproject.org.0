Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6278F92C
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 09:36:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594454.927784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyhW-0003fm-JJ; Fri, 01 Sep 2023 07:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594454.927784; Fri, 01 Sep 2023 07:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbyhW-0003dh-Gb; Fri, 01 Sep 2023 07:36:18 +0000
Received: by outflank-mailman (input) for mailman id 594454;
 Fri, 01 Sep 2023 07:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cwX6=ER=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbyhV-0003db-JJ
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 07:36:17 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::60e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b44f6cf-489a-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 09:36:15 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7592.eurprd04.prod.outlook.com (2603:10a6:20b:23f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 07:36:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 07:36:13 +0000
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
X-Inumbo-ID: 3b44f6cf-489a-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTF6LrKzdc5kLRMBUKdFSK2zBAn7DpORe0fuqkpfYN7Nf9dklVzcEzBwVNry++tlFyTUOVTsH5kz+ViW18bvJ4YLDsXuhCwyeVzlcNihK7LLOlPKh0Ynz8Z0ZPlj68f2EUSmhYU3h6lQZHybOW15kA2ZIxzJaTPmeJHNvVEFKzrQpjczPc7P2juFxzqZE38tXMBoDaPZJJ5l6WYsHrzG5z8jte1PPC+rFIuhxeSdIlU4+DTC8kFue6wiDyNdK0KzNXiZnEwmaEIMcfEgRPsmF48AYOQAwHvKTwGFp+nJcQUzSia6a3OWSZrj6VsQ4tuU6VKUAnLiQu1ofv3jO23vcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbeZHPuLd0FdzTnmQLzPC1BzwpcIcK69pwrxEUw1Uf0=;
 b=jZSBvN8kakHyWuu0mayNihiF/bvPR9gRXIxtH+fxp5JR7m1cy+3XFdlyZAxL6+XNORIMQxmmn6G6+kZbef7A3HR8R3mKndk+18jMXh+/Y0E2ejE7OpdS14c8PbSPZQtThnXOO2mEMzI6sE7hG/bC3ybv972WWcsK69r4jk1mq65X7mMHiOtNRRKUKMvx/uFj5ojU3injC8M6XmKQjzi2OYR8xvMQO2BsrE3b/WsZNOgeZa/8Nl3BqGIJMcvOz/nu8+VJFztwmF4C0DGdoeZ0YZ1zY68RzFKYf8gg4bxCPPGsFlF3YmhUi4Lz2N94/YmBy3PcVv8ac7Wa/tquLYJRDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbeZHPuLd0FdzTnmQLzPC1BzwpcIcK69pwrxEUw1Uf0=;
 b=pkVH7pR7eHk+XUxUNzo8G4z4qn+vsTAl/TjC4+s7L50P4CyjDxuAWmQ1vpQyCnafTBXMX0Zg9ocV/zkH/IR+jdhpmvl+/OD41kcwId7C+QzVxgG09wnDmZ9i4ScYg0qsUntwMFj/DHCLbI7g+69u+8JGqoJAfFPDgb/uv+zrcRqQEKnF+fCYEovFM1vG0Wsa0sL5sVUETAJyjdrN1+tEqkNBagQ2xw8hnMu412F+ph00BkYSmtGZRmNJe/3lCZJph6oq1KJCHeiHZV1umd5tKhBhCUBbIYMh4Iq3gAbZLPEvPNEDPylZ5Tcij3EH7Ed3idA1cqj+UrV716xjXuRKjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15eef072-d7a5-23a9-a7de-3c16fea49dd9@suse.com>
Date: Fri, 1 Sep 2023 09:36:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH] ioreq: include arch-specific ioreq header in
 <xen/ioreq.h>
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <e5f13920dfcb9f828abb4a36dd410d342f4c0939.1692974235.git.nicola.vetrini@bugseng.com>
 <73a78132-a086-5ae1-2617-fb38c51e64e5@suse.com>
 <f96865f3d7a47e4d9d52ee13dea064e3@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f96865f3d7a47e4d9d52ee13dea064e3@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: de2d2e24-bfcb-4cdf-27e9-08dbaabe1e8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	U70HyUvhL6H1soFOnap8FB20npNBl4VOZNlHJnxzGIuFvYvEkYNkl73cW2aphfK8X2odsf1gOjol4Tt49XYLQhDfMbfS6l3tyXWDzpoV4fy/56Ql6f+6F9xL+bkcEloMc1fCYFGLpjxPcLWZDK0g+WnPx4PaPXHRVAJTbXDIjQOqq+4+PEvU/ZGP5t5AvdZjdZM0hXVDblAb0AYICxvhM0hiu+7d3yGHwrc1nokyNOfS2mbJHMuz06A10UM2SShLo8IDNcy6AT1rUZ2cnOHfJuBcSmDxb5jbz0WausuA2qd4gUYuzp6I2zn0iR2TJL5sIbrSLzLn2r8fRiCGon3GN25WfcSjjKjkvOpwxdYi0hPPtgcykh8NqX0w8JCdcKJ54RIfPMNcqBY4+/TEYDWT2AKI0bFwcIUilQ1uv9Gnyl7CzVRhgfK/9tjYEf3hlEaZVC0fJWVb4I9QEmWqbhBvoTX8tTF97plzW5opYdUpljawtFw4/MXunUfC+S1zuU8VrtzzkUAgelpl6exuAT+0vZNfbnUF/IcMf/sZafLqge8dX033FalcTkt6L6h5+mXa4g+hzbEG3sJytgK7ivbg7WkaFBqijtGnTvUe6P4QMF7eHPD7Xlya0FSYup0GF/tkM1gbsY+oG7fWJis9s26B/Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(376002)(136003)(1800799009)(186009)(451199024)(31686004)(6512007)(6486002)(6506007)(36756003)(31696002)(86362001)(38100700002)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(66946007)(8936002)(54906003)(66476007)(8676002)(4326008)(5660300002)(66556008)(7416002)(41300700001)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Sk9kWWRBN2pwQjJ0WHpKeDlNZ05DbXY2a2JTSmZRemgwQ3VFamlybE0zTEx3?=
 =?utf-8?B?MEJYc2FtTHlxdDBYV05odm5SSXpLWk9IbWVCcm8vZm9OYVNvZXdod2RGSDJk?=
 =?utf-8?B?RXoyZTZoRVBueXJwV1d1eVR4Z29FYkYyVnBJejloVHVLbGFXTTNSTXgwZDI2?=
 =?utf-8?B?bUFIMDZOaGRTTTliZTBYOTBqOTNQL09HUXVjbDhCTHlxTGVOeGY4QTZUeWtF?=
 =?utf-8?B?Z1pQN3J3UUYrcVdjV1FLelAxVnNUdUkvUVlqV25hR2RlV3dWb1Z0NVpaZUVm?=
 =?utf-8?B?cGJMdFRwbUhJY2o1dW10OWp4a2xqRFZBN01HdUorREhCT2VHT1RtQmZsNUI4?=
 =?utf-8?B?c0h4Ung3eVk1WFVVeWVUODlUT3Evc1E0OEQ3UGFGVTRrb2VTZHdWWXVZbGNh?=
 =?utf-8?B?eGliZVhNblk3azBIeEc3RzRocjZPK3lTdUdBb08xNjBaQ2JDNU92TXY0b3NK?=
 =?utf-8?B?eVZUTTNyK0o3eVNhSk1ROTl3enhScFJCbHl4T1lPL1B0clM2NktTaktTWmRj?=
 =?utf-8?B?bE5obVgzYlVRdkVGT2RscWlKM05FZ3RRWGVGQmF4VEI0YzhhNFJHSmZ0Uzgx?=
 =?utf-8?B?a0tuSGEwMzd4VGozZjhMOHlQV3BVR1NxRW1qVml2bm16cWdqem9tT2ZjRzNR?=
 =?utf-8?B?bzNZbFBIaGhSWGNOZmlFbXV2NGp3ZTc5dnNhRXdsKzB1Mi9GOFFxSTFZZDRE?=
 =?utf-8?B?Y1F5aG85NFpUQ3pCV0hoUUdvWDRJbVNiSWhRQVE5Tk1pK2pJdXRZdnJzV2hu?=
 =?utf-8?B?NUNNdVhoUm5WT2NaTDF2TERLWDhFNCtEdExld1R3ZWQvYWFDOStDajlsemI2?=
 =?utf-8?B?dEV2NzljS1VYMWRXNFF5RU5YYmY4MTZUUE9lL0krS1Qrc3dIbFBjUUlPS1pQ?=
 =?utf-8?B?dU5mdVhaSGdHakVMTVlxTzhYc0xxR2E2eGdKOFJ0eUdUYmtsU0ZIZWZXRlR6?=
 =?utf-8?B?T1hZWjFZSThpNHRNU3JPUjJlalNEa28valF5QkxKWjJDT1kxN2ZKalo5d0lG?=
 =?utf-8?B?dzlNNEdHSkZmeHo1akJmdEcwKzYzQ2lTNWZCSE9GeWVaVFNDQVZtQ0JHN0Nu?=
 =?utf-8?B?TFZzVHMySWRoOHR2TTBmUVMxZGJWMEtqL1lCcWgyZjVDT0t5b3pFTEZKTVk2?=
 =?utf-8?B?WUFyQ09Vdk81eWxVcXpjSmlFVk9CelVqaUxXMHlCV094VGp1bzZ5NEtWYmww?=
 =?utf-8?B?TGJYT0k4STkzYUdTRTJMZlEzcWhjM01qdnVqQ3JkR3JHVnFsb1hCRXo0cFlr?=
 =?utf-8?B?U3Yxem1XUEd1bUJKamRxajFHVFlRS01NNDFpdzJBNVFDV1d3YVphUHR5aGdG?=
 =?utf-8?B?WFp4dWduMlVEM1AwUjUrdnNTRGtkUjgzclBIWkpQZ0kwc0JMQy9MR3VsSmh3?=
 =?utf-8?B?dGpRbWdpYkxQWlZmbWxYdUlkSG1yampkWGphSlRhNFFWZ2RadFA1UHlqZkt0?=
 =?utf-8?B?dllFL0dNeG1PV2JXWVA2UHQwMkhEKzk0NnpGUmkvVGZMUEJEeGw0UTd4bTVi?=
 =?utf-8?B?NWJkZkZwNHRCQ1d4eUZCbllidWlNam5YbHltWGp3d1ROSkE2L3h6M0l0TUJo?=
 =?utf-8?B?MisxSnhTejJhbzhEaU10SWd2Nks2c2lKaEdKZTFBMTFyR2QybHRHekZmSnlh?=
 =?utf-8?B?UmJEWGdETEVpenBPVkpzWm5pbStjTm5oM2tQaTZGRndZeEZacU1Qejk0dEI1?=
 =?utf-8?B?d3ZmVVJhUS8zN3Z2MHZEMUw5b3VjMjlVQnp1cERVVjZSajVqQ0IvSDhPYlZE?=
 =?utf-8?B?WG1OMXFPd2Z6NXh2ZTB6Z1FqY3lWWDhiVnZ1OWYvbXJrKzZ3ejhHdStlNjNh?=
 =?utf-8?B?TnB0U1oxS1ltUmFrekZ3NDJEZ0cvL3ZUMEMwYWRVSkdZd0Y0TktLYVRtSWM1?=
 =?utf-8?B?VXBOOWJ2R1pVblU3NDI3MzJZVDduSy9XMUNVQ3AzSXZZUWhlaFg1SUF4RHRD?=
 =?utf-8?B?d2UxT1NUenBiVDNYRElXR2QwWGhwS1ZCanpwOTRNaXNMM1dzdncvYlErdFYy?=
 =?utf-8?B?TUZkNldiYmRMQkdnSk5kVFA3eTNpbzIxVEZtSS9FeXRuNjdWR1RYVkkrK0lO?=
 =?utf-8?B?YjhXWEdSNnNiZk5vdW85KzlGTGdvNE1lbkhaQVhZdGhkK0JRWEt1NWFBQW9l?=
 =?utf-8?Q?FEr99OU1AXK6XCvbdW2kdvv7Q?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2d2e24-bfcb-4cdf-27e9-08dbaabe1e8d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 07:36:13.7487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvN1e1wPWfSvJYKjcJU4N/vUBpjImRh1kIkUM51ueQoPTV08QtSHKUghbbDzdgf/5MM0q6FxfP0aj4rw9wicDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7592

On 01.09.2023 09:13, Nicola Vetrini wrote:
> On 28/08/2023 09:59, Jan Beulich wrote:
>> On 25.08.2023 17:02, Nicola Vetrini wrote:
>>> The common header file for ioreq should include the arch-specific one.
>>
>> To be honest I'm not convinced of "should" here. There are two aspects
>> to consider: On one hand it is good practice to do what you say. Otoh 
>> it
>> introduces a needless dependency, and it'll require new arch-es 
>> (RISC-V,
>> PPC at present) to introduce another dummy header just to satisfy the
>> xen/ioreq.h use in common/memory.c. Therefore, _if_ we want to go this
>> route, besides a wording change here I think ...
>>
> 
> Since including both <xen/ioreq.h> and the arch-specific one was 
> requested to be changed
> in previous series, I was trying to apply the same pattern here.
> If you prefer not to change the current layout then the fix is even 
> simpler: I'll just
> include <asm/ioreq.h> in xen/arch/arm/ioreq.c, which is where it's 
> missing.
> 
>>> --- a/xen/include/xen/ioreq.h
>>> +++ b/xen/include/xen/ioreq.h
>>> @@ -20,6 +20,7 @@
>>>  #define __XEN_IOREQ_H__
>>>
>>>  #include <xen/sched.h>
>>> +#include <asm/ioreq.h>
>>
>> ... this #include wants to be conditional upon CONFIG_IOREQ_SERVER 
>> being
>> defined. (I'm actually surprised that there's no respective #ifdef in
>> that header, meaning types defined there are available even when the
>> functionality was turned off.)
> 
> The two functions in question are actually guarded by an #ifdef 
> CONFIG_IOREQ_SERVER
> in arch/arm/include/asm/ioreq.h (in the #else branch some stubs are 
> defined)

Well, I don't see how an #ifdef there helps with the aspect mentioned
earlier (new arch-es needing to needlessly provide such a header as long
as the #include here is unconditional).

Jan

