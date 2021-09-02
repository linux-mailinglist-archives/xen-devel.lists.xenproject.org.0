Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 851D93FE96C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176964.322054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgTj-0003DD-9p; Thu, 02 Sep 2021 06:45:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176964.322054; Thu, 02 Sep 2021 06:45:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgTj-0003B9-6X; Thu, 02 Sep 2021 06:45:39 +0000
Received: by outflank-mailman (input) for mailman id 176964;
 Thu, 02 Sep 2021 06:45:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K8X1=NY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mLgTh-0003B3-OG
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:45:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 605c21ce-0bb9-11ec-ae41-12813bfff9fa;
 Thu, 02 Sep 2021 06:45:36 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-p2y-zJ8XNKKXF2aMxxZt1A-1;
 Thu, 02 Sep 2021 08:45:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 2 Sep
 2021 06:45:33 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4478.021; Thu, 2 Sep 2021
 06:45:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.20 via Frontend Transport; Thu, 2 Sep 2021 06:45:32 +0000
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
X-Inumbo-ID: 605c21ce-0bb9-11ec-ae41-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1630565135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2CCz0N6kirv4Y+bKxgrtsTMCCf7h9FVJy0MMlSYiGu8=;
	b=ZOpoVuvfvqggUGmfVmiOmmn+lpSJfOY4TG4SBzBF+SJdJzPymQ9DCVfTCdwlQWuvfkV2vr
	/NR2PONqyBBiL9Y3r1JLSNr2TeBP8aEZtiq730FUE1DRi8DDVyfTv86cqsy6zYDg2nOmEm
	qI0noTOkkmldhLLMyjFXZx1+OLubiB8=
X-MC-Unique: p2y-zJ8XNKKXF2aMxxZt1A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H98I8P6tAF8SV0fMbBr7XkMZcpT8SHAdmIPkz+Ze0mQ8iieyAUSEAsWrspYe9MZ8qu2kVEhD0UO8TMXu+RHOWvR2o9iesqrranmdOHMOB6VYl4E40RFQXbJwhgTekIgpV+777kSrT4hTVTT89pV6iSdqab/L7/wDFirM4g/GFy+AU2SFylqjsVGW1VNnCP1DMN+pXLdiVI+006NTKO9xgmyowSgPq58AzdXd3t70vWniTAN1q0xgqtqDsxCROmtH5XFfDFioEMbPdV7KXRXi2bebdOdCwazH3MZh0QR99jjdODRWFbGrNq4Eog2n/9puvNDCAjmM0NINecg/H3lJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CCz0N6kirv4Y+bKxgrtsTMCCf7h9FVJy0MMlSYiGu8=;
 b=V2ssBBQLYaczegaAcnkwCLAqnWV1Zecrq6x12M4GdjjPlh70kcy6kLcHQ0ysEDceE9tVMNoE/Gl91niyR5vvQYaSm4mN2tVRK5ZzBx7NERqKzQDr4gyo+cwoz4WykjGkzYIVRiuRouEQ4kZY40O9mo/CItEXna3O2DAlvMs4tRScaQxOAhZhGTsltxBbrcF2BpIu/pyGUDMX9KPQfeNb2+B7EoYyGCz285nhGQmjVzlY+q/OBzhRxDKQmNjQoyU3WgOqXlXLsQPzm+U7pyzXRBvYn2G/EhM1wN2ZvnVE0/ebQ+QcgDfQcTQI/YgsWjpLNbqyLGqwWyZkZCt+2O+9yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: vcpu_show_execution_state() difference between Arm and x86
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
 <8f295eeb-e8f2-a115-3f83-60922d0fe5f9@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00457189-6ab5-24e4-b2ec-1050ebec67eb@suse.com>
