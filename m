Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9119698DD7
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 08:34:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496371.767080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYmM-0002EC-9d; Thu, 16 Feb 2023 07:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496371.767080; Thu, 16 Feb 2023 07:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSYmM-0002Az-6E; Thu, 16 Feb 2023 07:34:06 +0000
Received: by outflank-mailman (input) for mailman id 496371;
 Thu, 16 Feb 2023 07:34:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSYmL-0002As-0P
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 07:34:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7d00::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49794f36-adcc-11ed-933c-83870f6b2ba8;
 Thu, 16 Feb 2023 08:34:04 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8478.eurprd04.prod.outlook.com (2603:10a6:10:2c4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 07:34:01 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 07:34:01 +0000
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
X-Inumbo-ID: 49794f36-adcc-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AigqFAste5auGoBLTLMlQrd/CedhmpofERdWwt1/GP2MPIQ265f0V4VemObCNrqanx1KugI0AyPANtceNR8DRU9JCHZlPYDkQvPNsLNUmLPFJREYl1XoX3YIHrG0lnoXHee0ewgBH+NH2Cjab1pecKriJ8u5NS0zOVbOx46pua/MdPo1hx9COqFZbN3OwNcpp7Xt05OzQdmSj9F1w7DeGRgEWm6WmQhZ15fFBlwSa50dOcaeKnJI7B4vHu1QnWi5o/Vl5drliOWXztkCqLDMr2eNGQQejJY50iA8KB5X26zgo6umCTnEDYTSVYGreV5oUECmNmccn2iryw76bQ/PfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxVugtNFBv+GmnwLxjqQuyTIKhA0dnnQwC4QdF3NBqs=;
 b=CtWvApDB/oa9jLWv7BlCjaupT62WDG0cf5KRl3VWxjVHUKaB6ik/PFm3/700Nwcu3Ay0Rndw+JUvcMQHw2T6l6JxXPm2qN6A2v3GDa7FOHy/ducbRgE9S/wG1Wvw0AJ4ZWLzKtM57YNEDymg+EJWsXiO9nJRAC/55d5xY7HRV+1ihck17yg8bsaswybMgF40kXSw8HN6Ttp2h7daN0+esSBJ+WMrsD3HRrRYCpujOi2LwEni8eu062GyMfIxUHjzynMIVylM/xzTNZd84GPrklP0I/SPDhpscjy7lWg0lbA7t07cmZnfM/wpb+T0U60FjQIMEEBTrUPvaRhmWf8fHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mxVugtNFBv+GmnwLxjqQuyTIKhA0dnnQwC4QdF3NBqs=;
 b=SQUleQWfDyFfDDZ6IA/6qYQqavxK8UEMGAUZs4Sy14LzB+QD28h2gCVC+nIvItJiB6nhf+IotVfRCBnrizA2aylQ72fFiB6deuoDGWTsleGndpsS6p2iXi9SiYElTi4V9M50sR0PV5Ys26IJjc/vwdbTdIzjiZkekCM5QuLiQM2EiGhGGQ+Ts19vingI6+LQo6KfF8kbB2lZ1kAwzg3CERLHmEgy+HRQE41g0HpGv1VWMocSSh2IjK4D/mBarAlZspps00Jv32VR1tNJmteUUhV7PJWvyFDHPLNviWn/3f9Ls/rubK2ASG1ThUMJWyYkPdtHgrDHit424pZxvW+ZwQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <68ad588b-7b6d-4378-b38a-b760b8c3adce@suse.com>
Date: Thu, 16 Feb 2023 08:33:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] x86/Xen: make use of IBPB controlling VM assist
Content-Language: en-US
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <51ae9cad-3644-02cb-9cc7-28229987487d@suse.com>
 <c4d2641f-7a99-fd8a-53c5-faa277c572a2@oracle.com>
 <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
 <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
 <64bc94a4-07f8-a065-7346-6d9f514bd690@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64bc94a4-07f8-a065-7346-6d9f514bd690@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0048.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 18aa5843-6339-4a25-d036-08db0ff02be8
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oTrzbh9MbwAnrRPPFuksO1+FeJpw8g1d32N4S0EY5PSYzPnLPmZmjnrnI6Q3eevw3ok9/qFs7NEO7KGadTZuQV9yODM2P7WaRTCUsZWRud0dY8DfEpSP7sguPZG5VvsXqMtCFvxXSKJjJBYvJK3Xu2lUy08w24hdHKOOfW00icTmDUcPB59QdHhSJ3WEx+atfSj2WdhF30hD9tahvK683tnEcymhZ/T5bKht6fRidX4onhL9L8okOHg62nkws5J5QUy2p5d5aUXWdUfTzJKWHC3sfKUhhythOS+TspygLLPawUYMTGFlr356Sp9EGSl6MbOO1eKrheEzs5A1ctybIl8nnF0s+231E6a/oUGPpcgt2sCKG/UdeHrohT7n4bCogiyLAyEy0cbhU/oFL4T3X3UIm05DICLlymJRS4s4itde4fVbZUbxRYMwMPpjgdkT+Nl96/QeZ5Jb5UDnn1t/lT5fL0GiM4DWes+9g54Rv0u+jkcmnzyZqU5W5UZBSjGnbGeCXPVY4HYbfkbJRoXjWB88lz0JTY3QbLxZh8iBUc8AjwMWd1aPzxY8CbMx5RbsVGDIwYpz1Ng9vjs+WH7tRKFXxAmwaAQIfAu4EfKaEF3GloAZ+LiDAlP0jUz49OZCjuuhPaWgrDhduAZFYa2GfXSTS4xlZqAn2k7llbXUunTRp53nIIWq7QbjMVM9l7Gf6TpNrcYgODYhgX+YQU7q1I8KvCoy/Jxg3/gezG8qjPw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199018)(316002)(83380400001)(2616005)(36756003)(54906003)(66476007)(66556008)(66946007)(31686004)(186003)(6666004)(6512007)(6506007)(478600001)(26005)(31696002)(53546011)(6486002)(2906002)(86362001)(5660300002)(41300700001)(6916009)(8676002)(4326008)(8936002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WThIUGVjcUd0ZEtNQ1pnY0NYb2tHWW93VytnM3gxL1ppb3ZjRHFQdFhQclow?=
 =?utf-8?B?V1hacE1ZZ1hIZTExOUp6M2I2R1RsZFpQdysrZUorYXJpVGQ2UHpsNmhzLy9Z?=
 =?utf-8?B?QmErU3RkUFFSUEVzRGVCalNyWFhmMER0bnJRYi9SaU9mazQzdTUydmN2T0Qv?=
 =?utf-8?B?c05WQ2YvMDdoNHBTTkJrSXExbEFnbDQ2dWNZNy91Yzd4NmxzYU4wN0tzWmNZ?=
 =?utf-8?B?bEFhZEQzZ01lRUZYUWw4aVZQRzZ0TU5aMmtBdVpCMVdsZWpObk1BN25ydWFG?=
 =?utf-8?B?MzFYUnpnNy9hVmoxRUNEaTEzeXhwYjRkajZJSXprZzdtbitRZ0xBZEJWKys0?=
 =?utf-8?B?MktwUkZHYWVZVUJMSHRHRWNyVmV6NUNRcHZxdzJ2TGlVdEJXcFlTS1VhNE5p?=
 =?utf-8?B?ZHlSTThTQXd0T21tOXpDM0NmRWk3eXA4RzhUVlBXM2J4bFlsUXltZmorWGVh?=
 =?utf-8?B?ZEhsaE1KbytoSDZBTVlpMGNsZmRsaVl2MUFXL3d3aGhkd2I1clQ0MzZkc1pP?=
 =?utf-8?B?TVFjVlY5bFFRWEpuUW9aNVo2ZS9XRWlLS2hZc25ya1pvK0V3NCtnMHo4cG5o?=
 =?utf-8?B?UTlDQXYwZEU4TGYzQXV1MXlhK0VvUnl4VTlDQ0pBbFE2cXdRM1NuWkdidG45?=
 =?utf-8?B?cFBuNXJpZDc2RHJWVDVTM3lEUlYyVW93NzRBVkZSODlvNGpWRXo0bjhZSTRW?=
 =?utf-8?B?NXIwbXNCVm9RemtzTHlUWk5HTUk4aHhsY2o0TGQ2ZjBITXlISUJPK0E3bE1S?=
 =?utf-8?B?eEZmN1llZnVSNVgrM20rQUlCaTVKTjhHSlkrZ1pNUWliUmhyZXlBaDEwSXcy?=
 =?utf-8?B?RlFMb0xTbVMvMUJQK0FTSWR0RmZUV0NtQkEyN2QzQ0FQL0x5NS9wT28zSXFQ?=
 =?utf-8?B?M2Z6bGU0Ti9wL25iZmNrQm1mdGc4VFprd1J0dTF4anRNQ1RyODc1bC9EYTI3?=
 =?utf-8?B?Sm9YNmxTR1hIelAvdUxpQ3ZoZjZ6NDlPaElZc3V1b3ZIQUc3dWN2Mmt2Q2pI?=
 =?utf-8?B?WlA1TU55THNEcnl5SXNjTnFOWlZZMGF5Y2psdVQ0QUhPNWNZTlRIMVNBYWZQ?=
 =?utf-8?B?TS9SVkNhUEt1R245Ym4yV0xGNTNhblFNdm9LVFlReGRtbDl0VElwSUIxNk1E?=
 =?utf-8?B?cjZMRWFUSDUzUFFNUjdHQ0RWQ1doVk5rK3dRcmk0U0hSUE9vSWRZUkszNnVq?=
 =?utf-8?B?M21VaTIyeE1GbmpmZGMzVzduZDE5b1NLSWZpc1cyZUZWM2g0SDJJcnZjMkNk?=
 =?utf-8?B?QXFxb1NvODhoVFVCZXh3N2txYWFSQVNadW1uUVlGRHhtU3RVc1c5RmFWdjNt?=
 =?utf-8?B?SGdSSWFXQjJidzY0eUdKNVQxNitEakNTVTB0R0lqVk9Ec0dIdWZCNUNpOG9G?=
 =?utf-8?B?TkFNSUxRSnMxcWVDcllWTjZvQ3N0QmdiNFBsOGN1SXJJWXNmOEQ1UlVuUUc0?=
 =?utf-8?B?N04vWU9jQTZMUlI0NVJ1MDlvZkt6UkdVQWU3ck9qZ2ovTUd2Q2twYUlmakhC?=
 =?utf-8?B?SU5EaUV3V2N3WitvNE53V25XbkJuOUFvamVEWXl5VlRzS2cyMnlsdncvcG5G?=
 =?utf-8?B?eDZxeTNTVm5LTnRBVm84YUNyTHBxUmVnTTlKS0h4R3BkWVZMVDJSTXZGalBZ?=
 =?utf-8?B?eDhxcFEyK0t1SlpnY3VlMkxGamwrVWtDUGpGMEJmeWkzdWsvMFJQYmFLMXVx?=
 =?utf-8?B?R2VDVFpjSVRGZnR6bnV6UWJlTmczeGREWlVLb1JiUm9SenlLbVdoaUs4RmlD?=
 =?utf-8?B?MmhidkFwTm9pOXdLR1owWjExZHo2bkxERzVvaC9sOUl2ckI1cVovTHphbHd3?=
 =?utf-8?B?ck9XencrOUdwK2YwV1MxVTBOdE93QmsyRWhBZDlGUmNuQzMwWHdjL01iYVB2?=
 =?utf-8?B?Nis3VlV2d3drdlF1U0pVbk1ZWWZaL0xUTXo2UUxWOW1SbjlhRlpIQ3h5SWFH?=
 =?utf-8?B?K0Nkb0kyclN1cXhKWGJZR010VkY3cElDZkM2NEpvTUJGNXhWbkhWdERwMm5L?=
 =?utf-8?B?Ly80c0x4RU9KMmN4aHdtYlBqeElDVWdZRlY1QnVpN3VteGRoeEZzZXJpYTJy?=
 =?utf-8?B?M0tvc0d0YWhaeWUyVjhDbEJPNVJyeVExb1FKMDJRYkRwWW9XN2IwOEh3NXd2?=
 =?utf-8?Q?2zNkKctGXw5wE/0ZM9entSVxl?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18aa5843-6339-4a25-d036-08db0ff02be8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 07:34:00.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+O5SX0MQTCnQTneSmC1tfT503gwYZ1jLavjJdAAEMOQjQaJKECABvj05NatY5josEWRw+jy4OkQJ4l+QRdb1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8478

On 16.02.2023 00:22, Boris Ostrovsky wrote:
> 
> On 2/15/23 3:31 AM, Jan Beulich wrote:
>> On 15.02.2023 01:07, Boris Ostrovsky wrote:
>>> On 2/14/23 6:53 PM, Boris Ostrovsky wrote:
>>>> On 2/14/23 11:13 AM, Jan Beulich wrote:
>>>>
>>>>> --- a/arch/x86/kernel/cpu/bugs.c
>>>>> +++ b/arch/x86/kernel/cpu/bugs.c
>>>>> @@ -18,6 +18,8 @@
>>>>>    #include <linux/pgtable.h>
>>>>>    #include <linux/bpf.h>
>>>>>    +#include <xen/xen.h>
>>>>> +
>>>>>    #include <asm/spec-ctrl.h>
>>>>>    #include <asm/cmdline.h>
>>>>>    #include <asm/bugs.h>
>>>>> @@ -32,6 +34,7 @@
>>>>>    #include <asm/intel-family.h>
>>>>>    #include <asm/e820/api.h>
>>>>>    #include <asm/hypervisor.h>
>>>>> +#include <asm/xen/hypervisor.h>
>>>>>    #include <asm/tlbflush.h>
>>>>>      #include "cpu.h"
>>>>> @@ -934,7 +937,8 @@ do_cmd_auto:
>>>>>            break;
>>>>>          case RETBLEED_MITIGATION_IBPB:
>>>>> -        setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>>>>> +        if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
>>>>
>>>> Is this going to compile without CONFIG_XEN?
>> Yes. The declaration of xen_vm_assist_ibpb() is visible (satisfying
>> the compiler) and DCE will eliminate the call to the function due to
>> xen_pv_domain() being constant "false" in that case, avoiding any
>> linking issues. The interesting case here really is building with
>> XEN but without XEN_PV: That's why I needed to put the function in
>> enlighten.c. This wouldn't be needed if xen_pv_domain() was also
>> constant "false" in that case (just like xen_pvh_domain() is when
>> !XEN_PVH).
>>
>>>> I also think these two conditions should be wrapped into something to limit exposure of non-Xen code to Xen-specific primitives.
>> I would have done so, if I had any halfway sensible idea on how to
>> go about doing so in this particular case. In the absence of that it
>> looked okay-ish to me to reference Xen functions directly here.
>>
>>> Oh, and this needs x86 maintainers.
>> Eventually yes. But I would prefer to sort the above question first
>> (which I'm sure would have been raised by them, in perhaps more
>> harsh a way), hence the initially limited exposure.
>>
> 
> I also think there is a bit of a disconnect between how the mitigation is reported in the log/sysfs (retbleed_mitigation is RETBLEED_MITIGATION_IBPB, so "Mitigation: IBPB") and, for example, lscpu (since X86_FEATURE_ENTRY_IBPB is not set anymore).

Initially I too was worried about this, but ENTRY_IBPB is not exposed,
as per the empty double quotes in

#define X86_FEATURE_ENTRY_IBPB		(11*32+10) /* "" Issue an IBPB on kernel entry */

Jan

