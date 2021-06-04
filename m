Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 871DD39B2BE
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:39:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136745.253405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3UH-0001Te-6A; Fri, 04 Jun 2021 06:39:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136745.253405; Fri, 04 Jun 2021 06:39:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3UH-0001Rn-2t; Fri, 04 Jun 2021 06:39:21 +0000
Received: by outflank-mailman (input) for mailman id 136745;
 Fri, 04 Jun 2021 06:39:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e0/s=K6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lp3UG-0001Rh-23
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:39:20 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f45e93a6-59c6-4002-8277-f59c3858cf45;
 Fri, 04 Jun 2021 06:39:18 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-Yyu30a40MPygLc64FXWouQ-1; Fri, 04 Jun 2021 08:39:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 06:39:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 06:39:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM0PR02CA0194.eurprd02.prod.outlook.com (2603:10a6:20b:28e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20 via Frontend
 Transport; Fri, 4 Jun 2021 06:39:13 +0000
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
X-Inumbo-ID: f45e93a6-59c6-4002-8277-f59c3858cf45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1622788757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nsRO0AHjPmE+cPy7mRipsIibB3oWyLfHn/5+4yugeP8=;
	b=IrFunl8jimCfDNP1o3IAqTEMRPQJ8AFtQHoZD/lCem4Q03q+64PZ1rU3OGZcfrZZkiPZ6j
	yL1bAUohsUquN3KIWZgTBZGjc95HUQupZwhSiWwXdQhRGji/VDVMAb4D2+kbY5khyr048I
	aldB0xJYjYOOc1se9oDVBvBzwX4PYbY=
X-MC-Unique: Yyu30a40MPygLc64FXWouQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NThK/Gm4fHHYfrHjadyBW8gmLfLKYZFyWpYg9tfASK1dx8pgebPBFKKdA23YI7HPqvbEI+IPMBuMUUqBhp9+fM7b7AvtGJObRp5V+2qBgQ3Erb8qLqqnGAt1/tHLfx8z5WQDdbTEDyHfyEIvbxogCc+COO53E/rfFoMc8IlDVtdDMsjMDnaSgyu+REW9l6WwKYr8yYIXdMRy2FiZeURiHp6Gbi5GdQBn90tv0djV/8f1oO5WragBXKAkkYyc6oBcPXC3C4O0mmol06iBb7ghqLihLFUgaRy0Z69a/a1enm8EuNAvuspUFEfKgSHf3AMcaCqxlN7wgsLUqIPKgWklwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsRO0AHjPmE+cPy7mRipsIibB3oWyLfHn/5+4yugeP8=;
 b=B4zRbw+BtIUpAGJH9Ogj2/l2L7ZZAb5644IMQd1BZHEptH2InbXW9GRn7jhYcXtpj9FI+EVy/THZWXMTdcKqvXCbWbebqW256IkbVRxt+lLoEKRRoiWflRleHwNcYzxz+9HLT0MkHu4BlBSDGEHsopJPTixbx4k0xFlJn+3Lw4eO0VqwZIAs8/FrUKD6QToY0qg+3zvn8iGIfVvO1DPEvMgVrXQzfXsLq3JnOFOSwpYxwF3H3uT+tGY8hjzGhd4Qc34QNcxvQgurMpOws1dBhRDBE8X0Ctn3GCNUDo4/FLt42SvyyJ1liBBYB4nx2teGB2U4iCXKxR7rRsEI1genYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 04/13] cpufreq: Add Hardware P-State (HWP) driver
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <20210503192810.36084-1-jandryuk@gmail.com>
 <20210503192810.36084-5-jandryuk@gmail.com>
 <1747789a-ab6c-cdae-ed35-a6b81ac580a9@suse.com>
 <CAKf6xps4NuBxMpgCo_duWU1ZXB8x8B8uszb3uNyb6kABxUhNHA@mail.gmail.com>
 <2c3400e8-8236-8558-08e4-37c8b1494de7@suse.com>
 <CAKf6xpvCkzHOZsBY2yMQSVxq844_muaAaKd-JZUQfd7UCrXLVg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2d88b1db-3064-63e1-e197-9318624e6cc6@suse.com>