Date: Thu, 2 Sep 2021 08:45:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <8f295eeb-e8f2-a115-3f83-60922d0fe5f9@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0008.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beabf8b4-90eb-4380-3141-08d96ddd42ee
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2605189E4E8D654B3C6675ABB3CE9@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5kw6HmKoGN55MLGtfyJSgIArVfzD0Dkhyz0+32QQq1+wm2S4qH7jOP6QUeY3oNdUNV+ksmO5ME0HARfG2UfixAypqfAdWpaDFShCr1ubs6SFjMX6DMLXmar+xtRyMkg2agggZTNFFxPAhDz/MjygNJsYTDs8tlc6PCgn6A/V/PVRTWSQQffOCKt0iDFc+UEgW8jL1CImUGVDtFT6GTJP90Gd/0gzvrbRgTqkZC2Zs/tIzb0xyObd8K8vuY0OaAkdA9A3DsFekNmoBF+U9wuDwS4504cnGONDZ+5lCEuNM5vDx9C0bu3jKD6gG68EoMwTdJxGVB1CYYEE7QxI4sCttlybEZ9ISJYTLwLTCrM+Tg8N9vLmerM989y/UIKxyrJ/rPKHamU8wqnE6KsUDlsoqbrrA+3R/eQu81LhzvofTVSTnIDTCeLgwqSFEF9SiBoWCP7TNQtjzzRXmMTlejJXyzATMYO7/h9pgXp1N7SU3LyNF8euTzzK69hvIuaLuqHpif6T0CcL/QCM65ZoffMCLl1ucnMdWS3e8xLs+FygMWxUDVHE0U1vjxDeX8o5bPmcOW6iW25AVtPxld4AOI0vRDQJUSQzHvzpph75B4wSPD7wmyHqmI4jwYvGcYpiJOy/1v0m4Voa/7hD+Y3+A0/vdIBHCNjfvNqjQWzeLHjtX2eg4sQLd4rpldTjPrBgsU2+jiD/6hv3fCMR7GiAZqEGSqqH7gzmy0paeiiYfk6vJ5M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(38100700002)(2616005)(2906002)(956004)(16576012)(8936002)(8676002)(316002)(86362001)(6486002)(66946007)(478600001)(26005)(54906003)(6916009)(31686004)(5660300002)(4326008)(31696002)(36756003)(83380400001)(66556008)(53546011)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHcvOElJczAwNUloQnIwQkZqZXBLaGVMMUJnTDVVeVBia2FBME1wM3dtVENM?=
 =?utf-8?B?VU9XZG1WajdKMU1wUlB2eEI1VWN6T3h3Y05DeG5EckUzejBZaUlMc3ZYRkNY?=
 =?utf-8?B?Y2hNWlhoOWxVeHJ1NjcxVzRnSGVjUW1zajhSbUd4UFJyNm1pRWVBTjUwUXFt?=
 =?utf-8?B?azdJK3lQQTdqL25vb28rSVVRTzFWM2laMDl1MWRkVGFjQWlmSE1jaXVocFhr?=
 =?utf-8?B?c09ua3QvUTIxNUdKK3J4djFNNDl1V05aSWZnTDJTTExTSjIxSU50elp6czlM?=
 =?utf-8?B?UUhiUXNpZlBzRkFLYjUzekxkZzRkbWxKSE1OL21NTjRYR054bXJ4b1kwQVoz?=
 =?utf-8?B?VE5ESXl5RTlaclNUN2I4cGpjZGk1UE9laTkvQWdTWlQ4WW5PMjdUUTdnd20y?=
 =?utf-8?B?NnNUMzcxNGxlSnpicFo5a2x2T3ZYTTRsWEQzMklyREJldGdGVWtXSXB2bDM3?=
 =?utf-8?B?RjNGUmg5MTlrczJiRUh2VzE5RGlrWllLRzhjYkpiZ3FuWVdKdHNTMVl0dk94?=
 =?utf-8?B?TzFpNElKdDdTNXBudGF3UmZGOFhiZVpJaXhSUjI3Z2xMQUNUcnFlZkN2czNL?=
 =?utf-8?B?d2JLaFA4WHhGL0JqMEIvVzh6ZkpwZlB1Y2hzbWpma1VRam1Pc292dDZGODJG?=
 =?utf-8?B?bE1uNVp0Vm56eStoVzZPZHkzWHR1d0tjRDFyaDB4NlRoT2xWWUY3ZG5EQkI2?=
 =?utf-8?B?YXRFY2lRUWVGQ2VnaVJheVZ0VXY1em9KaWV1VVZhSkhQWnJaeXAwNXo3R2lz?=
 =?utf-8?B?WXYxT3FoTUFsNHM5cWl6dTk1dlNlczVMMVFzTWE4ZTRPT3kxdGc1MzllRjk3?=
 =?utf-8?B?Wm9uTmt5VERZZisxMzlVWWRINXN6Yi8rd3pjMFVlSUdZVVVXUURYTk4rL2Nw?=
 =?utf-8?B?bEpSeHpJbGlqei9yZEhNTkovUm8vUXcvcWJvOGVtTFAwN2xhd2lDRWdKVHBD?=
 =?utf-8?B?QWEyY3Vzc0lVbTN2WDVzdFRpQ01sakNjeWVvNmZuU0ROWVlleEZLMDZINWNZ?=
 =?utf-8?B?ZUp1eFlzMDM3ZEZXYk1YdVB1bGpON2hSMzVMUzlQd1VJT3N3QnFKaTljNGMw?=
 =?utf-8?B?Z29ZVkVqZ2M0ekpKTXYxOEEwamErS3ZjS01hQVRkcFZ6eFR0QXVKTWthalpU?=
 =?utf-8?B?V0lDVjNJbUxuZEM5YmxLTGFldDQzQlBYOFVWU1lJcHQ1dEk3U0FYOUxob0lW?=
 =?utf-8?B?aWRCWHVGL0xFTGEyUmJ1STdjRlU0azlickZPRHNTRldqWElHcktjcTZ6WW1v?=
 =?utf-8?B?bldDNzRadENZdjZhenNPVUxQVkIwelJkZi9WeGpldHpUZnI1eG1uODdud0pL?=
 =?utf-8?B?dEMvWHpsTm8wRVRJNit5bzZSSm9UdEFDTkxpWnZJVWprdmI1b240dEEzenJt?=
 =?utf-8?B?a2JldVViUzdhNStlb0ZURUcxUFdCb3IrTTNsOU5HRTBjdjJXNWYzZ3h2V1BX?=
 =?utf-8?B?Um41Y082d2Z2UUo5alg3VklvTTArSjlaZTZoTmNQa2c2THk5UUtlTnIzZU1y?=
 =?utf-8?B?WTdCOGdueWZ5QTFkRUZha3NlNmh0cHBGUlVSZjREdEM3QzNBcW1ZMXF3ZFRn?=
 =?utf-8?B?d2dZcG1hbW16R2V5UzBBTUxZZVNCT3l6NXBkSWlYQ0puTGpLb2RWZVEvZWMv?=
 =?utf-8?B?MnVlc2JyQ3J5a1pvc29CWjhMalRxZTh6YjBpRHFabFpJM1k0cWdMSjBIR3BE?=
 =?utf-8?B?b1RHL04rZ1pHL2thUHloaiswZzl2U0Q5dFZvdVdaRlU2YTYyTDhXUjBVK3pa?=
 =?utf-8?Q?yp1WMIhrspLz9ctZusv0t5t3JRjoJaxlbmSjMW7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beabf8b4-90eb-4380-3141-08d96ddd42ee
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:45:32.8741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gl4/yAgtASFgtNl/BHKi+5WXBNQJdo/OoSMDPMiceH7TsA+mLTlBsaod3HREugOFphk8+QlUhBRUasraB3p9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 01.09.2021 20:11, Julien Grall wrote:
> On 01/09/2021 14:39, Jan Beulich wrote:
>> back in 2016 Andrew added code to x86'es variant to avoid interleaving
>> of output. The same issue ought to exist on Arm.
> 
> Agree. I guess we got away so far because it is pretty rare to have two 
> CPUs running at the same.

