Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 488E378ED03
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 14:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593845.926957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgjy-0005pd-I7; Thu, 31 Aug 2023 12:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593845.926957; Thu, 31 Aug 2023 12:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbgjy-0005nS-Dn; Thu, 31 Aug 2023 12:25:38 +0000
Received: by outflank-mailman (input) for mailman id 593845;
 Thu, 31 Aug 2023 12:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qbgjx-0005nM-95
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 12:25:37 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd3c626-47f9-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 14:25:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7647.eurprd04.prod.outlook.com (2603:10a6:102:ef::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 12:25:06 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 12:25:06 +0000
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
X-Inumbo-ID: 7cd3c626-47f9-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M6enrpQmeIyBz5Ti2X5CIUusVx6vIU2JUlCKyErg7daaiCfUxzNvYCDZBHFEdPM0rB8fwX1rBmtgJoUNziArin639R0w88aMHGHU2siTp8oYJADi5wm31jdM6oMOrjVUW+CWb1BfvVOeaS8xziGjbbKKcOfdfMAGE9RqdkbGa4RDQFEnKnDjKYXi5/9ckN1PWsl4HLveI8BPnUYlLN1ONbbfk4LnIRsyDRZWU+sYHRfT8b2Pwud/cWggFQW5tWCA3Pp0XI4rS1zMEHMc/1quYuByCDCESvvcFvWShiIAyO9HTvS283K2500gk1ZqVFXeqK6BtlGgdecHCQ3kS0av+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7TPwGutUOSQ9K06LSoWBARhfPG+UbvYvL4AOtrwlhA=;
 b=O5dLf+xO2Ips8Z6HOD57N0kekF3HSt7mTv8wNg6/cYOCR4Xzwviju4AWE09wnvyed6cAKmCXlOtE9OFxBx51vg/Fjz2gSr/uL7fK5muLpIEgZ322OBlq7DqyhqdvWEtp2dXY3qalUAw7W1/WucdfBXaX5A0CDjoQAtIAlQEJD1BqJWKJZSAXJjMi773O4DcJ3f0PJUvTcr65R29VuqfRCQvuPGBBuD/0iep++8KpbEg0G2xJoF15LG3xN12ik51nJ9JB3eTwYEQQP39jwbsd58dLG033TCKmqUUz2DYTixHvqSaXdltXwfOo3MBTyIoCCuCRptnDg0zyGf9qrxplGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S7TPwGutUOSQ9K06LSoWBARhfPG+UbvYvL4AOtrwlhA=;
 b=AHqiEkHQC3hNLOmEZZd5M2dEpiygbc7VxuKPn2uezaf06wTP4SyTIaAecjJPOi8fAHdniSfqzrkaWILOVOwRQI5245j6Mkv2CrzHJ2I0qDHPBlfUWNb4ugFQCTvdA9/C4G7aPthRYsKQ8JllqW+J0CNTQGlfAgsijkT5gL3kxkU9WkZZRjZicNBNiRFiXO0RCxWSkTFwXDJrd1m6k5mb8zaGSt5jjoeizXrdFJGafODXBAajA5erJO6JJiwpJ5+Xrw2KZMdXHvCj7Tc5qib20XBfTr/dsh7MmdNCc5GOIdshFjoy6T3/QDCOhaG36vsa543cUgJ0dASwesSWCtd2Sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <77f2e076-7802-bba5-82d8-fe6449cc9d29@suse.com>
Date: Thu, 31 Aug 2023 14:25:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 12/13] xen: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <6ef4634e273a89582299061f1d14346572bf1d47.1693228255.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308281548580.6458@ubuntu-linux-20-04-desktop>
 <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35401207-544a-156c-85ee-20e33a78f3a7@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 501af2a2-ed9d-4759-c65c-08dbaa1d4f50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ixeeL5+Cv7rrwZLCZuDrUieOFUfBCXRPE8oSZEpKB/ZsVn2Qm8YWz26VZOrdx70O2Cpsh+rDImNcQknuuNGgen9F4/8awoKQyNQNkT5PCFGJ/5aZ0jIxGoX/LRWNwd7YUahMp5I0tO9WJ/q3jlsbkb+uSfIjxX/iJiXkeAGRucdZfxYsOyosle7V+UTNVDUb7/qhXzedcSLb+5etg8ys5heFZgSKRxpslhr+AfbfVWGKAf4K0jK427m0uDO6ddax9lRhfZi4GT+HYalHKdmqaesssTZJt5AD7ChFB8vTvq79x6lL4oh9EQM7glLXfHMEW3AOO/Q/ZLxlCUnvOXIDaueLbfxrLUGN0J3cpEowAsOH4OPs73UW9UN9FgrTo/TtNl0Ub9MmsMD9G61l7kuxoVLchSQfAa1BtFTyotnhKEgT/FtsYIrT+PshIO1gVhmNxopUOKczeKMCwxt9slMqoBSErm6MoyFb6zMxprpIG6XLcto7Tm5XcURRe7WAjuVxJIGVCJEHigfKBt17AFUw1yokpPrtuR34gZ14WAqKN8nCzVJkTl4+xnGAK71N5E7bTB+UYhQtKFTLOtbzFWxTQ9zr6xAvXlgJ4hrX73vOZ16oG4ZbHf06kwzJqKEnNb9YHgnk5bR9qpTo791KR/N5UQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(1800799009)(451199024)(186009)(41300700001)(6666004)(31696002)(86362001)(38100700002)(478600001)(83380400001)(2616005)(26005)(6512007)(6486002)(53546011)(6506007)(66556008)(66946007)(66476007)(2906002)(6916009)(316002)(36756003)(54906003)(5660300002)(31686004)(8676002)(4326008)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R21vdStXeGNQdkppTE54c3Z0QmNEQ2VGcW9vSXM5emwzL25SdHF3WXRWZzVS?=
 =?utf-8?B?d3JwR3h4RTdsbEVmeWNQQ25xbXZYdEhtcWt6YWpYQzZLQkZ1NjMvMjhMbTZO?=
 =?utf-8?B?UnIwSnVRMlp0bERZN1IrNjNhcFNCcHVDWjNLd0FSM1k0S3h6cXozSlM1Yzkw?=
 =?utf-8?B?bjZsSlhMVk4wNlN0YVc2cFJKRWxRSDlDY085ZVFoRGFOdlFFODJOdTRMTmlM?=
 =?utf-8?B?WUxQaTVGT3Q1T0tDaTlqbVlvb3ZYVmJlNS9zdmUzY3p2aGt6bkxlWGZjSHl4?=
 =?utf-8?B?V25ZS3drdkp4UVFrWkVXd3RjT2JUZU1QN1hjMUM4R3FCSTBOd1ZRaVVxZU1B?=
 =?utf-8?B?ZDVsTTlKQ2JFMmxyTWNzQUdHQm5vUzR5M2gwdndnVUxNaExQQm9kcXh0WXdR?=
 =?utf-8?B?ZW5KOXdHeEc4UjV3azFPeVRQTVI1WGpwUmVLbGp5N2dnajcrUHp6SW12UzRR?=
 =?utf-8?B?MjNDNmNYT0h0RnEvSFFJQ0JnUnlzWWVtd0ZXeUc5NldtZlBIT2JSZnRpOCth?=
 =?utf-8?B?WW92SjZZUS9ZOEN3UndUZVBLWURaRlFrNXZGenVTVG9HaFJCeTBaTjlPR3Jm?=
 =?utf-8?B?cUJaTVFnU2dZeDZRMnhXeFdPZEpqRm1kbWJWRDBXWTVxeUVGY2REc3Y0akJ2?=
 =?utf-8?B?dEczN2ZEaFliODZWUVhmT2VKb3hqNFRJcGx3REVITUVrUDNjTmY0eXo3K3F1?=
 =?utf-8?B?QmVTR2ZKNGs2YzVPOU9ITzhxTGlrVjZNa29YdEhFRXJSbHhnOHhOTVZ4OWd6?=
 =?utf-8?B?cUxLbTFkd2hJUy90WEM2VkJtcW9VeFNJUW5IdmtzRFFtbkRRa093UHMyajJH?=
 =?utf-8?B?ZWs3Nkk5L0VyT2tIaHNpWFh6bGpOcVd2SFA3b2F0V2NWUjlOd3lnTU1mRmc1?=
 =?utf-8?B?Rm5GL0R0aVk3QmN0dCtNMm9UU0VmUDNzeFN2VTUwWG9IQW9MVEpuSlFCbUJV?=
 =?utf-8?B?dWdncDdXSDR1aWVnN2NmK0JLSENOcHFka21FSmpwbFJvK1pWa3doSGNZOHQ3?=
 =?utf-8?B?R3pEU2VWK0dja2M4eHhTUWRRY1JGVnNENXBaZE5VWnQ1SWJLRjdJeThEZzFB?=
 =?utf-8?B?N2U5R1VLNlpEM2VIemxOaTY3L1R0V2E4OWVVaFNFZDd4Y1R2T0U3K3cvY0ww?=
 =?utf-8?B?bzRyejRoTTB6VXJ6SUpSTWNVNjU1SEEzL2JwOFFlV2pRZTZHSFRMbUw1a25k?=
 =?utf-8?B?R0VpYS9PQnk3UVJQbFEyd1IvYS94YmFkQ1JuVGlLK1VHQitTQ2lDS1ExTnZ3?=
 =?utf-8?B?SXBJMVBmclpBU1ExczdFdEdmeEdZMUNhZExCTjAvV00rOW1KdjF1SWx4ZkFH?=
 =?utf-8?B?ckV2eWFFVUhqRlNWTGhLc3dmcWJicjRGdVdRZ3p4dG1Ya2VVQUpzTUZ6bjd5?=
 =?utf-8?B?VGdOaDJrZFRCYWRUc2hLdTUyb0NCNlRITHlUUWpaWTBiNlY0WlEwMFA5cEhD?=
 =?utf-8?B?bTNZUEFObjhlMXBGMTAxZ20zVE5LbW1WNDNBcFFaTTJoWllEOE85NlJGWlhH?=
 =?utf-8?B?VDBJeTk2WksxbTNqWE5mTWhLNTJlL3UvaU85azFnUk9VZUtsT1lZZ1c2a0wr?=
 =?utf-8?B?ZnBoTmExTzhCWVF0bUZkNUl0UmVLbEtSUjdVSm9IaFBMQlpubjZLSUYvUzN1?=
 =?utf-8?B?Wm9lYzdkOWluTE5hVUxtMVVPUjY1Q3dEaEN0NkMyMFdoNk8yN2VNbCtCSE8w?=
 =?utf-8?B?Q0N6M2JyYUxBZFJFSitPbXlmN0t1RlNHS0dFa3Q5L3ZhVzlsNHpRNUdaRWpK?=
 =?utf-8?B?RkFPcmRxeExVT1Fua0tPUVcydkNTRC9vZzViRHdHc2dIeVRKcnBEdFBwNmlQ?=
 =?utf-8?B?bUZoQnlmV1BTU3dwSFZNY0hMdkh3UG9CTkNrRjJZU243dDlmWlluTk1OMCtO?=
 =?utf-8?B?b2RzWlhOa1o5VlFqaE1WbVpTZzhPeUEzTnIzZUtlYzZaaDdtb1hGcUFaU1BQ?=
 =?utf-8?B?MGgxbm9zNEJDWUR2WUhSQUlpUGlqZURhR1dyRHhZSytGMk4rUnh3bzhyTzlJ?=
 =?utf-8?B?SzdLM3JzUFRTbWpvMy9jRHBOQVVvQzhoVWxhbi92ZU1tczFkVVhKMHAwaXFy?=
 =?utf-8?B?dUVmWFdGUTNQbHhUdHRYSnNoY2JENWIrRERleGZFbmpKOFVxbGFGUzI0QytD?=
 =?utf-8?Q?0ZI3lj7oXhJ4L1ETbOo4iTpD9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 501af2a2-ed9d-4759-c65c-08dbaa1d4f50
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 12:25:06.5981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pVi6gD7hST3gK5bPASlfN/hjowQbffsKuutjSydVow8GM9XMmTRHCJoedL9Jz01XvdNQg75+iDmVuMmTOES8Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7647