Date: Fri, 4 Jun 2021 08:39:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <CAKf6xpvCkzHOZsBY2yMQSVxq844_muaAaKd-JZUQfd7UCrXLVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: AM0PR02CA0194.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::31) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40b9653e-aa24-44a2-9d64-08d927237815
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192FC9E46CD2D0B9EA02157B33B9@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rxFSWfY2gJ06HJj697OrIYzxFybulI7yTKjxjE7z+wVwN/2gMV8FqzJdslXMrEvvbt/RyjD+Wk8dOOUKSN42AqYIdMKuaR4PJteJGt67oofUyLSLDGi5MZUHmcA8RBJNsF1ZlXptnQyHbWwMOc4XQRC+fJt389WemZb4G7JQn4L7TUv204a2gmVcYY+ZkJsY7C53u8eG4F50drrBNTUM1o3un1gtNeKbcrLCBkchMWzuIst9OdvLWri2q3z4HeotTALGAumG8yHRyHKvI3qW42XUHxgdgbQXqxKPAFpEIPqoIzeMXmrrdC4uKzFeAxmCKU5RZEK6uicMk7WD/iwZ3t/Qcpl3LUco4kNQze1AkhbNOreNERiqEO0FLCzlnFfIeWrTzknFVoRIAzDH4poY3p6vRDq4KqirbmU7b990Ts7zwQNwfcJrH+Xm45xVOeAwMTK39g3jMF934Yo9qHNVS3+zwlUcOgPqjXx/j2RU1LpIHfyrOTQNUEojwJSfbWjWlWAdUma7JFMxLEif2v/SdGm+AD+edEVMiclrpnaIiqCKcDF5DhsuPsrNZpvTScY/opUxFN0i39bNahRMweF/iKpOV1okR02PtZlZ2uG5q60Jw7bYJYtWJ1tjrwakNc6pZNI0j39WnfBIskdLUDSs0Qr4EgkfejMOOkLpQ7Nq7QoeWeAzY1tVPbWshrF49Uii
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(6916009)(36756003)(31696002)(26005)(4326008)(53546011)(2906002)(83380400001)(86362001)(54906003)(186003)(16576012)(16526019)(66946007)(8936002)(5660300002)(31686004)(498600001)(8676002)(38100700002)(66556008)(6486002)(66476007)(956004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
	=?utf-8?B?aXUrb2ZCekVqUWRIQk1TcEd2WjV2Y01FZmxVM2tKbEJJUVBQRndZa1J0R0VQ?=
 =?utf-8?B?TWNvaE5yeVJwK0FXRURGeS8vY1gzaWVnc3BoVER1RzJlUENFei9YTDIvamhj?=
 =?utf-8?B?NjJvM2tiNWU3WnJ1d3JSZ3lhKzRFVkxxUkJ0bXg4cjcrNnNhNUR3bHFpMXlG?=
 =?utf-8?B?YzgrK2cxZktMMWhaZEVmdnlCQ0hEd0tsRmNpMlpFTElad3lrMGMrNUhocVBm?=
 =?utf-8?B?Z0JlSHNHYjhFSjRrZXB2NDQzK2Y2Z1VVUTFkZURxbUMzby9zQk5VZlFBNUNy?=
 =?utf-8?B?VmU0U2l2eHl1U2ZjamhpUkgrN09XTnJ2K2hmQjVUeFpYRmlZd2J6VHcrekhR?=
 =?utf-8?B?ZDc3aStjejg5K0k4a2ZleTk5QjE5VldlN2x4U2dkemNWd3RrS0Y0YzhGN1Fp?=
 =?utf-8?B?QmdTaThXbktyTzFjb2lzRGRrVExaUXVXWU5mdkYrZjMzQUMvdWdkc3BDWXQ2?=
 =?utf-8?B?TC9OUzVFa1JTV29DVlc2NEthYzBZdXk0eVhNMTEzWWF4ODFSVDhKejdEWEoz?=
 =?utf-8?B?MHk4YlYxNTJLVVJHZFc3NW8wQU9JaTNLb0w2VTNRdzh3cUJIRTNVM0xYbEZ2?=
 =?utf-8?B?UmFjTm5TaFEwRTJCNnJqcGpiWWFkK3hEYUVKRGQ0eHVNeGJmam1jOXROV0ZL?=
 =?utf-8?B?amF6RlhPOC8zeGVZeklzalZrWVdISGRoSkdnQ01FQ0lxSGd2YTh5ek9yOXFu?=
 =?utf-8?B?SXVQMlF1ekpzcU5wb3p3Y2ZXVVlSbDl2ZTV2NzRXdVQ1K3JJazMzOFpFeWZw?=
 =?utf-8?B?d1BBZGJBS0wrRG1Nd0NjRzFUQ1k5ZXpiOU1EZkNyK3RUZUVKNWNsNTU2a3Nm?=
 =?utf-8?B?dG9iMjdmdmhxT0JXYkJlaWpIZnIxQlBTbzN2cmt0NHNuK1ZHTXFEbTNNRTNl?=
 =?utf-8?B?TzZRaFVVYmJBMklXQ3hTR3dhYWk4dHRPeEFJTGQ0dFFHeWw5UWlTS2l0ZFV5?=
 =?utf-8?B?Sm8ySC9QMHpxRUZiNmxvV2luTVp0Yjc3TEhEY0V5NmRBQ0dQdVQrR09WWm1I?=
 =?utf-8?B?aEhMSXlCUlhBVzNvUDZHTWNhR0RUZFIvV1c4aHFGY0hRY05tRkRwWEVsMHFm?=
 =?utf-8?B?Y0d5YmJiZk9tUTdlZ1A4bnlyVm45aGxicGRxTXRtRm92V2plUGtuUlVzeHEz?=
 =?utf-8?B?NHdXY0lLajN3dlkvR0J6WkRtUG82V1IyNm94UFh5SHBGTEw3aFdyaURDOElw?=
 =?utf-8?B?QU1ydlJDdWdnVTBCazV2V2x1cXhwWkxlM1lSdkxyemFkVGlISkZTUkRjZXNQ?=
 =?utf-8?B?WE41WXdkNmNMK090VGlYb29NbU5zbXBUWlFqR1VFS081V2lWREFjNkFDcDl2?=
 =?utf-8?B?M2pMMWViOFJ4czV5b3FXV2pSbEcwY3VKVUNmUVR1WEFOUUl5cXZyVVZ2Q1Zx?=
 =?utf-8?B?Wmw0MWRlcXYzZUV5eGhEK21waUp2T0lFVHlBNWtEQmFTVERYazMxS1o4Y3Jk?=
 =?utf-8?B?VlQvWTNLUEhJR3YyYjZlT09tUzFDa0JNdHZ3UHd5V2c5a0VON0tzcjk3cXhL?=
 =?utf-8?B?UXk4eDNPWEpBc041a0d0Y3JZTGI5UUlBdXdKQUhkdUZGTUp5YlZMOUpkSkJx?=
 =?utf-8?B?bWh4aE4zeWsrWDNRT0IrUGJGR1RjQ1Y2QlFnVlJNUnVkL29UQzZpS29rUXl6?=
 =?utf-8?B?WDhOZzR3UW1HWTZOVXVFcXhJa2NlSnRjclZ6RElLTlVVaG1XRlB1d2doYWNC?=
 =?utf-8?B?SEUxYVNqVHo5Mkk1OFo4alRocEJyUGEvODdmK1REK3IwNTZVa3NSWTZYcUJC?=
 =?utf-8?Q?bKFsH3ugd9LgciDgksA0u7mYVXdz+nfhP3mBN3F?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b9653e-aa24-44a2-9d64-08d927237815
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2021 06:39:14.2776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cd4Z7EnCvuF9fjVN6KFyRDvEFtzVSOpf5r88GbKFKNSdBBR+9//lmvY9F8Er/HwBzdpPkj1ZakNwnlsMhc7csQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 03.06.2021 13:55, Jason Andryuk wrote:
> On Fri, May 28, 2021 at 2:35 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 27.05.2021 20:50, Jason Andryuk wrote:
>>> On Wed, May 26, 2021 at 11:00 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 03.05.2021 21:28, Jason Andryuk wrote:
>>>>> +    hwp_verbose("HWP: FAST_IA32_HWP_REQUEST %ssupported\n",
>>>>> +                eax & CPUID6_EAX_FAST_HWP_MSR ? "" : "not ");
>>>>> +    if ( eax & CPUID6_EAX_FAST_HWP_MSR )
>>>>> +    {
>>>>> +        if ( rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY, val) )
>>>>> +            hwp_err("error rdmsr_safe(MSR_FAST_UNCORE_MSRS_CAPABILITY)\n");
>>>>> +
>>>>> +        hwp_verbose("HWP: MSR_FAST_UNCORE_MSRS_CAPABILITY: %016lx\n", val);
>>>>
>>>> Missing "else" above here?
>>>
>>> Are unbalanced braces acceptable or must they be balanced?  Is this acceptable:
>>> if ()
>>>   one;
>>> else {
>>>   two;
>>>   three;
>>> }
>>
>> Yes, it is. But I don't see how the question relates to my comment.
>> All that needs to go in the else's body is the hwp_verbose().
> 
> 'val' shouldn't be used to set features when the rdmsr fails, so the
> following code needs to be within the else.  Unless you want to rely
> on a failed rdmsr returning 0.

It is intentional for rdmsr_safe() to return a zero value when the
access faulted, so I certainly think you may rely on this.

Jan


