Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734CA646EB2
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 12:34:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457052.714894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FAf-00088q-5M; Thu, 08 Dec 2022 11:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457052.714894; Thu, 08 Dec 2022 11:34:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3FAf-00086u-1b; Thu, 08 Dec 2022 11:34:33 +0000
Received: by outflank-mailman (input) for mailman id 457052;
 Thu, 08 Dec 2022 11:34:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u3z7=4G=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3FAd-00086o-WE
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 11:34:32 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20618.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4151e68d-76ec-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 12:34:20 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8372.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Thu, 8 Dec
 2022 11:34:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 11:34:28 +0000
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
X-Inumbo-ID: 4151e68d-76ec-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7bg5dq+XVKOKPsHBjTzHs+5SR4ehXcdTaG8HjxNuhFfNIhDcYxTIUcqcViXxfMFadpyx2mEK6iicwRmA862+KgSfqjjJAGAbk7VMqU7w6HLqumyDZ3jMofrNZTxq0XleTGtLWgv7d0uC2IYLyxkx4DnobpWQe5uNhH0H3f6AL0MuGgfH9pXDyT2G0DypaxfVSV/0Ri5RYG3LAYVyBFTTu+EZWbro/rdJBeBIikeC6IVt5yTMOO9zO4Iystq8WlcG7x3xvNjDiAhRmeGgpzjUnAeHVfZ5qE9razQCxJnG1+GmYeG8QHberolSGY/h+kueWkirGBtzNU4kW/QFGPbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWqeCpCZtcESpRIwRlyhsWjwdw4OPqx+5XCf3fWF/cU=;
 b=gjQWErlw3j/NjUgukyvtyhcWyzcsMI1Vahg+hsQ92DbwKbe5vyg/NREgUeHvCriMKZtcDHwVImLAKSQizyHM5Oh1H5Xgw/JoC89z4ji8XubhlYoSvp6xLcld2KJNSyU2R9ppMfSJJ8Eyh6qMamlfCGaDw+t5jqT3N+mHh+jNbRlbWK7vUvYH3albpeXXw0iKPLKgKoH5jdN6VMYUpjEv652PHaTDZEXgy3ij427hlqjWsvJKxtHJu/fwEFxsbTGPlTDuKIrWDSxqk084jYpadKDkdS1Ygj3G31fa2tySIp+BY41K6H4OP9t08rVIFcG8gQijql1BQwiy61t2s2sHiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWqeCpCZtcESpRIwRlyhsWjwdw4OPqx+5XCf3fWF/cU=;
 b=1OPxl60RG42nLr2451OWB8pehKGXOX4Hxbse8w/Lmx1FTZi7tAgKwwZZ2IVCnJTWz/ztpihjHvDOwlznD3eeDTABFC/QXcBPcC765dTYmi1ZXyaYz/bKGiIKx2wNvlaIf/0jucb22n5Fx4IYgMTuLbaIrV9bg9Ex8LBRAP2zzfrvFj8/lmthaP37XzrYlEWgdwBaX9Jt1yXeXSyKfdYdK3qiLJznuLV/z1xjs6ob8poRKyguNwg7PpxSR92dljnW1SuEWHOdh7UuLczKjhnIh2/++rdwX39nzKcHWt0Z1fp2pxoFewgb4UsWsO0S+ZH2NfxJE/HXOHXkqDiyw8fTXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5a8d41c2-f9d0-cc83-e0f0-2623dccc85bf@suse.com>
