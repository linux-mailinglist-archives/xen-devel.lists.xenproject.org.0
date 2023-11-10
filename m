Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4957E7AEA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 10:33:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630042.982706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nt5-0005SE-5T; Fri, 10 Nov 2023 09:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630042.982706; Fri, 10 Nov 2023 09:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Nt5-0005Pg-2G; Fri, 10 Nov 2023 09:33:15 +0000
Received: by outflank-mailman (input) for mailman id 630042;
 Fri, 10 Nov 2023 09:33:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLlG=GX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1r1Nt3-0005PT-8k
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 09:33:13 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a65ba1b-7fac-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 10:33:12 +0100 (CET)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9643.eurprd04.prod.outlook.com (2603:10a6:102:241::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Fri, 10 Nov
 2023 09:33:09 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::eb8e:fa24:44c1:5d44%3]) with mapi id 15.20.7002.010; Fri, 10 Nov 2023
 09:33:09 +0000
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
X-Inumbo-ID: 2a65ba1b-7fac-11ee-98da-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnGOjvhHsWp6cBfaUXPEqHral+bVPG7dJPouJh+iIWi2VH6NbZE8/mTGmxM9N0mD22PeKrv65tRaExD5U0tmntmTlTn058JGGthnngtoccrQxoc0V1bVtBgeitahrIM/WJLChxd+22JFvhYaLs3OSGk02oAcjEwiLl2Jh2RnD2FL8d+Ij2HlrXbJjytIegVbo1hebgJUEMwdJf4n9x1bcr584P3dYsDCAPIJUYXxdn8GQOuNbMzszXx5HwXZhsnM0jseY8lzv7MnIplLmE3bxsSHzrRCDWcfP7x25/+kCjlUDWDYkO5rcnx/re5mf3kswsClodje9Z5hzOSMwVnQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbHg0+MVw0zY/+OS5g62zJJ+UsywqM2pZlP+yJHUWf8=;
 b=cNEPKH6tw06OnVDgF71e7C9UQFcB4Auxmefu6Dx9klkBYzQSdm9zTPSilbTebgaq95eNjj12Nu5LLZKP7MQauE7dZKe3yxjTDwZjgtUPJD1ujFX9aWa0UnldD5jX+iz7x04W9GnaQJs8BhxOWtzc85ng+30RRGmr2vOALtvqGP69cNIQcSlRG0XQCUB3QsXnQEl5HM0hPquKlyjYQaWrAgxUdPNGnEcFe8hQ8BWx+LsIlBtsguj8twlT88SJdtYkR2G6lU21QgEJjIPltRPWi3B8Abq39ze0C6pwt53FCUiogAC3EaJEAck110WcXgGcORRvZyMH6mTDHw3FW7tftw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZbHg0+MVw0zY/+OS5g62zJJ+UsywqM2pZlP+yJHUWf8=;
 b=5Rn0eX/HkVtp4fw0PpySoYdI6BVwEj9SKzIBNGjqEpUrr883/C+7IwlzG+2LMBOtxCNbVQGadt7MMsSQ9oCisWqfPVphTgepwPKhzfd3VpHDwKGA5/4wnJmLVBX9GCYWLGhf4RM5SxrnBqagQz+UJlP4StbTv0Ypi2h7EAbuj04a+S+Jjn0EDc7oYGeaILb0GlYptLZ/Sdzhi+KXbBWpQIVKTR0bTrMpeh2Ynsv/dosjnHMAX/BmzQ/UjCVgZBGtSqinn/EaXHT136qe4mhLUgfj5uHza+F8hb+/7krdczXg6FKzvL+vgY8NCEJNpvrac4PsUra7h3X5FtZG5sqWwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <783660ff-63d8-62b9-1859-33614e0d128b@suse.com>
Date: Fri, 10 Nov 2023 10:33:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
 <99c3a51292fcc85da0759a5abe84e97c6c429358.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <99c3a51292fcc85da0759a5abe84e97c6c429358.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9643:EE_