On 31.08.2023 14:18, Simone Ballarin wrote:
> On 29/08/23 00:51, Stefano Stabellini wrote:
>> On Mon, 28 Aug 2023, Simone Ballarin wrote:
>>> Move or amended inclusion guards to address violations of
>>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>>> to prevent the contents of a header file being included more than
>>> once").
>>>
>>> Inclusion guards must appear at the beginning of the headers
>>> (comments are permitted anywhere) and the #if directive cannot
>>> be used for other checks.
>>>
>>> Mechanical change.
>>>
>>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>>> ---
>>>   xen/include/xen/err.h       | 4 +++-
>>>   xen/include/xen/pci_ids.h   | 5 +++++
>>>   xen/include/xen/softirq.h   | 4 +++-
>>>   xen/include/xen/unaligned.h | 7 ++++---
>>>   xen/include/xen/vmap.h      | 4 +++-
>>>   5 files changed, 18 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/xen/include/xen/err.h b/xen/include/xen/err.h
>>> index 2f29b57d28..a6323d82d7 100644
>>> --- a/xen/include/xen/err.h
>>> +++ b/xen/include/xen/err.h
>>> @@ -1,5 +1,6 @@
>>> -#if !defined(__XEN_ERR_H__) && !defined(__ASSEMBLY__)
>>> +#if !defined(__XEN_ERR_H__)
>>>   #define __XEN_ERR_H__
>>> +#if !defined(__ASSEMBLY__)
>>
>> The original pattern was also guarding the header file sufficiently,
>> protecting it from double-inclusion. In fact, it is posing stricter
>> restrictions than usual (not laxer). This change is unnecessary?
> 
> The MISRA directive asks to use one of the two following forms:
> 
> <start-of-file>
> #if !defined ( identifier )
> #define identifier
> /* Contents of file */
> #endif
> <end-of-file>
> 
> <start-of-file>
> #ifndef identifier
> #define identifier
> /* Contents of file */
> #endif
> <end-of-file>
> 
> I do not see any reason for deviating, but if you ask that, I can do it.

I do not see a reason why a deviation would be needed here. Misra shouldn't
be more pedantic / restrictive than necessary to achieve its goals. Looking
at the flood of changes we've already seen, pointless changes really
shouldn't be asked for.

Jan

