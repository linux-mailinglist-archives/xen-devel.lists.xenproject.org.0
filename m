Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0AD623D1D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Nov 2022 09:10:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.441514.695622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot2cm-0004rB-6T; Thu, 10 Nov 2022 08:09:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 441514.695622; Thu, 10 Nov 2022 08:09:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ot2cm-0004oa-3V; Thu, 10 Nov 2022 08:09:24 +0000
Received: by outflank-mailman (input) for mailman id 441514;
 Thu, 10 Nov 2022 08:09:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PT5E=3K=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ot2ck-0004oU-Rg
 for xen-devel@lists.xenproject.org; Thu, 10 Nov 2022 08:09:23 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80051.outbound.protection.outlook.com [40.107.8.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fae5b502-60ce-11ed-91b5-6bf2151ebd3b;
 Thu, 10 Nov 2022 09:09:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8121.eurprd04.prod.outlook.com (2603:10a6:10:24b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Thu, 10 Nov
 2022 08:09:18 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 08:09:18 +0000
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
X-Inumbo-ID: fae5b502-60ce-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imXC9ewODNoFcLlZ8g2twtnP7k7RwIycWi7DgFZ845mJTIUf8rswoDuYbKf6hEEk9wtsffeQCRkXe1pfmk+n+f2OJzRRj4tSc5UpOfUQAkMaL0mZu2U7UoG1mF+DwGSe1dRZoR1mjKv83iZepS53fKM4M7McDEBFvWc+JvQo/rppqGfc61FGCR14/12eeyitZUKjEZj0kd6xZJajNHHG6WLZzFNJ48uNMj/9YzrJIlN2oKkNmalVcukKxzvCsj8rrLmblTrYrXWruIO47NxPKtHDot38MkkKmji7MFjQbVhmcx1iy/ELC+sGVgmCPvk36Ixgn5tjGW3SVvCCEPGnfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVSJXv1ijN7Q+dCnzUCeiK3AKBL9AoHcmMUtt6QAh6c=;
 b=DFI2jdyHNUZRSdqbTJ5nGm4jbaGQepRziYxRevLFNvucn0bs7hXcW5IQvq/9RlRZH9BJxAD7Ixvp75H+V2mW1bLulFqVR4OOx4hdbc4u0nrWIeBnyog4ffwmGIQXGk1odTHAXk7bxOrQLH3bFDjTqi+4xOKoOJFt2q/PRF7wN2JiJ5n2tIGqZ3EuB+yn+lPVnttpZHnaqVUpwoZZ4K7InZ0ySxo+v9W75EMobjDCerDxSpNFbfCQBAENL4MrPGWhHGgorY8CppAGlamKciaj3WNZ/npWNMHQwg/7SjRozjI8M0Lg6j61k2tk53amYXyLZTWiKES/2E20CNzwh7V1kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVSJXv1ijN7Q+dCnzUCeiK3AKBL9AoHcmMUtt6QAh6c=;
 b=wYQPm3fYM5LNoBsinUOyVGuHDkGKh3McfSYATAl7BGkP9rX7xSKph5AIG4/8f+vyTU2gqC/UTgV3Y7LXBggE5iNM7yt63f+fJA+9/yuWj+1BUyTmFQvswXQ6bA0LXKvsZau52EkelY1uHRZ5UZUJSfrSkaFbBnbv/HnH+2P0MVznj2SQsrbdaZ3bYn/K03eio/F+GaPWj7YaC+cqh9D1p4vru8eMmK3PxYlimtP914GmgdmRoqROSN6uvNub+kQYkESzw0Qb/F9NIocz9wwDu+DhrfBfycgU96+bYKXGoVV7oq9zdKA5tjJTYD7g1I0QTfIpRkEHU6MmyuZKsyg/fg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e9537cbc-7618-32f8-d5a7-990c661c0243@suse.com>
Date: Thu, 10 Nov 2022 09:09:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Revert of the 4.17 hypercall handler changes Re: [PATCH-for-4.17]
 xen: fix generated code for calling hypercall handlers
Content-Language: en-US
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20221103163631.13145-1-jgross@suse.com>
 <ca972491-4200-5d3c-18b4-122a9f4e61c7@citrix.com>
 <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <C8C5E837-5A3B-4E79-A18E-41EE4B6A4086@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:206:1::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 35769db0-21f4-4bf5-8838-08dac2f2ddca
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tyv4BAnh3VLkAqxFh3qRM+7QRnAjnvP+VzzlCJad9VLJaGOjib8twp9WIkH1YJ/DTj+cHlKRIhZpIBBp1l3xdNpWsxe5i/B0wV4Mx5rUUpfFW2EMiiX8PqotSUuQ7heclNcwt0kUsIa4bvcoxFlcoW2TQAZx8nNuPnZfuIiyfHcpGNgfdI0GVbFaPlJbWm3AepCc1fARUkw9ZD3MDLWQmvK+TB27K6L9hGQNDyx+GGTGPmuZgg4CEjImMJxWZgr9rh1BYAGvp2eqUlfhBRSz5MDonkV/W1InxqYN/UEVyFBaGqcdFfVxG8VyrDxK8g0lpWzLvB/cxUNMQsV8spL4vcovXMj5Z6fbovt6gq1u3bqPXV9xbJ1gwZVNeBbFc372bGuuiq2fyb7zcEhcyfnjGIb6Czfrf6ZsusWRLHWlg8rzEUkQdoDmugPjZqeUb4tIgjDGRJtdRrgRKuK7Ybog/ulL7rbu2FmgI//iQTch+nJSktBRPdeUyuSm36bY4sircsk8SywGZIpW7pWCtFpSd1v7cODBoedIGsNs3Fg4v7D0r1LfWRQY99DH8obiB79FUpfdHTh0+rKo0DkHCl+ur5HNMg9HPBu6P7Q4EFp4DLFLzHG6hX6zp9XVERCx9SKAYfj6B5M3dNED0lRzqHzRdTwL9N0ekURkPAFwC/rHC3vJfQYKl+l44Y0pC0/3uVp7wZUmbF/mdaNAYzmVCAnXmHm6rz3Aj+PfYTh+UMwSxAou7Py1XO/abujhNQq+8Y1ry6Ev5W+h7XOIdbuiW1Zt/qFUPEd/Rg44QTppv2AFOpk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(4326008)(6916009)(66556008)(316002)(53546011)(38100700002)(54906003)(66946007)(66476007)(8936002)(5660300002)(6486002)(41300700001)(8676002)(6506007)(478600001)(83380400001)(186003)(26005)(86362001)(2616005)(6512007)(31686004)(31696002)(2906002)(66899015)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c09rVUlxRzltZHBYd0VrK3lUY1NNK3pkaWNSVVAyNTdCR2NXbUlVaUNsT3pW?=
 =?utf-8?B?M0ZlbytTZStneDllUVFiUzRIRjAyd0NScXFIVWM1RUw5WWxXYUZ1RjF5YlUx?=
 =?utf-8?B?SVFPRURXRmZYVGhOS0d6cTdXUFdxV3VWTGRXNG5qMW1TeXZRTTJJdWdlNkor?=
 =?utf-8?B?aFZmNm9Ja2pBd2VaN3orUU8xSStpaitrSUtSei9PZitSVEJZdGsrS29pa2Y2?=
 =?utf-8?B?TEVGOUpJNmowTzVTanF3WDF6b0tvZGlWemRuMEg2dGkxQjBOTVFxT3dGcnZL?=
 =?utf-8?B?UUhhdGw2ZmsxY1ZNUCtPTnpyd2NIUXB6czk2WndPdkRZUnNoaFN3ckdDdFFB?=
 =?utf-8?B?WldndnNtM1FaNHBoSDF5Rnd3ZmVwLzRrenJLNzZmSThhQUc2ZXhNakpHSDJU?=
 =?utf-8?B?Ky95eUFJSEpMYnU0ZVpKY0hMeC8wSHcyZ1ppajRONS9mUHNqeC9ndUZncVlI?=
 =?utf-8?B?akVCeS9SamQwT3VrUUZFdDB1ZGFTc1Zid1FJQnVkMy9vYVFpc2VvK2V5Ri9G?=
 =?utf-8?B?ZWs4M0Mxd2VBOXJrZW5EOWJFNkFpOTJ2S3Y5ckVGaytSVW9wczZaOERYR1Uw?=
 =?utf-8?B?dkg1ajIvZmIxR1d0d0tWb1RrUTJEZTAyT0N0YXBaRDlEZlFqaHA1TFJuZzBX?=
 =?utf-8?B?b1pNNlZQbzQ0c0pxZzZoOXU2UzVXa2NtZk1HQ2s5UnZmb3BFVnl6dkVzWlg2?=
 =?utf-8?B?OTZZLzRubVRrTXBaVHFIRGFCRGpsMjg4VG1FbS9oM3djWVdSY1VWVWR1dE9q?=
 =?utf-8?B?OGhkbytZd1I1N3QxTHNNdy9TOHVnZ001Qnk0aVlvSS9rWEVXRXNZdVo3ek8x?=
 =?utf-8?B?VWt1NEtUL2tFeVJqZDdJTWJxRWxWYTNKRWp3OENJT3JBbVpaSXpuMFgzT1J5?=
 =?utf-8?B?SldKZE9Wam81L0NzMlVwUG1WRkxRTDNkRVJwSUlQcWViTEtueGkzZ2FuNlQw?=
 =?utf-8?B?VzZxT1JaWVovOFpTbDFacUhlVzlMZjgxaHRwVjNoc1dEQmlITlJRUGhxaFZQ?=
 =?utf-8?B?ZEU0cmMwR0NrMlpTY2hIWkZZVmZad2dtRUtPYUtHbVR1ZXlmMHB6MnF1V2pz?=
 =?utf-8?B?eEJoMDFidjQ5OEMxRitvU3ZkdVp5ZlRaZ2J6M1pXVXdiUmhFWTUxaVluWW11?=
 =?utf-8?B?WW9XQ2xDU1FIdkt3K3Y4RERNYWZsS2ZyNE05NUJLOXBWN2ZpVlRXcHBwRmpN?=
 =?utf-8?B?NmE1Rk52cWg2K013Sm4rVmtRZDFJK2pOakVhUXluSzMveW1obTBjQkp3czQw?=
 =?utf-8?B?Sm53WEI4Vzh3SStEMUY0Nm0zeFJWa0w1Q0ZYRW5Zb01uU3plNUN1c1hYS2k1?=
 =?utf-8?B?VzFQSmxrdHpVWmtkdXRkai82YkVXM1lPUVpxVFpDNUV6YzlwWWRuZzlMVDZY?=
 =?utf-8?B?Zmt1Y21reS9PUmplblpHMis2WWZtN3NsZUtUaHFYZlhoTFpFQTNPdi9vaXpF?=
 =?utf-8?B?emxyNVBveVFsWGEyS1h1bkVVWkxpZHQyVVhYY0NJYzI3aTQ5N1JxNFNaMGp0?=
 =?utf-8?B?UmRRaHJMNjhUak12UHJwcnJIVC8xSkowdEJJWHhPR1BKQmlKUlUvQk1RNW5E?=
 =?utf-8?B?dHMxMFZnZ0t1blZPTE5ZQmxxQ2ZVWXIxZFdNbWxieUlVWnlMUE9xOG1mUCtr?=
 =?utf-8?B?MFBsajJhNmFMUUt0THNkV01VVDhJTk1DNUhOT2hxa2NGcXFLb0MxRDBtWVc3?=
 =?utf-8?B?OXEwelBQV1VlQlRJMlQ4dnRGVE56cG16Q2pmanpXVkMybjBxQnF0VmJnbHl4?=
 =?utf-8?B?OTVUZXpuWjBFUm5ONE0xcW9lTGE2Y1kzNUwvQ2lqdTdPTWgreHpEYUlScDgz?=
 =?utf-8?B?OXJ3U0pRMDlzR3gvUDVGZEwvMkYwTmYzeExqSHRya3FQRGs1WXBESTgyUndF?=
 =?utf-8?B?eTRVTC9RTk5MTDNZdnhMU3RoSlcyNG9udkdrWnA0UUl3MW8wNVhvOTU4cnVB?=
 =?utf-8?B?YlBxUmxFTkNvcWNTZVhqRHJrM016TUNOU2gxNGMwYzMvTHF1dC8xUzJMenFk?=
 =?utf-8?B?a0xjU1c3clVadXE3THRzYW92bjJ1VU84SGtaTDdhd1R1MXM4YmZlK3JLUlhL?=
 =?utf-8?B?NDJwYWEzaWFyeVpOZ3VyR0k4ZWE5RzE1ZzAwd1lDZDdESXhzTUFEWW01UlJh?=
 =?utf-8?Q?bwGBSR35wFPMUPbsJ/GjGRe6z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35769db0-21f4-4bf5-8838-08dac2f2ddca
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 08:09:18.6508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ktZ5eQV5gI/gTh1fQYTJ6JlAsl56EkIj4wkIfbP5BOeE7uDCN2w/dcUGHuOo6HdhrB26WlPQ/AvIBjxLOXAyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8121

On 09.11.2022 21:16, George Dunlap wrote:
>> On 4 Nov 2022, at 05:01, Andrew Cooper <Andrew.Cooper3@citrix.com> wrote:
>> On 03/11/2022 16:36, Juergen Gross wrote:
>>> The code generated for the call_handlers_*() macros needs to avoid
>>> undefined behavior when multiple handlers share the same priority.
>>> The issue is the hypercall number being unverified fed into the macros
>>> and then used to set a mask via "mask = 1ULL << <hypercall-number>".
>>>
>>> Avoid a shift amount of more than 63 by setting mask to zero in case
>>> the hypercall number is too large.
>>>
>>> Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> This is not a suitable fix.  There being a security issue is just the
>> tip of the iceberg.
> 
> At the x86 Maintainer’s meeting on Monday, we (Andrew, Jan, and I) talked about this patch.  Here is my summary of the conversation (with the caveat that I may get some of the details wrong).

Just a couple of remarks, mainly to extend context:

> The proposed benefits of the series are:
> 
> 1. By removing indirect calls, it removes those as a “speculative attack surface”.
> 
> 2. By removing indirect calls, it provides some performance benefit, since indirect calls  require an extra memory fetch.
> 
> 3. It avoids casting function pointers to function pointers of a different type.  Our current practice is *technically* UB, and is incompatible with some hardware safety mechanisms which we may want to take advantage of at some point in the future; the series addresses both.
> 
> There were two incidental technical problems pointed out:
> 
> 1. A potential shift of more than 64 bytes, which is UB; this has been fixed.
> 
> 2. The prototype for the kexec_op call was changed from unsigned long to unsigned int; this is an ABI change which will cause differing behavior.  Jan will be looking at how he can fix this, now that it’s been noted.

Patch was already sent and is now fully acked. Will go in later this morning.

> But the more fundamental costs include:
> 
> 1. The code is much more difficult now to reason about
> 
> 2. The code is much larger
> 
> 3. The long if/else chain could theoretically help hypercalls at the top if the chain, but would definitely begin to hurt hypercalls at the bottom of the chain; and the more hypercalls we add, the more of a theoretical performance penalty this will have

After Andrew's remark on how branch history works I've looked at Intel's
ORM, finding that they actually recommend a hybrid approach: Frequently
used numbers dealt with separately, infrequently used ones dealt with by
a common indirect call.

> 4. By using 64-bit masks, the implementation limits the number of hypercalls to 64; a number we are likely to exceed if we implement ABIv2 to be compatible with AMD SEV.

This very much depends on how we encode the new hypercall numbers. In my
proposal a single bit is used, and handlers remain the same. Therefore in
that model there wouldn't really be an extension of hypercall numbers to
cover here.

> Additionally, there is a question about whether some of the alleged benefits actually help:
> 
> 1. On AMD processors, we enable IBRS, which completely removes indirect calls as a speculative attack surface already.  And on Intel processors, this attack surface has already been significantly reduced.  So removing indirect calls is not as important an issue.
> 
> 2. Normal branches are *also* a surface of speculative attacks; so even apart from the above, all this series does is change one potential attack surface for another one.
> 
> 3. When we analyze theoretical performance with deep CPU pipelines and speculation in mind, the theoretical disadvantage of indirect branches goes away; and depending on the hardware, there is a theoretical performance degradation.

I'm inclined to change this to "may go away". As Andrew said on the call, an
important criteria for the performance of indirect calls is how long it takes
to recognize misprediction, and hence how much work needs to be thrown away
and re-done. Which in turn means there's a more significant impact here when
the rate of mis-predictions is higher.

> 4. From a practical perspective, the performance tests are very much insufficient to show either that this is an improvement, or that does not cause a performance regression.  To show that there hasn’t been a performance degradation, a battery of tests needs to be done on hardware from a variety of different vendors and cpu generations, since each of them will have different properties after all speculative mitigations have been applied.
> 
> So the argument is as follows:
> 
> There is no speculative benefit for the series; there is insufficient performance evidence, either to justify a performance benefit or to allay doubts about a performance regression; and the benefit that there is insufficient to counterbalance the costs, and so the series should be reverted.
> 
> At the end of the discussion, Jan and I agreed that Andrew had made a good case for the series to be removed at some point.  The discussion needs to be concluded on the list, naturally; and if there is a consensus to remove the series, the next question would be whether we should revert it now, before 4.17.0, or wait until after the release and revert it then (perhaps with a backport to 4.17.1).

As per above a 3rd option may want considering: Only partially going back to
the original model of using indirect calls (e.g. for all hypercalls which
aren't explicitly assigned a priority).

It's not just this which leaves me thinking that we shouldn't revert now,
but instead take our time to decide what is going to be best long term. If
then we still decide to fully revert, it can still be an option to do the
revert also for 4.17.x (x > 0).

Jan

