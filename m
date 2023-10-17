Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E47CC096
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 12:21:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618196.961560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshCV-0006jx-GC; Tue, 17 Oct 2023 10:21:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618196.961560; Tue, 17 Oct 2023 10:21:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qshCV-0006ha-DJ; Tue, 17 Oct 2023 10:21:23 +0000
Received: by outflank-mailman (input) for mailman id 618196;
 Tue, 17 Oct 2023 10:21:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ibp0=F7=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qshCU-0006hU-Fw
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 10:21:22 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea07e859-6cd6-11ee-9b0e-b553b5be7939;
 Tue, 17 Oct 2023 12:21:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB7912.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 10:21:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%6]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:21:17 +0000
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
X-Inumbo-ID: ea07e859-6cd6-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WjHslxwUOJmbYA/JqWLARgSwMkkZSrglf4y2abPYDwoHJrxh1R7C6HU3a+oX/12IthbToiW/PoYWWlwLC5V4oy6BJyZxUAPnYv3rWYfcwqM95HZv+pN8r1kXjfJXyNNdKgd1XAUNXhCl1RvHG5PhprXRBZN5Ut2JiBlsN0SSrOHUWTm37LQMw0Kqd3VHSh29T3mKyzq+VHgUiFtx9Zpc2sLmwZiCTK5AX5qgtIFia6KvxLVOEwgXw4XfcmLlDHZXE527gtlRMjK4lGngg4fub99ouxpusqPGnXtvIZ7nPXmCsRC53b1912O7bXxLxTxqTQDT0Yl68CuMCVpdWU2PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hCgZxeitP2+HCZ+vg9RhnABHm13mpgjxXdjuE67eH1s=;
 b=DfRyMnU4F5F+NClZOzm+5oAmQLh9NCFUtKICz3lGboN5hvhEws+/7XBFZ7jNMOdteuMNwNSMb1QdP89Jt4OYif514hdzB+zf0DoYfQNmjrdQlnpcbgXp/1Z+gut5NcilVxXeHeIbiSCopWJlFjlfsCtk+tqhr4OV9LxyI7wRQv5eYn4ISuqfUcY3iuWKtedjnDIql5w7h7g/EFtgNQhtcl990SyTzKTYWQ5Gy7kuJUlz3K8aHBqaoqtffCa1VZ2LthBcjCRutI2HfytaULg8QKM6XCSQpuIJph7e7+k5E9L4TPUvuse1nK2GUGHtgIBnOW5NGGEgROLBfWMOmeR8hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCgZxeitP2+HCZ+vg9RhnABHm13mpgjxXdjuE67eH1s=;
 b=tY6/ukd6J3tWosKgCw1ea2d+m4DAcxhSFryal9T4q88knYkqhHMZvWFFpXjftTuRCqEHX+3aUQQTzZuZwxNLbDEp2eEELKofoQX0ZkmMVHbS45Fh6TY1VTILW9IIEts3xUFuAYzFQ2uV/UZvvCpsEAzRSbqAWQ8/T0lEIixakfIwQl9MBKS1PlKtvwT/aILobqdpkaZl41ljmHbgDDBSbsEX460vzZaEKmttlGvXtphWeRI2pCUy63+jLIf720h00P8Q/rN9h6G0zmCzGNi4HwLh/iGN3WHExHbj4q8VGM5EdnoBDMtDoSONhYY2YHqhpJFYBVY/sx1qtWj2eFZSlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ce39ddb7-56f8-c807-053e-68a686f45920@suse.com>