X-MS-Office365-Filtering-Correlation-Id: e22ef7e3-27b7-4137-1e05-08dbe1d00d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jz1P3d+3Mrsu015mOOHzhpKx+Tl8a7p3IS7igHRJVjaROP215/gjyP5eObv/wUzy7FhrwMYhbEuGJ3pzKTXLFMwRwMr3IOwt55qw9a61rKD0dSdTZ7hizmguzEhgKvu7cYKdNWyVrOYO/qU9x/+aQ5Fzf8MuBJQtzxpD32YLDI+9+ZUgxVV0Mk9nFAyAiwVg0eYmm5o9e5QCOUzs48uyxsQjBbLQFIhNHfKg3tOxV35eWiOu9i1hWuRxYz35YZEHF4u8dMyEZvC1XRAygGgjgPxthxG7/ws8mvg5Od5929odefmLjiQOugAF/b4xs8bd7iet1PWGdyGVj48jE/BJTZXOynRKNkj+64zekIh/J7J0PNyN2Rg/gZCllQ3NdQ686Iq78RnwbehWi7So4z/IYJkulBz/QahHUMYWq2oFaOs+id998OvYe7AuCUubr68dgWMOIXdTQlN2vPYnnjkLJSzaeZcZsGNUvDq/eGipPXSLpyE4FEAWo6cgiRwSBXqcTyrrZh6/ZFFFUMMfuDvSOCAN1OECdmR2ZZ1ClFctNjEQorEAjiKC5Ef5SMj+gTDqV/XHd0zMMvblFAG9PCRNOgAzMAj89213psftqBEJauK2RumbdboiyKeLrW+/JJ1jCwQ493O/Fx5G2DaYFI+quw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(2616005)(2906002)(26005)(4001150100001)(66556008)(53546011)(66946007)(83380400001)(6506007)(6916009)(36756003)(66476007)(41300700001)(6512007)(316002)(4326008)(7416002)(5660300002)(8676002)(86362001)(54906003)(31696002)(8936002)(38100700002)(478600001)(31686004)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WjVMcmUvK0xtYzlKSGNhdDdDeVdwcmQ5TWo3SFZpQ3FzbnBmVTBGSk9aL2Vv?=
 =?utf-8?B?UTJydlh1b1ZtRXNDVG5ZN2pIMmR5Qlc0NHNuN1pkL0hNcTdxNWRyMGRNY0pY?=
 =?utf-8?B?SUJNUDQrZUwvMks2K0ZlVXNjalNEVnR5dm8zREk2S3oyenZETWRYZFdsUlVj?=
 =?utf-8?B?K3B3YWk3eGZqRzVWbjNOWlhYOHpiLzYyTUZac04wTDZHZVkxeHY1bEdEbkVG?=
 =?utf-8?B?QWpvV29tU3RuOEluVU95bGJiK2lKTGJtelZkQytQS1NnSzZiaS9RbGpzZEl3?=
 =?utf-8?B?VXY3ak5EYUt0Z3dnTzZLRWFvZkRTMzhXdEFXMHY3WTdFaHVQL0tnNjhqUkhp?=
 =?utf-8?B?SUVBQlJURWZRY3VHa3JtQzBRbmlaTTk4RVRDVFR5YTUyWFI4V09IYXdDbUxu?=
 =?utf-8?B?SUxENUliNFBKRDJNYUpEY2owYUlodEQzMStxZzRJNkdZVHZLbFVBS0tFWCtJ?=
 =?utf-8?B?YnBZNVRjV21UYXF5cnRPdmNjdFZtRmQ2TGo3WlNkU3VNSGZJdzBWaHgveThB?=
 =?utf-8?B?aFBiWUlqN1RzVm9ZbUNBUWtCUVJRSXJkaUhIYWo5TUZYbGdpQ0lDUjk3VFM0?=
 =?utf-8?B?cld1bUFWbjBXTW5WbmxwSXpLcmJFOVgvYTZYb0p2dVNuelZHWUhCWm05NlJN?=
 =?utf-8?B?M1dHTjJWc1hqRlhzOGtqR3B2T2kwRXl0RGJSMi9CU3l2R2UwRjc2aTBheFdR?=
 =?utf-8?B?ank1STMvSmNaWEJSWmZMa3dpbU5GQVZaQTNkR0VxbUdtVzZsZXdDSTNGMHc3?=
 =?utf-8?B?SERvTy8wQ0ZMblNBMU0zYWRKbkMxaVU4dzQxWUNFTmhxMjZLRHYxNnY2ekQ5?=
 =?utf-8?B?dEdEMDU3NGx4bmV5bEdrS1cxYnJiRERKNFZGbkdyalVJWjArWXlURnhYaDh2?=
 =?utf-8?B?Qm1VTmN0c3dCMk11cGozMVpyamF1TTcrdlFsR0JaNnFDdks5OHA4VG9rNk5O?=
 =?utf-8?B?STZ2Q0lUbnlIOWNibW82V2lyVTkrbWlaQnlMbnAyQ3lKMEF3TkQwckkvUmtD?=
 =?utf-8?B?QWorc3Rvdm5kem1ia3h3QTZaT0ViR0RETVJETWwxK0hVcUR6ZFNGSDhJbjJL?=
 =?utf-8?B?NUg5OERZcjgzZk5jaCtJYmpHTjFqNVBPSWpnc0E5THN4TVNoQWI4ZXdmNHFq?=
 =?utf-8?B?Qm1VK3YwRkpYNUVPS2hUbTZ4SU1jeC9QeEgxd3lZUXdtUXZ2NHBEekk5ek1O?=
 =?utf-8?B?MXNPUVh3a2xjaGJyTFkyMHVKcVlQb0tFbXk5dy9XbGVmSE1KTjMyVXduUFcv?=
 =?utf-8?B?NEVGVVRaYlg5K25OTmtMSkl0czc2REo1dk9iTzJqQ0QxdXBLWG0vR0ZPNm1z?=
 =?utf-8?B?K1JUcGUxdU8wRXM3aGh3bXZGVjRWdGNsR1JuL3JwZE93WEhvdk9hb29rcHBN?=
 =?utf-8?B?MWJzM1BLSnBvOXV4aG45RjgyTVBkY1J1Mk8wcnlKVUIveDVleWttOFoxOTM1?=
 =?utf-8?B?eUhQNWpzZHo4d1puOTJFUzByU1NsMlV4QnJRcG1rVE5hMEEzbThwdk5jVFZ5?=
 =?utf-8?B?cms4VDFocmNLQmJ5eWVYYy9ZVkwrRkFmQVFGS3RDclhqblJWb3BIN0hEdmJm?=
 =?utf-8?B?eDZiTVBGdmZvQUt6OWVGenU2UjVtcloxQU9ZMTlmTGd0V1FaOGFYdzFTVGh3?=
 =?utf-8?B?UG91N1p0aXhYenJDMWFEU1JnbU15aXc1YlFxeHVPS1NnSENCSWMxYyswdTE1?=
 =?utf-8?B?QWlVaFdyaEF1bHpscStKVXYyb3JhREw2UTF0MTZyL3dpUmZQYkZLZTN4MWVi?=
 =?utf-8?B?a2o0ZWpjSjF4T01yZnFQbllPUXRScjRoRXlpRHROMFVMMXZFMS9saDVoSXVP?=
 =?utf-8?B?Vk5Vdk9MbWpJc0RTOTRKa0EyNWYrelhocG8wTmh1dXRyS1gvU3RXbmFrU0hi?=
 =?utf-8?B?UjM5UWF3aTNzYXBUN3FYcjJpWldpdlAvOFpuOGtzaG90NDNkUmVmMlZUVFdS?=
 =?utf-8?B?QkpCcGlhYWVWZlRabnI5dXhncUNjQnpJc2VYcGdMbjdwYVU1d0E5QTh2d2kv?=
 =?utf-8?B?UzU2cDRudTNySUxyeTBUdFFmcW5oQXltMEdiQnB0QU4vVERjTkVwZVhHcERP?=
 =?utf-8?B?ejg0a0NScFIvQlBzWC84TFl1bzdtZzBvZ2JacTNQWC84U2dIS1dMbyszY0c2?=
 =?utf-8?Q?mgRUcSDxiM77/IURQksrtexvf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e22ef7e3-27b7-4137-1e05-08dbe1d00d3a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2023 09:33:09.5333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8T/tJffqZ+0OhZjbPo+LfBsNxCBBbOd7U9hbwUb/IxkwKatsf2Rxdtw5h2uD6q6qinszkoPJaQrP1KYiBbNCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9643

