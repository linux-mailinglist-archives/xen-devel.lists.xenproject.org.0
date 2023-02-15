Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9158D697832
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 09:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495762.766179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDCd-0003TB-LL; Wed, 15 Feb 2023 08:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495762.766179; Wed, 15 Feb 2023 08:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSDCd-0003Qh-IQ; Wed, 15 Feb 2023 08:31:47 +0000
Received: by outflank-mailman (input) for mailman id 495762;
 Wed, 15 Feb 2023 08:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7OvG=6L=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSDCc-0003Qb-8c
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 08:31:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c7a04d9-ad0b-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 09:31:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 08:31:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 08:31:39 +0000
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
X-Inumbo-ID: 2c7a04d9-ad0b-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5VU1312sp8NrJIUl1riZ3dKLSr75d/JF3hQbW/O1k8MbrxLjBImGq0FD1hZeBW+2K3Z3DgsvGwHleopKEH/L21BnuHrh1ixWc+fMwYMfM4pL3O9MBsbSVLvy2xiEM5srytn827komVwL8B0XuduFXEbqrk9fnsMm6fkD0wBfH45x01tas3TzIXSIGgAHz1xicd8LqmwNK2hyLijAcsfkUvoHAajL4CFPm8+uSAnm/0qpw5IepU6dgrUV4O72YVjqGH5Ty84HAEm4cxZn0N5NIUfF7Z54dgbgRajn0KVb8XmxzCQINbVsjcK1mAQAGpO5bNy0snzRUhj/vwrXW8OWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVIM5suLFeTH2CsLZFTDkv0CpL4BN3DjyXX8/2ikmEw=;
 b=V4IMvoOZmNmpg3qlet0sjSfGej5SvLnfknkZCvIGSaFb7vsvvvvX3LYozJBSfj7Rz5FWw9xETXPb2VrZWWDyqyjTYMKd/6vfss27Ii+ZKhkgGpO/tFCZbrECeM+fJmoes4A2Cyq4F3zvBiLbN4h6OwOgzU/Jt5vQXWDFyLOiq8VJmC15FBnVLy5uIxzd5tBtFbgOJGiJuQelN5zylOKGIBCNp0huAKA1CHGz8r/8+WGMlyF+BnBF0J6snjlKO6Aq/RbmDJfgvjbxCljKV1jgNgsLKU04NF2MdHxwRDH+b1bSMK/bhdRoULP8DElZArsRl2jTibNJCQ810NfymXmbhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVIM5suLFeTH2CsLZFTDkv0CpL4BN3DjyXX8/2ikmEw=;
 b=dZAQaDfvgynf3ixjmf0MrIHL2y7w2h3jAQMEfkzBImyz8m30AkLA5hx+XV1mTE6WxWMTw0G/7HvW6u0ZzVa2rjwyHCru5rbtuHdEDQzqKgO8gJBcH2n6WO3vDprfzobimaW236iyHd0hYzluvuoAOklORi/nKF4jx/DcRvQmsu+t02kF+BuDN+Yd6SVlaJxcqxIuz9tvEa1qomL7KJqZeRxeHHva/oHJVDVVFTX8wftAPL7/YG2+TZJcgNRFFMPxwmtJpMsmZn9Oa9nZK7qo9Fy+Rfdqf72JMB45QI3/Hnr8yNAqAbQbucdZ6el37baBG0MsbXKT3bExu29sTUZc/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f4f8c6ff-8d3a-92aa-66a0-7978c989a42f@suse.com>