Date: Tue, 17 Oct 2023 12:21:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH for-4.18] docs/sphinx: Lifecycle of a domid
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 Henry Wang <Henry.Wang@arm.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20231016162450.1286178-1-andrew.cooper3@citrix.com>
 <90e657ad-4109-442e-2b26-52cd2372f582@suse.com>
 <a0fbce20-4022-477a-b150-d8662dd0aa68@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a0fbce20-4022-477a-b150-d8662dd0aa68@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::12) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 6223ec5b-c97b-4909-e3e2-08dbcefaccd8
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sT4pJ91UG3+j80RdMAmI3cmLtqCtA+ScFkAMREJOAUxzx5xfjbAh+DYscH9nBFD/6yOWFpk40WErVoFWKrtuDDIRrMAkDL96W6YyfO159rZgW0BQG/fvol+3bKvJ8yhpfzdpH5O6ibzVVVfiAX5gyR4GjUmr13f1e74082KbEbdAutZzYgFtPGCqMmm9h0O1JujzjGn/wWGMRQ0sg5bvwm2yhGc0B50YJRWCPXaya/u6s5vJqmr8okPWEVUiWOSS6y2mpLq88k39m6QGhIngnULk0w96DYrbUBkQsIXv5I1JgX48UuMi7+zq03jwJrZ2Q14Li4PYcuWez9t7hViVQ6W5ZkhKuwNqspV74pkd8giEPP7TGDHx3I8/uPsXnW0W9bqN+uPhMUFDClXnhNcj4VGzjGDEHs4XEme57Fzz66jWUTl0kRelwPMXPRdW3viqyl4IJgzfVQrR8f05gb1o3XbhVNQgxxqXlW/nR19FIHVXVpo2A12CrdpSvXOpDmiHXajz/TkoVdQBUNsHG68ZwkuH7yvpE2VLR6YZx8NouzKPGQ1VNVkCA+GSN0ehMfg2UoWkiHrQOAaOrQH6y17f6Aul+uyHIVSUQOF32J5Ckt24+Q+bZUTdjYBkxadParGc7jxiZhGTiQQN6mAguJJfow==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(366004)(346002)(136003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(26005)(53546011)(41300700001)(83380400001)(36756003)(2616005)(6512007)(86362001)(38100700002)(31686004)(2906002)(6506007)(31696002)(5660300002)(6916009)(54906003)(66556008)(66476007)(66946007)(316002)(8936002)(6486002)(478600001)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzNFWUQvZmhqRzcrVXRpQWNxa3o2eTBtZXRkY3JvNGxOSGhnQXBoR1YxVHZF?=
 =?utf-8?B?S2czVGp5VnVaa3A3QzJXdjR5c2pia2NRUStERVZFcFdhRmFYeXExcHNnZXoz?=
 =?utf-8?B?V09CcmFBU2VjWmxXMUIxM3o1bFBmN3hJRkhkemZkdEtJZHhsZ2F3eThLT0N1?=
 =?utf-8?B?bFlZN29IUE9saUJsTWZEdEZRdk5PcXJPdWtjM0U4b0M5OUNpbnlaa1dGQWpv?=
 =?utf-8?B?eTUwVWhCLytkZ0I5YitCaDg2L1dxbjZ4VGVkM2ZYUXNUeDlYUGN1cjQwQXNU?=
 =?utf-8?B?VUcwZG1YNlBYeDgvaTVUcjZGQnJVUjFoRGJkV0I5ajhvczJmMHpIMWcvUGY2?=
 =?utf-8?B?ZzI2U0JGeDhZd2xvSFlEQ3dTNE5yNzY4OGRBUjVwWFB1RmNWZzFjS1VPYmJx?=
 =?utf-8?B?VmdnV3REVWM1UEVqdjRicXlqRW9NVXRSMXd2YUhZZTd6aWN4Z2Y4L3FXd21o?=
 =?utf-8?B?L0RmUCtVUzJkTVNLaC9PdjQ3cWM0V0xJNTZmZmhXbkgxYTI1QWYvRkJ6RGw1?=
 =?utf-8?B?UWtPWlNucDZYb0tNNTREZ2UvMWtoVWRFNURKTWxXejdieHZTeUkyRWdwbGNR?=
 =?utf-8?B?cjFST1BVZFpGMW94UG54ODhtYnZDSmRINXhwN1M3QWRGL3FWcnRtdEdycTJ0?=
 =?utf-8?B?SG05SVFKRmVCTmNvT3hwS1pyQkpnRDlCa3ZnZFExRkkxdTVHQVUvVmVpYytJ?=
 =?utf-8?B?NTJWQ1FXR1ZKcW16bEJVNFd2Tk16VTk1R1dPR01iNDVjOTdZS1gyc2NFWHF3?=
 =?utf-8?B?ZVZGVWYrME5MNXhZMDZlRDQyUm0zWE9IMVhwUlc5VURvZXQxUEFqY1lmS3c0?=
 =?utf-8?B?Y25JaGFYOFkrNVhzaHRxNXZrb0hpR3VDanFTNVNvVGdsMS9kRjNTUzhBUXRT?=
 =?utf-8?B?OGZ2LzBhQVNwN2FjQ1RuT2ZJQmdaK29Uc09QNXRUSUJiYjBsRllRSFBRdmUz?=
 =?utf-8?B?S2dGKzBZN29OZy9WZWVMNEUrWXRJNC8yVTVEdWNTNWJRQThGZGZwRzhpWExo?=
 =?utf-8?B?SldxSEtWazJUT2ZRN2pxSGVVWE9kR0wvb1BrTlhRdWE3WHlYWEM5RXRoSHAv?=
 =?utf-8?B?a0x5eFdhWWJ4bFdLZThTSC92NUl4YnExTURyZW5YZmdiUUM0VmZJTXBjMVN6?=
 =?utf-8?B?aE15ckpCbzhLaU9nV0FBMUxuVDRuMkVCVGhZdEZhbTkweGxsbmt0cmZUNW5p?=
 =?utf-8?B?cW4xdnQvMFBnQ1UwYjlBdGMzY3d2clpHUXRHWGYzVmN4YjFKb25TZjltQ3Vh?=
 =?utf-8?B?ZWJRUFB2MTNQeGtNdWptSHY5VXYvVUhLUnZiTGhLSmxmOHQya0F0ZlZ4Wndp?=
 =?utf-8?B?SkdwT3BjNHRYRFMxSTBLeUxZSmFmZHFVZ291OU1HZXVxdzlGUzFDck5Kckt0?=
 =?utf-8?B?VzhKOFRQZW1PLzhuOWVkK3M1M05nNkRXL0lnSjl4dTJKZElNOHlhbGlRWGh5?=
 =?utf-8?B?aW1teHg3d3ZUSjFHaW9NUFBzWTFnV2x6ejFtdzBLWXFReVllckY1WCtaeEor?=
 =?utf-8?B?eE9KaVp2UUhVbWtjSXJLTlduQWg3dWR6YVVzaENFbVN1S25yUE93ZHZBbzIv?=
 =?utf-8?B?dVVzWlUrUEp3cXN3bjVyQnVRVlFYV2ptSnZySHl6Um5ZS0d6akdjNWJkR0Yz?=
 =?utf-8?B?VmNmSzdsYkpjNUVvbFYyeDRSeUJLZDhKS08wWmFjK1dlS01vcUNhSzNFdTJI?=
 =?utf-8?B?VTlnMm5jb2tUWWxLb1JUc00xOS9TVm1udTBjQzdZVXdZV1VpZHBXeW12Ty9N?=
 =?utf-8?B?K3hmYjZTN05sTHhucXl3aWx0c3ltWllyYjMzM09CWmVVdUdoN29kZ1J3TEZU?=
 =?utf-8?B?RmdlekpIRlB2N216d1NKRFkyYnpGYUNRaFlxWFlBeVROREt0WFNhbzNjYktR?=
 =?utf-8?B?MzdGK1hrVk1vYkZQVm5ROWJ6UjVHQUlEVS91d3REbTFKb2F5M1BBbmV1b0p6?=
 =?utf-8?B?K1p3VHR2cHBEYWNuNFVPejBaNjhwU3dRbEVZR1ZuL2JYU1VxL2RIUm1mTmRQ?=
 =?utf-8?B?MFVTZ21PR0NBOHlhOGFuSXdUblB2VHpyZXp2ZjFyU2tNSnlEQXdOZHRGa25X?=
 =?utf-8?B?ZWZVS002bDl5M0RaQVNCMURYc2tVb0dHSmhFMmdOSXJtL2p3aUZ0aEd1MnA3?=
 =?utf-8?Q?GNg5xq9erbMIEWcQoM2M7OrmV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6223ec5b-c97b-4909-e3e2-08dbcefaccd8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 10:21:17.8092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MIlNt020CVKlbnmnKv85uK0CZV1+OShAPWR3GBLjszrm+A1WFnFrCmMWSVeEYdCKGZMibCEYEywIp1pH3W6T9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7912

On 17.10.2023 12:15, Andrew Cooper wrote:
> On 17/10/2023 7:34 am, Jan Beulich wrote:
>> On 16.10.2023 18:24, Andrew Cooper wrote:
>>> +Termination
>>> +-----------
>>> +
>>> +The VM runs for a period of time, but eventually stops.  It can stop for a
>>> +number of reasons, including:
>>> +
>>> + * Directly at the guest kernel's request, via the ``SCHEDOP_shutdown``
>>> +   hypercall.  The hypercall also includes the reason for the shutdown,
>>> +   e.g. ``poweroff``, ``reboot`` or ``crash``.
>>> +
>>> + * Indirectly from certain states.  E.g. executing a ``HLT`` instruction with
>>> +   interrupts disabled is interpreted as a shutdown request as it is a common
>>> +   code pattern for fatal error handling when no better options are available.
>> HLT (note btw that this is x86 and HVM specific and hence may want mentioning
>> as such) is interpreted this way only if all other vCPU-s are also "down"
>> already.
>>
>>> + * Indirectly from fatal exceptions.  In some states, execution is unable to
>>> +   continue, e.g. Triple Fault on x86.
>> Nit: This again is HVM specific.
> 
> Triple fault, maybe.  fatal exceptions terminating the VM, no.
> 
> For both, these details are not important for the document.  This is an
> list of examples, not an exhaustive list.

Of course. But I would recommend to avoid having examples which don't
describe technical details correctly.

>>> +Destruction
>>> +-----------
>>> +
>>> +The domain object in Xen is reference counted, and survives until all
>>> +references are dropped.
>>> +
>>> +The ``@releaseDomain`` watch is to inform all entities that hold a reference
>>> +on the domain to clean up.  This may include:
>>> +
>>> + * Paravirtual driver backends having a grant map of the shared ring with the
>>> +   frontend.
>> Beyond the shared ring(s), other (data) pages may also still have mappings.
> 
> Yes, but again, this is just a examples.  Other data pages should only
> be mapped while data is in flight.

Hmm, blkif's persistent grants are explicitly not like that. All I'm asking
for here is to insert another "e.g."

Jan

