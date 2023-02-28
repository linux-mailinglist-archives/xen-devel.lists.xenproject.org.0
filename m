Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 749016A56F7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 11:42:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503236.775451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxRE-0000Pp-0L; Tue, 28 Feb 2023 10:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503236.775451; Tue, 28 Feb 2023 10:42:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWxRD-0000Mx-TR; Tue, 28 Feb 2023 10:42:27 +0000
Received: by outflank-mailman (input) for mailman id 503236;
 Tue, 28 Feb 2023 10:42:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWxRC-0000Mr-Sw
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 10:42:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95b21a71-b754-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 11:42:24 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8158.eurprd04.prod.outlook.com (2603:10a6:102:1c3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 10:42:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 10:42:21 +0000
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
X-Inumbo-ID: 95b21a71-b754-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVrdxL1cWt21PDu7GsabqAyhDDQCe7Lf6fG1t9kqhYlYrNQogsYqdju60GVhHmpAP3QyLYT6/cTTtp69KQ0UGrhwcxZhjCymH7RycoAzpDAPfeK4Z+g5DLKpKdO/J/bCY7jycILzWR1C3EzyL/YyF6pNbH6bgFLuSaxDdyC27P5L7pIvYsa8jM0UYfaoEigxsbGARX22A0QgAGXKJENvEIWzLPbOQWyR01xwldQf8LnwhPGoeAxCECiOiCQxSiiSX3HOTVH7+4Q31o1FRY/vFcCu3HdsEDIS5Q7Y5fzrDPNV3AE8e2U04BuQr6q6k3Y8Ys3DwMefUp3ZUomrEO5WEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pfztsu1l5t88RbWV5BtA/ZRRTZ4ub6kpIsf2gMuFMT0=;
 b=aWWngwaZk9D52xFxgQq+UFl/0Jx2vVAD8fnBss2yGCuIAyGtyUHzYPeiwMFi1B6Ipa0rzmQq2CtsaD1eYJAYYDhkvB+tza4eOXt0n8RRAanAPfdUPIEMP0J1YcbJtLRAEzlwc5KZH8e6E9WaOvRZN2AQfUW2qsfGeJObJSd2YM54qi5q9w/PKERrNogEIMP00hhaC062DLWIz18hnSL8J4ASMQXzyi1SZS58e0e/EmxY9baAjdo0/DR8dLf9VXoLgjKSTLKssJu0xyZZp6yAsuecUj5en7Eiez97D+qSJM6HPO2xgyR89ROMTijvzST/s/tMliEn0p0CJnKdooxA6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pfztsu1l5t88RbWV5BtA/ZRRTZ4ub6kpIsf2gMuFMT0=;
 b=zjBozS+TPPRyPYpPUdI4H7Mh0a581KLq0ZZZ0V3/D0o9mr1jULvObfyAaHaLZh5mn7hS6tKdjfk4us1fhw6m30BFCiShDNVvkN7RsI7df5x+NcrRKd/mRjqsQgphS/zY1Zc7wK5sk8DIK6oLCZ8OnKhiFtFIzoakIo0wXWNGdoLdgRdAn29rFdBh/xFvygzidUtasJ/kAIxX1+RD0cTg+6Motol29AFWPqVb3lySuj4RSMBFrNNcr4NsAAwqAbv02S2o/oj3OzNCbl5VN5bPLpRlge2WUO/jPjispEvlCW1HdnBL7Sco7ABZQLk0iVwFdqLmyKSEssKpy6aBbRqIwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9b66ee51-17c3-0f8e-0fc2-4ff083952e9d@suse.com>
Date: Tue, 28 Feb 2023 11:42:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1677233393.git.oleksii.kurochko@gmail.com>
 <932b0fd2a211d2d837d00e1bda87a84ad680fe7b.1677233393.git.oleksii.kurochko@gmail.com>
 <f052e88e-1c85-3116-b76a-24785b005121@suse.com>
 <507c5449a56ce5cf5758bef967d511bf545d8405.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <507c5449a56ce5cf5758bef967d511bf545d8405.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: ef367217-2020-4203-917a-08db197878c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S181fOti6hqV6cbN9ZU21dvbYuRTQncjakSb2xV6GfJkX8ys0dD6EMKUhzuTdWuqEOJ6vPebwD1308RRFqIo2DhsNAu7uZ6qGDAjtOsPn6iVX2Mvd4sInOZbmImxIg1ZI1fgQ93+UrauY0fLa1T63xkncIssGKgZa4mnjp4Eses2+iS9kFn9ZParJIW4t/3md3ZVhmFdIZnzk9U51bHcQ2uGvvp/EvuzUfdrWBKGMNWlcvQYft5cm31piVauholTlFvJ3c5QTWwkNu5spB+qrKfJjlUP9soqKYyoy8Ky97Zio+cW4f2lnGthEWEt12XmoixuZqp6kf5hxJ/MRuZvDNLPYJ9xl9uJ0hTK1528mxkUeJcgkIHol6jHd3ZtMCC+mRMNb+A3xwlTliaRKwKl7pBFYTY4Hr24CkSRtkOz8m+HP7HFIW+HRNMEovq1rwue2x0Vdw81LX5KYsx5vP22oLD5WN1Ls0tQFBoazwh5+R4YDiJhXwBd3aKuqC/+pwFN+qGotS7RMjQZdM6YojFIQmdond4WRTxZHbaqgYcHAja1H6V1pfYQCigNjXk3F06HlJWliuT2kO9I3Uz4JRWZhV2yfDT0R4dNMzM7ws8PwoWnUwxMIydWjAH1BwE9uncIuBSESu5GB7WejFmRs3lv8mBWH/lWEYC9yPBrkUg1jER2Ib8QZYeD/P7lg3qLb89ggPhlLFSQvjM7DBgQ+ohE/nrGEKhALAlHEXXY3/RE94uTO/N8V/YCwJ6Zy/DNe7/Z
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199018)(54906003)(8936002)(31696002)(86362001)(5660300002)(6486002)(316002)(41300700001)(38100700002)(4326008)(66946007)(66476007)(66556008)(8676002)(6916009)(36756003)(6512007)(2906002)(2616005)(66899018)(31686004)(53546011)(6506007)(186003)(26005)(478600001)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFJRQXBRWG5JK0tDMm9RWHdHd2NIbHJGYWJQTnpONW4rc0N0RjFSM253K0xU?=
 =?utf-8?B?NE5sbkg0Y2FaWDB0ZUtGSjh6YllYVldNRm9rbE5BcXJvcmVybDFqRGhKNGc1?=
 =?utf-8?B?a1kvRVJVZHY4b3VMWi90UDgzS3NOdmtjNG5SZE4zenlXWHZZdUpZNXNJdnRE?=
 =?utf-8?B?bnJHcVU1LzdUMmtSOFo1WllBU0Fzdyt0SUcrNW1pbExGbS9DbG9MSE9xU1Jp?=
 =?utf-8?B?RXlMNjNBWEY4Ym5EK0Y0NEdZWWZqZ3lRckhkRWRaZmxyZFhQSUVRSHEramds?=
 =?utf-8?B?OWxjblp2Q1pZWHgyeVFacGdCOUgzd0dsUGI1QXpsblp5UjltOFhXL244YS95?=
 =?utf-8?B?OXdXZkFRb0Jwd3F0MkJXZThpTzlDZG1YcGhjNUNmWVZob0h1dlhjWVUxUG5i?=
 =?utf-8?B?MEQ1dHdUQ3o1a2tmT0kwL052aTJXRDNhczJZMUZGVVh3U1oxa1JobndZS0xY?=
 =?utf-8?B?cUZnWlpoMmNxODBsbHNhdEdBa0hDRis3dW92Z1EyQ1dKRytPWGx1ckxIcTNF?=
 =?utf-8?B?RXQ2c2tvRndIS0hKRkRRU2IyQlR5YllHdWxTWjdWR3AxRm1iamZTUEhvcVFJ?=
 =?utf-8?B?MlZsekczTlFqSEhCbzg2RkhWbjRXNDJPZW1GWU1RTWxtQnROODltVU84bUhE?=
 =?utf-8?B?aDZMU2tBZnptdWoyeCthd0ZWS1NENkRMd2tKK0tBZEJrUTM1Ynlyd2phRmF4?=
 =?utf-8?B?emkzOXJwSms4c2ZLQ0o2TVhiWEIzV1Z0TDI2aHlybHVYVzJMTUNQUW9UUXYr?=
 =?utf-8?B?WHROVEtwMElBMkxkR002TFlvdC9wenBFUEd2MlZUMVQrUWN4dmZPa1NrSEMx?=
 =?utf-8?B?bkgrcUtDa3h6anp6cFozeFVXRmxZd20zVitHQUZLdWFBV2tKME15TzlVbUNW?=
 =?utf-8?B?ZkJZMTBqSCtzbTFFK3hER21rYkNmTkh0QlJLVm5MRXA1ZEh6L1ZuNTVHbjFJ?=
 =?utf-8?B?S1hmaWxYSzB3UU56bEg4UE9UM2l0N0NFaGRKdkttWWNET3M1QXNzR3J1ZFhF?=
 =?utf-8?B?WldQSFRCbklrRDVSL2pBTzNUUjUxZDJPMnZwSGo2Z2FHdFl2eUxVWDhPa1ZR?=
 =?utf-8?B?bGd0V0ZMQi9iRFQ2NlhuZFJialYyUTFsOXRJMW1ISm1nRU45RU1vNDc1anlU?=
 =?utf-8?B?UnE0TnZEV0U0OHg4bUJQRmxJeTJDajBPYnVRUG9UOXZQWitLRStrMUxQTUd4?=
 =?utf-8?B?cUFpQ1BYd1B6UXc4cW1lNGpsbkQzNEk3SXFsdXJwOFRCUUNMYnQ2YVdnNFFo?=
 =?utf-8?B?dzhOWHlja2tCMmg1dDRocDN6Zi9tV0FnZmNudmZCditneUp3QmIwRUw1bmF6?=
 =?utf-8?B?TXBaSTdmaEswSUd6Q2grQ0RQY1BUTVpBSmN1TGlYZ1FVajg2M0ZlcUpTY0ti?=
 =?utf-8?B?WUtMdXFGN1FpeFFiY2hrdnUvYXkvbHcyUEZhTzRMaXFZSWsxWklnVU5mNG9J?=
 =?utf-8?B?aVd2UVUyM2VwcmlVR0E2Q0ZDM0xabHlSeE9rSUdBY3V6aXhSdkV4RG5HZzZS?=
 =?utf-8?B?UW1Vd25vL3pRN0R5T1NlcWQrWW5VMFQydHlTcS84ZTYwd3ArYkFvV2IxUUhF?=
 =?utf-8?B?U0RFeEM3ODhrU3E0MGJMNGl1T0M3ZkpzRDZkc1dFY1VnQ0NON2x6SVdWMnVB?=
 =?utf-8?B?cW85SXhlNmk4NFFkUTd1NUM1ZDRmcG5ITEZJTnpxSUx3RGdnTllNc0JFc0ls?=
 =?utf-8?B?MmljemNJNXhlbVNuMlpwbjBRcnFrT0hIZkhETXM5WGFnQXdwVHFmQU5xeUUw?=
 =?utf-8?B?LzVnREI4aVRFWnZkUUVZb2VJbS9JNUxxWFc3Qlozbi84SGwxVlozWUlFNG1K?=
 =?utf-8?B?bFpuMFNZUEVkOVlXY0pkMjVYNmt3SUU0Y1ZwN2RsK3EzZ2VHNS9ndmlERGsr?=
 =?utf-8?B?RnUzVXVlUUMvUUVDTjBqSWpqVERUYURPR09FcGRKMW1Vbk9HRXlZOFJwQW9a?=
 =?utf-8?B?VytiKy9Ta0lHWE1wNUk4dTZyblViZHl5bm5Ec0RueFNZbkUvMGIzamhOV0E4?=
 =?utf-8?B?aU45eEFDc3JjODJLYjNPUnNrd0ZYa2xKWElUZUdpVjRoeFdZZW5HYWkvMy8w?=
 =?utf-8?B?ZHhvY2M0YTZZdDhzcVgrNjl1bnhlcSt6a3VyWlhMdW8weGlyTFhYVmlvV1FF?=
 =?utf-8?Q?Z4Bsp0bq7XASiR0Fcs1uX+0XD?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef367217-2020-4203-917a-08db197878c3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 10:42:21.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ym/HeyKGHyAlh9eSWzY8qQePXSUDVa8c9uQ1uYfRlQHFmvWFD00WEpSq2FNk40FDaDcGdVWERhnvEhFyDULmuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8158