I guess you've meant "crashing", not "running"?

>> The lock acquired,
>> or more importantly the turning off of IRQs while doing so, is now
>> getting in the way of having PVH Dom0's state dumped the 2nd time. 
> 
> I am not quite too sure to understand the problem with PVH dom0. Do you 
> have a pointer to the issue?

Locking in both cases: For registers it was VMX'es vmx_vmcs_enter()
acquiring a (non-IRQ-safe) lock, and for the stack it is the P2M lock.
Neither can / should sensibly be made IRQ-safe.

>> For
>> register state I did find a sufficiently simple (yet not pretty)
>> workaround. For the stack, where I can't reasonably avoid using p2m
>> functions, this is going to be more difficult. >
>> Since I expect Arm to want to also have interleave protection at some
>> point, and since Arm also acquires the p2m lock while accessing Dom0's
>> stacks, I wonder whether anyone has any clever idea on how to avoid
>> the (valid) triggering of check_lock()'s assertion without intrusive
>> changes. (As to intrusive changes - acquiring the p2m lock up front in
>> recursive mode, plus silencing check_lock() for nested acquires of a
>> lock that's already being held by a CPU was my initial idea.)
> 
> At least one Arm, the P2M lock is a rwlock which is not yet recursive. 

Right; the same is tru on x86. Hence the expected intrusiveness.

> But then it feels to me that this solution is only going to cause us 
> more trouble in the future.

Same here - we'd need to be very careful not only when making such
a change, but also going forward. Hence my desire to come up with a
better approach.

> I looked at the original commit to find out the reason to use the 
> console lock. AFAICT, this was to allow console_force_unlock() to work 
> properly. But it is not entirely clear why we couldn't get a new lock 
> (with IRQ enabled) that could be forced unlocked in that function.
> 
> Can either you or Andrew clarify it?

AIUI any new lock would need to be IRQ-safe as well, as the lock
would be on paths taken to output stuff when the system crashed.
Hence it would be pointless to introduce yet another lock when the
one we have is already good enough. But I may be missing aspects,
in which case I'd have to defer to Andrew.

> The other solution I can think off is buffering the output for 
> show_registers and only print it once at the end. The downside is we may 
> not get any output if there is an issue in the middle of the dump.

Indeed; I'd prefer to avoid that, the more that it may be hard to
predict how much output there's going to be.

Jan


