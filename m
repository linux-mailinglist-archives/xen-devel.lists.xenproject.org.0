Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5AC3CA06
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 17:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157165.1486061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3Ha-00023r-9y; Thu, 06 Nov 2025 16:56:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157165.1486061; Thu, 06 Nov 2025 16:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vH3Ha-00021X-69; Thu, 06 Nov 2025 16:56:22 +0000
Received: by outflank-mailman (input) for mailman id 1157165;
 Thu, 06 Nov 2025 16:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C3PD=5O=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vH3HY-00021P-GN
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 16:56:20 +0000
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c105::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7961b939-bb31-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 17:56:02 +0100 (CET)
Received: from CY8PR19CA0017.namprd19.prod.outlook.com (2603:10b6:930:44::21)
 by LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 6 Nov
 2025 16:55:58 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:930:44:cafe::4f) by CY8PR19CA0017.outlook.office365.com
 (2603:10b6:930:44::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 16:55:55 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 16:55:57 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 6 Nov
 2025 08:55:57 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Nov
 2025 10:55:56 -0600
Received: from [172.27.250.45] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 6 Nov 2025 08:55:55 -0800
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
X-Inumbo-ID: 7961b939-bb31-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBZbHEOJ/AdnaJXfoMKKe0ZwqyQg6nVU/EUObeUPDi4RsrixQtvfOyAn2Z6eS6iNxPV4Y50GSCxfVaAHXPLrfEg3VyRqGkT7iIFjH+j2qn9ZiSeQswNl4CHzo4+Mj4XRDFEAALLMRJIMpVQx83QahptDLtF16B1HvimtHOWUF+J892O3rWg37DNnK1rybTNtVhXiNWb/uUE4KGrqa5sLCUYzvyNhXchZfkZWa57cOJIU8C+KaTwJC86AV1p1YweuGadpuvv4i8ySTcg+I6JH+bJDdqR+mqh8DMrcrIgIO6VJy+NfUA6jIqbRaOrdCmGD8dzrJzh5b4HU/McgjcYubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3E5u4GUjTVwgGqTVNEWdDcgc4DO16VL8hdyYUTB+vlA=;
 b=LFhBXFw2uQtF0euW03KHDmwNxr6CysjafdzALleWTBmxS4bCA811aju5TxgmbQKhK4keMNmxXvjbKYa5N/969yzHCWW7+dKTTTI3pSgd2HMQeSIhJpUVG7ySuF7g9tlTn1rejL8MlNX5UfVYNOY10K4rLTr+4pq7FDHzuZWz0XK94M9CFUdGxZl+dOJU83QQiGTPFBX/PrlYin8uHN7NCzutXdWfhDt2+VmFCmQfrNc6cl0op/6EXwPoh5w023javkilRhN6TfuJy8FZ3QFMzOvY3n+dC/HsBFM2Er00wOxSHFEo+W9nYxYHlpEifS7EbM7xg4G0jFJcxlIJDfqb7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3E5u4GUjTVwgGqTVNEWdDcgc4DO16VL8hdyYUTB+vlA=;
 b=WC9UCMShGtFK58C0818ycj9gfywxKsn2AJCWcvRCKsky0XQ7AFe/lGMdXc048a9qC6iGinAyC4doA/+b6br0RXKvG18G9MfxTzRrwLZHL7ve9DcJtDt86myKQU80G+TJi/876NC8Dgd9Y3GhDWjS3oobbtfcs7EpkkuIUBp72jI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <0217b1ff-2c33-43ae-adbc-d665c881473d@amd.com>
Date: Thu, 6 Nov 2025 11:55:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen/x86: guest_access: optimize raw_x_guest() for PV
 and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>, Teddy Astie
	<teddy.astie@vates.tech>, <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alejandro Vallejo <alejandro.garciavallejo@amd.com>
References: <20251031212058.1338332-1-grygorii_strashko@epam.com>
 <434d9ce4-e5e1-453d-84b7-e21e66d0c5a3@vates.tech>
 <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <b012c6c3-fb8d-4336-922f-f40bc43eb2b5@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: 893113d0-baf4-41e8-8a90-08de1d555b62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MzR1UzdWQk5VM1htZXhkbTBiNngvdCszcUlBd3VnS0I3ZWprZklDSCs2citI?=
 =?utf-8?B?SGN1c20wZEhKa0MyaEcwTzVQQWxOR1pzNDV2anE0UUI3UUxQcHpnWXBjMnMz?=
 =?utf-8?B?MjV5UjErZzdyU0VIaHZSYTNZQTJMY2RGVVYra3I1L1FRbnAzVTREQTNTNnps?=
 =?utf-8?B?cFVsYmppYjdhdnhlUGpqRVhBRkY1USsyQWloZjA5dXFoMGp6ZXYyb1gwd1RU?=
 =?utf-8?B?eVRFT3hjSFp3OXQwbjVQVWZGSGJJeWZrMXEwbmVLRXNCSWhvSGJETytYZitV?=
 =?utf-8?B?WXd6aGZwSkhnOVJHR0VLTjRTdTlmY0tncFdqOVZJaHVTOHdVV0RjT3FSa1Q4?=
 =?utf-8?B?QVh1am0yeVBKdkVhTmZJbVNWR3BhMFRyeEdTRnR2d21qQmQzdENkREZha3N6?=
 =?utf-8?B?ZzNKOFRlUE1QcFBkSkNnMUc4UWdwanNkaHJ1Ukw2ajY5RUpKenErU1RyQ21H?=
 =?utf-8?B?YmQxS21IbE5XakZtbUUvMSt4YWVtQTUxUHF6bXloV3JocHFXbFh0aEdWbGR4?=
 =?utf-8?B?dkFIWHN5WkM1WGFmakZVWGRBbzhBbHVVWkJLeFlzUmR0V0JZZThLbEU3SnhJ?=
 =?utf-8?B?T09IVHJKems4bXBNVm1WNkFUZm9Dak03TDdhTXpSTCtkOEdYdU02NCtyN1Nm?=
 =?utf-8?B?MUtJMGFrMGxXaWhKSlRLM3BSWWpKREozclpDYVg3aGtReXZIaFZaUGtrTExU?=
 =?utf-8?B?WWdMRTRBYzBjZjNqaW5UUWROVThLbXhOVER4dVFudGZDeW9Jd1VwRXFPVVRR?=
 =?utf-8?B?b0pESlhzOWRnRVFqZ3FpRTNSUEtickhYemF3MTFGcGRrazY2SXluektqdDhO?=
 =?utf-8?B?SGw1TDhJSWI3dEx0K2k0YzJzUUVJaGJNbmR4R3Y0Uy9TT2k0UkREbENlVFpK?=
 =?utf-8?B?dkdicHJ1U0VoejNJeEdMZmNGQ3JTWUx3alQzSWJ2WlBPMkpsWUtJM0pnbkJq?=
 =?utf-8?B?OFpucDhHUnRDY1ZEdU9DUHBrZGxxLzdidHczNTh1Vks5R28vN0k4ZVJUREgz?=
 =?utf-8?B?aWI4MkowSDA3TUdadG42K1pRajVvNDgwMno3TGkxRHd2RCt4cWNqZEI4WXlL?=
 =?utf-8?B?SUlGc2hDcjBueXNxN1g2SThPNWU5WUVYaGozanlFcEJGNFdPVGlxUWFUSDJk?=
 =?utf-8?B?TlIxT2kwcGN3eG5MbXR6dmkyeWlvUEhHc0NKNXdxU1Z3UUF0a3VHMWR3Z3N3?=
 =?utf-8?B?UXRPRkZJTEpCM3RueVFNZzNyMlAyUkFSTlo4SWpraWVZYmR6d1FGTmZ5QWR6?=
 =?utf-8?B?Z0k0M2QvMFhEYWZUZnVJK0hoSFo3YmUrUDJaSW5YV21ad0lRdkxoZENsNk1S?=
 =?utf-8?B?S2JFd1VKQ0xDaVROblpVT3M5MlZBZFZMaEZyeURyL1dlb2U4ZlpmQnFvdEFV?=
 =?utf-8?B?Z3FQekhZa0hlODlSa0lBTnUxR1lnZ0dJS1ducEduaXl6dzc1TCtDYUtXNUhR?=
 =?utf-8?B?d1hwUUhoZWRyN3g1ajlmMmpQSG5UcDQ5UXMzWGcvUXN5bEFndGJPOFFycGpL?=
 =?utf-8?B?TWhJT1VKb3p3TVJvelYzKzY2eDF2NGsyRGc1RWptKytaNkhWRE1xaDY5WW5r?=
 =?utf-8?B?dmptOUdSZ3prTXNuOXRPZ29OM05MU3RTRW5HZTdvcVlPZ0o4djVkWndRWXNX?=
 =?utf-8?B?dUpNaHZLcFZLMEkwTFNEd3JlWWhxbTA2RGJDYit2NXBrY1I3M2IxbStXSXBo?=
 =?utf-8?B?bWN5dysrZ20wWlF3ZE5jT0xmTm5kaFhGeC8rSnRmTlc0aVFZM3o5VjdZVm1n?=
 =?utf-8?B?RUJMcGcvQ1Fra2VVTWhlZXJLZGkzMndFUWdhdVJoOEhqT0N1czVoYVo3NkZJ?=
 =?utf-8?B?dDd5TVpKeXBaRzRFUU13S3FNc2FFT2VhaUdPMVRod2JpYkIrVjY3QStGV1RO?=
 =?utf-8?B?OG9IQjIxVnUvYjAzbk1VQXY5dm9VUDRvRXlmYmdySytyQVA2MUR5NmIra0FE?=
 =?utf-8?B?cDdCeHhKNTJ1NXVRU0VsK0dLYUlDcmx4bVpSRzI0akVWUGxhSlpBbnpOcTZE?=
 =?utf-8?B?ZzFFbDhzdW9jVkVRa3JZeDlCK2VadHFkdytUaHh3OTAyby82ZmxCRWtNSU04?=
 =?utf-8?B?Z3luL2wybkZVVzRmdSt6ejJydlI1U3gvdFhrTUtpeU9BbzFaRC9PWSswbGNr?=
 =?utf-8?Q?S7+A=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 16:55:57.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893113d0-baf4-41e8-8a90-08de1d555b62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758

On 2025-11-06 11:33, Grygorii Strashko wrote:
> Hi Teddy, Jan,
> 
> On 06.11.25 17:57, Teddy Astie wrote:
>> Le 31/10/2025 à 22:25, Grygorii Strashko a écrit :
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Xen uses below pattern for raw_x_guest() functions:
>>>
>>> define raw_copy_to_guest(dst, src, len)        \
>>>       (is_hvm_vcpu(current) ?                     \
>>>        copy_to_user_hvm((dst), (src), (len)) :    \
>>>        copy_to_guest_pv(dst, src, len))
>>>
>>> How this pattern is working depends on CONFIG_PV/CONFIG_HVM as:
>>> - PV=y and HVM=y
>>>     Proper guest access function is selected depending on domain type.
>>> - PV=y and HVM=n
>>>     Only PV domains are possible. is_hvm_domain/vcpu() will constify 
>>> to "false"
>>>     and compiler will optimize code and skip HVM specific part.
>>> - PV=n and HVM=y
>>>     Only HVM domains are possible. is_hvm_domain/vcpu() will not be 
>>> constified.
>>>     No PV specific code will be optimized by compiler.
>>> - PV=n and HVM=n
>>>     No guests should possible. The code will still follow PV path.
>>>
>>> Rework raw_x_guest() code to use required functions explicitly for each
>>> combination of CONFIG_PV/CONFIG_HVM with main intention to optimize 
>>> code for
>>> (PV=n and HVM=y) case.
>>>
>>> For the case (PV=n and HVM=n) empty stubs are created which return (1)
>>> indicating failure. Hence, no guests should possible in this case -
>>> which means no access to guest memory  should ever happen.
>>> The two calls of __raw_copy_to_guest() in common/domain.c- 
>>> >update_runstate_area()
>>> are fixed for this case by explicitly cast the return value to void
>>> (MISRA C Rule 17.7).
>>>
>>> Finally build arch/x86/usercopy.c only for PV=y.
>>>
>>> The measured (bloat-o-meter) improvement for (PV=n and HVM=y) case is:
>>>     add/remove: 0/10 grow/shrink: 2/90 up/down: 163/-30932 (-30769)
>>>     Total: Before=1937113, After=1906344, chg -1.59%
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>    xen/arch/x86/Makefile                   |  2 +-
>>>    xen/arch/x86/include/asm/guest_access.h | 38 +++++++++++++++++++++ 
>>> ++++
>>>    xen/common/domain.c                     | 10 ++++---
>>>    3 files changed, 45 insertions(+), 5 deletions(-)
>>>

>>
>> Alternatively, we can make all the raw_* functions `static inline` and
>> have something like this which should have the same effect with much
>> less redundancy.
>>
>> static inline
>> unsigned int raw_copy_to_user_hvm(void *to, const void *from,
>>                                     unsigned int len)
>> {
>>       if ( IS_ENABLED(CONFIG_HVM) &&
>>            (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(current) )
>>          copy_to_user_hvm(to, from, len);
>>       else if ( IS_ENABLED(CONFIG_PV) )
>>          copy_to_guest_pv(to, from, len);
>      else
>          return len;
>> }
> 
> Can try.

Yes, I was thinking something like Teddy suggested:

#define raw_copy_to_guest(dst, src, len)        \
         (is_hvm_vcpu(current) ? copy_to_user_hvm(dst, src, len) :
          is_pv_vcpu(current) ? copy_to_guest_pv(dst, src, len) :
          fail_copy(dst, src, len))

But that made the think the is_{hvm,pv}_{vcpu,domain}() could be 
optimized for when only 1 of HVM or PV is enabled.

Regards,
Jason

xen: Optimize is_hvm/pv_domain() for single domain type

is_hvm_domain() and is_pv_domain() hardcode the false conditions for
HVM=n and PV=n, but they still leave the XEN_DOMCTL_CDF_hvm flag
checking.  When only one of PV or HVM is set, the result can be hard
coded since the other is impossible.  Notably, this removes the
evaluate_nospec() lfences.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Untested.

HVM=y PV=n bloat-o-meter:

add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)

Full bloat-o-meter below.
---
  xen/include/xen/sched.h | 18 ++++++++++++++----
  1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f680fb4fa1..12f10d9cc8 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1176,8 +1176,13 @@ static always_inline bool 
is_hypercall_target(const struct domain *d)

  static always_inline bool is_pv_domain(const struct domain *d)
  {
-    return IS_ENABLED(CONFIG_PV) &&
-        evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
+    if ( !IS_ENABLED(CONFIG_PV) )
+        return false;
+
+    if ( IS_ENABLED(CONFIG_HVM) )
+        return evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
+
+    return true;
  }

  static always_inline bool is_pv_vcpu(const struct vcpu *v)
@@ -1218,8 +1223,13 @@ static always_inline bool is_pv_64bit_vcpu(const 
struct vcpu *v)

  static always_inline bool is_hvm_domain(const struct domain *d)
  {
-    return IS_ENABLED(CONFIG_HVM) &&
-        evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
+    if ( !IS_ENABLED(CONFIG_HVM) )
+        return false;
+
+    if ( IS_ENABLED(CONFIG_PV) )
+        return evaluate_nospec(d->options & XEN_DOMCTL_CDF_hvm);
+
+    return true;
  }

  static always_inline bool is_hvm_vcpu(const struct vcpu *v)
-- 
2.51.1


HVM=y PV=n bloat-o-meter:

add/remove: 3/6 grow/shrink: 19/212 up/down: 3060/-60349 (-57289)
Function                                     old     new   delta
__alt_instructions_end                         2     896    +894
__stop___pre_ex_table                         40     664    +624
increase_reservation                           -     418    +418
do_memory_op                               11026   11404    +378
decrease_reservation                           -     360    +360
x86_emulate                               217169  217338    +169
x86_msr_copy_to_buffer                       117     177     +60
__start_bug_frames_0                           -      40     +40
pt_irq_destroy_bind                         1490    1515     +25
map_pages_to_xen                            4284    4300     +16
domain_cpu_policy_changed                     95     108     +13
sched_init_vcpu                             1621    1630      +9
is_memory_hole                               105     113      +8
hvm_save                                     549     557      +8
pv_soft_rdtsc                                 62      69      +7
elf_load_image                                84      91      +7
console_send                                 262     268      +6
wmemchr                                       58      63      +5
map_grant_ref                               5410    5415      +5
__start_xen                                 8273    8277      +4
p2m_pod_init                                 138     141      +3
pending_requeue                              635     636      +1
set_time_scale                                93      91      -2
do_debug                                     391     389      -2
handle_iomem_range                           171     168      -3
fill_vmsr_data                               424     421      -3
p2m_pod_offline_or_broken_hit               1720    1716      -4
allocate_pirq                                480     476      -4
subpage_mmio_find_page                        68      63      -5
x86_cpu_policy_fill_native                   999     991      -8
recalculate_cpuid_policy                     868     860      -8
irq_load_pci                                 211     201     -10
local_time_calibration                       440     429     -11
ioreq_server_add_vcpu_all                    199     188     -11
hvm_get_mem_pinned_cacheattr                 233     222     -11
symbols_offsets                            16856   16844     -12
send_guest_pirq                              386     374     -12
pt_restore_timer                             171     158     -13
p2m_pod_zero_check_superpage                1251    1238     -13
inject_vmce                                  208     195     -13
amd_vpmu_save                                278     265     -13
time_resume                                  324     310     -14
vmcb_dump                                    300     285     -15
pirq_cleanup_check                            97      82     -15
init_hypercall_page                           61      46     -15
init_domain_irq_mapping                      191     176     -15
cpu_schedule_callback                        549     534     -15
__hvm_copy                                   695     680     -15
fixup_eoi                                    175     159     -16
evtchn_destroy_final                         171     155     -16
context_switch                               703     687     -16
__stop_bug_frames_1                         3672    3656     -16
p2m_init_one                                 203     186     -17
p2m_init                                     133     116     -17
p2m_final_teardown                            60      43     -17
iommu_domain_init                            251     234     -17
hvmemul_write_cache                          938     921     -17
hvm_do_IRQ_dpci                              256     239     -17
domain_update_node_aff                       387     370     -17
domain_set_time_offset                        41      24     -17
cleanup_domain_irq_mapping                    61      44     -17
arch_evtchn_bind_pirq                        142     125     -17
arch_domain_destroy                          130     113     -17
alloc_vcpu_struct                             58      41     -17
hvm_get_guest_time_fixed                     139     120     -19
hvm_assert_evtchn_irq                        183     164     -19
__context_switch                             539     520     -19
setup_io_bitmap                              123     103     -20
vm_event_toggle_singlestep                    65      44     -21
show_registers                               626     605     -21
show_execution_state                         508     487     -21
p2m_pod_get_mem_target                       728     707     -21
ioreq_server_get_frame                       333     312     -21
get_free_pirqs                               188     167     -21
arch_vcpu_destroy                             93      72     -21
amd_vpmu_destroy                              90      69     -21
shadow_domain_init                            63      41     -22
p2m_mem_access_sanity_check                   71      49     -22
hvm_domain_use_pirq                           50      28     -22
dump_irq_info                                495     473     -22
tsc_get_info                                 230     207     -23
hvm_set_callback_via                         280     257     -23
vcpu_mark_events_pending                      50      26     -24
dump_softtsc                                 511     487     -24
dump_pageframe_info                          527     503     -24
arch_pci_clean_pirqs                         347     323     -24
vmce_enable_mca_cap                          125     100     -25
msixtbl_init                                 100      75     -25
guest_flush_tlb_flags                         46      21     -25
domain_get_irq_dpci                           54      29     -25
arch_domain_creation_finished                 48      23     -25
unmmap_broken_page                           287     261     -26
p2m_pod_active                               391     365     -26
gtsc_to_gtime                                 49      23     -26
domain_relinquish_resources                  721     695     -26
do_vm_assist                                 141     113     -28
vmce_restore_vcpu                            160     131     -29
unmap_domain_pirq_emuirq                     255     226     -29
construct_dom                                206     177     -29
arch_domain_soft_reset                       892     863     -29
get_free_pirq                                240     210     -30
vm_event_fill_regs                          1280    1248     -32
paging_gva_to_gfn                            297     265     -32
evtchn_reset                                 818     786     -32
map_domain_emuirq_pirq                       558     524     -34
physdev_unmap_pirq                           686     651     -35
cpu_policy_updated                            35       -     -35
do_IRQ                                      1496    1459     -37
alloc_pirq_struct                             96      59     -37
iommu_unmap                                  657     619     -38
iommu_map                                    682     644     -38
evtchn_close                                1685    1647     -38
xenctl_bitmap_to_bitmap                      274     235     -39
amd_vpmu_load                                521     482     -39
iommu_free_pgtables                          358     318     -40
dom0_setup_permissions                      3762    3722     -40
evtchn_destroy                               479     438     -41
arch_do_multicall_call                        52      10     -42
symbols_names                              50060   50016     -44
p2m_teardown                                 945     901     -44
_put_page_type                               667     623     -44
hvmemul_read_cache                           581     536     -45
vcpu_block                                   156     109     -47
safe_copy_string_from_guest                  169     122     -47
map_range                                    508     461     -47
getdomaininfo                                695     648     -47
physdev_map_pirq                             921     873     -48
gnttab_release_mappings                     1447    1399     -48
guest_rdmsr                                 1972    1923     -49
x86_msr_copy_from_buffer                     280     230     -50
relinquish_memory                           1212    1161     -51
p2m_set_mem_access                           838     787     -51
p2m_pod_demand_populate                     2238    2187     -51
hvmemul_rep_outs                             680     629     -51
compat_set_cx_pminfo                         539     488     -51
tsc_set_info                                 480     428     -52
monitor_domctl                               600     547     -53
default_initialise_vcpu                      208     154     -54
collect_time_info                            336     282     -54
xenmem_add_to_physmap                        706     651     -55
hvm_set_mem_pinned_cacheattr                 772     717     -55
hap_track_dirty_vram                        1331    1276     -55
arch_domain_create                           998     943     -55
ucode_update_hcall                           202     146     -56
copy_leaf_to_buffer                          160     104     -56
relinquish_p2m_mapping                       988     930     -58
gtime_to_gtsc                                 81      23     -58
arch_hwdom_irqs                              132      74     -58
x86_cpuid_copy_from_buffer                   760     701     -59
set_px_pminfo                                851     792     -59
set_cx_pminfo                               1675    1616     -59
do_dm_op                                     191     132     -59
hap_set_allocation                           510     450     -60
domain_get_maximum_gpfn                       79      19     -60
_handle_iomem_range                          234     173     -61
compat_dm_op                                 261     199     -62
paging_free_log_dirty_bitmap                1653    1589     -64
memcpy_to_guest_ring                         409     344     -65
efi_compat_get_info                          993     928     -65
smt_up_down_helper                           437     370     -67
arch_set_info_guest                          402     335     -67
guest_wrmsr                                 2354    2286     -68
read_console_ring                            395     325     -70
vcpu_show_execution_state                    737     665     -72
hvm_save_one                                 798     726     -72
efi_get_info                                1028     948     -80
arch_initialise_vcpu                         197     110     -87
amd_vpmu_do_wrmsr                            905     816     -89
iommu_do_pci_domctl                         2051    1961     -90
compat_argo_op                               405     313     -92
_get_page_type                              1439    1347     -92
do_get_pm_info                               998     902     -96
p2m_pod_empty_cache                         1123    1020    -103
vpmu_do_interrupt                            965     851    -114
p2m_pod_set_cache_target                     816     701    -115
gwstrlen                                     284     168    -116
do_paging_domctl_cont                        879     758    -121
mem_access_memop                             986     859    -127
copy_msr_to_buffer                           138       -    -138
get_reserved_device_memory                   404     259    -145
do_pm_op                                    2731    2577    -154
p2m_set_mem_access_multi                    1023     861    -162
do_xenpmu_op                                1690    1524    -166
do_vcpu_op                                   736     568    -168
bitmap_to_xenctl_bitmap                      477     309    -168
do_poll                                      900     731    -169
subarch_memory_op                            720     550    -170
elf_memcpy                                   170       -    -170
arch_vcpu_create                             392     221    -171
do_console_io                               1069     887    -182
gnttab_copy                                 1596    1396    -200
gnttab_unmap_grant_ref                       778     565    -213
gnttab_unmap_and_replace                     778     565    -213
update_runstate_area                         814     599    -215
acpi_set_pdc_bits                            450     235    -215
compat_arch_memory_op                        990     769    -221
__stop_bug_frames_2                        59456   59232    -224
compat_vcpu_op                               885     656    -229
pci_physdev_op                               865     626    -239
update_secondary_system_time                 462     217    -245
populate_physmap                            1220     970    -250
paging_domctl                               3240    2987    -253
gnttab_setup_table                          1337    1084    -253
gnttab_get_status_frames                    1624    1370    -254
symbols_token_index                       118952  118688    -264
vcpu_show_registers                          375      88    -287
efi_runtime_call                            2621    2333    -288
do_sched_op                                 1126     821    -305
efi_compat_runtime_call                     3036    2724    -312
compat_sched_op                             1147     835    -312
compat_common_vcpu_op                        803     416    -387
arch_get_info_guest                          899     512    -387
compat_multicall                            1201     792    -409
guest_cpuid                                 1835    1418    -417
do_multicall                                1165     725    -440
arch_do_sysctl                              1293     843    -450
common_vcpu_op                              1727    1276    -451
dm_op                                       3776    3282    -494
_einittext                                  1937    1439    -498
do_domctl                                   7108    6505    -603
show_guest_stack                             609       -    -609
do_hvm_op                                   4075    3440    -635
do_grant_table_op                           6666    6031    -635
arch_memory_op                              2888    2233    -655
do_argo_op                                  7164    6501    -663
compat_grant_table_op                       2491    1827    -664
__start___ex_table                          1696    1032    -664
do_xen_version                              2600    1906    -694
pmstat_get_cx_stat                          2660    1822    -838
__alt_call_sites_start                       892       -    -892
arch_do_domctl                              7351    6351   -1000
do_sysctl                                   5190    4074   -1116
do_event_channel_op                         4471    3074   -1397
compat_physdev_op                           4989    3552   -1437
do_physdev_op                               5142    3688   -1454
do_platform_op                              6428    4778   -1650
compat_platform_op                          6301    4623   -1678
compat_memory_op                            6803    5050   -1753
memory_exchange                             4128       -   -4128
__alt_instructions                         53802   33488  -20314
Total: Before=18446744073714933955, After=18446744073714876666, chg -0.00%