On 28.02.2023 11:30, Oleksii wrote:
> On Mon, 2023-02-27 at 15:23 +0100, Jan Beulich wrote:
>> On 24.02.2023 12:31, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,109 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/debugger.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/kernel.h>
>>> +#include <xen/livepatch.h>
>>> +#include <xen/string.h>
>>> +#include <xen/types.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>> +
>>> +/* Set default value for TRAP_invalid_op as it is defined only for
>>> X86 now */
>>> +#ifndef TRAP_invalid_op
>>> +#define TRAP_invalid_op 0
>>> +#endif
>>> +
>>> +int do_bug_frame(const struct cpu_user_regs *regs, unsigned long
>>> pc)
>>> +{
>>> +    const struct bug_frame *bug = NULL;
>>> +    const struct virtual_region *region;
>>> +    const char *prefix = "", *filename, *predicate;
>>> +    unsigned long fixup;
>>> +    unsigned int id = BUGFRAME_NR, lineno;
>>> +
>>> +    region = find_text_region(pc);
>>> +    if ( region )
>>> +    {
>>> +        for ( id = 0; id < BUGFRAME_NR; id++ )
>>> +        {
>>> +            const struct bug_frame *b;
>>> +            unsigned int i;
>>> +
>>> +            for ( i = 0, b = region->frame[id].bugs;
>>> +                  i < region->frame[id].n_bugs; b++, i++ )
>>> +            {
>>> +                if ( bug_loc(b) == pc )
>>> +                {
>>> +                    bug = b;
>>> +                    goto found;
>>> +                }
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> + found:
>>> +    if ( !bug )
>>> +        return -EINVAL;
>>> +
>>> +    if ( id == BUGFRAME_run_fn )
>>> +    {
>>> +#ifdef BUG_FN_REG
>>> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs-
>>>> BUG_FN_REG;
>>> +#else
>>> +        void (*fn)(const struct cpu_user_regs *) = bug_ptr(bug);
>>> +#endif
>>> +
>>> +        fn(regs);
>>> +
>>> +        return id;
>>> +    }
>>> +
>>> +    /* WARN, BUG or ASSERT: decode the filename pointer and line
>>> number. */
>>> +    filename = bug_ptr(bug);
>>> +    if ( !is_kernel(filename) && !is_patch(filename) )
>>> +        return -EINVAL;
>>> +    fixup = strlen(filename);
>>> +    if ( fixup > 50 )
>>> +    {
>>> +        filename += fixup - 47;
>>> +        prefix = "...";
>>> +    }
>>> +    lineno = bug_line(bug);
>>> +
>>> +    switch ( id )
>>> +    {
>>> +    case BUGFRAME_warn:
>>> +        printk("Xen WARN at %s%s:%d\n", prefix, filename, lineno);
>>> +        show_execution_state(regs);
>>> +
>>> +        return id;
>>> +
>>> +    case BUGFRAME_bug:
>>> +        printk("Xen BUG at %s%s:%d\n", prefix, filename, lineno);
>>> +
>>> +        if ( debugger_trap_fatal(TRAP_invalid_op, regs) )
>>
>> TRAP_invalid_op is, as said, about to disappear on x86 as well. I
>> think
>> this construct wants abstracting by another asm/bug.h provided macro
>> (taking just regs).
>>
> Thanks for the link.
> 
> Nice idea to abstract 'debugger_trap_fatal(TRAP_invalid_op, regs)'.
> Actually we have to options here:
> 1. As you proposed abstract in <asm/bug.h>:
>    x86:  #define DEBUG_TRAP_FATAL(regs) debugger_trap_fatal(X86_EXC_GP,
> regs)
>    ARM: #define DEBUG_TRAP_FATAL(regs) 0
>    RISC-V: #define DEBUG_TRAP_FATAL(regs) 0
>   For ARM and RISC-V it doesn't use so we can skip the check if (
> DEBUG_TRAP_FATAL ).
> 
> 2. Abstract only TRAP_invalid_op in <asm/bug.h>
>   x86: #define TRAP_invalud_op X86_EXC_GP
>   RISC-V: #define TRAP_invalid_op 0
>   ARN: #define TRAP_invalid_op 0
>   
>   I am not sure if we have to provide real invalid opcodes for RISC-V
> and ARM as it looks like debug_trap_fatal() isn't used in ARM&RISC-V
> now.
> 
> Could you please suggest which one option is better?

I don't view 2 as a viable option. How an arch deals with invalid opcodes
is entirely arch-specific (including the naming). As to 1 - since we want
this solely for bug.c, I'd prefer if the wrapper macro's name would start
with BUG_, e.g. BUG_DEBUGGER_TRAP_FATAL() or BUG_TRAP_FATAL() or just
BUG_FATAL(). Further adding ARCH_ may also be wanted by other maintainers
(I'm neither pro nor con there).

Jan