Date: Thu, 8 Dec 2022 12:34:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] MAINTAINERS: Clarify check-in requirements for
 mixed-author patches
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221208104924.76637-1-george.dunlap@cloud.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221208104924.76637-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0162.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8372:EE_
X-MS-Office365-Filtering-Correlation-Id: c5465fb2-b737-48c2-87bb-08dad9102a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nGb4qv4tC5xWAdCHMjXW4WJyEJc+YwTPqkpmxcfHcYR1nqZo2IxkXz99TK7tqZ0mSTxb38Q/0+hdhUhh1PtybwwmVkA/6Lb0q+hOoiPCTHDKynUDce/Z6CR4rcQmFy7mpZkD5mIXSyzxDEvTwvm/EtHDVSZvy9/ik0lIk8qxVKxRtmkfA4AV4UFInrvjSIU1UElxFOpPJk8JEpYAGftWeVjH1Q/2crInRzCfdMG8S88U83Swnf5TxhRYZIpDEd3ay1b/fn+EJ1/DzKmn2QjduP/nwpKpmUCyd3TU+R/ECMA+Hh74AVNtr+QOlcLBH7LL0iOR72WcHO9mqCM9fn/UmnAijUY05FCPkfXA+CZLVXMMoaiehsBtFdhF2I7/UI4UjFU3ffmw34V7H8IW0jkeYnMdTw6Ac/gbJAlrEND/rHOw5+ZgVfN9fUXFLiXwCM4Ginvu4p6nLj2Q8JBmunhFvHrIM3Jh44RQO+UMQL0iZWg56mEf35MB3G09kxSrgxwIxGgFc1+VhBqSooKGFcBDuccSGdX7MFwacWbkxp50ZjSK/E7nQLL/yEOYA9cUrRBwpo1N7bPDV7vAj5RqcJb5DLMoOakp9k7R4PlH8XOltVi7ne3lgbi69aO0IvGRwXwZUa8qJ8PSjkNAgBEsYE/h3IoMwMX5TcUOsgLq1Q50rqw9P+XePCJQsrQnH8SpqmoyjOxUKN4naR6C3y/qUODrv2AbEEckTM0QG/cfboMVo88=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(6666004)(2906002)(478600001)(5660300002)(36756003)(8936002)(8676002)(4326008)(6486002)(31696002)(86362001)(41300700001)(66556008)(66476007)(66946007)(6916009)(54906003)(316002)(38100700002)(31686004)(2616005)(6512007)(83380400001)(26005)(53546011)(6506007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFdlVVJ0Q1V0b3NVTWZWSmZsK3V3R3Z4eXE2Qnd6N1JYYm4zN2p0S0ozem4y?=
 =?utf-8?B?ZmtXOTBUWUg5MVNETGlhN1BXc2JBZURnMGdrSFFYd3c4NUlCcG9ySVQ0cFA5?=
 =?utf-8?B?UTJ5Rjg3ekNxRWlNTEIvV3ZMMHEvQXBqTUNPMkJadWNiUjIrMENWU3ZPdjFG?=
 =?utf-8?B?b1JNZkptSmw4QWIxOWVIRUx5N2t6WWtQOS9VQkYyakxoalQ0UlpzRzMyZXBj?=
 =?utf-8?B?TUEvNVpZYitqTHRvQVFVNmJhK0JsZEJsN2VPd001eTR4enpSQi9EUnB1cjAx?=
 =?utf-8?B?QXpDaDVOMkUvK09rWGhKc0l1dmZISnpqR2c3bHNjWThHVmhkZFlCakd6VTZE?=
 =?utf-8?B?MEluR2pVRS8xUGpxVlVhVGYxbWZFK1g1TENibFRpdENkMTZTbDZCYS9PWVlO?=
 =?utf-8?B?ejlsNitkbmhWa1FqVHk4a0NFamVKRXdINXY3LzlPa0NlQVcxdE9xR0pxVldS?=
 =?utf-8?B?c25LMTg1WU5SQlZjTldOT2l0dmlxTTVIaXY1M2Qrall3ME9McHJIbFRmdzV5?=
 =?utf-8?B?M09VVi9xWjhlNi83T2tkVkFnTzZ3YmRJd0tXOVY1QUExM0hEL3J3UWZyL3Z0?=
 =?utf-8?B?aUFsdmxBZ1FnSGt6R0tDdGVsQTc3Nlpwc1JTcXNWT3I5YjZDbytDV1d4MDJu?=
 =?utf-8?B?ZlF0NUtnVVBCNXc0T0tKZzFMckZGZjI1TTc5VG9GUTZRdVVESE83L0tKS0Vm?=
 =?utf-8?B?c3VYeE9hM1gxVzR4MVJGUGRibXk4N1YyK05aWDZwYkZzNFpTd1BOdWVyYTZa?=
 =?utf-8?B?Z3FER095Q1NVNkx4MC9ZRitYWHY5RzM4Nllmd1hKRzdNR2YvNXRMZDM1aXNH?=
 =?utf-8?B?cGRPcDJQVG1HZkMzUUhaRkJXNTFrajF5VmpRMWRPS0xmdXJ5dk9aUytMVDlB?=
 =?utf-8?B?azlMU1pJTUhvdko3Ly9GTU5GenVvSEdwZloxTW1EcDROMkRZQWp1Ynk5RnBl?=
 =?utf-8?B?bjMydkVrWHdPTWJ2NE9DT1VTS3BlUy9rdCthVUx1LzlIbVBpYTFnVXRqNVUr?=
 =?utf-8?B?UkowSlNhM0VJTm5KaFRSaE1mbVFaRlpUVFZDQWtIcGVadkZONytqNEc0Y282?=
 =?utf-8?B?ZUJ2WS9Ba0plOUZ3YStpdkljY24ra2tGY1ZZejNPMTEwT2RqZlhPbUVUblJQ?=
 =?utf-8?B?V3lRV1VhT2Q4QkhYTUhaT0xYbWZ6cEJxdVlTZzYxbUc5c3RZR2UwWXBkOEEw?=
 =?utf-8?B?cHY5RkIzRDFhWnJRYXpaMGZtQ3pmUjVnQ0wxTk5WTjF6VFlyZlc1VkJNTW5S?=
 =?utf-8?B?djFWOGZvNnJZQnBweHp2N2hDTUpid2tEaHFyL0ZOWkExQXgyV04yQ0pDRjVY?=
 =?utf-8?B?SkhKMExiVkxIMEJSRUVrUW9WbzZMRCtHU21HUWtBU0V2OXFkVUkzNW5lUVBT?=
 =?utf-8?B?MEpnRC9mVnlrTzN2cW1EdEFwOU43Q0JWTlFGaUE2VzF4ZHBJYUZhZSsvaFUy?=
 =?utf-8?B?VHZjNmRjYTB5N3RVSWNWZFFQMWhIYWNTakxXWGlXLzdCb09RTEx4SkFjWERR?=
 =?utf-8?B?TDQ5UUQzT1JQdVVhMUJMbzdnVi9VRXFZaVcxUkx1aUFmSlpOQWUwSzNsUEdJ?=
 =?utf-8?B?TnFSSmRxcS8ybWZUN3hYZXZIZ2Y4WVVTWGZocGhBK2RudHozRXRXUkR6Rzl0?=
 =?utf-8?B?VGJGRHdsVzRzcVZRUjcwNUZiL2Uya1NDUHdLTlRvaVNMUFhOV1BoUEh1aW5M?=
 =?utf-8?B?d1g2Ylhqbk41VjRIUGRZOHdkVkdxWWE2VE0vcVRZd3RBNmFoTFNoZnFnbGR1?=
 =?utf-8?B?K292YTJxZXVWRDhpSmRQcmI3bHpkTHN2UC9zM1lCaTgrallXQ3pzbFFoZFhQ?=
 =?utf-8?B?NndVZ0J3c2RBS0JiQUVQSDdadWlSblVxVUNXWW9rWDdjQi8zOSswMGF5MFJQ?=
 =?utf-8?B?QmR4OXZPd3Zyci9WeDFkeTJ5d3pJeXU0UUszOGMrUmFRVDRZMWxiRk5jRTNs?=
 =?utf-8?B?dzUyUzg3N3FMdXBxelBFem1TUUtoNVROd0ZETmlpaFBSUzFtZWRiRlkxSEtL?=
 =?utf-8?B?Q21yQVlBdGJiY3k0VllwUWV5WU5qYmNTZTFHYkJjU1dTdmR6SUYwT25xSDFz?=
 =?utf-8?B?eHpVNWN4VmdaKytKUUZBcEdMOVdwQ3F1WTJRZ3Y2YlNvRWNSUmRQcDZZUUdx?=
 =?utf-8?Q?ljSYdi5sRzB4FyQ67pTQ88y6b?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5465fb2-b737-48c2-87bb-08dad9102a40
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 11:34:27.9641
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8a83yb95TUNWmleKaNrYiVO1fiZ7yCAY0pYZBZx0aC/IJTKOxt51bQMZgj9e+QY/Xk8CD71dTy78TTdFvW8laQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8372

On 08.12.2022 11:49, George Dunlap wrote:
> From: George Dunlap <george.dunlap@citrix.com>
> 
> There was a question raised recently about the requriements for
> checking in a patch which was originally written by one maintainer,
> then picked up and modified by a second maintainer, and which they now both
> agree should be checked in.
> 
> It was proposed that in that case, the following set of tags would suffice:
> 
>    Signed-off-by: First Author <...>
>    Signed-off-by: Second Author <...>
>    Reviewed-by: First Author <...>
> 
> The rationale was as follows:
> 
> 1. The patch will be a mix of code, whose copyright is owned by the
> various authors (or the companies they work for).  It's important to
> keep this information around in the event, for instance, of a license
> change or something else requiring knowledge of the copyright owner.
> 
> 2. The Signed-off-by of the Second Author approves not only their own
> code, but First Author's code;

The wording in ./MAINTAINERS looks good to me, so it may be benign that
here a perhaps relevant (in the course of development) aspect is not
expressed correctly: Second Author may have fixed a bug in the original
patch, which surely he then doesn't approve. So I'd be inclined to
suggest making this "..., but also the unchanged parts of First Author's
code".

> the Reviewed-by of the First Author
> approves not only their own code, but the Second Author's code.  Thus
> all the code has been approved by a maintainer, as well as someone who
> was not the author.
> 
> In support of this, several arguments were put forward:
> 
> * We shouldn't make it harder for maintainers to get their code in
>   than for non-maintiners
> 
> * The system we set up should not add pointless bureaucracy; nor
>   discourage collaboration; nor encourage contributors to get around
>   the rules by dropping important information.  (For instance, by
>   removing the first SoB, so that the patch appears to have been
>   written entirely by Second Author.)
> 
> Concerns were raised about two maintainers from the same company
> colluding to get a patch in from their company; but such maintainers
> could already collude, by working on the patch in secret, and posting
> it publicly with only a single author's SoB, and having the other
> person review it.
> 
> There's also something slightly strange about adding "Reviewed-by" to
> code that you've written; but in the end you're reviewing not only the
> code itself, but the final arrangement of it.  There's no need to
> overcomplicate things.
> 
> Encode this in MAINTAINERS as follows:
> 
> * Refine the wording of requirement #2 in the check-in policy; such
> that *each change* must have approval from someone other than *the
> person who wrote it*.
> 
> * Add a paragraph explicitly stating that the multiple-SoB-approval
>   system satisfies the requirements, and why.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Since the actual change to the policy looks good to me:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