Date: Wed, 15 Feb 2023 09:31:37 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4e66865b-11ce-cbd1-d115-13e3743eed7b@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9498:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fdc847-27b8-407c-d9c5-08db0f2f0f3a
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9/B2tuWDAbTlEeZb1zaUkzZ8dfZ+96KkhFhmCDw9OM4RUcPJgEV9b+/AGyPamuUbIM1AfgAexERiWebQlGI9YYROaHgZG3lQxBfT+RsFGsYw+x7+T6sYYmABF+tTZ+qSgcIlF0XqJaI1JoUUbO11S8vsr/z8ema5DdXbd6zKleXjSm3aUNehYXpXGCgL2qzfnq+XHhnbjantIfZTXBDPzwkhbDEki+EvWD/pyCZOBx2HL+UD0qpA5EZs3jH2kR+pubETHGO2QWkyg4SISafaJvIpWFQv0t/j9GmmyF1wQxxjHw0VwgraKQ+9va8MlnHrlByX6phdW05ts6sLC4a+gRkruut+jRgNj8Vne4NuBfsnc5uqYn4oPTfGV+1f6mjORZLYYhi4naLkoJXYmD3B+dCOHDWA/tqG7sdPv1eGnrNmBtXAQVC22gfZC5HCTjHBeCctNLUqdGZTv5dgOJ6ej4lgeuDWZNsw9v7wNfCd0l9blMupF0GiIi9bJrd/X7vx8jZ+vys+qwnW9g3wanlNS0gDIKsPnfn5HziEEVQCKTDhdJ3Csx2yzqtZxc6eEcl1tmK4qPEwy5XS+JFIdH+sdYifOsjNakkn+quczI4uucIdwVs9xjUTAWWxwj2MdVPNaZpfWT45ROde4Fa6QlmwFlYtqy3XFYdmpeTL3xkKGYRCNqysW0Ki/Qwfj71WR1jvMODquFP7ooRQsRtMLt/04waESnRu9Jpv9Qf60X/ZcGo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199018)(8936002)(5660300002)(86362001)(8676002)(6916009)(66556008)(66476007)(4326008)(41300700001)(66946007)(54906003)(2616005)(316002)(2906002)(6486002)(36756003)(31686004)(6506007)(478600001)(186003)(26005)(6512007)(53546011)(38100700002)(31696002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhjTUpGVG1BcW5sQmZvZmE5NTBQVGJ2SlJsRTM2Y2FXcTVYRm13d3lGWDlt?=
 =?utf-8?B?N2RkRmNUdS9YSUdvcEV5eWlaV2RObWExbWdldzF3YmU3UVhCWFRMOE9rYjlX?=
 =?utf-8?B?WDBrNitUV21YOVcya25SblVqaXpBQ3VWTzZjS1crVVpwZ1hEYkpCaVVVZ0pW?=
 =?utf-8?B?azY0RUpXaXd5R0xHaUlyUCtzUXV0RG13Z3BRT05aSlk4MkZzVzlGOGNnU0Vx?=
 =?utf-8?B?aHNCWFFCWFNrZHBmKzNNUldPeGVkZjhGS1E0cDZyeGRsMVJoSHJtYXhFK1RX?=
 =?utf-8?B?dEdJaTZ3SVFjcXpLRitvb2FSU1FsV09HV3loTUJESE13SGFmQ1VlMkU5Q1Q5?=
 =?utf-8?B?VWNvbGpnU0lkckwzelRUZ0ZlZG1oei9TK0w0UUlYQ3gwVDVWeU9nOUlmWEY2?=
 =?utf-8?B?RmVIOXl6MmovWkhGVFdXNFdPTVgydUNlWUFteFJtM3dvaTc5eC8zK00zQ1Vq?=
 =?utf-8?B?dzV5a1pqSGVUWnZUZ1NjUnpXY0duR3d2dzAxOFJKK0kvV1VFK3QrS3gyR00y?=
 =?utf-8?B?SGs2SVRLeW9IeFg3dXg0MkptVzN2Q0xiSXo1Q3hMSXZpdE1wSFdhUzJxcSt4?=
 =?utf-8?B?WFpoTUtCKzJaSjE1QUJYTkJoSzdUeU8vODdNWjhvOFMvajcrMmd4SFAxUWU4?=
 =?utf-8?B?TlBxeElZSk5OdXdsMDR1cVNTNEc5eTZPeStEdzNEYTJBeE1FUC94YXpIczcw?=
 =?utf-8?B?OGlVNjY0KzJmTk1PMXZ4WTRpNDFNc2hIQm5iQS9MK2d4RUE1UWljUVVKNzJ2?=
 =?utf-8?B?aGJsMDVtVUVhbkk4Z0RVN0lsTEZvREZVcGZ1RVovMzhTT2NmZmo0cncrRlBE?=
 =?utf-8?B?Q24vanNHUEcwYSt1bm00WXBvK0thOG5CVWFVVDlTdFFuTFl4SUNLdXd1YXFL?=
 =?utf-8?B?ZkNVOWtJVGo3bjJVUnB2MEZ3SW5kM1hMaWUrZWdGb1FvNXdBQ3Z5c0FNUmtL?=
 =?utf-8?B?ZW5oTkVPN25VWHhMQm5BUm1xc052WTZhNW45NStNcmQwYktpMVJ6UTRJK2hV?=
 =?utf-8?B?bENHRzRFeVR4OU5ia05lTkQ5T3IyK1ZsWVFpcFlCSjZPUFBOMmV6SHpuM0x5?=
 =?utf-8?B?Q1gwY0svbUFkQnY0OUFrTXlYUWJpdGpRVWhWYzAxRXF0QytIcStvWS9qOUFy?=
 =?utf-8?B?bHhYVjZBYUdkWnNvTFVQVHdhRzBPRmhKYjN1bUU0cXp4RHBOSVlkU2E0M0M0?=
 =?utf-8?B?THl4U3Jxa3NEa3FJUENkSTNMbjd2NUp2ZHdvMGJjMG9BZFh3L3FKejVIRERk?=
 =?utf-8?B?ZklncExnbVdNNXA1UzB1bWR5OWREZU1MVjQ3a1VRcytOYUlxQ2puY2swWStH?=
 =?utf-8?B?STZDMmJJaktFN2Y1TExyRnVIUHI1R1MyVG9CVmRpUUQ5OU1tZTh2dFBtd2Rp?=
 =?utf-8?B?Rmc5djBRYjU2SjRqRUdYVVlDaml2U25ITnZKaDE1M3dZMi90ODhtY0wvaG1I?=
 =?utf-8?B?b3lqVW92bXJvU1RlS0tSMzVlbEVVU0lkZ05oMEg0ajZjc1E2TFBZNFgrdXFm?=
 =?utf-8?B?SmV6bXE4RnhjQkF2Z2pLT2oyWjFKQnovRS9WazZMMDJNeWVscFU4MVFWWnVK?=
 =?utf-8?B?dUwvUGpDRGRTNXNrSkRrUHp4RVBCMmxBOU9QdXIwN2xob3gydHBXT2RnbmFJ?=
 =?utf-8?B?eDByeWJITWlSTCs5UGRuazRLaS96TjQ3ZUtDaUV1bGZhb0FoLzJPUG54NGtB?=
 =?utf-8?B?akdYbWxKaHBpcWg2L0Radis3eVJSSXFMWEt6WENOOUNHbGhyNlhaSXRCbVRi?=
 =?utf-8?B?eCtIU2VISG42bG1tTFlHZ1F1TkYwU2hQd2RuNm1jdGhjaHI4MjMwOE5ERktv?=
 =?utf-8?B?eGtIYTdCWEZGU0Fud1p0ekk2N1c4UWVJSy90MElMS0NVVHFRcHBPS2VnZ2RW?=
 =?utf-8?B?a1Fzc0toMXEvK3pDYm52ZjdyWGpFUHZVNW43Q0FlRTh1ZnhheTdJS3lma2Nl?=
 =?utf-8?B?WEdmdzIwbGJOakhncDNsNEJDR3ZlQkRSblpzenRTcDY4ejZoZjlHYTJOajFo?=
 =?utf-8?B?N05pQnZMQ0dPNHFoWVIvSkNURURYTlBwcmV5NTk4UlpHdVE3UnY2K1ExdnNl?=
 =?utf-8?B?MFlYS3U2QTQrejFwS2JCclJzUGxpeE1hQmFveDlxbW9xdlc1T1RhSElkTnFY?=
 =?utf-8?Q?7pPvMkw+yLotTfnXEOLtXPjUK?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fdc847-27b8-407c-d9c5-08db0f2f0f3a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 08:31:39.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2dDS7QjrEusz0J6dyIRM1AxoTulEWeZKFMHHzir+qJej58l4WeJHD7vlhiSuPHD1EhM/xUoTTraA1g2quFZxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9498

On 15.02.2023 01:07, Boris Ostrovsky wrote:
> 
> On 2/14/23 6:53 PM, Boris Ostrovsky wrote:
>>
>> On 2/14/23 11:13 AM, Jan Beulich wrote:
>>
>>> --- a/arch/x86/kernel/cpu/bugs.c
>>> +++ b/arch/x86/kernel/cpu/bugs.c
>>> @@ -18,6 +18,8 @@
>>>   #include <linux/pgtable.h>
>>>   #include <linux/bpf.h>
>>>   +#include <xen/xen.h>
>>> +
>>>   #include <asm/spec-ctrl.h>
>>>   #include <asm/cmdline.h>
>>>   #include <asm/bugs.h>
>>> @@ -32,6 +34,7 @@
>>>   #include <asm/intel-family.h>
>>>   #include <asm/e820/api.h>
>>>   #include <asm/hypervisor.h>
>>> +#include <asm/xen/hypervisor.h>
>>>   #include <asm/tlbflush.h>
>>>     #include "cpu.h"
>>> @@ -934,7 +937,8 @@ do_cmd_auto:
>>>           break;
>>>         case RETBLEED_MITIGATION_IBPB:
>>> -        setup_force_cpu_cap(X86_FEATURE_ENTRY_IBPB);
>>> +        if (!xen_pv_domain() || xen_vm_assist_ibpb(true))
>>
>>
>> Is this going to compile without CONFIG_XEN?

Yes. The declaration of xen_vm_assist_ibpb() is visible (satisfying
the compiler) and DCE will eliminate the call to the function due to
xen_pv_domain() being constant "false" in that case, avoiding any
linking issues. The interesting case here really is building with
XEN but without XEN_PV: That's why I needed to put the function in
enlighten.c. This wouldn't be needed if xen_pv_domain() was also
constant "false" in that case (just like xen_pvh_domain() is when
!XEN_PVH).

>> I also think these two conditions should be wrapped into something to limit exposure of non-Xen code to Xen-specific primitives.

I would have done so, if I had any halfway sensible idea on how to
go about doing so in this particular case. In the absence of that it
looked okay-ish to me to reference Xen functions directly here.

> Oh, and this needs x86 maintainers.

Eventually yes. But I would prefer to sort the above question first
(which I'm sure would have been raised by them, in perhaps more
harsh a way), hence the initially limited exposure.

Jan