On 10.11.2023 10:30, Oleksii wrote:
> On Tue, 2023-10-31 at 16:28 +0200, Oleksii Kurochko wrote:
>> <asm/delay.h> only declares udelay() function so udelay()
>> declaration was moved to xen/delay.h.
>>
>> For x86, __udelay() was renamed to udelay() and removed
>> inclusion of <asm/delay.h> in x86 code.
>>
>> For ppc, udelay() stub definition was moved to ppc/stubs.c.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v2:
>>  - rebase on top of the latest staging.
>>  - add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>.
>>  - remove <asm/delay.h> for PPC.
>>  - remove changes related to RISC-V's <asm/delay.h> as they've not
>>    introduced in staging branch yet.
>> ---
>>  xen/arch/arm/include/asm/delay.h  | 14 --------------
>>  xen/arch/ppc/include/asm/delay.h  | 12 ------------
>>  xen/arch/ppc/stubs.c              |  7 +++++++
>>  xen/arch/x86/cpu/microcode/core.c |  2 +-
>>  xen/arch/x86/delay.c              |  2 +-
>>  xen/arch/x86/include/asm/delay.h  | 13 -------------
>>  xen/include/xen/delay.h           |  2 +-
>>  7 files changed, 10 insertions(+), 42 deletions(-)
>>  delete mode 100644 xen/arch/arm/include/asm/delay.h
>>  delete mode 100644 xen/arch/ppc/include/asm/delay.h
>>  delete mode 100644 xen/arch/x86/include/asm/delay.h
>>
>> diff --git a/xen/arch/arm/include/asm/delay.h
>> b/xen/arch/arm/include/asm/delay.h
>> deleted file mode 100644
>> index 042907d9d5..0000000000
>> --- a/xen/arch/arm/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -#ifndef _ARM_DELAY_H
>> -#define _ARM_DELAY_H
>> -
>> -extern void udelay(unsigned long usecs);
>> -
>> -#endif /* defined(_ARM_DELAY_H) */
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/arch/ppc/include/asm/delay.h
>> b/xen/arch/ppc/include/asm/delay.h
>> deleted file mode 100644
>> index da6635888b..0000000000
>> --- a/xen/arch/ppc/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -#ifndef __ASM_PPC_DELAY_H__
>> -#define __ASM_PPC_DELAY_H__
>> -
>> -#include <xen/lib.h>
>> -
>> -static inline void udelay(unsigned long usecs)
>> -{
>> -    BUG_ON("unimplemented");
>> -}
>> -
>> -#endif /* __ASM_PPC_DELAY_H__ */
>> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
>> index 4c276b0e39..a96e45626d 100644
>> --- a/xen/arch/ppc/stubs.c
>> +++ b/xen/arch/ppc/stubs.c
>> @@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char *s,
>> const char *e)
>>  {
>>      BUG_ON("unimplemented");
>>  }
>> +
>> +/* delay.c */
>> +
>> +void udelay(unsigned long usecs)
>> +{
>> +    BUG_ON("unimplemented");
>> +}
>> diff --git a/xen/arch/x86/cpu/microcode/core.c
>> b/xen/arch/x86/cpu/microcode/core.c
>> index 65ebeb50de..22d5e04552 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -23,6 +23,7 @@
>>  
>>  #include <xen/alternative-call.h>
>>  #include <xen/cpu.h>
>> +#include <xen/delay.h>
>>  #include <xen/earlycpio.h>
>>  #include <xen/err.h>
>>  #include <xen/guest_access.h>
>> @@ -35,7 +36,6 @@
>>  
>>  #include <asm/apic.h>
>>  #include <asm/cpu-policy.h>
>> -#include <asm/delay.h>
>>  #include <asm/nmi.h>
>>  #include <asm/processor.h>
>>  #include <asm/setup.h>
>> diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
>> index 2662c26272..b3a41881a1 100644
>> --- a/xen/arch/x86/delay.c
>> +++ b/xen/arch/x86/delay.c
>> @@ -15,7 +15,7 @@
>>  #include <asm/msr.h>
>>  #include <asm/processor.h>
>>  
>> -void __udelay(unsigned long usecs)
>> +void udelay(unsigned long usecs)
>>  {
>>      unsigned long ticks = usecs * (cpu_khz / 1000);
>>      unsigned long s, e;
>> diff --git a/xen/arch/x86/include/asm/delay.h
>> b/xen/arch/x86/include/asm/delay.h
>> deleted file mode 100644
>> index 9be2f46590..0000000000
>> --- a/xen/arch/x86/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -#ifndef _X86_DELAY_H
>> -#define _X86_DELAY_H
>> -
>> -/*
>> - * Copyright (C) 1993 Linus Torvalds
>> - *
>> - * Delay routines calling functions in arch/i386/lib/delay.c
>> - */
>> -
>> -extern void __udelay(unsigned long usecs);
>> -#define udelay(n) __udelay(n)
>> -
>> -#endif /* defined(_X86_DELAY_H) */
>> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
>> index 9150226271..8fd3b8f99f 100644
>> --- a/xen/include/xen/delay.h
>> +++ b/xen/include/xen/delay.h
>> @@ -3,7 +3,7 @@
>>  
>>  /* Copyright (C) 1993 Linus Torvalds */
>>  
>> -#include <asm/delay.h>
>> +void udelay(unsigned long usecs);
>>  
>>  static inline void mdelay(unsigned long msec)
>>  {
> 
> I forgot to update xen/arch/{x86,arm,ppc}/include/asm/Makefile:
>     generic-y += delay.h
> 
> Should I send a new patch version or it can be updated durig merge?

My take is that such a change wouldn't be appropriate to do by the
committer. But: Why would this be needed? You're not introducing
asm-generic/delay.h. Everything is moved to just xen/delay.h.

Jan

